"""
AUS Navigator Steps Module
"""

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

import logging
import time
import requests
from urllib.parse import urlparse, parse_qs, urljoin

from acceptance.common.utils.strings import fmt
from acceptance.common.aus.constants import AUS_BASE_URL
from acceptance.common.constants.constants import BRANDS_MAPPINGS

logger = logging.getLogger(__name__)


@step('user navigates to "{destination_page}" page using AUS authorize url')
def user_navigates_to_aus_login_page(context, destination_page):
    """
    step. Takes the app to the AUS login page by requesting the authorize url from AUS

    :param context: behave context
    :param destination_page: the page to navigate to
    """
    # login_type can be given by using -D login_type=THE_LOGIN_TYPE. Default is set to "pwd"
    context.login_type = "pwd"
    if "login_type" in context.config.userdata:
        context.login_type = context.config.userdata["login_type"]
    context.namespace = find_namespace(context.environment)

    url = urljoin(AUS_BASE_URL, "/v1/authorize_url")

    # call AUS to get the authorize url
    response = requests.get(
        url,
        timeout=10,
        params={
            "namespace": context.namespace,
            "login_type": context.login_type,
        },
    )
    logger.debug("request: %s - response: %s", url, response.text)

    # check if the response is OK
    assert response.status_code == 200, f"Response status code is {response.status_code}"
    # get the authorize url
    authorize_url = response.json()["url"]

    context.execute_steps(
        """Given I navigate to the "{0}" URL for "{1}" web page
           And the "{1}" page is displayed""".format(authorize_url, destination_page),
    )


@step("the oidc code is sent to AUS")
def the_oidc_code_is_sent_to_aus(context):
    """
    Step. Sends the oidc code to AUS

    :param context: behave context
    """
    # get the oidc code from the current url
    current_url = getattr(context.current_page.driver, "current_url")
    parsed_url = urlparse(current_url)
    query_params = parse_qs(parsed_url.query)
    assert "code" in query_params, f"OIDC code not found in the current URL. {__error_details(query_params)}"
    oidc_code = query_params["code"][0]
    assert oidc_code, "OIDC code not found in the current URL"

    # preference for login_checker_id and login_checker_password over aus_id parameters
    username = context.config.userdata.get("login_checker_id", context.user.user_login)
    password = context.config.userdata.get("login_checker_password", context.user.password)

    url = urljoin(AUS_BASE_URL, "/v1/data")

    # call AUS to send the oidc code and poll until completion
    call_and_poll(
        url,
        method="PATCH",
        timeout=10,
        headers={
            "Content-Type": "application/json; charset=utf-8",
        },
        body=[
            {
                "namespace": context.namespace,
                "users": [
                    {
                        "type": context.login_type,
                        "credentials": [
                            {
                                "username": username,
                                "password": password,
                                "oidc_code": oidc_code,
                            },
                        ],
                    },
                ],
            },
        ],
    )


def call_and_poll(url, method="GET", timeout=10, headers=None, body=None):
    """Calls endpoint and polls until completion or timeout.
    Returns the first polled result with a final status"""
    res = requests.request(url=url, method=method, headers=headers, json=body, timeout=timeout)
    logger.debug("request: %s with body %s - response: %s", url, body, res.text)
    assert res.status_code < 400, f"unexpected code {res.status_code} when calling {url}: {res.text}"

    b = res.json()
    assert "operation_id" in b, f"could not find operation id on response for call to {url}"
    op_id = b["operation_id"]
    poll_url = urljoin(url, f"/v1/operations/{op_id}")

    timeout = time.time() + 30  # 30 seconds from now
    while True:
        res = requests.get(poll_url, timeout=timeout)
        assert res.status_code < 400, f"unexpected code {res.status_code} when polling {poll_url}: {res.text}"
        logger.info("polling: %s - response: %s", poll_url, res.text)
        b = res.json()
        assert "status" in b, f"could not find status in response for poll to {poll_url}"
        assert b["status"] in {
            "pending",
            "failed",
            "success",
        }, f"unexpected status {b['status']} in response for poll to {poll_url}"

        if b["status"] == "success":
            return b

        assert time.time() < timeout, f"timeout polling on {poll_url}"
        time.sleep(1)


def find_namespace(environment):
    """Finds the namespace to use for login based on the value
    received in the sys arg called TestExecution_environment"""

    def _find_brand(brand):
        assert brand in BRANDS_MAPPINGS, f"Unknown brand {brand}"
        return BRANDS_MAPPINGS[brand]

    def _find_env(env, brand=None):
        """Finds the name of the env in a map of aliases. Brand specifics
        are considered before general ones"""
        aliases = {
            "live": "pro",
            "next": "pro",
            "blaude": {
                "cert2": "int",
            },
            "o2es": {
                "cert2": "pre",
            },
        }

        brand_entry = aliases.get(brand)
        if brand_entry:
            return brand_entry.get(env, env)
        return aliases.get(env, env)

    tokens = environment.split("-")
    if len(tokens) == 2:
        brand = _find_brand(tokens[0])
        env = _find_env(tokens[1], tokens[0])
        return f"{brand}-{env}"


def __error_details(query_string):
    """Returns the error details from a query string if present"""
    key = "error_description" if "error_description" in query_string else "error" if "error" in query_string else None
    if key:
        return f"Error details: {fmt('red', query_string[key][0])}"
    return ""

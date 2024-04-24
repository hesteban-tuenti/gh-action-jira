"""
App status assertions steps
"""
import operator

from distutils.version import StrictVersion

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps import skip_execution
from acceptance.common.constants.constants import APPSTATE


@step(u'the app version is "{condition}" than "{app_version}"')
def compare_app_version(context, condition, app_version):
    """
    Step. Checks the installed app version

    :param context: Behave Context.
    :param condition: possible values: lower, equal, higher, equal_or_higher, equal_or_lower
    :param app_version: app version to check
    """
    criteria = {
        "lower": operator.lt,
        "equal": operator.eq,
        "higher": operator.gt,
        "equal_or_higher": operator.ge,
        "equal_or_lower": operator.le,
    }

    criterias = '|'.join(criteria.keys())

    if condition not in criteria:
        raise ValueError("Condition value: {} not valid, should be: {}".format(condition, criterias))
    installed_app_version = context.driver_wrapper.config.get_optional('AppiumCapabilities', 'appVersion')
    if not criteria.get(condition)(StrictVersion(installed_app_version), StrictVersion(app_version)):
        skip_execution(context, reason="No matching criteria\n \
            Installed app version: {} - Scenario app version:{} - Criteria:{}"
                       .format(installed_app_version, app_version, condition))


@step(u'the app is in "{status}" status')
def app_is_status(context, status):
    """
    Step. Asserts the app status

    :param context: Behave Context.
    :param status: app status to check
    """
    apps_status = {}
    for attr, value in vars(APPSTATE).items():
        if not attr.startswith("__"):  # Ignore special methods
            apps_status[attr] = value
    if status.upper() not in apps_status:
        raise ValueError(f"Status value: {status} not valid, should be: {apps_status.keys()}")

    assert context.driver.query_app_state(context.device.app_id) == apps_status[status.upper()],\
        f"App status is not {status}"

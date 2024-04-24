"""
Deeplinks steps
"""
from time import sleep
import logging

from wrapt_timeout_decorator import timeout
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.app.common.webview_config.webview_config import WebviewConfigHelper
from acceptance.app.novum.pageobjects.base.launchapp.app_pin_code import BaseAppPinCode
from acceptance.app.common.pageobjects.base.native.deeplinks import BaseDeeplinks
from acceptance.app.novum.pageobjects.base.login.welcome import BaseWelcomeLogin
from acceptance.common.constants.constants import APPSTATE, BRANDS
from acceptance.features.e2e.app.steps.native.app_status import launch_app, terminate_app

logger = logging.getLogger(__name__)


@step('user opens the "{deeplink_name}" deeplink with the app in "{app_status}" status')
@step('opens the "{deeplink_name}" deeplink with the app in "{app_status}" status')
@timeout(120, use_signals=False)
def open_deeplink(context, deeplink_name, app_status="foreground", fill_pin_code=True):
    """
    step. Open a deeplink in the app.

    :param context: behave context.
    :param deeplink_name: deeplink name
    :param app_status: app status, possible values: killed or foreground
    """
    app_status_map = {
        "killed": APPSTATE.NOT_RUNNING,
        "foreground": APPSTATE.FOREGROUND,
    }
    if app_status not in app_status_map:
        raise ValueError("Possible app status values are: {}".format(app_status_map.keys()))

    app_status = app_status_map.get(app_status)

    context.current_page = BaseDeeplinks().wait_until_loaded()
    deeplink_url = context.deeplinks.get_deeplink_url(deeplink_name)
    logger.debug("Deeplink URL: %s", deeplink_url)
    # Override deeplinks values to avoid bug: IOS-7105
    deeplink_name_webview = {
        'Account.Consumption': ('consumption', 'consumption-details'),
        'Account.Mobile': ('dashboard', 'modular-screen'),
        'Account.Internet': ('internet', 'internet'),
        'Account.Televisión': ('tv', 'tv'),
        'Account.TV Management': ('tv_bundles_management', 'tv-bundles-management'),
    }
    if map_param('[CONF:brand]') == BRANDS.MOVES and deeplink_name in deeplink_name_webview:
        setattr(WebviewConfigHelper.get_helper(), deeplink_name_webview.get(deeplink_name)[0],
                deeplink_name_webview.get(deeplink_name)[1])

    if app_status == APPSTATE.NOT_RUNNING:
        if context.driver.query_app_state(context.device.app_id) != APPSTATE.NOT_RUNNING:
            terminate_app(context)
        context.current_page.open_deeplink(deeplink_url)
    elif app_status == APPSTATE.FOREGROUND:
        if context.driver.query_app_state(context.device.app_id) != APPSTATE.FOREGROUND:
            launch_app(context)
            context.current_page = BaseDeeplinks().wait_until_loaded()
        context.current_page.open_deeplink(deeplink_url)

    while context.driver_wrapper.driver.query_app_state(context.device.app_id) != APPSTATE.FOREGROUND:
        sleep(0.5)

    if fill_pin_code:
        BaseWelcomeLogin().wait_until_not_visible()
        sleep(2)
        BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)

    # We do not reset for developer settings because they are only used in the setup, and we do not want to add extra
    # delays there
    if deeplink_name != 'Native.Developer settings':
        context.reset_autonavigation = True


@step('opens the "{deeplink_name}" deeplink with the app in "{app_status}" status and pin code is not filled')
def open_deeplink_without_pin_code(context, deeplink_name, app_status="foreground"):
    """
    step. Open a deeplink in the app.

    :param context: behave context.
    :param deeplink_name: deeplink name
    :param app_status: app status, possible values: killed or foreground
    """
    open_deeplink(context, deeplink_name, app_status, False)

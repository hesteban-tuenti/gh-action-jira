"""
Auto Navigator Steps Module
"""
from toolium.utils.dataset import map_param

from acceptance.app.novum.pageobjects.base.launchapp.app_pin_code import BaseAppPinCode
from acceptance.app.novum.pageobjects.base.login.welcome import BaseWelcomeLogin
from acceptance.common.constants.constants import MANDATORY_PIN_CODE_BRANDS
from acceptance.features.e2e.app.steps import get_page_object
from acceptance.features.e2e.app.steps.native.app_status.actions import terminate_app


def autonavigation_fallback(context):
    """Fallback function that will be called when autonavigation fails
    :param context: behave context
    """
    terminate_app(context)
    context.driver_wrapper.driver.activate_app(context.device.app_id)
    BaseWelcomeLogin().wait_until_not_visible()
    if map_param('[CONF:brand]') in MANDATORY_PIN_CODE_BRANDS:
        BaseAppPinCode().wait_until_loaded()
        BaseAppPinCode().fill_pin_code(context.user.app_pin_code)
    else:
        BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)
    get_page_object(context, map_param('[CONF:landing_tab]')).wait_until_loaded()

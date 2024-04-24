"""
Login screen actions
"""

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.app.common.utils.stack import is_new_digit_hub_experience_enabled
from acceptance.app.novum.pageobjects.base.launchapp.app_pin_code import BaseAppPinCode
from acceptance.app.novum.login.login import Login
from acceptance.app.novum.pageobjects.base.launchapp.cookies_permissions import BaseCookiesPermissions
from acceptance.app.novum.pageobjects.base.launchapp.domain_permission_popup import BaseDomainPermissionPopup
from acceptance.app.novum.pageobjects.base.developersettings.developer_settings import BaseDeveloperSettings
from acceptance.app.novum.pageobjects.base.developersettings.new_digital_hub_experience.new_digital_hub_experience_options import (  # noqa: E501
    BaseNewDigitalHubExperienceOptions,
)
from acceptance.common.aus.code_factory import AusHelper
from acceptance.common.user_config.user_config import UserConfigurationAus
from acceptance.common.constants.constants import CONFIG, BRANDS
from acceptance.app.novum.login.code_factory import LoginHelper
from acceptance.app.novum.pageobjects.base.launchapp.splash_screen import BaseSplashScreen
from acceptance.features.e2e.app.steps.tools import user_navigates_to_page
from acceptance.features.e2e.app.steps.native.deeplinks import open_deeplink
from acceptance.features.e2e.app.steps.common.assertions.page import page_is_displayed

LOGIN_STEPS = [
    "user is logged out",
    "user is logged in",
    "logs in the application",
    "logs in the application with admin credentials",
    "logs in the application and accepts permissions",
    "logs in the application with sms",
    "logs in the application with sms and accepts permissions",
    "logs in the application with user and password",
    "logs in the application with user and password and accepts permissions",
    "logs in the application for first time and accepts permissions",
    "logs out from the application",
]


@step("user is logged out")
def is_logged_out(context):
    """
    Step. Check if user is logged out. If not, it starts the log out process

    :param context: behave context
    """
    if context.user.brand in {BRANDS.BLAUDE, BRANDS.O2DE} and BaseCookiesPermissions().is_in_cookies_permissions():
        BaseCookiesPermissions().accept()
    if not BaseSplashScreen().is_in_splash_screen():
        log_out(context)
    context.current_page = BaseSplashScreen()


@step("user is logged in")
def is_logged(context):
    """
    Step. Check if user is logged in. If not, it starts the log in process. If the login process happens accept post
    login permissions

    :param context: behave context
    """
    if BaseSplashScreen().is_in_splash_screen():
        # XXX(robertomier): temporary workaround for Novo App for VIVO to make login  # noqa: TD001,TD003
        # with new digital hub experience enabled in iOS, we have to force the enablement of the new digital
        # hub experience just before the login. Otherwise, the switch is disabled when app is relaunched
        if (
            map_param("[CONF:brand]") == BRANDS.VIVOBR
            and is_new_digit_hub_experience_enabled(context)
            and context.driver_wrapper.is_ios_test()
        ):
            open_deeplink(context, deeplink_name="Native.Developer settings")
            context.current_page = BaseDeveloperSettings().wait_until_loaded()
            context.current_page.open_section(section_name="new_digital_hub_experience")
            context.current_page = BaseNewDigitalHubExperienceOptions().wait_until_loaded()
            context.current_page.enable_new_experience()
            context.driver.back()
            context.driver.back()

        login_accept_permissions(context)
        page_is_displayed(context, map_param("[CONF:landing_tab]"))


@step("logs in the application")
def login(context):
    """
    Step. Starts the login process. It calls the correct step depending on the login_type

    :param context: behave context
    """
    LoginHelper().get_helper(context).login()


@step("logs in the application with admin credentials")
def login_admin_credentials(context):
    """
    Step. Starts the login process with admin credentials as a part of the user escalation flow.

    :param context: behave context
    """
    if context.user.snapshot_aus:
        aus_id = AusHelper.get_helper(context).get_id_document_value().lower()
    else:
        raise NotImplementedError("Login with admin credentials can be done just by aus")

    user = UserConfigurationAus(context=context, aus_id=aus_id).get_user()
    LoginHelper().get_helper(context, login_type=user.login_type).escalation_login(user)


@step("logs in the application and accepts permissions")
def login_accept_permissions(context):
    """
    Step. Starts the login process and accepts post login permissions. It calls the correct step depending on the
    login_type

    :param context: behave context
    """
    LoginHelper().get_helper(context).login()
    Login.accept_post_login_permissions(context)


@step("logs in the application with sms")
def login_with_sms(context):
    """
    Step. Logs the user in using sms.

    :param context: behave context
    """
    LoginHelper().get_helper(context, login_type=CONFIG.LOGIN_TYPE_SMS).login()


@step("logs in the application with sms and accepts permissions")
def login_with_sms_accept_permissions(context):
    """
    Step. Logs the user in using sms and accept post login permissions.

    :param context: behave context
    """
    LoginHelper().get_helper(context, login_type=CONFIG.LOGIN_TYPE_SMS).login()
    Login.accept_post_login_permissions(context)


@step("logs in the application with user and password")
def login_with_user_and_pwd(context):
    """
    Step. Logs the user in using user and password.

    :param context: behave context
    """
    LoginHelper().get_helper(context, login_type=CONFIG.LOGIN_TYPE_USER_PWD).login()


@step("logs in the application with user and password and accepts permissions")
def login_with_user_and_pwd_accept_permissions(context):
    """
    Step. Logs the user in using user and password. And accept post login permissions

    :param context: behave context
    """
    LoginHelper().get_helper(context, login_type=CONFIG.LOGIN_TYPE_USER_PWD).login()
    Login.accept_post_login_permissions(context)


@step("logs in the application for first time")
def login_first_time(context):
    """
    Step. Starts the login process without checking the landing tab at ending.
    It calls the correct step depending on the login_type.
    After the login is done as it is the first login it will dissmiss the pin code in order to complete the login.

    :param context: behave context
    """
    context.execute_steps("""Given logs in the application""")
    BaseAppPinCode().wait_until_loaded()
    BaseAppPinCode().dissmiss_fill_pin_code_when_possible(context.user.app_pin_code)


@step("logs out from the application")
def log_out(context):
    """
    Step. Logs the user out.

    :param context: behave context
    """
    user_navigates_to_page(context, "SplashScreen")


@step("initiate the app")
def initiate_app(context):
    """
    Step. Initiate the app and accept app center and initial permissions

    :param context: behave context
    """
    LoginHelper().get_helper(context).initialize()


@step("accepts post login permissions")
def accept_post_login_permissions(context):
    """
    Step. Accept permissions after login if these are shown

    :param context: behave context
    """
    Login.accept_post_login_permissions(context)


@step("user logs in to see the consents page")
def logs_in_consents_page(context):
    """
    Step. Logs in the user and waits for the consents gathering screen to be displayed

    :param context: behave context
    """
    LoginHelper().get_helper(context).login()
    page_is_displayed(context, "ConsentsGathering")


@step('accepts "Domain Permission Popup" popup if displayed')
def accepts_popup(context):
    """
    Step. Accepts the Domain Permission Popup if displayed

    :param context: behave context
    """
    if context.driver_wrapper.is_ios_test() and context.current_page.domain_permission_accept.is_visible():
        BaseDomainPermissionPopup().confirm()

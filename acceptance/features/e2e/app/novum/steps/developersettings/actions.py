"""
Developer settings actions
"""

from time import sleep

import logging

from wrapt_timeout_decorator import timeout
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param
from acceptance.common.constants.constants import BRANDS

from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.app.common.utils.stack import is_new_digit_hub_experience_enabled
from acceptance.app.novum.login.code_factory import CheckUserHelper
from acceptance.app.novum.pageobjects.base.developersettings.app_rating.app_rating_options import BaseAppRatingOptions
from acceptance.app.novum.pageobjects.base.developersettings.authentication.authentication import BaseAuthentication
from acceptance.app.novum.pageobjects.base.developersettings.environmentconfiguration.environment_configuration import (
    BaseEnvironmentConfiguration,
)
from acceptance.app.novum.pageobjects.base.developersettings.in_app_messages.in_app_messages_options import (
    BaseInAppMessagesOptions,
)
from acceptance.app.novum.pageobjects.base.developersettings.inbox_options.inbox_options import BaseInboxOptions
from acceptance.app.novum.pageobjects.base.developersettings.webviews.webviews_options import BaseWebviewsOptions
from acceptance.app.novum.pageobjects.base.developersettings.new_digital_hub_experience.new_digital_hub_experience_options import (  # noqa: E501
    BaseNewDigitalHubExperienceOptions,
)
from acceptance.app.novum.pageobjects.base.developersettings.pin_fingerprint.pin_fingerprint_options import (
    BasePinFingerprintOptions,
)
from acceptance.common.aus.code_factory import AusHelper
from acceptance.common.constants.constants import APPSTATE
from acceptance.common.numbering.normalization import transform_number, PhoneNumberFormats
from acceptance.app.novum.pageobjects.base.developersettings.developer_settings import BaseDeveloperSettings
from acceptance.app.novum.pageobjects.base.developersettings.settings.settings_options import BaseSettingsOptions
from acceptance.app.novum.pageobjects.base.launchapp.app_pin_code import BaseAppPinCode
from acceptance.app.novum.pageobjects.base.launchapp.splash_screen import BaseSplashScreen
from acceptance.app.novum.pageobjects.base.profile.profile import BaseProfile
from acceptance.app.novum.pageobjects.base.profile.profile_selector import BaseProfileSelector
from acceptance.common.steps import skip_execution
from acceptance.features.e2e.app.steps import launch_app, terminate_app
from acceptance.features.e2e.app.steps.native.deeplinks import open_deeplink
from acceptance.features.e2e.app.steps.common.assertions.page import get_page_object, page_is_displayed


logger = logging.getLogger(__name__)


@step("set environment, disable app rating and in-app messages")
@timeout(150, use_signals=False)
def set_environment_disable_app_rating_and_in_app_messages_from_config(context):  # noqa: PLR0915
    """
    Change app environment and set virtual environment in developer settings according to user config also disables
    the app rating and in-app messages, so it doesn't interferes with the execution in case it has to be shown.

    :param context: behave context.
    """
    if not context.device.app_store:
        previous_page = context.current_page
        open_deeplink(context, deeplink_name="Native.Developer settings")
        context.current_page = BaseDeveloperSettings().wait_until_loaded()

        context.current_page.open_section(section_name="app_rating")

        context.current_page = BaseAppRatingOptions().wait_until_loaded()
        context.current_page.disable_app_rating()
        context.driver.back()
        context.current_page = BaseDeveloperSettings().wait_until_loaded()

        context.current_page.open_section(section_name="in_app_messages")
        context.current_page = BaseInAppMessagesOptions().wait_until_loaded()
        context.current_page.disable_in_app_messages()
        context.driver.back()
        context.current_page = BaseDeveloperSettings().wait_until_loaded()

        # Only when in VIVO, address the new digital hub experience options
        if map_param("[CONF:brand]") == BRANDS.VIVOBR:
            context.current_page.open_section(section_name="new_digital_hub_experience")
            context.current_page = BaseNewDigitalHubExperienceOptions().wait_until_loaded()
            if is_new_digit_hub_experience_enabled(context):
                context.current_page.enable_new_experience()
            else:
                context.current_page.disable_new_experience()
            context.driver.back()
            context.current_page = BaseDeveloperSettings().wait_until_loaded()

        context.current_page.open_section(section_name="environment_configuration")
        context.current_page = BaseEnvironmentConfiguration().wait_until_loaded()
        context.current_page.reset_environment()
        if context.user.domain not in context.current_page.selected_environment.text.lower():
            context.current_page.select_environment(context.user.domain)
            previous_page = None
            sleep(1)
        if context.config.userdata.get("virtual_env"):
            context.current_page.set_virtual_env.click()
            context.current_page.virtual_env_edit_text.text = context.config.userdata.get("virtual_env")
            context.current_page.virtual_env_confirm.click()
            sleep(1)

        terminate_app(context)
        launch_app(context)
        while context.driver_wrapper.driver.query_app_state(context.device.app_id) != APPSTATE.FOREGROUND:
            sleep(0.5)

        if previous_page:
            if not isinstance(previous_page, BaseSplashScreen):
                BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)
                context.current_page = get_page_object(context, map_param("[CONF:landing_tab]"))
            else:
                context.current_page = previous_page
        else:
            if not BaseSplashScreen().is_in_splash_screen():
                BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)
                context.current_page = get_page_object(context, map_param("[CONF:landing_tab]"))
            else:
                context.current_page = BaseSplashScreen()


@timeout(600, use_signals=False)  # note that in the worst case, we have to unlog 10 lines
def __remove_undesired_multi_login(context):
    # TODO(angel-ram): Remove when apicalls be deprecated
    # https://jira.tid.es/browse/NOV-237379
    # removes users not matching the user in conf, when multilogin is enabled
    # app must be in profile screen
    # select first one
    minimum_profile_list_entries = 1  # minimum is not 0 because of the "add user" entry
    context.current_page.user_selector.web_element.click()
    context.current_page = BaseProfileSelector()
    context.current_page.profile_list_entries[0].click()
    configured_user_is_logged = False
    logger.debug("Logging out undesired users")
    while True:
        # update the number of lines
        context.current_page = BaseProfile().wait_until_loaded(timeout=15)
        context.current_page.user_selector.web_element.click()
        context.current_page = BaseProfileSelector()
        profile_selector_entries_number = len(context.current_page.profile_list_entries)
        logger.debug("%s users are logged in", profile_selector_entries_number)
        if configured_user_is_logged:
            # configured user is on top of the list, we want to skip it
            context.current_page.profile_list_entries[1].click()
            context.current_page = BaseProfile().wait_until_loaded()
            # logout
            context.current_page = context.current_page.log_out_button.navigate()
            context.current_page = context.current_page.popup.accept.navigate()
            profile_selector_entries_number = profile_selector_entries_number - 1
        else:
            # select first on list
            context.current_page.profile_list_entries[0].click()
            context.current_page = BaseProfile().wait_until_loaded(timeout=15)
            # resetting api calls context since we changed the user
            # check if the current user is the one in config
            msisdns = AusHelper.get_helper(context).get_phone_number_subscriptions()
            if (
                context.user.number is not None
                and transform_number(
                    context.user.brand, context.user.number, PhoneNumberFormats.NATIONAL, PhoneNumberFormats.MSISDN,
                )
                in msisdns
            ):
                configured_user_is_logged = True
                logger.debug("User in config already logged in. Skipping log out procedure")
            else:
                # it was not the good one, logout
                context.current_page = context.current_page.log_out_button.navigate()
                context.current_page = context.current_page.popup.accept.navigate()
                profile_selector_entries_number = profile_selector_entries_number - 1
        if configured_user_is_logged and profile_selector_entries_number == minimum_profile_list_entries + 1:
            # return to landing tab
            context.current_page = BaseProfile()
            if map_param("[CONF:brand]") == BRANDS.VIVOBR and is_new_digit_hub_experience_enabled(context):
                context.current_page.navigation_top_bar.back()
                context.current_page.navigation_top_bar.back()
            else:
                context.current_page.navigation_top_bar.close()
            page_is_displayed(context, map_param("[CONF:landing_tab]"))
            break
        if profile_selector_entries_number == minimum_profile_list_entries:
            break


def __remove_undesired_single_login(context):
    # TODO(angel-ram): Remove when apicalls be deprecated
    # https://jira.tid.es/browse/NOV-237379
    # removes users not matching the user in conf, when multilogin is not enabled
    # app must be in profile screen
    msisdns = context.context_response.get_msisdns()
    if (
        context.user.number is None
        or transform_number(
            context.user.brand, context.user.number, PhoneNumberFormats.NATIONAL, PhoneNumberFormats.MSISDN,
        )
        not in msisdns
    ):
        # logout
        logger.debug("Logging out undesired user")
        context.current_page = context.current_page.log_out_button.navigate()
        context.current_page = context.current_page.popup.accept.navigate()
        page_is_displayed(context, "SplashScreen")
        # reset api calls context since we changed the user
    else:
        logger.debug("User in config already logged in. Skipping log out procedure")
        # return to landing tab
        # context.current_page = BaseProfile()
        context.current_page.navigation_top_bar.close()
        page_is_displayed(context, map_param("[CONF:landing_tab]"))


def __remove_undesired_user(context):
    if CheckUserHelper().get_helper(context).is_user_config_logged():
        logger.debug("User in config already logged in. Skipping log out procedure")
        context.execute_steps("""When user is in the "[CONF:landing_tab]" page""")
    else:
        logger.debug("Logging out undesired user")
        if context.user.brand == BRANDS.MOVES:
            BaseScreen().scroll_into_view(context.current_page.log_out_button)
        else:
            BaseScreen().native_scroll_down()  # Fix for devices with small screens
        context.current_page = context.current_page.log_out_button.navigate()
        context.current_page = context.current_page.popup.accept.navigate()
        # Multilogin
        if not BaseSplashScreen().is_in_splash_screen():
            context.current_page = BaseProfile()
            __remove_undesired_user(context)
            context.current_page.navigation_top_bar.close()
            page_is_displayed(context, map_param("[CONF:landing_tab]"))


@step("undesired users are not logged in")
def logout_undesired_users(context):
    """
    Logs out any logged in user that does not match the number selected in the configuration.

    :param context: behave context.
    """
    # if not logged -> end
    logger.debug("Logout undesired users")
    if BaseSplashScreen().is_in_splash_screen():
        logger.debug("No user is logged in")
        return

    if context.user.snapshot or context.user.snapshot_aus:
        if map_param("[CONF:brand]") == BRANDS.VIVOBR and is_new_digit_hub_experience_enabled(context):
            profile_page = "VivobrProfileNovoApp"
        elif map_param("[CONF:brand]") == BRANDS.MOVES:
            profile_page = "MovesProfile"
        else:
            profile_page = "Profile"
        open_deeplink(context, deeplink_name="Native.Settings")
        context.execute_steps(f"""When the "{profile_page}" page is displayed""")
        __remove_undesired_user(context)
    # TODO(angel-ram): Remove when apicalls be deprecated.
    # https://jira.tid.es/browse/NOV-237379
    else:
        if context.device.app_store:
            context.execute_steps("""When user is in the "Splash Screen" page""")
            return
        logger.debug("Reviewing logged in users")
        # get logged in users
        open_deeplink(context, deeplink_name="Native.Settings")
        context.execute_steps("""When the "Profile" page is displayed""")
        if context.current_page.user_selector.is_present():
            __remove_undesired_multi_login(context)
        else:
            __remove_undesired_single_login(context)


@step("session id is invalidated")
def invalidate_session_id(context):
    """
    Invalidate session id from Developer settings

    :param context: behave context.
    """
    previous_page = context.current_page
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    context.current_page.open_section(section_name="authentication")
    context.current_page = BaseAuthentication().wait_until_loaded()
    context.current_page.invalidate_token_button.click()
    sleep(1)
    terminate_app(context)
    launch_app(context)
    if not isinstance(previous_page, BaseSplashScreen):
        BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)
        context.current_page = get_page_object(context, map_param("[CONF:landing_tab]"))
    else:
        context.current_page = previous_page


@step("user clears the webview cache")
def clear_explore_cache(context):
    """
    step. Opens the developer settings and clears the webview cache

    :param context: behave context
    """
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    context.current_page.open_section(section_name="webviews")
    context.current_page = BaseWebviewsOptions().wait_until_loaded()
    context.current_page.clean_cache()


@step("user has new Explore content")
def get_new_explore_content(context):
    """
    step. Opens the developer settings, clears the webview cache and kills and restarts the app.

    :param context: behave context
    """
    if context.driver_wrapper.is_mobile_test():
        previous_page = context.current_page
        context.execute_steps("Given user clears the webview cache")
        terminate_app(context)
        launch_app(context)
        sleep(5)
        if not isinstance(previous_page, BaseSplashScreen):
            BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)
            context.current_page = get_page_object(context, map_param("[CONF:landing_tab]"))
        else:
            context.current_page = previous_page


@step('app rating is "{status}"')
def app_rating_status(context, status):
    """
    Ensure the app rating is in the desired status by enabling or disabling the tweak in the Dev Settings

    :param context: behave context
    :param status: desired status for app-rating enabled/disabled
    """
    if status not in {"enabled", "disabled"}:
        raise ValueError(f"The status -'{status}'- is not allowed. Use: enabled/disabled")

    previous_page = context.current_page
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    context.current_page.open_section(section_name="app_rating")
    context.current_page = BaseAppRatingOptions().wait_until_loaded()
    if status == "enabled":
        context.current_page.enable_app_rating()
    else:
        context.current_page.disable_app_rating()
    context.driver.back()
    context.driver.back()
    context.current_page = previous_page


@step("the App Rating popup is displayed")
def display_app_rating(context):
    """
    Display app rating popup using Dev Settings, for this app rating should be enabled

    :param context: behave context
    """
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    context.current_page.open_section(section_name="app_rating")
    context.current_page = BaseAppRatingOptions().wait_until_loaded()
    if context.current_page.is_app_rating_status_enabled():
        if context.driver_wrapper.is_ios_test():
            context.current_page.enable_display_app_rating()
        context.current_page.show_app_rating.click()
        context.driver.back()
        context.driver.back()
        page_is_displayed(context, "Popup Rate Stars")
    else:
        context.scenario.skip(reason="App rating popup can not be shown, so app rating is disabled")


@step('set unlock time to "{time}" seconds')
def set_unlock_time(context, time):
    """
    Set the unlock time of the app

    :param context: behave context
    :param time: time in seconds, possible values: 300, 60, 10, 0
    """
    valid_time_values = {"300", "60", "10", "0"}
    if time not in valid_time_values:
        skip_execution(context, reason="Wrong value for time possible values: {}".format(valid_time_values))
        return
    previous_page = context.current_page
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    context.current_page.open_section(section_name="pin_fingerprint")
    context.current_page = BasePinFingerprintOptions()
    context.current_page.set_unlocked_time(time)
    context.driver.back()
    context.driver.back()
    context.current_page = previous_page


@step("reset the inbox")
def reset_inbox(context):
    """
    Reset the inbox to sync the notifications with the server status.
    :param context: behave context
    """
    previous_page = context.current_page
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    if context.driver_wrapper.is_ios_test():
        context.current_page.open_section(section_name="settings")
        context.current_page = BaseSettingsOptions().wait_until_loaded()
    else:
        context.current_page.open_section(section_name="inbox")
        context.current_page = BaseInboxOptions().wait_until_loaded()
    context.current_page.reset_inbox()
    sleep(1)
    terminate_app(context)
    launch_app(context)
    if not isinstance(previous_page, BaseSplashScreen):
        BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)
        context.current_page = get_page_object(context, map_param("[CONF:landing_tab]"))
    else:
        context.current_page = previous_page


@step('in-app messages is "{status}"')
def in_app_messages_status(context, status):
    """
    Ensure the in-app is in the desired status by enabling or disabling the tweak in the Dev Settings

    :param context: behave context
    :param status: desired status for app-rating enabled/disabled
    """
    if status not in {"enabled", "disabled"}:
        raise ValueError(f"The status -'{status}'- is not allowed. Use: enabled/disabled")

    previous_page = context.current_page
    open_deeplink(context, deeplink_name="Native.Developer settings")
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    context.current_page.open_section(section_name="in_app_messages")
    context.current_page = BaseInAppMessagesOptions().wait_until_loaded()
    if status == "enabled":
        context.current_page.enable_in_app_messages()
    else:
        context.current_page.disable_in_app_messages()
    context.driver.back()
    context.driver.back()
    context.current_page = previous_page

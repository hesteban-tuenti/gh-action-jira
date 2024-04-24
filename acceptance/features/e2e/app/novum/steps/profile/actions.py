"""
Profile actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.app.novum.pageobjects.base.developersettings.developer_settings import BaseDeveloperSettings
from acceptance.app.novum.pageobjects.base.developersettings.settings.settings_options import BaseSettingsOptions
from acceptance.features.e2e.app.steps.native.deeplinks import open_deeplink


@step('there is a general server error in the Profile page')
def error_in_profile(context):
    """
    Simulate en error in Profile, enabling the switch Force GetUserError within the Settings option in Dev Settings
    :param context: behave context
    """
    previous_page = context.current_page
    open_deeplink(context, deeplink_name='Native.Developer settings')
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    display_element_on_screen(context.current_page.settings_link)
    context.current_page.settings_link.click()
    context.current_page = BaseSettingsOptions()
    context.current_page.enable_force_error()
    context.driver.back()
    context.driver.back()
    context.current_page = previous_page


@step('the general server error in the Profile page is solved')
def error_in_profile_solved(context):
    """
    Simulate the error in Profile is solved, disabling the switch Force GetUserError within
    the Settings option in Dev Settings
    :param context: behave context
    """
    previous_page = context.current_page
    open_deeplink(context, deeplink_name='Native.Developer settings')
    context.current_page = BaseDeveloperSettings().wait_until_loaded()
    display_element_on_screen(context.current_page.settings_link)
    context.current_page.settings_link.click()
    context.current_page = BaseSettingsOptions()
    context.current_page.disable_force_error()
    context.driver.back()
    context.driver.back()
    context.current_page = previous_page

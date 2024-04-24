"""
Element native actions steps
"""
from appium.webdriver.common.touch_action import TouchAction
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.constants.constants import BUNDLES, APPSTATE, IOS_DEVICES_WITH_NOTCH


@step('clicks on the native "{button}" button')
def click_on_native_button(context, button):
    """
    step. Performs specific native button

    :param context: behave context
    :param button: native button to click
    """
    valid_buttons = ['back']
    if button not in valid_buttons:
        raise Exception("The button {} isn't implemented".format(button))

    if button == 'back':
        if context.driver_wrapper.is_ios_test():
            # For iOS clicks on native back button that appears in the top bar
            if context.driver.query_app_state(BUNDLES.SAFARI) == APPSTATE.FOREGROUND:
                device_udid = context.driver.desired_capabilities['udid']
                if device_udid in IOS_DEVICES_WITH_NOTCH:
                    TouchAction(context.driver).tap(None, 45, 37).perform()
                else:
                    TouchAction(context.driver).tap(None, 5, 5).perform()
            elif context.driver.query_app_state(BUNDLES.APPLE_STORE) == APPSTATE.FOREGROUND:
                context.current_page.navigation_top_bar.back_app.click()
            else:
                context.current_page.navigation_top_bar.back_button.click()
        else:
            context.driver.back()

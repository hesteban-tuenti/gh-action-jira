"""
Device native actions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step("hides the keyboard")
def hide_keyboard(context):
    """
    Step. Hide keyboard.

    :param context: behave context
    """
    context.driver_wrapper.driver.hide_keyboard()


@step("set location permissions to allow always on ios devices")
def set_location_permission_to_always(context):
    """
    Step. Set location permission to allow always on iOS devices.

    :param context: behave context
    """
    if context.driver_wrapper.is_ios_test():
        context.device_config.set_location_permissions_to_always()

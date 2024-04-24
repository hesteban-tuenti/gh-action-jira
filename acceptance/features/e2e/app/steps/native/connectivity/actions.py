"""
Connectivity steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step(u'user turns on the Airplane mode')
@step(u'turns on the Airplane mode')
def activate_airplane_mode(context):
    """
    Step. Turns on airplane mode, and save in device config the airplane mode state

    :param context: Behave Context.
    """
    previous_page = context.current_page
    context.execute_steps(u"""Given I turn on the Airplane mode""")
    context.device.airplane_mode = True
    context.driver.activate_app(context.device.app_id)
    context.current_page = previous_page


@step(u'user turns off the Airplane mode')
@step(u'turns off the Airplane mode')
def deactivate_airplane_mode(context):
    """
    Step. Turns off airplane mode, and save in device config the airplane mode state

    :param context: Behave Context.
    """
    previous_page = context.current_page
    context.execute_steps(u"""Given I turn off the Airplane mode""")
    context.device.airplane_mode = False
    context.driver.activate_app(context.device.app_id)
    context.execute_steps(u"""Given the device is connected to a "wifi" network""")
    context.current_page = previous_page


@step(u'user turns off the mobile data')
@step(u'user turns on the Wi-Fi')
@step(u'turns off the mobile data')
@step(u'turns on the Wi-Fi')
def turn_on_wifi(context):
    """
    Step. Turns on wifi and turns off mobile data.

    :param context: Behave Context.
    """
    context.execute_steps(u"""Given I turn on the Wi-Fi""")


@step(u'user turns on the mobile data')
@step(u'user turns off the Wi-Fi')
@step(u'turns on the mobile data')
@step(u'turns off the Wi-Fi')
def turn_off_wifi(context):
    """
    Step. Turns on mobile data and turns off wifi.

    :param context: Behave Context.
    """
    context.execute_steps(u"""Given I turn off the Wi-Fi""")

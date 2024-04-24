"""
Calls steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step('calls to the "{number}" number')
def call_number(context, number):
    """
    step. Makes a phone call to a number.

    :param context: behave context.
    :param number: number to call
    """

    if context.driver_wrapper.is_android_test():
        context.driver.execute_script("mobile: shell", {
            'command': 'am',
            'args': ['start', '-a android.intent.action.CALL', "-d tel:{}".format(number)],
            'includeStderr': True,
            'timeout': 5000,
        })
    else:
        raise NotImplementedError("Phone calls not implemented in iOS yet")

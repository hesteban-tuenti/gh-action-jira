"""
Calls assertions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.common.pageobjects.base.others.dialer import BaseDialer


@step('the "{number}" phone number is inserted on the dialer')
def call_number(context, number):
    """
    step. Check the number in the dialer

    :param context: behave context.
    :param number: expected number
    """
    if context.driver_wrapper.is_android_test():
        assert BaseDialer().dialed_number.text == number, f"Incorrect number in dialer. Expected -'{number}'- and" \
                                                           f"shown -'{BaseDialer().dialed_number.text}'-"
    else:
        raise NotImplementedError("Phone calls not implemented in iOS yet")

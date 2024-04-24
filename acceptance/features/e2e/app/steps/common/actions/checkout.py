"""
Checkout actions steps
"""

import contextlib
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page


@step('accepts the transaction')
def accepts_transaction(context):
    """
    step. Accept the checkout transaction. Check if page to insert otp is shown and fill it
    :param context: behave context
    """
    otp_input = get_element_from_page(context, "otp_input")
    with contextlib.suppress(AssertionError):
        assert otp_input.wait_until_visible(15)
        otp_input.text = "1234\n"

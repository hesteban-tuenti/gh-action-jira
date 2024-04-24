"""
Warning assertions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.features.e2e.app.steps.common.assertions.page import page_is_displayed, get_page_object


@step('the "{warning_name}" warning is displayed')
def warning_is_displayed(context, warning_name):
    """
    step. Assert that the warning passed as parameter is loaded. Currently only implemented for Android

    :param context: behave context
    :param warning_name: name of the warning
    """
    page_is_displayed(context, warning_name)


@step('the "{warning_name}" warning is not displayed')
def warning_is_not_displayed(context, warning_name):
    """
    step. Assert that the warning passed as parameter is not displayed. Currently only implemented for Android

    :param context: behave context
    :param warning_name: name of warning to check
    """
    assert not get_page_object(context, warning_name).warning.is_visible(), f"'{warning_name}' is displayed"

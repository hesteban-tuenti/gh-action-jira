"""
Warning actions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.features.e2e.app.steps.common.assertions.page import get_page_object


@step('waits until the "{warning_name}" warning is not displayed')
def waits_warning_is_not_displayed(context, warning_name):
    """
    step. Waits until the warning passed as parameter is not displayed.
    The warning should be defined as a page object, currently used for No Connectivity Warning page object

    :param context: behave context
    :param warning_name: name of the page object warning to check
    """
    get_page_object(context, warning_name).warning.wait_until_not_visible()


@step('waits until the "{warning_name}" warning is displayed')
def waits_warning_is_displayed(context, warning_name):
    """
    step. Waits until that the warning passed as parameter is displayed.
    The warning should be defined as a page object, currently used for No Connectivity Warning page object

    :param context: behave context
    :param warning_name: name of the page object to check
    """
    get_page_object(context, warning_name).warning.wait_until_loaded()

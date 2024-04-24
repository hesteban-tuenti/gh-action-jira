"""
Popup assertions steps
"""
from behave import step as behave_step  # noqa: F401
from selenium.common.exceptions import NoSuchElementException, StaleElementReferenceException
from toolium_telefonica.behave import step

from acceptance.features.e2e.app.steps.common.assertions.page import page_is_displayed, get_page_object


@step('the "{popup_name}" sheet is displayed')
@step('the "{popup_name}" popup is displayed')
def popup_is_displayed(context, popup_name):
    """
    step. Assert that the popup passed as parameter is loaded

    :param context: behave context
    :param popup_name: name of the popup
    """
    page_is_displayed(context, popup_name)


@step('the "{popup_name}" sheet is not displayed')
@step('the "{popup_name}" popup is not displayed')
def popup_is_not_displayed(context, popup_name):
    """
    step. Assert that the popup passed as parameter is not displayed

    :param context: behave context
    :param popup_name: name of popup to check
    """
    try:
        assert not get_page_object(context, popup_name).popup.alert.is_visible(), f"'{popup_name}' is displayed"
    except (NoSuchElementException, StaleElementReferenceException):
        return


@step('the popup with "{expected_title}" title and "{expected_message}" message is displayed')
def popup_has_the_title_and_message(context, expected_title, expected_message):
    """
    step. Assert that the popup contains the title and message texts passed as parameters

    :param context: behave context
    :param expected_title: expected title for popup title
    :param expected_message: expected text for popup message
    """
    assert context.current_page.popup.title.text == expected_title, \
        f"'{context.current_page.popup.title.text}' in popup title is not equal to {expected_title}"
    assert context.current_page.popup.message.text == expected_message, \
        f"'{context.current_page.popup.message.text}' in popup message is not equal to {expected_message}"

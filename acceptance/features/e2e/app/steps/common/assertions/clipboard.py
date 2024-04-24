"""
Clipboard assertions steps
"""

from behave import step as behave_step  # noqa: F401
from selenium.common.exceptions import WebDriverException
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen


@step('the clipboard has the "{element_name}" text')
def check_clipboard_element(context, element_name):
    """
    step. Compare clipboard text with a desired element text

    :param context: behave context
    :param element_name: element name to compare the text
    """
    clipboard_text = context.driver_wrapper.driver.get_clipboard_text()
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    try:
        assert element.text.rstrip() == clipboard_text, \
            f"Clipboard text: '{element.text}' is not equal to expected: '{clipboard_text}'"
    except WebDriverException:
        assert element.web_element.text == clipboard_text, \
            f"Clipboard text: '{element.web_element.text}' is not equal to expected: '{clipboard_text}'"

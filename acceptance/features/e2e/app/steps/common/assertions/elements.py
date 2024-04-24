"""
Element assertions steps
"""
import re

from behave import step as behave_step  # noqa: F401

from appium.webdriver.common.appiumby import AppiumBy
from selenium.common.exceptions import InvalidElementStateException, NoSuchElementException, TimeoutException, \
    WebDriverException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.expected_conditions import text_to_be_present_in_element
from selenium.webdriver.support.wait import WebDriverWait
from toolium.pageelements import Text, PageElements, PageElement
from toolium.utils.dataset import map_param
from toolium_telefonica.behave import step

from acceptance.app.common.actions.base.element import BaseElement
from acceptance.app.common.actions.base.rating_bar import BaseRatingBar
from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.app.common.actions.base.switch import BaseSwitch
from acceptance.common.aus.code_factory import AusHelper
from acceptance.common.constants.constants import COLORS_MAPPING
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.utils.utils import rgba_to_hex, check_color_in_list
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
import contextlib


@step('the "{element_name}" border is displayed')
@step('the "{element_name}" button is displayed')
@step('the "{element_name}" icon is displayed')
@step('the "{element_name}" link is displayed')
@step('the "{element_name}" entrypoint is displayed')
@step('the "{element_name}" switch is displayed')
@step('the "{element_name}" inputtext is displayed')
@step('the "{element_name}" textfield is displayed')
@step('the "{element_name}" drop-down is displayed')
@step('the "{element_name}" tab is displayed')
@step('the "{element_name}" progress bar is displayed')
@step('the "{element_name}" module is displayed')
@step('the "{element_name}" card is displayed')
@step('the "{element_name}" element is on display')
@step('the "{element_name}" image is displayed')
@step('the "{element_name}" allowance roundel is displayed')
@step('the "{element_name}" progression bar is displayed')
@step('the "{element_name}" checkbox is displayed')
@step('the "{element_name}" tooltip is displayed')
@step('the "{element_name}" tag is displayed')
@step('the "{element_name}" snackbar is displayed')
def element_is_displayed(context, element_name):
    """
    step. Assert that the element passed as parameter exists and visible

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    try:
        assert element.is_visible()
    except AssertionError:
        # some elements will be present but don't have the visible attribute set to true
        assert element.is_present(), f"'{element_name}' is not displayed and not present"


@step('the "{element_name}" map is displayed')
def map_is_displayed(context, element_name):
    """
    step. Assert that the map passed as parameter exists and visible

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    # The map frequently take some time to load, so we wait until is present
    context.driver_wrapper.utils.wait_until_element_present(element, 15)
    display_element_on_screen(element)
    try:
        assert element.is_visible()
    except AssertionError:
        # some elements will be present but don't have the visible attribute set to true
        assert element.is_present(), f"'{element_name}' is not displayed and not present"


@step('the "{element_name}" border is not displayed')
@step('the "{element_name}" button is not displayed')
@step('the "{element_name}" icon is not displayed')
@step('the "{element_name}" link is not displayed')
@step('the "{element_name}" entrypoint is not displayed')
@step('the "{element_name}" textfield is not displayed')
@step('the "{element_name}" switch is not displayed')
@step('the "{element_name}" dropdown is not displayed')
@step('the "{element_name}" tab is not displayed')
@step('the "{element_name}" module is not displayed')
@step('the "{element_name}" card is not displayed')
@step('the "{element_name}" graph is not displayed')
@step('the "{element_name}" image is not displayed')
@step('the "{element_name}" element is not on display')
@step('the "{element_name}" allowance roundel is not displayed')
@step('the "{element_name}" checkbox is not displayed')
@step('the "{element_name}" tooltip is not displayed')
@step('the "{element_name}" tag is not displayed')
@step('the "{element_name}" snackbar is not displayed')
def element_is_not_displayed(context, element_name):
    """
    step. Assert that the element passed as parameter is not displayed

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    with contextlib.suppress(NoSuchElementException, InvalidElementStateException):
        display_element_on_screen(element)

    assert not element.is_visible(), f"'{element_name}' is displayed"


@step('the "{element_name}" button is not visible in the actual screen')
@step('the "{element_name}" icon is not visible in the actual screen')
@step('the "{element_name}" link is not visible in the actual screen')
@step('the "{element_name}" entrypoint is not visible in the actual screen')
@step('the "{element_name}" textfield is not visible in the actual screen')
@step('the "{element_name}" switch is not visible in the actual screen')
@step('the "{element_name}" dropdown is not visible in the actual screen')
@step('the "{element_name}" tab is not visible in the actual screen')
@step('the "{element_name}" module is not visible in the actual screen')
@step('the "{element_name}" carousel is not visible in the actual screen')
@step('the "{element_name}" graph is not visible in the actual screen')
@step('the "{element_name}" image is not visible in the actual screen')
@step('the "{element_name}" element is not visible in the actual screen')
@step('the "{element_name}" allowance roundel is not visible in the actual screen')
def element_is_not_visible_actual_screen(context, element_name):
    """
    step. Assert that the element passed as parameter is not visible in the actual screen

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    with contextlib.suppress(NoSuchElementException, InvalidElementStateException):
        assert not element.is_visible(), f"'{element_name}' is displayed"


def __webview_element_as_native_is_visible(context, element):
    """
    Returns if the webview element with a native locator passed as parameter is visible in the actual screen
    checking location and size/height of the element

    :param context: behave context
    :param element: the element to check
    """
    window_size = context.driver.get_window_size()
    window_width = window_size['width']
    window_height = window_size['height']

    element_location = element.web_element.location
    element_size = element.web_element.size
    element_bottom = element_location['y'] + element_size['height']

    return 0 < element_location['x'] < window_width and 0 < element_bottom < window_height


@step('the "{element_name}" webview element as native is not visible in the actual screen')
def webview_element_is_not_visible_actual_screen(context, element_name):
    """
    step. Assert that the webview element with a native locator passed as parameter is not visible in the actual screen

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    with contextlib.suppress(NoSuchElementException):
        assert not __webview_element_as_native_is_visible(context, element), \
            f"'{element_name}' is visible in the actual screen"


@step('the "{element_name}" webview element as native is visible in the actual screen')
def webview_element_is_visible_actual_screen(context, element_name):
    """
    step. Assert that the webview element with a native locator passed as parameter is visible in the actual screen

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    assert __webview_element_as_native_is_visible(context, element), \
        f"'{element_name}' is visible in the actual screen"


@step('the "{elements_list}" icons are not displayed')
def element_list_are_not_displayed(context, elements_list):
    """
    step. Assert that the element passed as parameter is not displayed

    :param context: behave context
    :param elements_list: list of the elements to check
    """
    for element_name in elements_list.split(";"):
        element = get_element_from_page(context, element_name)
        with contextlib.suppress(NoSuchElementException):
            display_element_on_screen(element)

        assert not element.is_visible(), f"'{element_name}' is displayed"


@step('the "{elements_list}" icons are displayed')
def element_list_are_displayed(context, elements_list):
    """
    step. Assert that the element passed as parameter is not displayed

    :param context: behave context
    :param elements_list: list of the elements to check
    """
    for element_name in elements_list.split(";"):
        element = get_element_from_page(context, element_name)
        with contextlib.suppress(NoSuchElementException):
            display_element_on_screen(element)

        assert element.is_visible(), f"'{element_name}' is not displayed"


@step('the "{element_name}" button with "{expected_text}" text is displayed')
@step('the "{element_name}" link with "{expected_text}" text is displayed')
@step('the "{element_name}" entrypoint with "{expected_text}" text is displayed')
@step('the "{element_name}" textfield with "{expected_text}" text is displayed')
@step('the "{element_name}" inputtext with "{expected_text}" text is displayed')
@step('the "{element_name}" tab with "{expected_text}" text is displayed')
@step('the "{element_name}" checkbox with "{expected_text}" text is displayed')
@step('the "{element_name}" drop-down with "{expected_text}" text is displayed')
@step('the "{element_name}" url with "{expected_text}" text is displayed')
@step('the "{element_name}" label with "{expected_text}" text is displayed')
@step('the "{element_name}" tag with "{expected_text}" text is displayed')
@step('the "{element_name}" snackbar with "{expected_text}" text is displayed')
def element_has_the_text(context, element_name, expected_text):
    """
    step. Assert that the element passed as parameter is equal to the expected text

    # added lower() method due to unexpected text shows sometimes in html tags

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_text: expected text
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    try:
        assert element.text.lower().rstrip() == expected_text.lower(), \
            f"Current text: '{element.text}' is not equal to expected: '{expected_text}'"
    except WebDriverException:
        assert element.web_element.text.lower() == expected_text.lower(), \
            f"Current text: '{element.web_element.text}' is not equal to expected: '{expected_text}'"


@step('the "{element_name}" button with "{expected_value}" value is displayed')
def element_has_the_value(context, element_name, expected_value):
    """
    step. Assert that the element passed as parameter is equal to the expected value attribute

    # added lower() method due to unexpected text shows sometimes in html tags

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_value: expected text
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.web_element.get_attribute("value").lower() == expected_value.lower(), \
        f"'{element.web_element.value}' is not equal to: '{expected_value}'"


@step('the "{element_name}" is displayed with multiline text')
def element_has_multiline_text(context, element_name):
    """
    step. Assert that the multiline text of the element is equal to the expected one

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.text == context.text, f"'{element.text}' is not equal to: '{context.text}'"


@step('the "{element_name}" textfield is displayed in "{expected_color}" color')
@step('the "{element_name}" label is displayed in "{expected_color}" color')
def element_is_of_color(context, element_name, expected_color):
    """
    step. Assert that the textfield element passed as parameter is of the expected color

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_color: expected color. Valid values: 'red, 'form_error_red', 'black', 'blue, 'payments_red'
     and 'green'
    """
    if expected_color not in COLORS_MAPPING:
        raise ValueError('Wrong expected color value, possible values: ', list(COLORS_MAPPING.keys()))

    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    element_color_rgba = element.web_element.value_of_css_property('color')
    element_color = rgba_to_hex(element_color_rgba)
    assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
        f"the '{element_color}' does not belong to the {expected_color} color list"


@step('the "{element_name}" segment is displayed in "{expected_color}" color')
def segment_is_of_color(context, element_name, expected_color):
    """
    step. Assert that the element passed as parameter has the expected color background

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_color: expected color. Valid values: 'grey, 'yellow'
     and 'green'
    """
    if expected_color not in COLORS_MAPPING:
        raise ValueError('Wrong expected color value, possible values: ', list(COLORS_MAPPING.keys()))

    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    element_color_rgba = element.web_element.value_of_css_property('background-color')
    element_color = rgba_to_hex(element_color_rgba)
    assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
        f"the '{element_color}' does not belong to the {expected_color} color list"


@step('the "{element_name}" allowance roundel is displayed in "{expected_color}" color')
@step('the "{element_name}" allowance roundel is displayed in "{expected_color}" colour')
def roundel_element_is_of_color(context, element_name, expected_color):
    """
    step. Assert that the allowance roundel element passed as parameter is of the expected color

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_color: expected color. Valid values: 'green, light_blue, light_green'
    """
    if expected_color not in COLORS_MAPPING:
        raise ValueError('Wrong expected color value, possible values: ', list(COLORS_MAPPING.keys()))

    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    element_color_rgba = element.web_element.value_of_css_property('stroke')
    element_color = rgba_to_hex(element_color_rgba)
    assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
        f"the '{element_color}' does not belong to the {expected_color} color list"


@step('the "{element_name}" button that contains the "{expected_text}" text is displayed')
@step('the "{element_name}" checkbox that contains the "{expected_text}" text is displayed')
@step('the "{element_name}" link that contains the "{expected_text}" text is displayed')
@step('the "{element_name}" entrypoint that contains the "{expected_text}" text is displayed')
@step('the "{element_name}" textfield that contains the "{expected_text}" text is displayed')
@step('the "{element_name}" inputtext that contains the "{expected_text}" text is displayed')
def element_contains_the_text(context, element_name, expected_text):
    """
    step. Assert that the element passed as parameter contains the expected text

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_text: expected text
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    try:
        assert expected_text in element.text, f"'{element.text}' not contains the text: {expected_text}"
    except WebDriverException:
        assert expected_text in element.web_element.text, \
            f"'{element.web_element.text}' not contains the text: {expected_text}"


@step('the "{element_name}" textfield that contains any of the "{expected_texts}" texts is displayed')
def element_contains_any_of_the_text(context, element_name, expected_texts):
    """
    step. Assert that the element passed as parameter contains any of the expected texts

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_texts: list expected text separated by ";"
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.text in expected_texts.split(";"), \
        f"'{element.text}' not contains any of the texts: {expected_texts}"


@step('the "{element_name}" inputtext is not empty')
def element_text_is_not_empty(context, element_name):
    """
    step. Assert that the element passed as parameter is not empty

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.text, f"'{element_name}' is empty"


@step('the "{element_name}" textfield is empty')
@step('the "{element_name}" inputtext is empty')
def element_text_is_empty(context, element_name):
    """
    step. Assert that the element passed as parameter is empty

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert not element.text, f"'{element_name}' is not empty"


@step('the "{element_name}" switch is enabled')
def switch_is_enabled(context, element_name):
    """
    step. Assert that the element passed as parameter is enabled

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    if element.webview or context.driver_wrapper.is_web_test():
        checked = element.get_attribute('aria-checked')
        assert checked == 'true', u'"{}" is disabled'.format(element_name)
    else:
        assert BaseSwitch().is_enabled(element) is True, f"'{element_name}' is not enabled"


@step('the "{element_name}" link is enabled')
def link_is_enabled(context, element_name):
    """
    step. Assert that the element passed as parameter is enabled

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert BaseElement().is_enabled(element), f"'{element_name}' is not enabled"


@step('the "{element_name}" switch is disabled')
def switch_is_disabled(context, element_name):
    """
    step. Assert that the element passed as parameter is disabled

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert not BaseSwitch().is_enabled(element), f"'{element_name}' is enabled"


@step('the "{element_name}" link is disabled')
@step('the "{element_name}" app button is disabled')
def link_is_disabled(context, element_name):
    """
    step. Assert that the element passed as parameter is disabled

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert not BaseElement().is_enabled(element), f"'{element_name}' is enabled"


@step('the "{element_name}" button with the "{regular_expression}" format is displayed')
@step('the "{element_name}" link with the "{regular_expression}" format is displayed')
@step('the "{element_name}" entrypoint with the "{regular_expression}" format is displayed')
@step('the "{element_name}" textfield with the "{regular_expression}" format is displayed')
@step('the "{element_name}" inputtext with the "{regular_expression}" format is displayed')
@step('the "{element_name}" tab with the "{regular_expression}" format is displayed')
@step('the "{element_name}" checkbox with the "{regular_expression}" format is displayed')
def element_has_the_format_text(context, element_name, regular_expression):
    """
    step. Assert that the element passed as parameter is equal to the expected text

    :param context: behave context
    :param element_name: name of the element to check
    :param regular_expression: regular_expression of the expected text
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert re.match(regular_expression, element.text), f"'{element.text}' " \
                                                       f"doesn't match with the regular expresion: {regular_expression}"


@step('the "{elements_list}" elements are displayed')
def element_on_list_is_displayed(context, elements_list):
    """
    step. Assert that the the elements passed as parameter exists and are visible

    :param context: behave context
    :param elements_list: list with the names of the elements to check
    """
    for element_name in elements_list.split(";"):
        element = get_element_from_page(context, element_name)
        if isinstance(element, PageElements):
            assert len(element) > 0
        else:
            display_element_on_screen(element)
            assert element.is_visible(), f"'{element_name}' is not displayed"


@step('the "{element_name}" textfield has the "{expected_text}" "{attribute}"')
@step('the "{element_name}" button has the "{expected_text}" "{attribute}"')
@step('the "{element_name}" element has the "{expected_text}" text in the "{attribute}" attribute')
def element_has_value(context, element_name, expected_text, attribute):
    """
    step. Assert that the value of the element passed as parameter is equal to the expected text

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_text: expected text
    :param attribute: attribute to look the text in
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.get_attribute(attribute).strip() == expected_text, f"'{element.get_attribute(attribute)}' " \
                                                                      f"is not equal to: {expected_text}"


@step('the "{element_name}" module with "{expected_title_text}" title is displayed')
def module_title_has_the_text(context, element_name, expected_title_text):
    """
    step. Assert that the title of the element passed as parameter is equal to the expected text

    :param context: behave context
    :param element_name: name of the element to check. The element should have the title_textfield field
    :param expected_title_text: expected title text
    """
    element = get_element_from_page(context, element_name)
    title = getattr(element, 'title_textfield', None)
    if not title:
        raise Exception("Element {} has not the title_textfield field".format(element_name))
    display_element_on_screen(element)
    # fix added for some situation that the module is displayed partialy but not the title (happened in Android)
    display_element_on_screen(title)
    assert expected_title_text in title.text, f"'{title.text}' does not contain the text: {expected_title_text}"


@step('the "{element_name}" section module with "{expected_text}" title is displayed')
def section_title_has_the_text(context, element_name, expected_text):
    """
    step. Assert that the title of the element passed as parameter is equal to the expected text
    Defined to try to solve issues with section titles in iOS that the text is not in the structure until are visible

    :param context: behave context
    :param element_name: name of the element to check. The element should have the title_container and the
                         title_textfield fields
    :param expected_text: expected text
    """
    title_container = get_element_from_page(context, "{}.title_container".format(element_name))
    display_element_on_screen(title_container)
    title = get_element_from_page(context, "{}.title_textfield".format(element_name))
    try:
        display_element_on_screen(title)
        assert title.text == expected_text, f"'{title.text}' is not equal to: {expected_text}"
    except NoSuchElementException:
        # Sometimes, depending of the contents of a screen and the device screen size, like in Support in iOS in the
        # iPhone 7 Plus, the title container is displayed but no the title text. A scroll down/up is done because we
        # are not sure the direction the title will be and we try again to locate the title

        # First we try a scroll down and display the title container in case the scroll down has hidden it
        BaseScreen().native_scroll_down()
        display_element_on_screen(title_container)
        try:
            assert title.text == expected_text, f"'{title.text}' is not equal to: {expected_text}"
        except NoSuchElementException:
            # If scroll down doesn't works, then we display again the title container and do a scroll up
            display_element_on_screen(title_container)
            BaseScreen().native_scroll_up()
            display_element_on_screen(title_container)
            assert title.text == expected_text, f"'{title.text}' is not equal to: {expected_text}"


@step('the "{element_name}" module is displayed with several fields')
def element_has_fields(context, element_name):
    """
    step. Assert that the element has the expected fields
    :param context: behave context
    :param element_name: Name of the element to check the table with the expected fields
    """
    element_module = get_element_from_page(context, element_name)
    display_element_on_screen(element_module)

    for row in context.table:
        element = element_name + "." + row['fields']
        get_element_from_page(context, element).is_visible()


@step('the "{element_name}" tab is selected')
def element_tab_is_selected(context, element_name):
    """
    step. Assert the element is selected
    :param context: behave context
    :param element_name: name of the element to check

    Note that this step is valid for elements with the webview context, to use for native elements it needs to be
    refactored.
    """
    element = get_element_from_page(context, element_name)

    if not element.webview and not context.driver_wrapper.is_web_test():
        raise NotImplementedError("Method not implemented yet")

    element_selected = element.get_attribute('aria-selected')
    if element_selected:
        assert 'true' in element_selected, f"'{element_name}' tab is not selected"
    else:
        # Added to solve a problem with <li\> element in QANOV-5041
        element_selected = element.get_attribute('class')
        assert '--selected' in element_selected, f"'{element_name}' tab is not selected"


@step('the "{string}" string in internal webview is displayed')
@step('the "{string}" string in browser is displayed')
def string_is_displayed_browser_page(context, string):  # noqa: ARG001
    """
    step. Assert that the the string passed as parameter is displayed in the browser page
    :param context: behave context
    :param string: text to search in the page
    """
    element = Text(By.XPATH, '//*[contains(text(), "{}")]'.format(string), webview=True)
    display_element_on_screen(element)
    try:
        assert element.is_visible()
    except AssertionError:
        # some elements will be present but don't have the visible attribute set to true
        assert element.is_present(), f"The string '{string}' is not displayed"


@step('waits until the "{string}" string in internal webview is displayed')
@step('waits until the "{string}" string in browser is displayed')
def waits_until_string_is_displayed_browser_page(context, string):
    """
    step. wait until the string passed as parameter is displayed in the browser page, used when a webview takes a long
    time to load and several redirections are done
    :param context: behave context
    :param string: text to search in the page
    """
    element = Text(By.XPATH, '//*[contains(text(), "{}")]'.format(string), webview=True)
    try:
        WebDriverWait(context.driver, 30).until(lambda driver: element.is_visible())
    except TimeoutException:
        try:
            # some elements will be present but don't have the visible attribute set to true
            WebDriverWait(context.driver, 20).until(lambda driver: element.is_present())
        except TimeoutException:
            raise AssertionError(f"The string '{string}' is not displayed")


@step('the "{string}" string is displayed')
def string_is_displayed_page(context, string):
    """
    step. Assert that the the string passed as parameter is displayed in the page
    :param context: behave context
    :param string: text to search in the page
    """
    if context.driver_wrapper.is_ios_test():
        element = Text(By.XPATH, '//*[contains(@label, "{}")]'.format(string))
    elif context.driver_wrapper.is_android_test():
        element = Text(By.XPATH, '//*[contains(@text, "{}")]'.format(string))
    else:
        element = Text(By.XPATH, '//*[contains(text(), "{}")]'.format(string), webview=True)
    display_element_on_screen(element)
    try:
        # some elements will be present but don't have the visible attribute set to true
        WebDriverWait(context.driver, 15).until(lambda driver: (element.is_visible() or element.is_present()))
    except TimeoutException:
        raise AssertionError(f"The string '{string}' is not displayed")


@step('waits until the "{string}" text in "{element}" element is displayed')
def waits_until_string_is_displayed_in_element(context, string, element):
    """
    step. Wait until the string passed as parameter is displayed in the page
    :param context: behave context
    :param string: text to search in the page
    :param element: element name
    """
    element = get_element_from_page(context, element)
    try:
        WebDriverWait(context.driver, 30).until(text_to_be_present_in_element(element.locator, string))
    except TimeoutException:
        raise AssertionError(f"The string '{string}' is not displayed")


@step('the "{element_name}" webview element is disabled')
def webview_element_is_disabled(context, element_name):
    """
    step. Assert that the webview element passed as parameter is disabled

    :param context: behave context
    :param element_name: name of the webview element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    if not element.webview:
        raise Exception('Element is not in a webview or is not in webview mode')
    assert element.get_attribute('disabled'), f"'{element_name}' is enabled"


@step('a "{badge_type}" red badge is displayed in the "{element_name}" icon')
def badge_notification_displayed(context, badge_type, element_name):
    """
    step. Asserts that a numeric or non numeric badge is being displayed in an element
    :param: context: behave context
    :param: badge_type: numeric or non_numeric
    :param: element_name: element where the badge is displayed
    """
    if badge_type not in {"numeric", "non_numeric"}:
        raise Exception("{} is not a valid badge type".format(badge_type))

    element = get_element_from_page(context, element_name)

    if context.driver_wrapper.is_android_test():
        try:
            WebDriverWait(context.driver, 20).until(lambda driver: element.web_element.tag_name is not None)
        except TimeoutException:
            assert False, "Badge not visible"

        if badge_type == "non_numeric":
            assert map_param('[LANG:pageelements.badge_notification.new_content]') in element.web_element.tag_name, \
                "Badge should be non-numeric!"
        else:
            try:
                WebDriverWait(context.driver, 20).until(lambda driver: any(map(str.isdigit,
                                                                               element.web_element.tag_name)))
            except TimeoutException:
                assert False, "Badge should be numeric!"
    else:
        try:
            WebDriverWait(context.driver, 20).until(lambda driver: element.is_visible())
        except TimeoutException:
            assert False, "Badge not visible"

        if badge_type == "non_numeric":
            assert not any(map(str.isdigit, element.web_element.get_attribute('name'))), "Badge should be non-numeric!"
        else:
            assert any(map(str.isdigit, element.web_element.get_attribute('name'))), "Badge should be numeric!"


@step('the "{badge_type}" red badge is not displayed in the "{element_name}" icon')
def badge_notification_not_displayed(context, badge_type, element_name):
    """
    step. Asserts that the badge is not being displayed in an element
    :param: context: behave context
    :param: badge_type: numeric or non_numeric
    :param: element_name: element where the badge is displayed
    """
    if badge_type not in {"numeric", "non_numeric"}:
        raise Exception("{} is not a valid badge type".format(badge_type))

    element = get_element_from_page(context, element_name)

    # In general, the badge element is always present in Android but is not displayed in the app when it has no text,
    # currently the inbox icon behaves differently, because it doesn't have a holder element

    if context.driver_wrapper.is_android_test():
        if element.web_element.tag_name and badge_type == "numeric":
            assert not any(map(str.isdigit, element.web_element.tag_name)), "Badge is being displayed"
        else:
            try:
                WebDriverWait(context.driver, 15).until(lambda driver: element.web_element.tag_name is None)
            except TimeoutException:
                assert False, "Badge is being displayed"
    else:
        try:
            element.wait_until_not_visible(15)
        except TimeoutException:
            assert False, "Badge is being displayed"


@step('the element with accessibility text "{text}" is displayed')
def element_with_accessibility_text(context, text):
    """
    step. Step to validate the text when the element hasn't included the text in the attribute text
    but in the accessibility field
    :param context: behave context
    :param text: Text added in the accessibility id field and displayed in the screen
    """
    _ = context

    element = Text(AppiumBy.ACCESSIBILITY_ID, '{}'.format(text))
    assert element.is_visible(), f"The element with accessibility text '{text}' is not displayed"


@step('the "{module1}" element is under "{module2}" element')
@step('the "{module1}" module is under "{module2}" module')
def module_is_under_module(context, module1, module2):
    """
    step. Assert that the module1 is under module2 in the screen

    NOTE: The locator strategy of these modules must be XPATH

    :param context: behave context
    :param module1: element name of the module1
    :param module2: element name of the module2
    """
    element_module1 = get_element_from_page(context, module1)
    element_module2 = get_element_from_page(context, module2)

    # ELEMENT VALIDATIONS
    # check if use XPATH
    for check in [element_module1, element_module2]:
        if not check.locator[0] == By.XPATH:
            raise Exception("The module elements must be checked with XPATH")

    # check same context
    if element_module1.webview != element_module2.webview:
        raise Exception("The elements should have the same context (webview/native)")

    element_path = "{}/following::{}".format(element_module2.locator[1], element_module1.locator[1][2:])

    checker_element = PageElement(By.XPATH, element_path, webview=element_module1.webview,
                                  webview_context_selection_callback=element_module1.webview_context_selection_callback,
                                  webview_csc_args=element_module1.webview_csc_args)

    display_element_on_screen(checker_element)
    try:
        assert checker_element.is_visible()
    except AssertionError:
        # some elements will be present but don't have the visible attribute set to true
        assert checker_element.is_present(), f"'{module1}' is not under '{module2}'"


@step('the "{element_name}" inputtext with the "{expected_text}" placeholder is displayed')
@step('the "{element_name}" placeholder with "{expected_text}" text is displayed')
def inputtext_has_the_placeholder(context, element_name, expected_text):
    """
    step. Assert that the element passed has the expected placeholder

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_text: expected placeholder text
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    try:
        element_placeholder = get_element_from_page(context, element_name + "_placeholder")
        assert element_placeholder.text == expected_text, f"'{element.text}' is not equal to: {expected_text}"
    except AssertionError:
        if element.webview:
            if element.get_attribute('placeholder'):
                assert element.get_attribute('placeholder') == expected_text, \
                    f"'{element.get_attribute('placeholder')}' is not equal to: {expected_text}"
            else:
                element = get_element_from_page(context, element_name)
                assert element.text == expected_text, f"'{element.text}' is not equal to: {expected_text}"
        else:
            assert element.text == expected_text, f"'{element.text}' is not equal to: {expected_text}"


@step('the "{element_name}" inputtext that contains the "{expected_text}" placeholder is displayed')
def inputtext_contains_the_text(context, element_name, expected_text):
    """
    step. Assert that the inputtext passed as parameter contains the expected text in the placeholder

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_text: expected text of the placeholder
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    if element.webview:
        assert expected_text in element.get_attribute('placeholder'), f"'{element.get_attribute('placeholder')}' " \
                                                                      f"not contains the text: {expected_text}"
    else:
        assert expected_text in element.text, f"'{element.text}' not contains the text: {expected_text}"


@step('the "{element_name}" checkbox is not checked')
@step('the "{element_name}" switch is not checked')
def checkbox_is_disabled(context, element_name):
    """
    step. Assert that element is checked
    For native elements the same attribute validation used for Switch elements here for checbox elements.
    :param context: behave context
    :param element_name: element
    """
    element = get_element_from_page(context, element_name)
    if element.webview:
        checked = element.get_attribute('aria-checked')
        assert checked == 'false', u'"{}" is disabled'.format(element_name)
    else:
        display_element_on_screen(element)
        assert not BaseSwitch().is_enabled(element), f"'{element_name}' is enabled"


@step('the "{element_name}" checkbox is checked')
@step('the "{element_name}" switch is checked')
def checkbox_is_enabled(context, element_name):
    """
    step. Assert that element is enabled.
    For native elements the same attribute validation used for switch elements works here for checkbox elements.
    :param context: behave context
    :param element_name: element
    """
    element = get_element_from_page(context, element_name)
    if element.webview or context.driver_wrapper.is_web_test():
        checked = element.get_attribute('aria-checked')
        assert checked == 'true', u'"{}" is disabled'.format(element_name)
    else:
        display_element_on_screen(element)
        assert BaseSwitch().is_enabled(element), f"'{element_name}' is not enabled"


@step('user has not selected any stars on "{rating_bar_element}" rating bar')
def any_star_selected(context, rating_bar_element):
    """
    step. Assert that that no stars are selected on rating bar.
    :param context: behave context
    :param rating_bar_element: rating bar element
    """
    assert BaseRatingBar().has_not_stars_selected(get_element_from_page(context, rating_bar_element)), \
        'Rating bar has some star selected'


@step('the "{element_name}" textfield with the user phone number is displayed')
def element_has_phone_number(context, element_name):
    """
    step. Assert that the element passed as parameter is equal to the user phone number

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    phone_number = AusHelper.get_helper(context).get_phone_number()
    try:
        assert element.text.lower().rstrip() == phone_number, \
            f"'{element.text}' is not equal to: '{phone_number}'"
    except WebDriverException:
        assert element.web_element.text.lower() == phone_number, \
            f"'{element.web_element.text}' is not equal to: '{phone_number}'"


@step('the "{attribute}" property of the "{page_element}" element matches "{text}" text')
def property_of_page_element_matches_text(context, attribute, page_element, text):
    """
    step. Asserts that an element attribute matches certain text

    :param context: behave context
    :param attribute: the attribute to search for into the page element
    :param page_element: the element whose attribute compares
    :param text: text value to compare
    """
    element = get_element_from_page(context, page_element)
    display_element_on_screen(element)
    prop = element.web_element.get_attribute(attribute)
    assert prop == text, \
        f'{attribute} property of {page_element} element has value {prop} which does not match ' \
        f'expected "{text}"'


@step('the "{attribute}" property of the "{page_element}" element contains the "{text}" text')
def property_of_page_element_contains_text(context, attribute, page_element, text):
    """
    step. Asserts that an element attribute contains certain text

    :param context: behave context
    :param attribute: the attribute to search for into the page element
    :param page_element: the element whose attribute compares
    :param text: the value to compare
    """
    element = get_element_from_page(context, page_element)
    display_element_on_screen(element)
    prop = element.web_element.get_attribute(attribute)
    assert text in prop, \
        f'{attribute} property of {page_element} element has value {prop} which does not contain ' \
        f'expected "{text}"'


@step('the "{page_element}" element has the "{name}" tag name')
def element_with_tag_name(context, page_element, name):
    """
    step. Asserts an element tag name

    :param context: behave context
    :param page_element: the element whose name compares
    :param name: the name to compare
    """
    element = get_element_from_page(context, page_element)
    display_element_on_screen(element)
    element_name = element.web_element.tag_name
    assert name in element_name, \
        f'{page_element} element has name {element_name} which does not contain ' \
        f'expected "{name}"'


@step('the "{element_name}" progress bar is on "{position}" position')
def progress_steps_in_position(context, element_name, position):
    """
    step. Assert that the progress bar is in a specific step position

    :param context: behave context
    :param element_name: name of the element to check
    :param position: string step number
    """
    step_mapping = {"first": 1, "second": 3, "third": 5, "fourth": 7}
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.is_step_selected(step_mapping[position]), f"'{position}' position is not selected"


@step('the "{attribute}" property of the "{field}" field in all the elements of the '
      '"{carousel}" carousel matches "{text}" text')
@step('the "{attribute}" property of the "{field}" field in all the elements of the '
      '"{carousel}" list matches "{text}" text')
def property_of_carousel_matches_text(context, attribute, field, carousel, text):
    """
    step. Asserts that an element attribute matches certain text

    :param context: behave context
    :param attribute: the attribute to search for into the page element
    :param field: the element whose attribute compares
    :param carousel: the carousel / list to check
    :param text: text value to compare
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"

    for card in carousel_module:
        card_field = getattr(card, field)
        prop = card_field.web_element.get_attribute(attribute)
        assert prop == text, \
            f'{attribute} property of {field} element has value {prop} which does not match ' \
            f'expected "{text}"'


@step('the "{attribute}" property of the "{field}" field in all the elements of the '
      '"{carousel}" carousel contains the "{text}" text')
@step('the "{attribute}" property of the "{field}" field in all the elements of the '
      '"{carousel}" list contains the "{text}" text')
def property_of_carousel_contains_text(context, attribute, field, carousel, text):
    """
    step. Asserts that an element attribute contains certain text

    :param context: behave context
    :param attribute: the attribute to search for into the page element
    :param field: the element whose attribute compares
    :param carousel: the carousel / list to check
    :param text: text value to compare
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"

    for card in carousel_module:
        card_field = getattr(card, field)
        prop = card_field.web_element.get_attribute(attribute)
        assert text in prop, \
            f'{attribute} property of {field} element has value {prop} which does not contain ' \
            f'expected "{text}"'


@step('the attribute "{attribute}" of the "{element_name}" element is not empty')
def attribute_from_element_not_empty(context, attribute, element_name):
    """
    step. Assert that the value of the attribute passed as parameter is not empty

    :param context: behave context
    :param attribute: the attribute
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.web_element.get_attribute(attribute), f"Attribute '{element_name}' is empty"


@step('the "{element_name}" textfield is small')
def element_has_the_small_field(context, element_name):
    """
    step. Assert that the textfield passed as parameter is small

    :param context: behave context
    :param element_name: name of the element to check
    """
    element_small = get_element_from_page(context, f"{element_name}_small")
    element_big = get_element_from_page(context, f"{element_name}_big")
    display_element_on_screen(element_small)
    assert not element_big.is_visible(), f"'{element_name}' is big"

"""
Lists elements assertions steps
"""
import re
import time
import datetime
import locale

from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.support.ui import Select
from behave import step as behave_step  # noqa: F401
from toolium.pageelements import PageElement
from toolium_telefonica.behave import step

from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.common.aus.code_factory import AusHelper
from acceptance.common.constants.constants import COLORS_MAPPING
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.utils.utils import LocaleManager
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen, \
    get_element_from_parent_by_text
from acceptance.common.utils.utils import rgba_to_hex, check_color_in_list

from acceptance.common.utils import utils


@step('the "{list}" list with "{textfields_list}" textfields is displayed')
@step('the "{list}" carousel with "{textfields_list}" cards is displayed')
def element_list_has_textfields(context, list, textfields_list):
    """
    step. Assert that the the textfields passed as parameter exists in the list
    :param context: behave context
    :param list: list element with the textfields
    :param textfields_list: textfields in the list
    """
    for textfield in textfields_list.split(";"):
        element_list = get_element_from_page(context, list)
        element_textfield = get_element_from_parent_by_text(context, element_list, textfield)
        display_element_on_screen(element_textfield)
        assert element_textfield.is_visible(), f"'{textfield}' is not displayed"


@step('the "{list}" list has the "{textfields_list}" textfields displayed in the "{field}" field')
def list_has_textfields_in_group_field(context, field, list, textfields_list):
    """
    step. Assert the textfields passed as parameter match all the texts retrieved from a field within a list
    based on Groups pagelements.
    We compare each element in the textfields_list with the text of the "field" in every element of the groups list
    :paran context: behave context
    :param field: field to check in the group
    :param list: list of elements based on Groups
    :param textfields_list: list of textfields
    """
    element_list = get_element_from_page(context, list)
    assert len(element_list) == len(textfields_list.split(";")), "The number of elements in the lists are different "
    assert all(map(lambda textfield, element: textfield == getattr(element, field).text, textfields_list.split(";"),
                   element_list)),\
        f"Textfields {textfields_list} are not displayed in the {field} field within the list"


@step('the "{list}" list contains the "{textfields_list}" textfields displayed in the "{field}" field')
def list_contains_textfields_in_group_field(context, field, list, textfields_list):
    """
    step. Assert the textfields passed as parameter are found in the texts retrieved from a specific field
    within a list based on Groups pagelements.
    We textfields list has to be found in the pagelements respecting the order.
    There could be other text elements before or after the textfields list values.
    :paran context: behave context
    :param field: field to check in the group
    :param list: list of elements based on Groups
    :param textfields_list: list of textfields
    """
    textfields_list = textfields_list.split(";")
    element_list = get_element_from_page(context, list)
    textfields_in_field = [getattr(element, field).text for element in element_list\
                            if getattr(element, field).text in textfields_list]
    assert textfields_list == textfields_in_field,\
        f"Textfields {textfields_list} are not displayed in the {field} field within the list"


@step('the "{index}" element in the "{element_name}" list with "{expected_text}" text is displayed')
@step('the "{index}" index in the "{element_name}" list with "{expected_text}" text is displayed')
def element_index_has_the_text(context, index, element_name, expected_text):
    """
    step. Assert that the element of the list is equal to the expected text

    :param context: behave context
    :param index: index for the list
    :param element_name: name of the list
    :param expected_text: expected text
    """
    element_list = get_element_from_page(context, element_name)
    element = element_list[int(index)]
    display_element_on_screen(element)

    if element.webview or (element.parent and element.parent.webview):
        # element.get_attribute('text') returns None for the webviews, only works like this
        element_text = element.text
    else:
        # when element is selected 'text' return '1' for iOS
        element_text = element.get_attribute('label') if context.driver_wrapper.is_ios_test() \
            else element.get_attribute('text')
    assert expected_text == element_text, f"'{element_text}' not contains the text: {expected_text}"


@step('the "{element_name}" list has "{numeric_expression}" elements')
@step('the "{element_name}" list has "{numeric_expression}" entries')
def element_number_elements(context, element_name, numeric_expression):
    """
    step. Assert that the element list passed as parameter has the correct number of elements

    :param context: behave context
    :param element_name: name of the list
    :param numeric_expression: expected number of elements
    """
    element = get_element_from_page(context, element_name)
    __compare_elements_list_length(element, numeric_expression)


def __compare_elements_list_length(the_list, numeric_expression):
    if not utils.is_valid_numeric_expression(numeric_expression):
        raise ValueError("Value {} to check is not valid".format(numeric_expression))

    expected_number = int(''.join(re.findall(r'\d+', str(numeric_expression))))
    expected_operator = ''.join(re.findall(r'\D+', str(numeric_expression)))
    assertion_err = f"Expected '{expected_number}' and there are '{len(the_list)}' elements"
    if expected_operator == '>':
        assert len(the_list) > expected_number, assertion_err
    elif expected_operator == '<':
        assert len(the_list) < expected_number, assertion_err
    elif expected_operator == '<=':
        assert len(the_list) <= expected_number, assertion_err
    elif expected_operator == '>=':
        assert len(the_list) >= expected_number, assertion_err
    elif not expected_operator:
        assert len(the_list) == expected_number, assertion_err


@step('the sublist "{elements_sublist}" inside each "{elements_list}" list has "{numeric_expression}" elements')
def element_number_elements_in_sublist(context, elements_sublist, elements_list, numeric_expression):
    """
    step. Assert that the elements sublist passed as parameter has the correct number of elements

    :param context: behave context
    :param elements_sublist: sublist of elements based on Groups
    :param elements_list: list of elements based on Groups
    :param numeric_expression: expected number of elements
    """
    elements_list = get_element_from_page(context, elements_list)

    for element in elements_list:
        element_sublist = getattr(element, elements_sublist)
        __compare_elements_list_length(element_sublist, numeric_expression)


@step('each element in the "{element_list}" list has the "{element_name}" field')
def each_element_in_groups_list_has_field(context, element_list, element_name):
    """
    step. Asserts each element in the list has the element_name element
    A swipe action has been added due to the element could not be visible in the screen.
    Method is_present() is used to avoid errors when the element has the property visible set to false
    For native context As in IOS all pagelements will be retrieved even the ones not visible in the screen and
    the list might be long, and processing it is slow due to the mechanism is based in XPATH,
    a threshold has been defined in the variable processed_elements.
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param element_name: name of the element to locate for each element in the group
    """
    native = False
    processed_elements = 0
    try:
        if "NATIVE" in context.driver.context:
            native = True
            processed_elements = 4
    except AttributeError:
        pass
    scrolled = False

    element_list = get_element_from_page(context, element_list)

    for index, element in enumerate(element_list):
        if len(element_name.split(".")) > 1:
            name_list = element_name.split(".")
            group_member = getattr(element, name_list[0])
            for idx in range(1, len(name_list)):
                group_member = getattr(group_member, name_list[idx])
        else:
            group_member = getattr(element, element_name)
        try:
            assert group_member.is_present(), f"The '{element_name}' field is not present in all elements of the list"
        except (NoSuchElementException, AssertionError):
            if native:
                context.driver.swipe(0, 500, 0, 200, 250)
                scrolled = True
            assert group_member.is_present()  # Retry after swipe in native otherwise just check again.

        if native and index == processed_elements:
            break

    if scrolled:
        # swipe up to leave the screen in the same position
        context.driver.swipe(
            start_x=context.driver.get_window_size()['width'] / 2,
            start_y=context.driver.get_window_size()['height'] * 0.20,
            end_x=context.driver.get_window_size()['width'] / 2,
            end_y=context.driver.get_window_size()['height'] * 0.80,
            duration=250,
        )


@step('each element in the sublist "{elements_sublist}" inside each "{elements_list}" list has the "{field}" field')
def each_element_in_sublist_has_field(context, elements_sublist, elements_list, field):
    """
    step. Asserts each element in the sublist has the given field.
    :param context: behave context
    :param elements_sublist: sublist of elements based on Groups
    :param elements_list: list of elements based on Groups
    :param field: expected field
    """
    elements_list = get_element_from_page(context, elements_list)

    for element in elements_list:
        element_sublist = getattr(element, elements_sublist)
        for item in element_sublist:
            group_member = getattr(item, field)
            assert group_member.is_present(), f"The '{field}' field is not present in all elements of the sublist"


@step('each element in the sublist "{elements_sublist}" inside each "{elements_list}" list has the "{field}" field '
      'with the "{regular_expression}" format')
def each_element_in_sublist_has_field_with_format(context, elements_sublist, elements_list, field, regular_expression):
    """
    step. Asserts each element in the sublist has the given field.
    :param context: behave context
    :param elements_sublist: sublist of elements based on Groups
    :param elements_list: list of elements based on Groups
    :param field: expected field
    :param regular_expression: regular expression to check the field
    """
    elements_list = get_element_from_page(context, elements_list)

    for element in elements_list:
        element_sublist = getattr(element, elements_sublist)
        for item in element_sublist:
            group_member = getattr(item, field)
            assert re.match(regular_expression, group_member.text), (f"'{group_member.text}' of field {field} doesn't "
                                                                     f"match with the regular expresion: "
                                                                     f"{regular_expression}")


@step('each element in the "{element_list}" list has the "{element_name}" field with "{expected_text}" text')
def each_element_in_groups_list_has_field_with_text(context, element_list, element_name, expected_text):
    """
    step. Asserts each element in the list has the element_name text with the expected text.
    Same swipe mechanism used in the previous step has been kept to be used for Android native executions.
    Also the threshold to avoid processing big lists has been kept.
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param element_name: name of the element to locate for each element in the group
    :param expected_text: expected text
    """
    processed_elements = 4
    scrolled = False

    element_list = get_element_from_page(context, element_list)

    for index, element in enumerate(element_list):
        group_member = getattr(element, element_name)
        try:
            assert expected_text == group_member.text, \
                f"'{element.get_attribute('text')}' doesn't contain the text: {expected_text}"
        except (NoSuchElementException, AssertionError):
            context.driver.swipe(0, 500, 0, 200, 250)
            scrolled = True
            assert expected_text == group_member.text, \
                f"'{element.get_attribute('text')}' doesn't contain the text: {expected_text}"  # Retry after swipe.

        if index == processed_elements:
            break

    if scrolled:
        # swipe up to leave the screen in the same position
        context.driver.swipe(
            start_x=context.driver.get_window_size()['width'] / 2,
            start_y=context.driver.get_window_size()['height'] * 0.20,
            end_x=context.driver.get_window_size()['width'] / 2,
            end_y=context.driver.get_window_size()['height'] * 0.80,
            duration=250,
        )


@step('each element in the "{element_list}" list has the "{element_name}" field with "{expected_texts}" texts')
def each_element_in_groups_list_has_field_with_texts(context, element_list, element_name, expected_texts):
    """
    step. Asserts each element in the list has the element_name text with the expected text.
    Same swipe mechanism used in the previous step has been kept to be used for Android native executions.
    Also the threshold to avoid processing big lists has been kept.
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param element_name: name of the element to locate for each element in the group
    :param expected_texts: list of expected text
    """
    scrolled = False

    element_list = get_element_from_page(context, element_list)

    expected_texts = expected_texts.split(";")

    for index, element in enumerate(element_list):
        group_member = getattr(element, element_name)
        try:
            assert expected_texts[index] == group_member.text, \
                f"'{element.get_attribute('text')}' doesn't contain the text: {expected_texts[index]}"
        except (NoSuchElementException, AssertionError):
            context.driver.swipe(0, 500, 0, 200, 250)
            scrolled = True
            # Retry after swipe.
            assert expected_texts[index] == group_member.text, \
                f"'{element.get_attribute('text')}' doesn't contain the text: {expected_texts[index]}"

    if scrolled:
        # swipe up to leave the screen in the same position
        context.driver.swipe(
            start_x=context.driver.get_window_size()['width'] / 2,
            start_y=context.driver.get_window_size()['height'] * 0.20,
            end_x=context.driver.get_window_size()['width'] / 2,
            end_y=context.driver.get_window_size()['height'] * 0.80,
            duration=250,
        )


@step('each element in the "{element_list}" list has the "{element_name}" field that contains the "{expected_text}" '
      'text')
def each_element_in_groups_list_has_field_that_contains_text(context, element_list, element_name, expected_text):
    """
    step. Asserts each element in the list has the element_name text that contains the expected_text.
    Same swipe mechanism used in the previous step has been kept to be used for Android native executions.
    Also the threshold to avoid processing big lists has been kept.
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param element_name: name of the element to locate for each element in the group
    :param expected_text: expected text
    """
    processed_elements = 4
    scrolled = False

    element_list = get_element_from_page(context, element_list)

    for index, element in enumerate(element_list):
        group_member = getattr(element, element_name)
        try:
            assert expected_text in group_member.text, \
                f"'{element.get_attribute('text')}' doesn't contain the text: {expected_text}"
        except (NoSuchElementException, AssertionError):
            context.driver.swipe(0, 500, 0, 200, 250)
            scrolled = True
            assert expected_text in group_member.text, \
                f"'{element.get_attribute('text')}' doesn't contain the text: {expected_text}"  # Retry after swipe.

        if index == processed_elements:
            break

    if scrolled:
        # swipe up to leave the screen in the same position
        context.driver.swipe(
            start_x=context.driver.get_window_size()['width'] / 2,
            start_y=context.driver.get_window_size()['height'] * 0.20,
            end_x=context.driver.get_window_size()['width'] / 2,
            end_y=context.driver.get_window_size()['height'] * 0.80,
            duration=250,
        )


@step('the "{element_list}" list with "{entrypoints}" entrypoints is displayed')
def element_list_has_entrypoints_displayed_in_section(context, element_list, entrypoints):
    """
    step. Assert all entrypoints are shown within a list of page elements.
    The entrypoints will be checked in the order defined so it has to match the same position in the list of elements
    displayed on the screen.
    There might a be a case where the list of elements displayed in the screen is longer than the screen height ,
    in this case as we know Android will only retrieve the visibles. So if the list of entrypoints is bigger than the
    list of page elements a swipe/scroll action will be done when processing the not visible elements.
    :param context: behave context
    :param element_list: list of elements based on Texts
    :param entrypoints: list of entrypoints to check
    """
    element_list = get_element_from_page(context, element_list)
    entrypoints_list = entrypoints.split(";")
    if len(element_list) == 0:  # Android won't retrieve the pagelements if they are not visible.
        context.driver.swipe(
            start_x=context.driver.get_window_size()['width'] / 2,
            start_y=context.driver.get_window_size()['height'] * 0.50,
            end_x=context.driver.get_window_size()['width'] / 2,
            end_y=context.driver.get_window_size()['height'] * 0.25,
            duration=250)

    previous_value = ''
    for index, value in enumerate(entrypoints_list):
        if element_list.parent is not None and element_list.parent.webview:
            element = element_list.web_elements[index].text
            element_label = element.split('\n')[0] if '\n' in element else element
            assert value == element_label, \
                f"'{value}' expected; '{element_label}' found"
        else:
            try:
                assert value == element_list.page_elements[index].text, \
                    f"'{value}' expected; '{element_list.page_elements[index].text}' found"
            except IndexError as exception:
                # Only for Android, in case the list is not completed displayed in the screen
                if context.driver_wrapper.is_android_test():
                    BaseScreen().native_scroll_into_text(value)
                    assert value == element_list.page_elements[-1].text, \
                        f"'{value}' expected; '{element_list.page_elements[-1].text}' found"
                    assert previous_value == element_list.page_elements[-2].text, \
                        f"'{value}' found but is not the next element to '{previous_value}'"
                else:
                    raise exception
        previous_value = value


@step('the element in "{index}" position in the "{element_list}" list has the "{field}" '
      'textfield with the "{expected_text}" text')
@step('the element in "{index}" position of the "{element_list}" list has the "{field}" '
      'textfield with the "{expected_text}" text')
@step('the element in "{index}" position in the "{element_list}" list has the "{field}" field '
      'with the "{expected_text}" text')
@step('the element in "{index}" position of the "{element_list}" list has the "{field}" field '
      'with the "{expected_text}" text')
@step('the "{index}" index in the "{element_list}" list has the "{field}" field with "{expected_text}" text')
def check_text_field_group_list(context, index, element_list, field, expected_text):
    """
    step. Asserts the text in the field with the param index for a list of groups
    :param context: behave context
    :param index: index to check the element
    :param element_list: list of elements based on Groups
    :param field: field in the group
    :param expected_text: expected text in the field
    """
    element_list = get_element_from_page(context, element_list)
    element = element_list[int(index)]
    display_element_on_screen(element)
    field_element = getattr(element, field)

    assert expected_text == field_element.text, f"'{field_element.text}' not contains the expected " \
                                                f"text: {expected_text}"


@step('the "{index}" index in the "{element_list}" list has the "{field}" field whose "{attribute}" attribute contains '
      'the "{expected_attribute_value}" value')
def check_attribute_field_group_list(context, index, element_list, field, attribute, expected_attribute_value):
    """
    step. Asserts the attribute value in contained in the attribute name of the field with the param index for a list
    of groups
    :param context: behave context
    :param index: index to check the element
    :param element_list: list of elements based on Groups
    :param field: field in the group
    :param attribute: attribute name
    :param expected_attribute_value: expected attribute value
    """
    element_list = get_element_from_page(context, element_list)
    element = element_list[int(index)]
    display_element_on_screen(element)
    field_element = getattr(element, field)

    attribute_value = field_element.get_attribute(attribute)

    assert expected_attribute_value in attribute_value, f"'{attribute_value}' not contains the expected " \
                                                        f"attributed value: {expected_attribute_value}"


@step('the element in "{index}" position in the "{element_list}" list has the "{field}" field '
      'with the "{regular_expression}" format')
def check_text_field_format_group_list(context, index, element_list, field, regular_expression):
    """
    step. Asserts the text in the field with the param index for a list of groups
    :param context: behave context
    :param index: index to check the element
    :param element_list: list of elements based on Groups
    :param field: field in the group
    :param regular_expression: expected text in the field
    """
    element_list = get_element_from_page(context, element_list)
    element = element_list[int(index)]
    display_element_on_screen(element)
    field_element = getattr(element, field)

    assert re.match(regular_expression, field_element.text), f"'{field_element.text}' of list {field} field " \
                                                             f"doesn't match with the regular expresion:" \
                                                             f" {regular_expression}"


@step('the "{index}" index in the "{element_list}" list has the "{field}" field')
@step('the element in "{index}" position of the "{element_list}" list has the "{field}" field')
@step('the element in "{index}" position in the "{element_list}" list has the "{field}" field')
@step('the "{index}" index in the "{element_list}" list has the "{field}" textfield')
@step('the element in "{index}" position of the "{element_list}" list has the "{field}" textfield')
def check_field_group_list(context, index, element_list, field):
    """
    step. Asserts element with index in the list has the field
    :param context: behave context
    :param index: index to check the element
    :param element_list: list of elements based on Groups
    :param field: field to check in the group
    """
    element_list = get_element_from_page(context, element_list)
    element = element_list[int(index)]

    try:
        assert getattr(element, field).is_present()
    except AssertionError:
        if not element.webview:
            context.driver.swipe(0, 500, 0, 200, 250)
            assert getattr(element, field).is_present()  # Retry after swipe.


@step('the "{index}" index in the "{element_list}" list has not the "{field}" field')
@step('the element in "{index}" position of the "{element_list}" list has not the "{field}" field')
@step('the element in "{index}" position in the "{element_list}" list has not the "{field}" field')
@step('the "{index}" index in the "{element_list}" list has not the "{field}" textfield')
@step('the element in "{index}" position of the "{element_list}" list has not the "{field}" textfield')
def check_field_not_in_group_list(context, index, element_list, field):
    """
    step. Asserts element with index in the list has the field
    :param context: behave context
    :param index: index to check the element
    :param element_list: list of elements based on Groups
    :param field: field to check in the group
    """
    element_list = get_element_from_page(context, element_list)
    element = element_list[int(index)]
    assert not getattr(element, field).is_present()


@step('the "{index}" index in the "{element_list}" list has the "{field}" field with "{expected_color}" color')
@step('the element in "{index}" position of the "{element_list}" list has the "{field}" field with '
      '"{expected_color}" color')
@step('the "{index}" index in the "{element_list}" list has the "{field}" textfield with "{expected_color}" color')
@step('the element in "{index}" position of the "{element_list}" list has the "{field}" textfield with '
      '"{expected_color}" color')
def check_field_color_group_list(context, index, element_list, field, expected_color):
    """
    step. Asserts element with index in the list has the field
    :param context: behave context
    :param index: index to check the element
    :param element_list: list of elements based on Groups
    :param field: field to check in the group
    :param expected_color: color to check in the field
    """
    element_list = get_element_from_page(context, element_list)
    element = element_list[int(index)]
    if expected_color not in COLORS_MAPPING:
        raise ValueError('Wrong expected color value, possible values: ', list(COLORS_MAPPING.keys()))
    try:
        element_field = getattr(element, field)
        assert element_field.is_present()
        element_color_rgba = element_field.web_element.value_of_css_property('color')
        element_color = rgba_to_hex(element_color_rgba)
        assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
            f"the '{element_color}' does not belong to the {expected_color} color list"

    except AssertionError:
        if not element.webview:
            context.driver.swipe(0, 500, 0, 200, 250)
            element_field = getattr(element, field)
            assert element_field.is_present()
            element_color_rgba = element_field.web_element.value_of_css_property('color')
            element_color = rgba_to_hex(element_color_rgba)
            assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
                f"the '{element_color}' does not belong to the {expected_color} color list"


@step('each element in the "{element_list}" list has the "{field}" element with "{expected_color}" color')
def check_field_color_list(context, element_list, field, expected_color):
    """
    step. Asserts element with index in the list has the field
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param field: field to check in the group
    :param expected_color: color to check in the field
    """
    element_list = get_element_from_page(context, element_list)
    if expected_color not in COLORS_MAPPING.values():
        raise ValueError('Wrong value, possible values: ', list(COLORS_MAPPING.values()))

    assert len(element_list) > 0, f"-'{element_list}'- List not found or length = 0"
    for element in element_list:
        try:
            element_field = getattr(element, field)
            assert element_field.is_present()
            element_color_rgba = element_field.web_element.value_of_css_property('color')
            element_color = rgba_to_hex(element_color_rgba)
            assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
                f"the '{element_color}' does not belong to the {expected_color} color list"

        except AssertionError:
            if not element.webview:
                context.driver.swipe(0, 500, 0, 200, 250)
                element_field = getattr(element, field)
                assert element_field.is_present()
                element_color_rgba = element_field.web_element.value_of_css_property('color')
                element_color = rgba_to_hex(element_color_rgba)
                assert check_color_in_list(element_color, COLORS_MAPPING[expected_color]), \
                    f"the '{element_color}' does not belong to the {expected_color} color list"


def _element_stable_coordinate(element, dimension, step_wait=0.2, timeout=10):
    """Returns the coordinate in a dimension when it is stable. Considering
    stable the same coordinate in two consecutive location requests

    :param element: the element to evaluate
    :param dimension: the x or y dimension of the element to evaluate
    """
    deadline = time.time() + timeout
    prev_coordinate = None
    while True:
        current_coordinate = element.web_element.location[dimension]
        if current_coordinate == prev_coordinate:
            return current_coordinate
        prev_coordinate = current_coordinate
        if time.time() > deadline:
            raise TimeoutError(f'element coordinate {dimension} never reached an stable state')
        time.sleep(step_wait)


@step('the "{element_name}" list cannot be swiped')
@step('the "{element_name}" carousel cannot be swiped')
def element_cannot_be_swipped(context, element_name):
    """
    step. Asserts that the list/carousel cannot be swipped

    :param context: behave
    :param element_name: the list or carousel to check

    NOTE: Currently, this step is only available for webviews on Android
    """
    element_list = get_element_from_page(context, element_name)
    first_element = element_list[0]
    last_element = element_list[len(element_list) - 1]

    if context.driver_wrapper.is_web_test() or PageElement.webview_context_prefix in context.driver.context:
        first_element_x = first_element.web_element.location['x']
        first_element_y = first_element.web_element.location['y']

        first_element.set_focus()
        context.driver.execute_script("arguments[0].scrollIntoView({'behavior':'smooth'});", last_element.web_element)

        first_element_x_after_scroll = _element_stable_coordinate(first_element, 'x')
        if first_element_x != first_element_x_after_scroll:
            raise ValueError('the list/carousel is indeed scrollable')
        first_element_y_after_scroll = _element_stable_coordinate(first_element, 'y')
        if first_element_y != first_element_y_after_scroll:
            raise ValueError('the list/carousel is indeed scrollable')


@step('the "{element_name}" list can be swiped')
@step('the "{element_name}" carousel can be swiped')
def element_can_be_swiped(context, element_name):
    """
    step. Assert the list can be swiped

    :param context: behave context
    :param element_name: name of the list to check

    NOTE: Currently, this step is only valid to test native elements different from "Groups" elements. Later,
    we have to modify this method to adapt to Groups and/or webviews
    """
    element_list = get_element_from_page(context, element_name)
    first_element = element_list[0]
    last_element = element_list[len(element_list) - 1]
    display_element_on_screen(last_element)

    if context.driver_wrapper.is_web_test() or PageElement.webview_context_prefix in context.driver.context:
        first_element.set_focus()
        context.driver.execute_script("arguments[0].scrollIntoView({'behavior':'smooth'});", last_element.web_element)

        def coordinate_out_of_screen(element, dimension):
            element_coordinate = _element_stable_coordinate(element, dimension)
            screen_coordinate = context.driver.get_window_size()[{
                'x': 'width',
                'y': 'height',
            }[dimension]]
            return element_coordinate > screen_coordinate or element_coordinate < 0

        for dimension in ['x', 'y']:
            if coordinate_out_of_screen(last_element, dimension):
                raise ValueError('last element of the carousel is out of the screen')
    else:
        assert last_element.is_visible() and not first_element.is_visible()


@step('all the cards of the "{element_name}" carousel have the width fitting device full width')
def all_list_elements_have_width_fitting_device_full_width(context, element_name):
    """
    step. Assert that the list visible elements fit the visible width of the device. This means
    that there is no element shown partially. All them are fully visible or fully hidden

    :param context: behave context
    :param element_name: name of the list to check

    """
    element_list = get_element_from_page(context, element_name)

    window_width = context.driver.get_window_size()['width']
    # verify that all elements are fully shown or fully hidden
    for element in element_list:
        element_x = element.web_element.location['x']
        # hidden elements are skipped. Those are the ones having the x coordinate beyond the
        # device window width
        if element_x > window_width:
            continue
        # every element in the list with x < window width must have => x + width < window width
        if element_x + element.web_element.size['width'] >= window_width:
            raise ValueError('some elements in the list are partially rendered')


@step('each element has the "{field}" field displayed in the "{list_element}" list')
def each_element_in_list_has_field(context, field, list_element):
    """
    step. Assert that the elements of the list page elements are displayed
    :param context: behave context
    :param field: field to check in the list. Retrieved from the list page element
    :param list_element: list to check. Retrieved from the list page element
    """
    list_elements = get_element_from_page(context, list_element)
    assert len(list_elements) > 0, f"-'{list_element}'- List not found or length = 0"
    for element in list_elements:
        assert getattr(element, field).is_present(), \
            f"the '{list_element}' list hasn't the '{field}' field displayed"


@step('each element in the "{list_element}" list has the "{field}" textfield with "{expected_text}" text')
@step('each element in the "{list_element}" list has the "{field}" button with "{expected_text}" text')
@step('each element in the "{list_element}" list has the "{field}" link with "{expected_text}" text')
@step('each element in the "{list_element}" list has the "{field}" label with "{expected_text}" text')
def each_element_in_list_has_field_with_text(context, list_element, field, expected_text):
    """
    step. Assert that field in the elements of the list are displayed in the expected text
    :param context: behave context
    :param list_element: list to check
    :param field: textfield field in the list_element
    :param expected_text: expected text of the field
    """
    processed_elements = 6

    element_list = get_element_from_page(context, list_element)
    for index, element in enumerate(element_list):
        if len(field.split(".")) > 1:
            name_list = field.split(".")
            field_element = getattr(element, name_list[0])
            for idx in range(1, len(name_list)):
                field_element = getattr(field_element, name_list[idx])
        else:
            field_element = getattr(element, field)
        assert field_element.text == expected_text, f"'{field_element.text}' of list {field} field doesn't match with" \
                                                    f" the expected text: {expected_text}"
        if index == processed_elements:
            break


@step('each element in "{list_element}" list has the "{field}" textfield with a text '
      'in the "{array_field}" property of any element of the "{array}" array')
def each_element_in_list_has_textfield_matching_any_element_in_array(context, list_element, field, array_field, array):
    """Step. Checks that all elements in a list has certain property matching a value in a an array element

    :param context: behave context
    :param list_element: list to check
    :param field: field in the list to compare
    :param array_field: field in the array to compare
    :param array: array of values to compare to
    """
    element_list = get_element_from_page(context, list_element)
    for element in element_list:
        field_element = getattr(element, field, None)
        if not field_element:
            raise AttributeError(f'field {field} not found in {list_element} list')
        if any(field_element.text == array_element[array_field] for array_element in array):
            continue
        raise ValueError(
            f"'{field_element.text}' of list {field} field not found in any {array_field} element of {array} array")


@step('any element in "{list_element}" list has the "{field}" textfield with a text '
      'in the "{array_field}" property of any element of the "{array}" array')
def any_element_in_list_has_textfield_matching_any_element_in_array(context, list_element, field, array_field, array):
    """Step. Checks that any element in a list has certain property matching a value in a an array element

    :param context: behave context
    :param list_element: list to check
    :param field: field in the list to compare
    :param array_field: field in the array to compare
    :param array: array of values to compare to
    """
    element_list = get_element_from_page(context, list_element)
    for element in element_list:
        field_element = getattr(element, field, None)
        if not field_element:
            raise AttributeError(f'field {field} not found in {list_element} list')
        if any(field_element.text == array_element[array_field] for array_element in array):
            return
    raise ValueError(f'not all elements in "{list_element}" list are found in {array} array')


@step('any element in "{elements_list}" list has an element in the "{elements_sublist}" '
      'sublist with "{expected_text}" text')
def any_element_in_list_has_sublist_with_field_matching_text(context, elements_list, elements_sublist, expected_text):
    """Step. Checks that any element in a list an element in a list matching an expected text.
        The sublist is made of an element derived from PageElements class.

    :param context: behave context
    :param elements_list: parent list to check
    :param elements_sublist: sublist element within an element in the parent list to compare
    :param expected_text: text to compare
    """
    elements_list = get_element_from_page(context, elements_list)
    found = False

    for element in elements_list:
        sublist = getattr(element, elements_sublist)
        for item in sublist:
            if item.text == expected_text:
                found = True
                break
        if found:
            break

    assert found, f"No element in '{elements_list}' has an element in the\
        '{elements_sublist}' containing the expected text"


@step('no element in "{list_element}" list has the "{field}" textfield with a text '
      'in the "{array_field}" property of any element of the "{array}" array')
def no_element_in_list_has_textfield_matching_any_element_in_array(context, list_element, field, array_field, array):
    """Step. Checks that no element in a list has certain property matching a value in a an array element

    :param context: behave context
    :param list_element: list to check
    :param field: field in the list to compare
    :param array_field: field in the array to compare
    :param array: array of values to compare to
    """
    element_list = get_element_from_page(context, list_element)
    for element in element_list:
        field_element = getattr(element, field, None)
        if not field_element:
            raise AttributeError(f'field {field} not found in {list_element} list')
        if any(field_element.text == array_element[array_field] for array_element in array):
            raise ValueError(f'any element of "{list_element}" list is found in {array} array')


@step('no element in the "{list_elements}" list has the value "{text}" in the "{field_name}" field')
def no_element_in_list_with_text_in_field(context, list_elements, text, field_name):
    """
    step. Asserts that no element in the element_name list with the text in the field_name

    :param context: behave context
    :param list_elements: element name of the list
    :param text: text of the field
    :param field_name: name of the field in the elements of the list
    """
    element_list = get_element_from_page(context, list_elements)
    for element in element_list:
        # TODO(robertomier): set_focus is not working properly in iOS, so this step works in iOS as far as list elements
        # are all they visible
        # https://jira.tid.es/browse/NOV-237379
        if not context.driver_wrapper.is_ios_test():
            element.set_focus()
        field_element = getattr(element, field_name, None)
        if not field_element:
            continue
        if text in field_element.text:
            raise AssertionError(f"'There is elements in the '{list_elements}' list with '{field_name}' field "
                                 f"that contains the '{text}'")


@step('no element in the "{list_elements}" list matches the value "{text}" in the "{field_name}" field')
def no_element_in_list_matches_text_in_field(context, list_elements, text, field_name):
    """
    step. Asserts that no element in the element_name list matches the text in the field_name

    :param context: behave context
    :param list_elements: element name of the list
    :param text: text of the field
    :param field_name: name of the field in the elements of the list
    """
    element_list = get_element_from_page(context, list_elements)
    for element in element_list:
        field_element = getattr(element, field_name, None)
        if not field_element:
            continue
        if text == field_element.text:
            raise AssertionError(f"'There is elements in the '{list_elements}' list with '{field_name}' field "
                                 f"that matches the '{text}'")


@step('no element in the "{elements_list}" list has the "{elements_sublist}" sublist')
def no_element_in_list_has_sublist(context, elements_list, elements_sublist):
    """Step. Checks that no element in a list of elements contains a given element of type list.

    :param context: behave context
    :param elements_list: parent list to check
    :param elements_sublist: sublist element within an element in the parent list to compare
    """
    elements_list = get_element_from_page(context, elements_list)

    for element in elements_list:
        sublist = getattr(element, elements_sublist)
        assert len(sublist) ==  0, f"Found an element in '{elements_list}' showing the\
        '{elements_sublist}"


@step('any element in the "{list_elements}" list has the "{field}" textfield with the "{expected_text}" text')
@step('any element in the "{list_elements}" list has the "{field}" button with the "{expected_text}" text')
@step('any element in the "{list_elements}" list has the "{field}" link with the "{expected_text}" text')
@step('any element in the "{list_elements}" carousel has the "{field}" field with "{expected_text}" text')
@step('any card in the "{list_elements}" carousel has the "{field}" field with "{expected_text}" text')
def the_element_in_list_has_field_with_text(context, list_elements, field, expected_text):
    """
        step. Assert that field in one of the elements of the list are displayed in the expected text
        :param context: behave context
        :param list_elements: list to check
        :param field: textfield field in the list_element
        :param expected_text: expected text of the field
        """
    element_list = get_element_from_page(context, list_elements)
    for element in element_list:
        try:
            if field not in element.__dict__:
                raise ValueError(f'field {field} not found in element')
            field_element = getattr(element, field)
            if field_element.text == expected_text:
                return
        except (AttributeError, NoSuchElementException):
            continue
    raise ValueError(f"the {field} field of the list elements is not present or doesn't match with the expected text: "
                     f"{expected_text}")


@step('each element in the "{list_element}" list has the "{field}" textfield with the "{regular_expression}" format')
@step('the "{list_element}" graph has the "{field}" field with the "{regular_expression}" format')
def each_element_in_list_has_field_with_format(context, list_element, field, regular_expression):
    """
    step. Assert that field in the elements of the list are displayed in the expected format
    :param context: behave context
    :param list_element: list to check
    :param field: textfield field in the list_element
    :param regular_expression: regular_expression of the textfield field
    """
    processed_elements = 6

    element_list = get_element_from_page(context, list_element)
    for index, element in enumerate(element_list):
        field_element = getattr(element, field)
        assert re.match(regular_expression, field_element.text), f"'{field_element.text}' of list {field} field " \
                                                                 f"doesn't match with the regular expresion:" \
                                                                 f" {regular_expression}"
        if context.driver_wrapper.is_mobile_test() and index == processed_elements:
            break


def _the_edge_element_of_the_dropdown_is_selected(context, drop_down, edge):
    """
    Helper. Assert that the lower/higher element of the dropdown is selected
    :param context: behave context
    :param drop_down: the drop down to evaluate
    :param edge: could take the 'lowest' or 'highest' value
    """
    compare = {
        'lowest': lambda a, b:  a < b,
        'highest': lambda a, b: a > b,
    }[edge]

    select = Select(get_element_from_page(context, drop_down).web_element)
    reference = None
    for option in select.options:
        if not option.text:  # skip empty options
            continue
        if reference is None or compare(option.text, reference):
            reference = option.text

    selected = select.first_selected_option.text
    assert reference == selected, \
        f'Not selected the {edge} option of the {drop_down} list. ' \
        f'Selected \'{selected}\' when it should be \'{reference}\''


@step('the lowest element of the "{drop_down}" drop-down is selected')
def the_lowest_element_of_the_dropdown_is_selected(context, drop_down):
    """
    Step. Assert that the lowest element of the dropdown is selected
    :param context: behave context
    :param drop_down: the drop down to evaluate
    """
    _the_edge_element_of_the_dropdown_is_selected(context, drop_down, 'lowest')


@step('the highest element of the "{drop_down}" drop-down is selected')
def the_highest_element_of_the_dropdown_is_selected(context, drop_down):
    """
    Step. Assert that the highest element of the dropdown is selected
    :param context: behave context
    :param drop_down: the drop down to evaluate
    """
    _the_edge_element_of_the_dropdown_is_selected(context, drop_down, 'highest')


@step('the elements in the "{list_element}" list are ordered by "{field}" date field with '
      'format "{date_format}" and locale time "{locale_time}" descendant')
def elements_in_list_are_ordered_by_field_value_in_locale_descendant(context,
                                                                     list_element,
                                                                     field,
                                                                     date_format,
                                                                     locale_time):
    """
    Step. Assert that the list_element is sorted descendant as per field
    :param context: behave context
    :param list_element: list to check
    :param field: the field that must be sorted
    :param date_format: the format of the field considered as date
    :param locale_time: the locale time to use for the date format. Default not set
    """
    element_list = get_element_from_page(context, list_element)
    previous = None
    for element in element_list:
        field_element = getattr(element, field)
        display_element_on_screen(field_element)
        with LocaleManager(locale_time):
            date = datetime.datetime.strptime(field_element.text, date_format)

        if not previous:
            previous = date
            continue
        assert previous >= date, f"'Elements in '{list_element}' are not ordered by {field}"
        previous = date


@step('the elements in the "{list_element}" list are ordered by "{field}" date field with format "{date_format}"')
def elements_in_list_are_ordered_by_field_value(context, list_element, field, date_format):
    """
    Step. Assert that the list_element is sorted as per field
    :param context: behave context
    :param list_element: list to check
    :param field: the field that must be sorted
    :param date_format: the format of the field considered as date
    """
    element_list = get_element_from_page(context, list_element)
    previous = None
    for _, element in enumerate(element_list):
        field_element = getattr(element, field)
        display_element_on_screen(field_element)
        date = datetime.datetime.strptime(field_element.text, date_format)
        if not previous:
            previous = date
            continue
        assert previous <= date, f"'Elements in '{list_element}' are not ordered by {field}"
        previous = date


@step('the elements in the "{list_element}" list are ordered by date descendant')
def elements_in_list_are_ordered_by_date(context, list_element):
    """
    Step. Assert that the list_element list has the elements ordered by date
    :param context: behave context
    :param list_element: list to check
    """
    element_list = get_element_from_page(context, list_element)
    previous = None
    for element in element_list:
        element = getattr(element, 'date')
        display_element_on_screen(element)
        date = datetime.datetime.strptime(element.text, '%d/%m/%Y')
        if not previous:
            previous = date
        else:
            assert previous > date, f"'Elements in '{list_element}' are not ordered by date "


@step('the elements in the "{list_element}" list are ordered by month descendant')
def elements_in_list_are_ordered_by_month(context, list_element):
    """
    Step. Assert that the list_element list has the elements ordered by month
    :param context: behave context
    :param list_element: list to check
    """
    locale.setlocale(locale.LC_TIME, 'de_DE.UTF-8')
    element_list = get_element_from_page(context, list_element)
    previous = None
    for element in element_list:
        element = getattr(element, 'date')
        display_element_on_screen(element)
        date = datetime.datetime.strptime(element.text, '%B %Y')
        if not previous:
            previous = date
        else:
            assert previous > date, f"'Elements in '{list_element}' are not ordered by month "


@step('each element in the "{list_element}" list has the "{field}" field matching the selection in "{drop_down}" '
      'drop-down')
def check_elements_in_list_correspond_selected_year(context, list_element, field, drop_down):
    """
    step. Assert that the list displays only elements of the selected year
    :param context: behave context
    :param list_element: list to check
    :param field: field to match the selection
    :param drop_down: drop down element
    """
    selection = Select(get_element_from_page(context, drop_down).web_element).first_selected_option.text

    element_list = get_element_from_page(context, list_element)
    for _, element in enumerate(element_list):
        element_field = getattr(element, field)
        display_element_on_screen(element_field)
        assert selection in element_field.text, \
            f'Found element in {list_element} list whose {field} field ' \
            f'does not have \'{selection}\' in its value: {element_field.text}'


@step('the "{textfield_element}" field with "{text}" text element in the "{list_element}" list has the "{field}" icon')
def list_element_with_text_in_field_has_field(context, textfield_element, text, list_element, field):
    """
    step. Assert that list element with text has a field displayed
    :param context: behave context
    :param textfield_element: field element that should contain identifiable text
    :param text: text to identify list element to check
    :param list_element: list to check
    :param field: expected field that should be displayed
    """
    element_list = get_element_from_page(context, list_element)
    for item in enumerate(element_list):
        element = item[1]
        field_element = getattr(element, textfield_element)
        display_element_on_screen(field_element)
        if field_element.text == text:
            assert getattr(element, field).is_present(), f"list element with '{text}' in the {textfield_element} " \
                                                         f"does not have a {field} field"


@step('the elements in the "{list_element}" list with "{field}" are clickable')
def list_elements_with_field_are_clickable(context, list_element, field):
    """
    step. Assert that list elements that have field are clickable
    """
    element_list = get_element_from_page(context, list_element)
    for item in enumerate(element_list):
        element = item[1]
        field_element = getattr(element, field)
        if field_element.is_present():
            if field_element.webview:
                tag_name = element.web_element.tag_name
                assert tag_name == 'a', f"the element of {list_element} list with the {field} field is not clickable"
            else:
                raise NotImplementedError("Method not implemented yet")


@step('the "{element_list}" list has the "{expected_texts}" textfields in the "{field}" field')
def list_has_textfields_in_field(context, element_list, expected_texts, field):
    """
    step. Asserts the text in the field with the param index for a list of groups
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param field: field in the group
    :param expected_texts: list of the expected texts in the field
    """
    element_list = get_element_from_page(context, element_list)
    found_texts = []
    not_found_texts = []
    list_texts = []
    for element in element_list:
        display_element_on_screen(element)
        field_element = getattr(element, field)
        list_texts.append(field_element.text)
    for expected_text in expected_texts.split(';'):
        if expected_text in list_texts:
            found_texts.append(expected_text)
        else:
            not_found_texts.append(expected_text)

    assert len(found_texts) == len(expected_texts.split(';')), \
        f"'{field}' field not contains the texts: {not_found_texts}"


@step('any element in the "{element_list}" list has the "{element_name}" field')
def any_element_in_groups_list_has_field(context, element_list, element_name):
    """
    step. Asserts if any element in the list has the element_name element
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param element_name: name of the element to locate for each element in the group
    """
    element_list = get_element_from_page(context, element_list)
    for element in element_list:
        try:
            field_element = getattr(element, element_name)
            if field_element.is_present():
                return
        except NoSuchElementException:
            continue

    raise ValueError(f"no element with {element_name} field of the list")


@step('any element in the "{list_elements}" list has the "{field}" textfield with the "{regular_expression}" format')
@step('any element in the "{list_elements}" carousel has the "{field}" textfield with '
      'the "{regular_expression}" format')
@step('any element in the "{list_elements}" carousel has the "{field}" field with "{regular_expression}" format')
@step('any card in the "{list_elements}" carousel has the "{field}" field with "{regular_expression}" format')
def any_element_in_list_has_field_with_text(context, list_elements, field, regular_expression):
    """
        step. Assert that field in one of the elements of the list are displayed with the expected format
        :param context: behave context
        :param list_elements: list to check
        :param field: textfield field in the list_element
        :param regular_expression: expected format of the field
        """
    element_list = get_element_from_page(context, list_elements)
    for element in element_list:
        try:
            field_element = getattr(element, field)
            if re.match(regular_expression, field_element.text):
                return
        except NoSuchElementException:
            continue
    raise ValueError(f"no {field} field of the list elements match with the regular expresion: {regular_expression}")


@step('the element in the "{list_element}" list with text "{element_text}" in the "{textfield_element}" textfield does '
      'not have the "{list_field}" field')
def element_with_text_does_not_have_field(context, list_element, element_text, textfield_element, list_field):
    """
    Assert that a specific element in list found by text does not have a certain field
    :param context: Behave context
    :param list_element: list to check
    :param element_text: text of the element in the list to check
    :param textfield_element: textfield element in the list to include element_text text
    :param list_field: field in list no to be displayed
    """
    element_list = get_element_from_page(context, list_element)
    for element in element_list:
        try:
            field_element = getattr(element, textfield_element)
            if field_element.text == element_text:
                assert not getattr(element, list_field).is_present(), \
                    'The {} field is displayed in the "{}" element of the list'.format(list_field, element_text)
        except NoSuchElementException:
            raise ValueError(f"The {textfield_element} is not found in the {list_element}")


@step('each element in the "{element_list}" list does not have the "{element_name}" field')
def each_element_in_groups_list_does_not_have_field(context, element_list, element_name):
    """
    step. Asserts each element in the list does not have the element_name element
    A swipe action has been added due to the element could not be visible in the screen.
    Method is_present() is used to avoid errors when the element has the property visible set to false
    For native context As in IOS all pagelements will be retrieved even the ones not visible in the screen and
    the list might be long, and processing it is slow due to the mechanism is based in XPATH,
    a threshold has been defined in the variable processed_elements.
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param element_name: name of the element to locate for each element in the group
    """
    processed_elements = 0
    native = False
    try:
        if "NATIVE" in context.driver.context:
            native = True
            processed_elements = 4
    except AttributeError:
        pass
    scrolled = False

    element_list = get_element_from_page(context, element_list)

    for index, element in enumerate(element_list):
        group_member = getattr(element, element_name)
        if not group_member.is_present() and native:
            # doing scroll in case is in the list element but not displayed
            context.driver.swipe(0, 500, 0, 200, 250)
            scrolled = True
        assert not group_member.is_present(), f"'{element_name}' field is present in the {element_list} list"

        if native and index == processed_elements:
            break

    if scrolled:
        # swipe up to leave the screen in the same position
        context.driver.swipe(
            start_x=context.driver.get_window_size()['width'] / 2,
            start_y=context.driver.get_window_size()['height'] * 0.20,
            end_x=context.driver.get_window_size()['width'] / 2,
            end_y=context.driver.get_window_size()['height'] * 0.80,
            duration=250,
        )


@step('the element with "{text}" text on the "{field}" field is displayed in the "{element_list}" list')
def check_text_not_in_list(context, text, field, element_list):
    """
    step. Assert that a text is displayed on the carousel
    :param context: behave context
    :param text: text to check
    :param field: field to check in the list
    :param element_list: list to check
    """
    list_module = get_element_from_page(context, element_list)
    assert len(list_module) > 0, f"-'{element_list}'- list not found or length = 0"
    for card in list_module:
        real_text = getattr(card, field).text
        if text.lower() in real_text.lower():
            return
    raise Exception(f"-'{text}'- is not displayed on any position of the '{element_list}' list")


@step('the element with "{text}" text on the "{field}" field in the "{element_list}" list has the '
      '"{other_field}" field')
def check_field_is_displayed_in_element_list(context, text, field, element_list, other_field):
    """
    step. Assert that a text is displayed on the desired card of the list
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param element_list: list to check
    :param other_field: field to check in the card
    """
    list_module = get_element_from_page(context, element_list)
    assert len(list_module) > 0, f"-'{element_list}'- list not found or length = 0"
    for card in list_module:
        real_text = getattr(card, field).text
        if text.lower() in real_text.lower():
            assert getattr(card, other_field), f"-'{other_field}'- field of the element with -'{text}'- " \
                                               f"text in the -'{field}'- is not displayed"


@step('the element with "{text}" text on the "{field}" field in the "{element_list}" list has not the '
      '"{other_field}" field')
def check_field_is_not_displayed_in_element_list(context, text, field, element_list, other_field):
    """
    step. Assert that a text is not displayed on the desired card of the list
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param element_list: list to check
    :param other_field: field to check in the card
    """
    list_module = get_element_from_page(context, element_list)
    assert len(list_module) > 0, f"-'{element_list}'- list not found or length = 0"
    for card in list_module:
        real_text = getattr(card, field).text
        if text.lower() in real_text.lower():
            assert not getattr(card, other_field), f"-'{other_field}'- field of the element with -'{text}'- " \
                f"text in the -'{field}'- is not displayed"


@step('the element with "{text}" text on the "{field}" field in the "{element_list}" list has the '
      '"{other_field}" field with "{other_text}" text')
def check_text_in_list_with_other_text(context, text, field, element_list, other_field, other_text):
    """
    step. Assert that a text is displayed on the desired card of the list
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param element_list: list to check
    :param other_text: text to check in the other field
    :param other_field: field to check in the card
    """
    list_module = get_element_from_page(context, element_list)
    assert len(list_module) > 0, f"-'{element_list}'- list not found or length = 0"
    for card in list_module:
        real_text = getattr(card, field).text
        if text.lower() in real_text.lower():
            other_real_text = getattr(card, other_field).text.replace("\n", "").replace(' ', ' ')
            if other_text not in other_real_text:
                raise Exception(f"-'{other_text}'- is not displayed in the -'{other_field}'- field of the "
                                f"card with -'{text}'- text in the -'{field}'-")


@step('the element with "{text}" text on the "{field}" field in the "{element_list}" list has the '
      '"{other_field}" field with the "{regular_expression}" format')
def check_format_in_list_with_other_text(context, text, field, element_list, other_field, regular_expression):
    """
    step. Assert that a text matches the given regular expression on the desired card of the list
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param element_list: list to check
    :param regular_expression: regular expression to match
    :param other_field: field to check in the card
    """
    list_module = get_element_from_page(context, element_list)
    assert len(list_module) > 0, f"-'{element_list}'- list not found or length = 0"
    for card in list_module:
        real_text = getattr(card, field).text
        if text.lower() in real_text.lower():
            other_real_text = getattr(card, other_field).text.replace("\n", "").replace(' ', ' ')
            if not re.match(regular_expression, other_real_text):
                raise Exception(f"'{other_real_text}' doesn't match with the regular expresion: {regular_expression}")
            return
    raise Exception(f"-'{text}'- is not displayed on any position of the '{element_list}' list")


@step('the "{field}" field of any element in the "{element_list}" list '
      'contains the display name of the current subscription')
def list_element_matches_current_subscription_display_name(context, field, element_list):
    """
    Step. Check if any element in element_list matches de current subscription display name
    The given field of the elements in the element_list must match the display name of the
    current subscription

    :param context: behave context
    :param field: the field to compare the display name of current subscription
    :param element_list: the name of the list of elements
    """
    display_name = AusHelper.get_helper(context).get_plan_display_name(
        context.features_agreement.get_default(),
    )

    element_list = get_element_from_page(context, element_list)
    for element in element_list:
        try:
            field_element = getattr(element, field)
            if field_element.is_present() and display_name in field_element.text:
                return
        except NoSuchElementException:
            continue

    raise ValueError(f"no element with {field} field of the list matches the current subscription display name")


@step('each element in the "{element_list}" list has the "{field}" field matching a subscription display name')
def each_element_in_list_has_field_matching_subscription_display_name(context, element_list, field):
    """
    Step. Check if each element in element_list matches any of the user subscriptions display name

    :param context: behave context
    :param element_list: the name of the list of elements
    :param field: the field to compare the display name of current subscription
    """
    element_list = get_element_from_page(context, element_list)
    for element in element_list:
        try:
            field_element = getattr(element, field)
            if field_element.is_present():
                for display_name in AusHelper.get_helper(context).get_all_plans_display_name():
                    if display_name in field_element.text:
                        break
                else:
                    raise ValueError(
                        f"no element of the list has its {field} field including the '{display_name}' display name")
        except NoSuchElementException:
            continue


@step('each subscription display name matches the "{field}" field of any element in "{element_list}" list')
def each_subscription_display_name_matches_the_field_of_any_element_in_list(context, field, element_list):
    """
    Step. Check if each subscription display name matches the given field of any element in element_list

    :param context: behave context
    :param field: the field to compare the display name of current subscription
    :param element_list: the name of the list of elements
    """
    element_list = get_element_from_page(context, element_list)
    for display_name in AusHelper.get_helper(context).get_all_plans_display_name():
        for element in element_list:
            try:
                field_element = getattr(element, field)
                if field_element.is_present() and display_name in field_element.text:
                    break
            except NoSuchElementException:
                continue
        else:
            raise ValueError(f"no element of the list has its {field} field matching the '{display_name}' display name")

"""
Common assertions steps
"""
import re

from behave import step as behave_step  # noqa: F401

from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.wait import WebDriverWait

from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.common.utils import utils


@step('the "{carousel}" web carousel has "{number}" elements')
@step('the "{carousel}" web carousel has "{number}" cards')
def carousel_has_number_elements(context, carousel, number):
    """
    step. Assert that the element list passed as parameter has the correct number of elements

    :param context: behave context
    :param carousel: name of the list
    :param number: expected number of elements
    """
    if not utils.is_valid_numeric_expression(number):
        raise ValueError("Value {} to check is not valid".format(number))

    expected_number = int(''.join(re.findall(r'\d+', number)))
    expected_operator = ''.join(re.findall(r'\D+', number))

    element = context.get_element_from_current_page(carousel).page_elements

    if expected_operator == '>':
        assert len(element) > expected_number, \
                                        f"'{len(element)}' items found out of the '>{expected_number}' expected"
    elif expected_operator == '<':
        assert len(element) < expected_number, \
                                        f"'{len(element)}' items found out of the '<{expected_number}' expected"
    elif expected_operator == '<=':
        assert len(element) <= expected_number, \
                                        f"'{len(element)}' items found out of the '<={expected_number}' expected"
    elif expected_operator == '>=':
        assert len(element) >= expected_number, \
                                        f"'{len(element)}' items found out of the '>={expected_number}' expected"
    elif not expected_operator:
        assert len(element) == expected_number, \
                                        f"'{len(element)}' items found out of the '{expected_number}' expected"


@step('I store the text value in "{index}" position of the "{element_name}" in "{carousel_name}" web carousel in the '
      'context storage with key "{key}"')
def save_in_context_attribute_from_web_carrousel(context, index, element_name, carousel_name, key):
    """
    step. Save the content of the web carousel image alternative text in context

    :param context: behave context
    :param index: index of the element to save
    :param element_name: element of the carousel to pick
    :param carousel_name: carousel to pick
    :param key: name of the key that is stored in the context
    """
    card = context.get_element_from_current_page(carousel_name)
    element = getattr(card[int(index)], element_name).web_element

    context.storage[key] = element.text


@step('I store the length of the items in "{element_name}" list in the context storage with key "{key}"')
def save_in_context_attribute_size_from_list(context, element_name, key):
    """
    step. Save the size of the list in context

    :param context: behave context
    :param element_name: element of the list
    :param key: name of the key that is stored in the context
    """
    elements_list = context.get_element_from_current_page(element_name)

    context.storage[key] = len(elements_list.page_elements)


@step(u'the "{field}" field on the "{index}" element in the "{element_name}" list is not selected')
def field_element_in_list_is_not_selected(context, field, index, element_name):
    """
    step. Assert that the element with given index in the list is not selected

    :param context: behave context
    :param field: field to check
    :param index: index
    :param element_name: list of elements
    """
    element = context.get_element_from_current_page(element_name)
    index = int(index)
    selected = getattr(element.page_elements[index], field).get_attribute('aria-checked')
    assert selected == 'false', u'"{}" is selected'.format(element)


@step(u'the "{field}" field on the "{index}" element in the "{element_name}" list is selected')
def field_element_in_list_is_selected(context, field, index, element_name):
    """
    step. Assert that the element with given index in the list is selected

    :param context: behave context
    :param field: field to check
    :param index: index
    :param element_name: list of elements
    """
    element = context.get_element_from_current_page(element_name)
    index = int(index)
    selected = getattr(element.page_elements[index], field).get_attribute('aria-checked')
    assert selected == 'true', u'"{}" is not selected'.format(element)


@step('the "{element}" checkbox is disabled')
def element_is_disabled(context, element):
    """
    step. Assert that element is disabled.

    :param context: behave context
    :param element: element
    """
    checked = context.get_element_from_current_page(element).get_attribute('aria-checked')
    assert checked == 'false', u'"{}" is disabled'.format(element)


@step('the "{element}" checkbox is enabled')
@step('the "{element}" element is selected')
def element_is_enabled(context, element):
    """
    step. Assert that element is enabled.

    :param context: behave context
    :param element: element
    """
    checked = context.get_element_from_current_page(element).get_attribute('aria-checked')
    assert checked == 'true', u'"{}" is disabled'.format(element)


@step('the text of the web element "{element}" contains "{expected_message}"')
def text_web_element_contains_expected_message(context, element, expected_message):
    """
    Step. Assert: Checks if the given message is contained in the text of the WebElement.

    :param context: Behave Context.
    :param element: WebElement name.
    :param expected_message: Text message to check.
    """
    element = context.get_element_from_current_page(element)
    current_text = element.web_element.text

    assert expected_message in current_text, u'Element "{element}" text not contains "{expected}". ' \
                                             u'Current value: {current}'.\
        format(element=element, expected=expected_message, current=current_text)


@step('the text of the web element "{element}" is equal to "{expected_message}"')
def text_web_element_equal_to_expected_message(context, element, expected_message):
    """
    Step. Checks if the given message is equal to the text of the WebElement.

    :param context: Behave Context.
    :param element: WebElement name.
    :param expected_message: Text message to check.
    """
    element = context.get_element_from_current_page(element)
    current_text = element.web_element.text

    assert expected_message == current_text, u'Element "{element}" text is not equal to "{expected}". ' \
                                             u'Current value: {current}'.\
        format(element=element, expected=expected_message, current=current_text)


@step('the text of the element "{element_name}" has the "{regular_expression}" format')
def element_has_the_format_text(context, element_name, regular_expression):
    """
    step. Assert that the element passed as parameter matches the provided regular expression.

    :param context: behave context
    :param element_name: name of the element to check
    :param regular_expression: regular_expression of the expected text
    """
    element = context.get_element_from_current_page(element_name)
    assert re.match(regular_expression, element.text), f"'{element.text}' " \
                                                       f"doesn't match with the regular expresion: {regular_expression}"


@step('the PDF viewer is opened in browser')
def pdf_file_opened_in_browser(context):
    """
    Step. Assert that the pdf file is opened
    :param context: behave context
    """
    page_source = context.driver.page_source
    expected_text = 'type="application/pdf"'
    if 'firefox' in map_param('[TOOLIUM:Driver_type]'):
        expected_text = 'pdf'
    assert expected_text in page_source, u'PDF viewer not opened'


@step('the element in "{index}" position in the "{element_name}" list with "{expected_text}" text is displayed')
def element_index_has_the_text(context, index, element_name, expected_text):
    """
    step. Assert that the element in given position of the list is equal to the expected text

    :param context: behave context
    :param index: index for the list
    :param element_name: name of the list
    :param expected_text: expected text
    """
    element_list = context.get_element_from_current_page(element_name)
    element = element_list[int(index)]
    element_text = element.web_element.text
    assert expected_text in element_text, f"'{element_text}' does not contain {expected_text}"


@step('the item with "{value}" text in "{field1}" field in the "{element_list}" list has the "{field2}" field with '
      '"{expected_text}" text')
def item_with_value_in_list_has_expected_text(context, value, field1, element_list, field2, expected_text):
    """
    step. Asserts the text in the field for an item that contains a given text in a different field within a list.
    :param context: behave context
    :param value: value to lookup the item in list
    :param field1: field to lookup the item in list
    :param element_list: list of elements
    :param field2: field to check the expected text
    :param expected_text: expected text in the field
    """
    elements = context.get_element_from_current_page(element_list)
    for element in elements:
        if value in getattr(element, field1).text:
            field_element = getattr(element, field2)
            assert expected_text.lower() == field_element.text.lower(), \
                f"'{field_element.text}' not contains the text: {expected_text}"
            return
    raise AssertionError(f"No item with the -'{expected_text}'- text in the '{field2}' field of the '{list}' list")


@step('the item with "{value}" text in "{field1}" field in the "{element_list}" list has the "{expected_field}" field')
def item_with_value_in_list_has_expected_field(context, value, field1, element_list, expected_field):
    """
    step. Asserts the field for an item that contains a given text in a different field within a list.
    :param context: behave context
    :param value: value to lookup the item in list
    :param field1: field to lookup the item in list
    :param element_list: list of elements
    :param expected_field: expected field
    """
    elements = context.get_element_from_current_page(element_list)
    for element in elements:
        if value in getattr(element, field1).text:
            field_element = getattr(element, expected_field)
            field_element.web_element.is_displayed()
            return
    raise AssertionError(f"No -'{expected_field}'- field in the item with '{value}' value in the '{field1}' field "
                         f"of the '{element_list}' list")


@step('the item with "{value}" text in "{field1}" field in the "{element_list}" list has the "{field2}" field with '
      'a text different from "{expected_text}"')
def item_with_value_in_list_has_not_expected_text(context, value, field1, element_list, field2, expected_text):
    """
    step. Checks that the text in the field is different for an item that contains a given text in a different
    field within a list.
    :param context: behave context
    :param value: value to lookup the item in list
    :param field1: field to lookup the item in list
    :param element_list: list of elements
    :param field2: field to check the expected text
    :param expected_text: expected text in the field
    """
    elements = context.get_element_from_current_page(element_list)
    for element in elements:
        if value in getattr(element, field1).text:
            field_element = getattr(element, field2)
            assert expected_text != field_element.text, f"'{field_element.text}' contains the text: {expected_text}"
            return
    raise AssertionError(f"No item with the -'{value}'- text in the '{field1}' field of the '{list}' list")


@step('the item with "{value}" text in the "{attribute}" attribute of "{field1}" field in the "{element_list}" list '
      'has the "{field2}" field with a text different from "{expected_text}"')
def item_with_value_in_attribute_in_list_has_not_expected_text(context, value, attribute, field1, element_list, field2,
                                                               expected_text):
    """
    step. Checks that the text in the field is different for an item that contains a given text in a different
    field within a list.
    :param context: behave context
    :param value: value to lookup the item in list
    :param attribute: attribute to lookup in field1 argument
    :param field1: field to lookup the item in list
    :param element_list: list of elements
    :param field2: field to check the expected text
    :param expected_text: expected text in the field
    """
    elements = context.get_element_from_current_page(element_list)
    for element in elements:
        field = getattr(element, field1)
        if str(value) in getattr(field, attribute):
            field_element = getattr(element, field2)
            assert expected_text != field_element.text, f"'{field_element.text}' contains the text: {expected_text}"
            return
    raise AssertionError(f"No item with the -'{value}'- text in the '{attribute}' attribute '{field1}' field of the "
                         f"'{list}' list")


@step('the item with "{value}" text in the "{attribute}" attribute of "{field1}" field in the "{element_list}" list '
      'has the "{field2}" field with "{expected_text}" text')
def item_with_value_in_attribute_in_list_has_expected_text(context, value, attribute, field1, element_list, field2,
                                                           expected_text):
    """
    step. Asserts the text in the field for an item that contains a given text in a different field within a list.
    :param context: behave context
    :param value: value to lookup the item in list
    :param attribute: attribute to lookup in field1 argument
    :param field1: field to lookup the item in list
    :param element_list: list of elements
    :param field2: field to check the expected text
    :param expected_text: expected text in the field
    """
    elements = context.get_element_from_current_page(element_list)
    for element in elements:
        field = getattr(element, field1)
        if str(value) in getattr(field, attribute):
            field_element = getattr(element, field2)
            assert expected_text.lower() == field_element.text.lower(), \
                f"'{field_element.text}' not contains the text: {expected_text}"
            return
    raise AssertionError(f"No item with the -'{expected_text}'- text in the '{field2}' field of the '{list}' list")


@step('the item with "{value}" text in "{field}" field in the "{element_list}" list is not displayed')
def item_with_value_in_list_not_displayed(context, value, field, element_list):
    """
    step. Asserts that the item with given text in the field is not displayed.
    :param context: behave context
    :param value: value to lookup the item in list
    :param field: field to lookup the item in list
    :param element_list: list of elements
    """
    elements = context.get_element_from_current_page(element_list)
    for element in elements:
        if value in getattr(element, field).text:
            raise AssertionError(f"Item with -'{value}'- text in the '{field}' field of the '{list}' list is displayed")


@step('the "{element_name}" textfield with any of the "{expected_texts}" texts is displayed')
def element_has_any_of_the_texts(context, element_name, expected_texts):
    """
    step. Assert that the element passed as parameter has any of the expected texts

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_texts: list expected text separated by ";"
    """
    element = context.get_element_from_current_page(element_name)
    assert element.text in expected_texts.split(";"), \
        f"'{element.text}' not contains any of the texts: {expected_texts}"


@step('the "{element_name}" textfield containing at least any of the "{expected_texts}" texts is displayed')
def element_contains_at_least_any_of_the_texts(context, element_name, expected_texts):
    """
    step. Assert that the element passed as parameter contains at least any of the expected texts

    :param context: behave context
    :param element_name: name of the element to check
    :param expected_texts: list expected text separated by ";"
    """
    element = context.get_element_from_current_page(element_name)
    match = [text for text in expected_texts.split(";") if text in element.text]
    if not match:
        raise AssertionError(f"None of the '{expected_texts}' texts found in '{element_name.text}'")


@step('each element in the "{element_list}" web list has the "{field}" field')
def each_element_in_groups_list_has_field(context, element_list, field):
    """
    step. Asserts each element in the web list has the element_name element
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param field: name of the element to locate for each element in the group
    """
    element_list = context.get_element_from_current_page(element_list)
    for element in element_list:
        field_element = getattr(element, field)
        assert field_element.is_present()


@step('each element in the "{element_list}" web list has the "{field}" field with "{value}" value')
def each_element_in_groups_list_has_field_with_value(context, element_list, field, value):
    """
    step. Asserts each element in the web list has the element_name element
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param field: name of the element to locate for each element in the group
    :param value: value to check in the field
    """
    element_list = context.get_element_from_current_page(element_list)
    for element in element_list:
        context.driver.execute_script("arguments[0].scrollIntoView();", element.web_element)
        field_element = getattr(element, field)
        assert field_element.web_element.text == value, f"'{field_element.web_element.text}' not equal to '{value}'"


@step('the text of the "{field}" field in the element "{element_name}" is equal to "{expected_message}"')
def text_field_web_element_equal_to_expected_message(context, field, element_name, expected_message):
    """
    Step. Checks if the given message is equal to the text of the field in the element.

    :param context: Behave Context.
    :param field: field in the element.
    :param element_name: WebElement name.
    :param expected_message: Text message to check.
    """
    element = context.get_element_from_current_page(element_name)
    field_element = getattr(element, field)
    current_text = field_element.web_element.text

    assert expected_message == current_text, u'"{element}"."{field}" text is not equal to "{expected}". ' \
                                             u'Current value: {current}'.\
        format(element=element_name, field=field, expected=expected_message, current=current_text)


@step('the "{element}" element has the "{field}" field')
def element_group_has_field(context, element, field):
    """
    step. Asserts element has the required field
    :param context: behave context
    :param element: element to the check the field
    :param field: name of the field to locate in the element
    """
    element = context.get_element_from_current_page(element)
    field_element = getattr(element, field)
    assert field_element.is_present()


@step('the "{field}" field in the "{element}" element has the "{expected_text}" in the "{attribute}" attribute')
def element_has_field_attribute_with_value(context, field, element, expected_text, attribute):
    """
    step. Assert that the value of the element passed as parameter is equal to the expected text

    :param context: behave context
    :param field: name of the field to locate in the element
    :param element: name of the element to check
    :param expected_text: expected text
    :param attribute: attribute to look the text in
    """
    element = context.get_element_from_current_page(element)
    field_element = getattr(element, field)
    assert element.get_attribute(attribute).strip() == expected_text, f"'{field_element.get_attribute('value')}' " \
                                                                      f"is not equal to: {expected_text}"


@step('the "{field}" field in the "{element}" element does not have the "{attribute}" attribute')
def element_not_have_field_attribute(context, field, element, attribute):
    """
    step. Assert that the field of the element does not have the attribute passed as parameter

    :param context: behave context
    :param field: name of the field to locate in the element
    :param element: name of the element to check
    :param attribute: attribute to look the text in
    """
    element = context.get_element_from_current_page(element)
    field_element = getattr(element, field)
    assert not field_element.get_attribute(attribute), f"'{element}'.'{field}' have the '{attribute}' attribute"


@step('the browser title is "{title}"')
def browser_title_is(context, title):
    """
    step. Asserts that the browser title is the one given.

    :param context: behave context
    :param title: title
    """
    try:
        WebDriverWait(context.driver, 20).until(lambda driver: driver.title == title)
    except TimeoutException:
        raise AssertionError(f"'{title}' not displayed in browser title")


@step('the "{element}" element is readonly')
def element_is_readonly(context, element):
    """
    step. Assert that element is readonly.

    :param context: behave context
    :param element: element
    """
    readonly = context.get_element_from_current_page(element).get_attribute('readonly')
    assert readonly, u'"{}" is not readonly'.format(element)


@step('the current URL contains "{url_string}"')
def url_contains(context, url_string):
    """
    step. Assert that the current URL contains a string
    :param context: Behave context
    :param url_string: string that should be included in the current URL
    """
    try:
        WebDriverWait(context.driver, 20).until(lambda driver: url_string in driver.current_url)
        current_url = getattr(context.current_page.driver, 'current_url')
        assert url_string in current_url, f"'{url_string}' not displayed in the URL"
    except TimeoutException:
        raise AssertionError("URL not displayed")

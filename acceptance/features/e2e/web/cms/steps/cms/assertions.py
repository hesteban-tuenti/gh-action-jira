"""
Global CMS steps assertion
"""
import logging

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.features.e2e.web.steps.common.assertions import item_with_value_in_list_has_expected_text

logger = logging.getLogger(__name__)


@step('the selected entrypoint is deleted')
def selected_entrypoint_is_deleted(context):
    """
    step. Assert that the selected entrypoint in cms_entrypoints is deleted from CMS

    :param context: behave context
    """
    if not getattr(context, 'cms_entrypoints', None):
        raise ValueError('Missing cms_entrypoints variable in context')

    selected_entrypoint = context.cms_entrypoints.entrypoint0
    elements = context.get_element_from_current_page('entrypoints_list')
    entrypoint_id = selected_entrypoint.metadata.id.id
    for element in elements:
        if str(entrypoint_id) in element.get_attribute('href'):
            raise AssertionError('Selected entrypoint not deleted')


@step('the value of the hidden element "{element}" is equal to "{expected_message}"')
def hidden_element_equal_text(context, element, expected_message):
    """
    Step. Assert: Checks if the given message is equal to the text of the hidden WebElement.

    :param context: Behave Context.
    :param element: WebElement name.
    :param expected_message: Text message to check.
    """
    element = context.get_element_from_current_page(element)

    assert element.get_attribute('value') == expected_message, \
        'Element "{element}" text is not "{expected}". Current value: {current}'.format(
            element=element, expected=expected_message, current=element.text)


@step('the item with "{value}" text in "{field1}" field in the "{element_list}" list has the "{field2}" field with one'
      ' extra less')
def item_with_value_in_list_has_one_extra_less(context, value, field1, element_list, field2):
    """
    step. Asserts the text in the field for an item that contains a given text in a different field within a list.
    :param context: behave context
    :param value: value to lookup the item in list
    :param field1: field to lookup the item in list
    :param element_list: list of elements
    :param field2: field to check the expected text
    :param expected_text: expected text in the field
    """
    selected_extra = context.cms_extras.extra0
    expected_number_of_extras = selected_extra.numberOfEntrypoints - 1
    expected_text = '{} extra'.format(expected_number_of_extras)
    if expected_number_of_extras != 1:
        expected_text += 's'
    item_with_value_in_list_has_expected_text(context, value, field1, element_list, field2, expected_text)

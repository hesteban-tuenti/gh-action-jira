"""
Support appointment booking assertions steps
"""
from behave import step as behave_step  # noqa: F401

from toolium_telefonica.behave import step


@step('the selected "{index}" store is highlighted in the "{element}" stores list')
def selected_store_is_highlighted(context, index, element):
    """
    step. Checks that the store with given index is shown highlighted in element list.

    :param context: behave context
    :param index: store index
    :param element: element name
    """
    element = context.get_element_from_current_page(element)
    index = int(index) - 1
    element_class = element.page_elements[index].get_attribute('class')
    assert 'selected' in element_class, 'Element is not selected'

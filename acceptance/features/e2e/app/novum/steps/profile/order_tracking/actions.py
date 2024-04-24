"""
Order Tracking actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step('stores the text of the element in the "{element_list}" that have the "{status}" status in the '
      '"{field}" field in the context storage with "{key}" key')
def store_in_context_key_value_element_of_list_in_x_status(context, element_list, status, field, key):
    """
    Step. Saves a key-value pair that has a given value in a given field in the contextual storage.

    :param context: Behave context
    :param element_list: Name of the list to be searched.
    :param key: The name that will be used to reference the value.
    :param status: The status it should have
    :param field: The field where the value is to be searched
    """
    element_list = context.get_element_from_current_page(element_list)
    for element in element_list:
        if getattr(element, field).text == status:
            context.storage[key] = getattr(element, key).text
            return
    raise ValueError(f"Element {key} with status {status} in {field} field does not found")

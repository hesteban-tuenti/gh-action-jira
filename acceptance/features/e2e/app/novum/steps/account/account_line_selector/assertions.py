"""
Account line selector assertions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.constants.constants import BRANDS
from acceptance.common.steps.actions.elements import get_element_from_page

from acceptance.common.utils import utils


@step('the "{element_list}" has "{num_devices}" companion devices')
def list_has_companion_devices(context, element_list, num_devices):
    """
    step. Assert that list contains the given number of companion devices.
    :param context: behave context
    :param element_list: list to check
    :param num_devices: number of devices
    """
    assert getattr(context, 'companion_devices') is not None, 'context.companion_devices variable needs to be filled'
    element_list = get_element_from_page(context, element_list)
    companion_devices_in_list = [item for (index, item) in enumerate(element_list)
                                 if item.title.text in list(context.companion_devices) and index > 0]

    operator = '='
    value = num_devices
    if num_devices == 'several':
        operator = '>'
        value = 1

    assert utils.compare(len(companion_devices_in_list), int(value), operator), \
        'Unexpected number of devices. Expected: {}. Found: {}'.format(num_devices, len(companion_devices_in_list))


@step('each companion entry in the "{element_list}" list has the "{field}" textfield')
def each_companion_element_in_list_has_field(context, element_list, field):
    """
    step. Assert that field in the elements of the list are displayed in the expected text
    :param context: behave context
    :param element_list: list to check
    :param field: textfield field in the list_element
    """
    assert getattr(context, 'companion_devices') is not None, 'context.companion_devices variable needs to be filled'
    element_list = get_element_from_page(context, element_list)
    companion_devices_in_list = [item for (index, item) in enumerate(element_list)
                                 if item.title.text in list(context.companion_devices) and index > 0]

    for item in companion_devices_in_list:
        field_element = getattr(item, field)
        assert field_element.is_present(), 'Field {} is not present'.format(field)


@step('each companion entry in the "{element_list}" list has the "{field}" textfield with "{expected_text}" text')
def each_companion_element_in_list_has_field_with_text(context, element_list, field, expected_text):
    """
    step. Assert that field in the elements of the list are displayed in the expected text
    :param context: behave context
    :param element_list: list to check
    :param field: textfield field in the list_element
    :param expected_text: expected text of the field
    """
    assert getattr(context, 'companion_devices') is not None, 'context.companion_devices variable needs to be filled'
    element_list = get_element_from_page(context, element_list)
    companion_devices_in_list = [item for (index, item) in enumerate(element_list)
                                 if item.title.text in list(context.companion_devices) and index > 0]

    for item in companion_devices_in_list:
        field_element = getattr(item, field)
        assert field_element.text == expected_text, 'Unexpected text. Expected: {}. Found: {}'.format(
            expected_text, field_element.text)


@step('the account content corresponds to the "{product}" product')
def account_content_corresponds_to_product(context, product):
    """
    step. Assert that the content displayed in account corresponds with 'product'
    :param context: behave context
    :param product: expected product to be shown in account
    """
    if context.user.brand in {BRANDS.BLAUDE, BRANDS.O2DE}:
        if product == 'mobile_line':
            element = get_element_from_page(context, 'manage_bundle_button')
        elif product == 'my_handy':
            element = get_element_from_page(context, 'myhandy')
        else:
            raise Exception('Product {} not supported.'.format(product))

        assert element.is_visible(), f"Account does not display the '{product}' content"
    else:
        raise NotImplementedError("Not implemented yet")

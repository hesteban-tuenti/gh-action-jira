"""
Account Television steps
"""
import re

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from selenium.common.exceptions import NoSuchElementException

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the corresponding price increase/decrease in "{element}" is displayed')
def price_increase_decrease(context, element):
    """
    step. Assert that the price in element is updated
    :param context: behave context
    :param element: amount element
    """
    new_amount = get_element_from_page(context, element)
    current_amount = context.current_page.monthly_price
    match1 = re.match(r'(\d+,\d\d)', new_amount.text)
    match2 = re.match(r'(\d+,\d\d)', current_amount.text)
    new_amount = match1.groups()[0].replace(',', '.')
    current_amount = match2.groups()[0].replace(',', '.')
    assert float(new_amount) != float(current_amount), f"Price should be different: current {current_amount}, ' \
                                                       'new current {new_amount}"


@step('the new configuration with the plan, packs and channels is displayed')
def new_configuration_is_displayed(context):
    """
    step. Assert that new configuration with plan, packs and channels is displayed
    :param context: behave context
    """
    config_fusion = context.current_page.new_configuration_fusion.text
    assert config_fusion in context.storage['choose_your_fusion_offer'], f"New fusion {config_fusion} not found"

    chosen_items = context.storage.get('choose_your_packages_item', []) + context.storage.get(
        'choose_your_channels_item', [])
    for chosen_item, current_item in zip(chosen_items, context.current_page.new_configuration_module_items):
        assert chosen_item == current_item.text, f"New config {current_item.text} not found"


@step('each element in the channel list has the dial number')
def each_element_in_groups_list_has_field(context):
    """
    step. Asserts each element in the channel list has the dial number
    :param context: behave context
    """
    processed_elements = 4
    scrolled = False

    element_list = get_element_from_page(context, "channels_list")

    for index, element in enumerate(element_list):
        if getattr(element, 'name').text in {"Netflix", "DAZN", "Disney"}:   # Promotion packs doesn't have dial number
            return
        group_member = getattr(element, "dial_number")
        try:
            assert group_member.is_present()
        except (NoSuchElementException, AssertionError):
            context.driver.swipe(0, 500, 0, 200, 250)
            scrolled = True
            assert group_member.is_present()  # Retry after swipe.
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

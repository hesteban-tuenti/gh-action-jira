"""
Movistar Likes actions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.user_features.selector_handler import skip_execution


@step('I click on the Movistar Likes card')
def click_loyalty_card(context):
    """
    step. Clicks on any loyalty card taken from context.loyalty_items.

    :param context: behave context
    """
    if getattr(context, 'loyalty_items', []):
        item = context.loyalty_items[0]
        carousel_element = '{}_carousel_cards'.format(item['content']['category'])
        carousel_module = context.get_element_from_current_page(carousel_element).page_elements
        for card in carousel_module:
            href_attribute = card.get_attribute('href')
            card_id = href_attribute.split('/')[-1]
            if card_id == item['id']:
                context.driver.execute_script("arguments[0].click();", card.web_element)
                return
        raise AssertionError('Loyalty card not found')
    skip_execution(context, reason='No cards in context.loyalty_items')

"""
Movistar Likes actions steps
"""
from behave import step as behave_step  # noqa: F401
from selenium.webdriver.common.by import By

from toolium_telefonica.behave import step
from toolium.pageelements import Text

from acceptance.common.steps.user_features.selector_handler import skip_execution


@step('the priority tag is displayed in the card')
def priority_tag_is_displayed(context):
    """
    step. Asserts that a loyalty card taken from context.loyalty_items contains the prioriyty tag.

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
                assert card.priority_tag.is_visible(), 'Priority tag not displayed'
                return
        raise AssertionError('Priority card not found')
    skip_execution(context, reason='No priority cards in context.loyalty_items')


@step('the "{links_number}" card links are displayed')
def card_links_are_displayed(context, links_number):
    """
    step. Asserts that the given number of links are displayed for a promotion.

    :param context: behave context
    :param links_number: expected number of links
    """
    if getattr(context, 'loyalty_items', []):
        item = context.loyalty_items[0]
        links = item['content']['links']
        assert int(links_number) == len(links), 'Number of links mismatch. Expected {}, found {}'.format(links_number,
                                                                                                         len(links))
        for i in range(int(links_number)):
            link_text = Text(By.XPATH, '//a[contains(text(), "{}")]'.format(links[i]['text']))
            assert link_text.is_visible(), 'Link {} is not displayed'.format(links[i]['text'])


@step('the promotion link is opened')
def card_link_is_opened(context):
    """
    step. Asserts that the expected link is opened.

    :param context: behave context
    """
    if getattr(context, 'loyalty_items', []):
        item = context.loyalty_items[0]
        context.execute_steps(u"""Then the current URL is "{}" after "3" seconds""".format(
            item['content']['links'][0]['action']['url']))
        return
    skip_execution(context, reason='No cards in context.loyalty_items')

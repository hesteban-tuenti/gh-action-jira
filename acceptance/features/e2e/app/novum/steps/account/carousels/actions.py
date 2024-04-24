"""
Account Invoice Module assertions steps
"""
from appium.webdriver.common.touch_action import TouchAction
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from acceptance.features.e2e.app.steps.common.actions.elements import \
    swipe_right_left_over_element, swipe_left_right_over_element

from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen


@step('clicks on the "{link}" link of any card of the "{carousel}" carousel')
@step('clicks on the "{link}" button of any card of the "{carousel}" carousel')
@step('clicks on the "{link}" link of any element of the "{carousel}" list')
@step('clicks on the "{link}" button of any element of the "{carousel}" list')
def clicks_on_link_of_carousel(context, link, carousel):
    """
    step. Clicks on any card link of the carousel

    :param context: behave context
    :param link: link of the card
    :param carousel: carousel to check
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    card_link = getattr(carousel_module[0], link)
    display_element_on_screen(card_link)  # To focus the element (otherwise cannot be clickable)
    card_link.click()


@step('clicks on the card with "{text}" text on the "{field}" of the "{carousel}" carousel')
def clicks_on_carousel_with_text(context, text, field, carousel):
    """
    step. Clicks on the card with the expected text on the expected field of the carousel

    :param context: behave context
    :param text: expected text of the card
    :param field: field of the card
    :param carousel: carousel to check
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for card in carousel_module:
        if text == getattr(card, field).text:
            card_field = getattr(card, field)
            display_element_on_screen(card_field)  # To focus the element (otherwise cannot be clickable)
            # focus the element, added to fix issue clicking with snap cards after scroll is done and the card is not
            # totally displayed in the screen
            context.driver.execute_script("arguments[0].scrollIntoView();", card_field.web_element)
            card_field.click()
            break
    else:
        raise ValueError(f"No card with the -'{text}'- text in the '{field}' field of the '{carousel}' carousel")


@step('swipes the "{carousel}" carousel in "{direction}" direction')
@step('swipes the "{carousel}" graph in "{direction}" direction')
def swipes_carousel_in_direction(context, carousel, direction):
    """
    step. Swipes the desired carousel to the desired direction

    :param context: behave context
    :param carousel: carousel to swipe
    :param direction: direction to swipe: {'left', 'right'}
    """
    if direction == 'left':
        swipe_left_right_over_element(context, carousel)
    elif direction == 'right':
        swipe_right_left_over_element(context, carousel)
    else:
        raise Exception("Invalid argument {}, valid arguments: -'left'- and -'right'-".format(direction))


@step('hide the subscription dropdown')
def hide_subscription_dropdown(context):
    """
    step. hide the subscription dropdown in Vivo

    :param context: behave context
    """
    selector_dropdown = get_element_from_page(context, 'selector_dropdown')
    if selector_dropdown.is_visible():
        if context.driver_wrapper.is_ios_test():
            TouchAction(context.driver).tap(None, 50, 50).perform()
        else:
            context.driver.back()
    else:
        raise Exception("Selector dropdown is not present")

"""
Start tab assertion steps
"""
from time import sleep

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen, \
    swipe_right_left_over_element, swipe_left_right_over_element
from acceptance.common.steps.actions.elements import get_element_from_page


@step('the header contains a card with "{card_text}" title and "{button_text}" button')
def header_contains_title_button(context, card_text, button_text):
    """
    step. Assert that the card with text and button is in the header

    :param context: behave context
    :param card_text: text of the card
    :param button_text: text inside the button
    """
    # check if there are several cards
    container_element = get_element_from_page(context, 'header.carousel_counter')

    if not container_element.is_visible():

        title_element = get_element_from_page(context, 'header.title')
        display_element_on_screen(title_element)
        assert title_element.text == card_text, f"'{title_element.text}' title is not equal to: {card_text}"

        button_element = get_element_from_page(context, 'header.button')
        display_element_on_screen(button_element)
        assert button_element.text == button_text, f"'{button_element.text}' button is not equal to: {button_text}"

    else:  # multiple cards
        sleep(5)
        # after waiting the carousel is scrolled right automatically
        # and we can now scroll and it will not move automatically
        bullet_container_element = get_element_from_page(context, 'header.carousel_counter_bullets')
        first_bullet = bullet_container_element[0]

        # move the carousel to first position
        while 'rgba' in first_bullet.get_attribute('style'):
            swipe_left_right_over_element(context, 'header_card_native')

        # scroll until find the element
        for index in range(len(bullet_container_element)):
            title_element = context.current_page.get_header_text_element_by_index(index)
            title_text = context.current_page.get_text_from_element(title_element)
            if title_text == card_text:
                assert title_element.is_visible(), f"Element {index} is not displayed"
                button_element = context.current_page.get_header_button_element_by_index(index)
                assert button_element.text == button_text, f"'{button_element.text}' button " \
                                                           f"is not equal to: {button_text}"
                return
            swipe_right_left_over_element(context, 'header_card_native')

        raise AssertionError('Card with text "{}" not found'.format(card_text))

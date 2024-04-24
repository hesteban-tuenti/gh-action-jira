"""
Account Carousel steps
"""
import re

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.aus.code_factory import AusHelper

from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps import display_element_on_screen, swipe_right_left_over_element


@step('the card with "{text}" text on the "{field}" field is displayed in the "{index}" '
      'position of the "{carousel}" carousel')
def field_in_carousel_with_text_by_index(context, text, field, index, carousel):
    """
    step. Assert that the text on the field "field" is displayed on the card on index "index" of the carousel "carousel"

    :param context: behave context
    :param index: index of the card
    :param carousel: carousel to check
    :param field: field to check in the card
    :param text: text to check in the card
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    item = carousel_module[int(index)]
    real_text = getattr(item, field).text
    assert real_text == text, f"-'{text}'- is not displayed on the '{index}' position of the the " \
                              f"'{carousel}' carousel.\n-'{real_text}'- is displayed instead"


@step('each element in the "{carousel}" carousel has the "{field}" textfield with the "{regular_expression}" format')
@step('each card in the "{carousel}" carousel has the "{field}" textfield with the "{regular_expression}" format')
def each_card_has_the_field_regular_expression(context, carousel, field, regular_expression):
    """
    step. Assert that every card in the carousel have the field that matchs the regular expression

    :param context: behave context
    :param carousel: carousel to check
    :param field: field to check in the card
    :param regular_expression: regular expression to match
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for index, card in enumerate(carousel_module):
        element = getattr(card, field)
        assert element.is_present(), \
            f"-'{field}'- is not displayed on the '{index}' position of the '{carousel}' carousel"
        assert re.match(regular_expression,
                        element.text), f"'{element.text}' " \
                                       f"doesn't match with the regular expresion: {regular_expression}"


@step('the "{text}" text is not displayed in the "{field}" field of the "{carousel}" carousel')
@step('the card with "{text}" text on the "{field}" field is not displayed in the "{carousel}" carousel')
def check_text_carousel(context, text, field, carousel):
    """
    step. Assert that a text is displayed on the carousel
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param carousel: carousel to check
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for index, card in enumerate(carousel_module):
        real_text = getattr(card, field).text
        assert text != real_text, \
            f"-'{text}'- is displayed on the '{index}' position of the '{carousel}' carousel"


@step('the "{text}" text is displayed in the "{field}" field of the "{carousel}" carousel')
@step('the card with "{text}" text on the "{field}" field is displayed in the "{carousel}" carousel')
def check_text_not_in_carousel(context, text, field, carousel):
    """
    step. Assert that a text is displayed on the carousel
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param carousel: carousel to check
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for card in carousel_module:
        real_text = getattr(card, field).text
        if text == real_text:
            return
    raise Exception(f"-'{text}'- is not displayed on any position of the '{carousel}' carousel")


@step('the card in the "{index}" position of the "{carousel}" carousel is shown highlighted')
def field_in_carousel_index_highlighted(context, index, carousel):
    """
    step. Assert that the card in the "index" position of the carousel are highlighted

    :param context: behave context
    :param index: index of the card
    :param carousel: carousel to check
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    item_class = carousel_module[int(index)].item.web_element.get_attribute("class")
    assert "itemSelected" in item_class,\
        f"The card in '{index}'- position is not highlighted in the '{carousel}' carousel"


@step('the card with text "{text}" of the "{carousel}" carousel is shown highlighted')
def field_in_carousel_text_highlighted(context, text, carousel):
    """
    step. Assert that the card with given text of the carousel is highlighted

    :param context: behave context
    :param text: text of the card
    :param carousel: carousel to check
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for card in carousel_module:
        if text in card.item.text:
            item_class = card.item.web_element.get_attribute("class")
            assert "itemActive" in item_class or "itemSelected" in item_class, \
                f"The card with '{text}' text is not highlighted in the '{carousel}' carousel"
            return
    raise AssertionError("No card with '{text}' in carousel")


@step('the card with "{text}" text on the "{field}" field in the "{carousel}" carousel has the '
      '"{other_field}" field with "{other_text}" text')
@step('the card with "{text}" text on the "{field}" field in the "{carousel}" carousel has the '
      '"{other_field}" field that contains the "{other_text}" text')
def check_text_in_carousel_with_other_text(context, text, field, carousel, other_field, other_text):
    """
    step. Assert that a text is displayed on the desired card of the carousel
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param carousel: carousel to check
    :param other_text: text to check in the other field
    :param other_field: field to check in the card
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for card in carousel_module:
        real_text = getattr(card, field).text
        if text == real_text:
            other_real_text = getattr(card, other_field).text.replace("\n", "").replace(' ', ' ')
            if other_text not in other_real_text:
                raise Exception(f"-'{other_text}'- is not displayed in the -'{other_field}'- field of the "
                                f"card with -'{text}'- text in the -'{field}'-")
            return
    raise Exception(f"-'{text}'- is not displayed on any position of the '{carousel}' carousel")


@step('the card with "{text}" text on the "{field}" field in the "{carousel}" carousel has the '
      '"{other_field}" field with "{regular_expression}" format')
@step('the card with "{text}" text on the "{field}" field is displayed in the "{carousel}" carousel has the '
      '"{other_field}" field with "{regular_expression}" format')
def check_format_in_carousel_with_other_text(context, text, field, carousel, other_field, regular_expression):
    """
    step. Assert that a text is displayed on the desired card of the carousel
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param carousel: carousel to check
    :param regular_expression: regular expression to match
    :param other_field: field to check in the card
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for card in carousel_module:
        real_text = getattr(card, field).text
        if text == real_text:
            other_real_text = getattr(card, other_field).text.replace("\n", "").replace(' ', ' ')
            if not re.match(regular_expression, other_real_text):
                raise Exception(f"'{other_real_text}' doesn't match with the regular expresion: {regular_expression}")
            return
    raise Exception(f"-'{text}'- is not displayed on any position of the '{carousel}' carousel")


@step('the card with "{text}" text on the "{field}" field in the "{carousel}" carousel has the '
      '"{other_field}" field')
def check_field_is_displayed_in_element(context, text, field, carousel, other_field):
    """
    step. Assert that a text is displayed on the desired card of the carousel
    :param context: behave context
    :param text: text to check
    :param field: field to check in the card
    :param carousel: carousel to check
    :param other_field: field to check in the card
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for card in carousel_module:
        real_text = getattr(card, field).text
        if text == real_text:
            assert getattr(card, other_field), f"-'{other_field}'- field of the card with -'{text}'- " \
                                               f"text in the -'{field}'- is not displayed"


@step('each element in the "{carousel}" carousel has the "{field}" field with "{text}" text')
@step('each card in the "{carousel}" carousel has the "{field}" field with "{text}" text')
def each_card_has_the_field_text(context, carousel, field, text):
    """
    step. Assert that every card in the carousel have the field that matchs the text

    :param context: behave context
    :param carousel: carousel to check
    :param field: field to check in the card
    :param text: text to match
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    for index, card in enumerate(carousel_module):
        element = getattr(card, field)
        assert element.is_present(), \
            f"-'{field}'- is not displayed on the '{index}' position of the '{carousel}' carousel"
        assert text == element.text, f"'{element.text}' doesn't match with the text: {text}"


@step('the "{carousel}" carousel has "{number_cards}" cards')
def check_number_of_cards_in_carousel(context, carousel, number_cards):
    """
    step. Assert that every card in the carousel have the field that matchs the text

    :param context: behave context
    :param carousel: carousel to check
    :param number_cards: number of cards
    """
    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) == int(number_cards), f"-'{carousel}'- carousel not found or length != {number_cards}"


@step('all the purchased xgpu subscriptions are displayed in the "{list}" list')
def check_subscription_in_xgpu_list(context, list):
    """
    step. Assert that the number of cards in the list are the same that the number of XGPU subscriptions

    :param context: behave context
    :param list: list to check
    """
    list = get_element_from_page(context, list)
    xgpu_subscriptions = None
    if context.user.snapshot_aus:
        xgpu_subscriptions = AusHelper.get_helper(context).get_number_of_gpu_subscriptions()
    assert len(list) == int(xgpu_subscriptions), f"-'{list}'- list not found or length != {xgpu_subscriptions}"


@step('each roundel in the "{carousel}" carousel has the "{element_field}" field')
def each_roundel_has_element(context, carousel, element_field):
    """
    Step. Assert that all roundels have the element field
    :param context: behave context
    :param carousel: carousel of roundels to check
    :param element_field: element to check
    """
    carousel = get_element_from_page(context, carousel)
    element = get_element_from_page(context, element_field)
    first_roundel = get_element_from_page(context, 'first_roundel')

    display_element_on_screen(first_roundel)

    assert element.is_visible(), f"Roundel without '{element}' field"

    for _ in range(1, len(carousel)):
        swipe_right_left_over_element(context, 'roundels_section')
        assert element.is_visible(), f"Roundel without '{element_field}' field"


@step('each roundel in the "{carousel}" carousel has the "{element_field}" '
      'textfield with the "{regular_expression}" format')
def each_roundel_has_element_with_format(context, carousel, element_field, regular_expression):
    """
    Step. Assert that all roundels have the element field
    :param context: behave context
    :param carousel: carousel of roundels to check
    :param element_field: element to check
    :param regular_expression: expresion to match
    """
    carousel = get_element_from_page(context, carousel)
    element = get_element_from_page(context, element_field)
    first_roundel = get_element_from_page(context, 'first_roundel')

    display_element_on_screen(first_roundel)

    assert element.is_visible(), f"Roundel without '{element}' field"

    for _ in range(1, len(carousel)):
        swipe_right_left_over_element(context, 'roundels_section')
        assert re.match(regular_expression,
                        element.text), f"'{element.text}' " \
                                       f"doesn't match with the regular expresion: {regular_expression}"


@step('only data allowance roundels are displayed in the "{carousel}" carousel')
def only_data_allowances_are_displayed(context, carousel):
    """
    Step. Assert that all roundels has the element field
    :param context: behave context
    :param carousel: carousel of roundels to check
    """
    carousel = get_element_from_page(context, carousel)
    category_name = get_element_from_page(context, 'category_name')
    first_roundel = get_element_from_page(context, 'first_roundel')

    display_element_on_screen(first_roundel)

    no_data_allowances = ['minuten', 'sms', 'unit']
    for allowance in no_data_allowances:
        assert allowance not in category_name.text.lower(), "No data roundel found"

    for _ in range(1, len(carousel)):
        swipe_right_left_over_element(context, 'roundels_section')
        for allowance in no_data_allowances:
            assert allowance not in category_name.text.lower(), "No data roundel found"

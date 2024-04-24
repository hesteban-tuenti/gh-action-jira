"""
Explore assertion steps
"""
import logging
from time import sleep
from re import match, sub

from behave import step as behave_step  # noqa: F401
from selenium.common.exceptions import NoSuchElementException, StaleElementReferenceException
from toolium.pageelements import PageElements
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.common.constants.constants import BRANDS
from acceptance.common.constants.constants import APPSTATE, EXPLOREMODULES
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.assertions.app import get_app_state
from acceptance.app.novum.pageobjects.base.webview.browser_mode import BaseBrowserMode
from acceptance.app.novum.pageobjects.base.webview.internal_mode import BaseInternalMode
from acceptance.app.novum.pageobjects.base.explore.youtube_player import BaseYoutubePlayer
from acceptance.common.steps.user_features.explore import clean_string

logger = logging.getLogger(__name__)


@step('the Explore card is opened')
@step('the Explore module link is opened')
@step('the Explore offer terms link is opened')
def check_card_is_open(context):
    """
    step. Assert that the card or module link is open, it could be loaded as an internal, browser or external webview.
          It can also open the device app store or the embedded youtube player

    :param context: behave context
    """
    sleep(2)
    if BaseYoutubePlayer().youtube_player.is_visible():
        context.current_page = BaseYoutubePlayer()
        logger.debug("Youtube player opened")
    elif BaseBrowserMode().navigation_top_bar.options_reload.is_present():
        context.current_page = BaseBrowserMode()
        context.current_page.wait_until_loaded()
        logger.debug("Webview with '%s' header opened in browser mode",
                     context.current_page.navigation_top_bar.get_header_name())
    elif BaseInternalMode().navigation_top_bar.navigation_top_bar.is_visible():
        context.current_page = BaseInternalMode()
        try:
            logger.debug("Webview with '%s' header opened in internal mode",
                         context.current_page.navigation_top_bar.get_header_name())
        except NoSuchElementException:
            logger.debug("Webview opened in internal mode and header not visible")
    else:
        if context.driver_wrapper.is_ios_test():
            browser = get_app_state(context, "Safari")
            store = get_app_state(context, "Apple_Store")
        else:
            browser = get_app_state(context, "Chrome")
            store = get_app_state(context, "Play_Store")
        assert APPSTATE.FOREGROUND in {browser, store}, "Card/link did not open properly." \
                                                        " Native browser or app store has not been displayed"
        log = f"{'Browser' if browser == APPSTATE.FOREGROUND else 'Store'}"
        logger.debug("%s App opened after clicking the card", log)


@step('the Explore categories carousel is not displayed')
def check_categories_carousel_visible(context):
    """
    step. Assert that the explore categories carousel is not visible.
    To assert the carousel hasn't scrolled down and taking into consideration it is located in a
    webview context and therefore the element is always in the DOM, we can't rely on the _is_visible()
    method, so here we are checking the element is at the top of the webview after scrolling down.

    :param context: behave context
    """
    if map_param('[CONF:brand]') == BRANDS.MOVES:
        offset_y = context.driver.get_window_size()['height'] * 0.25
    else:
        offset_y = context.driver.get_window_size()['height'] * 0.15
    categories_carousel_parent = get_element_from_page(context, 'categories_carousel_parent')
    location_x = categories_carousel_parent.web_element.location['x']
    location_y = categories_carousel_parent.web_element.location['y']
    assert location_x < 20 and location_y < offset_y, "Carousel is not located at the top of the webview screen"


@step('the expiration date of that card is not displayed')
def check_expiration_date_not_displayed(context):
    """
    step. Assert that an Explore card does not have a validity period being displayed

    :param context: behave context
    """
    regex = r'^(?!(Finaliza|Ends|Termina|Endet)\s)'
    try:
        text = context.storage['card'].validity_tag.text
        assert match(regex, text.upper()), f"'{text}' contains a validity period"
    except NoSuchElementException:
        logger.debug("No tag timer found in the card")


@step('the expiration date of that card is displayed')
def check_expiration_date_displayed(context):
    """
    step. Assert that an Explore card has a validity period being displayed

    :param context: behave context
    """
    regex = r'^(?!(Finaliza|Ends|Termina|Endet)\s)'
    text = context.storage['card'].validity_tag.text

    assert match(regex, text.upper()), f"'{text}' doesn't contain a validity period"


@step('the category with no content is not displayed in the the categories carousel')
def check_category_no_content_not_displayed(context):
    """
    step. Assert that the category with no content stored in the context is not displayed on the categories carousel

    :param context: behave context
    """
    categories_carousel = get_element_from_page(context, "categories_carousel")
    for category in categories_carousel:
        assert category.name.text != context.category_name


@step('the "{links_number}" links are displayed in the Likes promo')
def check_links_promo(context, links_number):
    """
    step. Assert that there are the links_number links in a Likes promo

    :param context: behave context
    :param links_number: number of links to be displayed
    """
    if links_number != "0":
        for i in range(int(links_number)):
            link = context.current_page.search_link_by_text(context.loyalty_items[0]['content']['links'][i]['text'])
            display_element_on_screen(link)


@step('the video is reproduced on the fullscreen embedded video player')
def check_youtube_video_played(context):
    """
    step. Assert that the youtube video is displayed in the embedded video player and is being reproduced

    :param context: behave context
    """
    context.execute_steps('When take a screenshot of "youtube_player" and save it as "video_start"\n'
                          '    And waits "2" seconds\n'
                          '    Then check that the image "video_start" is not present in the element '
                          '"youtube_player" with threshold "0"')


@step('the selected explore "{type}" has the "{field}" field with "{expected_text}" text')
def selected_card_has_field_with_text(context, type, field, expected_text):
    """
    Step. Asserts a given text field is displayed with a expected text within the card located
    in the selected position and module type.

    :param context: behave context
    :param type: module or card
    :param field: field contained within the module or card
    :param expected_text: text shown in the field
    """
    if type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    value = getattr(context.storage[type], field)
    # CMS fields allows serveral blank spaces , but the webapp framework won't show them
    assert value.text == sub(r'\s+', ' ', expected_text).strip(), \
        "Text: {} does not match expected: {}".format(value.text, sub(r'\s+', ' ', expected_text))
    logger.debug("Selected %s has field '%s'= '%s'", type, field, expected_text)


@step('the selected explore "{type}" has the "{field}" field displayed')
def selected_card_has_field_displayed(context, type, field):
    """
    Step. Asserts a given field is displayed with a expected text within the module ord card located
    in the selected position and module type.
    The position and the module type are set in the context during the scenario.

    :param context: behave context
    :param type: module or card
    :param field: field contained within the module or card
    """
    if type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    value = getattr(context.storage[type], field)
    if isinstance(value, PageElements):
        assert len(value) > 0, f"Field: {field} in Explore {type} is empty"
    else:
        assert value.is_present(), f"Field: {field} in Explore {type} named {context.storage['module_title']} " \
                               f"is not present"
    logger.debug("Selected %s with title %s has '%s' field displayed", type, context.storage['module_title'], field)


@step('the selected explore "{type}" does not have the "{field}" field displayed')
def selected_card_does_not_have_field_displayed(context, type, field):
    """
    Step. Asserts a given field is not displayed with a expected text within the module ord card located
    in the selected position and module type.
    The position and the module type are set in the context during the scenario.

    :param context: behave context
    :param type: module or card
    :param field: field contained within the module or card
    """
    if type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    value = getattr(context.storage[type], field)
    assert not value.is_present(), f"Field: {field} in Explore {type} named {context.storage['module_title']} " \
                                   f"is present"
    logger.debug("Selected %s with title %s does not have the '%s' field displayed", type,
                 context.storage['module_title'], field)


@step('the selected explore card has the "{media}" media field displayed')
def selected_card_has_media(context, media):
    """
    Step. Asserts the media field (image or bumper) is displayed within the card located in the selected
    position and module type. The position and the module type are set in the context during the scenario.

    :param context: behave context
    :param media: type of media to find in the card: image, bumper or image_or_bumper, meaning any
    """
    if media not in {"image", "bumper", "image_or_bumper"}:
        raise ValueError('Invalid type. Available values: image/bumper/image_or_bumper')

    if "or" not in media:
        value = getattr(context.storage['card'], media)
        assert value.is_present()
    else:
        try:
            element = getattr(context.storage['card'], 'bumper')
            assert element.is_visible(), \
                "Bumper not visible or not present in the Card"
        except (NoSuchElementException, AttributeError, AssertionError, StaleElementReferenceException):
            element = getattr(context.storage['card'], 'image')
            assert element.is_visible(), \
                "Image not visible or not present in the Card"


@step('the selected explore module has "{expected:d}" card')
def module_contains_items(context, expected):
    """
    Step. Asserts a module contains a number cards
    :param context: behave context
    :param expected: number of cards.
    """
    cards = len(context.storage['module'].cards)

    assert cards == expected, "Module has {} cards insted of {}".format(cards, expected)


@step('the Explore card is closed')
@step('the Explore module link is closed')
@step('the Explore offer terms link is closed')
def check_card_is_closed(context):
    """
    step. Returns to the Explore page or Explore Category from the page that has been opened.
    The page might be a BaseInternalMode, BaseBrowserMode or YoutubePlayer

    :param context: behave context
    """
    if 'Mode' in context.current_page.__class__.__name__:
        if getattr(context.current_page.navigation_top_bar, 'back_button', None):
            context.current_page.navigation_top_bar.back_button.click()
        elif getattr(context.current_page.navigation_top_bar, 'close_button', None):
            context.current_page.navigation_top_bar.close_button.click()
        else:
            context.driver.back()

    elif 'Youtube' in context.current_page.__class__.__name__:
        context.current_page.close_player()
    else:
        context.driver_wrapper.driver.activate_app(context.device.app_id)


@step('the selected explore card has the validity period with "{regular_expression}" format displayed')
def selected_card_has_validity_with_format(context, regular_expression):
    """
    Step. Asserts the card set in the context has the validity period matching a given regex

    :param context: behave context
    :param regular_expression: regex to match the validity period.
    """
    module_type = context.storage['module_type']
    try:
        text = context.storage['card'].validity_tag.text

    except NoSuchElementException:
        if module_type == 'vertical_cards':
            text = ''  # empty pretitle that will fail during assertion

    assert match(regular_expression, text), f"'{text}' " \
                                            f"doesn't match with the regular expresion: {regular_expression}"
    logger.debug("Selected card has validity period =  '%s'", text)


@step('the cards belonging to the segmented category are displayed')
@step('only the cards belonging to that category are displayed')
def only_cards_in_category_are_displayed(context):
    """
    Step. Asserts all the cards found in an Explore category are expected to be in the category.
    In other words, there isn't a card in the page that doesn't belong to the category.
    Currently we don't check banners, as there is no way to match the content from the API with the UI.

    :param context: behave context
    """
    context.dict_categories = context.context_response.get_cards_by_category()
    modules_type = [module.replace(' ', '_') for module in [EXPLOREMODULES.FEATURED_CONTENT,
                                                            EXPLOREMODULES.VERTICAL_CARDS,
                                                            EXPLOREMODULES.ROWS,
                                                            EXPLOREMODULES.HIGHLIGHTED_CARDS,
                                                            EXPLOREMODULES.DISPLAY_CARDS]]

    for module_type in modules_type:
        modules = get_element_from_page(context, f"{module_type}_modules_list")
        try:
            if len(modules) > 0:
                for module in modules:
                    _check_all_cards_belong_to_category(context, module.cards)
        except NoSuchElementException:
            pass


def _check_all_cards_belong_to_category(context, cards):
    """
    Checks the title and description of all the cards in a module with corresponding module's attributes.

    :param context: behave context
    :param cards: list of cards within a module
    """
    category = context.storage['category_key']
    cards_by_category = context.dict_categories[category]
    for card in cards:
        _check_card_in_cards_by_category(context,
                                         card.title.text,
                                         cards_by_category)


def _check_card_in_cards_by_category(context, title, cards_by_category):
    """
    Iterates the cards of a given category retrieved from the API, and looks for the title of a card in
    the UI. If the card is found stops the loop, if the title isn't found in the list retrieved from
    the API it means the card isn't in the expected category.
    The description string retrieved from the api is manipulated deleting ocurrences of two blank spaces, and leaving
    just one, because selenium getText() will get this text rendered the same way as html works:
    https://stackoverflow.com/questions/6151554/text-inside-div-not-showing-multiple-white-spaces-between-words

    :param context: behave context
    :param title: cards' title to use as criteria for the search in the in list retrieved from the API
    :param cards_by_category: list of cards belonging a given category retrieved from the API
    """
    for card in cards_by_category:
        if clean_string(card['title']) == title.strip():
            break
    else:
        raise ValueError(f'Card with "{title}" not expected in "{context.storage["category_name"]}" category')

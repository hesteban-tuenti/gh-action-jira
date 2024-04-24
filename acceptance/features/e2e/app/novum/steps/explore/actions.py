"""
Explore actions steps
"""
import logging
from random import randrange
import time

from selenium.common.exceptions import TimeoutException, NoSuchElementException

from behave import step as behave_step  # noqa: F401
from toolium.pageelements import PageElements
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.app.novum.pageobjects.base.developersettings.developer_settings import BaseDeveloperSettings
from acceptance.app.novum.pageobjects.base.developersettings.information_options.information_options \
    import BaseInformationOptions
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.common.steps.user_features.selector_handler import skip_execution
from acceptance.features.e2e.app.steps.native.deeplinks import open_deeplink
from acceptance.app.common.autonavigation.page_objects_provider import get_unprefixed_class_name
from acceptance.features.e2e.app.steps import get_page_object

logger = logging.getLogger(__name__)


@step('searches the "{type}"')
def search_module_or_card(context, type):
    """
    step. Search a given card or module by selecting the proper category in the categories carousel.
    The category has been already set in the context after looking for the dynamic content via apicalls.
    Afterwards the module/card position is looked for in the corresponding Groups list element.

    :param context: behave context
    :param type: card o module explore element
    """
    if type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    category_name = _get_category_key_from_name_api(context, context.storage['card_category'], id_or_name="name")
    if context.driver_wrapper.is_web_test() and 'ExploreCategory' not in context.current_page.page_name or\
        not context.driver_wrapper.is_web_test() and 'ExploreCategory' not in context.current_page.__class__.__name__:
        context.storage['explore_page'] = 'Explore'
        if context.storage['card_category'] != "home":
            context.execute_steps('When opens the "{}" Explore category'.format(category_name))
            context.execute_steps('When the "Explore Category" page is displayed')
            context.storage['explore_page'] = 'Explore Category'
    _find_position_in_elements_list(context, type)


def _find_position_in_elements_list(context, type):
    """
    step. Search a given card or module by iterating all the modules or cards in the current page.
    The modules/cards are defined as a Groups list.
    The criteria to find the module or card is the title (and description for cards) match the title
    set in the context after looking for the dynamic content via apicalls.
    After the module/card is found the pagelement is set in the context.

    :param context: behave context
    :param type: module or card
    """
    modules_list = get_element_from_page(context, f"{context.storage['module_type']}_modules_list")
    if context.storage['module_type'] == 'banner':
        context.storage['module'] = modules_list[0]
        context.storage['card'] = modules_list[0].card
        display_element_on_screen(modules_list[0].card.button_container)

    else:
        for module in modules_list:
            try:
                if module.title.text == context.storage['module_title']:
                    display_element_on_screen(module.title)
                    cards_list_in_module = module.cards
                    context.storage['module'] = module
                    break
            except NoSuchElementException:
                continue  # Ignore modules without title
        else:
            raise ValueError('Module not found in Explore page')
        if type == 'card':
            for card in cards_list_in_module:
                if card.title.text.strip() == context.storage[f'{type}_title']:
                    display_element_on_screen(card.title)
                    context.storage['card'] = card
                    break
            else:
                raise ValueError('Card not found in module')


@step('opens an Explore category')
def open_explore_category(context):
    """
    step. Open a Explore category found in the screen and store its name in the context.
    To avoid opening the same category all the time, a random function is used to pick a
    category.

    :param context: behave context
    """
    categories_carousel = get_element_from_page(context, "categories_carousel")
    total_categories = len(categories_carousel)
    index = randrange(0, total_categories - 1)
    category = categories_carousel.page_elements[index]
    context.storage['category_name'] = category.name.text
    category.icon.click()
    context.storage['category_key'] = _get_category_key_from_name_api(context, context.storage['category_name'])


def _get_category_key_from_name_api(context, category_name, id_or_name="id"):
    """
    Returns the key of a given category name

    :param context: behave context
    :param category_name: Category name
    :param id_or_name: retrive either the key or the value of the category
    :return: category id or name
    """
    return context.context_response.get_category_key_from_name(category_name, id_or_name)


@step('opens the "{category_name}" Explore category')
def open_explore_category_by_name(context, category_name):
    """
    step. Open a Explore category found in the screen and store its name in the context.

    :param context: behave context
    :param category_name: category to clicks on
    """
    categories_carousel = get_element_from_page(context, "categories_carousel")
    for category in categories_carousel:
        if category.name.text.lower() == category_name.lower():
            category.icon.click()
            break
    else:
        raise ValueError(f'Category {category_name} not found in categories carousel')
    context.storage['category_name'] = category_name
    context.storage['category_key'] = _get_category_key_from_name_api(context, context.storage['category_name'])
    if context.driver_wrapper.is_web_test():
        time.sleep(1)


@step('clicks on the "{field}" field in the explore "{type}"')
def click_on_field_in_explore_element(context, field, type):
    """
    Step. Clicks on a given field within the card or module set in the context.

    :param context: behave context
    :param field: card or module field to click on it
    :param type: card or module
    """
    if type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    getattr(context.storage[type], field).click()


@step('clicks on the "{index:d}" position in the "{list_field}" list in the explore "{type}"')
def click_on_position_in_list_in_explore_element(context, index, list_field, type):
    """
    Step. Clicks on a given position of the list fieldwithin the card or module set in the context.

    :param context: behave context
    :param index: index
    :param list_field: card or module field to click on it
    :param type: card or module
    """
    if type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    getattr(context.storage[type], list_field)[index].click()


@step('searches the banner "{element_type}" with "{element_name}"')
def search_banner_with_element(context, element_type, element_name):
    """
    step. Search within a banner module or card containing an element.
    Due is not posible to match the api content with the UI content, there is no way to identify a banner
    in the UI, so we will look for the first banner container matching the criteria in the category identified
    through the api.

    :param context: behave context
    :param element_type: card or module
    :param element_name: element within the card container
    """
    if element_type not in {"module", "card"}:
        raise ValueError('Invalid type. Available values: module/card')

    category_name = _get_category_key_from_name_api(context, context.storage['card_category'], id_or_name="name")
    context.storage['explore_page'] = 'Explore'
    if context.storage['card_category'] != "home":
        context.execute_steps('When opens the "{}" Explore category'.format(category_name))
        context.execute_steps('When the "Explore Category" page is displayed')
        context.storage['explore_page'] = 'Explore Category'

    modules_list = get_element_from_page(context, f"{context.storage['module_type']}_modules_list")

    for module in modules_list:
        if element_type == "module":
            element_attribute = getattr(module, element_name)
        else:
            card = getattr(module, "card")
            element_attribute = getattr(card, element_name)
        if isinstance(element_attribute, PageElements) and len(element_attribute) > 0:
            context.storage['module'] = module
            context.storage['card'] = module.card
            display_element_on_screen(element_attribute[0])
            break
        if not isinstance(element_attribute, PageElements) and element_attribute.is_present():
            context.storage['module'] = module
            context.storage['card'] = module.card
            display_element_on_screen(element_attribute)
            break
    else:
        raise ValueError(f'Banner {element_type} with {element_name} not found in Explore page')


@step('clicks the card container')
def open_card_container(context):
    """
    Step. Open the card already found (set in the context.)
    This step is basically the same "opens the card" but in this case we want differentiate for o2uk
    featured content, so we will click the container button and capture the exception. This step is
    used in a negative scenario to check the container is not clickable.

    :param context: behave context
    """
    try:
        context.storage['card'].button_container.click()
    except TimeoutException:
        logger.error('Error clicking the card container')


@step('swipes the carousel from "{direction}" in the selected explore module')
def carousel_is_swiped_right_left(context, direction):
    """
    Step. Swipes the carousel in a given direction. within the module set in the context.
    Due to using the new swipe method based on ActionChains doesn't work reliably we use a "scrollIntoView"
    script.

    :param context: behave context
    :param direction: swipe direction. Either "right to left" or "left to right"
    """
    if direction not in {"right to left", "left to right"}:
        raise ValueError(f"Not valid {direction} direction. Use 'right to left' or 'left to right")

    element_list = context.storage['module'].cards
    el_rect = element_list[0].web_element.rect

    if direction == "right to left":
        first_element = element_list[0]
        last_element = element_list[len(element_list) - 1]

        start_x = el_rect['x'] + (el_rect['width'])
        start_y = el_rect['y'] + (el_rect['height'] / 2)
        end_x = 0 - start_x
    else:
        first_element = element_list[len(element_list) - 1]
        last_element = element_list[0]

        start_x = el_rect['x']
        start_y = el_rect['y'] + (el_rect['height'] / 2)
        end_x = el_rect['width'] - start_x

    size = context.driver.get_window_size()
    logger.debug("Window Size: %s", size)

    if context.driver_wrapper.is_android_test():
        first_element.set_focus()
        context.driver.execute_script("arguments[0].scrollIntoView({'behavior':'smooth'});",
                                        last_element.web_element)
    else:
        context.driver.swipe(start_x=start_x, start_y=start_y, end_x=end_x, end_y=0,
                                duration=100)


@step('swipes the categories carousel')
def swipes_categories_carousel(context):
    """
    Step. Swipes the carousel within the module set in the context.
    Current W3C mechanism doesn't work correctly in Android so we'll use javascript method to scroll horizontally

    :param context: behave context
    :param restore: restore the carousel to the original position
    """
    element_list = get_element_from_page(context, "categories_carousel")
    first_element = element_list[0].icon

    if context.driver_wrapper.is_ios_test():
        context.driver.execute_script("arguments[0].scrollIntoView({'behavior':'smooth'});", first_element.web_element)
    else:
        first_element.set_focus()
    last_element = element_list[len(element_list) - 1].icon
    context.driver.execute_script("arguments[0].scrollIntoView({'behavior':'smooth'});", last_element.web_element)

    _scroll_up_explore_tab(context)


@step('user belongs to the "{audience}" audience')
def user_belongs_to_audience(context, audience):
    """
    Step. Checks if a user belongs to a given audience. So far only one audience is expected to be received
    eventhough it could receive a list
    :param context: behave context
    """
    if _audience_needs_installation_id(audience):
        previous_page = get_unprefixed_class_name(context.driver_wrapper, context.current_page.__class__.__name__)
        open_deeplink(context, deeplink_name='Native.Developer settings')
        context.current_page = BaseDeveloperSettings().wait_until_loaded()
        context.current_page.open_section(section_name='information_view')
        context.current_page = BaseInformationOptions()
        sanitized_id = context.current_page.sanitized_installation_id.text
        context.driver.back()
        context.driver.back()
        context.current_page = get_page_object(context, previous_page)
        os_version = map_param('[TOOLIUM:AppiumCapabilities_platformVersion]')
        os_model = map_param('[TOOLIUM:AppiumCapabilities_platformName]')
        belongs_to_audience = \
            context.context_response.get_audience_for_user(audience, os_version, os_model, sanitized_id)
    else:
        belongs_to_audience = context.context_response.get_audience_for_user(audience=audience)

    if not belongs_to_audience:
        skip_execution(context, reason=f"User doesn't belong to {audience} audience")
    else:
        logger.debug("User belongs to '%s' audience", audience)


@step('displays the "{element_name}" in the "{element_type}" explore element')
def focus_over_element(context, element_name, element_type):
    """
    Step. Sets the focus over the element {element_name}.

    :param context: Behave context
    :param element_name: Name of the element to be focused.
    :param element_type: Card o module explore element.
    """
    element = getattr(context.storage[element_type], element_name)
    display_element_on_screen(element)


def _audience_needs_installation_id(audience):
    """
    Step. Check if an audience needs the installation id.
    Currently it's needed when audience is "kindred"
    :param context: behave context
    """
    return 'kindred' in audience


def _scroll_up_explore_tab(context):
    """
    Step. Scroll up an Explore page by tapping the explore icon in the navigation tab bar
    :param context: behave context
    """
    navigation_tab_bar = get_element_from_page(context, 'navigation_tab_bar')
    navigation_tab_bar.explore_tab.click()


@step('user has content for some Explore category')
def user_has_category_content(context):
    """
    Step. Get name and id of any category with content

    :param context: behave context
    """

    has_category_content = context.context_response.has_explore_category_content()
    if not has_category_content:
        skip_execution(context, reason="User has no content for any category")

    else:
        context.category_name = _get_category_key_from_name_api(context, has_category_content,
                                                                id_or_name="name")
        logger.debug("Found the '%s' category with content", context.category_name)


@step('an explore category has been segmented with an audience')
def an_explore_category_is_segmented(context):
    """
    Step. Checks if any explore category has been segmented with an audience, if there is, it'll be set in the context.
    :param context: behave context
    """

    has_segmented_category = context.context_response.has_segmented_category()
    if not has_segmented_category:
        skip_execution(context, reason="No segmented category configured")
    else:
        context.storage['audience'] = has_segmented_category['audience']
        context.storage['category_key'] = has_segmented_category['category']
        context.storage['category_name'] = _get_category_key_from_name_api(context, context.storage['category_key'],
                                                                           id_or_name="name")
        logger.debug("Found the '%s' category segemented with '%s' audience",
                     context.storage['category_name'],
                     has_segmented_category['audience'])

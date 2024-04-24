"""
Element actions steps
"""
import os

from datetime import datetime, date, timedelta
import calendar
import random
import string

from io import BytesIO
from random import randrange
from PIL import Image
import requests
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from appium.webdriver.common.appiumby import AppiumBy

from selenium.webdriver.common.actions.action_builder import ActionBuilder
from selenium.webdriver.common.actions.pointer_actions import PointerActions
from selenium.common.exceptions import ElementClickInterceptedException, NoSuchElementException, TimeoutException, \
    WebDriverException
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.by import By
from toolium.driver_wrappers_pool import DriverWrappersPool
from toolium.pageelements import Text, PageElement, PageElements
from toolium.utils.dataset import map_param
from toolium.utils.path_utils import makedirs_safe
from toolium.visual_test import VisualTest

from acceptance.app.common.actions.base.rating_bar import BaseRatingBar
from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.app.common.actions.base.switch import BaseSwitch
from acceptance.app.common.autonavigation.path_finder import PathFinder
from acceptance.app.common.autonavigation.navigable_page_elements import RuntimeBackButton
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.steps.user_features.selector_handler import pick_subscription
import contextlib

from acceptance.common.utils.utils import LocaleManager


@step('clicks on the "{element_name}" button')
@step('clicks on the "{element_name}" radio button')
@step('clicks on the "{element_name}" icon')
@step('clicks on the "{element_name}" link')
@step('clicks on the "{element_name}" switch')
@step('clicks on the "{element_name}" module')
@step('clicks on the "{element_name}" card')
@step('clicks on the "{element_name}" allowance roundel')
@step('clicks on the "{element_name}" inputtext')
@step('clicks on the "{element_name}" checkbox')
@step('clicks on the "{element_name}" entrypoint')
@step('clicks on the "{element_name}" drop-down')
def click_on_element(context, element_name):
    """
    step. Performs click on an element that is visible on the page auto-scroll is done if it necessary

    :param context: behave context
    :param element_name: element name to click
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    if isinstance(element, RuntimeBackButton):
        PathFinder().remove_navigation_runtime_back_path(
            context.driver_wrapper,
            context.current_page.__class__.__name__,
        )
    try:
        element.click()
    except TimeoutException:
        # Sometimes, depending of the contents of a screen and the device screen size, like in the entrypoints
        # in Support in iOS, the XCUIElementTypeCell that contains the element is displayed by the native scroll but
        # not the entrypoint so the element is not clickable. Also detected with the elements in a Group.
        # A scroll down/up is done because we are not sure the direction the element will be
        # and we try again the click in the element

        # First we try a scroll down and display the element in case the scroll down has hidden it
        BaseScreen().native_scroll_down()
        display_element_on_screen(element)
        try:
            element.click()
        except TimeoutException:
            # If scroll down doesn't works, then we display again the element and do a scroll up
            display_element_on_screen(element)
            BaseScreen().native_scroll_up()
            element.click()
    except ElementClickInterceptedException:
        context.driver.execute_script('arguments[0].scrollIntoView({inline: "center"});', element.web_element)
        element.click()


@step('clicks on the "{subscription_type}" subscription type')
def click_on_subscription(context, subscription_type):
    """
    step. Performs click on a subscription

    :param context: behave context
    :param subscription_type: subscription type to click
    """
    pick_subscription(context, subscription_type)


@step('clicks on the "{tab_name}" tab')
def click_on_tab(context, tab_name):
    """
    step. Performs click on a tab element that is visible on the page auto-scroll is done if it is necessary

    :param context: behave context
    :param tab_name: tab name to click
    """
    tab = get_element_from_page(context, tab_name)
    display_element_on_screen(tab)
    with contextlib.suppress(ElementClickInterceptedException, TimeoutException):
        tab.click()


@step('clicks on the "{element_name}" checkbox with "{expected_text}" text')
@step('clicks on the "{element_name}" link with "{expected_text}" text')
@step('clicks on the "{element_name}" button with "{expected_text}" text')
def click_on_element_with_text(context, element_name, expected_text):
    """
    step. Performs click on an element after checking the text

    :param context: behave context
    :param element_name: element name to click
    :param expected_text: expected text
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    assert element.text == expected_text, f"'{element.text}' is not equal to '{expected_text}'"
    element.click()


@step('clicks on the "{index}" element in the "{element_name}" list')
def click_on_element_in_index(context, index, element_name):
    """
    step. Performs click on an element in the index position in the element_name list
    When the function is called with index=any, a random selection will be done among the pageelements

    :param context: behave context
    :param index: index of the element in the element_name list to click.
    :param element_name: element name of the list
    """
    element = get_element_from_page(context, element_name)
    total = len(element)
    index = randrange(total) if index == "any" else int(index)
    display_element_on_screen(element[index])
    try:
        element[index].click()
    except AttributeError:
        element[index].web_element.click()


@step('clicks on any element in the "{element_name}" list with the "{field_name}" field')
def click_on_element_with_field_in_list(context, element_name, field_name):
    """
    step. Performs click on an element in the element_name list with the expected text in the field_name

    :param context: behave context
    :param element_name: element name of the list
    :param field_name: name of the field in the elements of the list
    """
    elements_list = get_element_from_page(context, element_name)
    for element in elements_list:
        if getattr(element, field_name).is_present():
            try:
                # Click of the first element found
                getattr(element, field_name).click()
            except AttributeError:
                getattr(element, field_name).web_element.click()
            return
    raise ValueError(f"'No element in the '{elements_list}' list with '{field_name}' field")


@step('clicks on any element in the "{element_name}" list with the "{field_name}" field '
      'that contains the "{expected_text}" text')
def click_on_element_with_text_in_list(context, element_name, field_name, expected_text):
    """
    step. Performs click on an element in the element_name list with the expected text in the field_name

    :param context: behave context
    :param element_name: element name of the list
    :param field_name: name of the field in the elements of the list
    :param expected_text: text of the field to be clicked
    """
    selected_elements = []
    elements_list = get_element_from_page(context, element_name)
    for element in elements_list:
        if getattr(element, field_name).is_present():
            if expected_text.lower() in getattr(element, field_name).text.lower():
                selected_elements.append(element)

    assert selected_elements, f"'No element in the '{elements_list}' list with '{field_name}' field " \
                              f"that contains the '{expected_text}' text found"
    # Click of the first element found
    try:
        selected_elements[0].click()
    except AttributeError:
        selected_elements[0].web_element.click()


@step('clicks on any element in the "{element_name}" list that contains the "{expected_text}" text')
def click_on_any_element_with_text_in_list(context, element_name, expected_text):
    """
    step. Performs click on an element in the element_name list with the expected text

    :param context: behave context
    :param element_name: element name of the list
    :param expected_text: text of the field to be clicked
    """
    elements_list = get_element_from_page(context, element_name)
    selected_elements = [e for e in elements_list if expected_text.lower() in e.text.lower() and e.is_visible()]
    if not selected_elements:
        if context.driver_wrapper.is_android_test():
            # In case the element is not in the structure, scroll into text is done to try to find it in Android
            BaseScreen().native_scroll_into_text(expected_text)
        else:
            # In case in iOS is not visible a scroll down is done to update the screen due a strange error detected in
            # the list of options in autodiagnosis flow that the scroll into view was clicking on an element after
            # doing the scroll
            BaseScreen().native_scroll_down()
        selected_elements = [e for e in elements_list if expected_text in e.text]
    assert selected_elements, f"'No element in the '{elements_list}' list " \
                              f"that contains the '{expected_text}' text found"
    index = randrange(len(selected_elements))
    display_element_on_screen(selected_elements[index])
    try:
        selected_elements[index].click()
    except AttributeError:
        selected_elements[index].web_element.click()


@step('fills the "{element_name}" inputtext with the "{text}" text')
def fill_text_field(context, element_name, text):
    """
    step. Fills a input text field with a text

    :param context: behave context
    :param element_name: inputtext that will be filled
    :param text: text
    """
    if text.startswith("RANDOM:"):
        text = ''.join(random.choices(string.ascii_lowercase, k=int(text.split(':')[1])))
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    if element.webview or context.driver_wrapper.is_web_test():
        context.driver.execute_script("arguments[0].value = '';", element.web_element)
        # Workaround: For some webviews when setting the new value, the previous one just cleared is also concatenated
        element.text = ''
        context.driver.execute_script("arguments[0].value = '';", element.web_element)
    else:
        try:
            if context.driver_wrapper.is_ios_test():
                element.click()  # Workaround for iOS >= 15.5
            element.clear()
        except NoSuchElementException:
            # In some Android devices keyboard might hide the input text
            if context.driver_wrapper.is_android_test():
                context.driver.swipe(0, 500, 0, 200, 250)
    element.text = text


@step('fills the "{element_name}" inputtext with the a valid street number')
def fill_street_number_field(context, element_name):
    """
    step. Fills a input text field with a valid street number

    :param context: behave context
    :param element_name: inputtext that will be filled
    """
    street_number_list = ["2-8", "2-9"]
    element = get_element_from_page(context, element_name)
    if element.text in street_number_list:
        street_number_list.remove(element.text)
    fill_text_field(context, element_name, street_number_list[0])


@step('clears the "{element_name}" inputtext')
def clear_text_field(context, element_name):
    """
    step. Clears the content of an element

    :param context: behave context
    :param element_name: inputtext that will be cleare
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    if element.webview:
        context.driver.execute_script("arguments[0].value = '';", element.web_element)
    else:
        element.clear()


@step('scrolls to "{element_name}" button')
@step('scrolls to "{element_name}" icon')
@step('scrolls to "{element_name}" link')
@step('scrolls to "{element_name}" entrypoint')
@step('scrolls to "{element_name}" switch')
@step('scrolls to "{element_name}" tab')
@step('scrolls to "{element_name}" graph')
@step('scrolls to "{element_name}" textfield')
def scroll_to_element(context, element_name):
    """
    step. Scrolls to until the element is visible on the screen

    :param context: behave context
    :param element_name: element name to show
    """
    if context.driver_wrapper.is_mobile_test():
        element = get_element_from_page(context, element_name)
        display_element_on_screen(element)
    else:
        context.execute_steps(u"""
            When I scroll to the element "{}"
        """.format(element_name))


@step('swipes from right to left over "{element_name}" element')
def swipe_right_left_over_element(context, element_name):
    """
    step. Swipes from right to the left over an element

    :param context: behave context
    :param element_name: name of the element to swipe
    """
    element = get_element_from_page(context, element_name)
    if isinstance(element, PageElements):
        element = element.parent
    start_x = element.web_element.location['x'] + (element.web_element.size['width'] / 1.1)
    start_y = element.web_element.location['y'] + (element.web_element.size['height'] / 2)
    end_x = element.web_element.location['x'] + (element.web_element.size['width'] / 9)
    end_y = start_y
    context.driver.swipe(start_x, start_y, end_x, end_y, 1000)


@step('swipes from left to right over "{element_name}" element')
def swipe_left_right_over_element(context, element_name):
    """
    step. Swipes from left to the right over an element

    :param context: behave context
    :param element_name: name of the element to swipe
    """
    element = get_element_from_page(context, element_name)
    if isinstance(element, PageElements):
        element = element.parent
    start_x = element.web_element.size['width'] / 9
    start_y = element.web_element.location['y'] + (element.web_element.size['height'] / 2)
    end_x = element.web_element.location['x'] + (element.web_element.size['width'] / 1.1)
    end_y = start_y
    context.driver.swipe(start_x, start_y, end_x, end_y, 1000)


@step('swipes from right to left over "{scroll_element_name}" element until "{find_element_name}" is displayed')
def swipe_right_left_find_element(context, scroll_element_name, find_element_name):
    """
    step. Swipes from right to the left over a horizontal scrollable element until finding the requested element

    :param context: behave context
    :param scroll_element_name: name of the element to swipe
    :param find_element_name: name of the element to find
    """
    # We make quick swipes few times from right to left in order to position the carousel at the beginning
    initial_scroll = 0
    scroll_element = get_element_from_page(context, scroll_element_name)
    display_element_on_screen(scroll_element)
    while initial_scroll < 2:
        start_y = scroll_element.web_element.location['y'] + (scroll_element.web_element.size['height'] / 2)
        start_x = scroll_element.web_element.location['x']
        end_x = scroll_element.web_element.location['x'] + (scroll_element.web_element.size['width'] / 1.5)
        end_y = start_y
        context.driver.swipe(start_x, start_y, end_x, end_y, 75)
        initial_scroll += 1

    element = get_element_from_page(context, find_element_name)
    count = 0
    while not element.is_visible() and count < 6:
        start_x = scroll_element.web_element.location['x'] + (scroll_element.web_element.size['width'] / 1.5)
        start_y = scroll_element.web_element.location['y'] + (scroll_element.web_element.size['height'] / 2)
        end_x = scroll_element.web_element.location['x']
        end_y = start_y

        context.driver.swipe(start_x, start_y, end_x, end_y, 1000)
        count += 1


@step('swipes from "{direction}" over "{element_name}" carousel element')
def swipe_over_large_element(context, direction, element_name):
    """
    step. Swipes from right to the left over an element that occupies the entire screen width

    :param context: behave context
    :param direction: direction of the swap. Can be 'left to right' or 'right to left'
    :param element_name: name of the element to swipe
    """
    explore_web = False
    if "modules_list" in element_name:  # Needed with the method in Explore as a web
        element = context.storage['module'].carousel
        explore_web = True
    else:
        element = get_element_from_page(context, element_name)

    display_element_on_screen(element)

    elem_y = element.web_element.location['y'] + (element.web_element.size['height'] / 2)
    if context.driver.context != 'NATIVE_APP':
        context.driver.switch_to.context('NATIVE_APP')
    offset_y = context.driver.get_window_size()['height'] * 0.20  # to include the native header
    start_y = elem_y + offset_y if explore_web else elem_y
    end_y = start_y

    if direction == "right to left":
        start_x = element.web_element.location['x'] + (element.web_element.size['width'] / 1.5)
        end_x = element.web_element.location['x']

    elif direction == "left to right":
        start_x = element.web_element.location['x']
        end_x = element.web_element.location['x'] + (element.web_element.size['width'] / 1.5)

    else:
        raise Exception("Not valid direction, possible values 'left to right' or 'right to left'")

    context.driver.swipe(start_x, start_y, end_x, end_y, 1000)


def get_element_from_parent_by_text(context, parent_element, text):
    """
    Return the instance of the textfield element

    :param parent_element: parent element from which to find the textfield
    :param text: string to find inside parent element
    :return: instance of the textfield element
    """
    if not context.driver_wrapper.is_mobile_test() or parent_element.webview:
        textfield_element = Text(By.XPATH, './/*[text()="{}"]'.format(text), parent=parent_element,
                                 webview=parent_element.webview)
    else:
        if context.driver_wrapper.is_ios_test():
            textfield_element = Text(AppiumBy.IOS_PREDICATE, "type == 'XCUIElementTypeStaticText' \
                AND label == '{0}' OR value == '{0}'".format(text))
        else:
            textfield_element = Text(By.XPATH, '//*[@text="{0}"]|//*[@value="{0}"]'.format(text), parent=parent_element)
    return textfield_element


def display_element_on_screen(element):
    """
    Try to display the element on the screen by scrolling as necessary

    :param element: element to display on the screen
    """
    BaseScreen().scroll_into_view(element)


def _click(context, element, field):
    """
    Helper method to click an element

    :param context: behave context
    :param element: the clickable element
    """
    display_element_on_screen(element)
    try:
        getattr(element, field).click()
    except ElementClickInterceptedException:
        context.driver.execute_script('arguments[0].scrollIntoView({inline: "center"});', element.web_element)
        getattr(element, field).click()


@step('clicks on the "{field}" button of "{element_list}" list with "{index}" index')
@step('clicks on the "{field}" field of "{element_list}" list with "{index}" index')
def click_field_group_list(context, field, element_list, index):
    """
    step. Click on the field with the index in the list
    When the function is called with index=any, a random selection will be done among the pageelements
    :param context: behave context
    :param field: field in the list to click
    :param element_list: list of elements based on Groups
    :param index: index of the element in the list
    """
    element_list = get_element_from_page(context, element_list)
    total = len(element_list.page_elements)
    index = randrange(total) if index == "any" else int(index)
    element = element_list[int(index)]
    display_element_on_screen(element)
    try:
        getattr(element, field).click()
    except ElementClickInterceptedException:
        context.driver.execute_script('arguments[0].scrollIntoView({inline: "center"});', element.web_element)
        getattr(element, field).click()


@step('stores the attribute "{attribute}" from the "{field}" field of "{element_list}" list with "{index}" index')
def store_context_attribute_value(context, attribute, field, element_list, index):
    """
    step. store the attribute passed as param from field element of the list to context
    :param attribute: attribute to get
    :param context: behave context
    :param field: field in the list to get
    :param element_list: list of elements based on Groups
    :param index: index of the element in the list
    """
    element_list = get_element_from_page(context, element_list)
    total = len(element_list.page_elements)
    index = randrange(total) if index == "any" else int(index)
    element = element_list[index]
    display_element_on_screen(element)

    context.storage[field] = getattr(element, field).get_attribute(attribute)


@step('stores the text value from the "{field}" field of "{element_list}" list with "{index}" index')
def store_context_text_value(context, field, element_list, index):
    """
    step. store the text value from given field element of the list to context
    :param context: behave context
    :param field: field in the list to get
    :param element_list: list of elements based on Groups
    :param index: index of the element in the list
    """
    element_list = get_element_from_page(context, element_list)
    total = len(element_list.page_elements)
    index = randrange(total) if index == "any" else int(index)
    element = element_list[index]
    display_element_on_screen(element)

    context.storage[field] = getattr(element, field).text


@step('selects the "{option}" option in the "{select}" select')
def select_option_in_select_element(context, option, select):
    """
    step. Selects the provided option in the desired selector
    :param context: behave context
    :param option: text in the option. Note that this option can be a part of the option to select (Contains check)
    :param select: selector element
    """
    select_element = get_element_from_page(context, select)
    if select_element.web_element.tag_name == "a":
        select = f"{select}_a"
        select_a = get_element_from_page(context, select)
        select_a.click()
    else:
        select_element = Select(select_element.web_element)
        selector_texts = [item.text for item in select_element.options]
        index = next(index for index, item in enumerate(selector_texts) if option in item)
        select_element.select_by_index(index)


@step('selects the "{option}" bill option in the "{select}" select')
def select_option_in_select_element_billing(context, option, select):
    """
    step. Selects the provided option in the desired selector
    :param context: behave context
    :param option: text in the option. Note that this option can be a part of the option to select (Contains check)
    :param select: selector element
    """
    get_element_from_page(context, select).click()
    bill_selector = get_element_from_page(context, 'bill_selector')
    if not bill_selector.is_present():
        # There is only one document, then no list with options is displayed. The invoice is automatically downloaded
        return
    selector_texts = [item.text for item in bill_selector.elements]
    index = next(index for index, item in enumerate(selector_texts) if option in item)
    bill_selector.elements[index].click()


@step('clicks on the search key for the "{element_name}" inputtext')
@step('clicks on the enter key for the "{element_name}" inputtext')
def click_enter_button_keyboard(context, element_name):
    """
    step. Send an enter in a field. Works the same as tapping in the Enter/Search button in the native keyboard

    :param context: behave context
    :param element_name: element name to send the enter
    """
    element = get_element_from_page(context, element_name)
    element.text = "\n"


@step('take a screenshot of "{element_name}" and save it as "{image_name}"')
def take_elem_screenshot(context, element_name, image_name):
    """
    step. Step to take a screenshot of an element in order to use it as a baseline image for visual testing.
          This step should be executed locally to help you getting the screenshot of the element.
          It is not meant to use in a real scenario.
          Run it both on ios and android to save the image in its corresponding baseline folder
    :param element_name: Name of the element to take the screenshot
    :param image_name: Name of the image to be saved in the baseline folder
    :param context: behave context
    """
    image_name = image_name + ".png"
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    web_element = context.utils.get_web_element(element)
    screenshot = Image.open(BytesIO(context.driver_wrapper.driver.get_screenshot_as_png()))
    screenshot = VisualTest().mobile_resize(screenshot)
    screenshot = VisualTest().crop_element(screenshot, web_element)
    path = os.path.join(DriverWrappersPool.visual_baseline_directory, map_param('[TOOLIUM:Driver_type]'))
    makedirs_safe(path)
    screenshot.save(os.path.join(path, image_name))


@step('clicks on the relative position x:"{x_percent}" y:"{y_percent}" of the "{element_name}" element')
def clicks_on_relative_position_of_element_rect(context, x_percent, y_percent, element_name):
    """
    step. Clicks on the relative position of an element based on the coordinates of the element rect's dimension and the
    relative position received by parameter.
    :param context: behave context
    :param x_percent: % of the total element's width size
    :param y_percent: % of the total element's height size
    :param element_name: element name to click based on relative position
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)

    rect = element.web_element.rect
    x_coordinate = rect['x'] + (rect['width'] * float(x_percent))
    y_coordinate = rect['y'] + (rect['height'] * float(y_percent))

    action = ActionBuilder(context.driver_wrapper.driver)
    p_pointer = action.add_pointer_input("touch", "finger")
    pointer_action = PointerActions(p_pointer)
    p_pointer.create_pointer_move(duration=0, x=x_coordinate, y=y_coordinate, origin='viewport')
    pointer_action.pointer_down()
    pointer_action.pause(0.1)
    pointer_action.pointer_up()
    action.perform()


@step('I click on the element with "{field}" field with "{value}" value of the "{element_list}" list')
@step('clicks on the element with "{field}" field with "{value}" value of the "{element_list}" list')
def clicks_field_value_list(context, field, value, element_list):
    """
    step. Given a list(Groups) of Group pagelements, click on the "field" page element which text matches a given value.
    :param context: behave context
    :param field: field in the list to click
    :param value: value expected in the field
    :param element_list: list of elements
    """
    element_list = get_element_from_page(context, element_list)
    for element in element_list:
        display_element_on_screen(element)
        field_element = getattr(element, field)
        if value == field_element.text:
            sub_element_list = ['chevron', 'checkbox']
            for sub_element in sub_element_list:
                if hasattr(element, sub_element):
                    getattr(element, sub_element).click()
                    return
            raise NoSuchElementException("No {} in sub elements".format(str(sub_element_list)[1:-1]))

    raise NoSuchElementException("Element with text '{}' in field '{}' not found".format(value, field))


@step('clicks on any element in the "{list_name}" list')
@step('clicks on any element in the "{list_name}" carousel')
@step('clicks on any card in the "{list_name}" carousel')
def click_on_any_element_in_list(context, list_name):
    """
    step. Performs click on any element in the element_name list

    :param context: behave context
    :param list_name: element name of the list
    """
    elements_list = get_element_from_page(context, list_name)
    assert elements_list, f"No element in the '{list_name}' list"

    # Click of the first element found
    try:
        elements_list[0].click()
    except AttributeError:
        elements_list[0].web_element.click()


@step('clicks on any element in the "{list_name}" entrypoints list')
def click_on_any_element_in_entrypoints_list(context, list_name):
    """
    step. Performs click on any element in the list_name entrypoints list and store the title in the context

    :param context: behave context
    :param list_name: element name of the list
    """
    elements_list = get_element_from_page(context, list_name)
    assert elements_list, f"No element in the '{list_name}' entrypoint list"

    index = randrange(len(elements_list))
    try:
        context.storage['reason_clicked'] = elements_list[index].title.text
        elements_list[index].chevron.click()
    except AttributeError:
        elements_list[index].chevron.web_element.click()


@step('selects the "{element_name}" switch')
@step('selects the "{element_name}" checkbox')
def selects_switch_element(context, element_name):
    """
    step. Selects the switch, using the custom implementation defined in common actions.
    Used the same implementation for Checkboxes as the action done perfoms the same.

    :param context: behave context
    :param element_name: element name defined as switch
    """
    element = get_element_from_page(context, element_name)
    if element.webview or context.driver_wrapper.is_web_test():
        is_checked = element.get_attribute('aria-checked') == 'true'
    else:
        is_checked = BaseSwitch().is_enabled(element)
    if not is_checked:
        element.click()


@step('unselects the "{element_name}" switch')
@step('unselects the "{element_name}" checkbox')
def unselects_switch_element(context, element_name):
    """
    step. Unselects the switch, using the custom implementation defined in common actions.
    Used the same implementation for Checkboxes as the action done perfoms the same.

    :param context: behave context
    :param element_name: element name defined as switch
    """
    element = get_element_from_page(context, element_name)
    if BaseSwitch().is_enabled(element):
        element.click()


@step('clicks on the "{element_type}" element with "{text}" text')
def click_element_with_given_text(context, element_type, text):  # noqa: ARG001
    """
    step. Clicks on an element not defined in a page object. The element is located by its text and is instantiate as a
    native or webview element
    :param context: behave context
    :param element_type: element's type (webview or native)
    :param text: element's text
    """
    if element_type not in {"webview", "native"}:
        raise Exception("Element's type should be: webview, native")

    element = PageElement(By.XPATH, './/*[text() = "{}"]'.format(text), webview=element_type == "webview")
    display_element_on_screen(element)
    element.web_element.click()


@step('clicks on "{number_of_stars}" stars on "{app_rating_bar}" rating bar')
def click_on_number_of_starts(context, number_of_stars, app_rating_bar):
    """
    step. Clicks on the number of stars of the rating start bar element
    :param context: behave context
    :param number_of_stars: number of stars, vale 'any' uses a random value between 1 and 5
    :param app_rating_bar: name of the rating star bar element
    """
    if number_of_stars == "any":
        number_of_stars = randrange(1, 5)
    number_of_stars = int(number_of_stars)
    if number_of_stars not in {1, 2, 3, 4, 5}:
        context.scenario.skip(reason="number of stars '{}' is not in the range [1-5]".format(number_of_stars))
    app_rating_bar_element = get_element_from_page(context, app_rating_bar)
    BaseRatingBar().click_on_stars(app_rating_bar_element, number_of_stars)


@step('clicks on all "{field}" buttons of "{element_list}" list')
@step('clicks on all "{field}" fields of "{element_list}" list')
def clicks_all_fields_list(context, field, element_list):
    """
    step. Click on all fields in the list
    :param context: behave context
    :param field: field in the list to click
    :param element_list: list of elements based on Groups
    """
    element_list = get_element_from_page(context, element_list)
    for element in element_list:
        _click(context, element, field)


@step('clicks on all "{field}" buttons of "{element_list}" list except one')
@step('clicks on all "{field}" fields of "{element_list}" list except one')
def clicks_all_fields_list_except_one(context, field, element_list):
    """
    step. Click on all fields in the list except one
    :param context: behave context
    :param field: field in the list to click
    :param element_list: list of elements based on Groups
    """
    element_list = get_element_from_page(context, element_list)
    total = len(element_list.page_elements)
    index_to_skip = randrange(total)
    for index, element in enumerate(element_list):
        if index != index_to_skip:
            _click(context, element, field)


@step('selects "{num}" elements of "{element_list}" list')
def click_num_elements_list(context, num, element_list):
    """
    step. Select a num of elements in the list
    :param context: behave context
    :param num: total elements to select
    :param element_list: list of elements based on Groups
    """
    element_list = get_element_from_page(context, element_list)
    if int(num) > len(element_list.page_elements):
        raise ValueError(f"List only has {len(element_list.page_elements)} elements. Cannot select {num} elements")

    for index, element in enumerate(range(int(num))):
        element = element_list[int(index)]
        display_element_on_screen(element)
        try:
            getattr(element, "unselected").click()
        except ElementClickInterceptedException:
            context.driver.execute_script('arguments[0].scrollIntoView({inline: "center"});', element.web_element)
            getattr(element, "unselected").click()


@step('clicks on the "{element_name}" element if visible')
def click_on_element_if_visible(context, element_name):
    """
    step. Clicks on an element only if it is visible.
    :param context: behave context
    :param element_name: element name
    """
    element = get_element_from_page(context, element_name)
    if element.is_visible():
        element.click()


@step('fills the "{element_name}" inputtext with a valid email')
def fill_email_field(context, element_name):
    """
    step. Fills a input text field with a valid email

    :param context: behave context
    :param element_name: inputtext that will be filled
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    email = 'qa.automation2023@gmail.com'
    try:
        if element.text.lower().rstrip() == email:
            email = 'qa.automation2023+01@gmail.com'
    except WebDriverException:
        if element.web_element.text.lower() == email:
            email = 'qa.automation2023+01@gmail.com'
    if element.webview:
        context.driver.execute_script("arguments[0].value = '';", element.web_element)
        # Workaround: For some webviews when setting the new value, the previous one just cleared is also concatenated
        element.text = ''
        context.driver.execute_script("arguments[0].value = '';", element.web_element)
    else:
        try:
            if context.driver_wrapper.is_ios_test():
                element.click()  # Workaround for iOS >= 15.5
            element.clear()
        except NoSuchElementException:
            # In some Android devices keyboard might hide the input text
            if context.driver_wrapper.is_android_test():
                context.driver.swipe(0, 500, 0, 200, 250)
    element.text = email


@step('selects a bill in the "{element_list}" list whose due_date is after "{bill_due_date}"')
def select_due_date_elements_list(context, element_list, bill_due_date):
    """
    step. Select a a bill with due date after the expected
    :param context: behave context
    :param element_list: list of elements based on Groups
    :param bill_due_date: minimum expected bill due date. Format mm-yyyy
    """
    try:
        bill_due_date_validated = datetime.strptime(bill_due_date, '%m-%Y')
    except ValueError:
        raise ValueError("Incorrect data format, should be MM-YYYY")
    element_list = get_element_from_page(context, element_list)
    locale_time = 'pt_BR.UTF-8'
    for element in element_list:
        current_bill_date = getattr(element, "bill_date").text
        current_due_date = getattr(element, "due_date").text
        with LocaleManager(locale_time):
            if int(current_bill_date[len(current_bill_date) - 4:]) > bill_due_date_validated.year or \
                    (int(current_bill_date[len(current_bill_date) - 4:]) == bill_due_date_validated.year and
                    list(calendar.month_abbr).index(current_due_date[len(current_due_date) - 3:].capitalize()) >
                    bill_due_date_validated.month):
                display_element_on_screen(element)
                try:
                    getattr(element, "selected").click()
                except ElementClickInterceptedException:
                    context.driver.execute_script('arguments[0].scrollIntoView({inline: "center"});',
                                                   element.web_element)
                    getattr(element, "selected").click()
                    return
                else:
                    return


@step('pulls down the page to refresh')
def pull_down_refresh(context):
    """
    step. Scroll the page down to refresh
    """
    # TODO(lmcalvo): Implement this step
    # https://jira.tid.es/browse/NOV-237379
    return context


@step('clicks on the "{element_name}" web link')
def click_on_web_link_element(context, element_name):
    """
    step. Performs click on an web element that is visible on the page auto-scroll is done if it necessary

    :param context: behave context
    :param element_name: link name to click
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    context.driver.execute_script("arguments[0].click();", element.web_element)


@step('clicks on yesterday date in "{calendar_input}" calendar input')
def select_yesterday_in_calendar(context, calendar_input):
    """
    step. Select the day in the calendar from 70 days from today.
    :param context: behave context
    """
    element = get_element_from_page(context, calendar_input)
    selected_day = date.today() - timedelta(days=1)
    select_day_in_calendar(context, selected_day, element)


def select_day_in_calendar(context, selected_day, calendar_input):
    """
    Selects a day in the calendar
    :param context: behave context
    :param selected_day: day to be selected in the calendar
    :param calendar_input:
    """
    if context.driver_wrapper.is_android_test():
        # Because the performance issues switching between webview and native context, the native calendar automation
        # has been replaced by setting directly the date value. The date field has to be changed before to text element,
        # if not, the field is not filled with the date, not sure the reason but it seems that the correct format should
        # be the iso format.
        # In case the performance with switching contexts improves, the previous code can be found in PR #2709
        context.driver.execute_script("arguments[0].type = '{}';", calendar_input.web_element,
                                      'text')
        calendar_input.text = selected_day.isoformat()
        context.driver.execute_script("arguments[0].type = '{}';", calendar_input.web_element,
                                      'date')
    else:
        # Done setting directly the value and rising the update event with javascript because we were unable
        # to get the native calendar to be displayed in iOS
        calendar_input.text = selected_day.isoformat()
        js_file = requests.get('https://unpkg.com/react-trigger-change/dist/react-trigger-change.js', timeout=10)
        context.driver.execute_script(js_file.text)
        context.driver.execute_script("reactTriggerChange(arguments[0]);", calendar_input.web_element)


@step('clicks on the "{link}" link of the card with "{text}" text on the "{field}" field of the "{carousel}" carousel')
@step('clicks on the "{link}" button of the element with "{text}" text on the "{field}" field of the "{carousel}" list')
def clicks_on_link_of_carousel_with_text(context, link, text, field, carousel):
    """
    step. Clicks on the card link with the expected text on the expected field of the carousel

    :param context: behave context
    :param link: link of the card
    :param text: expected text of the card
    :param field: field of the card
    :param carousel: carousel to check
    """
    def click_on_element(carousel_module):
        for card in carousel_module:
            if text in getattr(card, field).text:
                context.driver.execute_script('arguments[0].scrollIntoView({block: "center", inline: "center"});',
                                              card.web_element)
                card_link = getattr(card, link)
                card_link.click()
                break
        else:
            raise ValueError(f"No card with the -'{text}'- text in the '{field}' field of the '{carousel}' carousel")

    carousel_module = get_element_from_page(context, carousel)
    assert len(carousel_module) > 0, f"-'{carousel}'- carousel not found or length = 0"
    try:
        click_on_element(carousel_module)
    except ValueError:
        carousel_module = get_element_from_page(context, carousel)
        click_on_element(carousel_module)

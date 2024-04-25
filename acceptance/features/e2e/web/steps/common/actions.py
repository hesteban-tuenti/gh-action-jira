"""
Common actions steps
"""
from random import randrange

from behave import step as behave_step  # noqa: F401

from selenium.common.exceptions import ElementClickInterceptedException, ElementNotInteractableException
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains

from toolium_telefonica.behave import step

from acceptance.common.constants.constants import CHECKOUT_PAGE_OBJECTS


@step('I clear the "{field}" web input value')
def clear_web_input(context, field):
    """
    step. Clears an input text field

    :param context: behave context
    :param field: inputtext to clear
    """
    element = context.get_element_from_current_page(field)
    context.driver.execute_script("arguments[0].value = '';", element.web_element)


@step(u'I replace the "{field}" field value with "{value}"')
def replace_field_with_value(context, field, value):
    """
    step. Fills a input text field with a value

    :param context: behave context
    :param field: inputtext to be filled
    :param value: text value
    """
    element = context.get_element_from_current_page(field)
    element.set_focus()
    context.driver.execute_script("arguments[0].value = '';", element.web_element)
    setattr(element, 'text', value)


@step('I click on the "{field}" field on the "{index}" element in the "{element_name}" web list')
def click_on_element_in_index(context, field, index, element_name):
    """
    step. Performs click on the given field in element in the index position

    :param context: behave context
    :param field: field to click on
    :param index: index of the element in the element_name list to click
    :param element_name: element name of the list
    """
    element = context.get_element_from_current_page(element_name)
    total = len(element)
    index = randrange(total) if index == "any" else int(index)
    try:
        getattr(element.page_elements[index], field).click()
    except (ElementNotInteractableException, ElementClickInterceptedException):
        context.driver.execute_script("arguments[0].click();", getattr(element.page_elements[index], field).web_element)


@step('I click on the "{button_field}" button of the element with "{value}" value in the "{field}" field '
      'of the "{element_name}" web list')
def click_on_element_button_with_value_in_field(context, button_field, value, field, element_name):
    """
    step. Performs click on the given field in list element with a specific value

    :param context: behave context
    :param button_field: field to click on
    :param value: field value of the element in the element_name list to click
    :param element_name: element name of the list
    """
    elements = context.get_element_from_current_page(element_name)
    for element in elements:
        if getattr(element, field).text == value:
            getattr(element, button_field).click()
            return
    raise AssertionError(f"No '{button_field}' button in the item with '{value}' text in the '{field}' field "
                         f"of the '{element_name}' list")


@step(u'the cookies are loaded')
def get_cookies(context):
    """
    step. Get the browser cookies
    :param context: behave context
    """
    context.cookies = context.driver_wrapper.driver.get_cookies()


@step('I click on the item with "{index}" index from "{carousel}" web carousel')
def click_on_the_item_of_the_web_carousel(context, index, carousel):
    """
    step. Click on the item of the web carousel

    :param context: behave context
    :param index: index of the element to click
    :param carousel: carousel to click
    """
    element = context.get_element_from_current_page(carousel)
    element[int(index)].link.click()


@step('I press the Enter key on "{field}" field')
def press_enter_key(context, field):
    """
    step. Press the enter key
    :param context: behave context
    :param field: field to focus on to press the enter key
    """
    element = context.get_element_from_current_page(field)
    element.set_focus()
    ActionChains(context.driver).send_keys(Keys.ENTER).perform()


@step(u'I click on the "{name}" web button')
def click_button(context, name):
    """
    Press button using javascript. Useful for some buttons that don't work with the regular steps.
    :param context: behave context
    :param name: element name
    """
    element = context.get_element_from_current_page(name)
    context.driver.execute_script("arguments[0].click();", element.web_element)


@step(u'I click on the element with "{value}" value in "{attribute}" attribute in the "{element_name}" list')
def click_element_with_attribute_value(context, value, attribute, element_name):
    """
    step. Click on element with the given value in attribute

    :param context: behave context
    :param value: expected value
    :param attribute: attribute which value is going to be checked
    :param element_name: element name
    """
    elements = context.get_element_from_current_page(element_name)
    for element in elements:
        if element.get_attribute(attribute) == value:
            element.click()
            return
    raise AssertionError('Element with {} value in {} attribute not found'.format(value, attribute))


@step('I click on the "{index}" element in the "{element_name}" list')
def click_on_index_element_in_list(context, index, element_name):
    """
    step. Performs click on an element in the index position in the element_name list
    When the function is called with index=any, a random selection will be done among the pageelements

    :param context: behave context
    :param index: index of the element in the element_name list to click.
    :param element_name: element name of the list
    """
    element = context.get_element_from_current_page(element_name)
    total = len(element)
    index = randrange(total) if index == "any" else int(index)
    try:
        element[index].click()
    except ElementClickInterceptedException:
        context.driver.execute_script("arguments[0].click();", element[index].web_element)


@step('I switch to "{iframe_name}" iframe')
def switch_iframe(context, iframe_name):
    """
    step. switch to the desired iframe
    :param context: behave context
    :param iframe_name: name of the iframe to switch
    """
    frame = context.get_element_from_current_page(iframe_name)
    context.driver_wrapper.driver.switch_to.frame(frame.web_element)


@step('I switch to original frame')
def switch_original_iframe(context):
    """
    step. switch to the original iframe
    :param context: behave context
    """
    context.driver_wrapper.driver.switch_to.default_content()


@step('I click on the "{field}" field in the element "{element}"')
def click_in_element_field(context, field, element):
    """
    step. Click on the field of an element
    :param context: behave context
    :param field: name of the field to locate in the element
    :param element: element with the field
    """
    element = context.get_element_from_current_page(element)
    field_element = getattr(element, field)
    field_element.click()


@step('I fill the "{field}" field in the "{element}" element with "{value}"')
def fill_in_element_field_with_value(context, field, element, value):
    """
    step. Fill the field of an element with the desired value
    :param context: behave context
    :param field: name of the field to locate in the element
    :param element: element with the field
    :param value: text to write in the field
    """
    element = context.get_element_from_current_page(element)
    field_element = getattr(element, field)
    field_element.text = str(value)


@step('I enable the "{element}" switch')
def enable_element_switch(context, element):
    """
    step. Selects the switch if it is disabled

    :param context: behave context
    :param element: element defined as switch
    """
    element = context.get_element_from_current_page(element)
    is_checked = element.get_attribute('aria-checked') == 'true'
    if not is_checked:
        element.click()


@step('I disable the "{element}" switch')
def disable_element_switch(context, element):
    """
    step. Deselects the switch if it is enabled

    :param context: behave context
    :param element: element defined as switch
    """
    element = context.get_element_from_current_page(element)
    is_checked = element.get_attribute('aria-checked') == 'true'
    if is_checked:
        element.click()


@step('the "{resource}" checkout page is loaded')
def resource_checkout_page_is_loaded(context, resource):
    """
    step. loads the checkout page

    :param context: behave context
    :param resource: resource to load
    """
    context.page = context.get_page_object(resource)
    if resource in CHECKOUT_PAGE_OBJECTS:
        context.execute_steps(u"""Given I wait "1" seconds
                                And I switch to original frame
                                And waits until the iframe is visible
                                And I switch to "iframe" iframe""")

    # Check if certain elements of the new PageObject are loaded
    context.execute_steps(u"""Given the "{}" page is loaded""".format(resource))


def select_day_in_calendar(context, element, selected_day):
    """
    Selects a day in the calendar
    :param context: behave context
    :param element: calendar element
    :param selected_day: day to be selected in the calendar
    """
    element.set_focus()
    ActionChains(context.driver).send_keys(Keys.ESCAPE).perform()
    selected_day = format_date_to_calendar_input(context, selected_day, hyphen_format=False)
    ActionChains(context.driver).send_keys(selected_day).perform()
    ActionChains(context.driver).send_keys(Keys.ENTER).perform()


def format_date_to_calendar_input(context, day, hyphen_format=False):
    """
    Format the date to a particular format for the calendar input. The format is done according to the
    browser language for chrome.
    """
    browser_language = context.driver.execute_script(
        'return window.navigator.userLanguage || window.navigator.language')
    if context.driver_wrapper.utils.get_driver_name() == "firefox" and hyphen_format:
        formatted = "{}-{:02d}-{:02d}".format(day.year, day.month, day.day)
    else:
        if 'es' in browser_language:
            formatted = day.day * 1000000 + day.month * 10000 + day.year
        else:
            formatted = day.month * 1000000 + day.day * 10000 + day.year
    return str(formatted).zfill(8)

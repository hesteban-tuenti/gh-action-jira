"""
Global CMS steps action
"""
from datetime import datetime, timedelta
import logging
import os
import time

from behave import step as behave_step  # noqa: F401
from toolium.pageelements import Link
from toolium_telefonica.behave import step

from selenium.common.exceptions import ElementClickInterceptedException, NoSuchElementException, \
    StaleElementReferenceException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait

from acceptance.features.e2e.web import select_day_in_calendar

logger = logging.getLogger(__name__)


@step('I click on the configured alert')
def click_selected_alert(context):
    """
    Step. Click on any alert saved previously in cms_alerts variable in context.

    :param context: behave context
    """
    if not getattr(context, 'cms_alerts', None):
        raise ValueError('Missing cms_alerts variable in context')

    alert = context.cms_alerts.alert0
    alerts_elements = context.get_element_from_current_page('alerts_list').page_elements
    for alert_element in alerts_elements:
        if alert.metadata.publicId in alert_element.name.text:
            alert_element.name.click()
            return
    raise AssertionError('Configured alert not clicked')


@step('I click on the configured entrypoints list')
def click_selected_entrypoint_list(context):
    """
    Step. Click on any entrypoint list saved previously in cms_entrypoint_lists variable in context.

    :param context: behave context
    """
    if not getattr(context, 'entrypoint_list_id', None):
        raise ValueError('Missing entrypoint_list_id variable in context')

    entrypoint_lists_elements = context.get_element_from_current_page('entrypoint_lists_list').page_elements
    for entrypoint_list_element in entrypoint_lists_elements:
        logger.debug("Looking for id %s in element %s", context.entrypoint_list_id,
                     entrypoint_list_element.list_id.text)
        if context.entrypoint_list_id in entrypoint_list_element.list_id.text:
            context.driver.execute_script("arguments[0].click();", entrypoint_list_element.list_id.web_element)
            return
    raise AssertionError('Configured entrypoint list not clicked')


@step('I click on the configured entrypoint')
def click_selected_entrypoint(context):
    """
    Step. Click on any entrypoint saved previously in cms_entrypoints variable in context.

    :param context: behave context
    """
    if not getattr(context, 'cms_entrypoints', None):
        raise ValueError('Missing cms_entrypoints variable in context')

    entrypoint = context.cms_entrypoints.entrypoint0
    elements_list = context.get_element_from_current_page('entrypoints_list')
    WebDriverWait(context.driver_wrapper.driver, 20).until(lambda driver: len(elements_list) > 0)
    entrypoints_elements = elements_list.page_elements

    for entrypoint_element in entrypoints_elements:
        if entrypoint.metadata.internalName in entrypoint_element.internal_name.text:
            context.driver.execute_script("arguments[0].click();", entrypoint_element.internal_name.web_element)
            return
    raise AssertionError('Configured entrypoint not clicked')


@step('I click on the configured extras list')
def click_selected_extras_list(context):
    """
    Step. Click on any extras list saved previously in cms_extras variable in context.

    :param context: behave context
    """
    if not getattr(context, 'cms_extras', None):
        raise ValueError('Missing cms_extras variable in context')

    first_list = context.cms_extras.extra0
    extras_elements = context.get_element_from_current_page('extras_list').page_elements
    for extra_element in extras_elements:
        if first_list.metadata.internalName in extra_element.name.text:
            extra_element.name.click()
            return
    raise AssertionError('Configured extra list not clicked')


@step('I fill in the "{field}" field with an unique public id value')
@step('I fill in the "{field}" field with an unique value')
def fill_in_form_with_unique_value(context, field):
    """
    Step. Fill in the field with an unique value taken from the current timestamp.

    :param context: behave context
    :param field: input element name
    """
    value = time.time()
    value = str(value).replace('.', '-')
    element = context.get_element_from_current_page(field)
    element.set_focus()
    context.driver.execute_script("arguments[0].value = '';", element.web_element)
    element.text = value
    context.cms_unique_id = value


@step('I fill in the "{field}" field with an unique value with text "{text}"')
def fill_in_name_form_with_unique_value(context, field, text):
    """
    Step. Fill in the field with an unique name value taken from the current timestamp.

    :param context: behave context
    :param field: input element name
    :param text:
    """
    if "cms_unique_id" not in context:
        value = time.time()
        value = str(value).replace('.', '-')
        context.cms_unique_id = value
    element = context.get_element_from_current_page(field)
    element.set_focus()
    context.driver.execute_script("arguments[0].value = '';", element.web_element)
    element.text = f"{text} {context.cms_unique_id}"


@step('I fill in the "{field}" file field with file path "{file_path}"')
def fill_file_field_with_file_path(context, field, file_path):
    """
    Hack-Step to force an input[type=file] element to be visible to allow to fill with file path

    :param context: Behave context
    :param field: WebElement name
    :param file_path: File path to upload
    """
    element = context.get_element_from_current_page(field)
    hidden = False

    if not element.is_visible():
        context.driver.execute_script("arguments[0].style.display = 'block';", element.web_element)
        hidden = True  # The element was hidden from the beginning

    file_path = file_path if os.path.isabs(file_path) else os.path.abspath(file_path)
    context.execute_steps(u"""Given I fill in the "{0}" field with "{1}"
    """.format(field, file_path))

    try:
        if element.is_visible() and hidden:
            context.driver.execute_script("arguments[0].style.display = 'none';", element.web_element)
    except (NoSuchElementException, StaleElementReferenceException):
        # in some CMS forms, when the input file is filled, the page with the field is closed and the element might
        # not exist
        pass


@step('I click on the "{element_name}" element on the configured alert')
def clicks_on_menu_of_configured_alert(context, element_name):
    """
    step. Clicks on the element name field on any alert saved previously in cms_alerts variable in context.

    :param context: behave context
    :param element_name: element to click on
    """
    elements = context.get_element_from_current_page('alerts_list')
    text = context.cms_alerts.alert0.metadata.publicId
    for element in elements:
        if text in getattr(element, 'name').text:
            action_chain = ActionChains(context.driver_wrapper.driver).move_to_element(
                getattr(element, element_name).web_element)
            action_chain.click().perform()
            return
    raise AssertionError(f"No item with the -'{text}'- text in the alerts list")


@step('I click on the "{element_name}" element on the configured entrypoints list')
def clicks_on_menu_of_configured_entrypoint_list(context, element_name):
    """
    step. Clicks on the element name field on any entrypoints list saved previously in cms_entrypoint_lists variable
    in context.

    :param context: behave context
    :param element_name: element to click on
    """
    elements = context.get_element_from_current_page('entrypoint_lists_list')
    text = context.entrypoint_list_id
    for element in elements:
        if text in getattr(element, 'list_id').text:
            ActionChains(context.driver_wrapper.driver).move_to_element(element.web_element).perform()
            getattr(element, element_name).web_element.click()
            return
    raise AssertionError(f"No item with the -'{text}'- text in the entrypoints lists")


@step('I click on the "{element_name}" element on the configured extras list')
def clicks_on_menu_of_configured_extras_list(context, element_name):
    """
    step. Clicks on the element name field on any alert saved previously in cms_alerts variable in context.

    :param context: behave context
    :param element_name: element to click on
    """
    elements = context.get_element_from_current_page('extras_list')
    text = context.cms_extras.extra0.metadata.internalName
    for element in elements:
        if text in getattr(element, 'name').text:
            action_chain = ActionChains(context.driver_wrapper.driver).move_to_element(
                getattr(element, element_name).web_element)
            action_chain.click().perform()
            return
    raise AssertionError(f"No item with the -'{text}'- text in the extras list")


@step('I click on the "{element_name}" element on the configured entrypoint')
def clicks_on_menu_of_configured_entrypoint(context, element_name):
    """
    step. Clicks on the element name field on any entrypoints saved previously in cms_entrypoints variable
    in context.

    :param context: behave context
    :param element_name: element to click on
    """
    status_mapping = {
        'DRAFT': 'draft',
        'PUBLISHED': 'published',
        'UNPUBLISHED': 'paused',
        'TEST': 'test',
    }
    elements = context.get_element_from_current_page('entrypoints_list')
    id = context.cms_entrypoints.entrypoint0.metadata.id.id
    status = context.cms_entrypoints.entrypoint0.metadata.status
    for element in elements:
        if str(id) in element.get_attribute('href') and \
                status_mapping[status] in getattr(element, 'state').text.lower():
            ActionChains(context.driver_wrapper.driver).move_to_element(element.web_element).perform()
            context.driver.execute_script("arguments[0].click();", getattr(element, element_name).web_element)
            return
    raise AssertionError(f"No entrypoint with the -'{id}'- id and the -'{status}'- status")


@step('I fill in the "{field}" calendar cms field with "{days}" days from today')
def select_date_n_days_from_today_in_appointments_calendar(context, field, days):
    """
    step. Select the day in the calendar from given days from today.
    :param context: behave context
    :param field: calendar field
    :param days: number of days to select the date
    """
    selected_day = datetime.today() + timedelta(days=int(days))
    element = context.get_element_from_current_page(field)
    select_day_in_calendar(context, element, selected_day)


@step('I select the "{value}" value from "{field}" field')
def select_value_from_field(context, value, field):
    """
    Step. Simulate a <select> behavior using different html elements.

    :param context: behave context
    :param value: value to pick
    :param field: field to click to display the options
    """
    selector = context.get_element_from_current_page(field)
    try:
        selector.click()
    except ElementClickInterceptedException:
        context.driver.execute_script("arguments[0].click();", selector.web_element)
    value_upper = value.upper().replace(" ", "_")
    value_lower = value.lower().replace(" ", "-")
    link = Link(By.XPATH, '//li[@data-value="{}" or @data-value="{}" or @data-value="{}"]'.format(value, value_upper,
                                                                                                  value_lower))
    WebDriverWait(context.driver, 1).until(lambda driver: link.is_present())
    link.click()


@step('I click on the configured modular page')
def click_selected_modular_page(context):
    """
    Step. Click on any modular page saved previously in cms_modular_pages variable in context.

    :param context: behave context
    """
    if not getattr(context, 'cms_modular_pages', None):
        raise ValueError('Missing cms_modular_pages variable in context')

    first_page = context.cms_modular_pages.page0
    elements_list = context.get_element_from_current_page('pages_list')
    WebDriverWait(context.driver_wrapper.driver, 20).until(lambda driver: len(elements_list) > 0)
    pages_elements = elements_list.page_elements
    for page in pages_elements:
        if first_page.modularPageId in page.url_id.text:
            page.url_id.click()
            return
    raise AssertionError('Configured modular page not clicked')

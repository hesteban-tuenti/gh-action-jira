"""
Support appointment booking actions steps
"""
from datetime import datetime, timedelta
import random

from behave import step as behave_step  # noqa: F401

from selenium.common.exceptions import ElementClickInterceptedException, ElementNotInteractableException,\
    TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait

from toolium_telefonica.behave import step

from acceptance.common.steps.user_features.selector_handler import skip_execution
from acceptance.features.e2e.web import format_date_to_calendar_input


@step('I click on any "{daytime}" available slot for the Movistar store')
def click_available_slot(context, daytime):
    """
    step. Clicks on any available slot in the given day time
    :param context: behave context
    :param daytime: day time
    """
    if daytime not in {'any', 'morning', 'afternoon'}:
        raise ValueError('Invalid day time {}. Available values: morning, afternoon'.format(daytime))

    if daytime == 'any':
        daytime = 'morning'
        slots_title = context.get_element_from_current_page('{}_slots_title'.format(daytime))
        if not slots_title.is_present():
            daytime = 'afternoon'
            slots_title = context.get_element_from_current_page('{}_slots_title'.format(daytime))
            if not slots_title.is_present():
                skip_execution(context, reason='No slots available')
                return
    else:
        slots_title = context.get_element_from_current_page('{}_slots_title'.format(daytime))
        if not slots_title.is_present():
            skip_execution(context, reason='No slots available in the {}'.format(daytime))
            return
    slots = context.get_element_from_current_page('{}_slots'.format(daytime))
    try:
        slots.page_elements[0].click()
    except (ElementClickInterceptedException, ElementNotInteractableException):
        context.driver.execute_script("arguments[0].click();", slots.page_elements[0].web_element)


@step('I fill in the "{field}" calendar field with any day with available slots')
def fill_calendar_field_with_any_day(context, field):
    """
    step. Pick a random week day in the following month and select the day in the calendar. If there are not available
    slots, continue picking different days until there is one with slot available.
    :param context: behave context
    :param field: calendar field
    """
    tomorrow = datetime.today() + timedelta(days=1)
    weekdays_in_month = []
    days_range = 30
    for i in range(days_range):
        day = tomorrow + timedelta(days=i)
        if day.weekday() < 5:
            weekdays_in_month.append(day)
    random.shuffle(weekdays_in_month)
    element = context.get_element_from_current_page(field)
    context.driver.execute_script("arguments[0].removeAttribute('readonly');", element.web_element)
    for day in weekdays_in_month:
        select_day_in_appointments_calendar(context, element, day)
        if __available_slots(context):
            break
        element.set_focus()
        element.clear()
    if not __available_slots(context):
        skip_execution(context, reason='No slots available')


@step('I fill in the "{field}" calendar support field with "{days}" days from today')
def select_date_n_days_from_today_in_appointments_calendar(context, field, days):
    """
    step. Select the day in the calendar from given days from today.
    :param context: behave context
    :param field: calendar field
    :param days: number of days to select the date
    """
    selected_day = datetime.today() + timedelta(days=int(days))
    element = context.get_element_from_current_page(field)
    select_day_in_appointments_calendar(context, element, selected_day)


def select_day_in_appointments_calendar(context, element, selected_day):
    """
    Selects a day in the calendar
    :param context: behave context
    :param element: calendar element
    :param selected_day: day to be selected in the calendar
    """
    element.set_focus()
    ActionChains(context.driver).send_keys(Keys.ESCAPE).perform()
    selected_day = format_date_to_calendar_input(context, selected_day, hyphen_format=True)
    context.driver.execute_script("arguments[0].removeAttribute('readonly');", element.web_element)
    ActionChains(context.driver).send_keys(selected_day).perform()
    ActionChains(context.driver).send_keys(Keys.ENTER).perform()
    if context.driver_wrapper.utils.get_driver_name() == "firefox":
        # In firefox the calendar is not hiding after the enter so we need to click on an overlay element
        # that covers all screen to hide it when is present (not always). If not, we click on the title screen
        overlay = context.get_element_from_current_page("calendar_overlay")
        if overlay.is_present():
            overlay.click()
        else:
            title = context.get_element_from_current_page("appointment_booking_title")
            title.web_element.click()


def __available_slots(context):
    """
    step. Asserts that there are available slots. If there are nos slots, skip the scenario.
    :param context: behave context
    """
    try:
        WebDriverWait(context.driver, 3).until(
            lambda driver: context.get_element_from_current_page('slots_module').is_present())
    except TimeoutException:
        return False
    else:
        return True

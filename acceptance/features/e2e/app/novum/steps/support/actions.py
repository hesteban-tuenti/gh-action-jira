"""
Support actions
"""
from datetime import date, timedelta
import random
from time import sleep

from behave import step as behave_step  # noqa: F401

from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from toolium_telefonica.behave import step

from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.common.aus.code_factory import AusHelper
from acceptance.common.constants.constants import DOMAINS
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.steps.user_features.selector_handler import skip_execution
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.features.e2e.app.steps.common.actions.elements import select_day_in_calendar


@step('user has an active support chat')
def user_has_active_support_chat(context):
    """
    step. Checks that a support chat is started. If not, a new one will be started

    :param context: behave context
    """
    context.execute_steps('Given user is in the "Support Chat" page')
    element = get_element_from_page(context, 'navigation_top_bar.end_conversation_button')
    if not element.is_visible():
        # Chat is not started, so start a new one
        context.execute_steps("""When clicks on the "start_support_chat_button" button
                              And the "Support Topics List" page is displayed
                              And clicks on the "message_about_my_service_entrypoint" entrypoint
                              And the "Support Topic Details" page is displayed\n""" +
                              'And fills the "support_details_inputtext" inputtext '
                              'with the "Hello, this is only a Novum test" text\n' +
                              """And clicks on the "send_query_button" button
                              And the "Account Holder Verification" page is displayed
                              And clicks on the "confirm_identity_checkbox" button
                              And fills the "name_input" inputtext with the "[CONTEXT:user.user_name]" text
                              And clicks on the "send_query_button" button
                              Then the "Support Chat" page is displayed
                              And the "support_chat_inputtext" inputtext is displayed
                              And the "send_message_button" button is displayed""")


@step('closes the active support chat')
@step('user has not an active support chat')
def user_has_not_active_support_chat(context):
    """
    step. Checks that a support chat is not started. If not, the active one will be closed

    :param context: behave context
    """
    context.execute_steps('Given user is in the "Support Chat" page')
    element = get_element_from_page(context, 'navigation_top_bar.end_conversation_button')
    if element.is_visible():
        # Chat is started, close it
        context.execute_steps("""When clicks on the "navigation_top_bar.end_conversation_button" button
                                 And the "End Support Chat" popup is displayed
                                 And clicks on the "popup.accept" button
                                 Then the "Support Chat" page is displayed
                                 And clicks on the "navigation_top_bar.back_button" button
                                 And the "Support" page is displayed""")
    else:
        # Go back to support to avoid issues locating the bottom bar with steps after this one
        context.execute_steps("""When clicks on the "navigation_top_bar.back_button" button
                                 Then the "Support" page is displayed""")


@step('scrolls up in the support chat')
def scrolls_up(context):
    """
    step. Scrolls up in the support tab
    :param context: behave context
    """
    # In some Android devices this is sleep is needed
    if context.driver_wrapper.is_android_test():
        sleep(2)
    BaseScreen().native_scroll_up()


@step('clicks on any date in the appointments calendar')
def select_any_day_in_appointments_calendar(context):
    """
    step. Pick a random week day in the following month and select the day in the calendar.
    :param context: behave context
    """

    if context.user.domain == DOMAINS.QA:
        # Slots in QA mocks only works for the tomorrow day
        context.execute_steps(u"""Given clicks on tomorrow date in the appointments calendar""")
        return

    if context.driver_wrapper.is_web_test():
        # These executions are here to reuse the same step definition in hybrid mode
        context.execute_steps(u"""
                Given I click on the "calendar_input" element
                  And I fill in the "calendar_input" calendar field with any day with available slots
                  And I click on any "any" available slot for the Movistar store""")
        return

    tomorrow = date.today() + timedelta(days=1)
    weekdays_in_month = []
    days_range = 30
    for i in range(days_range):
        day = tomorrow + timedelta(days=i)
        if day.weekday() < 5:
            weekdays_in_month.append(day)
    random.shuffle(weekdays_in_month)
    for day in weekdays_in_month:
        __select_day_in_appointments_calendar(context, day)
        if __available_slots(context):
            break
        calendar_input = get_element_from_page(context, 'calendar_input')
        calendar_input.clear()
    if not __available_slots(context):
        skip_execution(context, reason='No slots available found')


@step('clicks on tomorrow date in the appointments calendar')
def select_tomorrow_day_in_appointments_calendar(context):
    """
    step. Pick tomorrow day in the calendar.
    :param context: behave context
    """
    if context.driver_wrapper.is_web_test():
        context.execute_steps(u"""
                Given I click on the "calendar_input" element
                  And I fill in the "calendar_input" calendar support field with "1" days from today
                  And waits "3" seconds
                  And I click on any "any" available slot for the Movistar store""")
        return
    tomorrow = date.today() + timedelta(days=1)
    __select_day_in_appointments_calendar(context, tomorrow)
    if not __available_slots(context):
        skip_execution(context, reason='No slots available found')


@step('clicks on any date more than two months from today in the appointments calendar')
def select_date_seventy_days_from_today_in_appointments_calendar(context):
    """
    step. Select the day in the calendar from 70 days from today.
    :param context: behave context
    """
    selected_day = date.today() + timedelta(days=70)
    __select_day_in_appointments_calendar(context, selected_day)


def __select_day_in_appointments_calendar(context, selected_day):
    select_day_in_calendar(context, selected_day, context.current_page.calendar_input)
    if context.driver_wrapper.is_android_test():
        # Tap in the progress bar to hide the keyboard displayed after filling the date
        context.current_page.appointment_booking_progress_bar.web_element.click()


def __available_slots(context):
    """
    step. Asserts that there are available slots. If there are nos slots, skip the scenario.
    :param context: behave context
    """
    try:
        WebDriverWait(context.driver, 3).until(
            lambda driver: get_element_from_page(context, 'slots_module').is_present())
        return True
    except TimeoutException:
        return False


@step('clicks on any "{daytime}" available slot for the Movistar store')
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
        slots_title = get_element_from_page(context, '{}_slots_title'.format(daytime))
        if not slots_title.is_present():
            daytime = 'afternoon'
            slots_title = get_element_from_page(context, '{}_slots_title'.format(daytime))
            if not slots_title.is_present():
                skip_execution(context, reason='No slots available')
                return
    else:
        slots_title = get_element_from_page(context, '{}_slots_title'.format(daytime))
        if not slots_title.is_present():
            skip_execution(context, reason='No slots available in the {}'.format(daytime))
            return
    slots = get_element_from_page(context, '{}_slots'.format(daytime))
    if daytime == "afternoon" and get_element_from_page(context, 'morning_slots_title').is_present():
        # Scroll to display the title of the afternoon slots,
        # if not, the click fails because another element intercepts the click
        display_element_on_screen(get_element_from_page(context, 'afternoon_slots_title'))
    slots.web_elements[0].click()


@step('selects a store with lockers available')
def selects_store_with_lockers(context):
    """
    step. Selects a store with lockers available.

    :param context: behave context
    """
    stores = AusHelper.get_helper(context).get_store_with_lockers()
    if not stores:
        skip_execution(context, reason='No stores with lockers available')
        return
    context.execute_steps(
        u"""When fills the "store_search" inputtext with the "{}" text
             And clicks on the search key for the "store_search" inputtext
             And the "google_map" map is displayed
             And clicks on the "stores_list_tab" button
             And clicks on the "stores_list_first" button
             And clicks on the "book_button" button""".format(
            stores[0]['address']['street_address']))

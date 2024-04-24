"""
App assertion steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.wait import WebDriverWait

from acceptance.common.constants.constants import APPSTATE, BUNDLES, PACKAGES
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.steps.user_features.selector_handler import skip_execution


@step('the "{app_name}" app is displayed')
def app_is_displayed(context, app_name):
    """
    step. Assert the application is displayed

    :param context: behave context
    :param app_name: application name
    """
    try:
        WebDriverWait(context.driver, 25).until(lambda driver: get_app_state(context, app_name) == APPSTATE.FOREGROUND)

    except TimeoutException:
        raise AssertionError(f"{app_name} app is not running in foreground")


@step('user has installed the "{app_name}" app')
def app_is_installed(context, app_name):
    """
    step. Assert the application is installed

    :param context: behave context
    :param app_name: application name
    """
    if not __is_app_installed(context, app_name):
        skip_execution(context, reason="{} is not installed".format(app_name))


@step('user does not have installed the "{app_name}" app')
@step('user has not installed the "{app_name}" app')
def app_is_not_installed(context, app_name):
    """
    step. Assert the application is not installed

    :param context: behave context
    :param app_name: application name
    """
    if __is_app_installed(context, app_name):
        skip_execution(context, reason="{} is installed".format(app_name))


def get_app_state(context, general_app_name):
    """
    Return the state of an application

    :param context: behave context
    :param general_app_name: name of the application
    :return: integer with app state
    """
    try:
        if context.driver_wrapper.is_ios_test():
            internal_app_name = getattr(BUNDLES, general_app_name.replace(" ", "_").upper())
        else:
            internal_app_name = getattr(PACKAGES, general_app_name.replace(" ", "_").upper())
        return context.driver.query_app_state(internal_app_name)
    except AttributeError as attribute_error:
        raise AssertionError(f"{attribute_error}")


def __is_app_installed(context, general_app_name):
    """
    Check if the app is installed

    :param context: behave context
    :param general_app_name: name of the application
    :return: True if the app is installed. Otherwise False
    """
    try:
        if context.driver_wrapper.is_ios_test():
            internal_app_name = getattr(BUNDLES, general_app_name.replace(" ", "_").upper())
        else:
            internal_app_name = getattr(PACKAGES, general_app_name.replace(" ", "_").upper())
        return context.driver.is_app_installed(internal_app_name)
    except AttributeError as attribute_error:
        raise AssertionError(f"{attribute_error}")


@step('the PDF file is opened')
def user_has_the_pdf_file_opened(context):
    """
    Step. Assert that the pdf file is correctly opened
    :param context: behave context
    """

    pdf_file = get_element_from_page(context, 'pdf_file')
    try:
        assert pdf_file.is_visible()
    except AssertionError:
        # some elements will be present but don't have the visible attribute set to true
        assert pdf_file.is_present(), "pdf_file is not displayed and not present"

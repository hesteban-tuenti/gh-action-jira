"""
Page assertion steps
"""
import re
from time import sleep

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param
from acceptance.common.constants.constants import BRANDS, CHECKOUT_PAGE_OBJECTS

from selenium.webdriver.common.by import By
from toolium.pageelements import Button

from acceptance.app.common.actions.base.webview import BaseWebview
from acceptance.app.common.autonavigation.path_finder import PathFinder
from acceptance.app.common.autonavigation.page_objects_provider import PageObjectsProvider
from acceptance.app.common.pageobjects.base.others.browser import BaseBrowser
from acceptance.app.novum.pageobjects.base.webview.custom_tab_mode import BaseCustomTabMode
from acceptance.common.constants.constants import APPSTATE, BUNDLES, PACKAGES
from acceptance.app.novum.pageelements.browserwebviewnavigationtopbar import BaseBrowserWebviewNavigationTopBar
from acceptance.app.novum.pageelements.internalwebviewnavigationtopbar import BaseInternalWebviewNavigationTopBar as \
    BaseNovumInternalWebviewNavigationTopBar
from acceptance.app.novum.pageobjects.base.webview.browser_mode import BaseBrowserMode
from acceptance.app.novum.pageobjects.base.webview.internal_mode import BaseInternalMode
from acceptance.web.common.web_page_object_provider.web_page_object_catalog import WebPageObjectsProvider

from selenium.common.exceptions import TimeoutException, NoSuchElementException
from selenium.webdriver.support.ui import WebDriverWait


@step('the "{page_name}" page is displayed')
def page_is_displayed(context, page_name):
    """
    step. Assert that the page passed as parameter is loaded

    :param context: behave context
    :param page_name: name of the page
    """
    page_name = page_name.replace(" ", "")

    if context.driver_wrapper.is_mobile_test():
        page_name = PageObjectsProvider().get_page_object_name(page_name)
        new_page = get_page_object(context, page_name).wait_until_loaded()
        if context.current_page:
            PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                          context.current_page.__class__.__name__)
        context.current_page = new_page
    else:
        page_name = WebPageObjectsProvider().get_page_object_name(page_name)

        wait_time = 45 if map_param("[CONF:brand]") == BRANDS.MOVES else 30  # MOVES in QA environment is slower

        # There is intermediate screen to select the subscription in webapp when user access by a deeplink
        if page_name in {'BillSelection', 'VivobrBills'} and map_param("[CONF:brand]") == BRANDS.VIVOBR:
            get_product(context)

        if page_name in CHECKOUT_PAGE_OBJECTS:
            context.execute_steps(u"""Given waits "1" seconds
                                    And switches to original frame
                                    And waits until the iframe is visible
                                    And switches to iframe""")

        context.execute_steps(u"""Given the "{}" page is loaded after "{}" seconds""".format(page_name, wait_time))
        context.current_page = context.page


@step('the "{page_name}" page is not displayed')
def page_is_not_displayed(context, page_name):
    """
    step. Assert that the page passed as parameter is not displayed

    :param context: behave context
    :param page_name: name of the page
    """
    page_name = page_name.replace(" ", "")
    page_name = PageObjectsProvider().get_page_object_name(page_name)
    get_page_object(context, page_name).wait_until_not_loaded(3)


@step('the "{page_name}" internal webview is displayed')
def internal_webview_is_displayed(context, page_name):
    """
    step. Assert that a internal webview page is loaded

    :param context: behave context
    :param page_name: name of the internal webview
    """
    page_is_displayed(context, page_name)
    BaseWebview().wait_until_webview_load(context)


@step('the browser webview is displayed')
def browser_webview_is_displayed(context):
    """
    step. Assert that a browser webview page is loaded

    :param context: behave context
    """
    new_page = BaseBrowserMode().wait_until_loaded()
    PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                  context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context)


@step('the custom tab webview is displayed')
def custom_tab_webview_is_displayed(context):
    """
    step. Assert that a custom tab webview page is loaded

    :param context: behave context
    """
    new_page = BaseCustomTabMode().wait_until_loaded()
    PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                  context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context, browser_webview=True)


@step('the internal webview is displayed')
def internal_mode_webview_is_displayed(context):
    """
    step. Assert that a internal webview page is loaded

    :param context: behave context
    """
    new_page = BaseInternalMode().wait_until_loaded()
    PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                  context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context)


@step('the browser webview with "{header_name}" text in the header is displayed')
def browser_mode_webview_with_header_is_displayed(context, header_name):
    """
    step. Assert that a browser webview page is loaded with a header name.
          To be used when some intermediate screens are loaded previously.

    :param context: behave context
    :param header_name: expected header name
    """
    new_page = BaseBrowserMode().wait_until_loaded()
    PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                  context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context)
    header_instance = None
    page_header = ''

    for instance in vars(context.current_page).values():
        if isinstance(instance, BaseBrowserWebviewNavigationTopBar):
            header_instance = instance
            page_header = instance.get_header_name()
    # Try 12 times at worse waiting 1 second between tries
    for _ in range(12):
        if header_name not in page_header:
            sleep(1)
            context.current_page = BaseBrowserMode().wait_until_loaded()
            BaseWebview().wait_until_webview_load(context)
            page_header = header_instance.get_header_name()
        else:
            return
    assert header_name in page_header, f"Browser webview header '{page_header}' " \
        f"doesn't contains the text '{header_name}'"


@step('the internal webview with "{header_name}" header is displayed')
def internal_mode_webview_with_header_is_displayed(context, header_name):
    """
    step. Assert that a internal webview page is loaded with a header name.
          To be used when some intermediate screens are loaded previously.

    :param context: behave context
    :param header_name: expected header name
    """
    new_page = get_page_object(context, 'InternalMode').wait_until_loaded()
    if context.current_page:
        PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                      context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context)
    header_instance = None
    page_header = ''

    for instance in vars(context.current_page).values():
        if isinstance(instance, (BaseNovumInternalWebviewNavigationTopBar)):
            header_instance = instance
            page_header = instance.get_header_name()
    # Try 10 times at worse waiting 1 second between tries
    for _ in range(10):
        if page_header != header_name:
            sleep(1)
            context.current_page = get_page_object(context, 'InternalMode').wait_until_loaded()
            BaseWebview().wait_until_webview_load(context)
            page_header = header_instance.get_header_name()
        else:
            return
    assert page_header == header_name, f"Internal webview header '{page_header}' " \
        f"is not equal to the expected '{header_name}'"


@step('the internal webview with empty header is displayed')
def internal_mode_webview_with_empty_header_is_displayed(context):
    """
    step. Assert that a internal webview page is loaded without a header name.
          To be used when some intermediate screens are loaded previously.

    :param context: behave context
    """
    new_page = get_page_object(context, 'InternalModeWithEmptyHeader').wait_until_loaded()
    if context.current_page:
        PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                      context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context)


@step('the internal webview with the "{regular_expression}" format in the header is displayed')
def internal_mode_webview_with_header_format_is_displayed(context, regular_expression):
    """
    step. Assert that a internal webview page is loaded with a header name format.
          To be used when some intermediate screens are loaded previously.

    :param context: behave context
    :param regular_expression: expected regular expresion for the header name
    """
    new_page = get_page_object(context, 'InternalMode').wait_until_loaded()
    PathFinder().set_navigation_runtime_back_path(context.driver_wrapper, new_page.__class__.__name__,
                                                  context.current_page.__class__.__name__)
    context.current_page = new_page
    BaseWebview().wait_until_webview_load(context)
    header_instance = None
    page_header = ''

    for instance in vars(context.current_page).values():
        if isinstance(instance, (BaseNovumInternalWebviewNavigationTopBar)):
            header_instance = instance
            page_header = instance.get_header_name()
    # Try 10 times at worse waiting 1 second between tries
    for _ in range(10):
        if not re.match(regular_expression, page_header):
            sleep(1)
            context.current_page = get_page_object(context, 'InternalMode').wait_until_loaded()
            BaseWebview().wait_until_webview_load(context)
            page_header = header_instance.get_header_name()
        else:
            return
    assert re.match(regular_expression, page_header), f"Internal webview header '{page_header}' " \
                                                      f"doesn't match with the regular expresion: {regular_expression}"


@step('the external webview is displayed')
def external_webview_is_displayed(context):
    """
    step. Assert that a external webview page is shown in a external browser

    :param context: behave context
    """
    app_name = BUNDLES.SAFARI if context.driver_wrapper.is_ios_test() else PACKAGES.CHROME
    try:
        WebDriverWait(context.driver, 10).until(
            lambda driver: context.driver.query_app_state(app_name) == APPSTATE.FOREGROUND)
    except TimeoutException as ex:
        raise TimeoutError(f"{app_name} has not been opened") from ex

    context.current_page = BaseBrowser().wait_until_loaded()


@step('the "{header_name}" header is displayed')
def header_is_displayed(context, header_name):
    """
    step. Assert that the page header is equal to the header name passed as parameter.

    :param context: behave context
    :param header_name: expected header name
    """
    try:
        if context.current_page.page_name in CHECKOUT_PAGE_OBJECTS:
            context.execute_steps(u"""Given switches to original frame
                                And waits "1" seconds""")
            page_header = get_header_name(context)
            assert page_header == header_name, f"page header '{page_header}' doesn't match with " \
                                               f"header name '{header_name}'"
            context.execute_steps(f'Given the "{context.current_page.page_name}" page is displayed')
        else:
            page_header = get_header_name(context)
            assert page_header == header_name, f"page header '{page_header}' doesn't match with " \
                                               f"header name '{header_name}'"
    except AttributeError:  # Not all pages have page_name
        page_header = get_header_name(context)
        assert page_header == header_name, f"page header '{page_header}' doesn't match with header name '{header_name}'"


@step('the header that contains the "{header_name}" text is displayed')
def header_that_contains_text_is_displayed(context, header_name):
    """
    step. Assert that the page header contains the header name passed as parameter

    :param context: behave context
    :param header_name: expected header name included in the header
    """
    page_header = get_header_name(context)
    assert header_name in page_header, f"page header '{page_header}' doesn't contains the text '{header_name}'"


@step('the header contains the user first name')
def header_contains_first_name(context):
    """
    step. Assert that the page header contains the user first name

    :param context: behave context
    """
    page_header = get_header_name(context)
    first_name = context.user.user_name.split(' ')[0]
    assert first_name in page_header, f"page header '{page_header}' doesn't contains the text '{first_name}'"


@step('the landing tab page is displayed')
def landing_tab_is_displayed(context):
    """
    step. Assert that lading tab is displayed

    :param context: behave context
    """
    page_is_displayed(context, map_param('[CONF:landing_tab]'))


def get_page_object(context, page_name):
    """
    Return page object instance from page object name

    :param context: behave context
    :param page_name: name of the page object
    :return page object instance
    """
    pattern = re.compile(r'\s+')
    page_name = re.sub(pattern, '', page_name)
    try:
        return PageObjectsProvider().get_page_object_instance(context.driver_wrapper, page_name)
    except KeyError:
        raise AssertionError(f"pageobject: '{page_name}' is not defined")


@step('check that the screen is in the previous state with threshold "{threshold}"')
def check_screenshot(context, threshold):
    """
    step. Compare a previous taken screenshot in the baseline folder with a new screenshot.
          You have to run take_screenshot during the same scenario before using this step,
          this will set the baseline image in the context so it can be compared with.

    :param threshold: Accuracy level of the comparison. From 0 being the most accurate to 1
    :param context: behave context
    """
    try:
        baseline_image = context.storage['baseline_image']
    except KeyError:
        raise AssertionError("No baseline image found in context")
    if not baseline_image:
        raise AssertionError("No baseline image found in context")
    if context.driver_wrapper.driver.context != 'NATIVE_APP':
        context.driver_wrapper.driver.switch_to.context('NATIVE_APP')
    context.assert_full_screenshot(filename=baseline_image,
                                   threshold=float(threshold), force=True)


@step('check that the screen is not in the previous state with threshold "{threshold}"')
def check_screen_different_than_screenshot(context, threshold):
    """
    step. Compare a previous taken screenshot in the baseline folder is different to the
          new screenshot
          You have to run take_screenshot during the same scenario before using this step

    :param threshold: Accuracy level of the comparison. From 0 being the most accurate to 1
    :param context: behave context
    """
    try:
        baseline_image = context.storage['baseline_image']
    except KeyError:
        raise AssertionError("No baseline image found in context")

    if context.driver_wrapper.is_mobile_test() and context.driver_wrapper.driver.context != 'NATIVE_APP':
        context.driver_wrapper.driver.switch_to.context('NATIVE_APP')
    try:
        context.assert_full_screenshot(filename=baseline_image, threshold=float(threshold), force=True)
        raise Exception("Both images are equal")
    except AssertionError:
        return


def get_header_name(context):
    """
    Get header name from top bar current page
    :param context: behave context
    :return: header name
    """
    page_header = ''
    for instance in vars(context.current_page).values():
        func = getattr(instance, 'get_header_name', None)
        if callable(func):
            page_header = func()
            break
    return page_header


def get_product(context):
    """
    Returns the Button that contains the given line.

    :param context: behave context
    """
    locator = f'//*[@data-component-name="RowList"]//span[text()="{context.user.current_subscription}"]'
    try:
        element = Button(By.XPATH, locator, webview=True)
        element.wait_until_clickable(5)
        element.click()
    except (NoSuchElementException, TimeoutException):
        pass

"""
Account Television steps
"""
from behave import step as behave_step  # noqa: F401
from toolium.pageelements import Link
from toolium_telefonica.behave import step
from selenium.webdriver.common.by import By

from selenium.common.exceptions import TimeoutException

from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.steps.user_features.selector_handler import skip_execution


@step('clicks on the selected tv pack')
def click_on_tv_pack(context):
    """
    step. Performs click on a tv pack previously stored in context

    :param context: behave context
    """
    if 'package_id' not in context.storage:
        raise ValueError('No package_id variable in context')
    pack_id = context.storage['package_id']
    if context.driver_wrapper.is_web_test():
        element = Link(By.XPATH, "//div[@data-qsysid='tv-header']//*[@data-component-name='SnapCard']"
                              "//a[contains(@href, 'product/{}')]".format(pack_id), webview=True)
    else:
        element = context.current_page.get_tv_pack_link_for_id(pack_id)
    display_element_on_screen(element)
    element.click()


@step('the selected tv pack has channels tab')
def tv_pack_has_channel_with_tabs(context):
    """
    step. Checks that the selected tv pack has channels tab

    :param context: behave context
    """
    try:
        context.current_page.channels_tab.wait_until_visible(3)
    except TimeoutException:
        # skip this scenario if the channels tab is not visible, otherwise the scenario could fail. The channels
        # tab is not always displayed, we don't have a proper way to know whether a package will have channels tab.
        skip_execution(context, 'Selected package does not have channels tab')


@step('clicks on a different TV plan in the "{element}" selector')
def click_plan_tv_selector(context, element):
    """
    step. Click on available offer in the plan selector.
    :param context: behave context
    :param element: television offers selector element
    """
    available_offers = get_element_from_page(context, element)
    if len(available_offers) == 1:
        skip_execution(context, reason="No fusion offers available")
        return
    for offer in available_offers:
        if offer.get_attribute('aria-checked') == 'false':
            context.storage[element] = offer.text
            display_element_on_screen(offer)
            offer.click()
            return
    raise AssertionError('No disabled offer found')


@step('clicks on the not included "{element}" element of the TV configuration')
def click_switch_not_included_configuration_selector(context, element):
    """
    step. Click on not included element in the tv configuration
    :param context: behave context
    :param element: package or channel element
    """
    configuration = get_element_from_page(context, element)
    if len(configuration) == 0:
        skip_execution(context, reason="No TV configuration available")
        return
    for config in configuration:
        if config.switch.get_attribute('aria-checked') == 'false':
            if element not in context.storage:
                context.storage[element] = []
            context.storage[element].append(config.title.text)
            display_element_on_screen(config.switch)
            config.switch.click()
            return
    raise AssertionError('No disabled {} found'.format(element))


@step('clicks on the "{element}" element of the TV configuration')
def click_switch_configuration_selector(context, element):
    """
    step. Click on given element in the tv configuration
    :param context: behave context
    :param element: package or channel element
    """
    configuration = get_element_from_page(context, element)
    if len(configuration) == 0:
        skip_execution(context, reason="No TV configuration available")
        return
    if element not in context.storage:
        context.storage[element] = []
    context.storage[element].append(configuration[0].title.text)
    display_element_on_screen(configuration[0].switch)
    configuration[0].switch.click()

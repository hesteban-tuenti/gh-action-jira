"""
Connectivity assertions steps
"""
import logging
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait

from acceptance.common.steps import skip_execution

logger = logging.getLogger(__name__)


def check_network_connectivity_android(driver, network_type):
    """
    Returns the status of the network type received as parameter, using the driver command "mobile: deviceInfo" accepted
    by UiAutomator2 and XCUITest drivers. Currently only the UiAutomator2 driver will provide the device's
    network information.
    https://github.com/appium/appium-uiautomator2-driver#platform-specific-extensions

    :param driver:  driver
    :param network_type: network type to check its status
    :return: Boolean with the status of the network connection if found otherwise False
    """
    device_info = driver.execute_script('mobile: deviceInfo')
    logger.debug("Device info: %s", device_info)
    logger.debug("Device info ALL NETWORKS: %s", device_info['networks'])
    for network in device_info['networks']:
        logger.debug("Device info NETWORK: %s", network)
        if network['typeName'] == network_type.upper():
            return network['isConnected']
    return False


@step(u'the device is connected to a "{network_type}" network')
def device_is_connected_to_network(context, network_type):
    """
    Step. Checks if the device is connected to a network
    Currently this method is executed only in Android devices because XCUITest driver doesn't provide a
    method to check the network interface status. Nevertheless we have seen that iOS devices recover the
    connectivity faster, and haven't had problems so far.

    :param context: Behave Context.
    :param network_type: type of the network. Possible values: wifi, mobile
    """
    # Only implemented for Android
    if context.driver_wrapper.is_android_test():
        try:
            WebDriverWait(context.driver, 60).until(lambda driver:
                                                    check_network_connectivity_android(driver, network_type))
        except TimeoutException:
            raise AssertionError(f"The device doesn't have {network_type} connectivity")

    else:
        # TODO(hesteban): implement for iOS if needed and it's possible.
        # https://jira.tid.es/browse/NOV-237379
        logger.debug("iOS device - Network connectivity check not implemented")


@step('user does not have a "{brand}" SIM in the device')
def sim_is_not_installed(context, brand):
    """
    step. Assert the sim is not installed

    :param context: behave context
    :param brand: brand of the sim product
    """
    if not brand:
        raise AttributeError("You must configure a value for 'brand' in this step")

    for carrier in context.device_config.sim_carriers:
        if carrier.brand == brand.lower():
            skip_execution(context, reason=f"A SIM of the {brand} brand is in the device.")

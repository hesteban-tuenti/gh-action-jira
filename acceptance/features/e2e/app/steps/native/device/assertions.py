"""
Device assertions steps
"""
import logging
import re
import operator

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.common.steps import skip_execution

logger = logging.getLogger(__name__)

esim_compatible_devices = [
    "iPhone XR", "iPhone XS", "iPhone XS Max", "iPhone XS Max Global", "iPhone 11", "iPhone 11 Pro",
    "iPhone 11 Pro Max", "iPhone SE 2nd Gen", "iPhone 12 Mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max",
    "iPhone 13 Mini", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max", "iPhone SE 3rd Gen", "Pixel 2", "Pixel 2 XL",
    "Pixel 3", "Pixel 3 XL", "Pixel 3a XL", "Pixel 3e", "Pixel 4", "Pixel 4a", "Pixel 4 XL", "Pixel 5", "Pixel 5a",
    "Pixel 6", "Pixel 6a", "Pixel 6 Pro", "P40", "P40 Pro", "P40 Pro+", "Mate 40 Pro", "Razr 2019", "Razr 5G",
    "Galaxy Fold", "Galaxy Z Fold 2 5G", "Galaxy Z Fold3 5G", "Galaxy Z Flip", "Galaxy Z Flip 3 5G",
    "Galaxy Z Flip 3 5G Fold", "Galaxy Z Fold2 5G", "Galaxy S20", "Galaxy S21", "Galaxy S21+ 5G", "Galaxy S21 Ultra 5G",
    "Galaxy S22", "Galaxy S22+", "Galaxy Note 20 Ultra 5G", "Galaxy Note 20", "Xperia 10 III Lite", "Xperia 1 IV", "X5",
    "Find X3 Pro", "Reno 5 A", "Find X5", "Find X5 Pro", "Reno6 Pro 5G", "A55s"]


@step(u'the device version is "{condition}" to "{platform_version:f}"')
@step(u'the device version is "{condition}" than "{platform_version:f}"')
def check_plaform_version_(context, condition, platform_version):
    """
    Step. Checks the device platform version

    :param context: Behave Context.
    :param condition: possible values: lower, equal, greater, equal_or_greater, equal_or_lower
    :param platform_version: float, platform version
    """
    criteria = {
        "lower": operator.lt,
        "equal": operator.eq,
        "greater": operator.gt,
        "equal_or_greater": operator.ge,
        "equal_or_lower": operator.le,
    }

    criterias = '|'.join(criteria.keys())

    if condition not in criteria:
        skip_execution(context, reason=f"Wrong condition; Should be: ({criterias})")
        return
    device_platform_version = map_param('[TOOLIUM:AppiumCapabilities_platformVersion]')
    if device_platform_version.count('.') > 1:
        match = re.match(r'^(\d+.\d+)', device_platform_version)
        if not match:
            raise ValueError('Invalid device platform version {}.'.format(device_platform_version))
        device_platform_version = match.groups()[0]

    if not criteria.get(condition)(float(device_platform_version), platform_version):
        skip_execution(context, reason="No matching criteria\n \
            Device platform version: {} - Scenario platform version:{} - Criteria:{}"
                       .format(device_platform_version, platform_version, condition))


@step('user does not have a device with eSIM capabilities')
def device_without_esim_capabilities(context):
    """
    Assert if device does not support esim.

    :param context: Behave context
    """
    device_name = context.device_config.get_environment_config()["device_model"]
    device_name = re.sub(r".* - ", "", device_name)
    if device_name in esim_compatible_devices:
        skip_execution(context, "The {} device supports eSIM".format(device_name))


@step('user has a device with eSIM capabilities')
def device_with_esim_capabilities(context):
    """
    Assert if device supports esim.
    :param context: Behave context
    """
    device_name = context.device_config.get_environment_config()["device_model"]
    device_name = re.sub(r".* - ", "", device_name)
    if device_name not in esim_compatible_devices:
        skip_execution(context, "The {} device does not support eSIM".format(device_name))


@step('user has a device with a "{size}" screen')
def device_screen_size(context, size):
    """
    Assert if device has a big (>=5.85) or a small (<5.85) screen
    :param context: Behave context
    :param size: Screen size, big or small
    """
    inches = context.device_config.get_screen_inches()
    if size == "big":
        if inches < 5.85:
            skip_execution(context, reason="The device has a small screen")
    elif size == "small":
        if inches >= 5.85:
            skip_execution(context, reason="The device has a big screen")
    else:
        raise ValueError('Invalid screen size, the valid values are: big/small')

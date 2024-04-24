"""
Pin Biometric assertions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from acceptance.common.constants.constants import DEVICES_WITHOUT_BIOMETRIC_CAPABILITIES


@step('user has a device with "{biometric_capability}" capabilities')
def device_with_biometric_capability(context, biometric_capability):
    """
    step. Assert that a device has biometric capabilities.
    Currently we don't have a mechanism to identify when a device has biometric capabilities. It is not possible trough
    adb and doing trough the UI could be tedious among different platfornms and OS versions. Therefore we assume all
    devices have biometric unless it has been positively identified it doesnt.
    """
    device_udid = context.driver.desired_capabilities['udid']
    if device_udid in DEVICES_WITHOUT_BIOMETRIC_CAPABILITIES:
        context.scenario.skip(reason="Device with udid: {} does not have {} capabilites"
                              .format(device_udid, biometric_capability))


@step('user has a device without "{biometric_capability}" capabilities')
def device_without_biometric_capability(context, biometric_capability):
    """
    step. Assert that a device does not have biometric capabilities.
    We will only consider the ones positively identified in device_mapping_no_biometric
    """
    device_udid = context.driver.desired_capabilities['udid']
    if device_udid not in DEVICES_WITHOUT_BIOMETRIC_CAPABILITIES:
        context.scenario.skip(reason="Device with udid: {} does not have {} capabilites"
                              .format(device_udid, biometric_capability))


@step('the device has a "{biometric_type}" registered')
def device_has_a_biometric_type_capability_registered(context, biometric_type):
    """
    step. Assert that a device has biometric capabilities.
    Currently we are assuming all devices won't have fingerprints registered
    """
    _ = context, biometric_type

    raise NotImplementedError("Not implemented yet. Assuming device does not have a fingerprint registered")


@step('the device has no fingerprint registered')
def device_has_no_fingerprint_registered(context):
    """
    step. Assert that a device has no fingerprint configured.
    Currently we are assuming all devices won't have fingerprints registered
    """
    _ = context

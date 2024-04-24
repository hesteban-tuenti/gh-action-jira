"""
Pin Biometric actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.novum.pageobjects.base.launchapp.app_pin_code import BaseAppPinCode
from acceptance.app.novum.pageobjects.base.profile.security_and_privacy.biometric_pin_access.biometric_pin_access \
    import BasePinBiometric
from acceptance.app.common.actions.base.switch import BaseSwitch
from acceptance.app.common.autonavigation.page_objects_provider import get_unprefixed_class_name
from acceptance.common.constants.constants import BRANDS


@step('fills the PIN placeholder')
@step('inserts the current pin')
def fills_pin_placeholder(context):
    """
    step. Inserts pin code configured in the user data config
    Currently we are assuming all automatic scenarios will be executed with devices with biometric capabilites

    :param context: behave context
    """
    BaseAppPinCode().fill_pin_code(context.user.app_pin_code)


@step('inserts a wrong current pin')
@step('inserts the new pin')
def inserts_new_pin(context):  # noqa: ARG001
    """
    step. Inserts a new pin code
    Currently we are assuming all automatic scenarios will be executed with devices with biometric capabilites

    :param context: behave context
    """
    BaseAppPinCode().fill_pin_code('1111')


@step('user has "{feature}" feature "{status}" in the application')
def user_has_feature_with_status_in_app(context, feature, status):
    """
    step. Check if the feature is in desired status and if not modifies it. Currently only implemented the PIN feature
    The context.current_page is saved before disabling the biometric feature, so after the action is done, the
    navigation is restored to the page
    :param context: behave context
    :param feature: PIN/biometric feature
    :param status: desired status (enabled;disabled)
        """
    current_page = get_unprefixed_class_name(context.driver_wrapper, context.current_page.__class__.__name__)

    if feature == 'PIN':
        if context.user.brand != BRANDS.O2UK:
            context.execute_steps(u"""Given user is in the "Pin Biometric" page""")
            pin_switch = BasePinBiometric().pin_code_switch
            if (status == "enabled" and not BaseSwitch().is_enabled(pin_switch)) or \
                    (status == "disabled" and BaseSwitch().is_enabled(pin_switch)):
                context.execute_steps(u"""When clicks on the "pin_code_switch" switch
                                          And the "App Pin Code" page is displayed
                                          And fills the PIN placeholder
                                          And the "Pin Biometric" page is displayed""")
            context.execute_steps(u"""Given user is in the "{}" page""".format(current_page))
    else:
        raise NotImplementedError("Enable {} feature is not implemented yet".format(feature))


@step('removes the wrong pin')
def removes_pin(context):  # noqa: ARG001
    """
    step. Removes the PIN introduced in the App Pin code screen

    :param context: behave context
    """
    BaseAppPinCode().remove_pin_code()

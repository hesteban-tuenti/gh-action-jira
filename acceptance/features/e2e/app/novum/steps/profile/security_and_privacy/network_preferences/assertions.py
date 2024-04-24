"""
Network preferences assertions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.novum.pageobjects.base.profile.security_and_privacy.network_preferences.network_preferences \
    import BaseNetworkPreferences
from acceptance.app.novum.pageobjects.base.profile.security_and_privacy.network_preferences.feedback_configuration\
    .feedback_configuration import BaseFeedbackConfiguration

from acceptance.app.common.autonavigation.page_objects_provider import get_unprefixed_class_name


@step('user has the network optimization in "{status}" status')
def user_has_the_network_optimization_with_status(context, status):
    """
    step. Verifies if the network configuration preference is in a given desired state otherwise it will be modified.

    :param context: behave context
    :param status: desired network configuration status
    """
    mapping = {'enabled': 'Accepted', 'disabled': 'Rejected'}

    current_page = get_unprefixed_class_name(context.driver_wrapper, context.current_page.__class__.__name__)
    context.execute_steps(u"""Given user is in the "Network Preferences" page""")
    if mapping[status] != BaseNetworkPreferences().network_optimization_module.status_textfield.text:
        BaseNetworkPreferences().network_optimization_module.switch.click()
        BaseNetworkPreferences().save_changes.click()
        BaseFeedbackConfiguration().accept_button.click()

    context.execute_steps(u"""Given user is in the "{}" page""".format(current_page))

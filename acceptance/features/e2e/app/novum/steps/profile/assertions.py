"""
Profile assertions
"""
import operator
from time import sleep

from behave import step as behave_step  # noqa: F401

from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.common.apichk import apichk
from acceptance.common.aus.code_factory import AusHelper
from acceptance.common.constants.decrypt import Decrypt
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.steps.user_features.selector_handler import skip_execution

from acceptance.app.novum.pageobjects.base.profile.profile_selector import BaseProfileSelector


@step('the "{element_name}" element with user number is displayed with the correct format')
def element_has_the_text(context, element_name):
    """
    step. Assert that element in Profile shows the number with the correct format.
    The number is configured within the users per environment yaml

    :param context: behave context
    :param element_name: name of the element to check
    """
    element = get_element_from_page(context, element_name)
    if context.user.snapshot_aus:
        config_msisdns = getattr(AusHelper.get_helper(context), 'get_phone_number_subscriptions')()
    else:
        config_msisdns = apichk.get_all(context, 'get_phone_number_subscriptions')

    if not config_msisdns:
        skip_execution(context, reason='No misdns information available in apichk/aus snapshot')
        return
    assert element.text in config_msisdns, f"'{element.text}' user number not included " \
        f"in user subscriptions: {config_msisdns}"


@step(u'user is logged in the application with "{condition}" than "{number}" users')
@step(u'user is logged in the application with "{condition}" to "{number}" users')
def controls_number_multiconexion(context, condition, number):
    """
    Step. Assert that the number of logged users in the app are the number provided
    :param context: behave context
    :param number: number of conexions
    :return:
    """
    criteria = {
        "less": operator.lt,
        "equal": operator.eq,
        "more": operator.gt,
        "equal_or_greater": operator.ge,
        "equal_or_less": operator.le,
    }

    criterias = '|'.join(criteria.keys())

    if condition not in criteria:
        skip_execution(context, reason=f"Wrong condition; Should be: ({criterias})")
        return

    context.execute_steps(u"""Given user is in the "Profile" page
                                    And clicks on the "user_selector" button
                                    And the "ProfileSelector" page is displayed
                                    """)

    context.current_page = BaseProfileSelector()
    profile_selector_entries_number = len(context.current_page.profile_list_entries) - 1
    if criteria[condition](profile_selector_entries_number, int(number)):
        pass
    else:
        raise Exception(
            f"The service -'{context.user.brand}'-Sorry, you do not meet the condition:(less,equal,more,etc) are valid")


@step(u'logs in the application with a registered line with cpf')
def login_in_with_cpf(context):
    """
        Step. Login with a mock user
        """
    context.execute_steps(u"""Given user is in the "Vivobr Credentials Login" page
                                      And clicks on the "selector_tab.password_selector" tab
                                      And waits "5" seconds
                                      And clicks on the "identifier_inputtext" button
                                      And fills the "identifier_inputtext" inputtext with the "[CONF:user_info.id]" text
                                      And waits "5" seconds
                                      """)

    if context.driver_wrapper.is_android_test():
        sleep(1)
        context.driver.hide_keyboard()
    password_decry = Decrypt().decrypt_string(map_param('[CONF:user_info.passwd]'))
    context.execute_steps(u"""Given user is in the "Vivobr Credentials Login" page
                                    And clicks on the "continue_button" button
                                    And waits "10" seconds
                                    And the "Vivobr Password Login" page is displayed
                                    And fills the "password_field" inputtext with the "{}" text
                                    And clicks on the "continue_button" button
                                    """.format(password_decry))

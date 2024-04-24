"""
Mobile line assertions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.common.autonavigation.path_finder import PathFinder
from acceptance.common.apichk import apichk
from acceptance.common.aus.code_factory import AusHelper

from acceptance.features.e2e.app.steps.common.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.assertions.page import get_page_object


def __check_list_of_values_in_list(list_to_check, element_list, field):
    for element in iter(element_list):
        app_mobile_line = getattr(element, field).text
        assert app_mobile_line in list_to_check, "Value: '{}' is not in the list: '{}'". \
            format(app_mobile_line, list_to_check)
        list_to_check.remove(app_mobile_line)
    assert len(list_to_check) == 0, "Some values: '{}' has not been shown in the list".format(list_to_check)


@step('the "{field}" field of "{element_list}" list entries will match the user mobile lines')
def field_of_list_match(context, field, element_list):
    """
    Step. Asserts that field element of elements list match with mobile lines

    :param context: behave context
    :param field: field name where phone number is displayed
    :param element_list: element list name
    """
    if context.user.snapshot_aus:
        config_mobile_lines = AusHelper.get_helper(context).get_phone_number_subscriptions()
    # Remove when all apichk user has been added to AUS
    else:
        config_mobile_lines = apichk.get_all(context, 'get_subscriptions_with_product_mobile_line')
    element_list = get_element_from_page(context, element_list)
    __check_list_of_values_in_list(config_mobile_lines, element_list, field)


@step('the "{field}" field of "{element_list}" list entries will match with the matching mobile lines')
def field_of_list_match_matching_lines(context, field, element_list):
    """
    Step. Asserts that field element of elements list match with the matching mobile lines

    :param context: behave context.
    :param field: field name where phone number is displayed
    :param element_list: element list name
    """
    elegible_mobile_lines = []
    subscription_with_children = context.features_agreement.get_subscriptions_with_children()
    for subscription in subscription_with_children:
        if subscription.get('_parent_plan'):
            elegible_mobile_lines.append(subscription.get('_name'))
        elif subscription.get('_name') == context.user.current_subscription:  # No preconditions regarding mobile lines
            elegible_mobile_lines.append('any')
            break
    if len(elegible_mobile_lines) == 0:
        context.scenario.skip(reason="No matching mobile lines")
        return
    element_list = get_element_from_page(context, element_list)
    __check_list_of_values_in_list(elegible_mobile_lines, element_list, field)


@step('the "{field}" field of "{element_list}" list entries will match the user mobile lines '
      'whose account type is not any of "{account_types}"')
def field_of_list_does_match_whithout_account_types(context, field, element_list, account_types):
    """
    Step. Asserts that field element of elements list match with mobile lines whose accounts are not the given ones

    :param context: behave context
    :param field: field name where phone number is displayed
    :param element_list: element list name
    :param account_types: account types list
    """
    account_types_list = account_types.split(";")
    config_mobile_lines = AusHelper.get_helper(context).get_phone_number_subscriptions()
    element_list = get_element_from_page(context, element_list)
    exception_list = []
    for account_type in account_types_list:
        result = getattr(AusHelper.get_helper(context), 'get_{}_subscriptions'.format(account_type.lower().
                                                                                      replace(' ', '_')))()
        if result:
            exception_list += result
    final_mobile_lines = [x for x in config_mobile_lines if x not in exception_list]
    __check_list_of_values_in_list(final_mobile_lines, element_list, field)


@step('the "Mobile Line Dashboard" page is displayed for the matching line')
def mobile_line_dashboard_is_displayed_for_matching_line(context):
    """
    step. Assert that the "Mobile Line Dashboard" page is loaded for the matching line

    :param context: behave context
    """
    new_page = get_page_object(context, 'MovesMobileLineDashboard').wait_until_loaded()
    PathFinder().set_navigation_runtime_back_path(
        context.driver_wrapper, new_page.__class__.__name__,
        context.current_page.__class__.__name__,
    )
    context.current_page = new_page

"""
Support assertion steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.aus.code_factory import AusHelper
from acceptance.features.e2e.app.steps.common.actions.elements import get_element_from_page


@step('the "{field}" field of "{element_list}" list entries will match the user plans')
def field_of_list_match_plans(context, field, element_list):
    """
    Step. Asserts that the element of the list match the user plans

    :param context: behave context
    :param field: field name where the plan is displayed
    :param element_list: element list name
    """
    config_plans = AusHelper.get_helper(context).get_plans_any_in_status_active()
    element_list = get_element_from_page(context, element_list)
    assert len(config_plans) == len(element_list), "Some plans '{}' has not been shown in the list ". \
        format(config_plans)
    for element in iter(element_list):
        plan = str.strip(getattr(element, field).text)
        assert plan in config_plans, "Plan: '{}' is not in the list: '{}'".format(plan, config_plans)


@step('the "{field}" field of "{element_list}" list entries will match the user plans '
      'whose account type is not any of "{account_types}"')
def field_of_list_does_match_plans_whithout_account_types(context, field, element_list, account_types):
    """
    Step. Asserts that field element of elements list match with plans whose accounts are not the given ones

    :param context: behave context
    :param field: field name where the plan is displayed
    :param element_list: element list name
    :param account_types: account types list
    """
    account_types_list = account_types.split(";")
    config_plans = AusHelper.get_helper(context).get_plans_any_in_status_active()
    element_list = get_element_from_page(context, element_list)
    exception_list = []
    for account_type in account_types_list:
        result = getattr(AusHelper.get_helper(context), 'get_{}_subscriptions'.format(account_type.lower().
                                                                                      replace(' ', '_')))()
        if result:
            exception_list += result
    final_config_plans = [x for x in config_plans if x not in exception_list]
    assert len(final_config_plans) == len(element_list), "Some plans '{}' has not been shown in the list ". \
        format(final_config_plans)
    for element in iter(element_list):
        plan = str.strip(getattr(element, field).text)
        assert plan in final_config_plans, "Plan: '{}' is not in the list: '{}'".format(plan, final_config_plans)


@step('the "{field}" field of "{element_list}" list entries will match the user plans with any mobile line '
      'whose account type is not any of "{account_types}"')
def field_of_list_does_match_plans_whith_mobile_lines_whithout_account_types(context, field, element_list,
                                                                             account_types):
    """
    Step. Asserts that field element of elements list match with plans with any mobile line

    :param context: behave context
    :param field: field name where the plan is displayed
    :param element_list: element list name
    :param account_types: account types list
    """
    account_types_list = account_types.split(";")
    config_plans = AusHelper.get_helper(context).get_plans_any_in_status_active()
    element_list = get_element_from_page(context, element_list)
    exception_list = AusHelper.get_helper(context).get_subscriptions_without_mobile_line_product()
    for account_type in account_types_list:
        result = getattr(AusHelper.get_helper(context), 'get_{}_subscriptions'.format(account_type.lower().
                                                                                      replace(' ', '_')))()
        if result:
            exception_list += result
    final_config_plans = [x for x in config_plans if x not in exception_list]
    assert len(final_config_plans) == len(element_list), "Some plans '{}' has not been shown in the list ". \
        format(final_config_plans)
    for element in iter(element_list):
        plan = str.strip(getattr(element, field).text)
        assert plan in final_config_plans, "Plan: '{}' is not in the list: '{}'".format(plan, final_config_plans)

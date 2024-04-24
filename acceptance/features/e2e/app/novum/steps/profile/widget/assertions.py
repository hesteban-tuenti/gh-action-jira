"""
Widget assertions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from acceptance.app.novum.pageobjects.base.profile.widget.widget import BaseWidget

from acceptance.common.aus.code_factory import AusHelper


@step('the widget phone number list matches the number of mobile lines in the user plans')
def assert_list_matches_total_num_lines_in_user_plans(context):
    """
    Asserts the phone numbers list shown in the Widget profile screen matches the number of mobile lines in the
    user plans.
    :param context: behave context
    """
    widget_phone_list = BaseWidget().mobile_lines_list
    result = AusHelper.get_helper(context).get_mobile_phone_number_msisdns_from_plans()

    assert len(widget_phone_list) == len(result), \
        "Widget phone number list doesn't match the mobile lines in the user plans"

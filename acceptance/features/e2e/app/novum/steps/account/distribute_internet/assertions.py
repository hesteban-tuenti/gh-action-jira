"""
Account Distribute Internet steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the "{list}" list is displayed with all the lines associated to the multivivo plan')
def check_list_contains_all_lines_in_plan(context, list):
    """
    step. Assert that a list contains all the mobiles lines associated to a plan
    :param context: behave context
    :param list: list to check
    """
    distributed_lines_list = get_element_from_page(context, list)
    assert len(distributed_lines_list) > 0, f"-'{distributed_lines_list}'- List not found or length = 0"
    for line in distributed_lines_list:
        phone_number = getattr(line, 'phone_number').text
        assert phone_number in context.current_plan_mobile_lines, \
            f"-'{distributed_lines_list}'- Not all mobile lines in plan are shown in the 'Distribuir Internet' screen"

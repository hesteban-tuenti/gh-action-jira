"""
Mobile line actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen


def get_mobile_lines_for_current_plan(mobile_lines_carousel):
    """
    Return the list of mobile lines in mobile_lines_carousel element

    :param mobile_lines_carousel: mobile_lines_carousel element
    :return: list of mobile numbers
    """
    previous_line = ""
    plan_mobile_lines = []
    for line in mobile_lines_carousel:
        if previous_line == getattr(line, 'phonenumber').text:
            element = getattr(line, 'icon')
            display_element_on_screen(element)
        previous_line = getattr(line, 'phonenumber').text
        plan_mobile_lines.append(previous_line)
    return plan_mobile_lines


@step('clicks on the mobile line with role "{role}"')
def clicks_on_mobile_line_with_role(context, role):
    """
    Step. Performs click on the desired mobile line (admin or dependent)

    :param context: behave context
    :param role: mobile line to be selected (admin, dependent)
    """
    mobile_lines_carousel = context.current_page.mobile_lines

    # Save the mobile lines in current plan for future assertion steps
    context.current_plan_mobile_lines = get_mobile_lines_for_current_plan(mobile_lines_carousel)

    # Click on the mobile line with the desired role
    selected_sub = context.current_page.subscription_selector.get_current_subscription()
    for line in mobile_lines_carousel:
        previous_line = getattr(line, 'phonenumber').text
        if previous_line == getattr(line, 'phonenumber').text:
            element = getattr(line, 'icon')
            display_element_on_screen(element)
        if role == "admin" and context.admin_line[selected_sub] == getattr(line, 'phonenumber').text:
            getattr(line, 'icon').click()
            break
        if role == "dependent" and context.admin_line[selected_sub] != getattr(line, 'phonenumber').text:
            getattr(line, 'icon').click()
            break

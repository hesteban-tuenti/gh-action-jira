"""
Device plan assertions steps
"""
from datetime import datetime
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the current year is selected in the filter')
def check_year_selected_in_list(context):
    """
    step. Assert that the desired year is selected in the list
    :param context: behave context
    :param list_element: list to check
    """
    year_selected = get_element_from_page(context, "year_selected")
    current_year = datetime.now().year
    assert str(current_year) == year_selected.text, f"'{current_year}' year is not selected"
    context.year_selected = str(current_year)


@step('the elements in the "{list_element}" list correspond to the selected year')
def check_elements_in_list_correspond_selected_year(context, list_element):
    """
    step. Assert that the list displays only elements of the selected year
    :param context: behave context
    :param list_element: list to check
    """
    element_list = get_element_from_page(context, list_element)
    year_selected = context.year_selected
    for element in element_list:
        date_element = getattr(element, 'date')
        assert date_element.text.split(" ")[1] == year_selected, "there are elements from other year not selected"

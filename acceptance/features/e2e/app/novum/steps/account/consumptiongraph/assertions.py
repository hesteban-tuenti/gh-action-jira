"""
Account Consumption Graph assertions steps
"""
import re

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the billing period is displayed in the "{axis}" axis of the "{graph}" graph')
def billing_period_in_axis(context, axis, graph):
    """
    Step. Assert that the billing period is displayed in the desired axis

    :param context: behave context
    :param axis: axis to check
    :param graph: graph to check
    """
    graph_element = get_element_from_page(context, graph)
    axis_element = getattr(graph_element, axis)
    if not axis_element.first_day and axis_element.last_day:
        raise Exception("Invalid axis '{}', for the selected graph '{}'".format(axis, graph))
    regular_expression = r"(\d{1,2} )?(Ene|Jan|Feb|Mar|Abr|Apr|May|Jun|Jul|Ago|Aug|Sep|Oct|Nov|Dic|Dec)"
    assert re.match(regular_expression, axis_element.first_day.text), f"First day: '{axis_element.first_day.text}' " \
                                                                      f"doesn't match with the 'dd Mmm' " \
                                                                      f"regular expresion: {regular_expression}"
    assert re.match(regular_expression, axis_element.last_day.text), f"Last day: '{axis_element.last_day.text}' " \
                                                                     f"doesn't match with the 'dd Mmm' " \
                                                                     f"regular expresion: {regular_expression}"


@step('the consumptions are displayed in the "{axis}" axis of the "{graph}" graph')
def consumptions_in_axis(context, axis, graph):
    """
    Step. Assert that the Consumptions is displayed in the desired axis

    :param context: behave context
    :param axis: axis to check
    :param graph: graph to check
    """
    graph_element = get_element_from_page(context, graph)
    axis_element = getattr(graph_element, axis)
    if not axis_element.max_consumption:
        raise Exception("Invalid axis '{}', for the selected graph '{}'".format(axis, graph))
    regular_expression = r"\d+(.\d{2})? (GB|MB|KB|seg|s|min|h|SMS)?"
    assert re.match(regular_expression, axis_element.max_consumption.text), \
        f"Consumption: '{axis_element.max_consumption.text}' doesn't match with the " \
        f"'X (KB|GB|MB)' regular expresion: {regular_expression}"


@step('the extra charges are displayed in the "{axis}" axis of the "{graph}" graph')
def extra_charges_in_axis(context, axis, graph):
    """
    Step. Assert that the Extra charges is displayed in the desired axis

    :param context: behave context
    :param axis: axis to check
    :param graph: graph to check
    """
    graph_element = get_element_from_page(context, graph)
    axis_element = getattr(graph_element, axis)
    if not axis_element.max_charges:
        raise Exception("Invalid axis '{}', for the selected graph '{}'".format(axis, graph))
    regular_expression = r"(£\d+.\d\d)|(\d+,\d\d €)"
    assert re.match(regular_expression, axis_element.max_consumption.text), \
        f"Consumption: '{axis_element.max_consumption.text}' doesn't match with the " \
        f"'X (€ or £)' regular expresion: {regular_expression}"

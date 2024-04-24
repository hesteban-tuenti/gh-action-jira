"""
Aura assertion steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the "{element}" with graph type "{graph_type}" is displayed')
def check_graph_type(context, element, graph_type):
    """
    step. Check if the graph is correct

    :param context: behave context
    :param element: name of the element to check the graph
    :param graph_type: type of the graph expected
    """
    # For iOS, we cannot check the graph, due there is no ids. On iOS, only checks element is visible
    assert get_element_from_page(context, element + '_' + graph_type).is_visible()

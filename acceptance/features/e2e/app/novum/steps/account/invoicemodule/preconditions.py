"""
Account Invoice Module preconditions steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.steps import skip_execution
from acceptance.common.utils import utils


@step('the "{invoices_chart}" invoices chart has "{num_pages}" pages')
def invoices_chart_has_n_pages(context, invoices_chart, num_pages):
    """
    Step. Asserts that the chart component has the given number of pages

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    :param num_pages: the number of pages in the invoices chart
    """
    chart = get_element_from_page(context, invoices_chart)

    operator = '='
    value = num_pages
    if num_pages == 'several':
        operator = '>'
        value = 1

    if not utils.compare(chart.number_of_pages, int(value), operator):
        skip_execution(
            context,
            reason=f"the number of pages in chart ({chart.number_of_pages}) does not meet criteria '{num_pages}'",
        )

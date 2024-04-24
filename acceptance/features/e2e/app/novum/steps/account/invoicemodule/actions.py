"""
Account Invoice Module actions steps
"""
import re

from wrapt_timeout_decorator import timeout
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from selenium.common.exceptions import ElementClickInterceptedException

from acceptance.app.novum.pageelements.invoicemoduleaccount import InvoiceManager
from acceptance.common.constants.constants import BRANDS
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps import click_on_element_with_text_in_list


@step('clicks on "{index}" month in the bills graph')
def click_on_element_of_graph(context, index):
    """
    Step. Performs click on a month of a graph

    :param context: behave context
    :param index: Index of the bar to click
    """
    bills_graph = get_element_from_page(context, 'bills_graph')
    assert len(bills_graph) > 0, "-'bills_graph'- graph not found or length = 0"
    if index == "last":
        index_in_format = [len(bills_graph) - 1, 5]  # idx starts with 0, max invoices per graph: 6
    elif re.match(r"\[\d+, ?[0-5]\]", index):  # List format
        index_in_format = [int(item) for item in index.strip('][').replace(", ", ",").split(",")]
        assert index_in_format[0] < len(bills_graph) and index_in_format[0] < 6, \
            "The -{}- index is bigger than the " \
            "maximum allowed: -{}-".format(index_in_format, [len(bills_graph) - 1, 5])
    else:
        try:
            index = int(index)
        except ValueError:
            raise ValueError('-{}- index is not allowed or wrong formatted'.format(index))
        assert index < (len(bills_graph) * 6) - 1, \
            "The -{}- index is bigger than the " \
            "maximum allowed: -{}-".format(index, len(bills_graph) * 6 - 1)
        index_in_format = [int(index / 6), int(index % 6)]
    invoice_manager = InvoiceManager(bills_graph)
    invoice_manager.get_month_button(index_in_format).click()


@step('clicks on a different month in the bills graph')
def click_on_different_element_of_graph(context):
    """
    Step. Performs click on a month of a graph different that the selected one

    :param context: behave context
    """
    bills_graph = get_element_from_page(context, 'bills_graph')
    assert len(bills_graph) > 0, "-'bills_graph'- graph not found or length = 0"
    invoice_manager = InvoiceManager(bills_graph)
    month_button, context.eligible_bill_month_index = invoice_manager.get_different_month_button()
    try:
        month_button.click()
        context.selected_month_text = invoice_manager.get_month_text(context.eligible_bill_month_index[0]).text
        if context.selected_month_text[-1] == '.':
            context.selected_month_text = context.selected_month_text.rstrip()
    except ElementClickInterceptedException:
        if context.user.brand == BRANDS.VIVOBR:
            context.driver.swipe(200, 800, 900, 800, 1000)
        else:
            context.driver.swipe(200, 1400, 900, 800, 1000)
        month_button.wait_until_visible(2)
        month_button.click()


@step('clicks on the eligible month in the bills graph')
def click_on_eligible_month(context):
    """
    Step. Performs click on any month eligible in the step:
        'user has a month with "{bill_type}" bill'

    :param context: behave context
    """
    bills_graph = get_element_from_page(context, 'bills_graph')
    assert len(bills_graph) > 0, "-'bills_graph'- graph not found or length = 0"
    if not context.eligible_bill_month_index:
        raise Exception("context.eligible_bill_month_index variable is empty, "
                        "user has a month with '{bill_type}' bill step was not executed")

    # select an eligible bill in the current bills graph page
    invoice_manager = InvoiceManager(bills_graph)
    if isinstance(context.eligible_bill_month_index[0], dict):
        for plan in context.eligible_bill_month_index:
            if next(iter(plan.keys())) == context.user.current_subscription:
                invoice_manager.get_month_button(next(iter(plan.values()))).click()
                return
        raise Exception("context.eligible_bill_month_index variable with plans doesn't match with the "
                        "selected plan")

    # search for a month in selected page index
    page_idx = invoice_manager.get_selected_page_index()
    month_element = context.eligible_bill_month_index[0]
    # start with the last index, because it is more probably landing in the last page and last bill
    for element in reversed(context.eligible_bill_month_index):
        if page_idx == element[0]:
            month_element = element
            break
    if not month_element:
        raise Exception("not an eligible bill month index in the graph selected page")

    try:
        invoice_manager.get_month_button(month_element).click()
    except ElementClickInterceptedException:
        invoice_manager.get_rotated_month_button(month_element).click()
    if invoice_manager.get_selected_invoice_index()[1] != month_element[1]:
        # Double tap because sometimes tapping the button without scrolling could cause that a wrong bar is selected
        try:
            invoice_manager.get_month_button(month_element).click()
        except ElementClickInterceptedException:
            invoice_manager.get_rotated_month_button(month_element).click()


@step('closes the native calls filter')
def close_calls_filter(context):
    """
    Step. Closes the native calls filter

    :param context: behave context
    """
    if context.driver_wrapper.is_android_test():
        element = get_element_from_page(context, "filter.all_calls_option")
        element.click()
    elif context.driver_wrapper.is_ios_test():
        element = get_element_from_page(context, "filter.button")
        element.click()


@step('clicks on another month with bills in the bills graph')
def click_on_another_month_with_bills(context):
    """
    Step. Performs click on another month with bills in the bills graph (for O2UK)

    :param context: behave context
    """
    bills_graph = get_element_from_page(context, 'bills_graph')
    assert len(bills_graph) > 0, "-'bills_graph'- graph not found or length = 0"
    if not context.eligible_bill_month_index:
        raise Exception("context.eligible_bill_month_index variable is empty, "
                        "user has bills for '{number}' months step was not executed")
    invoice_manager = InvoiceManager(bills_graph)
    if isinstance(context.eligible_bill_month_index, dict):
        for plan in context.eligible_bill_month_index:
            if plan == context.user.current_subscription:
                month_to_select = [0, int(context.eligible_bill_month_index[plan].split(',')[1])]
                invoice_manager.get_month_button(month_to_select).click()
                return
        raise Exception("context.eligible_bill_month_index variable with plans doesn't match with the "
                        "selected plan")
    month_to_select = [0, int(context.eligible_bill_month_index.split(',')[1])]
    invoice_manager.get_month_button(month_to_select).click()


@step('clicks on the eligible msisdn entrypoint in bill')
def click_on_eligible_msisdn(context):
    """
    Step. Perform click on msisdn entrypoint in bill details. O2uk step.
    :param context: Behave context
    """
    click_on_element_with_text_in_list(context, 'multimsisdn_entrypoints', 'title', context.eligible_msisdn[0])


@step('clicks on a different month than the selected in the "{invoices_chart}" invoices chart')
def clicks_on_a_different_month_than_selected_in_invoices_chart(context, invoices_chart):
    """
    Step. Perform click on another month different from the selected one

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    if chart.months_per_page > 1:
        # select another month in the same page. Remember that indices are 1-based, not zero based
        if chart.selected_month_index > 1:
            chart.select_by_index(chart.selected_page_number, chart.selected_month_index - 1)
            return
        if chart.selected_month_index == 1:
            chart.select_by_index(chart.selected_page_number, chart.selected_month_index + 1)
            return

    # select a different page. Remember that page indices are 1-based, not zero based:
    if chart.number_of_pages > 1:
        if chart.selected_page_number > 1:
            chart.select_by_index(chart.selected_page_number - 1, chart.selected_month_index)
            return
        if chart.selected_page_number == 1:
            chart.select_by_index(chart.selected_page_number + 1, chart.selected_month_index)
            return

    raise ValueError("could not selected another month because there is only one element in the chart")


@step('clicks on a different page than the selected in the "{invoices_chart}" invoices chart')
def clicks_on_a_different_page_than_selected_in_invoices_chart(context, invoices_chart):
    """
    Step. Perform click on another page different than selected one

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    # fail if no other page to select
    if chart.number_of_pages <= 1:
        raise ValueError("could not selected another page because there is only one page in the chart")

    # select previous page if there is a previous page
    if chart.selected_page_number > 1:
        chart.select_by_index(chart.selected_page_number - 1, chart.selected_month_index)
        return

    # select next page as fallback
    chart.select_by_index(chart.selected_page_number + 1, chart.selected_month_index)


@step('clicks on a month with invoices in the "{invoices_chart}" invoices chart')
@timeout(90, use_signals=False)
def click_month_with_invoices_in_chart(context, invoices_chart):
    """
    Step. Performs click on a month with bills in the desired invoices chart.

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    if not chart.selected_month.has_invoices():
        chart.select_by_index(chart.number_of_pages, chart.months_per_page)  # Select the last month
        while not chart.selected_month.has_invoices():
            chart.select_by_date(str(chart.selected_month.date.prev_month()))


@step('clicks on the eligible month in the "{invoices_chart}" invoices chart')
def click_eligible_month_in_invoices_chart(context, invoices_chart):
    """
    Step. Performs click on an eligible month in the desired invoices chart.
    This steps uses the 'context.current_invoice_info' variable that stores the list of months in YYYY-MM format
    that meets the previous conditions, steps like:
        'user has a month with "{x}" bill'

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)

    if not hasattr(context, 'invoice_manager'):
        raise Exception("context invoice_manager variable is empty, "
                        "user has a month with '{invoice_type}' invoice step was not executed")

    chart.wait_until_visible()
    chart.select_by_date(next(iter(context.invoice_manager.get_current_invoice_info().keys())))  # 1st eligible invoice

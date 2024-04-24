"""
Account Invoice Module assertions steps
"""
import re
import subprocess

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.wait import WebDriverWait

from acceptance.app.novum.pageelements.invoicemoduleaccount import InvoiceManager
from acceptance.common.constants.constants import BRANDS

from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.common.apichk.o2uk.utils import transform_international_numbers_to_plan_selector_format


@step('the "{index}" month is selected in the bills graph')
def month_selected_in_graph(context, index):
    """
    Step. Assert that the element passed as parameter is selected.

    :param context: behave context
    :param index: Index of the bar to check
    """
    last_index_format_by_brand = {
        BRANDS.BLAUDE: [2, 5],
        BRANDS.MOVES: [0, 5],
        BRANDS.O2DE: [0, 5],
        BRANDS.VIVOBR: [0, 5],
        BRANDS.O2UK: [0, 5],
    }
    bills_graph = get_element_from_page(context, 'bills_graph')
    assert len(bills_graph) > 0, "-'bills_graph'- graph not found or length = 0"
    if index == "last":
        index_in_format = last_index_format_by_brand[context.user.brand]  # idx starts with 0, max invoices per graph: 6
    elif re.match(r"\[\d+, ?[0-5]\]", index):  # List format
        index_in_format = [int(item) for item in index.strip('][').replace(", ", ",").split(",")]
        assert index_in_format[0] < len(bills_graph) and index_in_format[0] < 6, \
            "The -{}- index is bigger than the " \
            "maximum allowed: -{}-".format(index_in_format, [len(bills_graph) - 1, 5])
        index_in_format[0] = (len(bills_graph) - 1) - index_in_format[0]
    else:
        try:
            index = int(index)
        except ValueError:
            raise ValueError('-{}- index is not allowed or wrong formatted'.format(index))
        assert index < (len(bills_graph) * 6) - 1, \
            "The -{}- index is bigger than the " \
            "maximum allowed: -{}-".format(index, len(bills_graph) * 6 - 1)
        index_in_format = [len(bills_graph) - int(index / 6), int(index % 6)]

    invoice_manager = InvoiceManager(bills_graph)
    selected_month_index = invoice_manager.get_selected_invoice_index()
    assert index_in_format == selected_month_index, f"The '{index}' index with format '{index_in_format}' " \
                                                    f"is not selected, the selected index is: '{selected_month_index}'"


@step('the eligible month is selected in the bills graph')
def eligible_month_selected_in_graph(context):
    """
    Step. Assert that the eligible month is selected in the bills graph
    Precondition: Is needed that the context.eligible_bill_month_index variable are not empty.
    This variable is seteed on any billing precondition step: common/steps/user_features/bills

    :param context: behave context
    """
    bills_graph = get_element_from_page(context, 'bills_graph')
    assert len(bills_graph) > 0, "-'bills_graph'- graph not found or length = 0"
    if not context.eligible_bill_month_index:
        raise Exception("context.eligible_bill_month_index variable is empty, "
                        "user has a month with '{bill_type}' bill step was not executed")
    invoice_manager = InvoiceManager(bills_graph)
    selected_month_index = invoice_manager.get_selected_invoice_index()
    if isinstance(context.eligible_bill_month_index[0], dict):
        for plan in context.eligible_bill_month_index:
            if next(iter(plan.keys())) in context.user.current_subscription:
                assert selected_month_index == next(iter(plan.values())), \
                    f"The '{selected_month_index}' index is not in the eligible months list: " \
                    f"'{next(iter(plan.values()))}'"
                return
        raise Exception("context.eligible_bill_month_index variable with plans doesn't match with the "
                        "features agreement plans")
    assert selected_month_index[1] in [month[1] for month in context.eligible_bill_month_index], \
        f"The '{selected_month_index}' index is not in the eligible months list: '{context.eligible_bill_month_index}'"


@step('the "{graph_element}" bar is displayed for each day in the "{axis}" axis of the "{graph}" graph')
def each_element_in_group_has_field(context, graph_element, axis, graph):
    """
    Step. Assert that the graph has a bar per each day
    :param context: behave context
    :param graph_element: element to check in each day
    :param axis: axis to check
    :param graph: graph to check
    """
    graph = get_element_from_page(context, graph)
    axis_element = getattr(graph, axis)

    assert len(getattr(axis_element, graph_element)) > 1, f"The {graph_element} bar isn't displayed for all the " \
                                                          f"days in the graph"


@step('the "{first_amount}" and the "{second_amount}" amounts are the same')
def amounts_are_the_same(context, first_amount, second_amount):
    """
    Step. Assert that the two amounts passed as params are the same
    :param context: behave context
    :param first_amount: First amount to compare
    :param second_amount: Second amount to compare
    """

    amount_one = 0
    element_list = first_amount.split(".")
    list_elements = get_element_from_page(context, element_list[0])
    amount_regex = r"-?[\d]+[.,\d]+|[\d]*[.][\d]+|[\d]+"
    for element in list_elements:
        if len(element_list) > 2:
            field_element = getattr(element, element_list[1])
            for idx in range(2, len(element_list)):
                field_element = getattr(field_element, element_list[idx])
        else:
            field_element = getattr(element, element_list[1])
        amount_one += float(re.findall(amount_regex, field_element.text.replace(",", "."))[0])
    amount_two = float(re.findall(amount_regex,
                                  get_element_from_page(context, second_amount).text.replace(",", "."))[0])

    assert amount_one == amount_two, f"The '{first_amount}' with value '{amount_one}' is " \
                                     f"different that the '{second_amount}' with value '{amount_two}'"


@step('the file with the "{bill_format}" format is downloaded as a PDF')
def user_has_bill_document(context, bill_format):
    """
    Assert that file are download correctly

    :param context: behave context.
    :param bill_format: Format of the downloaded bill
    """

    if context.driver_wrapper.is_ios_test():
        raise Exception('method not implemented for ios')

    bill_text = get_element_from_page(context, 'navigation_top_bar').title.text

    assert re.match(bill_format, bill_text), f"'{bill_text}' " \
                                             f"doesn't match with the regular expresion: {bill_format}"

    try:
        cmd = r"adb -s {} shell dumpsys activity services".format(context.device.udid)
        services =\
            subprocess.check_output(cmd, shell=True, executable="/bin/zsh", universal_newlines=True,
                                    stderr=subprocess.STDOUT, timeout=10)
        cmd = r"grep -i downloaded_invoices"
        download_invoices = \
            subprocess.check_output(cmd, shell=True, executable="/bin/zsh", input=services, universal_newlines=True,
                                    stderr=subprocess.STDOUT, timeout=10).strip()
        bills_downloaded = re.findall(bill_format, download_invoices)
        assert bill_text in bills_downloaded, f"The '{bill_text}' was not downloaded, " \
                                              f"list of downloaded bills {bills_downloaded}"
    except subprocess.CalledProcessError as error:
        raise RuntimeError('Cannot found any downloaded bill: {}'.format(error.stdout))


@step('the native sharing options are displayed')
def native_sharing_options_displayed(context):
    """
    Step. Assert that the  native sharing options are displayed
    :param context: behave context
    """

    if context.driver_wrapper.is_android_test():
        raise Exception('method not implemented for android')
    airdrop = get_element_from_page(context, 'airdrop')
    copy = get_element_from_page(context, 'copy')
    print_doc = get_element_from_page(context, 'print_doc')
    save = get_element_from_page(context, 'save')
    assert airdrop.is_visible() or airdrop.is_present(), "AirDrop is not displayed or not present"
    assert copy.is_visible() or copy.is_present(), "copy button is not displayed or not present"
    assert print_doc.is_visible() or print_doc.is_present(), "Imprimir button is not displayed or not present"
    assert save.is_visible() or save.is_present(), "Guardar documento button is not displayed or not present"


@step('the lead msisdn entrypoint is displayed')
def lead_msisdn_entrypoint_displayed(context):
    """
    Step. Assert that the O2UK lead MSISDN entrypoint is displayed
    :param context: behave context
    """
    multimsisdn_entrypoints = get_element_from_page(context, 'multimsisdn_entrypoints')
    lead_line = False
    for entrypoint in multimsisdn_entrypoints:
        entrypoint_label = '+' + getattr(entrypoint, 'title').text
        match = re.match(r'^.+(44\d+).+?', entrypoint_label)
        if match:
            entrypoint_label = transform_international_numbers_to_plan_selector_format(output=[entrypoint_label])[0]
            for value in context.lead_lines:
                if entrypoint_label == value:
                    lead_line = True
    assert lead_line, "The lead line entrypoint is not displayed"


@step('the companion name entrypoint is displayed')
def companion_name_entrypoint_displayed(context):
    """
    Step. Assert that the O2UK companion friendly name entrypoint is displayed
    :param context: behave context
    """
    multimsisdn_entrypoints = get_element_from_page(context, 'multimsisdn_entrypoints')
    companion_list = context.companion_devices
    num_companion_devices = 0
    if isinstance(companion_list, dict):
        companion_list = companion_list.values()
    for entrypoint in multimsisdn_entrypoints:
        entrypoint_label = getattr(entrypoint, 'title').text
        match = re.match(r'^(44\d+).+?', entrypoint_label)
        if not match and entrypoint_label in companion_list:
            num_companion_devices += 1
    assert num_companion_devices > 0, "The companion devices are not displayed in the bill items"


@step('a total of "{num_months}" months are displayed in the bills graph')
def num_months_displayed_in_bills_grapth(context, num_months):
    """
    Step. Assert that the bills graph displays the number of months passed as param
    :param context: behave context
    :param num_months: behave number of months
    """
    bills_graph = get_element_from_page(context, 'bills_graph')
    number_bills = len(bills_graph.page_elements[0].months.page_elements)

    assert number_bills == int(num_months), f"-'bills_graph'- graph has {number_bills}" \
                                            f" and it should have {num_months}"


@step('a total of "{num_months}" months are displayed in the "{chart}" invoices chart')
def num_months_displayed_in_invoices_chart(context, num_months, chart):
    """
    Step. Assert that the invoices chart displays the number of months passed as param
    :param context: behave context
    :param num_months: behave number of months
    :param chart: invoices chart page element
    """
    invoices_chart = get_element_from_page(context, chart)
    number_bills = invoices_chart.months_per_page

    assert number_bills == int(num_months), f"-'{chart}'- chart has {number_bills}" \
                                            f" and it should have {num_months}"


@step('the months in "{month_format}" format are displayed in the "{graph}" graph')
def months_displayed_in_format(context, month_format, graph):
    """
    Step. Asserts that the months in the bills graph are displayed in the short
    or the long format

    :param context: behave context
    :param month_format: short/long
    :param graph: the bills graph page element
    """
    assert month_format in {'short', 'long'}, "valid formats are 'short' and 'long'"

    def short_assertion(text):
        assert len(text) <= 5, f"The format of the month label '{text}' is larger than 4 chars"

    def long_assertion(text):
        assert len(text) > 4, f"The format of the month label '{text}' has 4 or less chars"

    do_assert = short_assertion if month_format == 'short' else long_assertion

    bills_graph = get_element_from_page(context, graph)
    for bills_page in bills_graph.page_elements:
        for month_element in bills_page.month_names.page_elements:
            do_assert(month_element.name.text)


@step('the months in "{month_format}" format are displayed in the "{chart}" invoices chart')
def months_displayed_in_format_invoices_chart(context, month_format, chart):
    """
    Step. Asserts that the months in the invoices chart are displayed in the short
    or the long format

    :param context: behave context
    :param month_format: short/long
    :param chart: the invoices chart page element
    """
    assert month_format in {'short', 'long'}, "valid formats are 'short' and 'long'"

    def short_assertion(text):
        assert len(text) <= 5, f"The format of the month label '{text}' is larger than 4 chars"

    def long_assertion(text):
        assert len(text) > 4, f"The format of the month label '{text}' has 4 or less chars"

    do_assert = short_assertion if month_format == 'short' else long_assertion

    invoices_chart = get_element_from_page(context, chart)
    do_assert(invoices_chart.selected_month.label.text)


@step('the "{chart}" invoices chart is paginated')
def chart_is_paginated(context, chart):
    """
    Step. Assert that the invoices chart have several pages
    :param context: behave context
    :param chart: invoices chart page element
    """
    invoices_chart = get_element_from_page(context, chart)
    number_pages = invoices_chart.number_of_pages

    assert number_pages > 1, "Invoices chart is not paginated"


@step('the "{chart}" invoices chart is not paginated')
def chart_is_not_paginated(context, chart):
    """
    Step. Assert that the invoices chart have just one page
    :param context: behave context
    :param chart: invoices chart page element
    """
    invoices_chart = get_element_from_page(context, chart)
    number_pages = invoices_chart.number_of_pages

    assert number_pages == 1, "Invoices chart has several pages and must have just one"


@step('the last invoice of the "{invoices_chart}" invoices chart is selected')
def last_month_is_selected(context, invoices_chart):
    """
    Step. Asserts that the chart component has the last invoice month selected

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    assert chart.number_of_pages == chart.selected_page_number, \
        f'selected page number is {chart.selected_page_number} but {chart.number_of_pages} is expected'
    assert chart.months_per_page == chart.selected_month_index, \
        f'selected index in page is {chart.selected_month_index} but {chart.months_per_page} is expected'


@step('the last invoice of the "{invoices_chart}" invoices chart is not selected')
def last_month_is_not_selected(context, invoices_chart):
    """
    Step. Asserts that the chart component has the last invoice month not selected

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    assert chart.number_of_pages != chart.selected_page_number or chart.months_per_page != chart.selected_month_index, \
        'the last invoice in the chart is selected'


@step('the eligible month is selected in the "{invoices_chart}" invoices chart')
def eligible_month_selected_in_chart(context, invoices_chart):
    """
    Step. Asserts that the chart component has the desired month selected

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """

    chart = get_element_from_page(context, invoices_chart)

    if not context.invoice_manager:
        raise Exception("context.invoice_manager variable is empty, "
                        "user has a month with '{invoice_type}' invoice step was not executed")

    selected_date = str(chart.selected_month.date)
    context.selected_month_text = selected_date

    assert selected_date in context.invoice_manager.get_current_invoice_info(), \
        f'selected date is {selected_date} but not in the invoice_info'


@step('waits until the last invoice of the "{invoices_chart}" invoices chart is not selected')
def wait_until_the_last_invoice_is_not_selected(context, invoices_chart):
    """
    Step. Asserts that the chart component has a selected page other than the last one and waits until it happens

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    try:
        WebDriverWait(context.driver, 15).until(
            lambda driver: (chart.number_of_pages != chart.selected_page_number or
                            chart.months_per_page != chart.selected_month_index))
    except TimeoutException:
        raise AssertionError('the last invoice in the chart is selected')


@step('the last page of the "{invoices_chart}" invoices chart is selected')
def last_page_is_selected(context, invoices_chart):
    """
    Step. Asserts that the chart component has the last page as the selected one

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    assert chart.number_of_pages == chart.selected_page_number, 'the last page in the chart is not selected'


@step('the last page of the "{invoices_chart}" invoices chart is not selected')
def last_page_is_not_selected(context, invoices_chart):
    """
    Step. Asserts that the chart component has a selected page other than the last one

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    assert chart.number_of_pages != chart.selected_page_number, 'the last page in the chart is selected'


@step('waits until the last page of the "{invoices_chart}" invoices chart is not selected')
def wait_until_the_last_page_is_not_selected(context, invoices_chart):
    """
    Step. Asserts that the chart component has a selected page other than the last one and waits until it happens

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    try:
        WebDriverWait(context.driver, 15).until(lambda driver: chart.number_of_pages != chart.selected_page_number)
    except TimeoutException:
        raise AssertionError('the last page in the chart is selected')


@step('waits until the "{invoices_chart}" invoices chart is loaded')
def wait_until_invoices_chart_loaded(context, invoices_chart):
    """
    Step. Asserts that the invoices chart is loaded

    :param context: behave context
    :param invoices_chart: the bars chart representing the user invoices
    """
    chart = get_element_from_page(context, invoices_chart)
    try:
        WebDriverWait(context.driver, 15).until(lambda driver: chart.is_loaded)
    except TimeoutException:
        raise AssertionError('the invoices chart is not fully loaded')

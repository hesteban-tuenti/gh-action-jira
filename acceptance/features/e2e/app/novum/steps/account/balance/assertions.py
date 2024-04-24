"""
Balance assertions steps
"""
from datetime import datetime, timedelta
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps import get_element_from_page


@step('all movements are from the last "{num_months}" months in the "{list_element}" list')
def list_has_companion_devices(context, num_months, list_element):
    """
    step. Assert that all movements are from the last months.
    :param context: behave context
    :param num_months: number of months
    :param list_element: element list
    """
    element_list = get_element_from_page(context, list_element)
    field_element = getattr(element_list[-1], 'date')
    date_object = datetime.strptime(field_element.text + ' 23:59:59', '%d.%m.%Y %H:%M:%S')
    oldest_date = datetime.now() - timedelta(days=int(num_months) * 30)
    assert oldest_date < date_object, 'There are movements older than {} months'.format(num_months)

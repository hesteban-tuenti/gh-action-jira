"""
Boltons assertions steps
"""
import re

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page


@step('the "{bundle_type}" bundles in the "{bundles_list}" list has the "{field}" field')
def bundles_in_list_has_field(context, bundle_type, bundles_list, field):
    """
    step. Assert that all the bundles of a specific type have a specific field.
    :param context: behave context
    :param bundle_type: type of bundle (ex: active-recurrent)
    :param bundles_list: list of bundles
    :param field: field in the list of bundles
    """
    if bundle_type not in {"active-recurrent", "active-oneshot", "data_automatic", "removed"}:
        raise ValueError('Invalid parameter, available bundle types: mobile_line')

    bundle_found = 0
    user_bundles = context.user_bundles
    bundles_list = get_element_from_page(context, bundles_list)
    for bundle in user_bundles:
        if context.user.current_subscription == bundle[0]:
            for bundle_displayed in bundles_list:
                bundle_name = getattr(bundle_displayed, "title")
                if bundle_name.text == bundle[1]:
                    bundle_found = 1
                    bundle_field = getattr(bundle_displayed, field)
                    assert bundle_field.is_present(), f"The '{field}' field is not present in all elements of the list"

    if bundle_found == 0:
        raise AssertionError("No '{bundle_type}' bundle in list")


@step('the "{bundle_type}" bundles in the "{bundles_list}" list has the "{field}" textfield with the '
      '"{regular_expression}" format')
def bundles_in_list_has_field_with_format(context, bundle_type, bundles_list, field, regular_expression):
    """
    step. Assert that all the bundles of a specific type have a specific field.
    :param context: behave context
    :param bundle_type: type of bundle (ex: active-recurrent)
    :param bundles_list: list of bundles
    :param field: field in the list of bundles
    :param regular_expression: format of the field
    """
    if bundle_type not in {"active-recurrent", "active-oneshot", "data_automatic", "removed"}:
        raise ValueError('Invalid parameter, available bundle types: mobile_line')

    bundle_found = 0
    user_bundles = context.user_bundles
    bundles_list = get_element_from_page(context, bundles_list)
    for bundle in user_bundles:
        if context.user.current_subscription == bundle[0]:
            for bundle_displayed in bundles_list:
                bundle_name = getattr(bundle_displayed, "title")
                if bundle_name.text == bundle[1]:
                    bundle_found = 1
                    bundle_field = getattr(bundle_displayed, field)
                    assert re.match(regular_expression, bundle_field.text), f"'{bundle_field.text}' of list {field} " \
                        f"field doesn't match with the regular expresion: {regular_expression}"

    if bundle_found == 0:
        raise AssertionError("No '{bundle_type}' bundle in list")


@step('the "{bundle_type}" bundles in the "{bundles_list}" list has the "{field}" textfield with "{field_text}" text')
def bundles_in_list_has_field_with_text(context, bundle_type, bundles_list, field, field_text):
    """
    step. Assert that all the bundles of a specific type have a specific field.
    :param context: behave context
    :param bundle_type: type of bundle (ex: active-recurrent)
    :param bundles_list: list of bundles
    :param field: field in the list of bundles
    :param field_text: text of the field
    """
    if bundle_type not in {"active-recurrent", "active-oneshot", "data_automatic", "removed"}:
        raise ValueError('Invalid parameter, available bundle types: mobile_line')

    bundle_found = 0
    user_bundles = context.user_bundles
    bundles_list = get_element_from_page(context, bundles_list)
    for bundle in user_bundles:
        if context.user.current_subscription == bundle[0]:
            for bundle_displayed in bundles_list:
                bundle_name = getattr(bundle_displayed, "title")
                if bundle_name.text == bundle[1]:
                    bundle_found = 1
                    bundle_field = getattr(bundle_displayed, field)
                    assert bundle_field.text == field_text, f"'{bundle_field.text}' of list {field} field doesn't " \
                        f"match with the expected text: {field_text}"

    if bundle_found == 0:
        raise AssertionError("No '{bundle_type}' bundle in list")


@step('all bundles in "{bundles_list}" list are from the "{bundles_category}" category')
@step('all bundles in "{bundles_list}" carousel are from the "{bundles_category}" category')
def bundles_in_list_are_from_category(context, bundles_list, bundles_category):
    """
    step. Assert that all the bundles in the list/carousel are from a specific category.
    :param context: behave context
    :param bundles_list: list/carousel of bundles
    :param bundles_category: category of the bundles
    """
    if bundles_category not in {"Data", "Minutes & SMS", "Kombi", "International", "Other packs"}:
        raise ValueError('Invalid parameter, available bundle categories: Data, Minutes & SMS, Kombi, International, '
                         'Other packs')

    bundle_found = 0
    user_bundles = context.user_bundles
    bundles_list = get_element_from_page(context, bundles_list)
    for bundle_displayed in bundles_list:
        bundle_found = 0
        bundle_name = getattr(bundle_displayed, "title")
        for bundle in user_bundles:
            if context.user.current_subscription == bundle[0] and bundle_name.text == bundle[1]:
                bundle_found = 1
        assert bundle_found == 1, f"'{bundle_name.text}' bundle is not from the {bundles_category} category"

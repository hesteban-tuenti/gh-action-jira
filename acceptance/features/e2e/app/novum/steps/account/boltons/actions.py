"""
Account Boltons actions steps
"""
from random import randrange
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from selenium.common.exceptions import ElementClickInterceptedException
from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen


@step('clicks on the elegible category in the "{categories_list}" list')
def clicks_on_elegible_category_in_list(context, categories_list):
    """
    step. Clicks on the desired bundle category of the list

    :param context: behave context
    :param categories_list: list of bundle categories
    """
    category_mapping = {
        "any": "any",
        "Data": "Daten-Optionen",
    }
    selected_elements = []
    categories_list = get_element_from_page(context, categories_list)
    assert len(categories_list) > 0, f"-'{categories_list}'- list not found or length = 0"
    for category in categories_list:
        category_name = getattr(category, "title")
        if context.bundle_category == "any" or category_name.text == category_mapping[context.bundle_category]:
            selected_elements.append(category)

    assert selected_elements, f"'No element in the '{categories_list}' list with '{context.bundle_category}' category"

    # Click on the first element found
    try:
        selected_elements[0].click()
    except AttributeError:
        selected_elements[0].web_element.click()


@step('clicks on the "{field}" button of any bundle')
def click_field_group_list(context, field):
    """
    step. Click on the field of any bundle
    :param context: behave context
    :param field: field in the list to click
    """
    element_list = get_element_from_page(context, "all_bundles.list")
    total = len(element_list.page_elements)
    index = randrange(total)
    element = element_list[int(index)]
    display_element_on_screen(element)
    try:
        getattr(element, field).click()
    except ElementClickInterceptedException:
        context.driver.execute_script('arguments[0].scrollIntoView({inline: "center"});', element.web_element)
        getattr(element, field).click()

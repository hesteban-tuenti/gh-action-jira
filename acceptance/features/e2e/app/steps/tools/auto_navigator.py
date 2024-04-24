"""
Auto Navigator Steps Module
"""
import re

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.common.autonavigation.path_finder import PathFinder
from acceptance.app.common.autonavigation.page_objects_provider import PageObjectsProvider
from acceptance.web.common.web_page_object_provider.web_page_object_catalog import WebPageObjectsProvider


@step('user is in the "{destination_page}" page')
@step('user is in the "{destination_page}" popup')
@step('navigates to "{destination_page}" page')
def user_navigates_to_page(context, destination_page):
    """
    step. Takes the app to the screen corresponding to the given destination PageObject. path_finder has to be
    initialized, and the navigation will only work if a path has been defined between pageobjects, using
    navigablepageelements
    :param context: behave context
    :param destination_page: string, Name of the PageObject class where the app has to go excluding the Base
    prefix. It can be split into separated words using spaces to better reflect natural language
    """
    destination_page = destination_page.replace(" ", "")

    if context.driver_wrapper.is_mobile_test():
        destination_page = PageObjectsProvider().get_page_object_name(destination_page)
        origin_page_class_name = context.current_page.__class__.__name__ \
            if context.current_page else None

        # Navigate
        context.current_page = PathFinder().navigate(
            context.driver_wrapper,
            origin_page_class_name,
            destination_page,
        ).wait_until_loaded()
        context.page = context.current_page
    else:
        destination_page = WebPageObjectsProvider().get_page_object_name(destination_page)
        url = context.paths.get_url(destination_page)

        match = re.search(r'{(?P<product>\w+)}', url)
        if match:
            product = match.groups()[0]
            agreement_id = context.context_response.get_agreement(product)
            to_format = {product: agreement_id['value']}
            url = url.format(**to_format)
        context.execute_steps(u"""Given I navigate to the "{0}" URL for "{1}" web page
                                  And the "{1}" page is displayed""".format(url, destination_page))

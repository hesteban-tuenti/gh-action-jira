"""
launch app screen assertions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.app.novum.pageobjects.base.launchapp.cookies_permissions import BaseCookiesPermissions


@step("carousel with {title} and {description} will be displayed")
def carousel_is_displayed(context, title, description):
    """
    Step. Checks the carousel in the splash screen

    :param context: behave context
    :param title: Carousel title
    :param description: Carousel description
    """
    context.current_page.select_carousel(title, description)


@step("terms and conditions footer will be displayed")
def see_terms_and_conditions(context):
    """
    Step. Checks the terms and conditions text/link in the splash screen

    :param context: behave context
    """
    if context.driver_wrapper.is_android_test():
        assert context.current_page.terms_and_conditions.text == \
            map_param("[LANG:launch_app.splash_screen.terms_and_conditions_footer]")
    else:
        assert context.current_page.terms_and_conditions.text == \
            map_param("[LANG:launch_app.splash_screen.terms_and_conditions_footer]")
        assert context.current_page.terms_and_conditions_link.text == \
            map_param("[LANG:launch_app.splash_screen.terms_and_conditions_link]")


@step("user has set the cookies preferences")
def check_cookies_preferences(context):  # noqa: ARG001
    """
    Step. Checks the cookies preferences is not requested when the app is launched

    :param context: behave context
    """
    assert BaseCookiesPermissions().is_in_cookies_permissions() is False, "Cookies preferences has not been set"

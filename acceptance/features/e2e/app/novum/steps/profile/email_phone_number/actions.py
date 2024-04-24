"""
Email - Phone number actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.common.autonavigation.page_objects_provider import get_unprefixed_class_name


@step('user has the "{contact_method}" contact method set in the application')
def user_has_the_contact_method_set_in_the_app(context, contact_method):
    """
    step. Check if the user has the corresponding contact method configured in the Personal Data page within Profile.
    :param context: behave context
    :param contact_method:
        """
    current_page = get_unprefixed_class_name(context.driver_wrapper, context.current_page.__class__.__name__)

    if contact_method == 'email':
        context.execute_steps(u"""Given user is in the "Email Contact" page""")
        context.execute_steps(r'Then the "email_input_field" inputtext with the ".+@\w+.\w+" format is displayed')
    elif contact_method == 'phone number':
        context.execute_steps(u"""Given user is in the "Phone Number Contact" page""")
        context.execute_steps(r'Then the "phone_input_field" inputtext '
                              r'with the "^(\+\d{2}\s)*\d{3}\s\d{2}\s\d{2}\s\d{2}$" format is displayed')

    else:
        raise NotImplementedError("{} contact method not valid. Use: email/phone number".format(contact_method))

    context.execute_steps(u"""Given clicks on the "navigation_top_bar.back_button" button
                               And the "Personal Data" page is displayed
                               And user is in the "{}" page""".format(current_page))

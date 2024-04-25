"""
Login screen actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step("logs in the cms")
def logs_in(context):
    """
    Step. Logs in the cms

    :param context: behave context
    """
    context.execute_steps(u"""Given I fill in the "username_inputtext" field with "{}"
                                And I fill in the "password_inputtext" field with "{}"
                                And I click on the "continue_button" button
                                And the "Comms Module" page is loaded""".format(context.user.user_login,
                                                                                context.user.password))


@step("logs in the loyalty cms")
def logs_in_loyalty(context):
    """
    Step. Logs in the loyalty cms

    :param context: behave context
    """
    context.execute_steps(u"""Given I fill in the "username_inputtext" field with "{}"
                                And I fill in the "password_inputtext" field with "{}"
                                And I click on the "continue_button" button
                                And the "Promotions" page is loaded""".format(context.user.user_login,
                                                                              context.user.password))

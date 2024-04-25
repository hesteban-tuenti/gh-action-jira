"""
Login screen actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.web.novum.login.code_factory import LoginHelper, AusLoginHelper


@step("user logs in the webapp")
@step("logs in the webapp")
def logs_in(context):
    """
    Step. Starts the log in process

    :param context: behave context
    """
    LoginHelper().get_helper(context).login()

    context.execute_steps(u"""Given the "Account" page is displayed""")


@step("user logs in the webapp using AUS")
@step("logs in the webapp using AUS")
def aus_logs_in(context):
    """
    Step. Starts the log in process using the AUS url

    :param context: behave context
    """
    AusLoginHelper().get_helper(context).login()

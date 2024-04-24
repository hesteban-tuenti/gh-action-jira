"""
Login assertions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.constants.constants import CONFIG


@step('user has logged by "{login_type}"')
def is_logged_by_login_type(context, login_type):
    """
    Step. Check if user has logged in by given login type.

    :param context: behave context
    :param login_type: login type. Available values: usr/pwd, otp
    """
    login = {
        'usr/pwd': CONFIG.LOGIN_TYPE_USER_PWD,
        'otp': CONFIG.LOGIN_TYPE_SMS,
    }
    if login_type not in login:
        raise ValueError(f'Unexpected {login_type} login type. Available values: {login.keys()}')
    user_login_type = context.user.login_type
    if user_login_type == CONFIG.LOGIN_TYPE_SELECTION:
        # if the login type is selection (used in dev/qa), we check the level of assurance (loa) value
        loa = context.user.loa
        if loa == "2":
            user_login_type = CONFIG.LOGIN_TYPE_SMS
        elif loa == "3":
            user_login_type = CONFIG.LOGIN_TYPE_USER_PWD
    if user_login_type != login.get(login_type, ''):
        context.scenario.skip(reason=f'Unexpected login type. Expected: {login_type}, found: {context.user.login_type}')


@step('user is "{register_status}" in the application')
def user_is_registered(context, register_status):
    """
    step. Assert the user is either registered or not registered

    :param context: behave context
    :param register_status: register status registered or not_registered
    Currently we are assuming users are registered
    """
    _ = context
    if register_status not in {'registered', 'not_registered'}:
        raise ValueError(f'"{register_status}" is not a valid value for the register status. Valid options: '
                         '"registered", "not_registered"')
    if register_status != 'registered':
        raise NotImplementedError("Not implemented yet")

"""
User profile management actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.common.actions.base.switch import BaseSwitch
from acceptance.app.common.autonavigation.page_objects_provider import get_unprefixed_class_name
from acceptance.app.novum.pageobjects.base.profile.notifications_management.notifications_management \
    import BaseNotificationsManagement
from acceptance.common.constants.constants import BRANDS
from acceptance.features.e2e.app.novum.steps.login.actions import is_logged


@step('user has "{notification_type}" notifications "{status}" in the application')
def user_has_notifications_in_status_in_app(context, notification_type, status):
    """
    step. Enables/Disables the service or commercial notifications.
    The context.current_page is saved before enabling/disabling the notifications, so after the action is done, the
    navigation is restored to the page
    :param context: behave context
    :param notification_type: notification's type: commercial or service
    :param status: desired status of the notification's type in the app: enabled or disabled
    """
    current_page = get_unprefixed_class_name(context.driver_wrapper, context.current_page.__class__.__name__)

    if status == 'any':
        # No change will be done
        return
    context.execute_steps(u"""Given user is in the "Notifications Management" page""")

    switch = getattr(BaseNotificationsManagement(), "{}_notification_switch".format(notification_type))

    if (status == 'enabled' and not BaseSwitch().is_enabled(switch)) \
            or (status == 'disabled' and BaseSwitch().is_enabled(switch)):
        switch.click()
    context.execute_steps(u"""Given user is in the "{}" page""".format(current_page))


@step('user is logged in with "{accounts_number:d}" account/s')
def is_logged_in_with_number_of_accounts(context, accounts_number):
    """
    step. Assert that the user is logged in with a custom number of accounts
    :param context: Behave context
    :param accounts_number: Number of logged accounts: Int
    """
    if accounts_number > 1:
        if context.user.brand == BRANDS.VIVOBR:
            # TODO(pespinel): Implement multiple account login for Vivobr.
            # https://jira.tid.es/browse/NOV-237379
            context.scenario.skip(reason="Step is not yet implemented for this brand")
        else:
            raise ValueError(f"'{context.user.brand}' does not support multilogin")
    is_logged(context)

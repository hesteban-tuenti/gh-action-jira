"""
Notification inbox assertions
"""
import logging
from re import match
from selenium.common.exceptions import StaleElementReferenceException
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.utils.dataset import map_param

from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.common.steps.actions.elements import get_element_from_page

from acceptance.features.e2e.app.novum.steps.notification_inbox.actions \
    import find_notification_by_title_and_description, get_notification_from_context

logger = logging.getLogger(__name__)


@step('the badge in the "{element_name}" shows the number of unseen notifications')
def element_has_the_text(context, element_name):
    """
    Assert the numeric badge in the Inbox icon shows the number of unseen notifications retrieved from the server.

    :param context: behave context
    :param element_name: name of the inbox icon element
    """
    element_has_n_notifications(context, element_name, context.unseen_notifications)


@step('the badge in the "{element_name}" has "{unseen_notifications}" unseen notifications')
def element_has_n_notifications(context, element_name, unseen_notifications):
    """
    Assert the numeric badge in the Inbox icon shows the given number of unseen notifications.

    :param context: behave context
    :param element_name: name of the inbox icon element
    :param unseen_notifications: number of expected unseen notifications
    """
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)

    if context.driver_wrapper.is_android_test():
        try:
            value = match("^([0-9]+) ({})$".format(map_param("[LANG:notification_inbox.notifications_badge]")),
                          element.web_element.tag_name)
        except StaleElementReferenceException:
            logger.debug("Stale exception checking the badge - retrying")
            value = match("^([0-9]+) ({})$".format(
                map_param("[LANG:notification_inbox.notification_inbox.notifications_badge]")),
                element.web_element.tag_name)
    else:
        try:
            value = match("^inbox_barButtonItem_button_inbox_badge_([0-9]+)$", element.get_attribute("name"))
        except StaleElementReferenceException:
            logger.debug("Stale exception checking the badge - retrying")
            value = match("^inbox_barButtonItem_button_inbox_badge_([0-9]+)$", element.get_attribute("name"))
    try:
        expected_unseen_notifications = int(eval(unseen_notifications)) \
            if not isinstance(unseen_notifications, int) else unseen_notifications
        assert int(value.group(1)) == expected_unseen_notifications, \
            f"Inbox icons should show {expected_unseen_notifications} notification/s and shows {int(value.group(1))}"
    except AttributeError as error:
        logger.debug("Error checking unseen notifications: %s", error)
        raise AssertionError("Error checking unseen notifications: {}".format(error))


@step('a badge is not displayed in the selected notification')
def badge_not_displayed_notification(context):
    """
    Asserts the selected notification used in the scenarios and set in the context doesn't have the badge , therefore
    it has been already consumed
    :param context: behave context
    """
    assert not context.selected_notification.consumed_badge.is_visible(), "Consumed badge is displayed"


@step('a badge is displayed in the selected notification')
def badge_is_displayed_in_notification(context):
    """
    Asserts the selected notification used in the scenarios and set in the context has the badge , therefore
    it hasn't been already consumed
    :param context: behave context
    """
    assert context.selected_notification.consumed_badge.is_visible(), "Consumed badge is not displayed"


@step('the thumbnail is displayed in the selected notification')
def thumbnail_is_displayed_in_notification(context):
    """
    Asserts the selected notification used in the scenarios and set in the context has the thumbnail visible
    :param context: behave context
    """
    notification = get_notification_from_context(context)
    find_notification_by_title_and_description(context, notification["title"],
                                               notification["description"])

    assert context.selected_notification.thumbnail.is_visible(), "Notification's thumbnail is not displayed"

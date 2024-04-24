"""
Notification inbox actions
"""
import logging
from toolium.pageelements import PageElement
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By


from acceptance.app.novum.pageobjects.base.notification_inbox.notification_inbox import BaseNotificationInbox
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen

logger = logging.getLogger(__name__)


def find_notification_by_title_and_description(context, title, description):
    """
    Looks for a notification with title and description in the Inbox
    :param context: behave context
    :param title: Notification's title
    :param description: Notification's description
    """

    inbox_list = BaseNotificationInbox().inbox_list

    # locate element by description to ensure the element group is fully visible
    element = PageElement(By.XPATH, "//*[contains(@text,'{}')]".format(description.replace('\r', '').rstrip()))
    display_element_on_screen(element)

    for notification in inbox_list:
        try:
            if (notification.title.text, notification.description.text.rstrip()) \
                    == (title, description.replace('\r', '').rstrip()):
                context.selected_notification = notification
                break
        except NoSuchElementException:
            # it could happen that after displaying the element, the list shows the first element partially hidden
            continue

    else:
        raise ValueError("Notification with title: {} and description: {} not found in the Inbox"
                         .format(title, description))
    logger.debug("Notification with title: %s and description: %s found in the Inbox", title, description)


def get_notification_from_context(context, status=None):
    """
    Retrieves from the context the notification set with a specific status after calling the corresponding
    apicall method, in case of not defining the status it will retrieve the first notification found in the context.
    :param context: behave context
    :param status: notification's status
    :return: notification from context
    """
    if not status:
        notification_attr = next(elem for elem in context.storage if "notification" in elem)
    else:
        notification_attr = "{}_notification".format(status)

    try:
        notification = context.storage[notification_attr]
    except KeyError:
        logger.error("Notification with status: %s not set in the context", status)
        raise AttributeError

    return notification


@step('clicks on the thumbnail of a "{status}" notification')
def click_on_thumbnail_of_notification_with_status(context, status):
    """
    Given a notification with status has been set in the context, it will be looked for in the Inbox by the title and
    the description and click on the notifications's thumbnail.
    :param context: behave context
    :param status: Notification's status : consumed/unconsumed
    """
    notification = get_notification_from_context(context, status)
    find_notification_by_title_and_description(context, notification["title"],
                                               notification["description"])

    if context.selected_notification.thumbnail.is_present():
        logger.debug("clicking in the notification's thumbnail with title: %s and description: %s",
                     notification["title"],
                     notification["description"])
        context.selected_notification.thumbnail.click()
    else:
        raise ValueError("Notification's thumbnail is not present")

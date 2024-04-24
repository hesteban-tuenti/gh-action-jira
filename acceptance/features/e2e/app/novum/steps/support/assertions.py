"""
Support assertion steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.features.e2e.app.steps.common.actions.elements import get_element_from_page


@step('the "{expected_text}" {message_type} text is displayed on the "{index}" position of the support chat')
def support_chat_contains_the_text(context, expected_text, message_type, index):
    """
    step. Assert that the text message in the index position of the support chat passed as parameter
    contains the expected text

    :param context: behave context
    :param expected_text: expected text
    :param message_type: type of the chat message. Valid values: message, metamessage, date separator
    :param index: index of the message in the support chat
    """
    if index == "last":
        index = -1
    messages_history = get_element_from_page(context, "messages_history")
    message = messages_history.get_message_text(int(index), message_type)
    assert expected_text in message.text, f"'{message.text}' not contains the text: '{expected_text}'"

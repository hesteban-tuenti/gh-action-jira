"""
Aura screen steps
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.novum.pageobjects.base.aura.aura import BaseAura
from acceptance.common.steps.actions.elements import get_element_from_page


@step('sends the message "{message}" to Aura via "{aura_input}"')
def sends_message_to_aura(context, message, aura_input):
    """
    Step. Send a message to Aura via microphone or keyboard

    :param context: behave context
    :param message: message to send to aura
    :param aura_input: input to send to aura. Available values: microphone, keyboard
    """

    if aura_input == 'microphone':
        context.scenario.skip(reason="{} input to Aura not implemented".format(aura_input))
    elif aura_input == 'keyboard':
        context.current_page = BaseAura().wait_until_loaded()
        context.current_page.send_text_to_aura(message)
    else:
        raise ValueError('The input {} is not valid for Aura'.format(aura_input))


@step('clicks on the alfred "{alfred_level}" button with "{alfred_button_text}" text')
def click_alfred_level_button(context, alfred_level, alfred_button_text):
    """
    Step. Send a message to Aura via alfred

    :param context: behave context
    :param alfred_level: level in alfred buttons
    :param alfred_button_text: text for search in the alfred level buttons
    """

    elements = get_element_from_page(context, alfred_level)
    context.driver.swipe(0, 500, 0, 200, 250)

    for element in elements:
        if element.text == alfred_button_text:
            element.click()
            return

    raise AssertionError(f"Element '{alfred_button_text}' is not shown in the current Alfred level")

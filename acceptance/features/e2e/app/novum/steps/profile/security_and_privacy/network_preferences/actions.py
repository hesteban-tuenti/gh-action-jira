"""
Network preferences actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step('clicks on the more information link')
def clicks_more_information_link(context):
    """
    step. Step defined to have a better readable scenario. Just calls the step:
    clicks on the relative position x:"{x_percent}" y:"{y_percent}" of the "{element_name}" element, with the
    appropriate values to click on the element where the link is contained.

    :param context: behave context
    """
    context.execute_steps('When clicks on the relative position x:"0.6" y:"0.8" '
                          'of the "network_optimization_module.body_textfield" element')

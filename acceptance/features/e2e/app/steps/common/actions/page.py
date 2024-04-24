"""
Page actions steps
"""
import os

from time import sleep
from io import BytesIO

from behave import step as behave_step  # noqa: F401
from PIL import Image
from toolium.driver_wrappers_pool import DriverWrappersPool
from toolium.utils.dataset import map_param
from toolium.utils.path_utils import get_valid_filename, makedirs_safe
from toolium.visual_test import VisualTest
from toolium_telefonica.behave import step


from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.common.steps import skip_execution, get_element_from_page


@step('takes a screenshot')
def take_screenshot(context):
    """
    step. Take a screenshot and save it in the baseline folder in order to be used for visual testing
    :param context: behave context
    """
    unique_base_name = '{0:0=2d}_{1}'.format(DriverWrappersPool.visual_number, 'previous_state')
    unique_name = '{}.png'.format(get_valid_filename(unique_base_name))

    if context.driver_wrapper.is_mobile_test() and context.driver_wrapper.driver.context != 'NATIVE_APP':
        context.driver_wrapper.driver.switch_to.context('NATIVE_APP')
    screenshot = Image.open(BytesIO(context.driver_wrapper.driver.get_screenshot_as_png()))
    if context.driver_wrapper.is_ios_test():
        screenshot = VisualTest().mobile_resize(screenshot)

    path = os.path.join(DriverWrappersPool.visual_baseline_directory, map_param('[TOOLIUM:Driver_type]'))
    makedirs_safe(path)
    filename_path = os.path.join(path, unique_name)
    screenshot.save(filename_path)
    context.storage['baseline_image'] = unique_base_name


@step('scrolls down')
def scroll_down(context):
    """
    step. Scrolls down the current page
    :param context: behave context
    """
    if context.driver_wrapper.is_mobile_test():
        # In some Android devices this is sleep is needed
        if context.driver_wrapper.is_android_test():
            sleep(2)
        BaseScreen().native_scroll_down()
    else:
        context.execute_steps(u"""When I scroll to the bottom of the page""")


@step('scrolls up')
def scrolls_up(context):
    """
    step. Scrolls up
    :param context: behave context
    """
    if context.driver_wrapper.is_mobile_test():
        BaseScreen().native_scroll_up()
    else:
        context.execute_steps(u"""When I scroll to the top of the page""")


@step('switches to "{iframe_name}" iframe')
def switch_iframe(context, iframe_name):
    """
    step. switch to the desired iframe
    :param context: behave context
    :param iframe_name: name of the iframe to switch
    """
    context.execute_steps(u"""When waits "1" seconds""")
    frame = get_element_from_page(context, iframe_name)
    if context.driver_wrapper.is_web_test():
        context.driver.switch_to.frame(frame.web_element)
    elif "WEBVIEW" in context.driver_wrapper.driver.context:
        context.driver_wrapper.driver.switch_to.frame(frame.web_element)
    else:
        skip_execution(context, reason="Current context is {}".format(context.driver_wrapper.driver.context))


@step('switches to original frame')
def switch_original_iframe(context):
    """
    step. switch to the original iframe
    :param context: behave context
    """
    if context.driver_wrapper.is_web_test():
        context.driver.switch_to.default_content()
    elif "WEBVIEW" in context.driver_wrapper.driver.context:
        context.driver_wrapper.driver.switch_to.default_content()
    else:
        skip_execution(context, reason="Current context is {}".format(context.driver_wrapper.driver.context))


@step('switches to iframe')
def switches_to_iframe(context):
    """
    step. Moves to the iframe
    :param context: behave context
    """
    if context.driver_wrapper.is_web_test():
        context.driver.switch_to.frame(0)


@step('switches to "{iframe_name}" webapp iframe')
def switch_webapp_iframe(context, iframe_name):
    """
    step. switch to the desired iframe for webapp
    :param context: behave context
    :param iframe_name: name of the iframe to switch
    """
    if context.driver_wrapper.is_web_test():
        context.execute_steps(u"""When waits "1" seconds""")
        frame = get_element_from_page(context, iframe_name)
        context.driver.switch_to.frame(frame.web_element)


@step('clicks on the "{element_name}" button to go back to the previous page')
def goes_back_previous_page(context, element_name):
    """
    step. Goes back to the previous page clicking the given button if client is a device. For web clients,
    the back history in browser will be done.

    :param context: behave context
    :param element_name: element name to click
    """
    if context.driver_wrapper.is_web_test():
        context.execute_steps(u"""When I go back to the previous page""")
    else:
        context.execute_steps(u"""When clicks on the "{}" button""".format(element_name))

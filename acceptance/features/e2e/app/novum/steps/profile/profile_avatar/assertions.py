"""
Profile avatar assertions
"""
from io import BytesIO
import logging
import os
from PIL import Image
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium.visual_test import VisualTest

from acceptance.common.steps.user_features.selector_handler import skip_execution
from acceptance.app.novum.pageobjects.base.profile.profile import BaseProfile
from acceptance.common.steps.actions.elements import get_element_from_page


logger = logging.getLogger(__name__)


@step('the profile avatar icon displays the new picture')
def avatar_image_displays_the_new_picture(context):
    """
    Step calling all the necessary steps to verify that the profile avatar picture matches the baseline image set
    for the Visual testing check

    :param context: behave context
    """

    context.execute_steps(u"""Given user is in the "Profile" page
                                And clicks on the "photo" icon
                                And the "Avatar Options Sheet" sheet is displayed
                                And clicks on the "see_picture" icon
                                And waits until the "see_picture" element is not visible
                                And the "Profile Avatar" page is displayed
                               Then check that the screen is in the previous state with threshold "0.2"
                                And the avatar picture is not shown full screen
                                And user is in the "Profile" page
                          """)


@step('user has not uploaded the avatar picture')
@step('the profile avatar is empty')
def empty_avatar(context):
    """
    Asserts the profile avatar image is the default image shown when the user hasn't uploaded the avatar yet.
    0.1 threshold is set to compare elements with short dimension
    :param context: behave's context
    """
    context.current_page = BaseProfile()
    try:
        assert_element_with_baseline(context, 'photo', f'{context.user.brand}/empty_avatar', 0.2)
        logger.debug("Avatar picture is not uploaded")

    except AssertionError as error:
        logger.warning("Avatar picture is uploaded - Photo element is different from baseline: %s", error)
        skip_execution(context, reason='Avatar picture is uploaded')


@step('user has uploaded the avatar picture')
def not_empty_avatar(context):
    """
    Asserts the profile avatar image isn't the default image shown when the user hasn't uploaded the avatar yet.
    In case it matches, meaning the user hasn't uploaded it yet, the scenario will be skipped, otherwise if the
    exception is raised , meaning the avatar is uploaded, it is captured.
    0.1 threshold is set to compare elements with short dimension
    :param context: behave's context
    """
    context.current_page = BaseProfile()
    try:
        assert_element_with_baseline(context, 'photo', f'{context.user.brand}/empty_avatar', 0.1)
        skip_execution(context, reason='Avatar picture is not uploaded')

    except AssertionError as error:
        logger.warning("Avatar picture is uploaded - Photo element is different from baseline: %s", error)


@step('the avatar picture is not shown full screen')
def avatar_picture_not_full_screen(context):
    """
    Ensures the profile avatar picture is not shown full screen
    :param context: behave context
    """

    context.current_page.avatar_image_is_not_full_screen()


def assert_element_with_baseline(context, element_name, baseline_file, threshold=0.2):
    """
    This method asserts an element's picture with a baseline similar to the method assert_screenshot included in the
    VisualTest module, the difference between both is this method will resize either the element's image or the baseline
    image before comparing them, this way we don't need to provide baselines for every mobile resolution. Moreover we
    are assuming PIL as the default engine.
    :param context: behave context
    :param element_name: element name to compare with the baseline
    :param baseline_file: baseline file name
    :param threshold: distance threshold to assert the difference between the images
    """
    element_output_file = os.path.join(VisualTest().baseline_directory, f'{element_name}.png')
    baseline_filepath = os.path.join(VisualTest().baseline_directory, f'{baseline_file}.png')

    # Get image from element in the current page object
    element = get_element_from_page(context, element_name)
    web_element = context.utils.get_web_element(element)
    screenshot = Image.open(BytesIO(context.driver_wrapper.driver.get_screenshot_as_png()))
    screenshot = VisualTest().mobile_resize(screenshot)
    img = VisualTest().crop_element(screenshot, web_element)

    # Resize largest screenshot to the shortest's size
    img2 = Image.open(baseline_filepath)
    if img.size > img2.size:
        img = img.resize(img2.size, Image.LANCZOS)
    else:
        img2 = img2.resize(img.size, Image.LANCZOS)

    # Save image to disk
    img.save(element_output_file)

    if VisualTest(context.driver_wrapper).compare_files('assert with baseline', baseline_filepath, element_output_file,
                                                        threshold) == 'diff':
        raise AssertionError("Image don't match woth threshold {}".format(threshold))

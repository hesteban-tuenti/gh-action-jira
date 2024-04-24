"""
Image assertions steps
"""
import os

from io import BytesIO
from behave import step as behave_step  # noqa: F401

from PIL import Image
from toolium.driver_wrappers_pool import DriverWrappersPool
from toolium.utils.dataset import map_param
from toolium.utils.path_utils import makedirs_safe
from toolium.visual_test import VisualTest
from toolium_telefonica.behave import step

from acceptance.common.steps.actions.elements import get_element_from_page
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen


@step('check that the image "{image_name}" is present in the element "{element_name}" with threshold "{threshold}"')
def check_asset(context, image_name, element_name, threshold):
    """
    step. Compare an image of an element saved in the baseline folder with a new screenshot of that element.
          Use the step 'take a screenshot of "{element_name}" and save it as "{image_name}"'
          in order to get the image to compare.
          Delete the element_resized.png image generated in the baseline folder before pushing the branch to avoid noise
          This image is needed after the execution if you want to look at the visual test report
    :param image_name: Name of the image in the baseline folder.
    :param element_name: Name of the element to check.
    :param threshold: Accuracy level of the comparison. From 0 being the most accurate to 1
    :param context: behave context
    """
    image_name = image_name + ".png"
    temp_image = "temp_image.png"
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    web_element = context.utils.get_web_element(element)
    # The size of img2 will be used to resize the image in the baseline folder according to the current device
    img2 = Image.open(BytesIO(context.driver_wrapper.driver.get_screenshot_as_png()))
    img2 = VisualTest().mobile_resize(img2)
    img2 = VisualTest().crop_element(img2, web_element)

    path = os.path.join(DriverWrappersPool.visual_baseline_directory, map_param('[TOOLIUM:Driver_type]'))
    makedirs_safe(path)
    img2.save(os.path.join(path, temp_image))
    img1 = Image.open(os.path.join(path, image_name))
    resized = img1.resize(img2.size, Image.LANCZOS)
    resized.save(os.path.join(path, "element_resized.png"))
    os.remove(os.path.join(path, temp_image))
    context.assert_screenshot(element, filename="element_resized", threshold=float(threshold), force=True)


@step('check that the image "{image_name}" is not present in the element "{element_name}" with threshold "{threshold}"')
def check_asset_not_present(context, image_name, element_name, threshold):
    """
    step. Compare an image of an element saved in the baseline folder with a new screenshot of that element and
          assert it's different.
          Use the step 'take a screenshot of "{element_name}" and save it as "{image_name}"'
          in order to get the image to compare.
          Delete the element_resized.png image generated in the baseline folder before pushing the branch to avoid noise
          This image is needed after the execution if you want to look at the visual test report
    :param image_name: Name of the image in the baseline folder.
    :param element_name: Name of the element to check.
    :param threshold: Accuracy level of the comparison. From 0 being the most accurate to 1
    :param context: behave context
    """
    image_name = image_name + ".png"
    temp_image = "temp_image.png"
    element = get_element_from_page(context, element_name)
    display_element_on_screen(element)
    web_element = context.utils.get_web_element(element)
    # The size of img2 will be used to resize the image in the baseline folder according to the current device
    img2 = Image.open(BytesIO(context.driver_wrapper.driver.get_screenshot_as_png()))
    img2 = VisualTest().mobile_resize(img2)
    img2 = VisualTest().crop_element(img2, web_element)

    path = os.path.join(DriverWrappersPool.visual_baseline_directory, map_param('[TOOLIUM:Driver_type]'))
    makedirs_safe(path)
    img2.save(os.path.join(path, temp_image))
    img1 = Image.open(os.path.join(path, image_name))
    resized = img1.resize(img2.size, Image.LANCZOS)
    resized.save(os.path.join(path, "element_resized.png"))
    os.remove(os.path.join(path, temp_image))
    try:
        context.assert_screenshot(element, filename="element_resized", threshold=float(threshold), force=True)
        raise Exception("Both images are equal images are equal")
    except AssertionError:
        return

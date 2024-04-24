"""
Open Camera Steps Module
"""
import time
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.app.common.actions.base.screen import BaseScreen
from acceptance.app.common.pageobjects.base.others.camera import BaseCamera
from acceptance.app.novum.pageobjects.base.launchapp.app_pin_code import BaseAppPinCode
from acceptance.common.constants.constants import BUNDLES, PACKAGES
from acceptance.features.e2e.app.steps.common.assertions.page import page_is_displayed


@step(u'takes a profile baseline picture')
def take_baseline_picture(context):
    """
    Take a baseline picture to use it afterwards as the base image to compare to.
    The default camera app is opened and a picture is taken, afterwards in order to get the cleanest format, the picture
    is opened in the gallery and selected by tapping in the screen in order to remove all the menu bar to edit it.
    Finally a call to the "takes a screenshot" method is done to take a screenshoot of the picture and save it as
    the baseline image
    :param context: Behave context
    """
    context.driver_wrapper.driver.activate_app(BUNDLES.CAMERA if context.driver_wrapper.is_ios_test()
                                               else getattr(PACKAGES.CAMERA, context.device.manufacturer.upper()))
    context.current_page = BaseCamera()
    if context.driver_wrapper.is_ios_test():
        context.current_page.deny_location_camera_permissions()
    context.current_page.wait_until_loaded()
    context.current_page.capture.click()
    time.sleep(5)
    context.current_page.gallery.wait_until_clickable()
    context.current_page.gallery.click()
    context.current_page.gallery.wait_until_not_visible()

    if context.current_page.toolbar_visible():
        BaseScreen().tap_the_screen()
        context.current_page.wait_until_toolbar_not_visible()

    context.execute_steps('Then takes a screenshot')
    context.driver_wrapper.driver.terminate_app(BUNDLES.CAMERA if context.driver_wrapper.is_ios_test()
                                                else getattr(PACKAGES.CAMERA, context.device.manufacturer.upper()))
    context.driver_wrapper.driver.activate_app(context.device.app_id)
    BaseAppPinCode().fill_pin_code_if_is_shown(context.user.app_pin_code)


@step(u'takes a picture from profile')
def take_picture(context):
    """
    Takes the profile's avatar picture when the camera has been opened from the user's profile icon.
    :param context:
    """
    context.current_page = BaseCamera()
    context.current_page.accept_camera_permissions()

    BaseCamera().wait_until_loaded()
    BaseCamera().take_picture()

    page_is_displayed(context, "Profile")

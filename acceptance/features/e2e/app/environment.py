"""
App environment module
"""
import base64
import logging
import os
import sys

import allure
from allure_commons.types import AttachmentType
from behave.model_core import Status
from toolium.behave.environment import start_driver
from toolium.utils.dataset import map_param
from toolium_telefonica.behave.environment import ALLURE_REPORTS
from selenium.common.exceptions import WebDriverException, NoSuchElementException
from urllib3.exceptions import MaxRetryError

from acceptance.app.common.app_center.app_center import AppCenterConfig
from acceptance.app.common.autonavigation.path_finder import PathFinder
from acceptance.app.common.device_config.code_factory import DeviceConfigHelper
from acceptance.app.common.device_config.device_config import Device
from acceptance.common.constants.constants import PERMISSIONS_FEATURES, SETUP_FEATURES
from acceptance.common.environment import (
    before_all as global_before_all,
    before_feature as global_before_feature,
    before_scenario as global_before_scenario,
    before_step as global_before_step,
    after_step as global_after_step,
    after_scenario as global_after_scenario,
    after_feature as global_after_feature,
    after_all as global_after_all)
from acceptance.features.e2e.app.steps import set_location_permission_to_always, BasePermissionsPopup
from acceptance.features.e2e.app.steps.common.assertions.page import get_page_object
import contextlib

logger = logging.getLogger(__name__)


def before_all(context, app_name, autonavigation_fallback):
    """Initialization method that will be executed before the test execution
    :param context: behave context
    :param app_name: application name
    :param autonavigation_fallback: fallback function that will be called when auto navigation fails
    """
    global_before_all(context)
    context.storage = dict()
    try:
        # When using emulators, it is not necessary to download the app from app center
        if not Device.is_emulator(context) and not Device.is_dummy(context):
            AppCenterConfig(context).configure_app()
        context.device_config = DeviceConfigHelper.get_helper(context)
        context.device = context.device_config.configure()
    except KeyError as error:
        raise RuntimeError(f'Wrong toolium env configuration: {error}')
    except Exception as error:  # noqa: BLE001
        raise RuntimeError(error)

    context.current_page = PathFinder().initialize_navigation_context(context.driver_wrapper, app_name)
    PathFinder().set_fallback_init(context.driver_wrapper, map_param('[CONF:landing_tab]'),
                                   autonavigation_fallback, context)
    context.set_page_object_dict(PathFinder().get_page_object_dict(context.driver_wrapper))
    if Device.is_dummy(context):
        sys.exit()


def before_feature(context, feature):
    """Feature initialization
    :param context: behave context
    :param feature: running feature
    """
    try:
        start_driver(context, False)
        context.device_config.set_window_size()
    except MaxRetryError as error:
        raise RuntimeError("Error starting the driver. Probably the appium processs is not running.\n{}".format(error))
    except WebDriverException as error:
        if 'xcodebuild' in str(error):
            raise RuntimeError("Error starting the driver. Check the derivedDataPath capability: {}.\n{}".format(
                context.driver_wrapper.config.get_optional('AppiumCapabilities', 'derivedDataPath'), error))
        raise RuntimeError("Error starting the driver. Check the capabilities and the server\n{}".format(error))
    except Exception as error:  # noqa: BLE001
        raise RuntimeError(error)

    global_before_feature(context, feature)


def before_scenario(context, scenario):
    """Scenario initialization
    :param context: behave context
    :param scenario: running scenario
    """
    global_before_scenario(context, scenario)
    # variable to restart auto-navigation in after scenario.
    context.reset_autonavigation = False
    if hasattr(context, 'allure'):
        context.device_config.start_recording_screen()


def before_step(context, step):
    """Step initialization
    :param context: behave context
    :param step: running step
    """
    if PathFinder().get_current_page(context.driver_wrapper) is not None:
        context.current_page = PathFinder().get_current_page(context.driver_wrapper)
    else:
        PathFinder().set_current_page(context.driver_wrapper, context.current_page)
    global_before_step(context, step)


def after_step(context, step):
    """Clean method that will be executed after each step
    :param context: behave context
    :param step: running step
    """
    if hasattr(context, 'allure') and step.status == Status.failed:
        # Set location permission to allow always in iOS if setup fails
        if context.feature.name in SETUP_FEATURES:
            with contextlib.suppress(NoSuchElementException):
                set_location_permission_to_always(context)

        # To avoid popup permissions
        if context.feature.name in PERMISSIONS_FEATURES:
            for permission in PERMISSIONS_FEATURES[context.feature.name]:
                BasePermissionsPopup().accept_permission(permission, context)
        try:
            video = context.device_config.stop_recording_screen()
            if video:
                allure.attach(base64.b64decode(video), name='Video', attachment_type=AttachmentType.MP4)
        # Sometimes ffmpeg process dies unexpectedly
        except WebDriverException:
            logger.warning("ffmpeg process has died unexpectedly while stopping the screen's recording")

    unrecoverable_errors = ('socket hang up', 'Session id not found')
    if step.status == Status.failed and any(True for s in unrecoverable_errors if s in str(step.exception)):
        raise KeyboardInterrupt('Unrecoverable error {}. Stop execution'.format(str(step.exception)))

    global_after_step(context, step)
    PathFinder().set_current_page(context.driver_wrapper, context.current_page)


def after_scenario(context, scenario, autonavigation_fallback):
    """Clean method that will be executed after each scenario
    :param context: behave context
    :param scenario: running scenario
    :param autonavigation_fallback: auto navigation callback function
    """
    if hasattr(context, 'allure') and scenario.status != Status.failed:
        context.device_config.stop_recording_screen()

    if context.device.airplane_mode:
        context.execute_steps(u"""Then turns off the airplane mode""")

    global_after_scenario(context, scenario)

    # if scenario fails or reset autonavigation property is true auto-navigation is restarted
    if scenario.status == Status.failed or context.reset_autonavigation:
        autonavigation_fallback(context)
        PathFinder().set_current_page(context.driver_wrapper, get_page_object(context, map_param('[CONF:landing_tab]')))


def after_feature(context, feature):
    """Clean method that will be executed after each feature
    :param context: behave context
    :param feature: running feature
    """
    global_after_feature(context, feature)


def after_all(context):
    """Clean method that will be executed after all features are finished
    :param context: behave context
    """
    if hasattr(context, 'device_config'):
        environment_dict = context.device_config.get_environment_config()
        with open(os.path.join(ALLURE_REPORTS, 'environment.properties'), "w+") as environment_file:
            for key in environment_dict:
                environment_file.write("{}= {}\n".format(key, environment_dict[key]))
        context.device_config.stop_log_capture()
    global_after_all(context)

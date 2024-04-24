"""
App status steps
"""
import logging
import subprocess
from time import sleep

from selenium.common.exceptions import NoSuchElementException, InvalidElementStateException
from selenium.webdriver.common.by import By
from appium.webdriver.common.appiumby import AppiumBy

from toolium.pageelements import Button, Link
from toolium.utils.dataset import map_param
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium_telefonica.behave.steps.mobile.actions.mobile_actions import change_device_orientation

from acceptance.app.common.pageelements.appcenterpopup import BaseAppCenterPopup
from acceptance.app.common.pageobjects.base.others.permissionspopup import BasePermissionsPopup
from acceptance.app.common.pageobjects.base.others.device_settings.app_details.app_details import BaseAppDetails
from acceptance.app.common.pageobjects.base.others.device_settings.app_details.location.location import BaseLocation
from acceptance.app.common.pageobjects.base.others.device_settings.device_settings import BaseDeviceSettings
from acceptance.common.constants.constants import APPNAME, BUNDLES, PACKAGES, PERMISSIONS
from acceptance.features.e2e.app.steps.common.actions.elements import display_element_on_screen
from acceptance.common.steps.actions.elements import get_element_from_page

logger = logging.getLogger(__name__)


@step('user terminates the app')
@step('terminates the app')
def terminate_app(context):
    """
    step. Terminates the default app without killing the Appium session.

    :param context: behave context.
    """
    # In android there are problems stopping the app in same cases (other versions of the app)
    if context.driver_wrapper.is_android_test():
        # reseting the context to Native to avoid problems in scenarios where the app the is restarted afterwards
        if context.driver.context != 'NATIVE_APP':
            context.driver.switch_to.context('NATIVE_APP')
        cmd = r"adb -s {0} shell am force-stop {1} & adb -s {0} shell am force-stop com.google.android." \
              r"permissioncontroller & adb -s {0} shell am force-stop com.google.android.packageinstaller".\
            format(context.device.udid, context.device.app_id)
        try:
            subprocess.check_output(cmd, shell=True, executable="/bin/zsh", universal_newlines=True,
                                    stderr=subprocess.STDOUT, timeout=10)
        except subprocess.CalledProcessError as error:
            raise RuntimeError('Error trying to stop app {}: {}'.format(context.device.app_id, error.stdout))
    else:
        context.driver.terminate_app(context.device.app_id)


@step('user terminates other apps')
@step('terminates other apps')
def terminate_other_apps(context):
    """
    step. Terminates chrome and other Novum apps in android devices.

    :param context: behave context.
    """
    if context.driver_wrapper.is_android_test():
        # reseting the context to Native to avoid problems in scenarios where the app the is restarted afterwards
        if context.driver.context != 'NATIVE_APP':
            context.driver.switch_to.context('NATIVE_APP')
        del PACKAGES.NOVUM.APPS[context.user.brand]
        app_list = list(PACKAGES.NOVUM.APPS.values())
        cmd = r"adb -s {0} shell am force-stop {1}".format(context.device.udid, PACKAGES.CHROME)
        for app in app_list:
            cmd += " & adb -s {0} shell am force-stop {1}".format(context.device.udid, app)
        try:
            subprocess.check_output(cmd, shell=True, executable="/bin/zsh", universal_newlines=True,
                                    stderr=subprocess.STDOUT, timeout=10)
        except subprocess.CalledProcessError as error:
            raise RuntimeError('Error trying to stop other apps: {}'.format(error.stdout))


@step('user has installed the app "{installation_package}" with build "{app_build}"')
def has_the_app_installed(context, installation_package, app_build):
    """
    step. Install the given app onto the device.

    :param context: behave context.
    :param installation_package: path of ipa or apk
    :param app_build: app build of the app
    """
    # In android there is not possible downgrade the app
    if context.driver_wrapper.is_android_test() and context.driver.is_app_installed(context.device.app_id):
        context.driver.remove_app(context.device.app_id)
    context.driver.install_app(installation_package)
    context.device.app_build = app_build
    context.driver.activate_app(context.device.app_id)
    BaseAppCenterPopup().popup_dismissed = False
    # after some test if necessary to wait after update the app
    sleep(3)


@step('uninstalls the app')
def uninstall_app(context):
    """
    step. Uninstall the app.

    :param context: behave context.
    """
    if not context.driver.is_app_installed(context.device.app_id):
        raise ValueError("Not possible to uninstall the app, the app is not installed")
    context.driver.remove_app(context.device.app_id)


@step('a newer app version exists in "{store}"')
def new_version_in_store(context, store):  # noqa: ARG001
    """
    step. Check if a new version of the app exist in the store.

    :param context: behave context.
    :param store: google play or app store
    """
    pass  # noqa: PIE790


@step('upgrades the app from the "{store}"')
def upgrade_the_app(context, store):  # noqa: ARG001
    """
    step. Upgrade the app to a new version. The installation package of the new version is in context.appcenter_app_path

    :param context: behave context.
    :param store: google play or app store
    """
    if not context.driver.is_app_installed(context.device.app_id):
        raise ValueError("Not possible to upgrade the app, there is not a version of the app installed")
    context.driver.install_app(context.appcenter_app_path)
    context.device.app_build = map_param("[TOOLIUM:Appcenter_app_build]")


@step('installs the app from the "{store}"')
def install_the_app(context, store):  # noqa: ARG001
    """
    step. Install the app into the device. The installation package of the app is in context.appcenter_app_path

    :param context: behave context.
    :param store: google play or app store
    """
    if context.driver.is_app_installed(context.device.app_id):
        raise ValueError("Not possible to install, a version of the app is already instaled")
    context.driver.install_app(context.appcenter_app_path)


@step('user launches the app')
@step('launches the app')
@step('user goes back to the app')
@step('goes back to the app')
def launch_app(context):
    """
    Step. Start the application specified in the desired capabilities.

    :param context: behave Context.
    """
    context.driver_wrapper.driver.activate_app(context.device.app_id)


@step(u'runs the app in the background for "{seconds:d}" seconds')
def run_background_app(context, seconds):
    """
    Step. Puts the application in the background for a certain duration.

    :param context: behave Context.
    :param seconds: the duration for the application to remain in the background.
    """
    context.execute_steps(u"""When I run the app in the background for "{}" seconds""".format(seconds))


@step('user waits "{}" seconds')
@step('waits "{}" seconds')
def wait_n_seconds(context, seconds):
    """
    Step. wait 'n' seconds

    :param context: behave context.
    :param seconds: seconds to wait
    """
    seconds = eval(seconds)
    context.execute_steps(u"""When I wait "{}" seconds""".format(seconds))


@step(u'user sets the device to "{orientation}" orientation')
@step(u'sets the device to "{orientation}" orientation')
def set_device_orientation(context, orientation):
    """
    Step. Change screen orientation
    :param context: behave Context.
    :param orientation: desired orientation.
    """
    try:
        change_device_orientation(context, orientation)
    # some devices like Nexus 6p raises an exception but the rotation works
    except InvalidElementStateException:
        sleep(2)


@step(u'user has "{status}" "{permission}" permissions')
def grant_deny_app_permission(context, status, permission):
    """
    Step. Grant or deny app permission
    For android devices permissions are configured via adb. As a permission could be made of more than one individual
    permission, a list of permissions having the same name in the key will be retrieved, for instance: location
    is made of LOCATION and LOCATION_FINE.
    For iOS devices permissions are configured via native settings app

    :param context: behave Context.
    :param status: granted or denied
    :param permission: permission to deny
    """

    config = {"granted": {"action": "grant",
                          "switch": '1',
                          "rw": "Lectura y escritura"},
              "denied": {"action": "revoke",
                         "switch": '0',
                         "rw": "Nunca"},
              }

    if not config.get(status):
        raise ValueError("Status: {} not valid, should be: granted/denied".format(status))

    if context.driver_wrapper.is_android_test():
        perms = [key for key in list(PERMISSIONS.__dict__.keys()) if permission.upper() in key]
        for key in perms:
            perm = getattr(PERMISSIONS, key)
            context.driver.execute_script('mobile:changePermissions', {'action': config[status]["action"],
                                                                       'appPackage': '{}'.format(context.device.app_id),
                                                                       'permissions': 'android.permission.{}'.format(
                                                                           perm)})
    else:
        context.driver.terminate_app(BUNDLES.NATIVE_SETTINGS)
        context.driver.activate_app(BUNDLES.NATIVE_SETTINGS)
        context.current_page = BaseDeviceSettings().wait_until_loaded()
        app_name = getattr(APPNAME, map_param('[CONF:brand]').upper())
        app_element = Link(By.XPATH, "//*[@value='{}']".format(app_name))
        display_element_on_screen(app_element)
        app_element.click()
        context.current_page = BaseAppDetails().wait_until_loaded()
        try:
            if permission == 'photo':
                element = get_element_from_page(context, 'photos_config')
                if element.get_attribute("value") != config[status]["rw"]:
                    element.click()
                    permission_config = Button(AppiumBy.IOS_PREDICATE, "type == 'XCUIElementTypeCell' "
                                                                       "and label == '{}'".format(config[status]["rw"]))
                    permission_config.click()

            elif permission == 'location':
                # TODO(hesteban): pending refactor this method and add the denied action.
                # https://jira.tid.es/browse/NOV-237379
                if status == 'granted':
                    element = get_element_from_page(context, 'location_button')
                    element.click()
                    context.current_page = BaseLocation().wait_until_loaded()
                    element = get_element_from_page(context, 'allow_always')
                    element.click()
            else:
                element_name = permission + "_switch"
                element = get_element_from_page(context, element_name)
                if element.get_attribute("value") != config[status]["switch"]:
                    element.click()

        except NoSuchElementException:
            logger.debug("Permission %s is not required yet", permission)

        context.driver_wrapper.driver.activate_app(context.device.app_id)


@step(u'accepts location permissions on ios device')
def accept_location_permission(context):
    """
    Step. Accept location permissions on iOS devices
    """
    if context.driver_wrapper.is_ios_test():
        BasePermissionsPopup().accept_permission('ubicación', context, True)
        BasePermissionsPopup().accept_permission('location', context)


@step(u'user just installed the application')
def just_installed_app(context):
    """
    Step. Uninstall the app, install the app again and launch the app

    :param context: behave Context.
    """
    if context.driver.is_app_installed(context.device.app_id):
        context.driver.remove_app(context.device.app_id)
    context.driver.install_app(context.appcenter_app_path)
    launch_app(context)


@step(u'restarts the navigation')
def restart_navigation(context):
    """
    Step. Restart the navigation

    :param context: behave Context.
    """
    context.reset_autonavigation = True

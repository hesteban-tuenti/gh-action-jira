"""
App Center Steps Module
"""
import logging
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step
from toolium_telefonica.appcenter.appcenter_downloader import AppCenterDownloader
from toolium.utils.dataset import map_param

from acceptance.app.common.app_center.app_center import AppCenterVersion

logger = logging.getLogger(__name__)


@step(u'user has downloaded the previous build of the app from AppCenter')
def download_previuos_app_build_from_appcenter(context):
    """
    step. Download the previous version of the app configured in config from Appcenter, and save the installation
    package path in context
    :param context: behave context
    """
    app_title = map_param("[TOOLIUM:Appcenter_app_title]")
    app_build = map_param("[TOOLIUM:Appcenter_app_build]")
    context.appcenter_previous_app_build = AppCenterVersion(app_title, app_build).get_previous_app_build()
    logger.debug('The previous build number of the "%s" app is: "%s"', app_title, context.appcenter_previous_app_build)
    context.appcenter_previous_app_path = AppCenterDownloader(
        app_title=app_title,
        app_build=context.appcenter_previous_app_build,
        url=map_param("[TOOLIUM:Appcenter_url]"),
        path=map_param("[TOOLIUM:Appcenter_app_path]"),
    ).download_app()

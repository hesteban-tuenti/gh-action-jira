"""
User config environment module
"""
from toolium.behave.environment import start_driver
from toolium_telefonica.behave.environment import CONFIG_PROPERTIES_DIR

from acceptance.common.environment import (
    before_all as global_before_all,
    before_feature as global_before_feature,
    before_scenario as global_before_scenario,
    before_step as global_before_step,
    after_step as global_after_step,
    after_scenario as global_after_scenario,
    after_feature as global_after_feature,
    after_all as global_after_all)
from acceptance.web.common.autonavigation_web_config.autonavigation_web_config import AutonavigationWebConfiguration
from acceptance.web.common.web_page_object_provider.web_page_object_catalog import WebPageObjectsProvider


def before_all(context):
    """Initialization method that will be executed before the test execution
    :param context: behave context
    """
    global_before_all(context)
    context.storage = dict()
    context.paths = AutonavigationWebConfiguration(CONFIG_PROPERTIES_DIR, context.user.brand).get_paths()
    WebPageObjectsProvider().initialize_pageobjects_catalog(context)


def before_feature(context, feature):
    """Feature initialization
    :param context: behave context
    :param feature: running feature
    """
    start_driver(context, False)
    global_before_feature(context, feature)
    if context.driver_wrapper.driver:
        context.cookies = context.driver_wrapper.driver.get_cookies()


def before_scenario(context, scenario):
    """Scenario initialization
    :param context: behave context
    :param scenario: running scenario
    """
    global_before_scenario(context, scenario)


def before_step(context, step):
    """Step initialization
    :param context: behave context
    :param step: running step
    """
    global_before_step(context, step)


def after_step(context, step):
    """Clean method that will be executed after each step
    :param context: behave context
    :param step: running step
    """
    global_after_step(context, step)


def after_scenario(context, scenario):
    """Clean method that will be executed after each scenario
    :param context: behave context
    :param scenario: running scenario
    """
    global_after_scenario(context, scenario)


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
    global_after_all(context)

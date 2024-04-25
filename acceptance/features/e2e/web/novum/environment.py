"""
Novum environment module
"""
from behave.fixture import use_fixture_by_tag

from acceptance.features.e2e.web.environment import (
    before_all as web_before_all,
    before_feature as web_before_feature,
    before_scenario as web_before_scenario,
    before_step as web_before_step,
    after_step as web_after_step,
    after_scenario as web_after_scenario,
    after_feature as web_after_feature,
    after_all as web_after_all)

PAGE_OBJECTS_PATH = 'web/novum/pageobjects'
PAGE_ELEMENTS_PATH = 'web/novum/pageelements'


def before_all(context):
    """Initialization method that will be executed before the test execution
    :param context: behave context
    """
    page_object_paths = {
        'PageObjectsAutoloader_definition_files_path': PAGE_OBJECTS_PATH,
        'PageObjectsAutoloader_custom_pageelements_path': PAGE_ELEMENTS_PATH,
    }
    context.config.update_userdata(page_object_paths)
    web_before_all(context)


def before_feature(context, feature):
    """Feature initialization
    :param context: behave context
    :param feature: running feature
    """
    web_before_feature(context, feature)


def before_scenario(context, scenario):
    """Scenario initialization
    :param context: behave context
    :param scenario: running scenario
    """
    web_before_scenario(context, scenario)


def before_step(context, step):
    """Step initialization
    :param context: behave context
    :param step: running step
    """
    web_before_step(context, step)


def before_tag(context, tag):
    """Tag initialization
    :param context: behave context
    :param tag: running tag
    """
    if tag.startswith('fixture'):
        return use_fixture_by_tag(tag, context, context.fixture_registry)
    return None


def after_step(context, step):
    """Clean method that will be executed after each step
    :param context: behave context
    :param step: running step
    """
    web_after_step(context, step)


def after_scenario(context, scenario):
    """Clean method that will be executed after each scenario
    :param context: behave context
    :param scenario: running scenario
    """
    web_after_scenario(context, scenario)


def after_feature(context, feature):
    """Clean method that will be executed after each feature
    :param context: behave context
    :param feature: running feature
    """
    web_after_feature(context, feature)


def after_all(context):
    """Clean method that will be executed after all features are finished
    :param context: behave context
    """
    web_after_all(context)

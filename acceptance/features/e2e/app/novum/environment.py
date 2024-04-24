"""
Novum environment module
"""
from behave.fixture import use_fixture_by_tag
from behave.model_core import Status

from acceptance.common.constants.constants import APPS
from acceptance.features.e2e.app.environment import (
    before_all as app_before_all,
    before_feature as app_before_feature,
    before_scenario as app_before_scenario,
    before_step as app_before_step,
    after_step as app_after_step,
    after_scenario as app_after_scenario,
    after_feature as app_after_feature,
    after_all as app_after_all)
from acceptance.features.e2e.app.novum.steps import autonavigation_fallback, LOGIN_STEPS


def before_all(context):
    """Initialization method that will be executed before the test execution
    :param context: behave context
    """
    app_before_all(context, APPS.NOVUM, autonavigation_fallback)


def before_feature(context, feature):
    """Feature initialization
    :param context: behave context
    :param feature: running feature
    """
    app_before_feature(context, feature)


def before_tag(context, tag):
    """Tag initialization
    :param context: behave context
    :param tag: running tag
    """
    if tag.startswith('fixture'):
        return use_fixture_by_tag(tag, context, context.fixture_registry)
    return None


def before_scenario(context, scenario):
    """Scenario initialization
    :param context: behave context
    :param scenario: running scenario
    """
    app_before_scenario(context, scenario)


def before_step(context, step):
    """Step initialization
    :param context: behave context
    :param step: running step
    """
    app_before_step(context, step)
    if step.status == Status.failed and step.name in LOGIN_STEPS:
        raise RuntimeError('Error Login step')


def after_step(context, step):
    """Clean method that will be executed after each step
    :param context: behave context
    :param step: running step
    """
    app_after_step(context, step)


def after_scenario(context, scenario):
    """Clean method that will be executed after each scenario
    :param context: behave context
    :param scenario: running scenario
    """
    app_after_scenario(context, scenario, autonavigation_fallback)


def after_feature(context, feature):
    """Clean method that will be executed after each feature
    :param context: behave context
    :param feature: running feature
    """
    app_after_feature(context, feature)


def after_all(context):
    """Clean method that will be executed after all features are finished
    :param context: behave context
    """
    app_after_all(context)

"""
Launchapp actions steps
"""
import logging

from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step

from acceptance.common.constants.constants import DOMAINS

logger = logging.getLogger(__name__)


@step('Soft Update is enabled')
def soft_update_enabled(context):
    """
    step. Enable soft update

    :param context: behave context
    """
    assert context.user.domain == DOMAINS.DEV, "Domain must be DEV for soft update"
    assert context.config.userdata.get('virtual_env') == "qa",\
        "Soft update should be enabled by config in dev environment with virtual env: 'qa'"

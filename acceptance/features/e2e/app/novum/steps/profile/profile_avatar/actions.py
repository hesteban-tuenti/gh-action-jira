"""
Profile avatar actions
"""
from behave import step as behave_step  # noqa: F401
from toolium_telefonica.behave import step


@step('selects a picture from the gallery')
def selects_picture_from_gallery(context):
    """
    Selects a picture from the profile avatar gallery
    :param context: behave context
    """

    context.current_page.select_picture_from_gallery()


@step('the avatar picture is cached')
def avatar_picture_cached(context):
    """
    Opens the profile avatar picture, to ensure it is cached.
    :param context: behave context
    """

    context.execute_steps(u"""Given user is in the "Profile" page
                                    And clicks on the "photo" icon
                                    And the "Avatar Options Sheet" sheet is displayed
                                    And clicks on the "see_picture" icon
                                    And waits until the "see_picture" element is not visible
                                    And the "Profile Avatar" page is displayed
                                    And user is in the "Profile" page
                              """)

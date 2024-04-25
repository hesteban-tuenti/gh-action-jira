# -*- coding: utf-8 -*-
@jira.QANOV-6741
Feature: Rate us


  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-194572 @mobile @sanity @har
  Scenario Outline: A user who taps in the "rate us" entrypoint will access to the App Store to rate the app on iOS devices
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
     When clicks on the "<entrypoint>" button
     Then the "Apple_Store" app is displayed

    @jira.link.detects.O2DE-3296 @manual
    Examples:
          | product | cv   | page    | entrypoint         | depends_on                             | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | QANOV-217320:QANOV-217321:QANOV-240222 | QANOV-376047 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | QANOV-259695:QANOV-259696:QANOV-240223 | QANOV-376048 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-194571 @mobile @sanity @har
  Scenario Outline: A user who taps in the "rate us" entrypoint will see the app rating dialog on android devices
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
     When clicks on the "<entrypoint>" entrypoint
     Then the "Popup Rate Stars" popup is displayed
      And the "<logo>" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield with "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    @manual
    Examples:
          | product | cv   | page    | entrypoint         | logo        | depends_on                                                                    | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | blaude_logo | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 | QANOV-376051 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | o2de_logo   | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-376053 |

  @jira.QANOV-410719 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A user can trigger the native app rating from profile
    This will open the native app rating, which is an OS feature
    Given user is in the "Profile" page
     When clicks on the "rate_app" button
     Then the "Native App Rating" app is displayed

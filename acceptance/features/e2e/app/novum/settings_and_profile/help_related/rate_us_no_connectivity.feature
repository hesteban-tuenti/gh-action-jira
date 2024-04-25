# -*- coding: utf-8 -*-
@jira.QANOV-126432
Feature: Rate us without connectivity


  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.IOS-9070
  @jira.link.relates_to.NOV-199868 @mobile @regression
  Scenario Outline: A user without data connection who taps the "rate us" setting will be redirected to the App Store and see an error
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
      And user turns on the Airplane mode
     When clicks on the "<entrypoint>" button
     Then the "Apple_Store" app is displayed
      And the "<string>" string is displayed

    @manual
    Examples:
          | product | cv   | page    | entrypoint         | string               | depends_on                                                                    | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | Imposible conectarse | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 | QANOV-376071 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | Imposible conectarse | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-376073 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.ANDROID-13442
  @jira.link.relates_to.NOV-199867 @manual @mobile @regression
  Scenario Outline: A user without data connection who taps the "rate us" entrypoint will see an error popup
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
      And user turns on the Airplane mode
     When clicks on the "<entrypoint>" entrypoint
     Then the "No Connection" popup is displayed
      And the "title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And the "cancel" button with "[LANG:noconnectivity.cancel_button]" text is displayed

    Examples:
          | product | cv   | page    | entrypoint         | depends_on                                                                    | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 | QANOV-376075 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-376077 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-199869
  @manual @mobile @regression
  Scenario Outline: A user who sees the error popup will be redirected to the Profile screen after tapping the cancel button
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
      And user turns on the Airplane mode
     When clicks on the "<entrypoint>" entrypoint
      And the "No Connection" popup is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "<page>" page is displayed

    Examples:
          | product | cv   | page    | entrypoint         | depends_on   | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | QANOV-376075 | QANOV-376078 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | QANOV-376077 | QANOV-376079 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-199870
  @manual @mobile @regression
  Scenario Outline: A user who sees the error popup and has recovered the data connection will see the rating popup after tapping the retry button
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "<page>" page
      And user turns on the Airplane mode
     When clicks on the "<entrypoint>" entrypoint
      And the "No Connection" popup is displayed
      And turns off the Airplane mode
      And clicks on the "retry" button
     Then the "Popup Rate Stars" popup is displayed
      And the "<logo>" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield with "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    Examples:
          | product | cv   | page    | entrypoint         | logo        | depends_on   | jira_id      |
          | blaude  | 14.5 | Profile | rate_us_entrypoint | blaude_logo | QANOV-376075 | QANOV-376081 |
          | o2de    | 14.5 | Profile | rate_us_entrypoint | o2de_logo   | QANOV-376077 | QANOV-376083 |

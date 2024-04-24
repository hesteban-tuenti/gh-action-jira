# -*- coding: utf-8 -*-
@jira.QANOV-453800
Feature: Block App Screenshots
  
  @jira.<jira_id> @android @jira.cv.14.9 @no_automatable @mobile @<product> @smoke
  Scenario Outline: As a logged in <product> android user, I cannot take screenshot/video recording of the app
    Depending of Android version, a black screenshot/video or a info toast will be shown.
    Given the device version is "lower" than "14.0"
      And user is logged in
      And user has "allow screenshots" feature "disabled" in the application
      And user is in the "[CONF:landing_tab]" page
     When tries to <action> a <type>
     Then the <type> is blocked

     Examples:
       | jira_id      | product | action  | type       |
       | QANOV-453801 | blaude  | take    | screenshot |
       | QANOV-453802 | blaude  | record  | video      |
       | QANOV-453803 | o2de    | take    | screenshot |
       | QANOV-453804 | o2de    | record  | video      |

  @jira.<jira_id> @android @jira.cv.14.9 @no_automatable @mobile @<product> @regression
  Scenario Outline: As a logged in <product> android user, I can take screenshot/video recording of the app
    Given the device version is "lower" than "14.0"
      And user is logged in
      And user has "allow screenshots" feature "enabled" in the application
      And user is in the "[CONF:landing_tab]" page
     When tries to <action> a <type>
     Then the <type> is not blocked
      And the "Splash Screen" page is displayed

     Examples:
       | jira_id      | product | action  | type       |
       | QANOV-453805 | blaude  | take    | screenshot |
       | QANOV-453806 | blaude  | record  | video      |
       | QANOV-453807 | o2de    | take    | screenshot |
       | QANOV-453808 | o2de    | record  | video      |

  @jira.<jira_id> @android @jira.cv.14.9 @automatable @manual @mobile @<product> @regression
  Scenario Outline: As a <product> user, I want my security options to be reset when I log in the app with an android device
    Given user is logged in
      And user has "allow screenshots" feature "enabled" in the application
     When logs out from the application
      And logs in the application
      And navigates to "Screenshots Configuration" page
     Then the "screenshot_switch" switch is disabled

    Examples:
      | jira_id      | product |
      | QANOV-453809 | blaude  |
      | QANOV-453810 | o2de    |

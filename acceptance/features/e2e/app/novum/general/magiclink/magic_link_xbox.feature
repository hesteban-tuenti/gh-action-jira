# -*- coding: utf-8 -*-
@jira.QANOV-116200 @not_hardening
Feature: Magic link Xbox

  Actions Before each Scenario:
    Given user has a "telco postpay" account type
      And user has a "any_admin" role


  @jira.<jira_id> @TBD @no_automatable @android @ios @jira.cv.12.5
  @jira.link.parent_test_plan.QANOV-114881 @moves @<test_priority> @mobile
  Scenario Outline: A user receives a push notification when selects the Game Pass Ultimate (GPU) card in Xbox living app
    Given user has a "<plan>" plan
      And user is logged in
      And user has the app in "<status>" status
     When clicks on the "gpu_selection" card in Xbox living app
     Then the "gpu_selection" notification is received
      And the "notification_title" textfield with "TBD" text is displayed
      And the "notification_body" textfield with "TBD" text is displayed

    Examples:
          | plan     | status     | jira_id      | test_priority |
          | fusion   | background | QANOV-116201 | smoke         |
          | fusion   | killed     | QANOV-116202 | regression    |
          | monoline | background | QANOV-116203 | regression    |
          | monoline | killed     | QANOV-116205 | smoke         |

  @jira.<jira_id> @TBD @no_automatable @android @ios @jira.cv.12.5
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-114881 @moves @<test_priority> @mobile
  Scenario Outline: A user can open the Game Pass Ultimate (GPU) notification
    Given user has a "<plan>" plan
      And user is logged in
      And user has the app in "<status>" status
      And has received a "gpu_selection" notification
     When clicks on the notification
     Then the browser webview is displayed
      And the "XBOX GAME PASS" header is displayed
      And the "navigation_top_bar.url" inputtext that contains the "TBD" text is displayed

    Examples:
          | plan     | status     | depends_on   | jira_id      | test_priority |
          | fusion   | background | QANOV-116201 | QANOV-116206 | regression    |
          | fusion   | killed     | QANOV-116202 | QANOV-116207 | smoke         |
          | monoline | background | QANOV-116203 | QANOV-116208 | smoke         |
          | monoline | killed     | QANOV-116205 | QANOV-116209 | regression    |

  @jira.<jira_id> @TBD @no_automatable @android @ios @jira.cv.12.5
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-114881 @moves @regression @mobile
  Scenario Outline: A user with the app in <status> status receives a Game Pass Ultimate (GPU) notification and doesn't click on it: user will see the Inbox updated
    Given user has a "<plan>" plan
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "gpu_selection" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_list[0]" textfield with "gpu_selection" notification is displayed
      And the "profile_inbox_list[0].title" textfield with "TBD" text is displayed
      And the "profile_inbox_list[0].subtitle" textfield with "TBD" text is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_list[0]" item

    Examples:
          | plan     | status     | depends_on   | jira_id      |
          | fusion   | background | QANOV-116201 | QANOV-116211 |
          | fusion   | killed     | QANOV-116202 | QANOV-116212 |
          | monoline | background | QANOV-116203 | QANOV-116213 |
          | monoline | killed     | QANOV-116205 | QANOV-116214 |

  @jira.<jira_id> @TBD @no_automatable @android @ios @jira.cv.12.5
  @jira.link.parent_test_plan.QANOV-114881 @moves @regression @mobile
  Scenario Outline: A user who is in Notification Inbox screen receives a Game Pass Ultimate (GPU) notification: user will see the Inbox updated
    Given user has a "<plan>" plan
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "gpu_selection" notification
     Then the "profile_inbox_list[0]" textfield with "gpu_selection" notification is displayed
      And the "profile_inbox_list[0].title" textfield with "TBD" text is displayed
      And the "profile_inbox_list[0].subtitle" textfield with "TBD" text is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_list[0]" item

    Examples:
          | plan     | jira_id      |
          | fusion   | QANOV-116215 |
          | monoline | QANOV-116216 |

  @jira.<jira_id> @TBD @no_automatable @android @ios @jira.cv.12.5
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-114881 @moves @regression @mobile
  Scenario Outline: A user can access to the Xbox Game Pass page
    Given user has a "<plan>" plan
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "gpu_selection" notification
     When clicks on "gpu_selection" element in the "profile_inbox_list" list
     Then the browser webview is displayed
      And the "XBOX GAME PASS" header is displayed
      And the "navigation_top_bar.url" inputtext that contains the "TBD" text is displayed

    Examples:
          | plan     | depends_on   | jira_id      |
          | fusion   | QANOV-116215 | QANOV-116217 |
          | monoline | QANOV-116216 | QANOV-116218 |

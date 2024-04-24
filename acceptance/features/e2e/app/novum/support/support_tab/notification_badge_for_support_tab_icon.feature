# -*- coding: utf-8 -*-
@jira.QANOV-3357
Feature: Notification badge for Support tab icon


  @jira.<jira_id> @<client> @automation.hard @jira.cv.11.8 @jira.link.detects.ANDROID-9971
  @jira.link.relates_to.NOV-186758 @manual @mobile @o2uk @regression
  Scenario Outline: A user without the ticketing module and with new messages from agent will see a numeric badge within the Support tab icon
    Given user has a "postpay" account type
      And user is in the "Support" page
      And user has "<number>" unseen notifications from support chat agent
     Then a "numeric" red badge is displayed in the "navigation_tab_bar.support_tab" icon
      And the badge in the "navigation_tab_bar.support_tab" has "<badge_number>" unseen notifications

    Examples:
          | client  | number | badge_number | jira_id    |
          | android | 1      | 1            | QANOV-3368 |
          | android | 9      | 9            | QANOV-3369 |
          | ios     | 1      | 1            | QANOV-3370 |
          | ios     | 9      | 9            | QANOV-3371 |
          | android | 10     | 9+           | QANOV-3373 |
          | ios     | 10     | +9           | QANOV-3375 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186759 @manual @mobile @o2uk
  @regression
  Scenario Outline: A user without the ticketing module and with new messages from agent won't see the numeric badge in the Support tab icon after checking the new messages from agent
    Given user has a "postpay" account type
      And user is in the "Support" page
      And user has "<number>" unseen notifications from support chat agent
     When clicks on the "support_chat_module" module
      And the "Support Chat" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Support" page is displayed
     Then a "numeric" red badge is not displayed in the "navigation_tab_bar.support_tab" icon

    Examples:
          | number | jira_id    |
          | <9     | QANOV-3379 |
          | >9     | QANOV-3380 |

  @jira.<jira_id> @<client> @automation.hard @jira.cv.11.8 @jira.link.relates_to.NOV-136628 @manual @mobile @o2uk
  @regression
  Scenario Outline: User with the app closed can see a badge notification in the Application's Icon when there are unread messages from the support agent
    internal_checkpoint="For Android it is not shown the number of conversations with
    unread messages, only if there are or there aren't. Also, some OS won't have this feature (for example Android
    7.0). Notification badge in the app icon launcher in android is only supported from android 8.0 onwards"
    Given user has the app in "<app_status>" status
      And user has "any" unseen notifications from support chat agent
     Then a "<badge_type>" red badge is displayed in the "o2uk" icon

    Examples:
          | client  | app_status | badge_type  | jira_id    |
          | android | background | non-numeric | QANOV-3401 |
          | ios     | killed     | numeric     | QANOV-3402 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.8 @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-187345 @mobile @no_automatable @o2uk @regression
  Scenario Outline: A user who dismissed a push notification after a new message is received from support agent will see the numeric badges within the Support tab
    Given user has a "postpay" account type
      And user is in an active support chat
      And user does not have unseen notifications from support chat agent
      And user has the app in "<app_status>" status
     When receives a "new_support_chat_message" notification
      And swipes "right" on the "new_support_chat_message" notification
      And launches the app
      And user is in the "Support" page
     Then a "numeric" red badge is displayed in the "navigation_tab_bar.support_tab" icon
      And the badge in the "navigation_tab_bar.support_tab" has "1" unseen notifications
      And a "numeric" red badge is displayed in the "support_chat_module" icon
      And the badge in the "support_chat_module" has "1" unseen notifications

    Examples:
          | app_status | detects  | jira_id    |
          | background |          | QANOV-3464 |
          | killed     | IOS-6864 | QANOV-3466 |

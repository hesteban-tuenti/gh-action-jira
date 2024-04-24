# -*- coding: utf-8 -*-
@jira.QANOV-3291
Feature: Notification badge for Support tab modules


  @jira.<jira_id> @<client> @automation.hard @jira.cv.11.3 @jira.link.relates_to.NOV-136620 @manual @mobile @o2uk
  @regression
  Scenario Outline: A postpay user who received messages from the agent will see a numeric badge in the chat module informing the number of unread messages
    Given user has a "postpay" account type
      And user is in the "Support" page
      And user has "<number>" unseen notifications from support chat agent
     Then a "numeric" red badge is displayed in the "support_chat_module" module
      And the badge in the "support_chat_module" has "<badge_number>" unseen notifications

    Examples:
          | client  | number | badge_number | jira_id    |
          | android | 1      | 1            | QANOV-3298 |
          | ios     | 1      | 1            | QANOV-3300 |
          | android | 9      | 9            | QANOV-3302 |
          | ios     | 9      | 9            | QANOV-3303 |
          | android | 10     | 9+           | QANOV-3305 |
          | ios     | 10     | +9           | QANOV-3306 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.8 @jira.link.detects.APPS-7696
  @jira.link.relates_to.NOV-187349 @manual @mobile @o2uk @regression
  Scenario Outline: A postpay user who had unread messages from the support agent and goes back to the Support tab after checking them won't see the numeric badge in the chat module
    Given user has a "postpay" account type
      And user is in the "Support" page
      And user has "<number>" unseen notifications from support chat agent
     When clicks on the "support_chat_module" module
      And the "Support Chat" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Support" page is displayed
     Then a "numeric" red badge is not displayed in the "support_chat_module" module

    Examples:
          | number | jira_id    |
          | <9     | QANOV-3326 |
          | >9     | QANOV-3327 |

  @jira.QANOV-3345 @android @automation.hard @ios @jira.cv.11.8 @jira.link.relates_to.NOV-187350 @manual @mobile @o2uk
  @regression
  Scenario: A postpay user who lost connectivity while checking the unread messages from the support agent and goes back to the Support tab after checking them won't see the numeric badge change in the chat module
    Given user has a "postpay" account type
      And user is in the "Support" page
      And user has "3" unseen notifications from support chat agent
      And user turns on the Airplane mode
     When clicks on the "support_chat_module" module
      And the "Support Chat" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Support" page is displayed
     Then a "numeric" red badge is displayed in the "support_chat_module" module
      And the badge in the "support_chat_module" has "3" unseen notifications

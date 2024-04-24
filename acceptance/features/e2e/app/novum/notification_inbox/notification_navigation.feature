# -*- coding: utf-8 -*-
@jira.QANOV-3596
Feature: Notification Navigation


  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174636 @manual @mobile @regression
  Scenario Outline: A user who receives a notification that redirects to a root screen when the app is closed is redirected to the root screen after tapping on it
    Within the url, the domain will be set according to the enviorment used, for instance in LIVE:
    - vivo: web.vivo.com.br
    - o2uk: inks.o2.co.uk
    - moves: appweb.movistar.es
    Given user has the app in "<status>" status
     When receives "1" notifications with "Native.Account" deeplink
      And clicks on the notification
     Then the "Account" page is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    Examples:
          | product | parent_test_plan | cv     | status     | jira_id      |
          | moves   |                  | 11.6   | killed     | QANOV-3599   |
          | moves   |                  | 11.6   | background | QANOV-3600   |
          | o2uk    |                  | 11.6   | killed     | QANOV-3601   |
          | o2uk    |                  | 11.6   | background | QANOV-3602   |
          | blaude  |                  | Future | killed     | QANOV-244365 |
          | blaude  |                  | Future | background | QANOV-244366 |
          | o2de    |                  | Future | killed     | QANOV-244367 |
          | o2de    |                  | Future | background | QANOV-244368 |
          | o2es    |                  | Future | killed     | QANOV-416916 |
          | o2es    |                  | Future | background | QANOV-416917 |

    @old_app
    Examples:
          | product | parent_test_plan | cv   | status     | jira_id    |
          | vivobr  | QANOV-520839     | 11.6 | killed     | QANOV-3597 |
          | vivobr  | QANOV-520839     | 11.6 | background | QANOV-3598 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @har
  Scenario Outline: A user who receives a notification that redirects to a root screen when the app is closed is redirected to the root screen after tapping on it
    Within the url, the domain will be set according to the enviorment used, for instance in LIVE:
    - vivo: web.vivo.com.br
    - o2uk: inks.o2.co.uk
    - moves: appweb.movistar.es
    Given user has the app in "<status>" status
     When receives "1" notifications with "Native.Account" deeplink
      And clicks on the notification
     Then the "Assinatura" page is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    Examples:
          | product | parent_test_plan | cv   | status     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6 | killed     | QANOV-599475 |
          | vivobr  | QANOV-520839     | 11.6 | background | QANOV-599476 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174637 @manual @mobile @regression
  Scenario Outline: A user who receives a notification that redirects to a non-root screen when the app is closed is redirected to the non-root screen after tapping on it
    A non-root page is a screen that is not showing the tab bar, for instance
    Support chat converstation or a step in a bundle purchase
    Given user has the app in "<status>" status
     When receives "1" notifications with "<deeplink>" deeplink
      And clicks on the notification
     Then the "<destination_page>" page is displayed
      And the "navigation_top_bar.back_button" button is displayed

    Examples:
          | product | parent_test_plan | cv     | deeplink                    | destination_page          | status     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | Native.Support Conversation | Support Chat Conversation | killed     | QANOV-3603   |
          | vivobr  | QANOV-520839     | 11.6   | Native.Support Conversation | Support Chat Conversation | background | QANOV-3604   |
          | moves   |                  | 11.6   | Native.Settings             | Profile                   | killed     | QANOV-3605   |
          | moves   |                  | 11.6   | Native.Settings             | Profile                   | background | QANOV-3606   |
          | o2uk    |                  | 11.6   | Native.Support Conversation | Support Chat Conversation | killed     | QANOV-3607   |
          | o2uk    |                  | 11.6   | Native.Support Conversation | Support Chat Conversation | background | QANOV-3608   |
          | blaude  |                  | Future | Native.Settings             | Profile                   | killed     | QANOV-244369 |
          | blaude  |                  | Future | Native.Settings             | Profile                   | background | QANOV-244370 |
          | o2de    |                  | Future | Native.Settings             | Profile                   | killed     | QANOV-244371 |
          | o2de    |                  | Future | Native.Settings             | Profile                   | background | QANOV-244372 |
          | o2es    |                  | Future | Native.Settings             | Profile                   | killed     | QANOV-416918 |
          | o2es    |                  | Future | Native.Settings             | Profile                   | background | QANOV-416919 |

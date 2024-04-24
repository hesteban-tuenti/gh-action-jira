# -*- coding: utf-8 -*-
@jira.QANOV-126431
Feature: Notification Inbox without connectivity


  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174650 @manual @mobile @regression
  Scenario Outline: A user who lost connectivity will see the no-connectivity screen when accesing to the Notification content from the Notification Inbox
    internal_checkpoint=" The notification should include information not cached for instance a new video, gif"
    Given user is in the "Notification Inbox" page
     When receives a notification
      And turns on the Airplane mode
      And a "non_numeric" red badge is displayed in the "inbox_notification[0]" element
      And clicks on the "1" element in the "inbox_list" list
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | parent_test_plan | cv     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3514   |
          | moves   |                  | 11.6   | QANOV-3515   |
          | o2uk    |                  | 11.6   | QANOV-3516   |
          | blaude  |                  | Future | QANOV-244351 |
          | o2de    |                  | Future | QANOV-244352 |
          | o2es    |                  | Future | QANOV-416907 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174653 @manual @mobile @regression
  Scenario Outline: A user who lost connectivity will see a black screen when seeing the  Notification's thumbnail if it hasn't been cached
    internal_checkpoint=" As the thumbnail shows the picture in the inbox list it is cached when received,
    so in order to test it correctly, we should include a gif or video in the content, apart from the image"
    Given user is in the "Notification Inbox" page
     When receives "1" notifications with "Qsys test $timestamp" title
      And turns on the Airplane mode
      And clicks on the "notification_thumbnail" field of the element in the "1" position of the "inbox_list" list
     Then the "Notification Thumbnail" page is displayed
      And the page displays a black screen
      And the "close" button is displayed

    Examples:
          | product | parent_test_plan | cv     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3526   |
          | moves   |                  | 11.6   | QANOV-3527   |
          | o2uk    |                  | 11.6   | QANOV-3528   |
          | blaude  |                  | Future | QANOV-244353 |
          | o2de    |                  | Future | QANOV-244354 |
          | o2es    |                  | Future | QANOV-416909 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174646 @manual @mobile @regression
  Scenario Outline: A user who lost connectivity and receives a notification when the app is opened will see the bell icon counter updated when the user recovers the connection again
    Given user turns on the Airplane mode
      And user has no unseen notifications
      And user is in the "<main_tab>" page
     When receives a notification
      And turns off the Airplane mode
     Then a "numeric" red badge is displayed in the "navigation_top_bar.notifications_icon" icon
      And the notification is displayed in the notification center

    Examples:
          | product | main_tab           | parent_test_plan | cv     | jira_id      |
          | vivobr  | Start              | QANOV-520839     | 11.6   | QANOV-3529   |
          | moves   | [CONF:landing_tab] |                  | 11.6   | QANOV-3530   |
          | o2uk    | [CONF:landing_tab] |                  | 11.6   | QANOV-3531   |
          | blaude  | [CONF:landing_tab] |                  | Future | QANOV-244355 |
          | o2de    | [CONF:landing_tab] |                  | Future | QANOV-244356 |
          | o2es    | [CONF:landing_tab] |                  | Future | QANOV-416911 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174647 @manual @mobile @regression
  Scenario Outline: A user who lost connectivity and has unseen notification will see the bell icon counter removed after accesing the Notification Inbox
    Given user is in the "<main_tab>" page
     When receives a notification
      And a "numeric" red badge displayed in the "navigation_top_bar.notifications_icon" icon
      And turns on the Airplane mode
      And clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the notification badge is not displayed in the "navigation_top_bar.notifications_icon" icon

    Examples:
          | product | main_tab           | parent_test_plan | cv     | jira_id      |
          | vivobr  | Start              | QANOV-520839     | 11.6   | QANOV-3532   |
          | moves   | [CONF:landing_tab] |                  | 11.6   | QANOV-3533   |
          | o2uk    | [CONF:landing_tab] |                  | 11.6   | QANOV-3534   |
          | blaude  | [CONF:landing_tab] |                  | Future | QANOV-244357 |
          | o2de    | [CONF:landing_tab] |                  | Future | QANOV-244358 |
          | o2es    | [CONF:landing_tab] |                  | Future | QANOV-416912 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.detects.IOS-6910
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-187030 @mobile @regression
  Scenario Outline: A user with notifications who lost connectivity can access to the Notification Inbox
    The inbox list will only show the notifications that have been cached previously.
    New content received while there is no connectivity won't be shown.
    Given user has received notifications
      And user is in the "<main_tab>" page
      And user turns on the Airplane mode
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed

    @automatic @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | main_tab | jira_id      |
          | vivobr  | 11.6 | android | QANOV-520839     | Start    | QANOV-3578   |
          | vivobr  | 11.6 | ios     | QANOV-520839     | Start    | QANOV-151802 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | main_tab           | jira_id      |
          | moves   | 11.6 | android |                  | [CONF:landing_tab] | QANOV-3579   |
          | moves   | 11.6 | ios     |                  | [CONF:landing_tab] | QANOV-151800 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | main_tab           | jira_id      |
          | o2uk    | 11.6 | android |                  | [CONF:landing_tab] | QANOV-3580   |
          | o2uk    | 11.6 | ios     |                  | [CONF:landing_tab] | QANOV-151801 |

    @android @ios @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab           | jira_id      |
          | blaude  | Future |                  | [CONF:landing_tab] | QANOV-244359 |
          | o2de    | Future |                  | [CONF:landing_tab] | QANOV-244360 |
          | o2es    | Future |                  | [CONF:landing_tab] | QANOV-416913 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @regression
  Scenario Outline: A user without notifications who loses connectivity can access to the Notification inbox
    The inbox list will only show the notifications that have been cached previously.
    New content received while there is no connectivity won't be shown.
    Given user has not received notifications
      And user is in the "<main_tab>" page
      And user turns on the Airplane mode
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "empty_case_image" image is displayed
      And the "empty_case_title" textfield with "[LANG:notification_inbox.empty_case_title]" text is displayed
      And the "empty_case_text" textfield with "[LANG:notification_inbox.empty_case_text]" text is displayed

    @automatic @live @next @qa
    Examples:
          | product | cv    | client  | parent_test_plan | main_tab | jira_id     |
          | vivobr  | 11.15 | android | QANOV-520839     | Start    | QANOV-49116 |
          | vivobr  | 11.15 | ios     | QANOV-520839     | Start    | QANOV-76703 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv    | client  | parent_test_plan | main_tab           | jira_id     |
          | moves   | 11.15 | android |                  | [CONF:landing_tab] | QANOV-49117 |
          | moves   | 11.15 | ios     |                  | [CONF:landing_tab] | QANOV-76704 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv    | client  | parent_test_plan | main_tab           | jira_id     |
          | o2uk    | 11.15 | android |                  | [CONF:landing_tab] | QANOV-49118 |
          | o2uk    | 11.15 | ios     |                  | [CONF:landing_tab] | QANOV-76705 |

    @android @ios @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab           | jira_id      |
          | blaude  | Future |                  | [CONF:landing_tab] | QANOV-244361 |
          | o2de    | Future |                  | [CONF:landing_tab] | QANOV-244362 |
          | o2es    | Future |                  | [CONF:landing_tab] | QANOV-416914 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-187032 @manual @mobile @regression
  Scenario Outline: A user who sees the no-connectivity error screen will see the same screen after tapping the Retry button if the error is not solved
    Given user is in the "<main_tab>" page
     When receives a notification with "video" media
      And user turns on the Airplane mode
      And clicks on the "navigation_top_bar.bell_inbox" icon
      And the "No Connectivity" page is displayed
      And clicks on the "retry" button
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | parent_test_plan | cv     | main_tab           | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | Start              | QANOV-3593   |
          | moves   |                  | 11.6   | [CONF:landing_tab] | QANOV-3594   |
          | o2uk    |                  | 11.6   | [CONF:landing_tab] | QANOV-3595   |
          | blaude  |                  | Future | [CONF:landing_tab] | QANOV-244363 |
          | o2de    |                  | Future | [CONF:landing_tab] | QANOV-244364 |
          | o2es    |                  | Future | [CONF:landing_tab] | QANOV-416915 |

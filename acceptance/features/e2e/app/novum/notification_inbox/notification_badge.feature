# -*- coding: utf-8 -*-
@jira.QANOV-3299
Feature: Notification badge

  Actions After the Feature:
     Then delete notifications
      And reset the inbox


  @jira.<jira_id> @<client> @<execution_mode> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174633 @mobile @qa @regression @ber
  Scenario Outline: A user who receives a notification being in the landing tab screen and there aren't unseen notifications will see the bell icon counter updated
    internal_checkpoint="Due to a limit configured, when the user enters in the Inbox and the "event" mark_as_read_notifications is sent to the server,
    during the next 15 seconds , other events mark_as_read_notifications will be ignored, so in order to check counter working properly,
    after entering in the Inbox , we have to wait at least 15 seconds before sending another notifications"
    Given user is in the "<main_tab>" page
      And clicks on the "navigation_top_bar.notification_inbox_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "<main_tab>" page is displayed
     When receives a notification
     Then a "numeric" red badge is displayed in the "navigation_top_bar.notifications_inbox_icon_badge" icon
      And the badge in the "navigation_top_bar.notifications_inbox_icon_badge" has "1" unseen notifications

    Examples:
          | product | parent_test_plan | cv     | client  | main_tab           | button       | execution_mode | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | android | Start              | back_button  | automatic      | QANOV-3356   |
          | vivobr  |                  | 11.6   | ios     | Start              | close_button | automatic      | QANOV-240831 |
          | vivobr  | QANOV-520839     | 24.0   | ios     | Start              | back_button  | automatic      | QANOV-522448 |
          | moves   |                  | 11.6   | android | [CONF:landing_tab] | back_button  | automatic      | QANOV-3360   |
          | moves   |                  | 11.6   | ios     | [CONF:landing_tab] | close_button | automatic      | QANOV-240830 |
          | o2uk    |                  | 11.6   | android | [CONF:landing_tab] | back_button  | automatic      | QANOV-3362   |
          | o2uk    |                  | 11.6   | ios     | [CONF:landing_tab] | close_button | automatic      | QANOV-240829 |
          | blaude  |                  | Future | android | [CONF:landing_tab] | back_button  | manual         | QANOV-244297 |
          | blaude  |                  | Future | ios     | [CONF:landing_tab] | close_button | manual         | QANOV-244298 |
          | o2de    |                  | Future | android | [CONF:landing_tab] | back_button  | manual         | QANOV-244299 |
          | o2de    |                  | Future | ios     | [CONF:landing_tab] | close_button | manual         | QANOV-244300 |
          | o2es    |                  | Future | android | [CONF:landing_tab] | back_button  | manual         | QANOV-416835 |
          | o2es    |                  | Future | ios     | [CONF:landing_tab] | close_button | manual         | QANOV-416836 |

  @jira.<jira_id> @<client> @<execution_mode> @<product> @smoke @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174629 @mobile @qa @har
  Scenario Outline: A user who receives a notification being in the landing tab screen and there are unseen notifications will see the bell icon counter updated
    internal_checkpoint="Due to a limit configured, when the user enters in the Inbox and the "event" mark_as_read_notifications is sent to the server,
    during the next 15 seconds , other events mark_as_read_notifications will be ignored, so in order to check counter working properly,
    after entering in the Inbox , we have to wait at least 15 seconds before sending another notifications"
    Given user is in the "<main_tab>" page
      And user has unseen notifications
      And the badge in the "navigation_top_bar.<icon>" shows the number of unseen notifications
     When receives a notification
      And waits "3" seconds
     Then the badge in the "navigation_top_bar.<icon>" has "[CONTEXT:unseen_notifications]+1" unseen notifications

    Examples:
          | product | parent_test_plan | cv     | client  | main_tab           | icon                           | execution_mode | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | android | Start              | notifications_inbox_icon_badge | automatic      | QANOV-3364   |
          | vivobr  | QANOV-520839     | 11.6   | ios     | Start              | notification_inbox_icon        | automatic      | QANOV-3384   |
          | moves   |                  | 11.6   | android | [CONF:landing_tab] | notifications_inbox_icon_badge | automatic      | QANOV-3372   |
          | moves   |                  | 11.6   | ios     | [CONF:landing_tab] | notification_inbox_icon        | automatic      | QANOV-3390   |
          | o2uk    |                  | 11.6   | android | [CONF:landing_tab] | notifications_inbox_icon_badge | automatic      | QANOV-3377   |
          | o2uk    |                  | 11.6   | ios     | [CONF:landing_tab] | notification_inbox_icon        | automatic      | QANOV-3394   |
          | blaude  |                  | Future | android | [CONF:landing_tab] | notifications_inbox_icon_badge | manual         | QANOV-244301 |
          | blaude  |                  | Future | ios     | [CONF:landing_tab] | notification_inbox_icon        | manual         | QANOV-244305 |
          | o2de    |                  | Future | android | [CONF:landing_tab] | notifications_inbox_icon_badge | manual         | QANOV-244303 |
          | o2de    |                  | Future | ios     | [CONF:landing_tab] | notification_inbox_icon        | manual         | QANOV-244308 |
          | o2es    |                  | Future | android | [CONF:landing_tab] | notifications_inbox_icon_badge | manual         | QANOV-416837 |
          | o2es    |                  | Future | ios     | [CONF:landing_tab] | notification_inbox_icon        | manual         | QANOV-416838 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174629 @mobile @no_automatable @regression
  Scenario Outline: A user who has "9" unseen notifications will see the counter updated to "<number_after>" after receiving a new notification
    internal_checkpoint="Due to a limit configured, when the user enters in the Inbox and the "event" mark_as_read_notifications is sent to the server,
    during the next 15 seconds , other events mark_as_read_notifications will be ignored, so in order to check counter working properly,
    after entering in the Inbox , we have to wait at least 15 seconds before sending another notifications"
    Given user is in the "<main_tab>" page
      And a "numeric" red badge is displayed in the "navigation_top_bar.bell_inbox" icon
      And the badge in the "navigation_top_bar.bell_inbox" has "9" unseen notifications
     When receives a notification
     Then a "numeric" red badge is displayed in the "navigation_top_bar.bell_inbox" icon
      And the badge in the "navigation_top_bar.bell_inbox" has "<number_after>" unseen notifications

    Examples:
          | product | parent_test_plan | cv     | client  | main_tab | number_after | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | android | Start    | 9+           | QANOV-3367   |
          | moves   |                  | 11.6   | android | Account  | 9+           | QANOV-3374   |
          | o2uk    |                  | 11.6   | android | Account  | 9+           | QANOV-3381   |
          | blaude  |                  | 13.9   | android | Account  | 9+           | QANOV-244302 |
          | o2de    |                  | 14.2   | android | Account  | 9+           | QANOV-244304 |
          | vivobr  | QANOV-520839     | 11.6   | ios     | Start    | +9           | QANOV-3386   |
          | moves   |                  | 11.6   | ios     | Account  | +9           | QANOV-3392   |
          | o2uk    |                  | 11.6   | ios     | Account  | +9           | QANOV-3396   |
          | blaude  |                  | Future | ios     | Account  | +9           | QANOV-244306 |
          | o2de    |                  | Future | ios     | Account  | +9           | QANOV-244308 |
          | o2es    |                  | Future | android | Account  | 9+           | QANOV-416840 |
          | o2es    |                  | Future | ios     | Account  | +9           | QANOV-416841 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @har
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174634 @manual @mobile @smoke
  Scenario Outline: A user who is in Notification Inbox and receives a notification will see the list of notifications updated with the unseen notification
    internal_checkpoint="In order to have an univocal title to identify the notification received, a $timestamp or other unique string
    should be added to the title when sending the notification"
    commented_tags="@depends_on.NOV-174641"
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user is in the "Notification Inbox" page
     When receives "1" notifications with "Qsys test $timestamp" title
     Then the new notification is displayed on the "0" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0]" textfield with "Qsys test $timestamp" format is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | product | parent_test_plan | cv     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3399   |
          | moves   |                  | 11.6   | QANOV-3403   |
          | o2uk    |                  | 11.6   | QANOV-3405   |
          | blaude  |                  | Future | QANOV-244309 |
          | o2de    |                  | Future | QANOV-244310 |
          | o2es    |                  | Future | QANOV-416842 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-186774 @manual @mobile @regression
  Scenario Outline: A user who receives a notification when the app is opened in the Notification Inbox and the user has scrolled down in the list will see an information alert
    commented_tags="@depends_on.NOV-174641"
    Given user is in the "Notification Inbox" page
      And scrolls down
     When receives "<number_notifications>" notifications with "Qsys test" title
     Then the "notification_inbox_warning" warning with "<expected_text>" text is displayed

    Examples:
          | product | parent_test_plan | cv     | number_notifications | expected_text                                        | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | 1                    | [LANG:notification_inbox.profile_inbox_warning_one]  | QANOV-3409   |
          | vivobr  | QANOV-520839     | 11.6   | >1                   | [LANG:notification_inbox.profile_inbox_warning_many] | QANOV-3411   |
          | moves   |                  | 11.6   | 1                    | [LANG:notification_inbox.profile_inbox_warning_one]  | QANOV-3414   |
          | moves   |                  | 11.6   | >1                   | [LANG:notification_inbox.profile_inbox_warning_many] | QANOV-3417   |
          | o2uk    |                  | 11.6   | 1                    | [LANG:notification_inbox.profile_inbox_warning_one]  | QANOV-3420   |
          | o2uk    |                  | 11.6   | >1                   | [LANG:notification_inbox.profile_inbox_warning_many] | QANOV-3422   |
          | blaude  |                  | Future | 1                    | [LANG:notification_inbox.profile_inbox_warning_one]  | QANOV-244311 |
          | blaude  |                  | Future | >1                   | [LANG:notification_inbox.profile_inbox_warning_many] | QANOV-244312 |
          | o2de    |                  | Future | 1                    | [LANG:notification_inbox.profile_inbox_warning_one]  | QANOV-244313 |
          | o2de    |                  | Future | >1                   | [LANG:notification_inbox.profile_inbox_warning_many] | QANOV-244314 |
          | o2es    |                  | Future | 1                    | [LANG:notification_inbox.profile_inbox_warning_one]  | QANOV-416845 |
          | o2es    |                  | Future | >1                   | [LANG:notification_inbox.profile_inbox_warning_many] | QANOV-416846 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-186777 @manual @mobile @regression
  Scenario Outline: A user who sees the information alert can see the new notifications after tapping on the alert
    commented_tags="@depends_on.NOV-186774"
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user is in the "Notification Inbox" page
      And scrolls down
      And receives "1" notifications with "Qsys test" title
      And the "profile_inbox_warning" button is displayed
     When clicks on the "profile_inbox_warning" button
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0]" textfield with "Qsys test" text is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" icon
      And the "profile_inbox_warning" button is not displayed

    Examples:
          | product | parent_test_plan | cv     | depends_on   | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3409   | QANOV-3425   |
          | moves   |                  | 11.6   | QANOV-3414   | QANOV-3428   |
          | o2uk    |                  | 11.6   | QANOV-3420   | QANOV-3431   |
          | blaude  |                  | Future | QANOV-244311 | QANOV-244315 |
          | o2de    |                  | Future | QANOV-244313 | QANOV-244316 |
          | o2es    |                  | Future | QANOV-416845 | QANOV-416847 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-186778 @manual @mobile @regression
  Scenario Outline: A user who sees the information alert can see the new notifications after scrolling up to the top of the list without tapping the alert
    commented_tags="@depends_on.NOV-174641"
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user is in the "Notification Inbox" page
      And scrolls down
      And receives "1" notifications with "Qsys test" title
      And the "profile_inbox_warning" button is displayed
     When scrolls up
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0]" textfield with "Qsys test" text is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" icon
      And the "profile_inbox_warning" button is not displayed

    Examples:
          | product | parent_test_plan | cv     | depends_on   | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3409   | QANOV-3436   |
          | moves   |                  | 11.6   | QANOV-3414   | QANOV-3439   |
          | o2uk    |                  | 11.6   | QANOV-3420   | QANOV-3441   |
          | blaude  |                  | Future | QANOV-244311 | QANOV-244317 |
          | o2de    |                  | Future | QANOV-244313 | QANOV-244318 |
          | o2es    |                  | Future | QANOV-416845 | QANOV-416849 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174630 @mobile @no_automatable @regression
  Scenario Outline: A user who has the app opened in several devices in the Account screen and receives a notification will see the bell icon counter updated in all the devices
    Given user is in the "<main_tab>" page
      And user is logged in with the same account in two devices
      And the badge in the "navigation_top_bar.bell_inbox" has "<number_before>" unseen notifications
     When receives a notification
     Then a "numeric" red badge is displayed in the "navigation_top_bar.bell_inbox" icon in both devices
      And the badge in the "navigation_top_bar.bell_inbox" has "<number_after>" unseen notifications in both devices

    Examples:
          | product | parent_test_plan | cv     | client  | main_tab | number_before | number_after | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | android | Start    | 1             | 2            | QANOV-3444   |
          | vivobr  | QANOV-520839     | 11.6   | android | Start    | 9             | 9+           | QANOV-3447   |
          | moves   |                  | 11.6   | android | Account  | 1             | 2            | QANOV-3450   |
          | moves   |                  | 11.6   | android | Account  | 9             | 9+           | QANOV-3454   |
          | o2uk    |                  | 11.6   | android | Account  | 1             | 2            | QANOV-3456   |
          | o2uk    |                  | 11.6   | android | Account  | 9             | 9+           | QANOV-3458   |
          | blaude  |                  | Future | android | Account  | 1             | 2            | QANOV-244319 |
          | blaude  |                  | Future | android | Account  | 9             | 9+           | QANOV-244320 |
          | o2de    |                  | Future | android | Account  | 1             | 2            | QANOV-244321 |
          | o2de    |                  | Future | android | Account  | 9             | 9+           | QANOV-244322 |
          | o2es    |                  | Future | android | Account  | 1             | 2            | QANOV-416850 |
          | o2es    |                  | Future | android | Account  | 9             | 9+           | QANOV-416851 |
          | vivobr  | QANOV-520839     | 11.6   | ios     | Start    | 1             | 2            | QANOV-3461   |
          | vivobr  | QANOV-520839     | 11.6   | ios     | Start    | 9             | +9           | QANOV-3465   |
          | moves   |                  | 11.6   | ios     | Account  | 1             | 2            | QANOV-3468   |
          | moves   |                  | 11.6   | ios     | Account  | 9             | +9           | QANOV-3471   |
          | o2uk    |                  | 11.6   | ios     | Account  | 1             | 2            | QANOV-3473   |
          | o2uk    |                  | 11.6   | ios     | Account  | 9             | +9           | QANOV-3476   |
          | blaude  |                  | Future | ios     | Account  | 1             | 2            | QANOV-244323 |
          | blaude  |                  | Future | ios     | Account  | 9             | +9           | QANOV-244324 |
          | o2de    |                  | Future | ios     | Account  | 1             | 2            | QANOV-244325 |
          | o2de    |                  | Future | ios     | Account  | 9             | +9           | QANOV-244326 |
          | o2es    |                  | Future | ios     | Account  | 1             | 2            | QANOV-416853 |
          | o2es    |                  | Future | ios     | Account  | 9             | +9           | QANOV-416854 |

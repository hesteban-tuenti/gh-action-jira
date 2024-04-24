# -*- coding: utf-8 -*-
@jira.QANOV-3492
Feature: Consuming Notification


  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-174648 @mobile @sanity @har
  Scenario Outline: A user can see the Notification's content from the Notification Inbox
    commented_tags="@depends_on.NOV-174641"
    Given user has received notifications
      And user is in the "Notification Inbox" page
     When clicks on any element in the "inbox_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Notification Inbox" page is displayed

    @automatic @qa
    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-520839     | 11.6 | QANOV-3493   |
          | moves   |                  | 11.6 | QANOV-3494   |
          | o2uk    |                  | 11.6 | QANOV-3495   |

    @manual
    Examples:
          | product | parent_test_plan | cv     | jira_id      |
          | blaude  |                  | Future | QANOV-244235 |
          | o2de    |                  | Future | QANOV-244236 |
          | o2es    |                  | Future | QANOV-416802 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @har
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174649 @manual @mobile @smoke
  Scenario Outline: A user who goes back to the Notification Inbox after seeing the Notification's content will see the notification has been consumed
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user is in the "Notification Inbox" page
     When receives a notification
      And a "non_numeric" red badge is displayed in the "inbox_notification[0]" element
      And clicks on the "1" element in the "inbox_list" list
      And the "Notification Content" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And a "non_numeric" red badge is not displayed in the "inbox_notification[0]" item

    Examples:
          | product | parent_test_plan | cv     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3496   |
          | moves   |                  | 11.6   | QANOV-3497   |
          | o2uk    |                  | 11.6   | QANOV-3498   |
          | blaude  |                  | Future | QANOV-244237 |
          | o2de    |                  | Future | QANOV-244238 |
          | o2es    |                  | Future | QANOV-416803 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-174651 @manual @mobile @regression
  Scenario Outline: A user can see the Notification's thumbnail with the proper media type from the Notification Inbox
    - When creating the notification, the image is always mandatory and will be the thumbnail shown when also
    including a video or gif.
    commented_tags="@depends_on.NOV-174641"
    Given user is in the "Notification Inbox" page
     When receives a notification with "<media_content>" media
      And clicks on the "notification_thumbnail" field of the element in the "1" position of the "inbox_list" list
     Then the "Notification Thumbnail" page is displayed
      And the "<media_content>" media is displayed

    Examples:
          | product | parent_test_plan | cv     | media_content | detects      | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | gif           | IOS-6778     | QANOV-3499   |
          | vivobr  | QANOV-520839     | 11.6   | video         | ANDROID-9524 | QANOV-3500   |
          | vivobr  | QANOV-520839     | 11.6   | image         |              | QANOV-3501   |
          | moves   |                  | 11.6   | gif           | IOS-6778     | QANOV-3502   |
          | moves   |                  | 11.6   | video         | ANDROID-9524 | QANOV-3503   |
          | moves   |                  | 11.6   | image         |              | QANOV-3504   |
          | o2uk    |                  | 11.6   | gif           | IOS-6778     | QANOV-3505   |
          | o2uk    |                  | 11.6   | video         | ANDROID-9524 | QANOV-3506   |
          | o2uk    |                  | 11.6   | image         |              | QANOV-3507   |
          | blaude  |                  | Future | gif           | IOS-6778     | QANOV-244239 |
          | blaude  |                  | Future | video         | ANDROID-9524 | QANOV-244240 |
          | blaude  |                  | Future | image         |              | QANOV-244241 |
          | o2de    |                  | Future | gif           | IOS-6778     | QANOV-244242 |
          | o2de    |                  | Future | video         | ANDROID-9524 | QANOV-244243 |
          | o2de    |                  | Future | image         |              | QANOV-244244 |
          | o2es    |                  | Future | video         |              | QANOV-416804 |
          | o2es    |                  | Future | image         |              | QANOV-416805 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174652 @mobile @regression
  Scenario Outline: A user who goes back after seeing the Notification's thumbnail of a consumed notification will continue seeing the notification consumed
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user has "consumed" notifications with thumbnail
      And user is in the "Notification Inbox" page
     When clicks on the thumbnail of a "consumed" notification
      And the "Notification Thumbnail" page is displayed
      And clicks on the "<button>" button
      And the "Notification Inbox" page is displayed
     Then a badge is not displayed in the selected notification

    @automatic @live @next
    Examples:
          | product | cv   | client  | parent_test_plan | button                          | jira_id      |
          | vivobr  | 11.6 | android | QANOV-520839     | navigation_top_bar.back_button  | QANOV-3508   |
          | vivobr  | 11.6 | ios     |                  | navigation_top_bar.close_button | QANOV-97810  |
          | vivobr  | 24.0 | ios     | QANOV-520839     | navigation_top_bar.back_button  | QANOV-522445 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | button                          | jira_id     |
          | moves   | 11.6 | android |                  | navigation_top_bar.back_button  | QANOV-3509  |
          | moves   | 11.6 | ios     |                  | navigation_top_bar.close_button | QANOV-97811 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | client  | parent_test_plan | button                          | jira_id     |
          | o2uk    | 11.6 | android |                  | navigation_top_bar.back_button  | QANOV-3510  |
          | o2uk    | 11.6 | ios     |                  | navigation_top_bar.close_button | QANOV-97812 |

    @manual
    Examples:
          | product | cv     | client  | parent_test_plan | button                          | jira_id      |
          | blaude  | Future | android |                  | navigation_top_bar.back_button  | QANOV-244245 |
          | blaude  | Future | ios     |                  | navigation_top_bar.close_button | QANOV-244246 |
          | o2de    | Future | android |                  | navigation_top_bar.back_button  | QANOV-244247 |
          | o2de    | Future | ios     |                  | navigation_top_bar.close_button | QANOV-244248 |
          | o2es    | Future | android |                  | navigation_top_bar.back_button  | QANOV-244247 |
          | o2es    | Future | ios     |                  | navigation_top_bar.close_button | QANOV-244248 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @regression
  Scenario Outline: A user who goes back after seeing the Notification's thumbnail of an unconsumed notification will continue seeing the notification unconsumed
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user has "unconsumed" notifications with thumbnail
      And user is in the "Notification Inbox" page
     When clicks on the thumbnail of a "unconsumed" notification
      And the "Notification Thumbnail" page is displayed
      And clicks on the "<button>" button
      And the "Notification Inbox" page is displayed
     Then a badge is displayed in the selected notification

    @automatic @live @next
    Examples:
          | product | cv   | client  | parent_test_plan | button                          | jira_id      |
          | vivobr  | 11.6 | android | QANOV-520839     | navigation_top_bar.back_button  | QANOV-3511   |
          | vivobr  | 11.6 | ios     |                  | navigation_top_bar.close_button | QANOV-97813  |
          | vivobr  | 24.0 | ios     | QANOV-520839     | navigation_top_bar.back_button  | QANOV-522446 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | button                          | jira_id     |
          | moves   | 11.6 | android |                  | navigation_top_bar.back_button  | QANOV-3512  |
          | moves   | 11.6 | ios     |                  | navigation_top_bar.close_button | QANOV-97814 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | client  | parent_test_plan | button                          | jira_id     |
          | o2uk    | 11.6 | android |                  | navigation_top_bar.back_button  | QANOV-3513  |
          | o2uk    | 11.6 | ios     |                  | navigation_top_bar.close_button | QANOV-97815 |

    @manual
    Examples:
          | product | cv     | client  | parent_test_plan | button                          | jira_id      |
          | blaude  | Future | android |                  | navigation_top_bar.back_button  | QANOV-244249 |
          | blaude  | Future | ios     |                  | navigation_top_bar.close_button | QANOV-244250 |
          | o2de    | Future | android |                  | navigation_top_bar.back_button  | QANOV-244251 |
          | o2de    | Future | ios     |                  | navigation_top_bar.close_button | QANOV-244252 |
          | o2es    | Future | android |                  | navigation_top_bar.back_button  | QANOV-416806 |
          | o2es    | Future | ios     |                  | navigation_top_bar.close_button | QANOV-416807 |

  @jira.<jira_id> @<client> @<execution_mode> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174644 @mobile @regression
  Scenario Outline: A user who has unseen notifications and accesses to the notification inbox will see the bell icon without the counter when leaving the notification inbox
    Given user has unseen notifications
      And user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "<button>" button
     Then the "<main_tab>" page is displayed
      And the "numeric" red badge is not displayed in the "navigation_top_bar.<icon>" icon

    @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | main_tab | button                          | icon                           | execution_mode | jira_id      |
          | vivobr  | 11.6 | android | QANOV-520839     | Start    | navigation_top_bar.back_button  | notifications_inbox_icon_badge | automatic      | QANOV-3517   |
          | vivobr  | 11.6 | ios     |                  | Start    | navigation_top_bar.close_button | notification_inbox_icon        | manual         | QANOV-97816  |
          | vivobr  | 24.0 | ios     | QANOV-520839     | Start    | navigation_top_bar.back_button  | notification_inbox_icon        | manual         | QANOV-522447 |

    @cert2 @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | main_tab           | button                          | icon                           | execution_mode | jira_id     |
          | moves   | 11.6 | android |                  | [CONF:landing_tab] | navigation_top_bar.back_button  | notifications_inbox_icon_badge | automatic      | QANOV-3518  |
          | moves   | 11.6 | ios     |                  | [CONF:landing_tab] | navigation_top_bar.close_button | notification_inbox_icon        | manual         | QANOV-97817 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | client  | parent_test_plan | main_tab           | button                          | icon                           | execution_mode | jira_id     |
          | o2uk    | 11.6 | android |                  | [CONF:landing_tab] | navigation_top_bar.back_button  | notifications_inbox_icon_badge | automatic      | QANOV-3519  |
          | o2uk    | 11.6 | ios     |                  | [CONF:landing_tab] | navigation_top_bar.close_button | notification_inbox_icon        | manual         | QANOV-97818 |

    Examples:
          | product | cv     | client  | parent_test_plan | main_tab           | button                          | icon                           | execution_mode | jira_id      |
          | blaude  | Future | android |                  | [CONF:landing_tab] | navigation_top_bar.back_button  | notifications_inbox_icon_badge | manual         | QANOV-244253 |
          | blaude  | Future | ios     |                  | [CONF:landing_tab] | navigation_top_bar.close_button | notification_inbox_icon        | manual         | QANOV-244254 |
          | o2de    | Future | android |                  | [CONF:landing_tab] | navigation_top_bar.back_button  | notifications_inbox_icon_badge | manual         | QANOV-244255 |
          | o2de    | Future | ios     |                  | [CONF:landing_tab] | navigation_top_bar.close_button | notification_inbox_icon        | manual         | QANOV-244256 |
          | o2es    | Future | android |                  | [CONF:landing_tab] | navigation_top_bar.back_button  | notifications_inbox_icon_badge | manual         | QANOV-416808 |
          | o2es    | Future | ios     |                  | [CONF:landing_tab] | navigation_top_bar.close_button | notification_inbox_icon        | manual         | QANOV-416809 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-186957 @manual @mobile @regression
  Scenario Outline: A user who receives a notification with app closed and doesn't tap on it will see the Inbox updated
    In order to have an univocal title to identify the notification received, a $timestamp or
    other unique string should be added to the title when sending the notification
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user has the app in "<status>" status
     When receives "1" notifications with "Qsys test $timestamp" title
      And launches the app
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "inbox_notification[0]" textfield with "Qsys test $timestamp" format is displayed
      And a "non_numeric" red badge is displayed in the "inbox_notification[0]" item

    Examples:
          | product | parent_test_plan | cv     | status     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | killed     | QANOV-3520   |
          | vivobr  | QANOV-520839     | 11.6   | background | QANOV-3521   |
          | moves   |                  | 11.6   | killed     | QANOV-3522   |
          | moves   |                  | 11.6   | background | QANOV-3523   |
          | o2uk    |                  | 11.6   | killed     | QANOV-3524   |
          | o2uk    |                  | 11.6   | background | QANOV-3525   |
          | blaude  |                  | Future | killed     | QANOV-244257 |
          | blaude  |                  | Future | background | QANOV-244258 |
          | o2de    |                  | Future | killed     | QANOV-244259 |
          | o2de    |                  | Future | background | QANOV-244260 |
          | o2es    |                  | Future | killed     | QANOV-416810 |
          | o2es    |                  | Future | background | QANOV-416811 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174632 @mobile @no_automatable @regression
  Scenario Outline: A user who has the app opened in several devices and has unseen notification will see the bell icon counter removed only in the device used to access the Notification Inbox if there is no connectivity
    Given user is logged in with the same account in two devices
      And user is in the "<main_tab>" page
     When receives a notification
      And a "numeric" red badge displayed in the "navigation_top_bar.notifications_icon" icon
      And turns on the Airplane mode
      And clicks on the "navigation_top_bar.notifications_icon" icon on device
      And the "Notification Inbox" page is displayed on device
      And clicks on the "navigation_top_bar.back_button" button on device
     Then the notification badge is not displayed in the "navigation_top_bar.notifications_icon" icon on device
      And the notification badge is displayed in the "navigation_top_bar.notifications_icon" icon on device "B"

    Examples:
          | product | main_tab           | parent_test_plan | cv     | jira_id      |
          | vivobr  | Start              | QANOV-520839     | 11.6   | QANOV-3535   |
          | moves   | [CONF:landing_tab] |                  | 11.6   | QANOV-3536   |
          | o2uk    | [CONF:landing_tab] |                  | 11.6   | QANOV-3537   |
          | blaude  | [CONF:landing_tab] |                  | Future | QANOV-244261 |
          | o2de    | [CONF:landing_tab] |                  | Future | QANOV-244262 |
          | o2es    | [CONF:landing_tab] |                  | Future | QANOV-416812 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174631 @mobile @no_automatable @regression
  Scenario Outline: A user who has the app opened in several devices and has unseen notifications will see the counter removed in all the devices after accesing to the notification Inbox in a device
    Given user is logged in with the same account in two devices
      And user is in the "<main_tab>" page
     When receives a notification
      And a "numeric" red badge displayed in the "navigation_top_bar.notifications_icon" icon
      And clicks on the "navigation_top_bar.notifications_icon" icon on device
      And the "Notification Inbox" page is displayed on device
      And clicks on the "navigation_top_bar.back_button" button on device
     Then the notification badge is not displayed in the "navigation_top_bar.notifications_icon" icon on device
      And the notification badge is not displayed in the "navigation_top_bar.notifications_icon" icon on device "B"

    Examples:
          | product | main_tab           | parent_test_plan | cv     | jira_id      |
          | vivobr  | Start              | QANOV-520839     | 11.6   | QANOV-3538   |
          | moves   | [CONF:landing_tab] |                  | 11.6   | QANOV-3539   |
          | o2uk    | [CONF:landing_tab] |                  | 11.6   | QANOV-3540   |
          | blaude  | [CONF:landing_tab] |                  | Future | QANOV-244263 |
          | o2de    | [CONF:landing_tab] |                  | Future | QANOV-244264 |
          | o2es    | [CONF:landing_tab] |                  | Future | QANOV-416813 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174654 @mobile @no_automatable @regression
  Scenario Outline: User can open the Notification Inbox deeplink
    Given user has received notifications
     When user opens the "Native.Inbox" deeplink with the app in "killed" status
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed

    Examples:
          | product | parent_test_plan | cv     | jira_id      |
          | vivobr  | QANOV-520839     | 11.6   | QANOV-3541   |
          | moves   |                  | 11.6   | QANOV-3542   |
          | blaude  |                  | Future | QANOV-244265 |
          | o2de    |                  | Future | QANOV-244266 |
          | o2es    |                  | Future | QANOV-416814 |

  @jira.<jira_id> @<product> @android @impeded_mock @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-174655 @mobile @no_automatable @regression
  Scenario Outline: A user who run out of data and has the app not opened can see new notifications within the Notification Inbox
    internal_checkpoint=" In order to have an univocal title to identify the notification received, a $timestamp or
    other unique string should be added to the title when sending the notification
    - This feature is related with the provider Zero Rating feature which allows to the provider to send information
    to the customer even when the user does not have data"
    From 24.0 the no numeric red badge is shown in the right side of the notification row.
    Given user has run out of data
      And user has the app in "<status>" status
      And user is in the "<main_tab>" page
     When receives "1" notifications with "Qsys test $timestamp" title
      And clicks on the "navigation_top_bar.notifications_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And the "inbox_notification[0]" textfield with "Qsys test $timestamp" format is displayed
      And a "non_numeric" red badge is displayed in the "inbox_notification[0]" item
      And the notification is not displayed in the notification center

    Examples:
          | product | main_tab           | parent_test_plan | cv     | status     | jira_id      |
          | vivobr  | Start              | QANOV-520839     | 11.6   | killed     | QANOV-3543   |
          | vivobr  | Start              | QANOV-520839     | 11.6   | background | QANOV-3544   |
          | moves   | [CONF:landing_tab] |                  | 11.6   | killed     | QANOV-3545   |
          | moves   | [CONF:landing_tab] |                  | 11.6   | background | QANOV-3546   |
          | o2uk    | [CONF:landing_tab] |                  | 11.6   | killed     | QANOV-3547   |
          | o2uk    | [CONF:landing_tab] |                  | 11.6   | background | QANOV-3548   |
          | blaude  | [CONF:landing_tab] |                  | Future | killed     | QANOV-244267 |
          | blaude  | [CONF:landing_tab] |                  | Future | background | QANOV-244268 |
          | o2de    | [CONF:landing_tab] |                  | Future | killed     | QANOV-244269 |
          | o2de    | [CONF:landing_tab] |                  | Future | background | QANOV-244270 |
          | o2es    | [CONF:landing_tab] |                  | Future | killed     | QANOV-416815 |
          | o2es    | [CONF:landing_tab] |                  | Future | background | QANOV-416816 |

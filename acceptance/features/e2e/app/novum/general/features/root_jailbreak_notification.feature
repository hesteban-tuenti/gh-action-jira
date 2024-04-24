# -*- coding: utf-8 -*-
@jira.QANOV-389206
Feature: Root Jailbreak Notification


  @jira.<jira_id> @<client> @<product> @jira.<jira-id> @jira.cv.14.6 @mobile @regression @manual
  Scenario Outline: A <product> user not logged will be notified if there is a risk of using the app when opening it
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged out
      And the "Rooted Device Warning" popup has not been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.rooted_device.notification.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.rooted_device.notification.message]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.rooted_device.notification.button]" text is displayed
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed

    Examples:
          | client  | product | device_status | jira_id      |
          | android | blaude  | rooted        | QANOV-389207 |
          | android | o2de    | rooted        | QANOV-389208 |
          | ios     | blaude  | jailbroken    | QANOV-389209 |
          | ios     | o2de    | jailbroken    | QANOV-389210 |

  @jira.<jira_id> @<client> @<product> @jira.<jira-id> @jira.cv.14.6 @mobile @regression @manual
  Scenario Outline: A <product> user not logged will not be notified if there is a risk of using the app when opening it if the notification has been displayed before
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged out
      And the "Rooted Device Warning" popup has been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is not displayed
      And the "Splash Screen" page is displayed

    Examples:
          | client  | product | device_status | jira_id      |
          | android | blaude  | rooted        | QANOV-389211 |
          | android | o2de    | rooted        | QANOV-389212 |
          | ios     | blaude  | jailbroken    | QANOV-389213 |
          | ios     | o2de    | jailbroken    | QANOV-389214 |

  @jira.<jira_id> @<client> @<product> @jira.<jira-id> @jira.cv.14.6 @mobile @regression @manual
  Scenario Outline: A <product> logged user will be notified if there is a risk of using the app when opening it
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged
      And the "Rooted Device Warning" popup has not been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.rooted_device.notification.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.rooted_device.notification.message]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.rooted_device.notification.button]" text is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | client  | product | device_status | jira_id      |
          | android | blaude  | rooted        | QANOV-389215 |
          | android | o2de    | rooted        | QANOV-389216 |
          | ios     | blaude  | jailbroken    | QANOV-389217 |
          | ios     | o2de    | jailbroken    | QANOV-389218 |

  @jira.<jira_id> @<client> @<product> @jira.<jira-id> @jira.cv.14.6 @mobile @regression @manual
  Scenario Outline: A <product> logged user will not be notified if there is a risk of using the app when opening it if the notification has been displayed before
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged
      And the "Rooted Device Warning" popup has been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is not displayed
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | client  | product | device_status | jira_id      |
          | android | blaude  | rooted        | QANOV-389219 |
          | android | o2de    | rooted        | QANOV-389220 |
          | ios     | blaude  | jailbroken    | QANOV-389221 |
          | ios     | o2de    | jailbroken    | QANOV-389222 |

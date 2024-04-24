# -*- coding: utf-8 -*-
@jira.QABP-245
Feature: Root Jailbreak Notification


  @jira.<jira_id> @<client> @<product> @e2e @jira.cv.<cv> @manual @mobile @regression
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
          | client  | product | cv     | device_status | jira_id  |
          | android | was     | Future | rooted        | QABP-246 |
          | ios     | was     | Future | jailbroken    | QABP-247 |

  @jira.<jira_id> @<client> @<product> @e2e @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user not logged will not be notified if there is a risk of using the app when opening it if the notification has been displayed before
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged out
      And the "Rooted Device Warning" popup has been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is not displayed
      And the "Splash Screen" page is displayed

    Examples:
          | client  | product | cv     | device_status | jira_id  |
          | android | was     | Future | rooted        | QABP-248 |
          | ios     | was     | Future | jailbroken    | QABP-249 |

  @jira.<jira_id> @<client> @<product> @e2e @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> logged user will be notified if there is a risk of using the app when opening it
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged in
      And the "Rooted Device Warning" popup has not been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.rooted_device.notification.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.rooted_device.notification.message]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.rooted_device.notification.button]" text is displayed
      And clicks on the "popup.accept" button
      And the "Landing Tab" page is displayed

    Examples:
          | client  | product | cv     | device_status | jira_id  |
          | android | was     | Future | rooted        | QABP-250 |
          | ios     | was     | Future | jailbroken    | QABP-251 |

  @jira.<jira_id> @<client> @<product> @e2e @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> logged user will not be notified if there is a risk of using the app when opening it if the notification has been displayed before
    To emulate a rooted device there is a tweak in developer settings.
    Given user's phone is <device_status>
      And user is logged in
      And the "Rooted Device Warning" popup has been displayed before
     When launches the app
     Then the "Rooted Device Warning" popup is not displayed
      And the "Landing Tab" page is displayed

    Examples:
          | client  | product | cv     | device_status | jira_id  |
          | android | was     | Future | rooted        | QABP-252 |
          | ios     | was     | Future | jailbroken    | QABP-253 |

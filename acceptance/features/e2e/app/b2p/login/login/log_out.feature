# -*- coding: utf-8 -*-
@jira.QABP-157
Feature: Log Out


  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can see the log out popup on iOS devices
    Given user is in the "Log Out Webview" page
     When clicks on the "log_out" button
     Then the "Log Out Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.log_out_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.log_out_popup.message]" text is displayed
      And the "popup.accept" button with "[LANG:login.log_out_popup.accept_ios]" text is displayed
      And the "popup.cancel" button with "[LANG:login.log_out_popup.cancel_ios]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-158 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can see the log out popup on Android devices
    Given user is in the "Log Out Webview" page
     When clicks on the "log_out" button
     Then the "Log Out Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.log_out_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.log_out_popup.message]" text is displayed
      And the "popup.accept" button with "[LANG:login.log_out_popup.accept_android]" text is displayed
      And the "popup.cancel" button with "[LANG:login.log_out_popup.cancel_android]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-159 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can cancel the logout from logout popup
    Given user is in the "Log Out Popup" popup
     When clicks on the "popup.cancel" button
     Then the "Log Out Webview" page is displayed
      And the "log_out" button is displayed

    Examples:
          | product | cv     | depends_on        | jira_id  |
          | was     | Future | QABP-158:QABP-159 | QABP-160 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @sanity
  Scenario Outline: A <product> user can log out from the app
    Given user is in the "Log Out Popup" popup
     When clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | depends_on        | jira_id  |
          | was     | Future | QABP-158:QABP-159 | QABP-161 |

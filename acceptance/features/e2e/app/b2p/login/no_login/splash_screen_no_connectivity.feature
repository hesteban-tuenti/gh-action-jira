# -*- coding: utf-8 -*-
@jira.QABP-68
Feature: Splash Screen no connectivity

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A non-logged <product> user without data connectivity can see the no connectivity warning
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "Splash Screen" page is displayed
      And the "no_connectivity_warning.text" snackbar with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-69 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user without data connectivity won't see the legal links
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "Splash Screen" page is displayed
      And the "cookies_link" link is not displayed
      And the "data_protection_link" link is not displayed
      And the "imprint_link" link is not displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-70 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user who is in the Login page and loses the connectivity: No Connectivity screen is displayed
    Given user is in the "Login" page
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_icon" icon is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-255 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user who is in No Connectivity screen inside the Login flow and recovers the connectivity, user can return to the Login page
    Given user is in the "Login" page
     When terminates the app
      And turns on the Airplane mode
      And launches the app
      And the "No Connectivity" page is displayed
      And turns off the Airplane mode
      And launches the app
      And clicks on the "retry_button" button
     Then the "Login" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-256 |

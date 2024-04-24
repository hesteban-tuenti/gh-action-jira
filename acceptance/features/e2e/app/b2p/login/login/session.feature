# -*- coding: utf-8 -*-
@jira.QABP-167
Feature: Session


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user is logged out after session expires
    The user session remains 90 days.
    Given user is in the "Login" page
     When user is logged in
      And terminates the app
      And waits "90" days
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-168 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who has never logged in the app can login for first time
    Given user has never logged in the app
      And user is in the "Login" page
     When user is logged in
     Then the "Landing Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-169 |

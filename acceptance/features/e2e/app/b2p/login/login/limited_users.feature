# -*- coding: utf-8 -*-
@jira.QABP-199
Feature: Limited Users

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <status> <product> user can login in the app
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Given user has a product in "<status>" status
     When logs in the application
     Then user is in the "Landing Tab" page

    Examples:
          | product | status         | cv     | jira_id  |
          | was     | early_selfcare | Future | QABP-200 |
          | was     | late_selfcare  | Future | QABP-201 |

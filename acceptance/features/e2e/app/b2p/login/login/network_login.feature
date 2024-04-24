# -*- coding: utf-8 -*-
@jira.QABP-162
Feature: Network Login

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can login with the Network login
    Login page is handled by OB.
    Given user is connected to the "<product>" mobile network
      And user is in the "Login" page
     When clicks on the "network_login" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-163 |

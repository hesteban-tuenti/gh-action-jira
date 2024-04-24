# -*- coding: utf-8 -*-
@jira.QABP-170
Feature: Otp

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can login with user and password
    Login page is handled by OB.
    Given user is in the "Login" page
     When clicks on the "user_password" button
      And the "Credentials" page is displayed
      And fills the "user_name" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-171 |

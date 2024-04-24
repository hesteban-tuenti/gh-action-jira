# -*- coding: utf-8 -*-
@jira.QABP-186
Feature: Security Screenshot

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @TBD @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user won't be able to make an screenshot when a password is visible on Android devices
    The OS will block me or will make a screenshot/video with no information (depending on the Android Manufacturer Layer)
    Given the "Login" page is displayed
     When clicks on the "user_password" button
      And the "Credentials" page is displayed
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And takes a screenshot
     Then TBD

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-187 |

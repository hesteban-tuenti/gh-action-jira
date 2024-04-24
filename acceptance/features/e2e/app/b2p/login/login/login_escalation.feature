# -*- coding: utf-8 -*-
@jira.QABP-173
Feature: Login Escalation


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user logged with <login_type> login will see the Login Escalation page when escalation is required
    Login escalation will be required from OB webview.
    Given user is logged in with "<login_type>" login
      And user is in the "Require Escalation Webview" page
     When clicks on the "require_login" link
     Then the "Login Escalation" page is displayed

    Examples:
          | product | login_type | cv     | jira_id  |
          | was     | otp        | Future | QABP-174 |
          | was     | network    | Future | QABP-175 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user logged without enough permissions will be redirected to the previous page after completing the login escalation
    Login escalation will be required from OB webview.
    Given user is logged in with "<login_type>" login
      And user is in the "Require Escalation Webview" page
     When clicks on the "require_login" link
      And fills the "user_name" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue" button
     Then the "Require Escalation Webview" page is displayed

    Examples:
          | product | login_type | cv     | jira_id  |
          | was     | otp        | Future | QABP-176 |
          | was     | network    | Future | QABP-177 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user logged with user and password won't be prompted to do login escalation
    Login escalation will be required from OB webview.
    Given user is logged in with "user_pwd" login
      And user is in the "Require Escalation Webview" page
     When clicks on the "require_login" link
     Then the "Login Escalation" page is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-178 |

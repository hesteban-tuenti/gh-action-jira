# -*- coding: utf-8 -*-
@jira.QANOV-311510
Feature: In-app onboarding with connectivity or API errors


  @jira.QANOV-27049 @android @automation.pending_env @ios @jira.cv.11.14 @manual @mobile @o2uk @regression
  Scenario: MyO2 user cannot see In-app onboarding when user losses connectivity after login for the first time
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And turns on the Airplane mode
     Then the "Account" page is displayed

  @jira.QANOV-27050 @android @automation.pending_api @impeded_mock @ios @jira.cv.11.14 @manual @mobile @o2uk @regression
  Scenario: MyO2 user cannot see In-app onboarding if there is a server error before seeing it
    other_affected_versions="2020-43"
    internal_checkpoint="To test on PROD env."
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And there is a general server error
     Then the "Account" page is displayed

  @jira.QANOV-1261 @android @automation.pending_env @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @regression @vivobr
  Scenario: Meu Vivo user cannot see In-app onboarding when user losses connectivity after login for the first time
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And turns on the Airplane mode
     Then the "Explore" page is displayed

  @jira.QANOV-1262 @android @ios @jira.cv.11.11 @jira.link.parent_test_plan.QANOV-21791 @mobile @no_automatable
  @regression @vivobr
  Scenario: Meu Vivo user cannot see In-app onboarding if there is a server error before seeing it
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And there is a general server error
     Then the "Explore" page is displayed

  @jira.QANOV-38885 @android @automation.pending_env @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario: Moves user cannot see In-app onboarding when user losses connectivity after login for the first time
    other_affected_versions="2020-48"
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And turns on the Airplane mode
     Then the "Account" page is displayed

  @jira.QANOV-38886 @android @automation.pending_api @impeded_mock @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario: Moves user cannot see In-app onboarding if there is a server error before seeing it
    other_affected_versions="2020-48"
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And there is a general server error
     Then the "Account" page is displayed

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user cannot see In-app onboarding when user losses connectivity after login for the first time
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And turns on the Airplane mode
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.1   | QANOV-311511 |
          | o2de    | Future | QANOV-311512 |

  @jira.<jira_id> @<product> @android @automation.pending_api @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user cannot see In-app onboarding if there is a server error before seeing it
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And there is a general server error
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.1   | QANOV-311513 |
          | o2de    | Future | QANOV-311514 |

  @jira.QANOV-416956 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user cannot see In-app onboarding when user losses connectivity after login for the first time
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And turns on the Airplane mode
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-416957 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user cannot see In-app onboarding if there is a server error before seeing it
    Given user is in the "Splash Screen" page
      And user has never logged in the app
     When logs in the application
      And there is a general server error
     Then the "[CONF:landing_tab]" page is displayed

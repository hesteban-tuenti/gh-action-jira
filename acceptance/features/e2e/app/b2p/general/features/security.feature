# -*- coding: utf-8 -*-
@jira.QABP-182
Feature: Security


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user will see the app obfuscated in the App Switcher
    iOS: app logo will be displayed
    Android: blank screen will be displayed
     When opens the App Switcher
     Then the "<app_name>" app is obfuscated

    Examples:
          | product | app_name     | cv     | jira_id  |
          | was     | Whatsapp SIM | Future | QABP-183 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the native keyboard when other is set by default on iOS devices
    Given third-party keyboard is set by default
      And user is in the "Input Text Webview" page
     When clicks on the "test_inputtext" inputtext
     Then the native keyboard is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-184 |

  @jira.<jira_id> @<product> @TBD @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the native keyboard when other is set by default on Android devices
    Given third-party keyboard is set by default
      And user is in the "Input Text Webview" page
     When clicks on the "test_inputtext" inputtext
     Then TBD

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-185 |

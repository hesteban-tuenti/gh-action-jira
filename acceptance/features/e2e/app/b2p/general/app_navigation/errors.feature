# -*- coding: utf-8 -*-
@jira.QABP-222
Feature: Errors


  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the Error screen on a Tab when an error occurs
    Given user is in the "Any Tab" page
      And there is an API error
     When pulls down the page to refresh
     Then the "Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "[LANG:errors.title]" text is displayed
      And the "error_message" textfield with "[LANG:errors.message]" text is displayed
      And the "error_button" button with "[LANG:errors.button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-223 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the Error screen when an error occurs in a Modal Webview
    Given user is in the "Test Webview Modes" page
     When clicks on the "error_in_modal_link" link
     Then the internal modal webview is displayed
      And the "Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "[LANG:errors.title]" text is displayed
      And the "error_message" textfield with "[LANG:errors.message]" text is displayed
      And the "error_button" button with "[LANG:errors.button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-224 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the Error screen when an error occurs in a Flow Webview
    Given user is in the "Test Webview Modes" page
     When clicks on the "error_in_flow_link" link
     Then the internal flow webview is displayed
      And the "Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "[LANG:errors.title]" text is displayed
      And the "error_message" textfield with "[LANG:errors.message]" text is displayed
      And the "error_button" button with "[LANG:errors.button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-225 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user tries to reload the Error screen when the error persists
    Given user is in the "Error" page
     When clicks on the "error_button" button
     Then the "Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "[LANG:errors.title]" text is displayed
      And the "error_message" textfield with "[LANG:errors.message]" text is displayed
      And the "error_button" button with "[LANG:errors.button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-226 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can reload the page from Error screen when the error is fixed
    Given user is in the "Any Tab" page
      And there is an API error
     When pulls down the page to refresh
      And the "Error" page is displayed
      And clicks on the "error_button" button
     Then the "Any Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-227 |

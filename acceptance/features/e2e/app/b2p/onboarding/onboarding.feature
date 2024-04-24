# -*- coding: utf-8 -*-
@jira.QABP-72
Feature: Onboarding


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user in <status> status will see the Onboarding on the first login in the app
    Onboarding defined as a webview and handled by the OB with Adobe CMS, so we should not validate the content,
    only that has a correct behavior.
    Early Selfcare user: customers with an MSISDN not active yet.
    Given user has a product in "<status>" status
      And user just installed the application
     When logs in the application
     Then the "Onboarding" internal webview is displayed
      And the "next" button is displayed
      And the "close" button is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | status         | cv     | jira_id |
          | was     | active         | Future | QABP-73 |
          | was     | early_selfcare | Future | QABP-74 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user in late_selfcare status won't see the Onboarding on the first login in the app
    Onboarding defined as a webview and handled by the OB with Adobe CMS, so we should not validate the content,
    only that has a correct behavior.
    Late Selfcare user: customers that don’t have an active contract but are allowed to use a limited version
    of the app for 90 days after contract deactivation.
    Given user has a product in "late_selfcare" status
      And user just installed the application
     When logs in the application
     Then the "Start" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-75 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can access the next Onboarding page
    Onboarding defined as a webview and handled by the OB with Adobe CMS, so we should not validate the content,
    only that has a correct behavior.
    Given user has a product in any "active;early_selfcare" status
      And user just installed the application
     When logs in the application
      And the "Onboarding" internal webview is displayed
      And clicks on the "next" button
     Then the "Intermediate Onboarding" internal webview is displayed

    Examples:
          | product | cv     | depends_on      | jira_id |
          | was     | Future | QABP-73:QABP-74 | QABP-76 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can close the Onboarding from navigation top bar
    Onboarding defined as a webview and handled by the OB with Adobe CMS, so we should not validate the content,
    only that has a correct behavior.
    Given user has a product in any "active;early_selfcare" status
      And user just installed the application
     When logs in the application
      And the "Onboarding" internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Start" page is displayed

    Examples:
          | product | cv     | depends_on      | jira_id |
          | was     | Future | QABP-73:QABP-74 | QABP-77 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can close the Onboarding from the close button in the webview
    Onboarding defined as a webview and handled by the OB with Adobe CMS, so we should not validate the content,
    only that has a correct behavior.
    Given user has a product in any "active;early_selfcare" status
      And user just installed the application
     When logs in the application
      And the "Onboarding" internal webview is displayed
      And clicks on the "close" button
     Then the "Start" page is displayed

    Examples:
          | product | cv     | depends_on      | jira_id |
          | was     | Future | QABP-73:QABP-74 | QABP-78 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the Error page if an error occurs in the Onboarding webview
    Given user has a product in any "active;early_selfcare" status
      And user just installed the application
     When logs in the application
      And an error occurrs in the "onboarding" webview
     Then the "Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "TBD" text is displayed
      And the "error_message" textfield with "TBD" text is displayed
      And the "retry" button with "TBD" text is displayed
      And clicks on the "navigation_tab_bar.close_button" button
      And the "Start" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-79 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can access the Onboarding from OB webview
    Given user is in the "Webview Test Onboarding" page
      And clicks on the "onboarding" link
     Then the "Onboarding" page is displayed
      And clicks on the "navigation_tab_bar.close_button" button
      And the "Webview Test Onboarding" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-80 |

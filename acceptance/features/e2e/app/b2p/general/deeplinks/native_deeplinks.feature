# -*- coding: utf-8 -*-
@jira.QABP-195
Feature: Native Deeplinks


  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user with the app in killed status who opens a deeplink that redirects to a blocked tab: TBD
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Given user has a "limited" product
     When opens the "Blocked_tab" deeplink with the app in "killed" status
     Then the "Landing Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-196 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user with the app in background status who opens a deeplink that redirects to a blocked tab, previous page is displayed
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Given user has a "limited" product
      And user is in the "Last Tab" page
     When opens the "Blocked_tab" deeplink with the app in "foreground" status
     Then the "Last Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-197 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user who opens a deeplink that redirects to a blocked tab from a webview, user is not redirected
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Given user has a "limited" product
      And user is in the "Test Deeplink Webview" page
     When clicks on the "blocked_tab_deeplinks" link
     Then the "Test Deeplink Webview" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-198 |

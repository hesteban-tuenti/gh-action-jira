# -*- coding: utf-8 -*-
@jira.QABP-188
Feature: Limited Access


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user can access the landing tab
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Given user has a "limited" product
      And launches the app
     Then the "Landing Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-189 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user can see greyed out the blocked tabs
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Information about how display Navigation tabs will come from VisualModules API
    Given user has a "limited" product
      And user is in the "Landing Tab" page
     Then each "blocked" element in the "navigation_tab_bar.list" is displayed in "greyed" color

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-190 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user will see an error when tries to access a blocked tab
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Information about how display Navigation tabs will come from VisualModules API
    Given user has a "limited" product
      And user is in the "Landing Tab" page
     When clicks on a "blocked" tab in the "navigation_tab_bar.list" list
     Then the "no_access_warning" snackbar with "Aktiviere die SIM-Karte, damit diese Funktion verfügbar ist." text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-191 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: Snackbar access warning for <product> limited users will disappear after 5 seconds
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Information about how display Navigation tabs will come from VisualModules API
    Given user has a "limited" product
      And user is in the "Landing Tab" page
     When clicks on a "blocked" tab in the "navigation_tab_bar.list" list
      And the "no_access_warning" snackbar is displayed
      And waits "5" seconds
     Then the "no_access_warning" snackbar is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-192 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A limited <product> user will be able to access the blocked tabs when reactives his account
    The limited users in Whatssapp SIM are:
    - Early selfcare: customers with an MSISDN not active yet
    - Late selfcare: customers that don’t have an active contract but are allowed to use a limited version of the app
    for 90 days after contract deactivation.
    Information about how display Navigation tabs will come from VisualModules API
    Given user has a "limited" product
      And user is in the "Landing Tab" page
     When user reactives the account
     Then user can navigate through the previous blocked tabs

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-193 |

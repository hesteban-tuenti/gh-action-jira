# -*- coding: utf-8 -*-
@jira.QANOV-555320
Feature: Landline Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with just one landline can open the '<deeplink>' OB deeplink
    Given user has a "telco" account type
      And user has "1" products of "landline;radio" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "<text>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | deeplink                                            | header       | text                                | jira_id      |
          | Landline Calls Restriction                          | Líneas fijas | Bloquear todas las llamadas         | QANOV-555321 |
          | Management Landline International Calls Restriction | Líneas fijas | Bloquear las llamadas al extranjero | QANOV-555322 |
          | Management Landline Special Numbers Restriction     | Líneas fijas | Bloquear las llamadas a números     | QANOV-555323 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with >1 landlines can open the '<deeplink>' OB deeplink: Disambiguation page is displayed
    Given user has a "telco" account type
      And user has ">1" products of "landline;radio" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "title" textfield with the "\d\d\d \d\d \d\d" format
      And each element in the "lines.list" list has the "subtitle" field
      And the "title" field of "lines.list" list entries will match the user landline lines

    Examples:
          | deeplink                                            | jira_id      |
          | Landline Calls Restriction                          | QANOV-555324 |
          | Management Landline International Calls Restriction | QANOV-555325 |
          | Management Landline Special Numbers Restriction     | QANOV-555326 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with >1 landlines can open the '<deeplink>' OB deeplink and clicks on any line in the Disambiguation page
    Given user has a "telco" account type
      And user has ">1" products of "landline;radio" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "<text>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | deeplink                                            | header       | text                                | jira_id      |
          | Landline Calls Restriction                          | Líneas fijas | Bloquear todas las llamadas         | QANOV-555327 |
          | Management Landline International Calls Restriction | Líneas fijas | Bloquear las llamadas al extranjero | QANOV-555328 |
          | Management Landline Special Numbers Restriction     | Líneas fijas | Bloquear las llamadas a números     | QANOV-555329 |

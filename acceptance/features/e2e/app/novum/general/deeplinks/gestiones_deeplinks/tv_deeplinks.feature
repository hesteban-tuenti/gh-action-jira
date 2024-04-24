# -*- coding: utf-8 -*-
@jira.QANOV-555391
Feature: TV Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.QANOV-555392 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with DAZN can open the 'DAZN Activation' deeplink
    Given user has a "telco" account type
      And user has ">0" products of "tv;movistar_plus_ott" type
      And user has a "dazn" product
     When opens the "Gestiones.Dazn" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "DAZN" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-555393 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with Disney+ can open the 'Disney Management' OB deeplink
    Given user has a "telco" account type
      And user has ">0" products of "tv;movistar_plus_ott" type
      And user has a "disney+" product
     When opens the "Gestiones.Disney" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Activación Disney+" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "Disney+" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-555394 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with Netflix can open the 'Netflix' OB deeplink
    Given user has a "telco" account type
      And user has ">0" products of "tv;movistar_plus_ott" type
      And user has a "netflix" product
     When opens the "Gestiones.Netflix" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "catálogo completo de Netflix" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with just one tv product can open the '<deeplink>' OB deeplink
    Given user has a "telco" account type
      And user has "1" products of "tv;movistar_plus_ott" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the <mode> webview is displayed
      And the "<header>" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "<text>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | deeplink                               | mode     | header                | text                                      | jira_id      |
          | Movistar Plus Management Password User | internal | Área Privada Movistar | Usuario de Movistar Plus+ en dispositivos | QANOV-555395 |
          | Movistar Plus Management               | internal | Área Privada Movistar | Movistar Plus+                            | QANOV-555396 |
          | Tv Packages Configuration Management   | browser  | mi Movistar           | Configura tu pack                         | QANOV-555397 |

  @jira.QANOV-555398 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with >1 tv product can open the 'Movistar Plus Management Password User' OB deeplink: Disambiguation page is displayed
    Given user has a "telco" account type
      And user has ">1" products of "tv;movistar_plus_ott" type
     When opens the "Gestiones.Movistar Plus Management Password User" deeplink with the app in "killed" status
     Then the "Tv Disambiguation" page is displayed
      And the "Tus productos" header is displayed
      And the "products" list is displayed
      And each element in the "products" list has the "icon" field
      And each element in the "products" list has the "title" field
      And each element in the "products" list has the "chevron" field
      And the "products" list has ">1" elements

  @jira.QANOV-555401 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with >1 tv product can open the 'Movistar Plus Management Password User' OB deeplink and selects a product on the disambiguation page: TV Management page is displayed
    Given user has a "telco" account type
      And user has ">1" products of "tv;movistar_plus_ott" type
     When opens the "Gestiones.Movistar Plus Management Password User" deeplink with the app in "killed" status
      And the "Tv Disambiguation" page is displayed
      And clicks on any element in the "products" list
     Then the internal webview is displayed
      And the "Área Privada Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "Usuario de Movistar Plus+ en dispositivos" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

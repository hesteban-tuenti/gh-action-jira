# -*- coding: utf-8 -*-
@jira.QANOV-555404
Feature: Internet Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.QANOV-555407 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @sanity @ber
  Scenario: A telco user with internet product can open the 'Speed Test' internal deeplink
    Given user has a "telco" account type
      And user has ">0" products of "internet" type
     When opens the "Gestiones.Speed Test" deeplink with the app in "killed" status
     Then the "Speed Test" page is displayed
      And the "Test de Velocidad" header is displayed
      And the "info_icon" icon is displayed
      And the "content" textfield is displayed
      And the "calculate_speed" button with "Calcular velocidad" text is displayed

  @jira.QANOV-555405 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @sanity @ber
  Scenario: A telco user with internet product can open the 'Second Fiber' OB deeplink
    Given user has a "telco" account type
      And user has ">0" products of "internet" type
      And user has the "second_fiber" product contracted
     When opens the "Gestiones.Second Fiber" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "Segunda Fibra" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-555408 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with just one wifi can open the 'Wifi Password' deeplink
    Given user has a "telco" account type
      And user has ">0" products of "internet" type
      And user has the "smart_wifi" service in "activated" status
      And user has "1" wifi activated
     When opens the "Gestiones.Wifi Password" deeplink with the app in "killed" status
     Then a native drop-down with several sharing options is displayed

  @jira.QANOV-555414 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with more than one wifi can open the 'Wifi Password' deeplink and selects a wifi
    Given user has a "telco" account type
      And user has ">0" products of "internet" type
      And user has the "smart_wifi" service in "activated" status
      And user has "1" wifi activated
     When opens the "Gestiones.Wifi Password" deeplink with the app in "killed" status
      And the "WiFi Disambiguation" page is displayed
      And clicks on any element in the "wifi_list" list
    Then a native drop-down with several sharing options is displayed

  @jira.QANOV-555411 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco user with >1 wifis can open the 'Wifi Password' deeplink: Disambiguation page is displayed
    Given user has a "telco" account type
      And user has ">0" products of "internet" type
      And user has the "smart_wifi" service in "activated" status
      And user has ">1" wifi activated
     When opens the "Gestiones.Wifi Password" deeplink with the app in "killed" status
     Then the "WiFi Disambiguation" page is displayed
      And the "Tus redes wifi" header is displayed
      And the "wifi_list" list is displayed
      And each element in the "wifi_list" list has the "icon" field
      And each element in the "wifi_list" list has the "title" field
      And each element in the "wifi_list" list has the "chevron" field
      And the "wifi_list" list has ">1" elements

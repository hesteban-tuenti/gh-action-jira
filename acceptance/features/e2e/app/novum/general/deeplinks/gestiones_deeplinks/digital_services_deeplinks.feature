# -*- coding: utf-8 -*-
@jira.QANOV-555376
Feature: Digital Services Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.QANOV-555377 @TBD @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user with 1 movistar_car product can open the 'Movistar Car' deeplink
    Given user has a "telco postpay" account type
      And user has "1" products of "movistar_car" type
     When opens the "Gestiones.Movistar Car" deeplink with the app in "killed" status
     Then the TBD webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-555379 @TBD @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user with 1 movistar_prosegur product can open the 'Movistar Prosegur Alarmas' deeplink
    Given user has a "telco postpay" account type
      And user has "1" products of "movistar_car" type
     When opens the "Gestiones.Movistar Prosegur Alarmas" deeplink with the app in "killed" status
     Then the TBD webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-555381 @TBD @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user with 1 movistar_salud product can open the 'Movistar Salud' deeplink
    Given user has a "telco postpay" account type
      And user has "1" products of "movistar_salud" type
     When opens the "Gestiones.Movistar Salud" deeplink with the app in "killed" status
     Then the TBD webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-555383 @TBD @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user with 1 senior_watch product can open the 'Movistar Te Cuida' deeplink
    Given user has a "telco postpay" account type
      And user has "1" products of "senior_watch" type
     When opens the "Gestiones.Movistar Te Cuida" deeplink with the app in "killed" status
     Then the TBD webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-555389 @TBD @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user with 1 game_pass product can open the 'Game Pass Activation' deeplink (20 GB incluidos)
    Given user has a "telco postpay" account type
      And user has "1" products of "game_pass" type
     When opens the "Gestiones.Game Pass Activation" deeplink with the app in "killed" status
     Then the TBD webview is displayed
      And the "TBD" header is displayed

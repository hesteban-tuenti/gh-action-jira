# -*- coding: utf-8 -*-
@jira.QANOV-326035
Feature: Gaming Module

  Actions Before each Scenario:
    Given user has a "telco postpay" account type
      And user has a "any_admin" role


  @jira.QANOV-326036 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @cert2 @live @next @qa @webapp
  Scenario: User with Game Pass subscriptions purchased can see the Gaming module in the Dashboard
    Given user has purchased ">0" Game Pass Ultimate subscriptions
      And user has the "xbox-game-pass-products" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "gaming_section_header" textfield is displayed
      And the "gaming_module.icon" icon is displayed
      And the "gaming_module.title" textfield is displayed
      And the "gaming_module.link" link with "Ver detalle" text is displayed

  @jira.QANOV-326037 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User with 1 Game Pass subscription purchased can access to the details of their subscription
    Given user has purchased "1" Game Pass Ultimate subscriptions
      And user is in the "Dashboard" page
     When clicks on the "gaming_module.link" link
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "Xbox Game Pass Ultimate" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-326038 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User with multiple Game Pass subscriptions purchased can see them listed
    Given user has purchased ">1" Game Pass Ultimate subscriptions
      And user is in the "Dashboard" page
     When clicks on the "gaming_module.link" link
     Then the "Subscriptions Disambiguation" page is displayed
      And the "Game Pass" header is displayed
      And the "title" textfield with "Selecciona una subscripción" text is displayed
      And the "subscription_list" list is displayed
      And each element in the "subscription_list" list has the "icon" field
      And each element in the "subscription_list" list has the "subscription_name" textfield with "Xbox Game Pass Ultimate de Movistar" text
      And each element in the "subscription_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-326039 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with multiple Game Pass subscriptions purchased can access the details of one of them
    Given user has purchased ">1" Game Pass Ultimate subscriptions
      And user is in the "Dashboard" page
     When clicks on the "gaming_module.link" link
      And the "Subscriptions Disambiguation" page is displayed
      And clicks on any element in the "subscription_list" list
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "Xbox Game Pass Ultimate" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Subscriptions Disambiguation" page is displayed

  @jira.QANOV-326040 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves @sanity
  @cert2 @live @next @qa @webapp
  Scenario: User without subscriptions of Game Pass purchased can't see the module in the Dashboard
    Given user does not have purchased any Game Pass Ultimate subscription
      And user is in the "Dashboard" page
     Then the "gaming_module" module is not displayed

  @jira.QANOV-326041 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see an error if the Gaming module fails to load
    Given user has purchased ">0" Game Pass Ultimate subscriptions
      And user is in the "Dashboard" page
     When an error occurs loading the "gaming_module" module
     Then the "gaming_section_header" textfield is displayed
      And the "gaming_module.error_title" textfield with "Algo ha ido mal" text is displayed
      And the "gaming_module.error_subtitle" textfield with "El contenido no se puede mostrar" text is displayed

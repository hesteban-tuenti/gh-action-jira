# -*- coding: utf-8 -*-
@jira.QANOV-358526
Feature: Extras section


  @jira.QANOV-358527 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves @smoke
  @qa @cert2 @live @next @webapp
  Scenario: A TELCO/LANDLINE/ADMIN user can see "Mis Tokens" module
    Given user has a "telco" account type
      And user has a "admin" role
      And user has a "landline" product
      And user is in the "Dashboard" page
      And user has the "simple-data-card-tokens" module configured in CMS for "dashboard-user" page
     Then the "my_tokens_module" module is displayed
      And the "my_tokens_module.title" textfield is displayed

  @jira.QANOV-358528 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves @smoke
  @cert2 @live @next
  Scenario: A TELCO/LANDLINE/ADMIN user clicks "Ver detalles" from "Mis Tokens" module: "Mis tokens" page is displayed
    Given user has a "telco" account type
      And user has a "admin" role
      And user has a "landline" product
      And user is in the "Dashboard" page
      And user has the "simple-data-card-tokens" module configured in CMS for "dashboard-user" page
     When clicks on the "my_tokens_module.link" button
     Then the internal webview with "Mis tokens" header is displayed
      And the "tokens" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-358530 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves @smoke
  @cert2 @live @next
  Scenario: A user clicks on the "Mis Pedidos" entrypoint from "Dashboard" page: "Mis Pedidos" header is displayed
    Given user is in the "Dashboard" page
      And user has the "services-summary" module configured in CMS for "dashboard-user" page
     When clicks on the "my_orders" entrypoint
     Then the internal webview with "Mis pedidos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

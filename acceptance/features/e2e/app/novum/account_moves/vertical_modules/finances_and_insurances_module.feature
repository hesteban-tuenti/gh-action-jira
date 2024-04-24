# -*- coding: utf-8 -*-
@jira.QANOV-326028
Feature: Finances And Insurances Module


  @jira.QANOV-326029 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @qa @webapp
  Scenario: User with a purchased product for Finances can see the vertical module in the Dashboard
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "mobile_insurance" service in "activated" status
      And user has the "data-card-product-mobile-insurance" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "finances_section_header" textfield is displayed
      And the "finances_module.icon" icon is displayed
      And the "finances_module.title" textfield is displayed
      And the "finances_module.link" link with "Ver detalle" text is displayed

  @jira.QANOV-326030 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User with 1 purchased mobile insurance can access the details of the insurance
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "mobile_insurance" service in "activated" status for "1" device
      And user is in the "Dashboard" page
     When clicks on the "finances_module.link" link
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-326031 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User with multiple purchased mobile insurance can access the list of devices insured
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "mobile_insurance" service in "activated" status for ">1" device
      And user is in the "Dashboard" page
     When clicks on the "finances_module.link" link
     Then the "Devices Disambiguation" page is displayed
      And the "Seguro móvil" header is displayed
      And the "title" textfield with "Selecciona un terminal" text is displayed
      And the "devices_list" list is displayed
      And each element in the "devices_list" list has the "icon" field
      And each element in the "devices_list" list has the "device_model" field
      And each element in the "devices_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-326032 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with multiple purchased mobile insurance can access the details of a device insured
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "mobile_insurance" service in "activated" status for ">1" device
      And user is in the "Dashboard" page
     When clicks on the "finances_module.link" link
      And the "Devices Disambiguation" page is displayed
      And clicks on any element in the "devices_list" list
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Devices Disambiguation" page is displayed

  @jira.QANOV-326033 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @regression @qa @live @next @cert2 @webapp
  Scenario: User without a purchased product for Finances can't see the module in the Dashboard page
    Given user has the "mobile_insurance" service in "deactivated" status
      And user is in the "Dashboard" page
     Then the "finances_module" module is not displayed

  @jira.QANOV-326034 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see an error if the Finances module fails to load
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "mobile_insurance" service in "activated" status
      And user is in the "Dashboard" page
     When an error occurs loading the "finances_module" module
     Then the "finances_section_header" textfield is displayed
      And the "finances_module.error_title" textfield with "Algo ha ido mal" text is displayed
      And the "finances_module.error_subtitle" textfield with "El contenido no se puede mostrar" text is displayed

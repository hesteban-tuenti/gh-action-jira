# -*- coding: utf-8 -*-
@jira.QANOV-146473
Feature: Radio Dashboard


  @jira.QANOV-146474 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @smoke
  Scenario: User with a "radio" product included in his tariff can access to the Radio dashboard
    Note that the radio product will be displayed as an "Internet" product
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "radio" product
      And user has ">1" products
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "internet-header" module configured in CMS for "landline-internet" page
      And user has the "subscription-description" module configured in CMS for "landline-internet" page
      And user has the "counters-carousel" module configured in CMS for "landline-internet" page
      And user has the "unbilled-consumption" module configured in CMS for "landline-internet" page
      And user has the "services-summary" module configured in CMS for "landline-internet" page
      And user has the "support-card" module configured in CMS for "landline-internet" page
      And user is in the "Radio" page
     Then the "landline_number.icon" icon is displayed
      And the "landline_number.title" textfield is displayed
      And the "Internet" header is displayed
      And stores the Internet package name in the context storage with key "internet_package_name"
      And the "package_name" textfield with "[CONTEXT:internet_package_name]" text is displayed
      And the "speed_info" module is displayed
      And the "allowances_carousel" carousel is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "highlighted_services" list with "Test de velocidad;Configurar router;Restringir llamadas del fijo" textfields is displayed
      And the "plan_data" module is displayed

  @jira.QANOV-146476 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @regression
  Scenario: User with a "radio" product taps on the 'Configurar router' entrypoint: External webview page is displayed
    Note that the radio product will be displayed as an "Internet" product
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "radio" product
      And user has ">1" products
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "landline-internet" page
      And user is in the "Radio" page
     When clicks on any element in the "highlighted_services" list that contains the "Configurar router" text
     Then the external webview is displayed
      And the "Configura gratis y de forma sencilla tu router" string is displayed

  @jira.QANOV-146477 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @regression
  Scenario: User with a "radio" product as a Standalone taps on the 'Gestiones de línea fija' entrypoint: 'Área privada Movistar' browser page is displayed
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "radio" product
      And user has ">1" products
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "landline-internet" product
      And user is in the "Radio" page
     When clicks on any element in the "highlighted_services" list that contains the "Gestiones de línea fija" text
     Then the browser webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "Bloquear llamadas salientes" string is displayed

  @jira.QANOV-146478 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @regression
  Scenario: User with JUST a "radio" product as a Standalone taps on the 'Test de velocidad' entrypoint: 'Test de velocidad' page is displayed
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "radio" product
      And user has "1" products
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "landline-internet" product
      And user is in the "Radio" page
     When clicks on any element in the "highlighted_services" list that contains the "Test de velocidad" text
     Then the "Speed Test" page is displayed
      And the "Test de velocidad" header is displayed

  @jira.QANOV-146479 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @regression
  Scenario: User with JUST a "radio" product taps on the 'Configurar router' entrypoint: External webview page is displayed
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "radio" product
      And user has "1" products
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "landline-internet" product
      And user is in the "Radio" page
     When clicks on any element in the "highlighted_services" list that contains the "Configurar router" text
     Then the external webview is displayed
      And the "Configura gratis y de forma sencilla tu router" string is displayed

  @jira.QANOV-146480 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @regression
  Scenario: User with JUST a "radio" product as a Standalone taps on the 'Gestiones de línea fija' entrypoint: 'Área privada Movistar' browser page is displayed
    Note that the radio product will be displayed as an "Internet" product
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "radio" product
      And user has "1" products
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "landline-internet" product
      And user is in the "Radio" page
     When clicks on any element in the "highlighted_services" list that contains the "Gestiones de línea fija" text
     Then the browser webview is displayed
      And the "Área privada Movistar" header is displayed
      And the "Bloquear llamadas salientes" string is displayed

  @jira.QANOV-146481 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-145525 @manual @mobile @moves
  @regression
  Scenario: User with JUST a "radio" product as a Standalone can see the Internet module
    other_affected_versions="2022-02-B"
    Given user has a "telco postpay" account type
      And user has a "radio" product
      And user has "1" products
      And user has a "any_admin" role
      And user is in the "Radio" page
      And user has the "internet-details" module configured in CMS for "dashboard" page for the "landline-internet" product
     Then the "internet_module_title" textfield with "INTERNET" text is displayed
      And stores the Internet package name in the context storage with key "internet_package_name"
      And the "internet.package_name" textfield with "[CONTEXT:internet_package_name]" text is displayed
      And the "speed_info.upload_speed_title" textfield is displayed
      And the "speed_info.upload_speed_value" textfield is displayed
      And the "speed_info.download_speed_title" textfield is displayed
      And the "speed_info.download_speed_value" textfield is displayed

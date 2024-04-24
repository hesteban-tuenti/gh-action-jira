# -*- coding: utf-8 -*-
@jira.QANOV-266845
Feature: Mobile line plan details


  @jira.QANOV-266851 @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-260587 @manual @mobile @moves
  @regression
  Scenario: TELCO FUSION or PIKOLIN user with an additional line selects the line: "Tu tarifa" section will be shown with "Cambiar tarifa" button
    other_affected_versions="2020-48 2021-25"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan associated
      And user has ">0" mobile lines in "activated" status included in the additional plan
      And user has the matching subscription selected in the account
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "tariff_details.title" textfield with "LÍNEA ADICIONAL" text is displayed
      And the "tariff_details.plan_name" textfield is displayed
      And the "tariff_details.tariff_information" link with "Tu tarifa actual" text is displayed
      And the "tariff_details.button_change" button with "Cambiar tarifa" text is displayed

  @jira.QANOV-106755 @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-106563
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.parent_test_plan.QANOV-260587 @manual @mobile @moves @regression
  Scenario: TELCO FUSION or PIKOLIN user with an additional line and ADMIN user taps on the "Cambiar tarifa" button of the additional line in the tariff module: Browser webview is displayed
    other_affected_versions="2021-25"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a "fusion;pikolin" plan associated
      And user has ">0" mobile lines in "activated" status included in the additional plan
      And user has the matching subscription selected in the account
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "tariff_details.button_change" button
     Then the browser webview with "Tarifas móvil" text in the header is displayed
      And the "Tarifas encontradas" string is displayed

  @jira.QANOV-106756 @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-106563
  @jira.link.parent_test_plan.QANOV-260587 @manual @mobile @moves @regression
  Scenario: TELCO FUSION or PIKOLIN ADMIN-LIGHT user taps on the "Cambiar tarifa" button of the additional line in the tariff module: Login Escalation Required page is displayed
    other_affected_versions="2021-25"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan associated
      And user has ">0" mobile lines in "activated" status included in the additional plan
      And user has the matching subscription selected in the account
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "tariff_details.button_change" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

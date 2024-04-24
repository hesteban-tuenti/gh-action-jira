# -*- coding: utf-8 -*-
@jira.QANOV-143109 @not_hardening
Feature: Debt payment deeplink


  @jira.QANOV-143110 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco admin with debt can see the Bill Selection screen after tapping on the debt payment deeplink
    other_affected_versions="2021-49"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
     Then the "Bill Selection" page is displayed

  @jira.QANOV-151700 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco admin without debt can see the empty case after tapping on the debt payment deeplink
    other_affected_versions="2021-49"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have "any" debt
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
     Then the "Informative No Debt" page is displayed
      And the "informative_title" textfield with "Sin facturas pendientes" text is displayed
      And the "informative_title" textfield with "Cuando tengas alguna factura pendiente podrás verla aquí." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Native Messages" page is displayed

  @android @ios @jira.QANOV-143112 @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco postpay admin-light sees an information screen after opening the debt payment deeplink
    other_affected_versions="2021-49"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Native Messages" page is displayed

  @jira.QANOV-143122 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A non-logged admin can see the Bill Selection screen after completing the user/password authentication
    other_affected_versions="2021-49"
    Given user is logged out
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Moves Login For Escalation" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirmation_button" button
     Then the "Bill Selection" page is displayed

  @android @ios @jira.QANOV-143114 @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay admin-light sees the login screen after tapping on scalation button
    other_affected_versions="2021-49"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Login Escalation Required" page is displayed
      And clicks on the "access_with_password" button
     Then the "Moves Login For Escalation" page is displayed
      And the "selector_tab.phone_number_selector" tab is not displayed
      And the "selector_tab.password_selector" tab with "Soy titular" text is displayed
      And the "insert_data" textfield with "Escribe tus datos para acceder" text is displayed
      And the "identifier_inputtext" inputtext with the "NIF/CIE/NIE/Pasaporte" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed
      And the "register_recover_pass_link" link with "Regístrate o recupera la contraseña" text is displayed

  @android @ios @jira.QANOV-143118 @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A legado user sees an empty case after opening the deeplink
    other_affected_versions="2021-49"
    Given user has a "legado" account type
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
     Then the "Informative Legado User" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Lo sentimos, tus facturas no se pueden pagar a través de la app o la web. Por favor, llama al 1004 para realizar el pago." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And clicks on the "back" button
      And the "Native Messages" page is displayed

  @jira.QANOV-143119 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression @jira.link.detects.CHECKOUT-3146
  Scenario: A legado user can call to 1004 from the legacy debt informative page
    other_affected_versions="2021-49"
    Given user has a "legado" account type
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Informative Legado User" page is displayed
      And clicks on the "call" button
     Then the "dialer" app is displayed
      And the "1004" phone number is inserted on the dialer

  @jira.QANOV-143120 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A legado user can open the Movistar web to pay the debt
    other_affected_versions="2021-49"
    Given user has a "legado" account type
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Informative Legado User" page is displayed
      And clicks on the "pay_on_web" button
     Then the browser webview is displayed

  @jira.QANOV-143121 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A non-logged user can see the login screen screen after opening the debt payment deeplink
    other_affected_versions="2021-49"
    Given user is logged out
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
     Then the "Moves Login For Escalation" page is displayed
      And the "selector_tab.phone_number_selector" tab is not displayed
      And the "selector_tab.password_selector" tab with "Soy titular" text is displayed
      And the "insert_data" textfield with "Escribe tus datos para acceder" text is displayed
      And the "identifier_inputtext" inputtext with the "NIF/CIE/NIE/Pasaporte" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed
      And the "register_recover_pass_link" link with "Regístrate o recupera la contraseña" text is displayed

  @jira.QANOV-143123 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A non-logged admin can see the Login Escalation Required screen after completing the otp authentication
    other_affected_versions="2021-49"
    Given user is logged out
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Moves Login For Escalation" page is displayed
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "Login Escalation Required" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-203654
Feature: Debt payment with Bizum


  @jira.QANOV-294054 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin with bills does not see Bizum when debt amount is under 0,50€
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with "<0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
     Then the "Choose Payment Method" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "[LANG:payments.choose_payment_method.main_title]" text is displayed
      And the "payment_methods_list" list has "2" elements
      And the "0" index in the "payment_methods_list" list has the "card_icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.card_label]" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "bank_account_icon" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.bank_account_label]" text
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-356557 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin can access to the continue with Bizum screen before the Bizum screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
     Then the "Continue with Bizum" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "bill" icon is displayed
      And the "continue_with_bizum" textfield with "¿Continuar con Bizum?" text is displayed
      And the "bizum_description" textfield with "Accederás a Bizum y podrás completar tu pago" text is displayed
      And the "continue_button" button with "Continuar" text is displayed

  @jira.QANOV-203656 @android @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @sanity
  Scenario: A telco postpay user logged in as admin can access to the pay with bizum screen in Android devices
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
     Then the internal webview with "[LANG:payments.header]" header is displayed
      And the "Teléfono registrado" string is displayed

  @jira.QANOV-570323 @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @sanity
  Scenario: A telco postpay user logged in as admin can access to the pay with bizum screen in iOS devices
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
     Then the internal webview with "[LANG:payments.header]" header is displayed
      And the "Teléfono registrado" string is displayed

  @jira.QANOV-203657 @android @ios @jira.cv.14.5 @jira.dv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin sees the field to insert the Bizum code after inserting the phone number
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
     Then the "Clave Bizum" string is displayed
      And the "bizum_number" inputtext with "[CONTEXT:user.number]" text is displayed
      And the "bizum_password" inputtext is displayed
      And the "pay" button with the "Pagar \d+(\,\d{1,2})?€" format is displayed

  @jira.QANOV-203658 @android @ios @jira.cv.14.5 @jira.dv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin who has inserted the number and the code sees the screen to insert the OTP code
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
     Then the "Bizum OTP Screen" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Confirma el pago" text is displayed
      And the "Pago 100% seguro" string is displayed
      And the "bizum_otp" inputtext is displayed
      And the "pay" button with the "Pagar \d+(\,\d{1,2})?€" format is displayed

  @jira.QANOV-203659 @android @ios @jira.cv.14.5 @jira.dv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin who has inserted the otp sees the bizum confirmation screen
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
     Then the "Bizum Confirmation Screen" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Resultado de tu operación" text is displayed
      And the "Su operación se ha realizado" string is displayed

  @jira.QANOV-203660 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @no_automatable
  @smoke
  Scenario: A telco postpay user logged in as admin completes the payment with Bizum and sees the Feedback Success screen
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And debt payment is completed successfully
      And clicks on the "continue" button
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message" textfield with "Tus facturas pendientes están pagadas. Lo verás actualizado en tu cuenta. Recibirás un SMS con la confirmación del pago. La reactivación del servicio puede tardar hasta 24 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-203661 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-203660
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @no_automatable @regression
  Scenario: A telco postpay user logged in as admin can return to account after completing the Bizum payment
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And debt payment is completed successfully
      And the "Bill Payment Success Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-294055 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @no_automatable
  @regression
  Scenario: A telco postpay user logged in as admin completes the payment with Bizum and debt cancelation is processing
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And clicks on the "continue" button
      And debt cancelation is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Choose Payment Method" page is displayed

  @jira.QANOV-294056 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-294055
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin returns to Bill Selection after taping on back button on the Bizum feedback screen with procesing debt cancelation
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And clicks on the "continue" button
      And debt cancelation is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Bill Selection" page is displayed

  @jira.QANOV-294057 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin cancels the Bizum payment by close button and it is redirected to error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-294058 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin cancels the Bizum payment by cancel payment and it is redirected to payment error screen after the Bizum error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And clicks on the "cancel_payment" button
     Then the "Bizum Cancel Payment" internal webview is displayed
      And the "Operación cancelada" string is displayed
      And clicks on the "continue" button
      And the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-294059 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-294057 @jira.link.depends_on.QANOV-294058
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin returns to Choose Payment Method after taping on retry button on the Bizum payment error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Choose Payment Method" page is displayed

  @jira.QANOV-294060 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-294057 @jira.link.depends_on.QANOV-294058
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin returns to Bill selection after taping on back button on the Bizum payment error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with ">0,50" amount
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Continue with Bizum" page is displayed
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Bill Selection" page is displayed

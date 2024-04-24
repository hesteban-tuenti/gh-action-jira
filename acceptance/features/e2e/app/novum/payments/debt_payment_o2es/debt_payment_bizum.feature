# -*- coding: utf-8 -*-
@jira.QANOV-203669 @not_hardening
Feature: Debt payment with Bizum


  @jira.QANOV-203671 @android @ios @jira.cv.Future @jira.disabled @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user can access to the pay with bizum screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
     Then the "Bizum Payment" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Introduce tus datos de Bizum" text is displayed
      And the "Teléfono registrado" string is displayed
      And the "bizum_number" inputtext is displayed
      And the "pay" button with the "Continuar con la compra" format is displayed

  @jira.QANOV-203673 @android @ios @jira.cv.Future @jira.disabled @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user sees the field to insert the Bizum code after inserting the phone number
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
     Then the "Clave Bizum" string is displayed
      And the "bizum_number" inputtext with "[CONTEXT:user.number]" text is displayed
      And the "bizum_password" inputtext is displayed
      And the "pay" button with the "Pagar \d+(\,\d{1,2})?€" format is displayed

  @jira.QANOV-203674 @android @ios @jira.cv.Future @jira.disabled @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user who has inserted the number and the code sees the screen to insert the OTP code
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
     Then the "Bizum OTP Screen" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Confirma el pago" text is displayed
      And the "Pago 100% seguro" string is displayed
      And the "bizum_otp" inputtext is displayed
      And the "pay" button with the "Pagar \d+(\,\d{1,2})?€" format is displayed

  @jira.QANOV-203675 @android @ios @jira.cv.Future @jira.disabled @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user who has inserted the otp sees the bizum confirmation screen
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
     Then the "Bizum Confirmation Screen" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Resultado de tu operación" text is displayed
      And the "Su operación se ha realizado" string is displayed

  @jira.QANOV-203676 @android @ios @jira.cv.Future @jira.disabled @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @smoke
  Scenario: A user completes the payment with Bizum and sees the Feedback Success screen
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
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
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message" textfield with "Tus facturas pendientes están pagadas. Lo verás actualizado en tu cuenta. Recibirás un SMS con la confirmación del pago. La reactivación del servicio puede tardar hasta 24 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-203677 @android @ios @jira.cv.Future @jira.disabled @jira.link.depends_on.QANOV-203676
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @o2es @smoke
  Scenario: A user can return to account after completing the Bizum payment
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
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
     Then the "Account" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-203685 @not_hardening
Feature: Debt payment with Bizum


  @jira.QANOV-294061 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills does not see Bizum when debt amount is under 0,50€
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt with "<0,50" amount
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
     Then the "Choose Payment Method" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "[LANG:payments.choose_payment_method.main_title]"
      And the "payment_methods_list" list has "2" elements
      And the "0" index in the "payment_methods_list" list has the "card_icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.card_label]" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "bank_account_icon" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.bank_account_label]" text
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "continue" is equal to "Continuar"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-203687 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-203656 @manual
  @moves @sanity @web
  Scenario: A telco postpay user logged in as admin can access to the pay with bizum screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
     Then the internal webview with "[LANG:payments.header]" header is displayed
      And the "Teléfono registrado" string is displayed

  @jira.QANOV-203688 @jira.cv.14.5 @jira.dv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin sees the field to insert the Bizum code after inserting the phone number
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
     Then the "Clave Bizum" string is displayed
      And the text of the element "bizum_number" is equal to "[CONTEXT:user.number]"
      And the "bizum_password" inputtext is displayed
      And the "pay" button with the "Pagar \d+(\,\d{1,2})?€" format is displayed

  @jira.QANOV-203689 @jira.cv.14.5 @jira.dv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin who has inserted the number and the code sees the screen to insert the OTP code
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
     Then the "Bizum OTP Screen" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Confirma el pago"
      And the "Pago 100% seguro" string is displayed
      And the "bizum_otp" inputtext is displayed
      And the "pay" button with the "Pagar \d+(\,\d{1,2})?€" format is displayed

  @jira.QANOV-203690 @jira.cv.14.5 @jira.dv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin who has inserted the otp sees the bizum confirmation screen
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
     Then the "Bizum Confirmation Screen" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Resultado de tu operación"
      And the "Su operación se ha realizado" string is displayed

  @jira.QANOV-203691 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-203660 @moves
  @no_automatable @smoke @web
  Scenario: A telco postpay user logged in as admin completes the payment with Bizum and sees the Feedback Success screen
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And waits "2" seconds
      And debt payment is completed successfully
      And I click on the "continue" button
     Then the "Bill Payment Success Feedback" page is loaded
      And the "success_icon" icon is displayed
      And the text of the element "informative_title" is equal to "¡Listo!"
      And the text of the element "informative_message" is equal to "Tus facturas pendientes están pagadas. Lo verás actualizado en tu cuenta. Recibirás un SMS con la confirmación del pago. La reactivación del servicio puede tardar hasta 24 horas."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-203692 @jira.cv.14.5 @jira.link.depends_on.QANOV-203691 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-203661 @moves @no_automatable @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the Bizum payment
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And waits "2" seconds
      And debt payment is completed successfully
      And the "Bill Payment Success Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-294062 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @moves @no_automatable @regression @web
  Scenario: A telco postpay user logged in as admin completes the payment with Bizum and debt cancelation is processing
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I click on the "continue" button
      And debt cancelation is processing
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago se está procesando"
      And the text of the element "informative_message" is equal to "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días."
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Choose Payment Method" page is loaded

  @jira.QANOV-294063 @jira.cv.14.5 @jira.link.depends_on.QANOV-294062 @jira.link.parent_test_plan.QANOV-76684 @moves
  @no_automatable @regression @web
  Scenario: A telco postpay user logged in as admin returns to Bill Selection after taping on back button on the Bizum feedback screen with procesing debt cancelation
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I click on the "continue" button
      And debt cancelation is processing
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Bill Selection" page is loaded

  @jira.QANOV-294064 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin cancels the Bizum payment by close button and it is redirected to error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I click on the "navigation_top_bar.back_button" button
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde"
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-294065 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin cancels the Bizum payment by cancel payment and it is redirected to payment error screen after the Bizum error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I click on the "cancel_payment" button
     Then the "Bizum Cancel Payment" page is loaded
      And the "Operación cancelada" string is displayed
      And I click on the "continue" button
      And the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde"
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-294066 @jira.cv.14.5 @jira.link.depends_on.QANOV-294064 @jira.link.depends_on.QANOV-294065
  @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin returns to Choose Payment Method after taping on retry button on the Bizum payment error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I click on the "navigation_top_bar.back_button" button
      And the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And I click on the "retry" button
     Then the "Choose Payment Method" page is loaded

  @jira.QANOV-294067 @jira.cv.14.5 @jira.link.depends_on.QANOV-294064 @jira.link.depends_on.QANOV-294065
  @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin returns to Bill Selection after taping on back button on the Bizum payment error screen
    The "Bizum Payment" webview is external. Belongs to Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I click on the "navigation_top_bar.back_button" button
      And the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And I click on the "back" button
     Then the "Bill Selection" page is loaded

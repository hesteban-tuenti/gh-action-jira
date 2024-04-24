# -*- coding: utf-8 -*-
@jira.QANOV-68999
Feature: Debt payment with bank account

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-69000 @android @automatic @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2229
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @sanity
  Scenario: A telco postpay user logged in as admin can access to the pay with bank account
    other_affected_versions="2021-35 2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
     Then the "Pay With Bank Account" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Tu cuenta bancaria" text is displayed
      And each element in the "bank_accounts_list" list has the "icon" field
      And each element in the "bank_accounts_list" list has the "payment_description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "bank_account_ending" textfield with the "[LANG:payments.bank_acccount_payment.bank_account_ending_format]" format
      And each element in the "bank_accounts_list" list has the "associated_bills" textfield with "[LANG:payments.bank_acccount_payment.see_associated_bills]" text
      And each element in the "bank_accounts_list" list has the "account_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "bank_account_payment_message" textfield with "La deuda de cada producto se cargará a la cuenta bancaria asociada, en caso de querer editarla deberás ir a Perfil > Facturación > Mis métodos de pago." text is displayed
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-151688 @android @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @sanity
  Scenario: A telco postpay user logged in as admin can see the associated bills for a bank account
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "associated_bills" button of "bank_accounts_list" list with "0" index
     Then the "Associated Bills" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield that contains the "Facturas asociadas" text is displayed
      And each element in the "bills_account_list" list has the "bill_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de \d\d\d\d" format
      And each element in the "bills_account_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "bills_account_list" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "bills_account_list" list has the "bill_total" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "total_bills_label" textfield with "Total" text is displayed

  @jira.QANOV-69003 @android @automatic @ber @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69000
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @smoke
  Scenario: A telco postpay user logged in as admin completes the bank account payment successfully
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And waits until the "[LANG:payments.feedback_success.success_title]" text in "success_title" element is displayed
      And the "success_title" textfield with "[LANG:payments.feedback_success.success_title]" text is displayed
      And the "success_message1" textfield with "Hemos solicitado el reenvío. Tu banco lo recibirá en un máximo de 72h. Por favor asegúrate de tener saldo suficiente." text is displayed
      And the "success_message2" textfield with "Si tienes algún servicio suspendido, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "ok_button" button with "Volver" text is displayed
      And switches to original frame
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

  @jira.QANOV-296643 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the bank account payment successfully for payable documents and sees the feedback screen
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" payable documents from "TDE" legal entity
      And user has "pending" payable documents from "TME" legal entity
      And user does not have "any" debt
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message1" textfield with "El pago se ha completado y pronto recibirás la confirmación por email." text is displayed
      And the "success_message2" textfield with "Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "ok_button" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-296644 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the bank account payment successfully for debt and payable documents and sees the feedback screen
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user has "pending" payable documents
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message1" textfield with "El pago se ha completado y pronto recibirás la confirmación por email." text is displayed
      And the "success_message2" textfield with "Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "ok_button" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-69004 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69003
  @jira.link.detects.CHECKOUT-2233 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario: A telco postpay user logged in as admin can return to invoice tab after doing the bank account payment
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
      And switches to original frame
     Then the "Invoices" page is displayed

  @jira.QANOV-142070 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69004 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who has a debt in payment process (paid by bank account) can see it with "pending" status
    While invoice is not paid in checkout, the status will be "in process of payment". We cannot control when the bill will disappear. After 5 days, if debt is retrieved by 4P, checkout will show again to pay it
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Invoices" page
      And user has a debt in payment process by bank account
     When clicks on the "outstanding_debt_button" button
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And any element in the "unpaid_bills" list has the "label" textfield with the "EN PROCESO DE PAGO" text
      And the debt with label "EN PROCESO DE PAGO" does not have the "selected" icon
      And the "navigation_tab_bar.account_tab" element is not on display
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

  @jira.QANOV-69005 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69000 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the bank account payment with processing status
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días." text is displayed
      And the "ok_button" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-69006 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69005 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to invoices tab after completing the bank account payment with processing status
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And payment is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "ok_button" button
     Then the "Invoices" page is displayed

  @jira.QANOV-69007 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69000 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the bank account payment partially
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algunas facturas no se han podido pagar" text is displayed
      And the "informative_message" textfield with "Por favor, revisa la deuda pendiente e inténtalo de nuevo." text is displayed
      And the "ok_button" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-69008 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69007 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to invoices tab after completing the bank account payment partially
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "ok_button" button
     Then the "Invoices" page is displayed

  @jira.QANOV-69012 @android @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @regression
  Scenario: A telco postpay user logged in as admin without connectivity cannot complete the bank account payment on Android device
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And switches to original frame
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conectividad" text is displayed
      And the "no_connectivity_text" textfield with "Comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And switches to original frame
      And user turns off the Airplane mode
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-206300 @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario: A telco postpay user logged in as admin without connectivity cannot complete the bank account payment on iOS device
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And user turns on the Airplane mode
      And clicks on the "pay" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conectividad" text is displayed
      And the "no_connectivity_text" textfield with "Comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And switches to original frame
      And user turns off the Airplane mode
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-69013 @android @automatic @jira.cv.12.7 @jira.link.depends_on.QANOV-69012
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario: A telco postpay user logged in as admin without connectivity can retry the bank account payment by tapping the retry button on Android device
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And clicks on the "pay" button
      And switches to original frame
     Then the "Payments No Connectivity" page is displayed
      And user turns off the Airplane mode
      And clicks on the "retry" button
      And the "Pay With Bank Account" page is displayed

  @jira.QANOV-206301 @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69012
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario: A telco postpay user logged in as admin without connectivity can retry the bank account payment by tapping the retry button on iOS device
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pay With Bank Account" page is displayed
      And user turns on the Airplane mode
      And the "Pay With Bank Account" page is displayed
      And clicks on the "pay" button
      And switches to original frame
     Then the "Payments No Connectivity" page is displayed
      And user turns off the Airplane mode
      And the "Payments No Connectivity" page is displayed
      And clicks on the "retry" button
      And the "Pay With Bank Account" page is displayed

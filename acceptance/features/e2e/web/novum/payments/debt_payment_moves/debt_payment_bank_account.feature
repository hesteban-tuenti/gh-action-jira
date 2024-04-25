# -*- coding: utf-8 -*-
@jira.QANOV-77387 @not_hardening
Feature: Debt payment with bank account


  @jira.QANOV-77388 @automatic @ber @jira.cv.12.7 @jira.link.detects.CHECKOUT-3350 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69000 @moves @qa @sanity @web
  Scenario: A telco postpay user logged in as admin methods can access to the pay with bank account
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "continue_button" button
      And the "DebtPaymentSummary" checkout page is loaded
      And I click on the "continue_button" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue_button" button
     Then the "PayWithBankAccount" checkout page is loaded
      And the text of the element "main_title" is equal to "Tu cuenta bancaria"
      And the "bank_accounts_list" list is displayed
      And each element in the "bank_accounts_list" web list has the "icon" field
      And each element in the "bank_accounts_list" list has the "payment_description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "bank_account_ending" textfield with the "[LANG:payments.bank_acccount_payment.bank_account_ending_format]" format
      And each element in the "bank_accounts_list" list has the "associated_bills" textfield with "[LANG:payments.bank_acccount_payment.see_associated_bills]" text
      And each element in the "bank_accounts_list" list has the "account_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the text of the element "bank_account_payment_message" is equal to "La deuda de cada producto se cargará a la cuenta bancaria asociada, en caso de querer editarla deberás ir a Mi perfil > Datos de mis facturas > Dirección de facturación."
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"
      And I go back to the previous page
      And the "BillSelection" checkout page is loaded

  @jira.QANOV-151714 @automatic @ber @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-151688 @moves @qa @sanity @web
  Scenario: A telco postpay user logged in as admin can see the associated bills for a bank account
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "continue_button" button
      And the "DebtPaymentSummary" checkout page is loaded
      And I click on the "continue_button" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And the "PayWithBankAccount" checkout page is loaded
      And clicks on the "associated_bills" button of "bank_accounts_list" list with "0" index
     Then the "AssociatedBills" checkout page is loaded
      And the "main_title" textfield that contains the "Facturas asociadas a" text is displayed
      And each element in the "bills_account_list" list has the "bill_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format
      And each element in the "bills_account_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "bills_account_list" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "bills_account_list" list has the "bill_total" textfield with the "[LANG:payments.debt_amount_format]" format
      And the text of the element "total_bills_label" is equal to "Total"
      And I go back to the previous page
      And the "PayWithBankAccount" checkout page is loaded

  @jira.QANOV-77392 @automatic @ber @jira.cv.12.7 @jira.link.depends_on.QANOV-77391
  @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-69004 @moves @qa @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after doing the bank account payment
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "continue_button" button
      And the "DebtPaymentSummary" checkout page is loaded
      And I click on the "continue_button" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And the "PayWithBankAccount" checkout page is loaded
      And I click on the "pay" button
      And the "FeedbackPaymentSuccess" checkout page is loaded
      And I click on the "ok_button" button
     Then the "MovesAccount" page is loaded

  @jira.QANOV-142073 @jira.cv.12.7 @jira.link.depends_on.QANOV-77391 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin who has a debt in payment process (paid by bank account) can see it with "pending" status
    While invoice is not paid in checkout, the status will be "in process of payment". We cannot control when the bill will disappear. After 5 days, if debt is retrieved by 4P, checkout will show again to pay it
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a debt in payment process by bank account
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtPaymentSummary" checkout page is loaded
     Then the "BillSelection" checkout page is loaded
      And the text of the element "select_debt_message" is equal to "Selecciona las facturas que deseas pagar"
      And the "unpaid_bills" element is displayed
      And any element in the "unpaid_bills" list has the "label" textfield with the "EN PROCESO DE PAGO" text
      And the debt with label "EN PROCESO DE PAGO" does not have the "selected" icon
      And I go back to the previous page
      And the "Account" page is loaded

  @jira.QANOV-77393 @jira.cv.12.7 @jira.link.depends_on.QANOV-77388 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69005 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the bank account payment with processing status
    other_affected_versions="2021-36"
    Given I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtPaymentSummary" checkout page is loaded
      And user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
     When I click on the "continue" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "PayWithBankAccount" checkout page is loaded
      And I click on the "pay" button
      And payment is processing
     Then the "Bill Payment Informative Feedback" checkout page is loaded
      And the "informative_icon" element is displayed
      And the text of the element "success_title" is equal to "Tu pago se está procesando"
      And the text of the element "success_message" is equal to "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días."
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Account" page is loaded

  @jira.QANOV-77394 @jira.cv.12.7 @jira.link.depends_on.QANOV-77393 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69006 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the bank account payment with processing status
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtPaymentSummary" checkout page is loaded
     When I click on the "continue" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "PayWithBankAccount" checkout page is loaded
      And I click on the "pay" button
      And payment is processing
      And the "Bill Payment Informative Feedback" checkout page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-77395 @jira.cv.12.7 @jira.link.depends_on.QANOV-77388 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69007 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the bank account payment partially
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtPaymentSummary" checkout page is loaded
     When I click on the "continue" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "PayWithBankAccount" checkout page is loaded
      And I click on the "pay" button
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" checkout page is loaded
      And the "informative_icon" element is displayed
      And the text of the element "informative_title" is equal to "Algunas facturas no se han podido pagar"
      And the text of the element "informative_message" is equal to "Por favor, revisa la deuda pendiente e inténtalo de nuevo."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-77396 @jira.cv.12.7 @jira.link.depends_on.QANOV-77395 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69008 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the bank account payment partially
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtPaymentSummary" checkout page is loaded
     When I click on the "continue" button
      And the "ChoosePaymentMethod" checkout page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "PayWithBankAccount" checkout page is loaded
      And I click on the "pay" button
      And payment is completed partially
      And the "Bill Payment Informative Feedback" checkout page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

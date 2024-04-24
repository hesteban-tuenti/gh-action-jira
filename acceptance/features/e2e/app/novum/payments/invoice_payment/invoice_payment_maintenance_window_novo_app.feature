# -*- coding: utf-8 -*-
@jira.QANOV-477172
Feature: Invoice Payment maintenance window - Novo App


  @jira.QANOV-477173 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with 1 bill only sees the "Pix" and "Código de barras" option in the Choose Payment Method screen with a callout during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-477174 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with 1 bill only can copy the barcode during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Você copiou o código de barras" text is displayed
      And the "snackbar.link" textfield with "Fechar" text is displayed
      And the clipboard has the "barcode" text

  @jira.QANOV-477175 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with 1 bill only can copy the Pix code during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Você copiou o código Pix" text is displayed
      And the "snackbar.link" textfield with "Fechar" text is displayed
      And the clipboard has the "pix_code" text

  @jira.QANOV-477176 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user who has select several bills sees an informative screen when trying to pay a bill during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And user has "several" plans
      And has "several" bills in "unpaid" status in any subscription for each plan
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue_button" button
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "error_title" textfield with "Não é possível realizar seu pagamento no cartão de crédito" text is displayed
      And the "automatic_debt_message" textfield with "Vimos que teve um estorno no pagamento da sua fatura Vivo com cartão de crédito. Pra su segurança, use outro meio de sua preferência:" text is displayed
      And the "automatic_debt_subtitle" textfield with "Débito automático" text is displayed
      And the "expiration_message" textfield with "Você não se preocupa como o vencimiento. O valor é debitado todo mês na sua conta bancária" text is displayed
      And the "barcode_subtitle" textfield with "Código de barras" text is displayed
      And the "barcode_message" textfield with "Você usa o código de barras e escolhe como pagar: no site, no app ou onde seu banco permitir" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

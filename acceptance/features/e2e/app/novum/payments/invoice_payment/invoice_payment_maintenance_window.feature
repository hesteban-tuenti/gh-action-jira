# -*- coding: utf-8 -*-
@jira.QANOV-453987
Feature: Invoice Payment maintenance window


  @jira.QANOV-323132 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill with due date after than 31st of August of 2022 and has not closed the "security_advice" alert sees the "Pix" and "Código de barras" option in the Choose Payment Method screen with alert during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" status bill which "due_date" field is after "08-2022"
      And user has not closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects a bill in the "unpaid_bills_list" list which due_date is after "08-2022"
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.close" icon is displayed
      And the "informative_alert.title" textfield with "Dicas de segurança" text is displayed
      And the "informative_alert.description" textfield with "O App Vivo é o canal mais seguro pra você confirmar todas as informações da sua fatura" text is displayed
      And the "informative_alert.link" textfield with "Ver mais" text is displayed
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-323133 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill with due date after than 31st of August of 2022 and has closed the "security_advice" alert sees the "Pix" and "Código de barras" option in the Choose Payment Method screen without alert during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" bill which "due_date" field is after "31-08-2022" date
      And user has closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list which "due_date" field is after "31-08-2022" date
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is not displayed
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-356558 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill with due date before than 1st of September of 2022 sees accesses to the barcode screen during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" bill which "due_date" field is before "01-09-2022" date
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list which "due_date" field is before "01-09-2022" date
      And clicks on the "continue_button" button
     Then the "Bill Barcode" page is displayed
      And the "Pagar fatura" header is displayed
      And the "main_title" textfield with "Copie o código de barras e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "bill_expiration_date" textfield with the "Vence em ?\d+/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "barcode_icon" icon is displayed
      And the "barcode_title" textfield with "Código de barras" text is displayed
      And the "bill_barcode" textfield is displayed
      And the "copy_barcode_button" button with "Copiar código de barras" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-356559 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user who has select several bills sees an informative screen when trying to pay a bill during a maintenance window
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "error_title" textfield with "Não é possível realizar seu pagamento no cartão de crédito" text is displayed
      And the "automatic_debt_message" textfield with "Vimos que teve um estorno no pagamento da sua fatura Vivo com cartão de crédito. Pra su segurança, use outro meio de sua preferência:" text is displayed
      And the "automatic_debt_subtitle" textfield with "Débito automático" text is displayed
      And the "expiration_message" textfield with "Você não se preocupa como o vencimiento. O valor é debitado todo mês na sua conta bancária" text is displayed
      And the "barcode_subtitle" textfield with "Código de barras" text is displayed
      And the "barcode_message" textfield with "Você usa o código de barras e escolhe como pagar: no site, no app ou onde seu banco permitir" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-356560 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user who has select several bills can return to bills page after seeing the informative screen during a maintenance window
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Feedback Recurrent Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

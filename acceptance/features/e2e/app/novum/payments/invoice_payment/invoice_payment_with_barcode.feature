# -*- coding: utf-8 -*-
@jira.QANOV-223881
Feature: Invoice Payment with Barcode

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-223887 @android @automatic @ber @ios @jira.cv.13.5 @jira.link.detects.CHECKOUT-3574 @old_app
  @jira.link.parent_test_plan.QANOV-217458 @jira.link.parent_test_plan.QANOV-319348 @mobile @qa @sanity @vivobr @webapp
  Scenario: A no legacy user with a unpaid bill can access to the "Código de barras" screen
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
     Then the "Bill Barcode" page is displayed
      And the "main_title" textfield with "Copie o código de barras e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bill_expiration_date" textfield with the "Vence em ?\d+/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "barcode_icon" icon is displayed
      And the "barcode_title" textfield with "Código de barras" text is displayed
      And the "bill_barcode" textfield is displayed
      And the "copy_barcode_button" button with "Copiar código de barras" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

  @jira.QANOV-223893 @android @automatic @ber @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458
  @jira.link.relates_to.QANOV-4088 @mobile @qa @sanity @vivobr @old_app
  Scenario: A no legacy user with automatic debit disabled can copy the bill barcode in the "Código de barras" screen
    other_affected_versions="2022-29"
    User in QA: qavivo-03, qavivo-02
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Bill Barcode" page is displayed
      And clicks on the "copy_barcode_button" button
     Then the "warning" textfield with "Copiamos seu código de barras" text is displayed
      And the clipboard has the "bill_barcode" text

  @jira.QANOV-223896 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458
  @jira.link.relates_to.QANOV-21995 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user blacklisted by the OB for credit card payment with an unpaid bill can pay a single bill by barcode
    other_affected_versions="2022-29"
    A 'unpaid' bill is a bill in delayed or pending status
    Given user is not a "legacy;control_n;jeri" account type
      And is blacklisted by the OB for credit card payment
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue" button
     Then the "Bill Barcode" page is displayed
      And the "Pagar fatura" header is displayed
      And the "main_title" textfield with "Copie o código de barras e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "bill_expiration_date" textfield with the "Venceu em ?\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "barcode_icon" icon is displayed
      And the "barcode_title" textfield with "Código de barras" text is displayed
      And the "bill_barcode" textfield is displayed
      And the "copy_barcode_button" button with "Copiar código de barras" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

  @jira.QANOV-223898 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458 @jira.link.relates_to.QANOV-4100
  @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy dependent user can pay a single bill by barcode
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue" button
     Then the "Bill Barcode" page is displayed
      And the "Pagar fatura" header is displayed
      And the "main_title" textfield with "Copie o código de barras e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "bill_expiration_date" textfield with the "Venceu em ?\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "barcode_icon" icon is displayed
      And the "barcode_title" textfield with "Código de barras" text is displayed
      And the "bill_barcode" textfield is displayed
      And the "copy_barcode_button" button with "Copiar código de barras" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

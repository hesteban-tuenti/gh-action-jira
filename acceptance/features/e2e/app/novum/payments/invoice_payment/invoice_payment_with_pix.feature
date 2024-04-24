# -*- coding: utf-8 -*-
@jira.QANOV-229123
Feature: Invoice Payment with PIX

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-229124 @android @automatic @ber @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-319348 @mobile @qa
  @sanity @vivobr @webapp @old_app
  Scenario: A no legacy user with a unpaid bill can access to the "Pix" screen
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" status bill whose "due_date" field is after "08-2022"
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
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
     Then the "Pix Payment" page is displayed
      And the "main_title" textfield with "Copie o código Pix e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bill_expiration_date" textfield with the "Vence em ?\d+/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "pix_icon" icon is displayed
      And the "pix_title" textfield with "Código Pix" text is displayed
      And the "pix_code" textfield is displayed
      And the "pix_info" link with "Entenda o Pix" text is displayed
      And the "copy_pix_code_button" button with "Copiar código Pix" text is displayed
      And the "pix_qr" link with "Pagar com QR Code Pix outro celular" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

  @jira.QANOV-229130 @android @automatic @ber @ios @jira.cv.13.5 @mobile @qa @sanity @vivobr @old_app
  Scenario: A no legacy user with automatic debit and recurrent payment disabled can copy the pix code in the "Pix payment" screen
    other_affected_versions="2022-29, 2022-36"
    User in QA: qavivo-03, qavivo-02
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" status bill whose "due_date" field is after "08-2022"
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
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pix Payment" page is displayed
      And clicks on the "copy_pix_code_button" button
     Then the "warning" textfield with "Copiamos seu código Pix" text is displayed
      And the clipboard has the "pix_code" text

  @jira.QANOV-229131 @android @automatic @ios @jira.cv.13.5 @mobile @qa @regression @vivobr @webapp @old_app
  Scenario: A no legacy user can see the informative screen about Pix
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" status bill whose "due_date" field is after "08-2022"
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
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pix Payment" page is displayed
      And clicks on the "pix_info" link
     Then the "Pix Information" page is displayed
      And the "main_title" textfield with "É importante que você saiba" text is displayed
      And the "pix_message" textfield with "Pagamento com Pix" text is displayed
      And the "pix_subtitle" textfield with "Disponível todos os dias, 24 horas por dia, inclusive nos finais de semana e feriados" text is displayed
      And the "status_message" textfield with "Status do pagamento no App Vivo" text is displayed
      And the "status_subtitle" textfield with the "Pode levar até \d+ dias para a atualização do status do seu pagamento no nosso App" format is displayed
      And the "reactivation_message1" textfield with "Bloqueio parcial e religue dos serviços" text is displayed
      And the "reactivation_subtitle1" textfield with "Ao pagar com Pix, o religue dos serviços ocorrerá automaticamente em até 1 hora" text is displayed
      And the "reactivation_message2" textfield with "Bloqueio total e religue dos serviços" text is displayed
      And the "reactivation_subtitle2" textfield with "Ao pagar com Pix, o religue dos serviços ocorrerá automaticamente após a baixa do pagamento, que pode levar até 2 dias úteis" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Pix Payment" page is displayed

  @jira.QANOV-229132 @android @automatic @ios @jira.cv.13.5 @mobile @qa @smoke @vivobr @webapp @old_app
  Scenario: A no legacy user can see the Pix QR code
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" status bill whose "due_date" field is after "08-2022"
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
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Pix Payment" page is displayed
      And clicks on the "pix_qr" link
     Then the "Pix QR" page is displayed
      And the "main_title" textfield with "QR Code do pagamento Pix" text is displayed
      And the "pix_qr_info" textfield with "Leia o QR Code em outro celular no app de pagamento preferido" text is displayed
      And the "pix_qr" element is on display
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Pix Payment" page is displayed

  @jira.QANOV-229133 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user blacklisted by the OB for credit card payment with an unpaid bill can pay a single bill by pix
    other_affected_versions="2022-29, 2022-36"
    A 'unpaid' bill is a bill in delayed or pending status
    Given user is not a "legacy;control_n;jeri" account type
      And user is blacklisted to pay with card
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" status bill whose "due_date" field is after "08-2022"
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
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
     Then the "Pix Payment" page is displayed
      And the "Pagar fatura" header is displayed
      And the "main_title" textfield with "Copie o código Pix e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "bill_expiration_date" textfield with the "Venceu em ?\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "pix_icon" icon is displayed
      And the "pix_title" textfield with "Código Pix" text is displayed
      And the "pix_code" textfield is displayed
      And the "pix_info" link with "Entenda o Pix" text is displayed
      And the "copy_pix_code_button" button with "Copiar código Pix" text is displayed
      And the "pix_qr" link with "Pagar com QR Code Pix outro celular" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-229134 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy dependent user can pay a single bill by Pix
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" status bill whose "due_date" field is after "08-2022"
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
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
     Then the "Pix Payment" page is displayed
      And the "Pagar fatura" header is displayed
      And the "main_title" textfield with "Copie o código Pix e cole no seu app de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.description" textfield with "No app Vivo, a confirmação do pagamento pode levar até 48h" text is displayed
      And the "bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "bill_expiration_date" textfield with the "Venceu em ?\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "pix_icon" icon is displayed
      And the "pix_title" textfield with "Código Pix" text is displayed
      And the "pix_code" textfield is displayed
      And the "pix_info" link with "Entenda o Pix" text is displayed
      And the "copy_pix_code_button" button with "Copiar código Pix" text is displayed
      And the "pix_qr" link with "Pagar com QR Code Pix outro celular" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-242629 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user cannot pay by Pix a single bill with due date before than 1st of September of 2022
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" bill whose "due_date" field is before "01-09-2022" date
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "1" elements of "unpaid_bills" list whose "due_date" field is before "01-09-2022" date
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
     Then the "payment_methods_list" elements list does not contain the text "Pix"

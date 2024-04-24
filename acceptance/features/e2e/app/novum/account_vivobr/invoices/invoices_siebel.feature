# -*- coding: utf-8 -*-
@jira.QANOV-127088
Feature: Invoices Siebel


  @jira.QANOV-66654 @android @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-66163 @mobile @qa @regression
  @vivobr @old_app
  Scenario: Siebel user without bills can access to the "Minhas faturas" screen
    Send module could be appear
    other_affected_versions="2021-45-B"
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user does not have invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Account" page
     When clicks on the "bills.empty_case.button" button
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "[LANG:bills.no_bills.no_bills_title]" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "[LANG:bills.no_bills.no_bills_subtitle]" text is displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66658 @android @automatic @ber @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3928
  @jira.link.detects.VIVO-2502 @jira.link.detects.VIVO-2510 @jira.link.parent_test_plan.QANOV-66163 @live @mobile @next
  @qa @sanity @vivobr @old_app
  Scenario: Siebel user with bills can access to the "Minhas faturas" screen
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Account" page
     When clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the last invoice of the "invoice_chart_header" invoices chart is selected
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary" module is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66659 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.detects.VIVO-2510
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a paid bill in the "Minhas faturas" screen
    Send module could be appear
    A paid invoice will have a green bar icon to identify the status
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "paid" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em dd/mmm" format is displayed
      And the "bills_summary.status_paid_icon" icon is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Fatura paga" text is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.pay_bill_button" button is not displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66660 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.detects.VIVO-2510
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a zero amount bill in the "Minhas faturas" screen
    A zero amount invoice will have a green bar icon to identify the status.
    The amount will be between 0 and 10 R$
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "zero_amount" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.selection_amount" textfield contains an ">=0" amount
      And the "invoice_chart_header.selection_amount" textfield contains an "<=10" amount
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em dd/mmm" format is displayed
      And the "bills_summary.status_paid_icon" icon is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Fatura isenta" text is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.amount_textfield" textfield contains an ">=0" amount
      And the "bills_summary.amount_textfield" textfield contains an "<=10" amount
      And the "bills_summary.pay_bill_button" button is not displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66661 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.detects.VIVO-2510
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a delayed bill in the "Minhas faturas" screen
    A delayed invoice will have a red bar icon to identify the status.
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "delayed" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bills_summary.status_delayed_icon" icon is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Atrasada" text is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.pay_bill_button" button with "Pagar fatura" text is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Avisar que já está paga" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "2" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is displayed in the "3" position of the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66662 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.parent_test_plan.QANOV-66163
  @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a pending bill in the "Minhas faturas" screen
    A pending invoice will have an orange bar icon to identify the status.
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Vence em \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bills_summary.status_pending_icon" icon is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Aberta" text is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.pay_bill_button" button with "Pagar fatura" text is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "2" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66663 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.parent_test_plan.QANOV-66163
  @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a disputed bill in the "Minhas faturas" screen
    Any invoice (paid, zero amount, pending, delayed) can be disputed.
    In this case, the status of the invoice will display the sufix '- Contestada'.
    Send module could be appear
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Contestada" text is displayed
      And the "bills_summary.amount_risked_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Boleto atualizado" text on the "title" field is displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66664 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.detects.VIVO-2502
  @jira.link.detects.VIVO-2505 @jira.link.detects.VIVO-2510 @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @smoke
  @vivobr @old_app
  Scenario: Siebel user can select a month with a negociada bill in the "Minhas faturas" screen
    A pending invoice will have an orange bar icon to identify the status.
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "negociada" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em dd/mmm" format is displayed
      And the "bills_summary.status_pending_icon" icon is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Fatura negociada" text is displayed
      And the "bills_summary.amount_risked_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.acordo_button" button with "Ver acordos" text is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66665 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.detects.VIVO-2510
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a no-disputed bill in the "Minhas faturas" screen
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "no_contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Contestada" text is not displayed
      And the "bills_summary.amount_risked_textfield" textfield is not displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Boleto atualizado" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66666 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.detects.VIVO-2502
  @jira.link.detects.VIVO-2510 @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with only a bill in the "Minhas faturas" screen
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "1" invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.amount_textfield" and the "total_amount" amounts are the same
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66667 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.parent_test_plan.QANOV-66163
  @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with several bills in the "Minhas faturas" screen
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "2" invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_summary.other_title_textfield" textfield with the "Fatura de MONTH" format is displayed
      And the "bills_summary.other_expiration_date_textfield" textfield is displayed
      And the "bills_summary.other_status_textfield" textfield is displayed
      And the "bills_summary.other_amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.other_buttons_carousel" carousel is displayed
      And the "bills_summary.other_see_details_link" link is not displayed
      And the sum of the "bills_summary.amount_textfield" value and the "bills_summary.other_amount_textfield" value is the same as the "invoice_chart_header.selection_amount" value
      And the "bills_negociada_module" module is displayed
      And the "bills_payment_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66668 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.parent_test_plan.QANOV-66163
  @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month without bills in the "Minhas faturas" screen
    other_affected_versions="2021-45-B"
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a month with "no" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with "-,--" text is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "[LANG:bills.month_without_bills.bills_empty_case_title]" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "[LANG:bills.month_without_bills.bills_empty_case_subtitle]" text is displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66669 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can select a month with a bill in the "Minhas faturas" screen but an error occurs
    The graph won't show any bar in the month that has failed loading.
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a different month in the bills graph
      And there is an API error when requesting the billing information
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with "-,--" text is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "bills_summary.bills_error_title_textfield" textfield with "[LANG:bills.month_error.bills_error_title]" text is displayed
      And the "bills_summary.bills_error_subtitle_textfield" textfield with "[LANG:bills.month_error.bills_error_subtitle]" text is displayed
      And the "bills_summary.bills_error_refresh_icon" icon is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_payment_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-66670 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-3949 @jira.link.parent_test_plan.QANOV-66163
  @manual @mobile @regression @vivobr @old_app
  Scenario: Siebel user can see bills older than 6 months (up to 12)
    Send module could be appear
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has invoices for ">6" months
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When swipes the "invoice_chart_header.carousel" carousel in "right" direction
      And clicks on a different month in the bills graph
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link is not displayed
      And the "bills_payment_module" module is displayed
      And the "bills_negociada_module" module is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-152234 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-66658
  @jira.link.parent_test_plan.QANOV-66163 @live @mobile @next @qa @smoke @vivobr @old_app
  Scenario: Siebel user can see the bills negociada module in the "Minhas faturas" screen
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_negociada_module" module is displayed

  @jira.QANOV-184281 @android @ios @jira.cv.13.1 @manual @mobile @smoke @vivobr @old_app
  Scenario: Siebel user can see the "Ver acordos" entry point
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "vivo-acordos" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Ver acordos" entrypoint configured in CMS for the "vivo-acordos" list
      And user is in the "Bills" page
     Then the "bills_negociada.acordo_entrypoint" entrypoint with "Ver acordos" text is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-126822
Feature: Invoices


  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-100991 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: User can access to the "Minhas faturas" screen if an error occurs when requesting this information
    Given user has a "<account_type>" account type
      And user has invoices
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "navigation_top_bar.options_reload" icon
      And there is an API error when requesting the billing information
      And the "Account" page is displayed
      And clicks on the "bills.internal_error_bills_link" link
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "bills_summary.internal_error_bills_title_textfield" textfield with "Algo deu errado por aqui" text is displayed
      And the "bills_summary.internal_error_bills_subtitle_textfield" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde" text is displayed
      And the "bills_summary.internal_error_bills_refresh_icon" icon is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3915 | QANOV-21949      | QANOV-3918 |
          | 12.0  | convergente  | QANOV-3916 | QANOV-21791      | QANOV-3919 |
          | 11.12 | multivivo    | QANOV-3917 | QANOV-21949      | QANOV-3920 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-100990 @mobile @regression @vivobr
  Scenario Outline: <account_type> user without bills can access to the "Minhas faturas" screen
    other_affected_versions="2021-45-B"
    Given user has a "<account_type>" account type
      And user has a "<user_plan>" plan in "<status>" status
      And user does not have a "siebel" plan
      And user does not have invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Account" page
     When clicks on the "bills.empty_case.button" button
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "[LANG:bills.no_bills.no_bills_title]" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "[LANG:bills.no_bills.no_bills_subtitle]" text is displayed

    @live @next @qa
    Examples:
          | cv    | account_type | user_plan | status | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | monoline  | active | QANOV-3921 | QANOV-21949      | QANOV-3924 |

    @qa
    Examples:
          | cv    | account_type | user_plan | status  | depends_on  | parent_test_plan | jira_id      |
          | 11.12 | multivivo    | any       | active  | QANOV-3923  | QANOV-21949      | QANOV-3926   |
          | 12.0  | convergente  | any       | active  |             | QANOV-21791      | QANOV-340488 |
          | 12.4  | convergente  | any       | pending | QANOV-56936 | QANOV-56585      | QANOV-56935  |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: <account_type> cancelled user without bills can access to the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user does not have invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Account" page
     When clicks on the "bills.empty_case.button" button
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "[LANG:bills.no_bills.no_bills_title]" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "[LANG:bills.no_bills.no_bills_subtitle]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403086 |
          | beatrix      | QANOV-403087 |
          | multivivo    | QANOV-403088 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.NOVUMCC-4603 @jira.link.detects.VIVO-1893 @jira.link.detects.VIVO-1894 @jira.link.detects.VIVO-1895
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-100992
  @mobile @vivobr @old_app
  Scenario Outline: A <account_type> user with bills can access to the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "<user_plan>" plan in "<status>" status
      And user does not have a "siebel" plan
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
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
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    @automatic @live @next @qa
    Examples:
          | cv    | account_type | user_plan | status | depends_on | parent_test_plan | ber | test_priority | jira_id      |
          | 11.12 | beatrix      | monoline  | active | QANOV-3927 | QANOV-21949      | ber | smoke         | QANOV-340489 |
          | 11.12 | multivivo    | any       | active | QANOV-3929 | QANOV-21949      |     | smoke         | QANOV-340490 |

    @automatic @qa
    Examples:
          | cv   | account_type | user_plan | status | depends_on | parent_test_plan | ber | test_priority | jira_id    |
          | 12.0 | convergente  | any       | active | QANOV-3928 | QANOV-21791      | ber | sanity        | QANOV-3949 |

    @manual
    Examples:
          | cv   | account_type | user_plan | status  | depends_on | parent_test_plan | ber | test_priority | jira_id     |
          | 12.4 | convergente  | any       | pending |            | QANOV-56585      |     | regression    | QANOV-56936 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: A <account_type> cancelled user with bills can access to the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
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
      And the "bills_summary_module" module is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403089 |
          | beatrix      | QANOV-403090 |
          | multivivo    | QANOV-403091 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101014 @live @mobile @next @smoke @vivobr
  Scenario Outline: <account_type> user can select a month with a paid bill in the "Minhas faturas" screen
    internal_checkpoint="A paid invoice will have a green bar icon to identify the status."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "paid" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Fatura paga" text is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.pay_bill_button" button is not displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3951 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3952 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3953 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101015 @manual @mobile @smoke @vivobr
  Scenario Outline: User can select a month with a zero amount bill in the "Minhas faturas" screen
    internal_checkpoint="A zero amount invoice will have a green bar icon to identify the status.
    The amount will be between 0 and 10 R$"
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "zero_amount" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
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
      And the "bills_summary.status_textfield" textfield that contains the "Fatura isenta" text is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em \d\d/(jan|fev|març|abr|mai|jun|jul|ago|set|out|nov|dez)(/\d{2})?" format is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.amount_textfield" textfield contains an ">=0" amount
      And the "bills_summary.amount_textfield" textfield contains an "<=10" amount
      And the "bills_summary.pay_bill_button" button is not displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3954 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3955 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3956 |

  @jira.<jira_id> @<execution_mode> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101016 @live @mobile @next @smoke @vivobr
  Scenario Outline: A <account_type> user without cancelled plan can select a month with a delayed bill in the "Minhas faturas" screen
    internal_checkpoint="A delayed invoice will have a red bar icon to identify the status."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a "any" plan in "no cancelled" status
      And user has a month with "delayed" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Fatura vencida" text is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Venceu em \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.pay_bill_button" button with "Pagar fatura" text is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Avisar que já está paga" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "2" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is displayed in the "3" position of the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3957 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3959 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3958 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.VIVO-1857 @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101017 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user without a cancelled plan can select a month with a pending bill in the "Minhas faturas" screen
    internal_checkpoint="A pending invoice will have an orange bar icon to identify the status."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a "any" plan in "no cancelled" status
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Fatura pronta para pagar" text is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield with the "Vence em \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" format is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.pay_bill_button" button with "Pagar fatura" text is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "2ª via de fatura" text on the "title" field is displayed in the "0" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Avisar que já está paga" text on the "title" field is displayed in the "1" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Enviar por e-mail" text on the "title" field is displayed in the "3" position of the "bills_summary.buttons_carousel" carousel
      And the card with "Negociar fatura" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3960 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3961 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3962 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101018 @jira.link.relates_to.NOV-101021 @manual
  @mobile @smoke @vivobr
  Scenario Outline: <account_type> user can select a month with a disputed bill in the "Minhas faturas" screen
    internal_checkpoint="Any invoice (paid, zero amount, pending, delayed) can be disputed.
    In this case, the status of the invoice will display the sufix '- Contestada'."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Contestada" text is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_risked_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Boleto atualizado" text on the "title" field is displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3963 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3964 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3965 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> user can select a month with a no-disputed bill in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "no_contested" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield that contains the "Contestada" text is not displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_risked_textfield" textfield is not displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the card with "Boleto atualizado" text on the "title" field is not displayed in the "bills_summary.buttons_carousel" carousel
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3966 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3967 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3968 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101039 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> user can select a month with only a bill in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "1" invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.amount_textfield" and the "total_amount" amounts are the same
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3969 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3970 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3971 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101040 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: <account_type> user can select a month with several bills in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "2" invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "bills_summary.other_status_textfield" textfield is displayed
      And the "bills_summary.other_title_textfield" textfield with the "Fatura de MONTH" format is displayed
      And the "bills_summary.other_expiration_date_textfield" textfield is displayed
      And the "bills_summary.other_amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.other_buttons_carousel" carousel is displayed
      And the "bills_summary.other_see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the sum of the "bills_summary.amount_textfield" value and the "bills_summary.other_amount_textfield" value is the same as the "invoice_chart_header.selection_amount" value

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3972 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3973 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3974 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101041 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> user can select a month without bills in the "Minhas faturas" screen
    other_affected_versions="2021-45-B"
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "no" invoice
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
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

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3975 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3976 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3977 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101042 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: <account_type> user can select a month with a bill in the "Minhas faturas" screen but an error occurs
    internal_checkpoint="The graph won't show any bar in the month that has failed loading."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a different month than the selected in the "invoice_chart_header" invoices chart
      And there is an API error when requesting the billing information
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with "-,--" text is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "bills_summary.bills_error_title_textfield" textfield with "[LANG:bills.month_error.bills_error_title]" text is displayed
      And the "bills_summary.bills_error_subtitle_textfield" textfield with "[LANG:bills.month_error.bills_error_subtitle]" text is displayed
      And the "bills_summary.bills_error_refresh_icon" icon is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3978 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3979 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3980 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101045 @live @mobile @next @qa @regression
  @vivobr @old_app
  Scenario Outline: A <account_type> user can switch among months in the "Minhas faturas" screen
    Given user is in the "Account" page
      And user has a "<account_type>" account type
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on a different month than the selected in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(R\$ -?\d+(?:.\d+)*,\d\d|-,--)" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | ber | jira_id      |
          | 11.12 | beatrix      |            | QANOV-21949      |     | QANOV-340491 |
          | 11.12 | multivivo    |            | QANOV-21949      | ber | QANOV-340492 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      |     | QANOV-340493 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-101047 @live @mobile @next @regression @vivobr
  Scenario Outline: User can go back to the account dashboard from the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Account" page is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3984 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3985 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3986 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163733 @manual @mobile @regression @vivobr
  Scenario Outline: User with 6 or less months with bills won't see the bills graph paginated
    Given user has a "<account_type>" account type
      And user has invoices for "<=6" months
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "invoice_chart_header" graph is not paginated

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3987 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3988 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3989 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163682 @manual @mobile @regression @vivobr
  Scenario Outline: User with more than 6 months with bills will see the bills graph paginated
    Given user has a "<account_type>" account type
      And user has invoices for ">6" months
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "invoice_chart_header" graph is paginated

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3990 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3991 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3992 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-163682 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> user can see bills older than 6 months (up to 12)
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has invoices for ">6" months
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When swipes the "invoice_chart_header.carousel" carousel in "right" direction
      And clicks on a different month than the selected in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is displayed
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-3993 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-3994 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-3995 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: <account_type> user without bills can access to the "Minhas faturas" screen during a maintenance window
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user does not have invoices
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     When clicks on the "bills.empty_case.button" button
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "[LANG:bills.no_bills.no_bills_title]" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "[LANG:bills.no_bills.no_bills_subtitle]" text is displayed
      And the "bills_payment_module" module is not displayed
      And the "bills_send_module" module is not displayed
      And the "bills_more_info_module" module is not displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-323126 |
          | multivivo    |     | QANOV-323127 |
          | convergente  |     | QANOV-323128 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @sanity
  @vivobr @old_app
  Scenario Outline: A <account_type> user with bills can access to the "Minhas faturas" screen during a maintenance window
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has invoices
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     When clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Total da fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_chart_header.carousel" list is displayed
      And the "last" month is selected in the bills graph
      And the "invoice_chart_header.average_amount" textfield with the "Média de R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary_module" module is displayed
      And the "bills_summary.status_textfield" textfield is displayed
      And the "bills_summary.title_textfield" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format is displayed
      And the "bills_summary.expiration_date_textfield" textfield is displayed
      And the "bills_summary.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.buttons_carousel" carousel is not displayed
      And the "bills_summary.see_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "bills_payment_module" module is not displayed
      And the "bills_send_module" module is not displayed
      And the "bills_more_info_module" module is not displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-323129 |
          | multivivo    |     | QANOV-323130 |
          | convergente  |     | QANOV-323131 |

# -*- coding: utf-8 -*-
@jira.QANOV-126820
Feature: Invoice Details


  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.detects.NOVUMCC-4560
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-21949 @jira.link.relates_to.NOV-163923
  @mobile @smoke @vivobr @old_app
  Scenario Outline: User <status> with only a monoline plan associated to an invoice can access to the "Detalhes da fatura" screen
    internal_checkpoint="Monthly charges: plan amount, recurrent packs, other SVAs with monthly payment.
    Extra charges: expenses not related with the billing cycle (additional package, international call, ...).
    Other charges: expenses related to interest and fines (multa do plano, juros do plano, ...).
    For pending or delayed bills, the 'Copiar Código de Barras' button will also be displayed.
    For paid or zero amount bills, the '2ª via da fatura' button will also be displayed."
    Given user has a "beatrix" account type
      And user has a "any" plan in "<status>" status
      And user has "1" plans associated to the same invoice
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "Detalhes da fatura" header is displayed
      And the "invoice_header" module is displayed
      And the "invoice_header.bill_status_text" textfield is displayed
      And the "invoice_header.bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "invoice_header.bill_expiration_date" textfield is displayed
      And the "invoice_header.bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body" module is displayed
      And the "invoice_body.plan_name" textfield is displayed
      And the "invoice_body.plan_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.plan_label" textfield with "Celular" text is displayed
      And the "invoice_body.mobile_icon" icon is displayed
      And the "invoice_body.mobile_label" textfield with "Celular" text is displayed
      And the "invoice_body.mobile_total_charges" textfield with the "R\$ [-]?\d+,\d\d" format is displayed
      And the "invoice_body.mobile_number" textfield is displayed
      And the "invoice_body.mobile_number_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.mobile_monthly_charges_text" textfield with "Gastos mensais" text is displayed
      And the "invoice_body.mobile_monthly_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.mobile_extra_charges_text" textfield with "Gastos extras" text is displayed
      And the "invoice_body.mobile_extra_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.other_charges_title" textfield with "Outros Lançamentos" text is displayed
      And the "invoice_body.other_charges_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.bill_message" textfield that contains the "Gastos referentes ao valor original da fatura no período de" text is displayed
      And the "invoice_body.bill_link" link with "Mais opções" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    @automatic @live @next @qa
    Examples:
          | status | ber | parent_test_plan | cv    | jira_id      |
          | active | ber |                  | 11.12 | QANOV-340452 |

    @manual
    Examples:
          | status    | ber | parent_test_plan | cv    | jira_id      |
          | pending   |     |                  | 11.12 | QANOV-403080 |
          | cancelled |     | QANOV-360674     | 14.11 | QANOV-403081 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.VIVO-1852 @jira.link.detects.VIVO-1881
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-21949 @jira.link.relates_to.NOV-185685
  @mobile @smoke @vivobr @old_app
  Scenario Outline: User <status> with only a multivivo plan associated to an invoice can access to the "Detalhes da fatura" screen
    internal_checkpoint="Monthly charges: plan amount, recurrent packs, other SVAs with monthly payment.
    Extra charges: expenses not related with the billing cycle (additional package, international call, ...).
    Other charges: expenses related to interest and fines (multa do plano, juros do plano, ...).
    The first element in the mobile_phones_list will correspond with the admin line.
    For pending or delayed bills, the Copiar Código de Barras button will also be displayed.
    For paid or zero amount bills, the 2ª via da fatura button will also be displayed."
    Given user has a "multivivo" account type
      And user has a "any" plan in "<status>" status
      And user has "1" plans associated to the same invoice
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "Detalhes da fatura" header is displayed
      And the "invoice_header" module is displayed
      And the "invoice_header.bill_status_text" textfield is displayed
      And the "invoice_header.bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "invoice_header.bill_expiration_date" textfield is displayed
      And the "invoice_header.bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body" module is displayed
      And the "invoice_body.plan_name" textfield is displayed
      And the "invoice_body.plan_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.plan_label" textfield with "Celular" text is displayed
      And the "invoice_body.mobile_phones_list" list is displayed
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_icon" field
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_label" textfield with "Celular" text
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_total_charges" textfield with the "R\$ [-]?\d+,\d\d" format
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_number" field
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_number_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_monthly_charges_text" textfield with "Gastos mensais" text
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_monthly_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_extra_charges_text" textfield with "Gastos extras" text
      And each element in the "invoice_body.mobile_phones_list" list has the "mobile_extra_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And the "invoice_body.other_charges_title" textfield with "Outros Lançamentos" text is displayed
      And the "invoice_body.other_charges_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.bill_message" textfield that contains the "Gastos referentes ao valor original da fatura no período de" text is displayed
      And the "invoice_body.bill_link" link with "Mais opções" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    @automatic @live @next @qa
    Examples:
          | status | parent_test_plan | cv    | jira_id    |
          | active |                  | 11.12 | QANOV-4105 |

    @manual
    Examples:
          | status    | parent_test_plan | cv    | jira_id      |
          | pending   |                  | 11.12 | QANOV-403082 |
          | cancelled | QANOV-360674     | 14.11 | QANOV-403083 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-3949 @jira.link.detects.NOVUMCC-4560
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-21791 @mobile @sanity @vivobr @old_app
  Scenario Outline: User <status> with only a convergente plan associated to an invoice can access to the "Detalhes da fatura" screen
    internal_checkpoint="Monthly charges: plan amount, recurrent packs, other SVAs with monthly payment.
    Extra charges: expenses not related with the billing cycle (additional package, international call, ...).
    Other charges: expenses related to interest and fines (multa do plano, juros do plano, ...).
    For pending or delayed bills, the 'Copiar Código de Barras' button will also be displayed.
    For paid or zero amount bills, the '2ª via da fatura' button will also be displayed.
    Inside a combo the hierarchy is: 1) Móvel titular; 2) Móvel dependentes; 3) Banda larga; 4) TV; 5) Voz Fixa"
    Given user has a "convergente" account type
      And user has a "any" plan in "<status>" status
      And user has "1" plans associated to the same invoice
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "Detalhes da fatura" header is displayed
      And the "invoice_header" module is displayed
      And the "invoice_header.bill_status_text" textfield is displayed
      And the "invoice_header.bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "invoice_header.bill_expiration_date" textfield is displayed
      And the "invoice_header.bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body" module is displayed
      And the "invoice_body.plan_name" textfield is displayed
      And the "invoice_body.plan_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.plan_label" textfield is displayed
      And the "invoice_body.products_list" list is displayed
      And each element in the "invoice_body.products_list" list has the "product_icon" field
      And each element in the "invoice_body.products_list" list has the "product_name" field
      And each element in the "invoice_body.products_list" list has the "product_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.products_list" list has the "monthly_charges_text" textfield with "Gastos mensais" text
      And each element in the "invoice_body.products_list" list has the "monthly_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.products_list" list has the "extra_charges_text" textfield with "Gastos extras" text
      And each element in the "invoice_body.products_list" list has the "extra_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And the "invoice_body.other_charges_title" textfield with "Outros Lançamentos" text is displayed
      And the "invoice_body.other_charges_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.bill_message" textfield that contains the "Gastos referentes ao valor original da fatura no período de" text is displayed
      And the "invoice_body.bill_link" link with "Mais opções" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    @automatic @live @next @qa
    Examples:
          | status | ber | parent_test_plan | cv   | jira_id    |
          | active | ber |                  | 12.0 | QANOV-4106 |

    @manual
    Examples:
          | status    | ber | parent_test_plan | cv    | jira_id      |
          | pending   |     |                  | 12.0  | QANOV-403084 |
          | cancelled |     | QANOV-360674     | 14.11 | QANOV-403085 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-185686 @manual @mobile @regression @vivobr
  Scenario Outline: User with several plans associated to the same invoice can access to the "Detalhes da fatura" screen
    internal_checkpoint="Monthly charges (mandatory): plan amount, recurrent packs, other SVAs with monthly payment.
    Extra charges (optional): expenses not related with the billing cycle (additional package, international call, ...).
    Other charges (mandatory): expenses related to interest and fines (multa do plano, juros do plano, ...).
    For pending or delayed bills, the 'Copiar Código de Barras' button will also be displayed.
    For paid or zero amount bills, the '2ª via da fatura' button will also be displayed.
    The hierarchy to present those plans is: 1) combo; 2) movel; 3) banda larga (fibra); 4) TV; 5) Voz Fixa."
    Given user has a "<account_type>" account type
      And user has "several" plans associated to the same invoice
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "Detalhes da fatura" header is displayed
      And the "invoice_header" module is displayed
      And the "invoice_header.bill_status_text" textfield is displayed
      And the "invoice_header.bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "invoice_header.bill_expiration_date" textfield is displayed
      And the "invoice_header.bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.plans_list" list is displayed
      And each element in the "invoice_body.plans_list" list has the "plan" field
      And each element in the "invoice_body.plans_list" list has the "plan_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.plans_list" list has the "label" field
      And each element in the "invoice_body.plans_list" list has the "chevron" field
      And the "invoice_body.other_charges_title" textfield with "Outros Lançamentos" text is displayed
      And the "invoice_body.other_charges_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.bill_message" textfield that contains the "Gastos referentes ao valor original da fatura no período de" text is displayed
      And the "invoice_body.bill_link" link with "Mais opções" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | impeded      | automation              | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      |              |                         | QANOV-4107 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-4108 |
          | 11.12 | multivivo    |            | QANOV-21949      |              |                         | QANOV-4109 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> Dependent user can access to the "Detalhes da fatura" screen
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "dependent" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the month with "any" bill in the "bills_graph" graph
      And clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "Detalhes da fatura" header is displayed

    Examples:
          | account_type | depends_on | cv    | parent_test_plan | impeded      | automation              | jira_id     |
          | multivivo    |            | 11.12 | QANOV-21949      |              |                         | QANOV-4110  |
          | convergente  | QANOV-3949 | 12.0  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-44943 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.VIVO-1852
  @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @regression @vivobr @old_app
  Scenario Outline: User who is in the "Detalhes da fatura" screen of a paid bill can see the "2ª via da fatura" button
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "paid" invoice
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
      And the "Bill Details" page is displayed
      And clicks on the "invoice_body.bill_link" link
     Then the "bill_button" button with "2ª via de fatura" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4116 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-4117 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4118 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: User who is in the "Detalhes da fatura" screen of a zero-amount bill can see the "2ª via da fatura" button and a specific message
    internal_checkpoint="For zero-amount bills, a message is displayed saying that the expenses
    will be charged in the next bill."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "zero_amount" invoice
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
      And the "Bill Details" page is displayed
      And the "bill_button" button with "2ª via da fatura" text is displayed
      And the "bill_link" link with "Mais opções" text is displayed
      And clicks on the "more_options" link
     Then the "bill_button" button with "2ª via da fatura" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4119 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-4120 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4121 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User who is in the "Detalhes da fatura" screen of a pending bill can see the "Copiar Código de Barras" button
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "pending" invoice
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "bill_button" button with "Copiar Código de Barras" text is displayed
      And the "bill_link" link with "Mais opções" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | detects   | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      |           | QANOV-4122 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | VIVO-2272 | QANOV-4123 |
          | 11.12 | multivivo    |            | QANOV-21949      |           | QANOV-4124 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: User who is in the "Detalhes da fatura" screen of a delayed bill can see the "Copiar Código de Barras" button
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "delayed" bill
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "bill_button" button with "Copiar Código de Barras" text is displayed
      And the "invoice_body.bill_link" link with "Mais opções" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4125 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-4126 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4127 |

  @jira.QANOV-223868 @android @automatic @ber @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458
  @jira.link.relates_to.QANOV-4122 @mobile @qa @sanity @vivobr @old_app
  Scenario: A no legacy who is in the "Detalhes da fatura" screen of a pending bill can see the "Pagar fatura" button
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has a month with "unpaid" bill
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "pay_bill_button" button with "Pagar fatura" text is displayed
      And the "invoice_body.bill_link" link with "Mais opções" text is displayed

  @jira.QANOV-283331 @android @ios @jira.cv.13.9 @jira.link.parent_test_plan.QANOV-217458 @jira.link.relates_to.QANOV-4122
  @manual @mobile @sanity @vivobr @old_app
  Scenario: A no legacy who is in the "Detalhes da fatura" screen of a paid bill cannot see the "Pagar fatura" button
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has a month with "paid" bill
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "pay_bill_button" button is not displayed
      And the "bill_more_options" link with "Mais opções" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr
  Scenario Outline: User who is in the "Detalhes da fatura" screen of a disputed bill can see the previous amount risked
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a month with "contested" bill
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "bill_amount_risked" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4128 |
          | 12.0  | convergente  | QANOV-3949 | QANOV-21791      | QANOV-4129 |
          | 11.12 | multivivo    |            | QANOV-21949      | QANOV-4130 |

  @jira.<jira_id> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can download an original bill on android devices from the "Detalhes da fatura" screen
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has a month with "<bill_status>" bill
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
      And the "Bill Details" page is displayed
      And clicks on the "bill_button" button
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

    Examples:
          | cv    | account_type | bill_status | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | paid        | QANOV-4116 | QANOV-21949      | QANOV-4131 |
          | 11.12 | beatrix      | zero_amount | QANOV-4119 | QANOV-21949      | QANOV-4132 |
          | 12.0  | convergente  | paid        | QANOV-4117 | QANOV-21791      | QANOV-4133 |
          | 12.0  | convergente  | zero_amount | QANOV-4120 | QANOV-21791      | QANOV-4134 |
          | 11.12 | multivivo    | paid        | QANOV-4118 | QANOV-21949      | QANOV-4135 |
          | 11.12 | multivivo    | zero_amount | QANOV-4121 | QANOV-21949      | QANOV-4136 |

  @jira.<jira_id> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can open an original bill on iOS devices from the "Detalhes da fatura" screen
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has a month with "<bill_status>" bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_details_link" link
      And the "Bill Details" page is displayed
      And clicks on the "bill_button" button
     Then the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | cv    | account_type | bill_status | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | paid        | QANOV-4116 | QANOV-21949      | QANOV-4137 |
          | 11.12 | beatrix      | zero_amount | QANOV-4119 | QANOV-21949      | QANOV-4138 |
          | 12.0  | convergente  | paid        | QANOV-4117 | QANOV-21791      | QANOV-4139 |
          | 12.0  | convergente  | zero_amount | QANOV-4120 | QANOV-21791      | QANOV-4140 |
          | 11.12 | multivivo    | paid        | QANOV-4118 | QANOV-21949      | QANOV-4141 |
          | 11.12 | multivivo    | zero_amount | QANOV-4121 | QANOV-21949      | QANOV-4142 |

  @jira.QANOV-223869 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458 @jira.link.relates_to.QANOV-4143
  @manual @mobile @smoke @vivobr @old_app
  Scenario: A no legacy user can start payment from the "Detalhes da fatura" screen
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "admin" role
      And has "several" bills in "unpaid" status in any subscription
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And user is in the "Bills" page
      And clicks on the "bills_summary.see_details_link" link
      And the "Bill Details" page is displayed
      And clicks on the "pay_bill_button" link
     Then the "Bill Selection" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-185688 @manual @mobile @regression @vivobr
  Scenario Outline: User can see several options when tapping on the "Mais opções" link
    internal_checkpoint="Different options will be displayed depending on the bill's status. Different options are:
    2ª via de fatura, Boleto atualizado, Enviar por e-mail."
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the month with "any" bill in the "bills_graph" graph
      And clicks on the "bills_summary.see_details_link" link
      And the "Bill Details" page is displayed
      And clicks on the "bill_link" link
     Then the "options_list" list is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      |            | QANOV-21949      | QANOV-4149 |
          | 12.0  | convergente  | QANOV-4106 | QANOV-21791      | QANOV-4150 |
          | 11.12 | multivivo    | QANOV-4105 | QANOV-21949      | QANOV-4151 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: User with only a plan associated to an invoice can access to the "Detalhes da fatura" screen during a maintenance window
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has invoices
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_details_link" link
     Then the "Bill Details" page is displayed
      And the "Detalhes da fatura" header is displayed
      And the "invoice_header" module is displayed
      And the "invoice_header.bill_status_text" textfield is displayed
      And the "invoice_header.bill_month" textfield with the "Fatura de (Janeiro|Fevereiro|Março|Abril|Maio|Junho|Julho|Agosto|Setembro|Outubro|Novembro|Dezembro)" format is displayed
      And the "invoice_header.bill_expiration_date" textfield is displayed
      And the "invoice_header.bill_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body" module is displayed
      And the "invoice_body.plan_name" textfield is displayed
      And the "invoice_body.plan_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.plan_label" textfield is displayed
      And the "invoice_body.products_list" list is displayed
      And each element in the "invoice_body.products_list" list has the "product_icon" field
      And each element in the "invoice_body.products_list" list has the "product_name" field
      And each element in the "invoice_body.products_list" list has the "product_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.products_list" list has the "monthly_charges_text" textfield with "Gastos mensais" text
      And each element in the "invoice_body.products_list" list has the "monthly_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "invoice_body.products_list" list has the "extra_charges_text" textfield with "Gastos extras" text
      And each element in the "invoice_body.products_list" list has the "extra_charges_amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format
      And the "invoice_body.other_charges_title" textfield with "Outros Lançamentos" text is displayed
      And the "invoice_body.other_charges_total_charges" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "invoice_body.bill_message" textfield that contains the "Gastos referentes ao valor original da fatura no período de" text is displayed
      And the "invoice_body.bill_link" link is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed
      And the "Minhas faturas" header is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-323123 |
          | multivivo    |     | QANOV-323124 |
          | convergente  |     | QANOV-323125 |

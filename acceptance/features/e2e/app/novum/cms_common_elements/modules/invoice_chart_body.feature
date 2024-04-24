# -*- coding: utf-8 -*-
@jira.QANOV-384342
Feature: Invoice Chart Body


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_default
  Scenario Outline: A user without invoices will see an Empty case in the Invoices Chart Body module with the default icon
    To be executed in QA
    Given user has no bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body_empty_case" element is visible
     Then the "src" property of the "invoice_chart_body_empty_case.icon" element contains the "bundles" text

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-384343 |
          | o2es    | Future | QANOV-556208 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_with_icon
  Scenario Outline: A user without invoices will see an Empty case in the Invoices Chart Body module with a changed icon
    To be executed in QA
    Given user has no bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body_empty_case" element is visible
     Then the "src" property of the "invoice_chart_body_empty_case.icon" element matches "[CONTEXT:detail_cards_of_invoices_per_month___tied_to_chart_header.emptyStateIcon.url]" text

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-384344 |
          | o2es    | Future | QANOV-556209 |

  @jira.QANOV-384345 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_default
  Scenario: A user with invoices will see the Invoices Chart Body module with the default texts and icons
    To be executed in QA
    Given user has bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body" element is present
     Then the "invoice_chart_body.invoice_duplicate.title" textfield with "Duplicado de factura" text is displayed
      And the "invoice_chart_body.invoice_duplicate.icon" element has the "svg" tag name
      And the "invoice_chart_body.invoice_claim.title" textfield with "Reclamaciones" text is displayed
      And the "invoice_chart_body.invoice_claim.icon" element has the "svg" tag name

  @jira.QANOV-384346 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_with_duplicate_text_changed
  Scenario: A user with invoices will see the Invoices Chart Body module with the the invoice_duplicate text changed
    To be executed in QA
    Given user has bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body" element is present
     Then the "invoice_chart_body.invoice_duplicate.title" textfield with "[CONTEXT:detail_cards_of_invoices_per_month___tied_to_chart_header.cmsScrollableActions.0.text]" text is displayed

  @jira.QANOV-384347 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_with_duplicate_icon_changed
  Scenario: A user with invoices will see the Invoices Chart Body module with the the invoice_duplicate icon changed
    To be executed in QA
    Given user has bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body" element is present
     Then the "src" property of the "invoice_chart_body.invoice_duplicate.icon" element matches "[CONTEXT:detail_cards_of_invoices_per_month___tied_to_chart_header.cmsScrollableActions.0.icon.url]" text

  @jira.QANOV-384348 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_with_invoice_claim_text_changed
  Scenario: A user with invoices will see the Invoices Chart Body module with the the invoice_claim text changed
    To be executed in QA
    Given user has bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body" element is present
     Then the "invoice_chart_body.invoice_claim.title" textfield with "[CONTEXT:detail_cards_of_invoices_per_month___tied_to_chart_header.cmsScrollableActions.0.text]" text is displayed

  @jira.QANOV-384349 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_with_invoice_claim_icon_changed
  Scenario: A user with invoices will see the Invoices Chart Body module with the the invoice_claim icon changed
    To be executed in QA
    Given user has bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body" element is present
     Then the "src" property of the "invoice_chart_body.invoice_claim.icon" element matches "[CONTEXT:detail_cards_of_invoices_per_month___tied_to_chart_header.cmsScrollableActions.0.icon.url]" text

  @jira.<jira_id> @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoice_chart_body_with_invoice_<status>_status_text_changed
  Scenario Outline: A user with invoices will see the Invoices Chart Body module with the the invoice_status_text changed for a <status> invoice
    To be executed in QA
    Given user has bills
      And the "Detail cards of invoices per month - tied to chart header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "invoice_chart_body" element is present
     Then the "invoice_chart_body.bills_summary.tag" textfield with "<text>" text is displayed

    Examples:
          | status  | text          | jira_id      |
          | late    | QA vencida    | QANOV-392844 |
          | sent    | QA abierta    | QANOV-392845 |
          | ongoing | QA procesando | QANOV-392846 |
          | refund  | QA a favor    | QANOV-392847 |

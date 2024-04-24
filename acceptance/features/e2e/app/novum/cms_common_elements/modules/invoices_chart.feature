# -*- coding: utf-8 -*-
@jira.QANOV-408348
Feature: Invoices Chart


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.invoices_chart
  Scenario Outline: A user with bills can see Invoices chart without title
    To be executed in QA
    Given user has bills
      And the "Invoices chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "invoices_chart" element is visible
     Then the "invoices_chart.title" textfield is not displayed
      And the "invoices_chart.chart" element is on display

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-408349 |
          | o2de    | QANOV-554847 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.invoices_chart_with_title
  Scenario Outline: A user with bills can see Invoices chart with title
    To be executed in QA
    Given user has bills
      And the "Invoices chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "invoices_chart" element is visible
     Then the "invoices_chart.title" textfield with "[CONTEXT:invoices_chart.moduleTitle]" text is displayed
      And the "invoices_chart.chart" element is on display

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-408350 |
          | o2de    | QANOV-554848 |

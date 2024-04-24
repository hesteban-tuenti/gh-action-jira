# -*- coding: utf-8 -*-
@jira.QANOV-406466
Feature: Roaming usage per zone


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.roaming_usage_per_zone
  Scenario Outline: A <product> user can see a Roaming usage per zone empty case module configured with the default fields
    To be executed in QA
    Given user has a "mobile_line" product
      And user has a "mobile_line" product without "international_data" extra charges
      And the "Roaming usage per zone" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Roaming usage per zone" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "roaming_usage_per_zone" element is visible
     Then the "roaming_usage_per_zone.empty_case.icon" icon is displayed
      And the "roaming_usage_per_zone.empty_case.title" textfield with "[CONTEXT:roaming_usage_per_zone.emptyStateCardTitle]" text is displayed
      And the "roaming_usage_per_zone.empty_case.description" textfield is not displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-406467 |
          | o2de    | 24.0 | QANOV-406468 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.roaming_usage_per_zone_with_empty_case_description
  Scenario Outline: A <product> user can see a Roaming usage per zone empty case module configured with empty case description
    To be executed in QA
    Given user has a "mobile_line" product
      And user has a "mobile_line" product without "international_data" extra charges
      And the "Roaming usage per zone" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Roaming usage per zone" module configured in CMS has the "emptyStateCardDescription" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "roaming_usage_per_zone" element is visible
     Then the "roaming_usage_per_zone.empty_case.icon" icon is displayed
      And the "roaming_usage_per_zone.empty_case.title" textfield with "[CONTEXT:roaming_usage_per_zone.emptyStateCardTitle]" text is displayed
      And the "roaming_usage_per_zone.empty_case.description" textfield with "[CONTEXT:roaming_usage_per_zone.emptyStateCardDescription]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-406469 |
          | o2de    | 24.0 | QANOV-406470 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.roaming_usage_per_zone_with_module_title
  Scenario Outline: A <product> user can see a Roaming usage per zone module configured with module title
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Roaming usage per zone" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Roaming usage per zone" module configured in CMS has the "title" filled
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "roaming_usage_per_zone" element is visible
     Then the "roaming_usage_per_zone.module_title" textfield with "[CONTEXT:roaming_usage_per_zone.title]" text is displayed
      And the "roaming_usage_per_zone" module is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-406471 |
          | o2de    | 24.0 | QANOV-406472 |

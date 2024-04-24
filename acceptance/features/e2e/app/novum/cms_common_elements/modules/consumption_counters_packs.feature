# -*- coding: utf-8 -*-
@jira.QANOV-406201
Feature: Consumption Counters Packs


  @jira.<jira_id> @<product> @<test_priority> @automatic @jira.cv.14.5 @android @ios @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_packs_<data_type>_type
  Scenario Outline: A <product> user can see a Consumption Counter Packs module configured with the mandatory fields for the <data_type> type
    To be executed in QA
    Given user has a "prepay" account type
      And user has "<data_type>" allowances in the "mobile_line" product
      And the "Consumption counter packs" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counter packs" configured in CMS has only the mandatory fields filled
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "consumption_counters_packs" element is visible
     Then the "consumption_counters_packs.module_title" textfield with "[CONTEXT:consumption_counter_packs.categoryTitle]" text is displayed
      And the "consumption_counters_packs.bundle_list" list is displayed
      And each element in the "consumption_counters_packs.bundle_list" list has the "icon" field
      And each element in the "consumption_counters_packs.bundle_list" list has the "title" field

    Examples:
          | product | data_type | test_priority | jira_id      |
          | blaude  | data      | sanity        | QANOV-406202 |
          | blaude  | messages  | smoke         | QANOV-406203 |
          | blaude  | minutes   | regression    | QANOV-406204 |
          | blaude  | units     | regression    | QANOV-406205 |
          | o2de    | data      | smoke         | QANOV-406206 |
          | o2de    | messages  | regression    | QANOV-406207 |
          | o2de    | minutes   | sanity        | QANOV-406208 |
          | o2de    | units     | regression    | QANOV-406209 |

  @jira.<jira_id> @<product> @<test_priority> @automatic @jira.cv.14.5 @android @ios @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_packs_<data_type>_type_with_empty_case
  Scenario Outline: A <product> user can see a Consumption Counter Packs module configured with the empty case for the <data_type> type when user hasn't allowances
    To be executed in QA
    Given user has a "prepay" account type
      And user has no "<data_type>" allowances in the "mobile_line" product
      And the "Consumption counter packs" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counter packs" module configured in CMS has the "emptyCaseTitle" filled
      And the "Consumption counter packs" module configured in CMS has the "emptyCaseDescription" filled
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "consumption_counters_packs" element is visible
     Then the "consumption_counters_packs.module_title" textfield is not displayed
      And the "consumption_counters_packs.empty_case.icon" icon is displayed
      And the "consumption_counters_packs.empty_case.title" textfield with "[CONTEXT:consumption_counter_packs.emptyCaseTitle]" text is displayed
      And the "consumption_counters_packs.empty_case.description" textfield with "[CONTEXT:consumption_counter_packs.emptyCaseDescription]" text is displayed

    Examples:
          | product | data_type | test_priority | jira_id      |
          | blaude  | data      | regression    | QANOV-406210 |
          | blaude  | messages  | regression    | QANOV-406211 |
          | blaude  | minutes   | regression    | QANOV-406212 |
          | blaude  | units     | smoke         | QANOV-406213 |
          | o2de    | data      | regression    | QANOV-406214 |
          | o2de    | messages  | regression    | QANOV-406215 |
          | o2de    | minutes   | smoke         | QANOV-406216 |
          | o2de    | units     | regression    | QANOV-406217 |

  @jira.<jira_id> @<product> @<test_priority> @automatic @jira.cv.14.5 @android @ios @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_packs_<data_type>_type_with_empty_case
  Scenario Outline: A <product> user can see a Consumption Counter Packs module configured with the empty case for the <data_type> type when user has allowances
    To be executed in QA
    Given user has a "prepay" account type
      And user has "<data_type>" allowances in the "mobile_line" product
      And the "Consumption counter packs" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counter packs" module configured in CMS has the "emptyCaseTitle" filled
      And the "Consumption counter packs" module configured in CMS has the "emptyCaseDescription" filled
     When user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "consumption_counters_packs" element is visible
     Then the "consumption_counters_packs.module_title" textfield with "[CONTEXT:consumption_counter_packs.categoryTitle]" text is displayed
      And the "consumption_counters_packs.bundle_list" list is displayed
      And each element in the "consumption_counters_packs.bundle_list" list has the "icon" field
      And each element in the "consumption_counters_packs.bundle_list" list has the "title" field

    Examples:
          | product | data_type | test_priority | jira_id      |
          | blaude  | data      | regression    | QANOV-406218 |
          | blaude  | messages  | sanity        | QANOV-406219 |
          | blaude  | minutes   | regression    | QANOV-406220 |
          | blaude  | units     | smoke         | QANOV-406221 |
          | o2de    | data      | regression    | QANOV-406222 |
          | o2de    | messages  | regression    | QANOV-406223 |
          | o2de    | minutes   | smoke         | QANOV-406224 |
          | o2de    | units     | sanity        | QANOV-406225 |

# -*- coding: utf-8 -*-
@jira.QANOV-390084
Feature: Consumption Counters Parts


  @jira.<jira_id> @<product> @<test_priority> @android @automatic @ios @jira.cv.14.5 @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_parts_<data_type>_type
  Scenario Outline: A <product> user can see a Consumption Counter Parts module configured with the default fields for the <data_type> type
    To be executed in QA
    Given user has a "postpay" account type
      And user has "<data_type>" allowances in the "mobile_line" product
      And the "<module_name>" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "<module_name>" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_counters_parts.bundle_list" list is displayed
      And each element in the "consumption_counters_parts.bundle_list" list has the "icon" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "title" field

    Examples:
          | product | data_type | module_name                         | test_priority | jira_id      |
          | moves   | data      | Consumption counters detailed parts | regression    | QANOV-390085 |
          | moves   | messages  | Consumption counters detailed parts | sanity        | QANOV-390086 |
          | moves   | minutes   | Consumption counters detailed parts | smoke         | QANOV-390087 |
          | o2uk    | data      | Consumption counters parts          | smoke         | QANOV-390091 |
          | o2uk    | messages  | Consumption counters parts          | regression    | QANOV-390092 |
          | o2uk    | minutes   | Consumption counters parts          | sanity        | QANOV-390093 |

    @old_app
    Examples:
          | product | data_type | module_name                         | test_priority | jira_id      |
          | vivobr  | data      | Consumption counters detailed parts | sanity        | QANOV-390088 |
          | vivobr  | messages  | Consumption counters detailed parts | smoke         | QANOV-390089 |
          | vivobr  | minutes   | Consumption counters detailed parts | regression    | QANOV-390090 |

  @jira.QANOV-390094 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_parts_data_with_title
  Scenario: A user can see the Consumption Counter Parts module with a module title when configured
    To be executed in QA
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the "Consumption counters detailed parts" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counters detailed parts" module configured in CMS has the "categoryTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_counters_parts.module_title" textfield with "QA test Consumption counter parts - Module title" text is displayed
      And the "consumption_counters_parts.bundle_list" list is displayed
      And each element in the "consumption_counters_parts.bundle_list" list has the "icon" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "title" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "subtitle" field

  @jira.QANOV-390095 @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_parts_data_without_subtitle
  Scenario: A user can see the Consumption Counter Parts module with a subtitle when configured with no subtitle value
    To be executed in QA
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the "Consumption counters detailed parts" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counters detailed parts" module configured in CMS has the "subtitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_counters_parts.bundle_list" list is displayed
      And each element in the "consumption_counters_parts.bundle_list" list has the "icon" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "title" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "subtitle" field
      And no element in the "consumption_counters_parts.bundle_list" list has the "subtitle2" field

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counter_parts_<allowance_type>_with_<subtitle_value>_subtitle
  Scenario Outline: A user can see the Consumption Counter Parts module with a subtitle when configured with <subtitle_value> value
    To be executed in QA
    Given user has a "postpay" account type
      And user has "<allowance_type>" allowances with "<subtitle_value>" date
      And the "Consumption counters detailed parts" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counters detailed parts" module configured in CMS has the "subtitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_counters_parts.bundle_list" list is displayed
      And each element in the "consumption_counters_parts.bundle_list" list has the "icon" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "title" field
      And each element in the "consumption_counters_parts.bundle_list" list has the "subtitle" field
      And any element in the "consumption_counters_parts.bundle_list" list has the "subtitle2" textfield with the "<format>" format

    Examples:
          | allowance_type | subtitle_value        | format                                         | jira_id      |
          | minutes        | renewal               | Renova em \d{2}/\w{3}                          | QANOV-390096 |
          | data           | expiration            | Válido até \d\d/\w{3}                          | QANOV-390097 |
          | data           | renewal_or_expiration | (Renova em \d{2}/\w{3}\|Válido até \d\d/\w{3}) | QANOV-390099 |

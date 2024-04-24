# -*- coding: utf-8 -*-
@jira.QANOV-416715
Feature: Data Consumption


  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @android @ios @mobile @qa @sanity @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.data_consumption
  Scenario Outline: A <product> user can see a Data consumption by SIM module configured with the default fields
    To be executed in QA
    Given user has a "postpay" account type
      And user has data allowance for "any" origin
      And the "Data consumption by SIM" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "data_consumption" element is visible
     Then the "data_consumption.module_title" textfield is displayed
      And the "data_consumption.progress_bar" progress bar is displayed
      And each element in the "data_consumption.sim_list" list has the "icon" field
      And each element in the "data_consumption.sim_list" list has the "title" field
      And each element in the "data_consumption.sim_list" list has the "subtitle" field
      And no element in the "data_consumption.sim_list" list has the "consumption" field

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-416716 |
          | o2de    | 24.0 | QANOV-416717 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @android @ios @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.data_consumption_with_detailed_consumption
  Scenario Outline: A user can see a Data consumption by SIM module with the detailed consumption active
    To be executed in QA
    Given user has a "postpay" account type
      And user has data allowance for "any" origin
      And the "Data consumption by SIM" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "data_consumption" element is visible
     Then the "data_consumption.module_title" textfield is displayed
      And the "data_consumption.multicolor_progress_bar" progress bar is displayed
      And each element in the "data_consumption.sim_list" list has the "icon" field
      And each element in the "data_consumption.sim_list" list has the "title" field
      And each element in the "data_consumption.sim_list" list has the "subtitle" field
      And each element in the "data_consumption.sim_list" list has the "consumption" field

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-416718 |
          | o2de    | 24.0 | QANOV-416719 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @android @ios @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.data_consumption_for_<origin>_origin
  Scenario Outline: A user can see a Data consumption by SIM module with <origin> origin
    To be executed in QA
    Given user has a "postpay" account type
      And user has data allowance for "<origin>" origin
      And the "Data consumption by SIM" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "data_consumption" element is visible
     Then the "data_consumption.module_title" textfield is displayed
      And the "data_consumption.progress_bar" progress bar is displayed
      And each element in the "data_consumption.sim_list" list has the "icon" field
      And each element in the "data_consumption.sim_list" list has the "title" field
      And each element in the "data_consumption.sim_list" list has the "subtitle" field

    @automatic
    Examples:
          | product | origin | cv   | jira_id      |
          | blaude  | home   | 14.5 | QANOV-416720 |
          | blaude  | eu     | 14.5 | QANOV-416721 |
          | blaude  | zone2  | 14.5 | QANOV-416722 |
          | blaude  | zone3  | 14.5 | QANOV-416723 |
          | blaude  | zone4  | 14.5 | QANOV-416724 |
          | blaude  | zone5  | 14.5 | QANOV-416725 |
          | o2de    | home   | 24.0 | QANOV-416726 |
          | o2de    | zone2  | 24.0 | QANOV-416728 |
          | o2de    | zone3  | 24.0 | QANOV-416729 |
          | o2de    | zone4  | 24.0 | QANOV-416730 |
          | o2de    | zone5  | 24.0 | QANOV-416731 |

    @manual
    Examples:
          | product | origin | cv   | jira_id      |
          | o2de    | eu     | 24.0 | QANOV-416727 |

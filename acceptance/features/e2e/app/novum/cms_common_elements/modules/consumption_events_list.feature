# -*- coding: utf-8 -*-
@jira.QANOV-389245
Feature: Consumption Events List


  @jira.QANOV-389246 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_data
  Scenario: A user can see a Consumption Events List module configured with the default fields
    To be executed in QA
    Given user has made consumption on the "data" allowances in the "mobile_line" product
      And the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption events list" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is displayed
      And the elements in the "consumption_events_list.dates" list are ordered by date descendant

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_<unit>
  Scenario Outline: A user can see a Consumption Events List module configured for <unit>
    To be executed in QA
    Given user has made consumption on the "<type>" allowances in the "mobile_line" product
      And the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is displayed
      And the elements in the "consumption_events_list.dates" list are ordered by date descendant

    Examples:
          | unit     | type     | jira_id      |
          | data     | data     | QANOV-389247 |
          | call     | minutes  | QANOV-389248 |
          | sms      | messages | QANOV-389249 |
          | mms      | mms      | QANOV-389250 |
          | movement | others   | QANOV-389251 |

  @jira.QANOV-389252 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_all
  Scenario: A user can see a Consumption Events List module configured for all units
    To be executed in QA
    Given user has made consumption on the "data" allowances in the "mobile_line" product
    Given the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is displayed
      And the elements in the "consumption_events_list.dates" list are ordered by date descendant

  @jira.QANOV-389253 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_data
  Scenario: A user can see a Consumption Events List module configured with billing cycle dates
    To be executed in QA
    Given user has made consumption on the "data" allowances in the "mobile_line" product
      And the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption events list" module configured in CMS has the "dateStrategy" field with "BILLING_PERIOD" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is displayed
      And the dates for the billing cycle are displayed in the "consumption_events_list.dates" list

  @jira.QANOV-389254 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_last_month_dates
  Scenario: A user can see a Consumption Events List module configured with last month dates
    To be executed in QA
    Given user has made consumption on the "data" allowances in the "mobile_line" product
      And the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption events list" module configured in CMS has the "dateStrategy" field with "LAST_MONTH" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is displayed
      And the dates for last month are displayed in the "consumption_events_list.dates" list

  @jira.QANOV-389255 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_data
  Scenario: A user can see a Consumption Events List Empty case with default fields
    To be executed in QA
    Given user has not made consumption on the "data" allowances in the "mobile_line" product
      And the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is not displayed
      And the "src" property of the "consumption_events_list.empty_case.icon" element matches "[CONTEXT:consumption_events_list.emptyStateCMSIcon.url]" text
      And the "consumption_events_list.empty_case.title" textfield with "[CONTEXT:consumption_events_list.emptyCaseTitle]" text is displayed
      And the "consumption_events_list.empty_case.description" textfield is not displayed

  @jira.QANOV-389256 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.consumption_events_list_with_empty_case_description
  Scenario: A user can see a Consumption Events List Empty case with description
    To be executed in QA
    Given user has not made consumption on the "data" allowances in the "mobile_line" product
      And the "Consumption events list" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "consumption_events_list.events" list is not displayed
      And the "src" property of the "consumption_events_list.empty_case.icon" element matches "[CONTEXT:consumption_events_list.emptyStateCMSIcon.url]" text
      And the "consumption_events_list.empty_case.title" textfield with "[CONTEXT:consumption_events_list.emptyCaseTitle]" text is displayed
      And the "consumption_events_list.empty_case.description" textfield with "[CONTEXT:consumption_events_list.emptyCaseDescription]" text is displayed

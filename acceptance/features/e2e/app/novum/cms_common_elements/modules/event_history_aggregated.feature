# -*- coding: utf-8 -*-
@jira.QANOV-414417
Feature: Event History Aggregated


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_aggregated_with_<product>_product
  Scenario Outline: User can see Event History Aggregated module for <product> consumption
    Given the "Consumption events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_aggregated" element is visible
     Then the "event_history_aggregated.max_compsumption" textfield with the "<format>" format is displayed
      And the "event_history_aggregated.cycle_consumption" textfield with the "<format>" format is displayed

    Examples:
          | product  | format                             | jira_id      |
          | calls    | ^(\d+h)?(\s)?(\d+min)?(\s)?(\d+s)? | QANOV-414418 |
          | message  | ^\d+                               | QANOV-414419 |
          | internet | ^\d+([,]\d+)? (GB\|MB)$            | QANOV-414420 |
          | movement | ^\d+                               | QANOV-414421 |

  @jira.QANOV-414422 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_aggregated_with_title
  Scenario: User can see Event History Aggregated module with title configured
    Given the "Consumption events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption events bar chart" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_aggregated" element is visible
     Then the "event_history_aggregated.title" textfield with "[CONTEXT:consumption_events_bar_chart.moduleTitle]" text is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_aggregated_with_<cycle>_cycle
  Scenario Outline: User can see Event History Aggregated module with <cycle> cycle
    Given the "Consumption events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_aggregated" element is visible
     Then the "event_history_aggregated" module is displayed

    Examples:
          | cycle   | jira_id      |
          | monthly | QANOV-414423 |
          | billing | QANOV-414424 |

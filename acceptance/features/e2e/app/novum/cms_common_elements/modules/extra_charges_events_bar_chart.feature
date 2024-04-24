# -*- coding: utf-8 -*-
@jira.QANOV-388333
Feature: Extra Charges Events Bar Chart


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @smoke @webapp @jira.link.detects.<detects>
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_<type>
  Scenario Outline: A user can see an Extra Charges Events Bar Chart module for <type> with title
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Extra charges events bar chart" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield with "QA Extra Charges Events Bar Chart <type>" text is displayed

    Examples:
          | type        | jira_id      | detects   |
          | data        | QANOV-388334 |           |
          | call        | QANOV-388335 |           |
          | sms         | QANOV-388336 | O2UK-5574 |
          | sms_and_mms | QANOV-388337 | O2UK-5574 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_<type>_with_date_strategy
  Scenario Outline: A user can see an Extra Charges Events Bar Chart module for <type> with title and date strategy for billing cycle
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And the "Extra charges events bar chart" module configured in CMS has the "moduleTitle" filled
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield with "QA Extra Charges Events Bar Chart <type>" text is displayed
      And the dates for the billing cycle are displayed in the "extra_charges_events_bar_chart" graph

    Examples:
          | type        | jira_id      |
          | data        | QANOV-388338 |
          | call        | QANOV-388339 |
          | sms         | QANOV-388340 |
          | sms_and_mms | QANOV-388341 |
          | movement    | QANOV-388342 |

  @jira.QANOV-388343 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_no_title
  Scenario: A user can see an Extra Charges Events Bar Chart module without title
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield is not displayed

  @jira.QANOV-388344 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_no_title_with_date_strategy
  Scenario: A user can see an Extra Charges Events Bar Chart module without title and with date strategy
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield is not displayed

  @jira.QANOV-388345 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_all
  Scenario: A user can see an Extra Charges Events Bar Chart module for all units
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Extra charges events bar chart" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield with "QA Extra Charges Events Bar Chart All" text is displayed

  @jira.QANOV-388346 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_all_with_date_strategy
  Scenario: A user can see an Extra Charges Events Bar Chart module for all units with date strategy
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Extra charges events bar chart" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield with "QA Extra Charges Events Bar Chart All" text is displayed

  @jira.QANOV-388348 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_events_bar_chart_with_date_strategy_last_month
  Scenario: A user can see an Extra Charges Events Bar Chart module for last month
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Extra charges events bar chart" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Extra charges events bar chart" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "extra_charges_events_bar_chart" element is present
     Then the "extra_charges_events_bar_chart" module is displayed
      And the "extra_charges_events_bar_chart.module_title" textfield with "QA Extra Charges Events Bar Chart Last Month" text is displayed
      And the dates for last month are displayed in the "extra_charges_events_bar_chart" graph

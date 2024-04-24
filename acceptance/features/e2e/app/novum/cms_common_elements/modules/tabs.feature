# -*- coding: utf-8 -*-
@jira.QANOV-388806
Feature: Tabs


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_nested_tab_1
  @fixture.cms.module.<module>
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.one_tab
  Scenario Outline: A user can see a Tabs module configured with one single tab
    To be executed in QA
    Given the "tabs" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "tabs" element is visible
     Then the "0" index in the "tabs.list" list has the "title" field with "Tab 1" text
      And the length of the "tabs.list" list is "1"
      And the "<module>" module is displayed

    Examples:
          | product | jira_id      | module            |
          | vivobr  | QANOV-388807 | simple_action_row |
          | o2uk    | QANOV-388808 | simple_action_row |
          | moves   | QANOV-388809 | simple_action_row |
          | blaude  | QANOV-388810 | tariff_summary    |
          | o2de    | QANOV-388811 | tariff_summary    |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_nested_tab_1
  @fixture.cms.module.<module1>
  @fixture.cms.page.configurable_modules_nested_tab_2
  @fixture.cms.module.<module2>
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.two_tabs
  Scenario Outline: A user can see the content for each Tab
    To be executed in QA
    Given the "tabs" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "tabs" element is visible
     When clicks on the "0" element in the "tabs.list" list
      And waits until the "<module1>" element is visible
     Then the "<module1>" module is displayed
      And the "<module2>" module is not displayed
      And clicks on the "1" element in the "tabs.list" list
      And waits until the "<module2>" element is visible
      And the "<module1>" module is not displayed
      And the "<module2>" module is displayed

    Examples:
          | product | jira_id      | module1           | module2                     |
          | vivobr  | QANOV-388812 | simple_action_row | simple_highlighted_card     |
          | o2uk    | QANOV-388813 | simple_action_row | simple_highlighted_card     |
          | moves   | QANOV-388814 | simple_action_row | simple_highlighted_card     |
          | blaude  | QANOV-388815 | tariff_summary    | row_list_agreement_selector |
          | o2de    | QANOV-388816 | tariff_summary    | row_list_agreement_selector |

  @jira.<jira_id> @<product> @jira.cv.14.6 @mobile @qa @regression
  @fixture.cms.page.configurable_modules_nested_tab_1
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.six_tabs
  Scenario Outline: A user can swipe the tabs carousel when all tabs don't fit in screen
    To be executed in QA
    Given the "tabs" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "tabs" element is visible
     Then the "tabs.list" list can be swiped

    @android @automatic @webapp
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-388817 |
          | o2uk    | QANOV-388818 |
          | moves   | QANOV-388819 |
          | blaude  | QANOV-388820 |
          | o2de    | QANOV-388821 |

    @ios @manual
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-388822 |
          | o2uk    | QANOV-388823 |
          | moves   | QANOV-388824 |
          | blaude  | QANOV-388825 |
          | o2de    | QANOV-388826 |

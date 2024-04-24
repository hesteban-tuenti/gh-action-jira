# -*- coding: utf-8 -*-
@jira.QANOV-605608
Feature: Balance


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.balance
  Scenario Outline: A user can see a balance module configured with the default fields
    To be executed in QA
    Given the "Balance" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "balance_module_title" textfield is not displayed
      And the "balance.amount" textfield with the "\d+,\d\d €" format is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.4 | QANOV-605609 |
          | o2de    | 24.0 | QANOV-554786 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.balance_with_module_title
  Scenario Outline: A user can see a balance module with a title configured
    To be executed in QA
    Given the "Balance" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Balance" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "balance_module_title" textfield with "[CONTEXT:balance.title]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.4 | QANOV-605610 |
          | o2de    | 24.0 | QANOV-554787 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.24.0 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.balance_with_balance_hidden
  Scenario Outline: A user can see a balance module with the balance hidden
    To be executed in QA
    Given the "Balance" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "balance.amount" textfield is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-554788 |
          | o2de    | QANOV-554789 |

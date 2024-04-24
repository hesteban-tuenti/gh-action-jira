# -*- coding: utf-8 -*-
@jira.QANOV-374047
Feature: Row List Agreement Selector


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.row_list_agreement_selector
  Scenario Outline: A user can see a Row List Agreement Selector module configured without title
    To be executed in QA
    Given the "Row List of all products" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Row List of all products" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "row_list_agreement_selector" element is visible
     Then the "row_list_agreement_selector" module is displayed
      And the "row_list_agreement_selector.module_title" textfield is not displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.4 | QANOV-374048 |
          | blaude  | 14.4 | QANOV-406782 |
          | o2de    | 24.0 | QANOV-554852 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.row_list_agreement_selector_with_title
  Scenario Outline: A user can see a Row List Agreement Selector module configured with a title
    To be executed in QA
    Given the "Row List of all products" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Row List of all products" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "row_list_agreement_selector" element is visible
     Then the "row_list_agreement_selector.module_title" textfield with "[CONTEXT:row_list_of_all_products.moduleTitle]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.4 | QANOV-374049 |
          | blaude  | 14.4 | QANOV-406783 |
          | o2de    | 24.0 | QANOV-554853 |

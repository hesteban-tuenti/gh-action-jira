# -*- coding: utf-8 -*-
@jira.QANOV-359145
Feature: Simple Header


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.8 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules @fixture.cms.module.simple_header
  Scenario Outline: A user can see a Simple Header module configured with the default fields
    To be executed in QA
    Given the "Simple header" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Simple header" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_header.pretitle" textfield with "[CONTEXT:simple_header.pretitle]" text is displayed
      And the "simple_header.title" textfield with "[CONTEXT:simple_header.title]" text is displayed
      And the "simple_header.subtitle" textfield with "[CONTEXT:simple_header.subtitle]" text is displayed

    @jira.link.parent_test_plan.QANOV-525492
    Examples:
          | product | jira_id      |
          | moves   | QANOV-359146 |

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-359147 |
          | o2de    | QANOV-554864 |
          | vivobr  | QANOV-600351 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_header_small
  Scenario Outline: A user can see a Simple Header module configured with the small header option
    To be executed in QA
    Given the "Simple header" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Simple header" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And the "simple_header.title" textfield with "[CONTEXT:simple_header.title]" text is displayed
      And the "simple_header.title" textfield is small

    @automatic @jira.link.parent_test_plan.QANOV-525492 @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.8 | QANOV-527553 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.8 | QANOV-554865 |
          | o2de    | 24.0 | QANOV-554866 |
          | vivobr  | 24.3 | QANOV-600352 |

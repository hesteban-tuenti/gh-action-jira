# -*- coding: utf-8 -*-
@jira.QANOV-418405
Feature: Device Plan Terminated


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.device_plan_terminated
  Scenario Outline: A user can see a device plan terminated module configured with the default fields
    To be executed in QA
    Given the "Device plan terminated" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Device plan terminated" configured in CMS has only the mandatory fields filled
      And user has a "my_handy" product with a "fully_paid" contract
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "device_plan_terminated_module" element is visible
     Then the "device_plan_terminated_module.action_text" textfield with "[CONTEXT:device_plan_terminated.actionText]" text is displayed
      And the "device_plan_terminated_module.description" textfield with "[CONTEXT:device_plan_terminated.description]" text is displayed
      And the "device_plan_terminated_module.tag_text" textfield with "[CONTEXT:device_plan_terminated.tagText]" text is displayed
      And the "device_plan_terminated_module.main_title" textfield is not displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.4 | QANOV-418406 |
          | o2de    | 24.0 | QANOV-554805 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.device_plan_terminated_with_main_title
  Scenario Outline: A user can see a device plan module with a title configured
    To be executed in QA
    Given the "Device plan terminated" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Device plan terminated" module configured in CMS has the "mainTitle" filled
      And user has a "my_handy" product with a "fully_paid" contract
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
     Then the "device_plan_terminated_module.main_title" textfield with "[CONTEXT:device_plan_terminated.mainTitle]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.4 | QANOV-418407 |
          | o2de    | 24.0 | QANOV-554806 |

# -*- coding: utf-8 -*-
@jira.QANOV-405654
Feature: Device Plan


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan
  Scenario Outline: A user can see a device plan module configured with the default fields
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "my_handy" product in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_product_name_title" element is visible
     Then the "device_plan_main_title" textfield is not displayed
      And the "device_plan_product_name_title" textfield with "<default_title>" text is displayed

    Examples:
          | product | default_title | cv   | jira_id      |
          | blaude  | My Handy      | 14.4 | QANOV-405655 |
          | o2de    | My Handy      | 24.0 | QANOV-554797 |

  @jira.QANOV-570043 @android @automatic @ios @jira.cv.24.1 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product @fixture.cms.module.device_plan
  Scenario: A user can see a device plan module configured with the default fields
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has the device plan in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_product_name_title" element is visible
     Then the "device_plan_main_title" textfield is not displayed
      And the "device_plan_product_name_title" textfield with "Monthly Device Plan" text is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_with_main_title
  Scenario Outline: A user can see a device plan module with a title configured
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "my_handy" product in "active" status
      And the "Device plan" module configured in CMS has the "mainTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_main_title" element is visible
     Then the "device_plan_main_title" textfield with "[CONTEXT:device_plan.mainTitle]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.4 | QANOV-405657 |
          | o2de    | 24.0 | QANOV-554798 |

  @jira.QANOV-452073 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_standard_mode
  Scenario: A user can see a device plan module with account and tag in standard mode
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has the device plan in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_product_name_title" element is visible
     Then the "device_plan_tag" textfield is displayed
      And the "device_plan_amount" textfield is displayed
      And the "device_plan_product_name_title" textfield with "Monthly Device Plan" text is displayed

  @jira.QANOV-452074 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_simple_mode
  Scenario: A user can see a device plan module without account and tag in simple mode
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has the device plan in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_product_name_title" element is visible
     Then the "device_plan_tag" textfield is not displayed
      And the "device_plan_amount" textfield is not displayed
      And the "device_plan_product_name_title" textfield with "Monthly Device Plan" text is displayed

  @jira.QANOV-452075 @o2uk @android @automatic @ios @jira.cv.14.4 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_with_product_name_title
  Scenario: A user can see a device plan module with the product name
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has the device plan in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_product_name_title" element is visible
     Then the "device_plan_product_name_title" textfield with "[CONTEXT:device_name]" text is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.24.0 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product @fixture.cms.module.device_plan_with_product_name_title
  Scenario Outline: A user can see a device plan module with the product name
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "my_handy" product in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_product_name_title" element is visible
     Then the text of the element "device_plan_product_name_title" is not equal to "My Handy"

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-554799 |
          | o2de    | QANOV-554800 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.24.0 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan_with_details_link
  Scenario Outline: A user can see a device plan module with the details link when paid
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "my_handy" product with a "fully_paid" contract
      And user has a "my_handy" product in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_card" element is visible
     Then the "device_plan_card.link" link is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-554801 |
          | o2de    | QANOV-554802 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.24.0 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.device_plan
  Scenario Outline: A user can see a device plan module without the details link when paid
    To be executed in QA
    Given the "Device plan" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "my_handy" product with a "fully_paid" contract
      And user has a "my_handy" product in "active" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
      And waits until the "device_plan_card" element is visible
     Then the "device_plan_card.link" link is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-554803 |
          | o2de    | QANOV-554804 |

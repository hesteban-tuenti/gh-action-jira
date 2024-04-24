# -*- coding: utf-8 -*-
@jira.QANOV-600402
Feature: Next best shop


  @jira.QANOV-600403 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-558005 @manual @mobile @o2de
  @smoke
  Scenario: A user can see a Next Best Shop module configured with the default fields
    To be executed in QA
    Given the "next-best-shop" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "next-best-shop" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "next_best_shop" element is visible
     Then the "next_best_shop.module_title" textfield is not displayed
      And the "next_best_shop.store_image" image is displayed
      And the "next_best_shop.store_actions" list is displayed
      And each element has the "name" field displayed in the "next_best_shop.store_actions" list
      And each element has the "icon" field displayed in the "next_best_shop.store_actions" list

  @jira.QANOV-600404 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-558005 @manual @mobile @o2de
  @regression
  Scenario: A user can see a Next Best Shop module configured with the module title
    To be executed in QA
    Given the "next-best-shop" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "next-best-shop" module configured in CMS has the "module_title" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "next_best_shop" element is visible
     Then the "next_best_shop.module_title" textfield with "[CONTEXT:next_best_shop.module_title]" text is displayed

  @jira.QANOV-600405 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-558005 @manual @mobile @o2de
  @regression
  Scenario: A user can see a Next Best Shop module configured with the fallback image when there is an image loading error from API
    To be executed in QA
    Given the "next-best-shop" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "next-best-shop" module configured in CMS has the "fallback_image" filled
      And there is an image loading error in API
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "next_best_shop" element is visible
     Then the "src" property of the "next_best_shop.store_image" element matches "[CONTEXT:next_best_shop.fallback_image.url]" text

  @jira.QANOV-600406 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-558005 @manual @mobile @o2de
  @regression
  Scenario: A user can see a Next Best Shop module configured with the API image
    To be executed in QA
    Given the "next-best-shop" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "next-best-shop" module configured in CMS has the "fallback_image" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "next_best_shop" element is visible
     Then the "src" property of the "next_best_shop.store_image" element does not match "[CONTEXT:next_best_shop.fallback_image.url]" text

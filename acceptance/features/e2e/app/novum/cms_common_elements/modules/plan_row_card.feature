# -*- coding: utf-8 -*-
@jira.QANOV-453480
Feature: Plan row card


  @jira.QANOV-453481 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @sanity
  @vivobr @webapp @old_app
  Scenario: A user clicks on Plan row card module with preconfigured url to services-list
    Given the "Plan Row Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "plan-row-card" configured in CMS has a "preconfigured" link to "services-list" destination
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
      And clicks on the "plan_row_card" card
     Then the internal webview with "Mais serviços" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-453482 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  @webapp @old_app
  Scenario: A user clicks on Plan row card module with custom url pointing to an external webview
    Given the "Plan Row Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "plan-row-card" configured in CMS has a "url" link to "https://www.telefonica.com/es/" destination
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
      And clicks on the "plan_row_card" card
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

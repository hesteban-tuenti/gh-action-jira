# -*- coding: utf-8 -*-
@jira.QANOV-576581
Feature: Prepay Manage phone payments


  @jira.QANOV-576582 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-171313
  @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @regression @e2e
  Scenario: A BOX7 prepay user with an active mobile line can access to the "Manage Phone Payments" screen
    If the product is in cancelled status, this entrypoint is not displayed.
    Given user has a "prepay" account type
      And user has a "box7" account type
      And user has a "mobile_line" product in "active" status
      And user has the "services-summary" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.manage_phone_payments_entrypoint" entrypoint
     Then the "Manage Phone Payments" page is displayed
      And the "Drittanbieterdienste" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-576583 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-171313
  @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @regression @e2e
  Scenario: A RAITT prepay user can access to the "Manage Phone Payments" OB webview
    Given user has a "prepay" account type
      And user has a "raitt" account type
      And user has a "mobile_line" product
      And user has the "services-summary" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.manage_phone_payments_entrypoint" entrypoint
     Then the browser webview with "b2c-sim-settings-app" text in the header is displayed
      And the "SIM-Karte & Einstellungen" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

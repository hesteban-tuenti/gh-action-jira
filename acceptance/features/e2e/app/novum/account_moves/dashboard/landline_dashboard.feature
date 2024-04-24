# -*- coding: utf-8 -*-
@jira.QANOV-325825
Feature: Landline dashboard

  Actions Before the Feature:
    Given user has a "landline" product


  @jira.QANOV-325826 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @live @next @cert2 @qa @webapp
  Scenario: User can access to the Landline dashboard
    Given user has the "subscription-description" module configured in CMS for "landline" page for the "landline" product
      And user has the "counters-carousel" module configured in CMS for "landline" page for the "landline" product
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user has the "services-summary" module configured in CMS for "landline" page for the "landline" product
      And user has the "plan-data-card" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "Línea fija" header is displayed
      And the "landline_title_icon" icon is displayed
      And the "landline_title_number" textfield with the "9\d\d \d\d \d\d \d\d" format is displayed
      And the "allowances_carousel" module is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "services_module" module is displayed
      And the "plan_data" module is displayed

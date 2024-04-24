# -*- coding: utf-8 -*-
@jira.QANOV-325444
Feature: TV dashboard

  Actions Before the Feature:
    Given user has a "tv" product


  @jira.QANOV-325445 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @sanity @webapp
  Scenario: User can see the TV dashboard
    Given user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the "services-summary-included-platforms" module configured in CMS for "tv" page for the "tv" product
      And user has the "unbilled-consumption" module configured in CMS for "tv" page for the "tv" product
      And user has the "services-summary" module configured in CMS for "tv" page for the "tv" product
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user has the "plan-data-card" module configured in CMS for "tv" page for the "tv" product
      And user is in the "TV Dashboard" page
      And the "Televisión" header is displayed
      And the "tv_plan_name" textfield is displayed
      And the "tv_products_title" textfield with "Productos contratados" text is displayed
      And the "tv_products_module" module is displayed
      And the "tv_platforms_title" textfield is displayed
      And the "tv_platforms_module" module is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "services_module_title" textfield is displayed
      And the "services_module" module is displayed
      And the "plan_data" module is displayed

  @jira.QANOV-374236 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User can see the included functionalities module
    Given user is subscribed to a TV pack with included functionalities
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user is in the "TV Dashboard" page
     Then the "included_functionalities_title" textfield is displayed
      And the "included_functionalities_module" module is displayed

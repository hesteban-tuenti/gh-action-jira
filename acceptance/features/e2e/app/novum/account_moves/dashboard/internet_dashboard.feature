# -*- coding: utf-8 -*-
@jira.QANOV-325846
Feature: Internet dashboard

  Actions Before the Feature:
    Given user has a "internet" product


  @jira.QANOV-325848 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @webapp @next @live @qa @cert2
  Scenario: User can access to the Internet dashboard
    Given user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "services-summary-internet" module configured in CMS for "internet" page for the "internet" product
      And user has the "plan-data-card" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet Dashboard" page
     Then the "Internet" header is displayed
      And stores the Internet package name in the context storage with key "internet_package_name"
      And the "package_name" textfield with "[CONTEXT:internet_package_name]" text is displayed
      And the "internet_speed_upload" module is displayed
      And the "internet_speed_download" module is displayed
      And the "services_module" module is displayed
      And the "plan_data" module is displayed

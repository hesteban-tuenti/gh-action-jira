# -*- coding: utf-8 -*-
@jira.QANOV-531819 @not_hardening
Feature: Explore CMS entrypoints


  @jira.<jira_id> @<product> @ber @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-343179
  @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can access the Explore CMS entrypoints
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base]" web page
      And the "[CONF:cms_landing_page]" page is loaded
      And I click on the "navigation_main_bar.explore" button
     Then the "explore_entrypoints" drop-down is displayed
      And the "explore_entrypoints_list" list with "Modules,Test lines,Explore categories,New Layouts,Pending Publication,Products" textfields is displayed

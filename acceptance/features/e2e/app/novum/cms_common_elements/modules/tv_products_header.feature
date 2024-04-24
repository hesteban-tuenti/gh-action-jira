# -*- coding: utf-8 -*-
@jira.QANOV-497377
Feature: TV Products header


  @jira.QANOV-497379 @moves @android @automatic @ios @jira.cv.14.11 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.tv_header_with_packages
  Scenario: A user can see a Tv Products Header module configured with the TV packages displayed
    To be executed in QA
    Given the "tv-header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "tv" product
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "tv" product
      And waits "8" seconds
     Then the "tv_header" module is displayed
      And the "tv_header.title" textfield is displayed
      And the "tv_header.card" card is displayed

  @jira.QANOV-497378 @moves @android @automatic @ios @jira.cv.14.11 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.tv_header_without_packages
  Scenario: A user can see a Tv Products Header module configured without the TV packages displayed
    To be executed in QA
    Given the "tv-header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has a "tv" product
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "tv" product
      And waits "8" seconds
     Then the "tv_header" module is displayed
      And the "tv_header.title" textfield is displayed
      And the "tv_header.card" card is not displayed
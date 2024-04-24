# -*- coding: utf-8 -*-
@jira.QANOV-377191
Feature: Internet Details


  @jira.QANOV-377192 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.internet_details
  Scenario: A user can see an internet details module configured with the default fields
    To be executed in QA
    Given the "Card with internet details like connection speed" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "internet" product
     Then the "internet_details_module_title" textfield is not displayed

  @jira.QANOV-377193 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.internet_details_with_module_title
  Scenario: A user can see an Internet Details module with a title configured
    To be executed in QA
    Given the "Card with internet details like connection speed" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Card with internet details like connection speed" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "internet" product
     Then the "internet_details_module_title" textfield with "[CONTEXT:card_with_internet_details_like_connection_speed.moduleTitle]" text is displayed

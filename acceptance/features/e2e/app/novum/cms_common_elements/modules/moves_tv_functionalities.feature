# -*- coding: utf-8 -*-
@jira.QANOV-374237
Feature: Moves TV Functionalities


  @jira.QANOV-374238 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @sanity @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_tv_functionalities_with_icons
  Scenario: A moves user can see a TV functionalities module configured with icons
    To be executed in QA
    Given user has a "tv" product
      And the "Tv functionalities" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Tv functionalities" module configured in CMS has the "withIcons" field with "True" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "tv" product
     Then waits until the "moves_tv_functionalities" element is visible
      And each element has the "name" field displayed in the "moves_tv_functionalities.list" list
      And each element has the "icon" field displayed in the "moves_tv_functionalities.list" list

  @jira.QANOV-374239 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_tv_functionalities_without_icons
  Scenario: A moves user can see a TV functionalities module configured without icons
    To be executed in QA
    Given user has a "tv" product
      And the "Tv functionalities" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Tv functionalities" module configured in CMS has the "withIcons" field with "False" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "tv" product
     Then waits until the "moves_tv_functionalities" element is visible
      And each element has the "name" field displayed in the "moves_tv_functionalities.list" list
      And each element in the "moves_tv_functionalities.list" list does not have the "icon" field

  @jira.QANOV-374240 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_tv_functionalities_without_icons
  Scenario: A moves user can see a TV functionalities with module title
    To be executed in QA
    Given user has a "tv" product
      And the "Tv functionalities" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Tv functionalities" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "tv" product
      And waits until the "moves_tv_functionalities" element is visible
     Then the "moves_tv_functionalities.title" textfield with "QA FUNCTIONALITIES TITLE" text is displayed

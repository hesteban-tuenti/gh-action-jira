# -*- coding: utf-8 -*-
@jira.QANOV-440520
Feature: Internet Header


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.internet_header
  Scenario Outline: A user can see the Internet Speed Header in the <product> brand
    To be executed in QA
    Given user has a "internet" product
      And the "Internet speed header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "internet" product
     Then the "internet_header" module is displayed
      And the "internet_header.title" textfield is displayed
      And the "internet_header.speed.upload" module is displayed
      And the "internet_header.speed.download" module is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-404095 |

    @old_app
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-404096 |

  @jira.QANOV-404097 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.internet_header_upgrade_internet_speed
  Scenario: A moves user who didnt upgraded the internet speed can see the Internet Speed Header with a button
    To be executed in QA
    Given user has a "internet" product
      And the "Internet speed header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "internet" product
      And user has not upgraded the internet speed
     Then the "internet_header" module is displayed
      And the "internet_header.title" textfield is displayed
      And the "internet_header.button" button is displayed

  @jira.QANOV-404098 @android @ios @jira.cv.14.4 @manual @mobile @smoke @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.internet_header_fiber_migration
  Scenario: A vivobr user who didnt migrate to fiber can see the Internet Speed Header with a button
    To be executed in QA
    Given user has a "internet" product
      And the "Internet speed header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has not migrated the fiber
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "internet" product
     Then the "internet_header" module is displayed
      And the "internet_header.title" textfield is displayed
      And the "internet_header.button" button is displayed

  @jira.QANOV-404099 @android @ios @jira.cv.14.4 @manual @mobile @smoke @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.internet_header_fiber_upgrade
  Scenario: A vivobr user who didnt upgraded the fiber can see the Internet Speed Header with a button
    To be executed in QA
    Given user has a "internet" product
      And the "Internet speed header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user has not upgraded the fiber
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "internet" product
     Then the "internet_header" module is displayed
      And the "internet_header.title" textfield is displayed
      And the "internet_header.button" button is displayed

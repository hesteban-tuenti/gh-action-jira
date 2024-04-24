# -*- coding: utf-8 -*-
@jira.QANOV-436064
Feature: Tariff Description


  @jira.QANOV-436065 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.tariff_description
  Scenario: A user can see a Tariff Description module configured with the default fields
    To be executed in QA
    Given the "tariff-description" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "tariff-description" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "tariff_description" element is visible
     Then the "tariff_description.title" textfield is not displayed
      And the "tariff_description.description" textfield is displayed

  @jira.QANOV-436066 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.tariff_description_with_title
  Scenario: A user can see a Tariff Description module configured with a title
    To be executed in QA
    Given the "tariff-description" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "tariff-description" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "tariff_description" element is visible
     Then the "tariff_description.title" textfield with "qa test title" text is displayed
      And the "tariff_description.description" textfield is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-374012
Feature: Empty Case


  @jira.QANOV-374013 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @sanity @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card
  Scenario: A user can see an Empty Case module
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "empty_case_card.title" textfield with "QA Empty Case Card title" text is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.button" button is not displayed

  @jira.QANOV-374014 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_module_title
  Scenario: A user can see an Empty Case module with a module title configured
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "empty_case_card.module_title" textfield with "QA Empty Case Card module title" text is displayed
      And the "empty_case_card.title" textfield with "QA Empty Case Card title" text is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.button" button is not displayed

  @jira.QANOV-374015 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_subtitle
  Scenario: A user can see an Empty Case module with a subtitle configured
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "cardDescription" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "empty_case_card.title" textfield with "QA Empty Case Card title" text is displayed
      And the "empty_case_card.subtitle" textfield with "QA Empty Case Card subtitle" text is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.button" button is not displayed

  @jira.QANOV-374016 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_button
  Scenario: A user can see an Empty Case module with a button configured
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "buttonTextAccountUrl" filled
      And the "Empty case" module configured in CMS has the "accountUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "empty_case_card.title" textfield with "QA Empty Case Card title" text is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.button" button with "QA button" text is displayed

  @jira.QANOV-374017 @automatic @jira.cv.14.4 @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_button
  Scenario: The user clicks on the Empty Case module's button: the manually configured webview is opened
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "buttonTextAccountUrl" filled
      And the "Empty case" module configured in CMS has the "accountUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "empty_case_card.button" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374018 @automatic @jira.cv.14.4 @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_preconfigured_url_button
  Scenario: The user clicks on the Empty Case module's button with a preconfigured URL to Explore
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "buttonTextAccountUrl" filled
      And the "Empty case" configured in CMS has the "accountUrl" field with a "preconfigured" link to "invoices_list" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "empty_case_card.button" button
     Then the current URL contains "invoices"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374019 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_button
  Scenario: The user clicks on the Empty Case module's button: an internal webview is displayed
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "buttonTextAccountUrl" filled
      And the "Empty case" module configured in CMS has the "accountUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "empty_case_card.button" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374020 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_external_url_button
  Scenario: The user clicks on the Empty Case module's button: an external webview is displayed
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "buttonTextAccountUrl" filled
      And the "Empty case" module configured in CMS has the "accountUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "empty_case_card.button" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374021 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.empty_case_card_with_preconfigured_url_button
  Scenario: The user clicks on the Empty Case module's button with a preconfigured URL
    To be executed in QA
    Given the "Empty case" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case" module configured in CMS has the "buttonTextAccountUrl" filled
      And the "Empty case" configured in CMS has the "accountUrl" field with a "preconfigured" link to "invoices_list" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "empty_case_card.button" button
     Then the internal webview with "Facturas" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

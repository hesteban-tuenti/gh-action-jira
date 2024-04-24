# -*- coding: utf-8 -*-
@jira.QANOV-374228
Feature: Counters Carousel Card Shared Data Module Per Subscription


  @jira.QANOV-374229 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_all
  Scenario: A moves user can see a 'Data consumption cards per mobile line' with all the fields
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" module configured in CMS has the "icon" filled
      And the "Data consumption cards per mobile line" module configured in CMS has the "cardTitle" filled
      And the "Data consumption cards per mobile line" module configured in CMS has the "moduleTitle" filled
      And the "Data consumption cards per mobile line" module configured in CMS has the "cardTapUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     Then the "src" property of the "icon" field in all the elements of the "counters_carousel_cards_per_subscription.data_consumption_carousel" carousel matches "[CONTEXT:data_consumption_cards_per_mobile_line.icon.url]" text
      And the "counters_carousel_cards_per_subscription.title" textfield with "[CONTEXT:data_consumption_cards_per_mobile_line.moduleTitle]" text is displayed
      And each element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list has the "title" textfield with "[CONTEXT:data_consumption_cards_per_mobile_line.cardTitle]" text

  @jira.QANOV-374230 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_mandatory
  Scenario: A moves user can see a 'Data consumption cards per mobile line' with all the mandatory fields
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" module configured in CMS has the "cardTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     Then each element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list has the "title" textfield with "[CONTEXT:data_consumption_cards_per_mobile_line.cardTitle]" text
      And each element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list does not have the "icon" field
      And the "counters_carousel_cards_per_subscription.title" textfield is not displayed

  @jira.QANOV-374231 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_with_icon
  Scenario: A moves user can see a 'Data consumption cards per mobile line' with "icon" field
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" module configured in CMS has the "icon" filled
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     Then the "src" property of the "icon" field in all the elements of the "counters_carousel_cards_per_subscription.data_consumption_carousel" carousel matches "[CONTEXT:data_consumption_cards_per_mobile_line.icon.url]" text

  @jira.QANOV-374232 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_with_title
  Scenario: A moves user can see a 'Data consumption cards per mobile line' with "moduleTitle" field
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     Then the "counters_carousel_cards_per_subscription.title" textfield with "[CONTEXT:data_consumption_cards_per_mobile_line.moduleTitle]" text is displayed

  @jira.QANOV-374233 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_all
  Scenario: A moves user clicks on the 'Data consumption cards per mobile line' card when it is configured to open a manual URL
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" configured in CMS has the "cardTapUrl" field with a "url" link to "[CONTEXT:data_consumption_cards_per_mobile_line.cardTapUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     When clicks on any element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374234 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_all
  Scenario: A moves user clicks on the 'Data consumption cards per mobile line' card when it is configured to open a manual URL in webapp
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" configured in CMS has the "cardTapUrl" field with a "url" link to "[CONTEXT:data_consumption_cards_per_mobile_line.cardTapUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     When clicks on any element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374235 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_mandatory
  Scenario: A moves user cannot click on the 'Data consumption cards per mobile line' card when is not configured any URL
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     When clicks on any element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list
     Then the "Modular Page Configurable Modules" modular page is displayed
      And the "counters_carousel_cards_per_subscription" module is displayed

  @jira.QANOV-407100 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_preconfigured_url
  Scenario: A moves user clicks on the 'Data consumption cards per mobile line' card when it is configured to open a preconfigured URL
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" configured in CMS has the "cardTapUrl" field with a "preconfigured" link to "[CONTEXT:data_consumption_cards_per_mobile_line.cardTapUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     When clicks on any element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list
     Then the internal webview with "Consumo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-407101 @automatic @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_cards_per_subscription_preconfigured_url
  Scenario: A moves user clicks on the 'Data consumption cards per mobile line' card when it is configured to open a preconfigured URL in webapp
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption cards per mobile line" configured in CMS has the "cardTapUrl" field with a "preconfigured" link to "[CONTEXT:data_consumption_cards_per_mobile_line.cardTapUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the "mobile" product
     When clicks on any element in the "counters_carousel_cards_per_subscription.data_consumption_carousel" list
     Then the current URL contains "/consumptions/modular-screen/consumption-details/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-298189 @android @ios @jira.cv.14.6 @manual @mobile @moves @regression
  Scenario: A user with several mobile lines with data plan and without shared data can swipe the cards in the consumption module
    Given user has "several" mobile lines
      And the "Data consumption cards per mobile line" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "counters_carousel_cards_per_subscription.data_consumption_carousel" carousel is displayed
      And the "counters_carousel_cards_per_subscription.data_consumption_carousel" carousel can be swiped

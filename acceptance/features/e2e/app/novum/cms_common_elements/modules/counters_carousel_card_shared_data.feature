# -*- coding: utf-8 -*-
@jira.QANOV-374050
Feature: Counters Carousel Card Shared Data Module


  @jira.QANOV-374051 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_all
  Scenario: A moves user can see a 'Data consumption card for shared data' with all the fields
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" module configured in CMS has the "icon" filled
      And the "Data consumption card for shared data" module configured in CMS has the "cardTitle" filled
      And the "Data consumption card for shared data" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     Then the "src" property of the "icon" field in all the elements of the "counters_carousel_card_shared_data.data_consumption_carousel" carousel matches "[CONTEXT:data_consumption_card_for_shared_data.icon.url]" text
      And the "counters_carousel_card_shared_data.title" textfield with "[CONTEXT:data_consumption_card_for_shared_data.moduleTitle]" text is displayed
      And each element in the "counters_carousel_card_shared_data.data_consumption_carousel" list has the "title" textfield with "[CONTEXT:data_consumption_card_for_shared_data.cardTitle]" text

  @jira.QANOV-374052 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_mandatory
  Scenario: A moves user can see a 'Data consumption card for shared data' with all the mandatory fields
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" module configured in CMS has the "cardTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     Then each element in the "counters_carousel_card_shared_data.data_consumption_carousel" list has the "title" textfield with "[CONTEXT:data_consumption_card_for_shared_data.cardTitle]" text
      And each element in the "counters_carousel_card_shared_data.data_consumption_carousel" list does not have the "icon" field
      And the "counters_carousel_card_shared_data.title" textfield is not displayed

  @jira.QANOV-374053 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_with_icon
  Scenario: A moves user can see a 'Data consumption card for shared data' with "icon" field
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" module configured in CMS has the "icon" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     Then the "src" property of the "icon" field in all the elements of the "counters_carousel_card_shared_data.data_consumption_carousel" carousel matches "[CONTEXT:data_consumption_card_for_shared_data.icon.url]" text

  @jira.QANOV-374054 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_with_title
  Scenario: A moves user can see a 'Data consumption card for shared data' with "moduleTitle" field
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
      And the "counters_carousel_card_shared_data.title" textfield with "[CONTEXT:data_consumption_card_for_shared_data.moduleTitle]" text is displayed

  @jira.QANOV-374055 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_all
  Scenario: A moves user clicks on the 'Data consumption card for shared data' card when it is configured to open a manual URL
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" configured in CMS has the "cardTapUrl" field with a "url" link to "[CONTEXT:data_consumption_card_for_shared_data.cardTapUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     When clicks on the "consumption" button of "counters_carousel_card_shared_data.data_consumption_carousel" list with "0" index
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374056 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_all
  Scenario: A moves user clicks on the 'Data consumption card for shared data' card when it is configured to open a manual URL in webapp
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" configured in CMS has the "cardTapUrl" field with a "url" link to "[CONTEXT:data_consumption_card_for_shared_data.cardTapUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     When clicks on any element in the "counters_carousel_card_shared_data.data_consumption_carousel" list
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-387012 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_preconfigured
  Scenario: A moves user clicks on the 'Data consumption card for shared data' card when it is configured to open a manual preconfigured URL
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" configured in CMS has the "cardTapUrl" field with a "preconfigured" link to "[CONTEXT:data_consumption_card_for_shared_data.cardTapUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     When clicks on the "consumption" button of "counters_carousel_card_shared_data.data_consumption_carousel" list with "0" index
     Then the internal webview with "Línea móvil" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-387013 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_preconfigured
  Scenario: A moves user clicks on the 'Data consumption card for shared data' card when it is configured to open a manual preconfigured URL in webapp
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data consumption card for shared data" configured in CMS has the "cardTapUrl" field with a "preconfigured" link to "[CONTEXT:data_consumption_card_for_shared_data.cardTapUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     When clicks on any element in the "counters_carousel_card_shared_data.data_consumption_carousel" list
     Then the browser title is "Línea móvil"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-374057 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.counters_carousel_card_shared_data_mandatory
  Scenario: A moves user cannot click on the 'Data consumption card for shared data' card when is not configured any URL
    To be executed in QA
    Given user has "data_sharing" service in "activated" status
      And the "Data consumption card for shared data" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
      And waits until the "counters_carousel_card_shared_data" element is visible
     When clicks on the "consumption" button of "counters_carousel_card_shared_data.data_consumption_carousel" list with "0" index
     Then the "Modular Page Configurable Modules" modular page is displayed
      And the "counters_carousel_card_shared_data" module is displayed

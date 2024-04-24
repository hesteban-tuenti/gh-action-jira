# -*- coding: utf-8 -*-
@jira.QANOV-386100
Feature: Featured shows


  @jira.QANOV-386101 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @sanity @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows
  Scenario: User with a Featured Shows module can see the module in the modular page
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "featured_shows.carousel" carousel is displayed

  @jira.QANOV-386102 @jira.cv.14.4 @manual @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows
  Scenario: User with a Featured Shows module can swipe over the carousel
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When take a screenshot of "featured_shows.carousel" and save it as "featured_shows_initial_position"
      And swipes from right to left over "featured_shows.carousel" element
     Then check that the image "featured_shows_initial_position" is not present in the element "featured_shows.carousel" with threshold "0.1"

  @jira.QANOV-386103 @android @ios @jira.cv.14.4 @manual @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows
  Scenario: User with a Featured Shows module can swipe over the carousel
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When take a screenshot of "featured_shows" and save it as "featured_shows_initial_position"
      And swipes from right to left over "featured_shows.carousel" element
     Then check that the image "featured_shows_initial_position" is not present in the element "featured_shows" with threshold "0.1"

  @jira.QANOV-386104 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows_with_module_title
  Scenario: User with a Featured Shows module with a module title configured can see the module in the modular page
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Featured shows daily recommendations" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
      And waits "2" seconds
     Then the "featured_shows.module_title" textfield with "QA Featured Shows Module Title" text is displayed
      And the "featured_shows.carousel" carousel is displayed

  @jira.QANOV-386106 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows_with_manual_url
  Scenario: User with a Featured Shows module with a link configured can see the module in the modular page
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkText" filled
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "featured_shows.carousel" carousel is displayed
      And the "featured_shows.link" link with "QA Link" text is displayed

  @jira.QANOV-386107 @automatic @jira.cv.14.4 @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows_with_manual_url
  Scenario: User clicks on a Featured Shows module link: a webview is opened
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkText" filled
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "featured_shows.link" link
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-386108 @automatic @jira.cv.14.4 @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows_with_preconfigured_url
  Scenario: User clicks on a Featured Shows module link with a preconfigured URL to the TV guide
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkText" filled
      And the "Featured shows daily recommendations" configured in CMS has the "footerLinkUrl" field with a "preconfigured" link to "tv-guide" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "featured_shows.link" link
     Then the current URL is "https://www.movistarplus.es/guiamovil?app=1"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-386109 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows_with_manual_url
  Scenario: User clicks on a Featured Shows module link: the internal webview is displayed
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkText" filled
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "featured_shows.link" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-386110 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.featured_shows_with_preconfigured_url
  Scenario: User clicks on a Featured Shows module link with a preconfigured URL to the TV guide
    To be tested in QA
    Given user has show recommendations
      And user has a "tv" product
      And user has not installed the "Movistar plus" app
      And the "Featured shows daily recommendations" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Featured shows daily recommendations" module configured in CMS has the "footerLinkText" filled
      And the "Featured shows daily recommendations" configured in CMS has the "footerLinkUrl" field with a "preconfigured" link to "tv-guide" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "featured_shows.link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

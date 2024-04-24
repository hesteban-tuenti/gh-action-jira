# -*- coding: utf-8 -*-
@jira.QANOV-411588
Feature: Subscription Product Cards


  @jira.QANOV-411589 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A moves user can see a 'Card showing price info for subscription product' with all the fields
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "cmsIcon" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonAccountUrl" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonText" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonLinkAccountUrl" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonLinkText" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "withPrice" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "src" property of the "subscription_product_cards.icon" element matches "[CONTEXT:card_showing_price_info_for_subscription_product.cmsIcon.url]" text
      And the "subscription_product_cards.button" button with "[CONTEXT:card_showing_price_info_for_subscription_product.buttonText]" text is displayed
      And the "subscription_product_cards.link" link with "[CONTEXT:card_showing_price_info_for_subscription_product.buttonLinkText]" text is displayed
      And the "subscription_product_cards.actual_plan_price_title" textfield is displayed
      And the "subscription_product_cards.price" textfield is displayed

  @jira.QANOV-411590 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A moves user can see a 'Card showing price info for subscription product' with icon
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "descriptionFixed" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "src" property of the "subscription_product_cards.icon" element matches "[CONTEXT:card_showing_price_info_for_subscription_product.cmsIcon.url]" text

  @jira.QANOV-411591 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_any_strategy
  Scenario: A moves user can see a 'Card showing price info for subscription product' without icon
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards.icon" icon is not displayed

  @jira.QANOV-411592 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_description
  Scenario: A moves user can see a 'Card showing price info for subscription product' with a purchased date
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "descriptionFixed" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards.purchased_date" textfield is displayed

  @jira.QANOV-411593 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_no_description
  Scenario: A moves user can see a 'Card showing price info for subscription product' without a purchased date
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards.purchased_date" textfield is not displayed

  @jira.QANOV-411594 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_any_strategy
  Scenario: A moves user can see a 'Card showing price info for subscription product' with just one card
    To be executed in QA
    Given user has a "mobile_line" product
      And user has "several" mobile lines in plan
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "selectionStrategy" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards_carousel" list has "1" elements

  @jira.QANOV-411595 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A moves user can see a 'Card showing price info for subscription product' with more than one card
    To be executed in QA
    Given user has a "mobile_line" product
      And user has "several" mobile lines in plan
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "selectionStrategy" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards_carousel" list has ">1" elements

  @jira.QANOV-411596 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_price
  Scenario: A moves user can see a 'Card showing price info for subscription product' with price
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "withPrice" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards.actual_plan_price_title" textfield is displayed
      And the "subscription_product_cards.price" textfield is displayed

  @jira.QANOV-411597 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_any_strategy
  Scenario: A moves user can see a 'Card showing price info for subscription product' without price
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards" module is displayed
      And the "subscription_product_cards.actual_plan_price_title" textfield is not displayed

  @jira.QANOV-411598 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_any_strategy
  Scenario: A moves user can see a 'Card showing price info for subscription product' without button
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards" module is displayed
      And the "subscription_product_cards.button" button is not displayed

  @jira.QANOV-411599 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A moves user can see a 'Card showing price info for subscription product' with button
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonAccountUrl" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonText" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards.button" button with "[CONTEXT:card_showing_price_info_for_subscription_product.buttonText]" text is displayed

  @jira.QANOV-411600 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_button_preconfigured
  Scenario: A user clicks on the 'Card showing price info for subscription product' button when the it is configured to open a preconfigured target
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonAccountUrl" field with a "preconfigured" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonAccountUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.button" button
     Then the internal webview with "Línea móvil" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411601 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_button_preconfigured
  Scenario: A user clicks on the 'Card showing price info for subscription product' button when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonAccountUrl" field with a "preconfigured" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonAccountUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.button" button
     Then the browser title is "Línea móvil"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411602 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A user clicks on the 'Card showing price info for subscription product' button when it is configured to open a manual URL
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonAccountUrl" field with a "url" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonAccountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.button" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411603 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A user clicks on the 'Card showing price info for subscription product' button when it is configured to open a manual URL in webapp
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonAccountUrl" field with a "url" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonAccountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.button" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411604 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_any_strategy
  Scenario: A moves user can see a 'Card showing price info for subscription product' without link
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards" module is displayed
      And the "subscription_product_cards.link" link is not displayed

  @jira.QANOV-411605 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A moves user can see a 'Card showing price info for subscription product' with link
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonLinkAccountUrl" filled
      And the "Card showing price info for subscription product" module configured in CMS has the "buttonLinkText" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards.link" button with "[CONTEXT:card_showing_price_info_for_subscription_product.buttonLinkText]" text is displayed

  @jira.QANOV-411606 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_link_preconfigured
  Scenario: A user clicks on the 'Card showing price info for subscription product' link when the it is configured to open a preconfigured target
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonLinkAccountUrl" field with a "preconfigured" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonLinkAccountUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.link" link
     Then the internal webview with "Línea móvil" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411607 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_link_preconfigured
  Scenario: A user clicks on the 'Card showing price info for subscription product' link when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonLinkAccountUrl" field with a "preconfigured" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonLinkAccountUrl.accountUrlId]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.link" link
     Then the browser title is "Línea móvil"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411608 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A user clicks on the 'Card showing price info for subscription product' link when it is configured to open a manual URL
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonLinkAccountUrl" field with a "url" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonLinkAccountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411609 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards
  Scenario: A user clicks on the 'Card showing price info for subscription product' link when it is configured to open a manual URL in webapp
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And the "Card showing price info for subscription product" configured in CMS has the "buttonLinkAccountUrl" field with a "url" link to "[CONTEXT:card_showing_price_info_for_subscription_product.buttonLinkAccountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "subscription_product_cards.link" link
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-411610 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_movistar_terminal
  Scenario: A moves user can see a 'Card showing price info for subscription product' for the Terminal product
    To be executed in QA
    Given user has the "terminal" equipment in "activated" status
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards" module is displayed
      And the "subscription_product_cards.title" textfield is displayed

  @jira.QANOV-411611 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_movistar_home
  Scenario: A moves user can see a 'Card showing price info for subscription product' for the Movistar Home product
    To be executed in QA
    Given user has the "movistar_home" equipment in "activated" status
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards" module is displayed
      And the "subscription_product_cards.title" textfield is displayed

  @jira.QANOV-411612 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.subscription_product_cards_mando_vocal
  Scenario: A moves user can see a 'Card showing price info for subscription product' for the Mando vocal product
    To be executed in QA
    Given user has the "mando_vocal" equipment in "activated" status
      And the "Card showing price info for subscription product" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Card showing price info for subscription product" module configured in CMS has the "subscriptionType" filled
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "subscription_product_cards" module is displayed
      And the "subscription_product_cards.title" textfield is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-239700
Feature: Product alias

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.QANOV-239701 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression @raitt_drop1
  Scenario: A postpay user with just a mobile line product without alias can see the phone number and the tariff in the subscription selector
    Given user has "1" products
      And user has a "mobile_line" product
      And user has not an alias stored for the "mobile_line" product in the contract details
      And user has the "Subscription Description" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_phone_number]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:product_tariff]" text is displayed

  @jira.QANOV-239702 @android @blaude @ios @jira.cv.13.9 @jira.link.detects.OBO2DE-107 @automatic @mobile @cert3 @next
  @live @smoke @ber @webapp @raitt_drop1
  Scenario: A postpay user with just a mobile line product can see his/her product's alias in the subscription title
    Given user has "1" products in "active" status
      And user has a "mobile_line" product
      And user has a product with alias
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:user.current_subscription]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:selected_product_alias] · [CONTEXT:selected_product_display_name]" text is displayed

  @jira.QANOV-239705 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: A multiproduct postpay user with a mobile line product without alias can see the phone number and tariff in the subscription selector
    Given user has "several" products
      And user has a "mobile_line" product
      And user has not an alias stored for the "mobile_line" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_phone_number]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:product_tariff]" text is displayed

  @jira.QANOV-239706 @android @blaude @ios @jira.cv.13.9 @jira.link.detects.OBO2DE-107 @automatic @mobile @cert3 @next
  @live @smoke @webapp
  Scenario: A multiproduct postpay user can see his/her phone number's alias in the subscription selector
    Given user has "several" products in "active" status
      And user has a "mobile_line" product
      And user has a product with alias
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:user.current_subscription]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:selected_product_alias] · [CONTEXT:selected_product_display_name]" text is displayed

  @jira.QANOV-239707 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression @raitt_drop1
  Scenario: A multiproduct postpay user with MyHandy product/s without alias can see his/her MyHandy device name in the subscription selector
    Given user has "several" products
      And user has a "my_handy" product
      And user has not an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "Blau My Handy" text is displayed
      And the "subscription_selector.subtitle" textfield is not displayed

  @jira.QANOV-239708 @android @blaude @ios @jira.cv.13.9 @manual @mobile @smoke @raitt_drop1
  Scenario: A multiproduct postpay user with MyHandy product/s can see his/her MyHandy alias in the subscription selector
    Given user has "several" products
      And user has a "my_handy" product
      And user has an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_alias]" text is displayed
      And the "subscription_selector.subtitle" textfield with "Blau My Handy" text is displayed

  @jira.QANOV-239709 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: A multiproduct postpay user with MyHandy product/s can see the product alias in the MyHandy card
    Given user has "several" products
      And user has a "my_handy" product
      And user has an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "My Handy card" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "myhandy" module is displayed
      And the "myhandy.title" textfield with "[CONTEXT:product_alias]" text is displayed

  @jira.QANOV-239710 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: A multiproduct postpay user with MyHandy product/s can see the product alias in the "My Handy Details" screen
    Given user has "several" products
      And user has a "my_handy" product
      And user has an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page
      And user is in the "My Handy Details" page
     Then the "myhandy_header.device_name" textfield with "[CONTEXT:product_alias]" text is displayed

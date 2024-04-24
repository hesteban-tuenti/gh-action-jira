# -*- coding: utf-8 -*-
@jira.QANOV-239711
Feature: Product alias

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.QANOV-239712 @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-2872 @manual @mobile @o2de @regression
  Scenario: A postpay user with just a mobile line product without alias can see the phone number and tariff in the subscription title
    Given user has "1" products
      And user has a "mobile_line" product
      And user has not an alias stored for the "mobile_line" product in the contract details
      And user has the "Subscription Description" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "mobile_line_title.mobile_phone_icon" icon is displayed
      And the "mobile_line_title.name" textfield with "[CONTEXT:product_phone_number]" text is displayed
      And the "mobile_line_title.description" textfield with "[CONTEXT:product_tariff]" text is displayed

  @jira.QANOV-239713 @ber @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-2950 @automatic @mobile @o2de @smoke @webapp
  @next @live
  Scenario: A postpay user with just a mobile line product can see his/her product's alias in the subscription title
    Given user has "1" products in "active" status
      And user has a "mobile_line" product
      And user has a product with alias
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:user.current_subscription]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:selected_product_alias] · [CONTEXT:selected_product_display_name]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.detects.O2DE-2957 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with just a <internet_at_home_product> product without alias can see the Internet address in the subscription title
    If the installation address is too long, the address will be cut and "..." will be added at the end.
    NOTE: right now, although the user inserts an alias for a internet product, the alias will be ignored in the app
    (subscription selector, disambiguation screens).
    Given user has "1" products
      And user has a "<internet_at_home_product>" product
      And user has not an alias stored for the "<internet_at_home_product>" product in the contract details
      And user has the "Subscription Description" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "internet_at_home_title.internet_icon" icon is displayed
      And the "internet_at_home_title.name" textfield with "[CONTEXT:product_installation_address]" text is displayed
      And the "internet_at_home_title.description" textfield with "Internet@Home" text is displayed

    Examples:
          | internet_at_home_product | jira_id      |
          | dsl                      | QANOV-239716 |
          | cable                    | QANOV-498483 |
          | fiber                    | QANOV-498484 |
          | home_spot                | QANOV-498485 |
          | data_spot                | QANOV-498486 |

  @jira.QANOV-239717 @android @ios @jira.cv.Future @jira.link.detects.O2DE-2950 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A postpay user with just a internet@home product can see his/her product's alias in the subscription title
    Given user has "1" products
      And user has a "internet_at_home" product
      And user has an alias stored for the "internet_at_home" product in the contract details
      And user has the "Subscription Description" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "internet_at_home_title.icon" icon is displayed
      And the "internet_at_home_title.name" textfield with "[CONTEXT:product_alias]" text is displayed
      And the "internet_at_home_title.description" textfield with "[CONTEXT:product_installation_address]" text is displayed

  @jira.QANOV-239718 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
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

  @jira.QANOV-239719 @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-2950 @manual @mobile @o2de @smoke
  Scenario: A multiproduct postpay user can see his/her phone number's alias in the subscription selector
    Given user has "several" products
      And user has a "mobile_line" product
      And user has an alias stored for the "mobile_line" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_phone_number]" text is displayed
      And the "subscription_selector.subtitle" textfield with the "[CONTEXT:product_alias] · [CONTEXT:product_tariff]" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario Outline: A multiproduct postpay user with a <internet_at_home_product> product without alias can see the Internet address in the subscription selector
    If the installation address is too long, the address will be cut and "..." will be added at the end.
    NOTE: right now, although the user inserts an alias for a internet product, the alias will be ignored in the app
    (subscription selector, disambiguation screens).
    Given user has "several" products
      And user has a "<internet_at_home_product>" product
      And user has not an alias stored for the "<internet_at_home_product>" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_installation_address]" text is displayed
      And the "subscription_selector.subtitle" textfield with "internet@home" text is displayed

    Examples:
          | internet_at_home_product | jira_id      |
          | dsl                      | QANOV-239720 |
          | cable                    | QANOV-498488 |
          | fiber                    | QANOV-498489 |
          | home_spot                | QANOV-498490 |
          | data_spot                | QANOV-498491 |

  @jira.QANOV-239721 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A multiproduct postpay user can see his/her internet@home alias in the subscription selector
    Given user has "several" products
      And user has a "internet_at_home" product
      And user has an alias stored for the "internet_at_home" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_alias]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:product_installation_address]" text is displayed

  @jira.QANOV-239722 @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-2957 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user with MyHandy product/s without alias can see his/her MyHandy device name in the subscription selector
    Given user has "several" products
      And user has a "my_handy" product
      And user has not an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_device_name]" text is displayed
      And the "subscription_selector.subtitle" textfield is not displayed

  @jira.QANOV-239723 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A multiproduct postpay user with MyHandy product/s can see his/her MyHandy alias in the subscription selector
    Given user has "several" products
      And user has a "my_handy" product
      And user has an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield with "[CONTEXT:product_alias]" text is displayed
      And the "subscription_selector.subtitle" textfield with "[CONTEXT:product_device_name]" text is displayed

  @jira.QANOV-239724 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user with MyHandy product/s can see the product alias in the MyHandy card
    Given user has "several" products
      And user has a "my_handy" product
      And user has an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "My Handy card" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "myhandy" module is displayed
      And the "myhandy.device_name" textfield with "[CONTEXT:product_alias]" text is displayed

  @jira.QANOV-239725 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user with MyHandy product/s can see the product alias in the "My Handy Details" screen
    Given user has "several" products
      And user has a "my_handy" product
      And user has an alias stored for the "my_handy" product in the contract details
      And user has the matching subscription selected in the account
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page
      And user is in the "My Handy Details" page
     Then the "myhandy_header.device_name" textfield with "[CONTEXT:product_alias]" text is displayed

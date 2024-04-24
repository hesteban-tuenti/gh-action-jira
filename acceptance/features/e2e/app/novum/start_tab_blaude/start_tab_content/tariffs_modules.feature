# -*- coding: utf-8 -*-
@jira.QANOV-257599
Feature: Tariffs modules


  @jira.QANOV-257606 @android @automatic @ber @blaude @ios @jira.cv.14.0 @jira.link.detects.O2DE-1833
  @jira.link.detects.OBO2DE-445 @live @mobile @next @qa @raitt_drop3 @sanity @webapp
  Scenario: A prepay user will see the consumption module in the start tab
    The product name will be the Tariff Name.
    NOTE: if the prepay user has not allowances, this module won't be displayed
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then waits until the "consumption" element is visible
      And the "consumption.card.title" textfield with the "Daten Inland( & EU)?" format is displayed
      And the "consumption.card.consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "consumption.card.total_data" textfield with the "von \d+(\,\d{1,2})? (MB|GB) verbraucht" format is displayed
      And the "consumption.card.progress_bar" progress bar is displayed
      And the "consumption.card.link" link with "Details ansehen" text is displayed

  @jira.QANOV-257600 @android @blaude @ios @jira.cv.14.0 @jira.link.detects.O2DE-1833 @manual @mobile @regression @ber
  Scenario: A monoproduct postpay user with a "mobile line" product with only a data allowance will see the consumption module in the start tab
    The product title will be the Tariff Name.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has not purchased international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is displayed
      And the "consumption.card.title" textfield is displayed
      And the "consumption.card.consumption" textfield with the "\d* (MB|GB)" format is displayed
      And the "consumption.card.total_data" textfield with the "von \d* (MB|GB) verbraucht" format is displayed
      And the "consumption.card.progress_bar" progress bar is displayed
      And the "consumption.card.link" link with "Details ansehen" text is displayed

  @jira.QANOV-257602 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257600 @manual @mobile @regression
  Scenario: A monoproduct postpay user with a "mobile line" product with only a data allowance can access to the Consumption screen from the consumption module in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has not purchased international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "consumption.card.link" link
     Then the "Mobile Line Consumption" page is displayed

  @jira.QANOV-257608 @android @blaude @ios @jira.cv.14.0 @manual @mobile @raitt_drop3 @sanity
  Scenario: A monoproduct postpay user with several mobile data allowances will see the consumption module in the start tab
    The product name will be the Tariff Name.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has purchased "any" international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is displayed
      And the "consumption.carousel" list is displayed
      And each element in the "consumption.carousel" list has the "name" field
      And each element in the "consumption.carousel" carousel has the "current" textfield with the "\d* (MB|GB)" format
      And each element in the "consumption.carousel" carousel has the "total_data" textfield with the "von \d* (MB|GB) verbraucht" format
      And each element in the "consumption.carousel" list has the "progress_bar" field
      And each element in the "consumption.carousel" list has the "link" field

  @jira.QANOV-257610 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257608 @manual @mobile @regression
  Scenario: A monoproduct postpay user with several mobile data allowances can swipe the consumption carousel in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has purchased "any" international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.carousel" list can be swiped

  @jira.QANOV-257609 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257608 @manual @mobile @regression
  Scenario: A monoproduct postpay user with several mobile data allowances can access to the account dashboard from the consumption module in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has purchased "any" international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "link" link of any card of the "consumption.carousel" carousel
     Then the "Account" page is displayed

  @jira.QANOV-505650 @android @blaude @ios @jira.cv.14.11 @manual @mobile @regression
  Scenario: A multiproduct postpay user without "mobile line" product will not see the consumption module in the start tab
    Given user has a "postpay" account type
      And user has not a "mobile_line" product
      And user has "several" products
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is not displayed

  @jira.QANOV-505652 @android @blaude @ios @jira.cv.14.11 @manual @mobile @smoke
  Scenario: A multiproduct postpay user with "mobile line" product will see the consumption module in the start tab
    If the user has only a mobile line with a single data allowance, then only a card will be displayed.
    The order of the cards in the carousel will be according to API response.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And user has not purchased international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is displayed
      And the "consumption.carousel" list is displayed
      And each element in the "consumption.carousel" carousel has the "name" field with "Daten" text
      And each element in the "consumption.carousel" list has the "phone_number" field
      And each element in the "consumption.carousel" carousel has the "current" textfield with the "\d* (MB|GB)" format
      And each element in the "consumption.carousel" carousel has the "total_data" textfield with the "von \d* (MB|GB) verbraucht" format
      And each element in the "consumption.carousel" list has the "progress_bar" field
      And each element in the "consumption.carousel" carousel has the "link" field with "Details ansehen" text

  @jira.QANOV-505653 @android @blaude @ios @jira.cv.14.11 @manual @mobile @regression
  Scenario: A multiproduct postpay user with "mobile line" product can access to the Consumption screen from the consumption module in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "link" link of any card of the "consumption.carousel" carousel
     Then the "Mobile Line Consumption" page is displayed for the corresponding mobile line

  @jira.QANOV-505654 @android @blaude @ios @jira.cv.14.11 @manual @mobile @regression
  Scenario: A multiproduct postpay user with several "mobile line" products can swipe the consumption carousel in start tab
    Given user has a "postpay" account type
      And user has ">1" mobile line
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.carousel" list can be swiped

  @jira.QANOV-312509 @android @blaude @ios @jira.cv.14.1 @manual @mobile @regression
  Scenario: A user with a mobile line product and with consumption less than 100% will see the progress bar in blue color in the consumption module
    Given user has a "mobile_line" product in "active" status
      And user has consumed ">0%" of the "data" allowances
      And user has consumed "<100%" of the "data" allowances
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.progress_bar" progress bar in "blue" color is displayed

  @jira.QANOV-312510 @android @blaude @ios @jira.cv.14.1 @manual @mobile @regression
  Scenario: A user with a mobile line product and with consumption 100% will see the progress bar in red color in the consumption module
    Given user has a "mobile_line" product in "active" status
      And user has consumed "100%" of the "data" allowances
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.progress_bar" progress bar in "red" color is displayed

  @jira.QANOV-312511 @android @automatic @ber @blaude @ios @jira.cv.14.0 @live @mobile @next @qa @raitt_drop3 @smoke
  @webapp
  Scenario: A user with only a mobile line product will see the product module in the start tab
    The product name will be the tariff name.
    Given user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "tariff.title" textfield is displayed
      And the "tariff.card.title" textfield is displayed
      And the "tariff.card.link" link is displayed

  @jira.QANOV-257601 @android @automatic @blaude @ios @jira.cv.14.0 @jira.link.detects.O2DE-1833
  @jira.link.detects.OBO2DE-454 @live @mobile @next @qa @raitt_drop3 @smoke @webapp
  Scenario: A user with only a MyHandy product will see the product module in the start tab
    The product name will be the Device Name.
    Given user has a "my_handy" product in "active" status
      And user has "1" products
      And user has the "device-plan" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "myhandy" module is displayed
      And the "myhandy.tag" textfield is displayed
      And the "myhandy.title" textfield is displayed
      And the "myhandy.link" link is displayed

  @jira.QANOV-257604 @android @automatic @ber @blaude @ios @jira.cv.14.0 @jira.link.detects.O2DE-1833 @live @mobile @next
  @qa @raitt_drop3 @sanity @webapp
  Scenario: A user with several products will see the product module in the start tab
    FUTURE IMPLEMENTATION: A tag will be displayed when:
    - Low data (80%-99% consumed) --> tag with yellow background
    - Out of data (100% consumed) --> tag with red background
    - Cancelled contract --> tag with grey background
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "my_products.module_title" textfield is displayed
      And the "my_products.list" list is displayed

  @jira.QANOV-499021 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257604 @manual @mobile @smoke
  Scenario: A user with several products will see the mobile line details in the product module of the start tab
    The product icon for mobile line will be a white icon with blue background.
    The plan name will be:
    - Alias · Tariff name --> for a mobile line with alias
    - Tariff name --> for a mobile line without alias
    Given user has "several" products
      And user has a "mobile_line" product in "active" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "my_products" module with "MEINE VERTRÄGE" title is displayed
      And the "my_products.list" list is displayed
      And the "mobile_line" product in the "my_products.list" list has the "icon" field
      And the "mobile_line" product in the "my_products.list" list has the "line" field
      And the "mobile_line" product in the "my_products.list" list has the "plan_name" field
      And the "mobile_line" product in the "my_products.list" list has the "chevron" field

  @jira.QANOV-499022 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257604 @manual @mobile @smoke
  Scenario: A user with several products will see the myhandy details in the product module of the start tab
    The product icon for my handy will be a blue icon with white background.
    The device name will be:
    - Alias --> for a my handy with alias
    - Device name --> for a my handy without alias
    Additional field for a My Handy product with alias:
    - Device name
    Given user has "several" products
      And user has a "my_handy" product in "active" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "my_products" module with "MEINE VERTRÄGE" title is displayed
      And the "my_products.list" list is displayed
      And the "my_handy" product in the "my_products.list" list has the "icon" field
      And the "my_handy" product in the "my_products.list" list has the "device_name" field
      And the "my_handy" product in the "my_products.list" list has the "chevron" field

  @jira.QANOV-390581 @android @blaude @ios @jira.cv.Future @jira.link.detects.OBO2DE-453 @manual @mobile @regression
  Scenario: A user with several products will see the yellow "Low data" tag for a product with low data
    Given user has "several" products
      And user has a "mobile_line" product in "active" status
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then any element in the "my_products.list" list has the "tag" textfield with the "Low data" text

  @jira.QANOV-390582 @android @blaude @ios @jira.cv.Future @jira.link.detects.OBO2DE-453 @manual @mobile @regression
  Scenario: A user with several products will see the red "Out of data" tag for a product out of data
    Given user has "several" products
      And user has a "mobile_line" product in "active" status
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then any element in the "my_products.list" list has the "tag" textfield with the "Out of data" text

  @jira.QANOV-390583 @android @blaude @ios @jira.cv.Future @manual @mobile @regression
  Scenario: A user with several products will see the grey "Cancelled contract" tag for a cancelled product
    Cancelled products will be displayed at the bottom of the list.
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has a "mobile_line" product in "cancelled" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "last" element in the "my_products.list" list has the "tag" textfield with the "Cancelled contract" text

  @jira.QANOV-257605 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257604 @manual @mobile @regression
  Scenario: A user with several products can access to the account dashboard from the product module in start tab
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on any element in the "my_products.list" list
     Then the "Account" page is displayed for the selected product

  @jira.QANOV-308056 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @regression
  Scenario: A user with several products will see the cancelled products in the product module
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has a "any" product in "cancelled" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "active" products are displayed in the "my_products.list" list
      And the "cancelled" products are displayed in the "my_products.list" list

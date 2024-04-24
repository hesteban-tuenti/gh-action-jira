# -*- coding: utf-8 -*-
@jira.QANOV-311439
Feature: Tariffs modules


  @jira.QANOV-311440 @android @ber @ios @jira.cv.14.2 @manual @mobile @o2de @sanity
  Scenario: A prepay user will see the consumption module in the start tab
    The product name will be the Tariff Name.
    NOTE: if the prepay user has not allowances, this module won't be displayed
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "products-summary-prepay" module configured in CMS for "start" page
      And user is in the "Start" page
      And the "consumption.card.title" textfield with the "Daten Inland( & EU)?" format is displayed
      And the "consumption.current" textfield with the "\d* (MB|GB)" format is displayed
      And the "consumption.total_data" textfield with the "von \d* (MB|GB) verbraucht" format is displayed
      And the "consumption.progress_bar" progress bar is displayed
      And the "consumption.link" link with "Details ansehen" text is displayed

  @jira.QANOV-311441 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311440 @manual @mobile @o2de @regression
  Scenario: A prepay user can access to the Consumption screen from the consumption module in start tab
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "products-summary-prepay" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "consumption.link" link
     Then the "Mobile Line Consumption" page is displayed

  @jira.QANOV-311442 @android @ios @jira.cv.14.2 @manual @mobile @o2de @sanity @ber
  Scenario: A monoproduct postpay user with a "mobile line" product with only a limited data allowance will see the consumption module in the start tab
    The product title will be the Tariff Name.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And the "data" allowance is limited in the "mobile_line" product
      And user has not purchased international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is displayed
      And the "consumption.card.title" textfield is displayed
      And the "consumption.card.consumption" textfield with the "\d* (MB|GB)" format is displayed
      And the "consumption.card.total_data" textfield with the "von \d* (MB|GB) verbraucht" format is displayed
      And the "consumption.card.progress_bar" progress bar is displayed
      And the "consumption.card.link" link with "Details ansehen" text is displayed

  @jira.QANOV-507404 @android @ios @jira.cv.14.11 @manual @mobile @o2de @regression
  Scenario: A monoproduct postpay user with a "mobile line" product with only a unlimited data allowance will see the consumption module in the start tab
    The product title will be the Tariff Name.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has not purchased international data bundles
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is displayed
      And the "consumption.card.title" textfield is displayed
      And the "consumption.card.consumption" textfield with "Unbegrenzte" text is displayed
      And the "consumption.card.progress_bar" progress bar is displayed
      And the "consumption.card.link" link with "Details ansehen" text is displayed

  @jira.QANOV-311443 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311442 @manual @mobile @o2de @regression
  Scenario: A monoproduct postpay user with a "mobile line" product with only a data allowance can access to the Consumption screen from the consumption module in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has not purchased international data bundles
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "consumption.card.link" link
     Then the "Mobile Line Consumption" page is displayed

  @jira.QANOV-311444 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A monoproduct postpay user with several limited mobile data allowances will see the consumption module in the start tab
    The product name will be the Tariff Name.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has "several" allowances with limited "data" in the "mobile_line" product
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is displayed
      And the "consumption.carousel" list is displayed
      And each element in the "consumption.carousel" list has the "name" field
      And each element in the "consumption.carousel" carousel has the "current" textfield with the "\d* (MB|GB)" format
      And each element in the "consumption.carousel" carousel has the "total_data" textfield with the "von \d* (MB|GB) verbraucht" format
      And each element in the "consumption.carousel" list has the "progress_bar" field
      And each element in the "consumption.carousel" list has the "link" field

  @jira.QANOV-311445 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311444 @manual @mobile @o2de @regression
  Scenario: A monoproduct postpay user with several mobile data allowances can swipe the consumption carousel in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has "several" allowances with limited "data" in the "mobile_line" product
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.carousel" list can be swiped

  @jira.QANOV-505632 @android @ios @jira.cv.14.11 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user without "mobile line" product will not see the consumption module in the start tab
    Given user has a "postpay" account type
      And user has not a "mobile_line" product
      And user has "several" products
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption" module is not displayed

  @jira.QANOV-505633 @android @ios @jira.cv.14.11 @manual @mobile @o2de @smoke
  Scenario: A multiproduct postpay user with "mobile line" product with limited data allowance will see the consumption module in the start tab
    If the user has only a mobile line with a single data allowance, then only a card will be displayed.
    The order of the cards in the carousel will be according to API response.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And the "data" allowance is limited in the "mobile_line" product
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
      And each element in the "consumption.carousel" list has the "link" field

  @jira.QANOV-505634 @android @ios @jira.cv.14.11 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user with "mobile line" product can access to the Consumption screen from the consumption module in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "link" link of any card of the "consumption.carousel" carousel
     Then the "Mobile Line Consumption" page is displayed for the corresponding mobile line

  @jira.QANOV-505635 @android @ios @jira.cv.14.11 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user with several "mobile line" products can swipe the consumption carousel in start tab
    Given user has a "postpay" account type
      And user has ">1" mobile line
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.carousel" list can be swiped

  @jira.QANOV-312507 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with a mobile line product and with consumption less than 100% will see the progress bar in blue color in the consumption module
    The product name will be the Device Name.
    Given user has a "mobile_line" product in "active" status
      And user has consumed ">0%" of the "data" allowances
      And user has consumed "<100%" of the "data" allowances
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.progress_bar" progress bar in "blue" color is displayed

  @jira.QANOV-312508 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with a mobile line product and with consumption 100% will see the progress bar in red color in the consumption module
    The product name will be the Device Name.
    Given user has a "mobile_line" product in "active" status
      And user has consumed "100%" of the "data" allowances
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "consumption.progress_bar" progress bar in "red" color is displayed

  @jira.QANOV-311446 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311444 @manual @mobile @o2de @regression
  Scenario: A monoproduct postpay user with several mobile data allowances can access to the account dashboard from the consumption module in start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has purchased "any" international data bundles
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "link" link of any card of the "consumption.carousel" carousel
     Then the "Account" page is displayed

  @jira.QANOV-311447 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke @ber
  Scenario: A user with only a mobile_line product will see the product module in the start tab
    The product name will be the tariff name.
    Given user has a "mobile_line" product in "active" status
      And user has "1" products
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "your_product" module with "MEIN VERTRAG" title is displayed
      And the "your_product.name" textfield is displayed
      And the "your_product.link" link with "Details ansehen" text is displayed

  @jira.QANOV-311448 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A user with only a MyHandy product will see the product module in the start tab
    The product name will be the Device Name.
    Given user has a "my_handy" product in "active" status
      And user has "1" products
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "myhandy" module is displayed
      And the "myhandy.tag" textfield is displayed
      And the "myhandy.title" textfield is displayed
      And the "myhandy.link" link is displayed

  @jira.QANOV-311449 @android @ber @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @smoke
  Scenario: A user with only a internet@home product with landline will see the product module in the start tab
    The product name will be the tariff name.
    Existing internet@home products:
    - DSL: internet + landline
    - Kabel (Cable/Coaxial): internet + landline
    - Fiber: internet + landline
    - HomeSpot (FMS): landline + internet + mobile phone
    - DataSpot (Same as HomeSpot but only data): internet + mobile phone
    Given user has a "internet_at_home" product in "active" status
      And user has a "internet_at_home" product with landline
      And user has "1" products
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "your_product" module with "MEIN VERTRAG" title is displayed
      And the "your_product.name" textfield is displayed
      And the "your_product.landline" textfield is displayed
      And the "your_product.internet_address" textfield is displayed
      And the "your_product.link" link with "Details ansehen" text is displayed

  @jira.QANOV-499023 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A user with only a internet@home product without landline will see the product module in the start tab
    The product name will be the tariff name.
    Existing internet@home products:
    - DSL: internet + landline
    - Kabel (Cable/Coaxial): internet + landline
    - Fiber: internet + landline
    - HomeSpot (FMS): landline + internet + mobile phone
    - DataSpot (Same as HomeSpot but only data): internet + mobile phone
    Given user has a "internet_at_home" product in "active" status
      And user has a "internet_at_home" product without landline
      And user has "1" products
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "your_product" module with "MEIN VERTRAG" title is displayed
      And the "your_product.name" textfield is displayed
      And the "your_product.landline" textfield is not displayed
      And the "your_product.internet_address" textfield is displayed
      And the "your_product.link" link with "Details ansehen" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-2873
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @regression
  Scenario Outline: A user with only a <product_type> product can access to the account dashboard from the product module in start tab
    Given user has a "<product_type>" product in "active" status
      And user has "1" products
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the <click_element>
     Then the "Account" page is displayed for the selected product

    Examples:
          | cv    | product_type     | click_element                    | depends_on                | parent_test_plan | jira_id      |
          | 14.2  | mobile_line      | "your_product.link" link         | QANOV-311447              |                  | QANOV-311450 |
          | 14.11 | internet_at_home | "your_product.link" link         | QANOV-311449:QANOV-499023 | QANOV-437471     | QANOV-311452 |

  @jira.QANOV-311451 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311448 @jira.link.detects.O2DE-2873
  @manual @mobile @o2de @regression
  Scenario: A user with only a MyHandy product can access to the MyHandy Details screen from the product module in start tab
    Given user has a "my_handy" product in "active" status
      And user has "1" products
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "myhandy.link" link
     Then the "My Handy Details" page is displayed

  @jira.QANOV-311453 @android @ber @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @sanity
  Scenario: A user with several products will see the product module in the start tab
    FUTURE IMPLEMENTATION: A tag will be displayed when:
    - Low data (80%-99% consumed) --> tag with yellow background
    - Out of data (100% consumed) --> tag with red background
    - Cancelled contract --> tag with grey background
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "your_products" module with "MEINE VERTRÄGE" title is displayed
      And the "your_products.list" list is displayed

  @jira.QANOV-499024 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311453 @manual @mobile @o2de @smoke
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

  @jira.QANOV-499025 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311453 @manual @mobile @o2de @smoke
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

  @jira.QANOV-499026 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-311453
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user with several products will see the internet@home details in the product module of the start tab
    The product icon for my handy will be a blue icon with white background.
    The name will be:
    - Alias --> for a internet@home with alias
    - Installation address --> for a internet@home without alias
    The description will be:
    - Installation address --> for a internet@home with alias
    - 'internet@home' text --> for a internet@home without alias
    Additional fields for a internet@home product with landline:
    - Landline number
    Given user has "several" products
      And user has a "my_handy" product in "active" status
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "my_products" module with "MEINE VERTRÄGE" title is displayed
      And the "my_products.list" list is displayed
      And the "internet_at_home" product in the "my_products.list" list has the "icon" field
      And the "internet_at_home" product in the "my_products.list" list has the "name" field
      And the "internet_at_home" product in the "my_products.list" list has the "description" field
      And the "internet_at_home" product in the "my_products.list" list has the "chevron" field

  @jira.QANOV-311454 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: A user with several products will see the yellow "Low data" tag for a product with low data
    Given user has "several" products
      And user has a "mobile_line" product in "active" status
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then any element in the "your_products.list" list has the "tag" textfield with the "Low data" text

  @jira.QANOV-311455 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: A user with several products will see the red "Out of data" tag for a product out of data
    Given user has "several" products
      And user has a "mobile_line" product in "active" status
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then any element in the "your_products.list" list has the "tag" textfield with the "Out of data" text

  @jira.QANOV-311456 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: A user with several products will see the grey "Cancelled contract" tag for a cancelled product
    Cancelled products will be displayed at the bottom of the list.
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has a "mobile_line" product in "cancelled" status
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "last" element in the "your_products.list" list has the "tag" textfield with the "Cancelled contract" text

  @jira.QANOV-311457 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-311453
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to the account dashboard from the product module in start tab
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on any element in the "your_products.list" list
     Then the "Account" page is displayed for the selected product

  @jira.QANOV-311458 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A user with several products will see the cancelled products in the product module
    Given user has "several" products
      And user has a "any" product in "active" status
      And user has a "any" product in "cancelled" status
      And user has the "products-summary-postpay" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "active" products are displayed in the "my_products.list" list
      And the "cancelled" products are displayed in the "my_products.list" list

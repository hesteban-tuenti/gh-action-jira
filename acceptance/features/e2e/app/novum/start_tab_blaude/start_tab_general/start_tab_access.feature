# -*- coding: utf-8 -*-
@jira.QANOV-257942
Feature: Start tab access

  @jira.QANOV-257943 @android @automatic @ber @blaude @ios @jira.cv.14.0 @live @mobile @next @qa @sanity @har
  Scenario: A user who opens the killed app will land in the Start tab
    Given terminates the app
     When launches the app
      And initiate the app
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-257944 @android @automatic @blaude @ios @jira.cv.14.0 @jira.link.detects.LOC-1079 @live @mobile @next
  @qa @smoke @raitt_drop3
  Scenario: A user can access to the Start tab
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And waits until the "skeleton" element is not visible
      And the "error_loading_text" textfield is not displayed

  @jira.QANOV-295223 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile
  @regression
  Scenario: A user can refresh the Start tab
    Given user is in the "Start" page
     When pulls down the page to refresh
     Then the "Start" page is displayed
      And waits until the "skeleton" element is not visible
      And the "error_loading_text" textfield is not displayed

  @jira.QANOV-257946 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user lands in the Start tab but there's a general webview error: error message will be shown
    Given terminates the app
     When launches the app
      And initiate the app
      And there is a general webview error
     Then the "Start" page is displayed
      And the "error_loading_text" textfield with "[LANG:start.errors.general_error.text]" text is displayed
      And the "error_loading_button" button with "[LANG:start.errors.general_error.button]" text is displayed

  @jira.<jira_id> @TBD @android @blaude @ios @jira.cv.14.0 @jira.link.detects.<detects> @manual @mobile @regression
  Scenario Outline: A user lands in the Start tab but there's an error loading the "<fragment>" fragment: error message will be shown in the place of the fragment
    Given terminates the app
     When launches the app
      And initiate the app
      And there is an error loading the "<fragment>" fragment
     Then the "Start" page is displayed
      And the "error_fragment_icon" icon is displayed
      And the "error_fragment_title" textfield with "[LANG:start.errors.fragment_error.text]" text is displayed
      And the "error_fragment_description" textfield with "<fragment_description>" text is displayed

    Examples:
          | fragment       | fragment_description                                          | detects   | jira_id      |
          | explore        | [LANG:start.errors.fragment_error.explore_description]        |           | QANOV-291326 |
          | order_tracking | [LANG:start.errors.fragment_error.order_tracking_description] | O2DE-2384 | QANOV-291327 |
          | telco          | [LANG:start.errors.fragment_error.telco_description]          |           | QANOV-291328 |

  @jira.QANOV-257948 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp for the first time: the default connectivity message will be shown
    Given user is logged out
      And the "Start" page is not cached
     When logs in the application
      And turns on the Airplane mode
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-257949 @android @blaude @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): cached content will be shown in android devices
    Given the "Start" page is cached
      And terminates the app
     When launches the app
      And initiate the app
      And turns on the Airplane mode
     Then the "Start" page is displayed with cached content

  @jira.QANOV-257950 @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): the default connectivity message will be shown in iOS devices
    Given terminates the app
     When turns on the Airplane mode
      And launches the app
      And initiate the app
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-257951 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A prepay user can see the Start tab modules in the correct order
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "header-cards-cms;products-summary-prepay;explore" modules configured in CMS for "start" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "consumption" module is under "your_product" module
      And the "explore" module is under "consumption" module

  @jira.QANOV-258375 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A prepay user without in-app messages can see the Start tab modules in the correct order
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "header-cards-cms;products-summary-prepay;explore" modules configured in CMS for "start" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_product" module is under "header" module
      And the "consumption" module is under "your_product" module
      And the "explore" module is under "consumption" module

  @jira.QANOV-257952 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with just a "mobile_line" product can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has ">0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "order_tracking" module is under "header" module
      And the "your_product" module is under "order_tracking" module
      And the "consumption" module is under "your_product" module
      And the "explore" module is under "consumption" module

  @jira.QANOV-257953 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with just a "my_handy" product can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "my_handy" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has ">0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "order_tracking" module is under "header" module
      And the "your_product" module is under "order_tracking" module
      And the "explore" module is under "your_product" module

  @jira.QANOV-258378 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with just a "mobile_line" product and without in-app messages can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has ">0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "order_tracking" module is under "header" module
      And the "your_product" module is under "order_tracking" module
      And the "consumption" module is under "your_product" module
      And the "explore" module is under "consumption" module

  @jira.QANOV-258381 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with just a "my_handy" product and without in-app messages can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "my_handy" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has ">0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "order_tracking" module is under "header" module
      And the "your_product" module is under "order_tracking" module
      And the "explore" module is under "your_product" module

  @jira.QANOV-258379 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with just a "mobile_line" product and without active orders can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has "0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_product" module is under "header" module
      And the "consumption" module is under "your_product" module
      And the "explore" module is under "consumption" module

  @jira.QANOV-258382 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with just a "my_handy" product and without active orders can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "my_handy" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has "0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_product" module is under "header" module
      And the "explore" module is under "your_product" module

  @jira.QANOV-258380 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A postpay user with just a "mobile_line" product and without in-app messages nor active orders can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "mobile_line" product in "active" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has "0" orders on track
      And user has "data" allowances in the "mobile_line" product
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_product" module is under "header" module
      And the "consumption" module is under "your_product" module
      And the "explore" module is under "consumption" module

  @jira.QANOV-319307 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A postpay user with just a "my_handy" product and without in-app messages nor active orders can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "1" products
      And user has a "my_handy" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has "0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_product" module is under "header" module
      And the "explore" module is under "your_product" module

  @jira.QANOV-257954 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A postpay user with several products can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "several" products
      And user has a "any" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has ">0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "order_tracking" module is under "header" module
      And the "your_products" module is under "order_tracking" module
      And the "explore" module is under "your_products" module

  @jira.QANOV-258384 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A postpay user with several products and without in-app messages can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "several" products
      And user has a "any" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has ">0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "order_tracking" module is under "header" module
      And the "your_products" module is under "order_tracking" module
      And the "explore" module is under "your_products" module

  @jira.QANOV-258385 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A postpay user with several products and without active orders can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "several" products
      And user has a "any" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has "0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_products" module is under "header" module
      And the "explore" module is under "your_products" module

  @jira.QANOV-258386 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A postpay user with several products and without in-app messages and active orders can see the Start tab modules in the correct order
    Given user has a "postpay" account type
      And user has "several" products
      And user has a "any" product in "active" status
      And user has the "header-cards-cms;order-tracking;products-summary-postpay;explore" modules configured in CMS for "start" page
      And user has "0" orders on track
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "your_products" module is under "header" module
      And the "explore" module is under "your_products" module

  @jira.QANOV-360499 @android @blaude @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke
  Scenario: Start screen is autorefreshed
    Given user is in the "Account" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is autorefreshed
      And the "Start" page is displayed

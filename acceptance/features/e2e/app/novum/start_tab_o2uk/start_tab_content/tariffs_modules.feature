# -*- coding: utf-8 -*-
@jira.QANOV-268198
Feature: Tariffs modules


  @jira.QANOV-268199 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @sanity
  Scenario: A single-msisdn user who has consumed less than 100% of his/her limited mobile data allowance will see the data use fragment
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has no device plan
      And user has "1" mobile lines
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_usage" module with "MY PRODUCTS" title is displayed
      And the "data_usage.data_plan_name" textfield is displayed
      And the "data_usage.progress_bar" progress bar with "dark_blue" colour is displayed
      And the "data_usage.link" link with "View my consumption" text is displayed

  @jira.QANOV-268201 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user who has consumed the 100% of his/her limited mobile data allowance will see the data use fragment
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has no device plan
      And user has "1" mobile lines
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_usage" module with "MY PRODUCTS" title is displayed
      And the "data_usage.data_plan_name" textfield is displayed
      And the "data_usage.progress_bar" progress bar with "red" colour is displayed
      And the "data_usage.link" link with "View my consumption" text is displayed

  @jira.QANOV-268204 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with a data plan can access to see the consumption screen from Start tab
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "1" mobile lines
      And user has "data" allowances in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "data_usage.link" link
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed

  @jira.QANOV-268205 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario: A multi-msisdn user with a mobile line who has consumed 80% or less of his/her limited mobile data allowance will see the plan details in the products list
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has consumed "<=80%" of the "data" allowance in the "mobile_line" product
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "products" module with "MY PRODUCTS" title is displayed
      And the "products.list" list is displayed
      And the "products.list" list has the "mobile_line_product" element
      And the "mobile_line_product.tag" tag is not displayed
      And the "mobile_line_product.device_icon" icon is displayed
      And the "mobile_line_product.msisdn" textfield is displayed
      And the "mobile_line_product.account_type" textfield is displayed

  @jira.QANOV-295356 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user who has consumed 80% of his/her limited mobile data allowance but less than 100% will see the data use fragment
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "products" module with "MY PRODUCTS" title is displayed
      And the "products.list" list has the "mobile_line_product" element
      And the "mobile_line_product.tag" tag with "Low data" text is displayed
      And the "mobile_line_product.device_icon" icon is displayed
      And the "mobile_line_product.msisdn" textfield is displayed
      And the "mobile_line_product.account_type" textfield is displayed

  @jira.QANOV-295357 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user who has consumed the 100% of his/her limited mobile data allowance will see the data use fragment
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "consumption-counters-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "products" module with "MY PRODUCTS" title is displayed
      And the "products.list" list has the "mobile_line_product" element
      And the "mobile_line_product.tag" tag with "Out of data" text is displayed
      And the "mobile_line_product.device_icon" icon is displayed
      And the "mobile_line_product.msisdn" textfield is displayed
      And the "mobile_line_product.account_type" textfield is displayed

  @jira.QANOV-268206 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with mobile line can access to the Account page from the product module
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has a "mobile_line" product
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "mobile_line_product" module
     Then the "Account" page is displayed

  @jira.QANOV-268207 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with a companion device will see the plan details in the products list
    Given user has a "companion" account type
      And user does not have a "prepay" account type
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "products" module with "MY PRODUCTS" title is displayed
      And the "products.list" list is displayed
      And the "products.list" list has the "companion_product" element
      And the "companion_product" is under the "mobile_line_product" product associated
      And the "companion_product.watch_icon" icon is displayed
      And the "companion_product.name" textfield is displayed
      And the "companion_product.description" textfield with "Apple Watch · Associated" text is displayed

  @jira.QANOV-268208 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with a companion device can access to the Account page from the product module
    Given user has a "companion" account type
      And user does not have a "prepay" account type
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "companion_product" module
     Then the "Account" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A user with a device plan in <status> will see the plan details in the products list
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the device plan in "<status>" status
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "products" module with "MY PRODUCTS" title is displayed
      And the "products.list" list is displayed
      And the "products.list" list has the "device_plan_product" element
      And the "device_plan_product" is under the "mobile_line_product" product associated
      And the "device_plan_product.plan_icon" icon is displayed
      And the "device_plan_product.name" textfield is displayed
      And the "device_plan_product.description" textfield with "My device plan" text is displayed

    Examples:
          | status          | jira_id      |
          | paid            | QANOV-268209 |
          | pending_payment | QANOV-268210 |
          | overdue         | QANOV-268211 |

  @jira.QANOV-268212 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with a device plan can access to Device plan page from the product module
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the device plan in "active" status
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "device_plan_product" module
     Then the "Device Plan" page is displayed

  @jira.QANOV-268213 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with a device product will see the device in the products list
    A device product includes SIM-free financing and EECC
    A SIM-free financing product is one that is not linked to any msisdn, i.e. airpods and EECC product is an
    uncoupled device plan
    Given user has the "postpay;device" account types
      And user does not have a "prepay" account type
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "products" module with "MY PRODUCTS" title is displayed
      And the "products.list" list is displayed
      And the "products.list" list has the "device_product" element
      And the "device_product.plan_icon" icon is displayed
      And the "device_product.name" textfield is displayed
      And the "device_product.description" textfield is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn user with a device product can access to the Device plan webview
    A device product includes SIM-free financing and EECC
    A SIM-free financing product is one that is not linked to any msisdn, i.e. airpods and EECC product is an
    uncoupled device plan
    Given user has the "postpay;<account_type>" account types
      And user does not have a "prepay" account type
      And user has the "row-list-agreement-selector" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "device_product" module
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

    Examples:
          | account_type  | header            | jira_id      |
          | legacy device | O2 \| Device plan | QANOV-268214 |
          | AO2 device    | Device plan       | QANOV-268215 |

# -*- coding: utf-8 -*-
@jira.QANOV-268562
Feature: Billing module

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the "billing" module configured in CMS for "start" page


  @jira.QANOV-268563 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @sanity
  Scenario: A user will see the billing module in Start tab
    Given user is in the "Start" page
     Then the "billing" module is displayed
      And the "billing" module with "MY BILLING" title is displayed
      And the "invoices" module is displayed
      And the "extra_charges" module is displayed

  @jira.QANOV-268566 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user without bills will see the invoices module in the billing section
    Given user has no bills
      And user is in the "Start" page
     Then the "invoices" module is inside the "billing" module
      And the "invoices.title" textfield with "Your latest bill will be displayed here" text is displayed

  @jira.QANOV-268568 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario: A single-msisdn user with bills in the last month will see the invoices module in the billing section
    Given user has "1" mobile lines
      And user is in the "Start" page
     Then the "invoices" module is inside the "billing" module
      And the "invoices.title" textfield with "Latest bill" text is displayed
      And the "invoices.amount" textfield with the "£(-)?\d+.\d\d" format is displayed

  @jira.QANOV-268569 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with bills will be redirected to Latest airtime bill screen after clicking on the invoices module
    Given user has "1" mobile lines
      And user has bills
      And user is in the "Start" page
     When clicks on the "invoices" module
     Then the "Latest Airtime Bill" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-309094 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with bills in the last month will see the invoices module in the billing section
    Given user has "several" mobile lines
      And user has bills
      And user is in the "Start" page
     Then the "invoices" module is inside the "billing" module
      And the "invoices.title" textfield with "Latest bills" text is displayed
      And the "invoices.description" textfield with the "\d+ lines" format is displayed

  @jira.QANOV-268570 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with bills will be redirected to the disambiguation screen after clicking on the invoices module
    Given user has "several" mobile lines
      And user has bills
      And user has the "Alerts;Entrypoint list" modules configured in CMS for "invoices-details-start-tab" page
      And user is in the "Start" page
     When clicks on the "invoices" module
     Then the "Bills Disambiguation" page is displayed
      And the "info_alert" alert is displayed
      And the "info_alert.icon" icon is displayed
      And the "info_alert.close" button is displayed
      And the "info_alert.description" textfield with "Your Airtime Plan, Device Plan and any other charges will come out as a single bill per line" text is displayed
      And the header that contains the "Latest bill" text is displayed
      And the "mobile_lines_title" textfield with "LATEST BILLS OF YOUR LINES" text is displayed
      And the "mobile_lines_list" list is displayed
      And each element in the "mobile_line_list" list has the "icon" field
      And each element in the "mobile_line_list" list has the "msisdn" field
      And each element in the "mobile_line_list" list has the "billing_cycle" field
      And each element in the "mobile_line_list" list has the "amount" field
      And each element in the "mobile_line_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-268571 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user will be redirected to the Bill details after clicking on a line in the Bills Disambiguation page
    Given user has "several" mobile lines
      And user has bills
      And user is in the "Start" page
     When clicks on the "invoices" module
      And clicks on any element in the "mobile_lines_list" list
     Then the "Latest Airtime Bill" page is displayed
      And the bill correspond to the line selected
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Disambiguation" page is displayed

  @jira.QANOV-268572 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario: A single-msisdn user without extra charges will see the extra charges module in the billing section
    Given user has "1" mobile lines
      And user has "none" recent charges
      And user is in the "Start" page
     Then the "extra_charges" module is inside the "billing" module
      And the "extra_charges.title" textfield with "Extra charges" text is displayed
      And the "extra_charges.amount" textfield with "£0.00" text is displayed
      And the "extra_charges.amount" textfield is displayed in "black" color

  @jira.QANOV-268573 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with extra charges will see the extra charges module in the billing section
    Given user has "1" mobile lines
      And user has "any" recent charges
      And user is in the "Start" page
     Then the "extra_charges" module is inside the "billing" module
      And the "extra_charges.title" textfield with "Extra charges" text is displayed
      And the "extra_charges.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges.amount" textfield is displayed in "red" color

  @jira.QANOV-268574 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user without extra charges will see the extra charges module in the billing section
    The extra_charges.lines shows the total number of lines (with and without charges)
    Given user has "several" mobile lines
      And user has "none" recent charges for all products
      And user is in the "Start" page
     Then the "extra_charges" module is inside the "billing" module
      And the "extra_charges.title" textfield with "Extra charges" text is displayed
      And the "extra_charges.lines" textfield with the "in \d+ lines" format is displayed
      And the "extra_charges.amount" textfield with "£0.00" text is displayed
      And the "extra_charges.amount" textfield is displayed in "black" color

  @jira.QANOV-268575 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with extra charges will see the extra charges module in the billing section
    The extra_charges.lines shows the total number of lines (with and without charges)
    Given user has "several" mobile lines
      And user has "any" recent charges
      And user is in the "Start" page
     Then the "extra_charges" module is inside the "billing" module
      And the "extra_charges.title" textfield with "Extra charges" text is displayed
      And the "extra_charges.lines" textfield with the "in \d+ lines" format is displayed
      And the "extra_charges.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges.amount" textfield is displayed in "red" color

  @jira.QANOV-268576 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user will be redirected to Extra charges page after clicking on the extra charges module
    Given user has "1" mobile lines
      And user is in the "Start" page
     When clicks on the "extra_charges" module
     Then the "Extra Charges" page is displayed

  @jira.QANOV-268577 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user will be redirected to the disambiguation screen after clicking on the extra charges module
    Given user has "several" mobile lines
      And user has the "Alerts;Entrypoint list" modules configured in CMS for "invoices-details-start-tab" page
      And user is in the "Start" page
     When clicks on the "extra_charges" module
     Then the "Extra Charges Disambiguation" page is displayed
      And the "Extra charges" header is displayed
      And the "info_alert" alert is displayed
      And the "info_alert.icon" icon is displayed
      And the "info_alert.close" button is displayed
      And the "info_alert.description" textfield is displayed
      And the "mobile_lines_title" textfield with "CURRENT EXTRA CHARGES OF YOUR LINES" text is displayed
      And the "mobile_lines_list" list is displayed
      And each element in the "mobile_line_list" list has the "icon" field
      And each element in the "mobile_line_list" list has the "msisdn" field
      And each element in the "mobile_line_list" list has the "amount" field
      And each element in the "mobile_line_list" list has the "chevron" field
      And the "what_are_link" link with "What are recent charges?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Disambiguation" page is displayed

  @jira.QANOV-268578 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user can access to the What are recent charges page from Disambiguation screen
    Given user has "several" mobile lines
      And user is in the "Start" page
     When clicks on the "extra_charges" module
      And the "Extra Charges Disambiguation" page is displayed
      And clicks on the "what_are_link" link
     Then the "What Are Recent Charges" page is displayed
      And the "Recent charges" header is displayed
      And the "what_are_title" textfield with "What are recent charges" text is displayed
      And the "what_are_info" textfield is displayed

  @jira.QANOV-268579 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user can access to Extra charges page from Disambiguation sreen
    Given user has "several" mobile lines
      And user is in the "Start" page
     When clicks on any element in the "extra_charges" list
      And the "Extra Charges Disambiguation" page is displayed
      And clicks on any element in the "mobile_line_list" list
     Then the "Recent Charges" page is displayed
      And the "Recent charges" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Disambiguation" page is displayed

  @jira.QANOV-268580 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user without device plan won't see the device plan module in the billing section
    Given user has no device plan
      And user is in the "Start" page
     Then the "device_plan" module is not displayed

  @jira.QANOV-268581 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with device plan in a fully paid status won't see the device plan module in the billing section
    Given user has "1" mobile lines
      And user has the device plan in "fully_paid" status
      And user is in the "Start" page
     Then the "device_plan" module is not displayed

  @jira.QANOV-268582 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario: A single-msisdn user with a device plan will see the device plan module in the billing section
    Given user has "1" mobile lines
      And user has a device plan with "1" devices in "active" status
      And user is in the "Start" page
     Then the "device_plan.name" textfield is displayed
      And the "device_plan.amount" textfield with the "£\d+.\d\d left" format is displayed
      And the "devices_plan.progress_bar" progression bar is displayed

  @jira.QANOV-268583 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with several device plans will see the device plan module in the billing section
    Given user has "1" mobile lines
      And user has a device plan with "several" devices in "active" status
      And user is in the "Start" page
     Then the "device_plan.name" textfield with the "\d+ devices" format is displayed
      And the "device_plan.amount" textfield with the "£\d+.\d\d left" format is displayed
      And the "devices_plan.progress_bar" progression bar is displayed

  @jira.QANOV-309095 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with device plan will be taken to the device plan details after clicking on the device card
    Given user has "1" mobile lines
      And user has a device plan with "1" devices in "active" status
      And user is in the "Start" page
     When clicks on the "device_plan" module
     Then the "Device Plan" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-268584 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with several lines with device plan will see the device plan module in the billing section
    Given user has "several" mobile lines
      And user has a device plan in "active" status for "several" lines
      And user is in the "Start" page
     Then the "device_plan" module is displayed
      And the "device_plan.carousel" carousel is displayed
      And each element in the "device_plan.carousel" carousel has the "name" field
      And each element in the "device_plan.carousel" carousel has the "msisdns" field
      And each element in the "device_plan.carousel" carousel has the "amount" field
      And each element in the "device_plan.carousel" carousel has the "progress_bar" field

  @jira.QANOV-268585 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with a device plan with 1 device will see the device plan module in the billing section
    Given user has "several" mobile lines
      And user has a device plan with "1" devices in "active" status
      And user is in the "Start" page
     Then the "device_plan.name" textfield is displayed
      And the "device_plan.msisdn" textfield with the "\d\d\d\d\d \d\d\d\d\d\d" format is displayed
      And the "device_plan.amount" textfield with the "£\d+.\d\d left" format is displayed
      And the "devices_plan.progress_bar" progression bar is displayed

  @jira.QANOV-268586 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with device plan with several devices will see the device plan module in the billing section
    Given user has "several" mobile lines
      And user has a device plan with "several" devices in "active" status
      And user is in the "Start" page
     Then the "device_plan.name" textfield with the "\d+ devices" format is displayed
      And the "device_plan.msisdn" textfield with the "for \d\d\d\d\d\d \d\d\d\d\d\d" format is displayed
      And the "device_plan.amount" textfield with the "£\d+.\d\d left" format is displayed
      And the "devices_plan.progress_bar" progression bar is displayed

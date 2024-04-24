# -*- coding: utf-8 -*-
@jira.QANOV-298185
Feature: Data consumption module


  @jira.QANOV-298186 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @cert2 @live @next @webapp @qa
  Scenario: A user with one mobile line with data plan will see the data consumption module
    Given user has a "telco postpay" account type
      And user has "1" mobile lines
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "counters-carousel-cards-per-subscription" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_consumption.data_consumption_carousel" carousel is displayed
      And the "data_consumption.data_consumption_carousel" list has "1" elements
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "title" field with "Consumo de datos" text
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "description" textfield with the "\d\d\d \d\d \d\d \d\d" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "total_data" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "progress_bar" field

  @jira.QANOV-298187 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A user with several mobile lines with data plan and shared data will see the data consumption module
    Given user has a "telco postpay" account type
      And user has "several" mobile lines
      And user has "data_sharing" service in "activated" status
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "counters-carousel-card-shared-data" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_consumption.data_consumption_carousel" carousel is displayed
      And the "data_consumption.data_consumption_carousel" list has "1" elements
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "title" field with "Datos compartidos" text
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "description" textfield with the "Por \d+ líneas" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "total_data" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "progress_bar" field

  @jira.QANOV-298188 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @smoke @webapp @qa @live @next @cert2
  Scenario: A user with several mobile lines with data plan and without shared data will see the data consumption module
    Given user has a "telco postpay" account type
      And user has "several" mobile lines
      And user has "data_sharing" service in "deactivated" status
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "counters-carousel-cards-per-subscription" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_consumption.data_consumption_carousel" carousel is displayed
      And the "data_consumption.data_consumption_carousel" list has ">1" elements
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "title" field with "Consumo de datos" text
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "description" textfield with the "\d\d\d \d\d \d\d \d\d" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format
      And any element in the "data_consumption.data_consumption_carousel" carousel has the "total_data" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "progress_bar" field

  @jira.QANOV-298190 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A user with one mobile line with unlimited data plan will see the data consumption module
    Given user has a "telco postpay" account type
      And user has "1" mobile lines
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the "counters-carousel-cards-per-subscription" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_consumption.data_consumption_carousel" carousel is displayed
      And the "data_consumption.data_consumption_carousel" list has "1" elements
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "title" field with "Consumo de datos" text
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "description" textfield with the "\d\d\d \d\d \d\d \d\d" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "total_data" textfield with the "de ilimitados" format
      And each element in the "data_consumption.data_consumption_carousel" carousel has the "progress_bar" field

  @jira.QANOV-298192 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A user without lines won't see the data consumption module
    Given user has a "telco" account type
      And user has "0" mobile lines
      And user is in the "Start" page
     Then the "data_consumption.data_consumption_carousel" module is not displayed

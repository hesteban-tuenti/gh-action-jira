# -*- coding: utf-8 -*-
@jira.QANOV-266916
Feature: Esim module

  Actions Before each Scenario:
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has the "esim-installation-carousel" module configured in CMS for "start" page


  @jira.QANOV-332399 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario: A user with one line and eSIM in pending installation status will see the eSIM module in Start tab
    Given user has "1" mobile lines
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user is in the "Start" page
     Then the "esim" module is displayed
      And the "esim.title" textfield with "ESIM" text is displayed
      And the "esim.list" list has "1" elements
      And the "0" index in the "esim.list" list has the "status" field with "Pending installation" text
      And the "0" index in the "esim.list" list has the "name" field with "eSIM" text
      And the "0" index in the "esim.list" list has the "icon" field
      And the "0" index in the "esim.list" list has the "chevron" field

  @jira.QANOV-266917 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @sanity
  Scenario: A user with several lines and one eSIM in pending installation status will see the eSIM module in Start tab
    Given user has "several" mobile lines
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user is in the "Start" page
     Then the "esim" module is displayed
      And the "esim.title" textfield with "ESIM" text is displayed
      And the "esim.list" list has "1" elements
      And the "0" index in the "esim.list" list has the "status" field with "Pending installation" text
      And the "0" index in the "esim.list" list has the "name" field with "eSIM" text
      And the "0" index in the "esim.list" list has the "icon" field
      And the "0" index in the "esim.list" list has the "phone_number" field
      And the "0" index in the "esim.list" list has the "chevron" field

  @jira.QANOV-266918 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with several eSIMs in pending installation status will see the eSIM carousel in Start tab
    Given user has several eSIMs profiles to install
      And user has a device with eSIM capabilities
      And user is in the "Start" page
     Then the "esim" module is displayed
      And the "esim.title" textfield with the "ESIM \(\d\)" format is displayed
      And the "esim.list" list has ">1" elements
      And each element in the "esim.list" list has the "status" field with "Pending installation" text
      And each element in the "esim.list" list has the "name" field with "eSIM" text
      And each element in the "esim.list" list has the "icon" field
      And each element in the "esim.list" list has the "phone_number" field
      And each element in the "esim.list" list has the "chevron" field

  @jira.QANOV-266919 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario: A user with any eSIM in pending installation status can access to Esim installation page
    Given user has any eSIM profile to install
      And user has a device with eSIM capabilities
      And user is in the "Start" page
     When clicks on any element in the "esim.list" list
     Then the "Esim Installation" page is displayed

  @jira.QANOV-266920 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user without a eSIM in pending installation status won't see the eSIM module
    Given user does not have an eSIM profile to install
      And user is in the "Start" page
     Then the "esim" module is not displayed

  @jira.QANOV-266921 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with several eSIMs in pending installation status can swipe the eSIM carousel
    Given user has several eSIMs profiles to install
      And user has a device with eSIM capabilities
      And user is in the "Start" page
     Then the "esim.list" list has ">1" elements
      And the "esim.list" list can be swiped

  @jira.QANOV-266922 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user with any eSIM in pending installation status but without a device with eSIM capabilities, the esim module won't be displayed
    Given user has any eSIM profile to install
      And user does not have a device with eSIM capabilities
      And user is in the "Start" page
     Then the "esim" module is not displayed

  @jira.QANOV-286439 @android @ios @jira.cv.14.1 @jira.link.detects.ANDROID-11366 @manual @mobile @o2uk @regression
  Scenario: A user with an eSIM in pending installation status who has accesses the module can go back to the Start tab
    Given user has any eSIM profile to install
      And user has a device with eSIM capabilities
      And user is in the "Start" page
     When clicks on any element in the "esim.list" list
      And the "Esim Installation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Confirm Exit" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Start" page is displayed

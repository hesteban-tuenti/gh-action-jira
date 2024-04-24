# -*- coding: utf-8 -*-
@jira.QANOV-493015
Feature: Devices

  Actions Before each Scenario:
    Given user is in the "Account" page
      And user has a "convergente" plan


  @jira.QANOV-493016 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user without r2r device can see a card to hire a device in the account page
    The r2r_offer module is a CMS highlighted card.
    Given user has not a renting device
      And user has the matching subscription selected in the account
      And user has the "r2r_offer" module configured in CMS for "Account" page
     Then the "r2r_offer" module is displayed

  @jira.QANOV-493017 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user with r2r device can see a card with the device info in the account page
    The r2r_devices module is a CMS row.
    Given user has a renting device
      And user has the matching subscription selected in the account
      And user has the "r2r_device" module configured in CMS for "Account" page
     Then "r2r_devices" module is displayed

  @jira.QANOV-493018 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A convergente user without r2r device can open the card to hire a device
    The r2r_offer module is a CMS highlighted card.
    Given user has not a renting device
      And user has the matching subscription selected in the account
      And user has the "r2r_offer" module configured in CMS for "Account" page
     When clicks on the "r2r_offer" module
     Then the external webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-493019 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A convergente user with r2r device can open the card with device info
    The r2r_devices module is a CMS row.
    Given user has a renting device
      And user has the matching subscription selected in the account
      And user has the "r2r_device" module configured in CMS for "Account" page
     When clicks on the "r2r_devices" module
     Then the external webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

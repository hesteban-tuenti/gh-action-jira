# -*- coding: utf-8 -*-
@jira.QANOV-268234
Feature: Explore module

  Actions Before each Scenario:
    Given user has the "explore" module configured in CMS for "start" page


  @jira.QANOV-268235 @android @ios @jira.cv.Future @manual @mobile @o2uk @sanity
  Scenario: A user will see a module with the PEGA offers in Start tab
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And user has PEGA Explore offers
      And user is in the "Start" page
     Then the "explore" module is displayed
      And the "explore.title" textfield with "SELECTED FOR YOU" text is displayed
      And the "explore.link" link with "View all" text is displayed
      And each element in the "explore.list" list has the "title" field
      And each element in the "explore.list" list has the "description" field
      And each element in the "explore.list" list has the "image" field

  @jira.QANOV-268236 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user can see a PEGA offer with a voucher code
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And there is an offer with a voucher
      And user is in the "Start" page
     Then the "explore" module is displayed
      And the "explore.title" textfield with "SELECTED FOR YOU" text is displayed
      And the "explore.link" link with "View all" text is displayed
      And the "pega_offer.image" image is displayed
      And the "pega_offer.tag" tag is displayed
      And the "pega_offer.title" textfield is displayed
      And the "pega_offer.description" textfield is displayed
      And the "pega_offer.terms_link" link is displayed
      And the "pega_offer.voucher_code" textfield is displayed
      And the "pega_offer.voucher_code_icon" button is displayed
      And the "pega_offer.voucher_title" textfield with "Copy this code before you redeem" text is displayed
      And the "pega_offer.redeem_offer" button with "Redeem offer" text is displayed
      And the "pega_offer.dismiss" link with "No, thanks" text is displayed

  @jira.QANOV-268237 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user can copy the voucher code of a PEGA offer
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And there is an offer with a voucher
      And user is in the "Start" page
     When clicks on the "pega_offer.voucher_code" textfield
     Then the code is copied to the clipboard
      And the "crouton_message" textfield with "Copied to clipboard!" text is displayed
      And waits "5" seconds
      And the "crouton_message" textfield is not displayed

  @jira.QANOV-268238 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user can see a PEGA offer with a redeem url
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And there is an offer with a redeem URL
      And user is in the "Start" page
     Then the "explore" module is displayed
      And the "explore.title" textfield with "SELECTED FOR YOU" text is displayed
      And the "explore.link" link with "View all" text is displayed
      And the "pega_offer.image" image is displayed
      And the "pega_offer.tag" tag is displayed
      And the "pega_offer.title" textfield is displayed
      And the "pega_offer.description" textfield is displayed
      And the "pega_offer.terms_link" link is displayed
      And the "pega_offer.redeem_offer" button with "Reedem offer" text is displayed
      And the "pega_offer.dismiss" link with "No, thanks" text is displayed

  @jira.QANOV-268239 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user with a PEGA offer can dismiss it from Start tab
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And user has PEGA Explore offers
      And user is in the "Start" page
     When clicks on the "pega_offer.dismiss" button
     Then the "pega_offer" module is not displayed
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-268240 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user with a PEGA offer can access to Redeem offer from Start tab
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And there is an offer with a redeem URL
      And user is in the "Start" page
     When clicks on the "pega_offer.redeem_offer" button
     Then the external webview is displayed
      And the "pega_feedback_accepted" feedback is sent

  @jira.QANOV-268241 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user with a PEGA offer can access see the Terms apply from Start tab
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And user has PEGA Explore offers
      And user is in the "Start" page
     When clicks on the "pega_offer.terms_link" button
     Then the "Short Terms" page is displayed
      And the "Terms apply" header is displayed
      And the "offer_title" textfield is displayed
      And the "description" textfield is displayed
      And the "full_terms" link with "Full terms and conditions" text is displayed

  @jira.QANOV-268242 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A user can access to Explore page from the Explore module in Start tab
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And user is in the "Start" page
     When clicks on the "explore.link" link
     Then the "Explore" page is displayed

  @jira.QANOV-268243 @android @ios @jira.cv.Future @manual @mobile @o2uk @smoke
  Scenario: A user won't see the Explore module if there are no PEGA offers
    Given user has a "AO2" account type
      And user does not have a "prepay" account type
      And user does not have PEGA Explore offers
      And user is in the "Start" page
     Then the "explore" module is not displayed

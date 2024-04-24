# -*- coding: utf-8 -*-
@jira.QANOV-125372
Feature: PEGA Offers in Explore

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.QANOV-125374 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is displayed for an offer having url, no sendFeedback and voucher code
    Given user has a NBA card with "mainURL;no_feedback;voucherCode"
     Then the card is displayed with fields
          | field         |
          | voucher_code  |
          | redeem_button |
      And the "dismiss" button is not displayed

  @jira.QANOV-125375 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is displayed for an offer having url, no sendFeedback and no voucher code
    Given user has a NBA card with "mainURL;no_feedback;no_voucherCode"
     Then the card is displayed without fields
          | field         |
          | voucher_code  |
          | redeem_button |
      And the "dismiss" button is not displayed

  @jira.QANOV-125376 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A NBA card with an offer having url, no sendFeedback and no voucher code can be opened
    The rest of the cards are not clickable
    Given user has a NBA card with "mainURL;no_feedback;no_voucherCode"
     When clicks on the "nba_card" card
     Then the Explore card is opened

  @jira.QANOV-125377 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is not displayed for an offer with no url, no sendFeedback and voucher code
    Given user has a NBA card with "no_mainURL;no_feedback;voucherCode"
     Then the "nba_card" element is not displayed

  @jira.QANOV-125378 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is displayed for an offer with no url, no sendFeedback and no voucher code
    Given user has a NBA card with "no_mainURL;no_feedback;no_voucherCode"
     Then the card is displayed without fields
          | field         |
          | voucher_code  |
          | redeem_button |
          | discard_offer |

  @jira.QANOV-125379 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk @sanity @qa @webapp
  Scenario: NBA Card is displayed for an offer having url, sendFeedback and voucher code
    Given user has a NBA card with "mainURL;feedback;voucherCode"
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
      And the selected explore "card" has the "button_redeem" field displayed
      And the selected explore "card" has the "button_dismiss" field displayed
      And the selected explore "card" has the "voucher_code_text" field displayed

  @jira.QANOV-125380 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is displayed for an offer having url, sendFeedback and no voucher code
    Given user has a NBA card with "mainURL;feedback;no_voucherCode"
     Then the card is displayed with fields
          | field         |
          | redeem_button |
          | discard_offer |
      And the "voucher_code" textfield is not displayed

  @jira.QANOV-125381 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is displayed for an offer with no url, has sendFeedback and voucher code
    Given user has a NBA card with "no_mainURL;feedback;voucherCode"
     Then the card is displayed without fields
          | field         |
          | redeem_button |
          | discard_offer |
      And the "voucher_code" textfield is not displayed

  @jira.QANOV-125382 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: NBA Card is displayed for an offer with no url, no voucher code and has sendFeedback
    Given user has a NBA card with "no_mainURL;feedback;no_voucherCode"
     Then the card is displayed without fields
          | field         |
          | redeem_button |
          | discard_offer |
      And the "voucher_code" textfield is not displayed

  @jira.QANOV-125383 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: User can copy a voucher code
    Given user has a NBA card with "voucher_code" displayed
     When clicks on the "voucher_code" element
     Then the "crouton_message" textfield with "Copied to clipboard!" text is displayed
      And the text is copied
      And waits "5" seconds
      And the "crouton_message" textfield is not displayed

  @jira.QANOV-125384 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: User can redeem a voucher code
    Given user has a NBA card with "voucher_code" displayed
     When clicks on the "redeem_button" button
     Then the webview is displayed

  @jira.QANOV-125385 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: User can redeem an offer
    Given user has a NBA card with "redeem_button" displayed
     When clicks on the "redeem_button" button
     Then the popup with "You have redeemed this offer" title and "Thank you" message is displayed
      And the "ok_button" button is displayed
      And the "cancel_button" button is displayed

  @jira.QANOV-125386 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User cancels to redeem an offer
    Given user has a NBA card with "redeem_button" displayed
     When clicks on the "redeem_button" button
      And clicks on the "cancel_button" button
     Then the card is still displayed

  @jira.QANOV-125387 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: User accepts to redeem an offer
    Given user has a NBA card with "redeem_button" displayed
     When clicks on the "redeem_button" button
      And clicks on the "ok_button" button
     Then the current card is not displayed
      And the next card is displayed

  @jira.QANOV-125388 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User can refuse an offer
    Given user has a NBA card with a "dismiss" button displayed
     When clicks on the "dismiss" button
     Then the popup with "Do you want to remove this offer?" title and "You can cancel this option" message is displayed
      And the "ok_button" button is displayed
      And the "cancel_button" button is displayed

  @jira.QANOV-125389 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User cancels to refuse an offer
    Given user has a NBA card with a "dismiss" button displayed
     When clicks on the "dismiss" button
      And clicks on the "cancel_button" button
     Then the card is still displayed

  @jira.QANOV-125390 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User accepts to refuse an offer
    Given user has a NBA card with a "dismiss" button displayed
     When clicks on the "dismiss" button
      And clicks on the "ok_button" button
     Then the current card is not displayed
      And the next card is displayed

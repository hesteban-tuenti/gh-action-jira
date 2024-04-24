# -*- coding: utf-8 -*-
@jira.QANOV-67158
Feature: PEGA Offers


  @jira.QANOV-152925 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-66627
  @jira.link.parent_test_plan.QANOV-77438 @no_automatable @mobile @o2uk @sanity @ber
  Scenario: A user can see an alert in Account screen when there is an alert configured with next best offer provider in CMS
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "next-best-offer" preconfiguration
      And user has a "AO2" account type
      And user is not eligible for a "pending_extra_alert" alert
      And user has PEGA offers for the "alerts" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert.title" textfield is displayed
      And the "alert.link" link with "Find out more" text is displayed
      And the "alert.close" button is displayed
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-67161 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-66627
  @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: User with a PEGA alert offer can access the offer
    Only one offer is displayed in the alert. If we receive more alert offers from the API they will
    also be shown in the displayed Your Offers webview
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "next-best-offer" preconfiguration
      And user has a "AO2" account type
      And user is not eligible for a "pending_extra_alert" alert
      And user has PEGA offers for the "alerts" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "alert.link" link
     Then the "Your offers" internal webview is displayed
      And only the "PEGA alert offers" are displayed
      And the card with "[CONTEXT:pega_clicked_offer]" text on the "title" field is displayed in the "0" position of the "pega_offers" carousel
      And the "pega_feedback_clicked" feedback is sent

  @jira.QANOV-67162 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User with an OPAL alert and PEGA offers can see the OPAL alert before the PEGA one
    If there are multiple alerts, the priority for alerts to be displayed is the following one:
    Payment overdue, Opal choose later, Opal redemption, PEGA, no/low data
    other_affected_versions="2022-10"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "next-best-offer" preconfiguration
      And user has a pending extra
      And user has PEGA offers for the "alerts" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "pending_extra_alert.close_button" button
     Then the "pending_extra_alert.alert" element is not on display
      And the "pega_alert.alert" element is on display

  @jira.QANOV-67165 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User with several PEGA offers alerts rejects an offer from the Your Offers screen
    If there are multiple alerts, the priority for alerts to be displayed is the following one:
    Payment overdue, Opal choose later, Opal redemption, PEGA, no/low data
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "next-best-offer" preconfiguration
      And user has ">1" PEGA alert offer with a redeem URL
      And user has a "AO2" account type
      And user is not eligible for a "pending_extra_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "alert.link" link
      And the "Your offers" internal webview is displayed
      And clicks on the "no_thanks" button
      And the "remove_offer" popup is displayed
      And clicks on the "go_back" button
     Then the "Account" page is displayed
      And the "alert.alert" element is on display
      And the offer displayed is the next one coming from the API
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67166 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User with one PEGA offer alert rejects an offer from the Your Offers screen
    If there are multiple alerts, the priority for alerts to be displayed is the following one:
    Payment overdue, Opal choose later, Opal redemption, PEGA, no/low data
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "next-best-offer" preconfiguration
      And user has "1" PEGA alert offer with a redeem URL
      And user is not eligible for a "pending_extra_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "alert.link" link
      And the "Your Offers" internal webview is displayed
      And clicks on the "no_thanks" button
      And the "remove_offer" popup is displayed
      And clicks on the "go_back" button
     Then the "Account" page is displayed
      And the "alert" element is not on display
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67167 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User with a PEGA offer alert dismisses the alert by tapping on the X icon
    If there are multiple alerts, the priority for alerts to be displayed is the following one:
    Payment overdue, Opal choose later, Opal redemption, PEGA, no/low data
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "next-best-offer" preconfiguration
      And user is not eligible for a "pending_extra_alert" alert
      And user has PEGA offers for the "alerts" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "alert.close" button
     Then the "alert.alert" element is not on display
      And the "pega_feedback_closed" feedback is sent

  @jira.QANOV-67168 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249005
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: A user can see a PEGA offer in the upgrade module
    The title will have a max of 66 chars and will come from the API.
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10, 2022-31"
    Given user has PEGA offers for the "upgrades" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "upgrade_card.title" textfield with "Time for an upgrade" text is displayed
      And the "upgrade_card.subtitle" textfield is displayed
      And the "upgrade_card.description" textfield is not displayed
      And the "upgrade_card.button" button with "Find out more" text is displayed
      And the "upgrade_card.link" link is not displayed
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-67169 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249005
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: A user can access a PEGA offer in the upgrade module
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10, 2022-31"
    Given user has PEGA offers for the "alerts" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "upgrade_card.button" button
     Then the internal webview with "Your offers" header is displayed
      And only the "PEGA upgrade offers" are displayed
      And the card with "[CONTEXT:pega_clicked_offer]" text on the "title" field is displayed in the "0" position of the "pega_offers" carousel
      And the "pega_feedback_clicked" feedback is sent

  @jira.QANOV-67171 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249005
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User won't see any more PEGA offers in the upgrade module after discarding the last one
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10, 2022-31"
    Given user has "1" PEGA upgrade offer with a redeem URL
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "upgrade_card.button" button
      And the "Your offers" internal webview is displayed
      And clicks on the "no_thanks" button
     Then the "Account" page is displayed
      And the "upgrade_card" module is not displayed
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67172 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: A user can see PEGA offers in the inlife module
    This module is the one previously known as Recommendations module.
    The title will have a max of 66 chars and will come from the API.
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "inlife" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "recommendations_card_title" textfield is displayed
      And the "recommendations_card_description" textfield is not displayed
      And the "recommendations_card_button" button with "Find out more" text is displayed
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-67173 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: A user can access a PEGA offer in the inlife module
    This module is the one previously known as Recommendations module.
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "inlife" module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "recommendations_card_button" button
     Then the internal webview with "Your offers" header is displayed
      And the card with "[CONTEXT:pega_clicked_offer]" text on the "title" field is displayed in the "0" position of the "pega_offers" carousel
      And the "pega_feedback_clicked" feedback is sent

  @jira.QANOV-67174 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User will see the next PEGA offer in the inlife module after discarding one
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has ">1" PEGA inlife offer with a redeem URL
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "recommendations_card_button" button
      And the "Your offers" internal webview is displayed
      And clicks on the "no_thanks" button
     Then the "Account" page is displayed
      And the "recommendations_card_title" textfield with "Let's save you money" text is displayed
      And the "recommendations_card_description" textfield is not displayed
      And the "recommendations_card_button" button with "Find out more" text is displayed
      And the offer displayed is the next one coming from the API
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67175 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User won't see any more PEGA offers in the inlife module after discarding the last one
    If there are other offers than PEGA for that module, they will be shown after discarding the last PEGA offer.
    If not, the module won't be displayed anymore
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has "1" PEGA inlife offer with a redeem URL
      And user has other offers for the inlife module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "recommendations_card_button" button
      And the "Your offers" internal webview is displayed
      And clicks on the "no_thanks" button
     Then the "Account" page is displayed
      And the "recomendations_card" module does not display any PEGA offer
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67176 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User won't see the inlife module after discarding the last PEGA offer and if the user does not have any other recommendation offer
    If there are other offers than PEGA for that module, they will be shown after discarding the last PEGA offer.
    If not, the module won't be displayed anymore
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has "1" PEGA offer with redeem URL for the inlife module
      And user does not have other offers for the inlife module
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "recommendations_card_button" button
      And the "Your offers" internal webview is displayed
      And clicks on the "no_thanks" button
     Then the "Account" page is displayed
      And the "recomendations_card" module is not displayed
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67177 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @smoke
  Scenario: A user can see PEGA offers in Explore
    This offers can be mixed in the same top featured content than CMS offers.
    A maximum of 3 PEGA offers will be shown
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    To be enabled once Explore web is completely rolled out
    Given user has PEGA offers for the "explore" module
      And user is in the "Explore" page
     When looks for a card in the "featured_content" carousel having the "link" textfield containing "Find out more" text
     Then the "[CONTEXT:featured_content.card.image]" image is displayed
      And the "[CONTEXT:featured_content.card.pretitle]" textfield with the "OFFERS FOR xxx xxxx xxxx" format is displayed
      And the "[CONTEXT:featured_content.card.title]" textfield is displayed
      And the "[CONTEXT:featured_content.card.description]" textfield is displayed
      And the "[CONTEXT:featured_content.card.link]" link with "Find out more" text is displayed
      And there will be a maximum of 3 PEGA cards
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-67178 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can see PEGA offers in Explore for a companion device
    This offers can be mixed in the same top featured content than CMS offers.
    A maximum of 3 PEGA offers will be shown
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    To be enabled once Explore web is completely rolled out
    Given user is in the "Explore" page
      And user has a PEGA Explore offer for a companion device
     When looks for a card in the "featured_content" carousel having the "link" textfield containing "Find out more" text
     Then the "[CONTEXT:featured_content.card.image]" image is displayed
      And the "[CONTEXT:featured_content.card.pretitle]" textfield with the "OFFERS FOR Companion friendly name" format is displayed
      And the "[CONTEXT:featured_content.card.title]" textfield is displayed
      And the "[CONTEXT:featured_content.card.description]" textfield is displayed
      And the "[CONTEXT:featured_content.card.link]" link with "Find out more" text is displayed
      And there will be a maximum of 3 PEGA cards
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-67179 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can access to a PEGA offer card in Explore
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    To be enabled once Explore web is completely rolled out
    Given user is in the "Explore" page
      And user has PEGA offers for the "explore" module
     When looks for a card in the "featured_content" carousel having the "link" textfield containing "Find out more" text
      And clicks on the "[CONTEXT:featured_content.card.link]" link
     Then the internal webview with "Your offers" header is displayed
      And only the "PEGA Explore offers" are displayed
      And the "pega_feedback_clicked" feedback is sent

  @jira.QANOV-171300 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user with a offer without image can see a descriptive text instead in the Explore tab
    The descriptive text of the image comes from the API
    To be enabled once Explore web is completely rolled out
    Given user has "any" PEGA explore offer not returning an image
      And user is in the "Explore" page
     When looks for a card in the "featured_content" carousel having the "title" textfield containing "[CONTEXT:card_without_image_title]" text
     Then the "[CONTEXT:card_without_image]" card in the "featured_content" carousel has the "[CONTEXT:image_descriptive_text]" in the "card_image" field

  @jira.QANOV-67181 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User can see the mandatory elements of a PEGA card in the "Your offers" modal webview
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     Then each element in the "PEGA offers" list has the "card_image" field
      And each element in the "PEGA offers" list has the "card_pretitle" field
      And each element in the "PEGA offers" list has the "card_title" field
      And each element in the "PEGA offers" list has the "card_description" field
      And each element in the "PEGA offers" list has the "terms_link" field with "Terms apply" text
      And each element in the "PEGA offers" list has the "redeem" button with "Redeem offer" text
      And each element in the "PEGA offers" list has the "no_thanks" button with "No thanks" text

  @jira.QANOV-67182 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User can see the pretitle text of a PEGA card in the "Your offers" modal webview for a non companion device
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
      And user has "0" companion lines
     Then the "card_pretitle" textfield with the "OFFERS FOR xxx xxxx xxxx" format is displayed

  @jira.QANOV-67183 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: User can see the pretitle text of a PEGA card in the "Your offers" modal webview for a companion device
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
      And user has a PEGA offer for a companion device
     Then the "card_pretitle" textfield with the "OFFERS FOR companion device friendly name" format is displayed

  @jira.QANOV-67184 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can see a PEGA offer with a redeem URL
    internal_checkpoint="This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)"
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And there is an offer with a redeem URL
      And user is in the "Your Offers" page
     Then the "redeem" button with "Redeem offer" text is displayed
      And the "no_thanks" button with "No thanks" text is displayed

  @jira.QANOV-67185 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can see a PEGA offer with a voucher code
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And there is an offer with a voucher
      And user is in the "Your Offers" page
     Then the "voucher_title" textfield with "Tap to copy this code before to redeem" text is displayed
      And the "voucher_code" textfield is displayed
      And the "redeem" button with "Redeem offer" text is displayed
      And the "no_thanks" button with "No thanks" text is displayed

  @jira.QANOV-67186 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can copy the voucher code for a PEGA offer
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    The crouton message indicating that the code is copied will disappear in 5 secs without for the user to interact with it
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And there is an offer with a voucher
      And user is in the "Your Offers" page
     When clicks on the "voucher_code" textfield
     Then the code is copied to the clipboard
      And the "crouton_message" textfield with "Copied to clipboard!" text is displayed
      And waits "5" seconds
      And the "crouton_message" textfield is not displayed

  @jira.QANOV-67187 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can redeem a PEGA offer with a redeem URL
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And there is an offer with a redeem URL
      And user is in the "Your Offers" page
     When clicks on the "redeem" button
     Then the external webview is displayed
      And the "pega_feedback_accepted" feedback is sent

  @jira.QANOV-106814 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can redeem a PEGA offer without a redeem URL
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And there is an offer without a redeem URL
      And user is in the "Your Offers" page
     When clicks on the "redeem" button
     Then the "redeemed_offer" popup is displayed
      And the "redeem_title" textfield with "You have redeemed this offer" text is displayed
      And the "redeem_body" textfield with "Thank you" text is displayed
      And the "back_button" button with "Back to My O2 home" text is displayed
      And the "pega_feedback_accepted" feedback is sent

  @jira.QANOV-106815 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can go back to account after redeeming an offer
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     When clicks on the "redeem" button
      And the "redeemed_offer" popup is displayed
      And clicks on the "back_button" button
     Then the "Account" page is displayed

  @jira.QANOV-106816 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can reject to redeem a PEGA offer
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     When clicks on the "no_thanks" button
     Then the "remove_offer" popup is displayed

  @jira.QANOV-106817 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can go back to the dashboard after rejecting to redeem a PEGA offer
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     When clicks on the "no_thanks" button
      And the "remove_offer" popup is displayed
      And clicks on the "go_back" button
     Then the "Account" page is displayed
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-67188 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can access the short T&C screen for a PEGA offer
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     When clicks on the "terms_link" link
     Then the "Short Terms" page is displayed
      And the "Terms apply" header is displayed
      And the "offer_title" textfield is displayed
      And the "description" textfield is displayed
      And the "full_terms" link with "Full terms and conditions" text is displayed

  @jira.QANOV-67189 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can go back to the Your offers page after accessing the T&C
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     When clicks on the "terms_link" link
      And the "Short Terms" page is displayed
     When clicks on the "back" icon
     Then the "Your Offers" page is displayed

  @jira.QANOV-171301 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user with a offer without image can see a descriptive text instead in the Your Offers screen
    This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)
    The descriptive text of the image comes from the API
    other_affected_versions="2022-10"
    Given user has "any" PEGA offer not returning an image
      And user is in the "Your Offers" page
     Then the "[CONTEXT:card_without_image]" element in the "PEGA offers" list has the "[CONTEXT:image_descriptive_text]" in the "card_image" field

  @jira.QANOV-67190 @android @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-66627 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: A user can access the long T&C screen for a PEGA offer
    internal_checkpoint="This is the same for all PEGA offers, no matter where the user has access it from (alert, explore card or any dashboard module)"
    other_affected_versions="2022-10"
    Given user has PEGA offers for the "any" module
      And user is in the "Your Offers" page
     When clicks on the "terms_link" link
      And clicks on the "full_terms" link
     Then the external webview is displayed

  @jira.QANOV-155339 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @netcracker
  @o2uk @regression
  Scenario: A user with the x-sell offer can see the offer in Explore
    The offer should come in the novum_explore container in the explore content API
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    To be enabled once Explore web is completely rolled out
    Given user has a "postpay" account type
      And user has the x-sell offer for explore
      And user is in the "Explore" page
     When looks for a card in the "featured_content" carousel having the "title" textfield containing "[CONTEXT:xsell_offer_title]" text
     Then the "[CONTEXT:featured_content.card.image]" image is displayed
      And the "[CONTEXT:featured_content.card.pretitle]" textfield with the "OFFERS FOR xxx xxxx xxxx" format is displayed
      And the "[CONTEXT:featured_content.card.title]" textfield is displayed
      And the "[CONTEXT:featured_content.card.description]" textfield is displayed
      And the "[CONTEXT:featured_content.card.link]" link with "Find out more" text is displayed
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-155340 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @netcracker
  @o2uk @regression
  Scenario: A user with the x-sell offer access to the offer in Explore
    The offer should come in the novum_explore container in the explore content API
    To check the feedback, it can be found in the logs or in kibana. Filter by the uid and the events with method
    "explore-content-v3-users-[user_id]-cards-feedback-POST" should be displayed if the feedback has been sent.
    To be enabled once Explore web is completely rolled out
    Given user has a "postpay" account type
      And user has the x-sell offer for explore
      And user is in the "Explore" page
     When clicks on the card with "[CONTEXT:xsell_offer_title]" text on the "title" of the "featured_content" carousel
      And the "Your Offers" page is displayed
      And clicks on the "redeem" button of the card with "[CONTEXT:xsell_offer_title]" text on the "title"
     Then the TBD webview is displayed
      And the "TBD" header is displayed
      And the "pega_feedback_clicked" feedback is sent

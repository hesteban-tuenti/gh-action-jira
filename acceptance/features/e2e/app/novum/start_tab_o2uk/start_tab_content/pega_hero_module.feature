# -*- coding: utf-8 -*-
@jira.QANOV-267982
Feature: PEGA hero module

  Actions Before each Scenario:
    Given user has the "TBD" module configured in CMS for "start" page


  @jira.QANOV-267983 @TBD @android @cv.Future @ios @manual @mobile @o2uk @sanity
  Scenario: An AO2 user with PEGA hero offers can see them on the Start tab
    To check the hero container offers see the response to the API explore-content/users/me/modules?container_ids=novum_hero
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has PEGA offers for the "hero" container
      And user is in the "Start" page
     Then the "pega_carousel" carousel is displayed
      And each element in the "pega_carousel" carousel has the "offer_title" field
      And each element in the "pega_carousel" carousel has the "offer_description" field
      And each element in the "pega_carousel" carousel has the "offer_image" field
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-267984 @TBD @android @cv.Future @ios @manual @mobile @o2uk @regression
  Scenario: An AO2 user with >6 PEGA hero offers can only see 6 cards
    To check the hero container offers see the response to the API explore-content/users/me/modules?container_ids=novum_hero
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has ">6" PEGA offers for the "hero" container
      And user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "pega_carousel" carousel has "6" cards

  @jira.QANOV-267985 @TBD @android @cv.Future @ios @manual @mobile @o2uk @regression
  Scenario: An AO2 user with several PEGA hero offers can swipe through them
    To check the hero container offers see the response to the API explore-content/users/me/modules?container_ids=novum_hero
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has "several" PEGA offers for the "hero" container
      And user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "pega_carousel" carousel has ">1" cards
      And the "pega_carousel" carousel can be swiped

  @jira.QANOV-267986 @TBD @android @cv.Future @ios @manual @mobile @o2uk @smoke
  Scenario: An AO2 user with PEGA hero offers can access an offer
    To check the hero container offers see the response to the API explore-content/users/me/modules?container_ids=novum_hero
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has PEGA offers for the "hero" container
      And user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on any element in the "pega_carousel" carousel
     Then the "Your Offers" page is displayed
      And only the "PEGA alert offers" are displayed
      And the "pega_feedback_clicked" feedback is sent

  @jira.QANOV-267987 @TBD @android @cv.Future @ios @manual @mobile @o2uk @regression
  Scenario: An AO2 user with PEGA hero offers won't see an offer after rejecting it
    To check the hero container offers see the response to the API explore-content/users/me/modules?container_ids=novum_hero
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has PEGA offers for the "hero" container
      And user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on any element in the "pega_carousel" carousel
      And the "Your Offers" page is displayed
      And stores the text value from the "card_title" field of "pega_offers" list with "0" index
      And clicks on the "no_thanks" button of "pega_offers" list with "0" index
      And the "remove_offer" popup is displayed
      And clicks on the "go_back" button
     Then the "Start" page is displayed
      And no card in the "pega_offers" carousel has the "[CONTEXT:card_title]" text in the "offer_title" field
      And the "pega_feedback_declined" feedback is sent

  @jira.QANOV-267988 @TBD @android @cv.Future @ios @manual @mobile @o2uk @regression
  Scenario: An AO2 user with PEGA hero offers won't see an offer after redeeming it
    To check the hero container offers see the response to the API explore-content/users/me/modules?container_ids=novum_hero
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has PEGA offers for the "hero" container
      And user has a NBA card with "mainURL"
      And user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on any element in the "pega_carousel" carousel
      And the "Your Offers" page is displayed
      And searches the "card"
      And clicks on the "redeem" field of the element in the "pega_offers" list with the "card_title" field that contains the "[CONTEXT:card_title]" text
      And the "redeemed_offer" popup is displayed
      And clicks on the "back_button" button
     Then the "Start" page is displayed
      And no card in the "pega_offers" carousel has the "[CONTEXT:card_title]" text in the "offer_title" field
      And the "pega_feedback_accepted" feedback is sent

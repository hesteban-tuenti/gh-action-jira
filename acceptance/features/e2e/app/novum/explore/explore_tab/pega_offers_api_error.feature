# -*- coding: utf-8 -*-
@jira.QANOV-127444
Feature: PEGA Offers in Explore api error

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.QANOV-125373 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk @regression
  Scenario: Explore content API returns an error: Content associated with API won't be displayed
    Given Explore content API returns an error
     Then the "Explore" page is displayed
      And the cards related to the explore content API are not displayed

  @jira.QANOV-125391 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-125183
  @jira.link.parent_test_plan.QANOV-77438 @mobile @no_automatable @o2uk @regression
  Scenario: User accepts to refuse an offer: An error occurs
    Given user has a NBA card with "discard_offer" displayed
     When clicks on the "discard_offer" link
      And clicks on the "ok_button" button
     Then an error occurs
      And the card is still displayed

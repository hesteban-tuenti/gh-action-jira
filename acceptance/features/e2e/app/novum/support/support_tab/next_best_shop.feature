# -*- coding: utf-8 -*-
@jira.QANOV-309824
Feature: Next best shop


  @jira.QANOV-309825 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-558005 @manual @mobile @o2de
  @sanity
  Scenario: A o2de user can see a "next best shop" card with an appointment button
    A "Next Best Shop" card will be displayed if the next best shop parameters are available (the only optional field is
    book appointment, so the "Next Best Shop" card won't be displayed if any other field from the API is not received).
    Card image: if more than 1 image is received by the API, we will display the first one. The image crop will be done by filling the space and centering.
    Card title: name of the store (max 2 lines, elipsis if longer)
    Card subtitle: address (max 3 lines, elipsis if longer)
    The entry points displayed are "Book an appointment", "More information", "Call now", "Route to store". Keep in mind that those entry points
    can be updated in CMS.
    NOTE: this card is configured with CMS.
    Given user has a next best shop card available "with" the appointment option
      And user has the "Next Best Shop" module configured in CMS for "Support" page
      And user is in the "Support" page
     Then the "next_best_shop.card" card is displayed
      And the "next_best_shop.shop_image" image is displayed
      And the "next_best_shop.shop_name" textfield is displayed
      And the "next_best_shop.shop_address" textfield is displayed
      And the "next_best_shop.store_actions" list is displayed
      And each element has the "name" field displayed in the "next_best_shop.store_actions" list
      And each element has the "icon" field displayed in the "next_best_shop.store_actions" list

  @jira.QANOV-309833 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-558005 @manual @mobile @o2de
  @regression
  Scenario: A o2de user cannot see a "next best shop" card if not all mandatory parameters are returned by API
    A "Next Best Shop" card will be displayed if the next best shop parameters are available (the only optional field is
    book appointment, so the "Next Best Shop" card won't be displayed if any other field from the API is not received).
    NOTE: this card is configured with CMS.
    Given user has not a next best shop card available
      And user has the "Next Best Shop" module configured in CMS for "Support" page
      And user is in the "Support" page
     Then the "next_best_shop.card" card is not displayed

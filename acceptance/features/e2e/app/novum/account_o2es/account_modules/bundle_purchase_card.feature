# -*- coding: utf-8 -*-
@jira.QANOV-492947
Feature: Bundle Purchase Card


  @jira.QANOV-492948 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A mobile user can see the account dashboard for his/her active mobile line
    TBD the names of the modules
    Given user has a "mobile" product
      And user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
      And user is in the "Mobile Dashboard" page
     Then the "bundle_purchase_card" module is displayed
      And the "bundle_purchase_card.icon" icon is displayed
      And the "bundle_purchase_card.title" textfield is displayed
      And the "bundle_purchase_card.description" textfield is displayed
      And the "bundle_purchase_card.button" button is displayed

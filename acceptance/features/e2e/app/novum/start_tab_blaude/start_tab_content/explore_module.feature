# -*- coding: utf-8 -*-
@jira.QANOV-256178
Feature: Explore module

  Actions Before each Scenario:
    Given user has the "explore-widget" module configured in CMS for "start" page


  @jira.QANOV-256179 @android @ber @blaude @ios @jira.cv.14.0 @jira.link.detects.LOC-1054 @automatic @mobile @sanity
  @jira.link.detects.LOC-1210 @live @next @qa @webapp @raitt_drop3
  Scenario: A user with any active product will see a module with offers in Start tab
    Given user has a "any" product in "active" status
      And user is in the "Start" page
     Then the "explore.title" textfield is displayed
      And each element in the "explore.cards" list has the "title" field
      And each element in the "explore.cards" list has the "description" field

  @jira.QANOV-308055 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @smoke
  Scenario: A user with all products cancelled will not see a module with offers in Start tab
    Given user has all products in "cancelled" status
      And user is in the "Start" page
     Then the "explore" module is not displayed

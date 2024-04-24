# -*- coding: utf-8 -*-
@jira.QANOV-310528
Feature: Explore module

  Actions Before each Scenario:
    Given user has the "explore" module configured in CMS for "start" page


  @jira.QANOV-310530 @android @ber @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @sanity
  Scenario: A user with any active product will see a module with offers in Start tab
    Given user has a "any" product in "active" status
      And user is in the "Start" page
     Then the "explore" module is displayed
      And the "explore.title" textfield is displayed
      And each element in the "explore.list" list has the "image" field
      And each element in the "explore.list" list has the "name" field
      And each element in the "explore.list" list has the "description" field
      And each element in the "explore.list" list has the "button" field

  @jira.QANOV-310531 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user can access to Explore page from the Explore module in Start tab
    Given user has a "any" product in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "explore.link" link
     Then the "Explore" page is displayed

  @jira.QANOV-310532 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user with all products cancelled will not see a module with offers in Start tab
    Given user has all products in "cancelled" status
      And user is in the "Start" page
     Then the "explore" module is not displayed

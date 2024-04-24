# -*- coding: utf-8 -*-
@jira.QANOV-424462
Feature: Quick actions


  @jira.QANOV-424463 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user can see the quick actions carousel in the Start tab
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "quick_actions_carousel_title" textfield is displayed
      And the "quick_actions_carousel" carousel is displayed
      And each element in the "quick_actions_carousel" carousel has the "icon" field
      And each element in the "quick_actions_carousel" carousel has the "name" field

  @jira.QANOV-517456 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: A user cannot see the quick actions carousel in the Start tab during a maintenance window
    Given user has the "TBD" module configured in CMS for "start" page
      And there is a maintenance window
      And user is in the "Start" page
     Then the "quick_actions_carousel_title" textfield is not displayed
      And the "quick_actions_carousel" carousel is not displayed

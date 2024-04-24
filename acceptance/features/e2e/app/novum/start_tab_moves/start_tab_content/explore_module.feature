# -*- coding: utf-8 -*-
@jira.QANOV-740
Feature: Explore module


  @jira.QANOV-298193 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @smoke
  @manual @next @live @cert2 @qa
  Scenario: A telco user lands into the start tab: a module with offers will be shown
    Currently, this module is not enabled in the CMS but may be enabled again in the future
    Given user has the "explore-widget" module configured in CMS for "start" page
      And user has a "telco" account type
      And user is in the "Start" page
      And waits until the "explore" element is visible
     Then the "explore" module is displayed
      And each element in the "explore.cards" list has the "image" field
      And each element in the "explore.cards" list has the "title" field
      And each element in the "explore.cards" list has the "pretitle" field
      And each element in the "explore.cards" list has the "description" field

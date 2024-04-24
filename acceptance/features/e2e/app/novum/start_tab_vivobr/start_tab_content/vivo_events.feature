# -*- coding: utf-8 -*-
@jira.QANOV-424464
Feature: Vivo events


  @jira.QANOV-424465 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user can see the Vivo events vertical mosaic in the Start tab
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "vivo_events_mosaic" list is displayed
      And each element in the "vivo_events_mosaic" list has the "title" field

  @jira.QANOV-517457 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: A user can see the Vivo events vertical mosaic in the Start tab during a maintenance window
    Given user has the "TBD" module configured in CMS for "start" page
      And there is a maintenance window
      And user is in the "Start" page
     Then the "vivo_events_mosaic" list is displayed

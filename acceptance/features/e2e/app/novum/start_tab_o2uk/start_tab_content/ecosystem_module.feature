# -*- coding: utf-8 -*-
@jira.QANOV-266810
Feature: Ecosystem module

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the "services-summary" module configured in CMS for "start" page
      And user is in the "Start" page


  @jira.QANOV-266811 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @sanity
  Scenario: A user will see the ecosystem module in Start tab
     Then the "ecosystem" module is displayed
      And the "ecosystem.title" textfield with "BOOST YOUR EXPERIENCE" text is displayed
      And the "ecosystem.list" list has "5" elements
      And the "0" index in the "ecosystem.list" list has the "name" field with "Airtime Rewards" text
      And the "1" index in the "ecosystem.list" list has the "name" field with "Kindred" text
      And the "2" index in the "ecosystem.list" list has the "name" field with "Disney+" text
      And the "3" index in the "ecosystem.list" list has the "name" field with "Extras" text
      And the "4" index in the "ecosystem.list" list has the "name" field with "Priority" text
      And each element in the "ecosystem.list" list has the "description" field
      And each element in the "ecosystem.list" list has the "image" field

  @jira.QANOV-266812 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user can swipe the ecosystem list
     Then the "ecosystem.list" list has "5" elements
      And the "ecosystem.list" list can be swiped

  @jira.<jira_id> @TBD @android @ios @jira.cv.14.1 @manual @mobile @o2uk @<test_priority>
  Scenario Outline: A user can access to see the <app_name> information
    Pending to include more checks about the page when it will be defined
     When clicks on the "<index>" element in the "ecosystem" list
     Then the "<app_name> Information" page is displayed

    Examples:
          | app_name        | index | jira_id      | test_priority |
          | Airtime Rewards | 0     | QANOV-266813 | smoke         |
          | Kindred         | 1     | QANOV-266814 | regression    |
          | Disney+         | 2     | QANOV-266815 | regression    |
          | Extras          | 3     | QANOV-266816 | regression    |
          | Priority        | 4     | QANOV-266817 | regression    |

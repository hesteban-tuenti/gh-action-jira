# -*- coding: utf-8 -*-
@jira.QANOV-9840
Feature: Test lines

  Actions Before the Feature:
    Given user is logged in the CMS

  Actions After the Feature:
     Then logs out from the CMS


  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @mobile @no_automatable @not_hardening @sanity
  Scenario Outline: A test line user can see the cards from the selected segments and micro-segments in the app Explore tab
    Given user is in the "Explore" page
      And is logged in with an Explore test line
     Then the cards associated with the layout and microsegments of the test line are displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 10.5   | QANOV-9874   |
          | o2uk    | 10.5   | QANOV-9875   |
          | moves   | 10.5   | QANOV-9876   |
          | blaude  | 13.9   | QANOV-228105 |
          | o2de    | 14.2   | QANOV-228106 |
          | o2es    | Future | QANOV-407115 |

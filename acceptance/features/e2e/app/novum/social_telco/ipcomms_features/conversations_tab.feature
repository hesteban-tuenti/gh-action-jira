# -*- coding: utf-8 -*-
@jira.QANOV-824
Feature: Conversations tab


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-103419 @manual @mobile @regression @har
  Scenario Outline: A user can not share content by <product> app
    Given user is logged in
     When opens "default browser" app
      And clicks on the "share" button
     Then the app icon is not displayed

    Examples:
          | product | cv   | jira_id      |
          | moves   | 11.0 | QANOV-825    |
          | o2uk    | 11.0 | QANOV-826    |
          | vivobr  | 11.0 | QANOV-827    |
          | blaude  | 13.9 | QANOV-254774 |
          | o2de    | 14.2 | QANOV-254775 |

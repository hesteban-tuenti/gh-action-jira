# -*- coding: utf-8 -*-
@jira.QANOV-519390
Feature: Linked in-app in card

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-519389 @manual @mobile
  @regression
  Scenario Outline: User can see a linked in-app when accessing to the card's link configured with a linked-inapp
    Given user has a card with a cta with a "linked_in_app" link configured in a Explore module
     When searches the "card"
      And clicks on the "cta_button" field in the explore "card"
     Then the "In App Message" page is displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-519391 |
          | moves   | QANOV-519392 |
          | vivobr  | QANOV-519393 |
          | blaude  | QANOV-519394 |
          | o2de    | QANOV-519395 |
          | o2es    | QANOV-519396 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-519389 @manual @mobile
  @regression
  Scenario Outline: User can go back to Explore tab after accessing to the a linked in-app
    Given user has a card with a cta with a "linked_in_app" link configured in a Explore module
     When searches the "card"
      And clicks on the "cta_button" field in the explore "card"
      And the "In App Message" page is displayed
      And clicks on the "close_button" button
      And the "[CONTEXT:explore_page]" page is displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-519397 |
          | moves   | QANOV-519398 |
          | vivobr  | QANOV-519399 |
          | blaude  | QANOV-519400 |
          | o2de    | QANOV-519401 |
          | o2es    | QANOV-519402 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-519389 @manual @mobile
  @regression
  Scenario Outline: User can who navigates to the page configured a linked in-app can go back to Explore tab
    Given user has a card with a cta with a "linked_in_app" link configured in a Explore module
     When searches the "card"
      And clicks on the "cta_button" field in the explore "card"
      And the "In App Message" page is displayed
      And clicks on the "primary_button" button
      And the "[CONTEXT:modular_page]" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "[CONTEXT:explore_page]" page is displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-519403 |
          | moves   | QANOV-519404 |
          | vivobr  | QANOV-519405 |
          | blaude  | QANOV-519406 |
          | o2de    | QANOV-519407 |
          | o2es    | QANOV-519408 |

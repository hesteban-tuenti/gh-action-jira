# -*- coding: utf-8 -*-
@jira.QANOV-370816
Feature: Layouts


  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.link.parent_test_plan.QANOV-370231
  @jira.link.parent_test_plan.QANOV-386148 @manual @mobile @sanity
  Scenario Outline: User matching a layout will see the Explore content defined in the Layout
    Given there is a layout segmented with an audience
      And user belongs to the audience
      And user is in the "Explore" page
     Then the content defined in the matched layout is shown
      And the content is shown in the same order as in the layout

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-370817 |
          | o2uk    | QANOV-370818 |
          | moves   | QANOV-370819 |
          | o2es    | QANOV-370822 |
          | o2de    | QANOV-370821 |

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-370820 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.link.parent_test_plan.QANOV-370231 @manual @mobile
  @regression
  Scenario Outline: User matching several layouts will see only the Explore content from the first matched layout
    Given there is ">1" layouts segmented with the same audience
      And user belongs to the audience
      And user is in the "Explore" page
     Then the content defined in the first layout is shown
      And the content defined in the other layouts are not shown

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-370823 |
          | o2uk    | QANOV-370824 |
          | moves   | QANOV-370825 |
          | o2es    | QANOV-370828 |
          | o2de    | QANOV-370827 |

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-370826 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.link.parent_test_plan.QANOV-370231 @manual @mobile
  @regression
  Scenario Outline: User who doesn't match any layout will see the content from the default layout
    Given there is ">1" layouts segmented with the same audience
      And there is "1" layout not segmented with an audience
      And user does not belong to any audience in the layouts
      And there is a module duplicated in several layouts
      And user is in the "Explore" page
     Then the content defined in the default layout is shown

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-370829 |
          | o2uk    | QANOV-370830 |
          | moves   | QANOV-370831 |
          | o2es    | QANOV-370834 |
          | o2de    | QANOV-370833 |

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-370832 |

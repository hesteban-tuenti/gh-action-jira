# -*- coding: utf-8 -*-
@jira.QANOV-448758
Feature: Carousel circle

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see the title of a Carousel circle module
    This module only applies to Loja or future modular pages (cannot be tested in explore)
    Given user has a "carousel circle" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-448759 |
          | o2uk    | QANOV-448760 |
          | moves   | QANOV-448761 |
          | blaude  | QANOV-448762 |
          | o2de    | QANOV-448763 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-448764 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a Carousel circle with an image
    This module only applies to Loja or future modular pages (cannot be tested in explore)
    Given user has a "carousel circle" module in the Explore content
     When searches the "card"
     Then the selected explore card has the "image" media field displayed
      And the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-448765 |
          | o2uk    | QANOV-448766 |
          | moves   | QANOV-448767 |
          | blaude  | QANOV-448768 |
          | o2de    | QANOV-448769 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-448770 |

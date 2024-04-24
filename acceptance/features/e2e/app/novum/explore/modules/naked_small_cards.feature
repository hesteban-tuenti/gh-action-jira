# -*- coding: utf-8 -*-
@jira.QANOV-448838
Feature: Naked small cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a Naked small cards module without section title
    Given user has a "naked small cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448839 |
          | o2uk    | 14.8   | QANOV-448840 |
          | moves   | 14.8   | QANOV-448841 |
          | blaude  | 14.8   | QANOV-448842 |
          | o2de    | 14.8   | QANOV-448843 |
          | o2es    | Future | QANOV-448844 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a Naked small cards module with a section title
    Given user has a "naked small cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-448845 |
          | o2uk    | 14.8 | QANOV-448846 |
          | moves   | 14.8 | QANOV-448847 |
          | blaude  | 14.8 | QANOV-448848 |
          | o2de    | 14.8 | QANOV-448849 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-448850 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see the image with "<shape>" shape in the Naked small cards card
    Given user has a "naked small cards" card with a "<shape>" shape image in the Explore content
     When searches the "card"
     Then the selected explore "card" has a "shape" shape image

    @smoke
    Examples:
          | product | shape    | cv   | jira_id      |
          | vivobr  | circular | 14.8 | QANOV-493040 |
          | vivobr  | square   | 14.8 | QANOV-493041 |
          | o2uk    | circular | 14.8 | QANOV-493042 |
          | o2uk    | square   | 14.8 | QANOV-493043 |
          | moves   | circular | 14.8 | QANOV-493044 |
          | moves   | square   | 14.8 | QANOV-493045 |
          | blaude  | circular | 14.8 | QANOV-493046 |
          | blaude  | square   | 14.8 | QANOV-493047 |
          | o2de    | circular | 14.8 | QANOV-493048 |
          | o2de    | square   | 14.8 | QANOV-493049 |

    @regression
    Examples:
          | product | shape    | cv     | jira_id      |
          | o2es    | circular | Future | QANOV-493050 |
          | o2es    | square   | Future | QANOV-493051 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual
  Scenario Outline: User can see a title in a Naked small cards card
    Given user has a card with a title on a "naked small cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-448857 |
          | o2uk    | 14.8 | QANOV-448858 |
          | moves   | 14.8 | QANOV-448859 |
          | blaude  | 14.8 | QANOV-448860 |
          | o2de    | 14.8 | QANOV-448861 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-448862 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a subtitle in a Naked small cards card
    Given user has a card with a subtitle on a "naked small cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "subtitle" field with "[CONTEXT:card_subtitle]" text

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-448863 |
          | o2uk    | 14.8 | QANOV-448864 |
          | moves   | 14.8 | QANOV-448865 |
          | blaude  | 14.8 | QANOV-448866 |
          | o2de    | 14.8 | QANOV-448867 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-448868 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a description in a Naked small cards card
    Given user has a card with a description on a "naked small cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "description" field with "[CONTEXT:card_desc]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448869 |
          | o2uk    | 14.8   | QANOV-448870 |
          | moves   | 14.8   | QANOV-448871 |
          | blaude  | 14.8   | QANOV-448872 |
          | o2de    | 14.8   | QANOV-448873 |
          | o2es    | Future | QANOV-448874 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression @tbd
  Scenario Outline: Naked small cards module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "naked small cards" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448881 |
          | o2uk    | 14.8   | QANOV-448882 |
          | moves   | 14.8   | QANOV-448883 |
          | blaude  | 14.8   | QANOV-448884 |
          | o2de    | 14.8   | QANOV-448885 |
          | o2es    | Future | QANOV-448886 |

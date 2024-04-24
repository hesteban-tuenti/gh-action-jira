# -*- coding: utf-8 -*-
@jira.QANOV-448771
Feature: Naked cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a Naked cards module without section title
    Given user has a "naked cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448772 |
          | o2uk    | 14.8   | QANOV-448773 |
          | moves   | 14.8   | QANOV-448774 |
          | blaude  | 14.8   | QANOV-448775 |
          | o2de    | 14.8   | QANOV-448776 |
          | o2es    | Future | QANOV-448777 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a Naked cards module with a section title
    Given user has a "naked cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-448778 |
          | o2uk    | 14.8 | QANOV-448779 |
          | moves   | 14.8 | QANOV-448780 |
          | blaude  | 14.8 | QANOV-448781 |
          | o2de    | 14.8 | QANOV-448782 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-448783 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a Naked cards card with an image
    Given user has a "naked cards" module in the Explore content
     When searches the "card"
     Then the selected explore card has the "image" media field displayed
      And the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-448790 |
          | o2uk    | 14.8 | QANOV-448791 |
          | moves   | 14.8 | QANOV-448792 |
          | blaude  | 14.8 | QANOV-448793 |
          | o2de    | 14.8 | QANOV-448794 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-448795 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a pretitle in a Naked cards card
    Given user has a card with a pretitle on a "naked cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "pretitle" field with "[CONTEXT:card_pretitle]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448796 |
          | o2uk    | 14.8   | QANOV-448797 |
          | moves   | 14.8   | QANOV-448798 |
          | blaude  | 14.8   | QANOV-448799 |
          | o2de    | 14.8   | QANOV-448800 |
          | o2es    | Future | QANOV-448801 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a title in a Naked cards card
    Given user has a card with a title on a "naked cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448802 |
          | o2uk    | 14.8   | QANOV-448803 |
          | moves   | 14.8   | QANOV-448804 |
          | blaude  | 14.8   | QANOV-448805 |
          | o2de    | 14.8   | QANOV-448806 |
          | o2es    | Future | QANOV-448807 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a subtitle in a Naked cards card
    Given user has a card with a subtitle on a "naked cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "subtitle" field with "[CONTEXT:card_subtitle]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448808 |
          | o2uk    | 14.8   | QANOV-448809 |
          | moves   | 14.8   | QANOV-448810 |
          | blaude  | 14.8   | QANOV-448811 |
          | o2de    | 14.8   | QANOV-448812 |
          | o2es    | Future | QANOV-448813 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a tag in a Naked cards card
    Given user has a card with a tag on a "naked cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448820 |
          | o2uk    | 14.8   | QANOV-448821 |
          | moves   | 14.8   | QANOV-448822 |
          | blaude  | 14.8   | QANOV-448823 |
          | o2de    | 14.8   | QANOV-448824 |
          | o2es    | Future | QANOV-448825 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression @tbd
  Scenario Outline: Naked cards module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "naked cards" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-448832 |
          | o2uk    | 14.8   | QANOV-448833 |
          | moves   | 14.8   | QANOV-448834 |
          | blaude  | 14.8   | QANOV-448835 |
          | o2de    | 14.8   | QANOV-448836 |
          | o2es    | Future | QANOV-448837 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke
  Scenario Outline: User can see the card link cta in a Naked cards card
    Given user has a "naked cards" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "card_link" field with "[CONTEXT:card_link]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-468569 |
          | o2uk    | 14.8   | QANOV-468570 |
          | moves   | 14.8   | QANOV-468571 |
          | blaude  | 14.8   | QANOV-468572 |
          | o2de    | 14.8   | QANOV-468573 |
          | o2es    | Future | QANOV-468574 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can access to the card link cta in a Naked cards card
    Given user has a "naked cards" module in the Explore content
     When searches the "card"
      And clicks on the "card_link" field in the explore "card"
      And the Explore card is opened
      And the Explore card is closed
     Then the "[CONTEXT:explore_page]" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-468575 |
          | o2uk    | 14.8   | QANOV-468576 |
          | moves   | 14.8   | QANOV-468577 |
          | blaude  | 14.8   | QANOV-468578 |
          | o2de    | 14.8   | QANOV-468579 |
          | o2es    | Future | QANOV-468580 |

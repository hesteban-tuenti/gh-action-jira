# -*- coding: utf-8 -*-
@jira.QANOV-297839
Feature: Data cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a Data cards module without section title
    Given user has a "data cards" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-442205 |
          | o2uk    | QANOV-442206 |
          | blaude  | QANOV-442207 |
          | o2de    | QANOV-442208 |
          | moves   | QANOV-442209 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-442211 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile
  Scenario Outline: User can see a Data cards module with a section title
    Given user has a "data cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @jira.cv.14.3 @smoke
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343708 |
          | o2uk    | QANOV-343709 |
          | blaude  | QANOV-343710 |
          | o2de    | QANOV-343711 |
          | moves   | QANOV-297840 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407187 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a top price description in a Data card
    Given user has a card with a top price description on a "data cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "top_price_description" field with "[CONTEXT:card_top_price_description]" text

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343740 |
          | o2uk    | QANOV-343741 |
          | blaude  | QANOV-343742 |
          | o2de    | QANOV-343743 |
          | moves   | QANOV-297844 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407194 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a price in a Data card
    Given user has a card with a price on a "data cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "price" field with "[CONTEXT:card_price]" text

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343745 |
          | o2uk    | QANOV-343746 |
          | blaude  | QANOV-343747 |
          | o2de    | QANOV-343748 |
          | moves   | QANOV-298442 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407195 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a bottom price description in a Data card
    Given user has a card with a bottom price description on a "data cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "bottom_price_description" field with "[CONTEXT:card_bottom_price_description]" text

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343749 |
          | o2uk    | QANOV-343750 |
          | blaude  | QANOV-343751 |
          | o2de    | QANOV-343752 |
          | moves   | QANOV-298444 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407196 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a tag in a Data card
    Given user has a card with a tag on a "data cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343753 |
          | o2uk    | QANOV-343754 |
          | blaude  | QANOV-343755 |
          | o2de    | QANOV-343756 |
          | moves   | QANOV-297846 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407197 |


  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression @tbd
  Scenario Outline: Data card module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "data cards" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343767 |
          | o2uk    | QANOV-343768 |
          | blaude  | QANOV-343769 |
          | o2de    | QANOV-343770 |
          | moves   | QANOV-297851 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407200 |

# -*- coding: utf-8 -*-
@jira.QANOV-297828
Feature: Banner hero

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a Banner hero module without section title
    Given user has a "banner hero" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.5   | QANOV-519221 |
          | o2uk    | 14.5   | QANOV-519222 |
          | blaude  | 14.5   | QANOV-519223 |
          | o2de    | 14.5   | QANOV-519224 |
          | moves   | 14.5   | QANOV-519225 |
          | o2es    | Future | QANOV-519226 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile
  Scenario Outline: User can see a Banner hero module with section title
    Given user has a "banner hero" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-343646 |
          | o2uk    | 14.3 | QANOV-343647 |
          | blaude  | 14.3 | QANOV-343648 |
          | o2de    | 14.3 | QANOV-343650 |
          | moves   | 14.3 | QANOV-297829 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-407144 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile
  Scenario Outline: User can see a Banner hero card
    Given user has a "banner hero" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cta" field with "[CONTEXT:card_cta]" text

    @raitt_drop1 @sanity
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-343653 |

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-343651 |
          | o2uk    | 14.3 | QANOV-343652 |
          | o2de    | 14.3 | QANOV-343654 |
          | moves   | 14.3 | QANOV-297830 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-407145 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a link in a Banner hero card
    Given user has a card with a link on a "banner hero" Explore module
     When searches the "card"
     Then the selected explore "card" has the "link" field with "[CONTEXT:card_link]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343663 |
          | o2uk    | 14.3   | QANOV-343664 |
          | blaude  | 14.3   | QANOV-343665 |
          | o2de    | 14.3   | QANOV-343666 |
          | moves   | 14.3   | QANOV-325339 |
          | o2es    | Future | QANOV-407148 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can click in a link in a Banner hero card
    Given user has a card with a link on a "banner hero" Explore module
     When searches the "card"
      And clicks on the "bottom_link" field in the explore "card"
     Then the page configured in the CMS is opened

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343667 |
          | o2uk    | 14.3   | QANOV-343668 |
          | blaude  | 14.3   | QANOV-343669 |
          | o2de    | 14.3   | QANOV-343670 |
          | moves   | 14.3   | QANOV-325340 |
          | o2es    | Future | QANOV-407149 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a tag in a Banner hero card
    Given user has a card with a tag on a "banner hero" Explore module
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343671 |
          | o2uk    | 14.3   | QANOV-343672 |
          | blaude  | 14.3   | QANOV-343674 |
          | o2de    | 14.3   | QANOV-343675 |
          | moves   | 14.3   | QANOV-297836 |
          | o2es    | Future | QANOV-407150 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.3 @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a bottom text without a link in a Banner hero module
    Given user has a bottom text without a link on a "banner hero" Explore module
     When searches the "module"
     Then the selected explore "module" has the "bottom_text.text" field with "[CONTEXT:module_bottom_text]" text
      And the selected explore "module" has the "bottom_text.icon" field

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343681 |
          | o2uk    | 14.3   | QANOV-343682 |
          | blaude  | 14.3   | QANOV-343683 |
          | o2de    | 14.3   | QANOV-343684 |
          | moves   | 14.3   | QANOV-297833 |
          | o2es    | Future | QANOV-407152 |

  @jira.<jira_id> @<product> @android @ios @jira.cv<cv> @manual @mobile @regression
  Scenario Outline: User can see a bottom text with a link in a Banner hero module
    Given user has a bottom text with a link on a "banner hero" Explore module
     When searches the "module"
     Then the selected explore "module" has the "bottom_text.link" field with "[CONTEXT:module_bottom_link]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343685 |
          | o2uk    | 14.3   | QANOV-343686 |
          | blaude  | 14.3   | QANOV-343687 |
          | o2de    | 14.3   | QANOV-343688 |
          | moves   | 14.3   | QANOV-297834 |
          | o2es    | Future | QANOV-407153 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a bottom text with an icon in a Banner hero module
    Given user has a bottom text with an icon on a "banner hero" Explore module
     When searches the "module"
      And the selected explore "module" has the "bottom_text.icon" field

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-519227 |
          | o2uk    | 14.3   | QANOV-519228 |
          | blaude  | 14.3   | QANOV-519229 |
          | o2de    | 14.3   | QANOV-519230 |
          | moves   | 14.3   | QANOV-519231 |
          | o2es    | Future | QANOV-519232 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a bottom text without an icon in a Banner hero module
    Given user has a bottom text without an icon on a "banner hero" Explore module
     When searches the "module"
      And the selected explore "module" has not the "bottom_text.icon" field

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-519233 |
          | o2uk    | 14.3   | QANOV-519234 |
          | blaude  | 14.3   | QANOV-519235 |
          | o2de    | 14.3   | QANOV-519236 |
          | moves   | 14.3   | QANOV-519237 |
          | o2es    | Future | QANOV-519238 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can click on the link of a bottom text in a Banner hero module
    Given user has a bottom text with a link on a "banner hero" Explore module
     When searches the "module"
      And clicks on the "bottom_text.link" field in the explore "module"
     Then the page configured in the CMS is opened

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343690 |
          | o2uk    | 14.3   | QANOV-343691 |
          | blaude  | 14.3   | QANOV-343692 |
          | o2de    | 14.3   | QANOV-343693 |
          | moves   | 14.3   | QANOV-297835 |
          | o2es    | Future | QANOV-407154 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see several bottom text in a Banner hero module
    The maximun that can configured in CMS is 3 bottom text
    Given user has "3" bottom text on a "banner hero" Explore module
     When searches the "module"
     Then the selected explore "module" has the "bottom_row_list" field
      And the "bottom_row_list" list has "3" elements

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343694 |
          | o2uk    | 14.3   | QANOV-343695 |
          | blaude  | 14.3   | QANOV-343696 |
          | o2de    | 14.3   | QANOV-343697 |
          | moves   | 14.3   | QANOV-325341 |
          | o2es    | Future | QANOV-407155 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can swipe a Banner hero module
    Given user has a "banner hero" module scrollable
     When searches the "module"
      And takes a screenshot of the carousel
      And swipes the carousel from "right to left" in the selected explore module
     Then the carousel is not in the same position as before

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343698 |
          | o2uk    | 14.3   | QANOV-343700 |
          | blaude  | 14.3   | QANOV-343701 |
          | o2de    | 14.3   | QANOV-343702 |
          | moves   | 14.3   | QANOV-297838 |
          | o2es    | Future | QANOV-407156 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @tbd
  Scenario Outline: Banner hero module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "banner hero" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-343703 |
          | o2uk    | 14.3   | QANOV-343704 |
          | blaude  | 14.3   | QANOV-343705 |
          | o2de    | 14.3   | QANOV-343706 |
          | moves   | 14.3   | QANOV-325342 |
          | o2es    | Future | QANOV-407157 |

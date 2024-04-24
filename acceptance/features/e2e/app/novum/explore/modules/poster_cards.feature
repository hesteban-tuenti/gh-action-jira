# -*- coding: utf-8 -*-
@jira.QANOV-442289
Feature: Poster cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a Poster cards module without section title
    The module title will not be visible if there is not both module and section title on the modular page.
    Given user has a "poster cards" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-442290 |
          | o2uk    | 14.8 | QANOV-442292 |
          | moves   | 14.8 | QANOV-442294 |
          | blaude  | 14.8 | QANOV-442296 |
          | o2de    | 14.8 | QANOV-442298 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-442299 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see a Poster cards module with a section title
    The title of the module will be visible if there is no title in the modular page.
    Otherwise the section title of the modular page will be visible.
    Given user has a "poster cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-442301 |
          | o2uk    | 14.8 | QANOV-442302 |
          | moves   | 14.8 | QANOV-442303 |
          | blaude  | 14.8 | QANOV-442304 |
          | o2de    | 14.8 | QANOV-442306 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-442307 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  Scenario Outline: User can see the image of a Poster cards card
    Given user has a "poster cards" module in the Explore content
     When searches the "card"
     Then the selected explore card has the "image" media field displayed

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-442317 |
          | o2uk    | 14.8 | QANOV-442318 |
          | moves   | 14.8 | QANOV-442319 |
          | blaude  | 14.8 | QANOV-442320 |
          | o2de    | 14.8 | QANOV-442321 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-442322 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can see a tag in a Poster cards card
    Given user has a card with a tag on a "poster cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:tag_text]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-442329 |
          | o2uk    | 14.8   | QANOV-442330 |
          | moves   | 14.8   | QANOV-442331 |
          | blaude  | 14.8   | QANOV-442332 |
          | o2de    | 14.8   | QANOV-442333 |
          | o2es    | Future | QANOV-442334 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression
  Scenario Outline: User can swipe a Poster cards module
    Given user has a "poster cards" module scrollable
     When searches the "module"
      And takes a screenshot of the carousel
      And swipes the carousel from "right to left" in the selected explore module
     Then the carousel is not in the same position as before

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-442335 |
          | o2uk    | 14.8   | QANOV-442337 |
          | moves   | 14.8   | QANOV-442338 |
          | blaude  | 14.8   | QANOV-442339 |
          | o2de    | 14.8   | QANOV-442340 |
          | o2es    | Future | QANOV-442341 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646 @manual @mobile
  @regression @tbd
  Scenario Outline: Poster cards module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "poster cards" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.8   | QANOV-442342 |
          | o2uk    | 14.8   | QANOV-442344 |
          | moves   | 14.8   | QANOV-442346 |
          | blaude  | 14.8   | QANOV-442347 |
          | o2de    | 14.8   | QANOV-442348 |
          | o2es    | Future | QANOV-442349 |

# -*- coding: utf-8 -*-
@jira.QANOV-285854
Feature: Highlighted cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @mobile @sanity
  Scenario Outline: User can see a Highlighted cards module without section title
    Given user has a "highlighted cards" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.6   | QANOV-449468 |
          | o2uk    | 14.6   | QANOV-449469 |
          | blaude  | 14.6   | QANOV-449470 |
          | o2de    | 14.6   | QANOV-449471 |
          | moves   | 14.6   | QANOV-449472 |
          | o2es    | Future | QANOV-449473 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-285803 @mobile @webapp
  Scenario Outline: User can see a Highlighted cards module with section title
    Given user has a "highlighted cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @automatic @jira.cv.14.3 @live @next @qa @smoke
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-285855 |

    @automatic @cert3 @jira.cv.14.3 @live @next @qa @raitt_drop1 @smoke
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-285858 |

    @automatic @cert0 @cert1 @jira.cv.14.3 @live @next @qa @smoke
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-285856 |

    @automatic @cert2 @jira.cv.14.3 @live @next @qa @smoke
    Examples:
          | product | jira_id      |
          | moves   | QANOV-285857 |

    @manual @jira.cv.14.3 @smoke
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-285859 |

    @jira.cv.Future @manual @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-370120 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-285803 @mobile @webapp
  Scenario Outline: User can see the details of a highlighted card without an image
    Given user has a "highlighted cards" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text

    @automatic @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-285860 |

    @automatic @cert3 @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-285863 |

    @automatic @cert0 @cert1 @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-285861 |

    @automatic @cert2 @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | moves   | QANOV-285862 |

    @manual @jira.cv.14.3 @sanity
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-285864 |

    @jira.cv.Future @manual @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-370121 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-285803 @manual @mobile
  Scenario Outline: User can see the details of a highlighted card with an image
    Given user has a card with an image in a "highlighted cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
      And the selected explore card has the "image" media field displayed

    @jira.cv.14.3 @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-370122 |
          | o2uk    | QANOV-370123 |
          | moves   | QANOV-370124 |
          | blaude  | QANOV-370125 |
          | o2de    | QANOV-370126 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-370127 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @mobile @regression
  Scenario Outline: User can see a highlighted cards module with a single card
    The card will be presented the same way as if there were other cards.
    Given user has a single card in a "highlighted cards" Explore module
     When searches the "module"
     Then the selected explore module has "1" card
      And searches the "card"
      And the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-285875 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.3 | QANOV-285876 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.3 | QANOV-285877 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-285878 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.3   | QANOV-285879 |
          | o2es    | Future | QANOV-370130 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-285803 @manual @mobile
  Scenario Outline: User can see a highlighted cards carousel playing until the end of the carousel when autoplay is enabled and play-in-loop disabled in the module
    Given user has a "highlighted cards" module with autoplay "enabled" and play-in-loop "disabled" in the Explore content
     When searches the "module"
      And the carousel shows the first card of the module
     Then the carousel moves forward automatically every "5" seconds
      And the carousel stops moving forward in the last card of the module

    @jira.cv.14.3 @smoke
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-285885 |
          | o2uk    | QANOV-285886 |
          | moves   | QANOV-285887 |
          | blaude  | QANOV-285888 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-370132 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-285803 @manual @mobile @regression
  Scenario Outline: User can see a highlighted cards carousel playing in loop when autoplay and play-in-loop are enabled in the module
    Given user has a "highlighted cards" module with autoplay "enabled" and play-in-loop "enabled" in the Explore content
     When searches the "module"
      And the carousel shows the first card of the module
     Then the carousel moves forward automatically every "5" seconds
      And the carousel shows the first card after reaching the last card of the module

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-285889 |
          | o2uk    | QANOV-285890 |
          | moves   | QANOV-285891 |
          | blaude  | QANOV-285892 |
          | o2de    | QANOV-285893 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-370133 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-285803 @manual @mobile @smoke
  Scenario Outline: User can see the card's link in a card within a highlighted cards module
    Given user has a card with a link on a "highlighted module" Explore module
     When searches the "card"
     Then the selected explore "card" has the "card_link" field with "[CONTEXT:card_link_text]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-410621 |
          | o2uk    | QANOV-410622 |
          | moves   | QANOV-410623 |
          | blaude  | QANOV-410624 |
          | o2de    | QANOV-410625 |

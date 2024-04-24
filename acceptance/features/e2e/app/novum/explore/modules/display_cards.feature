# -*- coding: utf-8 -*-
@jira.QANOV-297852
Feature: Display cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a Display cards module without section title
    Given user has a "display cards" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.5   | QANOV-440772 |
          | o2uk    | 14.5   | QANOV-440773 |
          | blaude  | 14.5   | QANOV-440774 |
          | o2de    | 14.5   | QANOV-440775 |
          | moves   | 14.5   | QANOV-440776 |
          | o2es    | Future | QANOV-440777 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile
  Scenario Outline: User can see a Display cards module with a section title
    Given user has a "display cards" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @automatic @live @next @qa @smoke @webapp
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-343772 |

    @automatic @cert0 @cert1 @live @next @qa @smoke @webapp
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.3 | QANOV-343773 |

    @automatic @cert2 @live @next @qa @smoke @webapp
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.3 | QANOV-343776 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-343774 |

    @manual @smoke
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.3 | QANOV-343775 |

    @manual @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-407127 |

  @jira.<jira_id> @<product> @android @ios @mobile @webapp
  Scenario Outline: User can see the image of a Display card
    Given user has a "display cards" module in the Explore content
     When searches the "card"
     Then the selected explore card has the "image" media field displayed

    @automatic @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343801 |

    @automatic @cert3 @jira.cv.14.3 @live @next @qa @raitt_drop1 @sanity
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-343803 |

    @automatic @cert0 @cert1 @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-343802 |

    @automatic @cert2 @jira.cv.14.3 @live @next @qa @sanity
    Examples:
          | product | jira_id      |
          | moves   | QANOV-343805 |

    @jira.cv.14.3 @manual @sanity
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-343804 |

    @jira.cv.Future @manual @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407132 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: User can see a tag in a Display card
    Given user has a card with a tag on a "display cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-343817 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.3 | QANOV-343818 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.3 | QANOV-343821 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-343819 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.3   | QANOV-343820 |
          | o2es    | Future | QANOV-407135 |

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression @tbd
  Scenario Outline: Display card module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "display cards" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-343855 |
          | o2uk    | QANOV-343856 |
          | blaude  | QANOV-343857 |
          | o2de    | QANOV-343858 |
          | moves   | QANOV-343859 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-407142 |

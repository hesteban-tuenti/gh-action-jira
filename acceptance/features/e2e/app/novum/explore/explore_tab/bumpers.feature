# -*- coding: utf-8 -*-
@jira.QANOV-10073
Feature: Bumpers

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.NOV-235775
  @jira.link.relates_to.NOV-121878 @mobile @sanity
  Scenario Outline: The bumper of a "featured content" module is reproduced
    Bumpers are short videos that are displayed on banner and featured content cards instead of the card image
    Given user has a "featured content" module with a bumper
     When searches the "card"
      And displays the "bumper" in the "card" explore element
      And takes a screenshot
      And waits "2" seconds
     Then check that the screen is not in the previous state with threshold "0"

    @automatic @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-10076 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-10080 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-10084 |

    @manual @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228108 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-49192  |
          | o2es    | Future | QANOV-407254 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.WEB-613 @jira.link.relates_to.NOV-121878
  @mobile
  Scenario Outline: The bumper of a "banner" module is reproduced
    Bumpers are short videos that are displayed on banner and featured content cards instead of the card image
    Given user has a "banner" module with a bumper
     When searches the banner "card" with "bumper"
      And displays the "bumper" in the "card" explore element
      And takes a screenshot
      And waits "2" seconds
     Then check that the screen is not in the previous state with threshold "0"

    @automatic @live @next @qa @smoke @ber
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-10074 |

    @automatic @cert0 @cert1 @live @next @qa @smoke
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-10078 |

    @android @automatic @cert2 @live @next @qa @smoke
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-10082 |

    @manual @smoke
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228107 |
          | o2de    | 14.2 | QANOV-49191  |

    @manual @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-407255 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-121945 @mobile @no_automatable @regression
  Scenario Outline: The bumper of a "<module>" module stops playing when the user scrolls
    Given user has a "<module>" module with a bumper
     When scrolls until the "bumper" item disappears from the page
     Then the bumper "stops" playing

    Examples:
          | product | module           | depends_on   | cv     | jira_id      |
          | vivobr  | featured content | QANOV-10076  | 13.3   | QANOV-10094  |
          | vivobr  | banner           | QANOV-10074  | 13.3   | QANOV-10096  |
          | o2uk    | featured content | QANOV-10080  | 13.3   | QANOV-10098  |
          | o2uk    | banner           | QANOV-10078  | 13.3   | QANOV-10099  |
          | moves   | featured content | QANOV-10084  | 13.3   | QANOV-10101  |
          | moves   | banner           | QANOV-10082  | 13.3   | QANOV-10103  |
          | blaude  | featured content | QANOV-228108 | 13.9   | QANOV-228109 |
          | blaude  | banner           | QANOV-228107 | 13.9   | QANOV-228110 |
          | o2de    | featured content | QANOV-49192  | 14.2   | QANOV-49194  |
          | o2de    | banner           | QANOV-49191  | 14.2   | QANOV-49195  |
          | o2es    | featured content |              | Future | QANOV-407256 |
          | o2es    | banner           |              | Future | QANOV-407257 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-121951 @manual @mobile @regression
  Scenario Outline: The bumper of a "<module>" module starts playing when user scrolls and comes back
    Given user has a "<module>" module with a bumper
     When scrolls until the "bumper" item disappears from the page
      And scrolls until the "bumper" item is displayed in the page
     Then the bumper "starts" playing

    Examples:
          | product | module           | depends_on   | cv     | jira_id      |
          | vivobr  | featured content | QANOV-10094  | 13.3   | QANOV-10105  |
          | vivobr  | banner           | QANOV-10096  | 13.3   | QANOV-10107  |
          | o2uk    | featured content | QANOV-10098  | 13.3   | QANOV-10108  |
          | o2uk    | banner           | QANOV-10099  | 13.3   | QANOV-10109  |
          | moves   | featured content | QANOV-10101  | 13.3   | QANOV-10110  |
          | moves   | banner           | QANOV-10103  | 13.3   | QANOV-10111  |
          | blaude  | featured content | QANOV-228109 | 13.9   | QANOV-228111 |
          | blaude  | banner           | QANOV-228110 | 13.9   | QANOV-228112 |
          | o2de    | featured content | QANOV-49194  | 14.2   | QANOV-49196  |
          | o2de    | banner           | QANOV-49195  | 14.2   | QANOV-49197  |
          | o2es    | featured content |              | Future | QANOV-407258 |
          | o2es    | banner           |              | Future | QANOV-407259 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-121954 @mobile @no_automatable @regression
  Scenario Outline: The bumper of a "<module>" module configured with play in loop is reproduced in a loop
    Given user has a "<module>" module with a "bumper playing in loop" item in the Explore content
     When the bumper ends playing
     Then the bumper "starts" playing

    Examples:
          | product | module           | depends_on   | cv     | jira_id      |
          | vivobr  | featured content | QANOV-10076  | 13.3   | QANOV-10112  |
          | vivobr  | banner           | QANOV-10074  | 13.3   | QANOV-10113  |
          | o2uk    | featured content | QANOV-10080  | 13.3   | QANOV-10114  |
          | o2uk    | banner           | QANOV-10078  | 13.3   | QANOV-10115  |
          | moves   | featured content | QANOV-10084  | 13.3   | QANOV-10116  |
          | moves   | banner           | QANOV-10082  | 13.3   | QANOV-10117  |
          | blaude  | featured content | QANOV-228108 | 13.9   | QANOV-228113 |
          | blaude  | banner           | QANOV-228107 | 13.9   | QANOV-228114 |
          | o2de    | featured content | QANOV-49192  | 14.2   | QANOV-49198  |
          | o2de    | banner           | QANOV-49191  | 14.2   | QANOV-49199  |
          | o2es    | featured content |              | Future | QANOV-407260 |
          | o2es    | banner           |              | Future | QANOV-407261 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-121960 @mobile @no_automatable @regression
  Scenario Outline: The bumper of a "<module>" module configured without play in loop stops when video finishes
    Given user has a "<module>" module with a "bumper not playing in loop" item in the Explore content
     When the bumper ends playing
     Then the bumper keeps the last frame as image of the video

    Examples:
          | product | module           | depends_on   | cv     | jira_id      |
          | vivobr  | featured content | QANOV-10076  | 13.3   | QANOV-10118  |
          | vivobr  | banner           | QANOV-10074  | 13.3   | QANOV-10119  |
          | o2uk    | featured content | QANOV-10080  | 13.3   | QANOV-10120  |
          | o2uk    | banner           | QANOV-10078  | 13.3   | QANOV-10122  |
          | moves   | featured content | QANOV-10084  | 13.3   | QANOV-10124  |
          | moves   | banner           | QANOV-10082  | 13.3   | QANOV-10126  |
          | blaude  | featured content | QANOV-228108 | 13.9   | QANOV-228115 |
          | blaude  | banner           | QANOV-228107 | 13.9   | QANOV-228116 |
          | o2de    | featured content | QANOV-49192  | 14.2   | QANOV-49200  |
          | o2de    | banner           | QANOV-49191  | 14.2   | QANOV-49201  |
          | o2es    | featured content |              | Future | QANOV-407262 |
          | o2es    | banner           |              | Future | QANOV-407263 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-121955 @mobile @no_automatable @regression
  Scenario Outline: Several bumpers are reproducing at the same time
    Given user has several bumpers
     When several bumpers meet on the display at the same time
     Then all the bumpers play at the same time

    Examples:
          | product | depends_on                | cv     | jira_id      |
          | vivobr  | QANOV-10074               | 13.3   | QANOV-10128  |
          | o2uk    | QANOV-10078               | 13.3   | QANOV-10130  |
          | moves   | QANOV-10082               | 13.3   | QANOV-10132  |
          | blaude  | QANOV-228107:QANOV-228108 | 13.9   | QANOV-228117 |
          | o2de    | QANOV-49191:QANOV-49192   | 14.2   | QANOV-49202  |
          | o2es    |                           | Future | QANOV-407264 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-121967 @mobile @no_automatable @regression
  Scenario Outline: The bumper of a "<module>" module fails during the reproduction
    internal_checkpoint="Delete the explore cache and after restarting the app and accessing the explore tab,
    activate airplane mode"
    Given user has a "<module>" module with a bumper
     When the bumper fails during the reproduction
     Then the bumper keeps the first frame as image of the video

    Examples:
          | product | module           | depends_on   | cv     | jira_id      |
          | vivobr  | featured content | QANOV-10076  | 13.3   | QANOV-10134  |
          | vivobr  | banner           | QANOV-10074  | 13.3   | QANOV-10136  |
          | o2uk    | featured content | QANOV-10080  | 13.3   | QANOV-10138  |
          | o2uk    | banner           | QANOV-10078  | 13.3   | QANOV-10140  |
          | moves   | featured content | QANOV-10084  | 13.3   | QANOV-10143  |
          | moves   | banner           | QANOV-10082  | 13.3   | QANOV-10145  |
          | blaude  | featured content | QANOV-228108 | 13.9   | QANOV-228118 |
          | blaude  | banner           | QANOV-228107 | 13.9   | QANOV-228119 |
          | o2de    | featured content | QANOV-49192  | 14.2   | QANOV-49203  |
          | o2de    | banner           | QANOV-49191  | 14.2   | QANOV-49204  |
          | o2es    | featured content |              | Future | QANOV-407265 |
          | o2es    | banner           |              | Future | QANOV-407266 |

# -*- coding: utf-8 -*-
@jira.QANOV-127446
Feature: Explore badge notification no connectivity


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-202267 @mobile @regression
  Scenario Outline: Badge notification won't disappear after sending the app to background without connectivity
    Given user is in the "<page>" page
      And user has new Explore content
      And a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon
     When turns on the Airplane mode
      And runs the app in the background for "3" seconds
     Then a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | page    | depends_on  | cv   | jira_id     |
          | o2uk    | Account | QANOV-10493 | 13.3 | QANOV-10502 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | page      | depends_on | cv   | jira_id     |
          | moves   | Dashboard |            | 13.3 | QANOV-10503 |

    @automatic @live @next @qa
    Examples:
          | product | page    | depends_on | cv   | jira_id      |
          | vivobr  | Account |            | 13.3 | QANOV-223813 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | page    | depends_on   | cv   | jira_id      |
          | blaude  | Account | QANOV-228224 | 13.9 | QANOV-228244 |

    @manual
    Examples:
          | product | page    | depends_on  | cv     | jira_id      |
          | o2de    | Account | QANOV-49161 | 14.2   | QANOV-49164  |
          | o2es    | Account |             | Future | QANOV-407277 |

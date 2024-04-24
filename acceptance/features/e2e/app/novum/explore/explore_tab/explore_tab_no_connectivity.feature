# -*- coding: utf-8 -*-
@jira.QANOV-127445
Feature: Explore tab no connectivity


  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-29328 @mobile @regression
  Scenario Outline: User without data connection selects Explore tab: an error message is displayed
    After Service Workers are deleted it doesn't matter if the content is cached or not, the no connectiviy screen will be shown
    Given user is in the "Explore" page
     When turns on the Airplane mode
      And terminates the app
      And launches the app
      And initiate the app
      And clicks on the "navigation_tab_bar.explore_tab" button
     Then the "No Connectivity Webview" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed
      And turns off the Airplane mode
      And terminates the app
      And launches the app
      And initiate the app

    @automatic @live @next @qa
    Examples:
          | client  | product | cv   | jira_id      |
          | android | vivobr  | 13.3 | QANOV-9949   |
          | ios     | vivobr  | 13.3 | QANOV-131606 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | client  | product | cv   | jira_id      |
          | android | o2uk    | 13.3 | QANOV-9950   |
          | ios     | o2uk    | 13.3 | QANOV-131607 |

    @automatic @cert2 @live @next
    Examples:
          | client  | product | cv   | jira_id      |
          | android | moves   | 13.3 | QANOV-9951   |
          | ios     | moves   | 13.3 | QANOV-131608 |

    @manual
    Examples:
          | client  | product | cv     | jira_id      |
          | android | blaude  | 13.9   | QANOV-228274 |
          | ios     | blaude  | 13.9   | QANOV-228275 |
          | android | o2de    | 14.2   | QANOV-49103  |
          | ios     | o2de    | 14.2   | QANOV-131609 |
          | android | o2es    | Future | QANOV-417751 |
          | ios     | o2es    | Future | QANOV-417752 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-65231
  @mobile @regression
  Scenario Outline: User with connectivity error message in explore tab can refresh to load content
    After Service Workers are deleted it doesn't matter if the content is cached or not, the no connectiviy screen will be shown
    Given user is in the "Explore" page
     When turns on the Airplane mode
      And terminates the app
      And launches the app
      And initiate the app
      And clicks on the "navigation_tab_bar.explore_tab" button
      And the "No Connectivity Webview" page is displayed
      And turns off the Airplane mode
      And clicks on the "retry_button" button
     Then the "Explore" page is displayed

    @automatic @live @next @qa
    Examples:
          | client  | product | depends_on            | cv   | jira_id      |
          | android | vivobr  | QANOV-9925:QANOV-9931 | 13.3 | QANOV-9952   |
          | ios     | vivobr  | QANOV-9925:QANOV-9931 | 13.3 | QANOV-131610 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | client  | product | depends_on            | cv   | jira_id      |
          | android | o2uk    | QANOV-9929:QANOV-9935 | 13.3 | QANOV-9953   |
          | ios     | o2uk    | QANOV-9929:QANOV-9935 | 13.3 | QANOV-131611 |

    @automatic @cert2 @live @next
    Examples:
          | client  | product | depends_on            | cv   | jira_id      |
          | android | moves   | QANOV-9933:QANOV-9939 | 13.3 | QANOV-9954   |
          | ios     | moves   | QANOV-9933:QANOV-9939 | 13.3 | QANOV-131612 |

    @manual
    Examples:
          | client  | product | cv     | depends_on               | jira_id      |
          | android | blaude  | 13.9   | QANOV-228245:QANOV-49097 | QANOV-228276 |
          | ios     | blaude  | 13.9   | QANOV-228245:QANOV-49097 | QANOV-228277 |
          | android | o2de    | 14.2   | QANOV-49092:QANOV-207578 | QANOV-49104  |
          | ios     | o2de    | 14.2   | QANOV-49092:QANOV-207578 | QANOV-131613 |
          | android | o2es    | Future |                          | QANOV-417753 |
          | ios     | o2es    | Future |                          | QANOV-417754 |

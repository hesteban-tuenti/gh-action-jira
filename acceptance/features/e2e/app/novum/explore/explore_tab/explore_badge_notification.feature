# -*- coding: utf-8 -*-
@jira.QANOV-10488
Feature: Explore badge notification


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-91928 @mobile @no_automatable
  @regression
  Scenario Outline: User who has never accessed to explore tab will see a badge notification
    Given user has never seen the "Explore" page
     When launches the app
     Then a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 13.3   | QANOV-10490  |
          | moves   | 13.3   | QANOV-10491  |
          | vivobr  | 13.3   | QANOV-223806 |
          | blaude  | 13.9   | QANOV-228218 |
          | o2de    | 14.2   | QANOV-49160  |
          | o2es    | Future | QANOV-407271 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.relates_to.NOV-91934 @mobile @sanity
  Scenario Outline: Badge notification is shown when there is new Explore content
    internal_checkpoint="To simulate new content, you can clear explore cache from dev settings and then restart the app"
    Given user is in the "<page>" page
      And user has new Explore content
     Then a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | page    | cv   | jira_id     |
          | o2uk    | Account | 13.3 | QANOV-10493 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | page      | cv   | jira_id      |
          | moves   | Dashboard | 13.3 | QANOV-223807 |

    @automatic @live @next @qa
    Examples:
          | product | page    | cv   | jira_id      |
          | vivobr  | Account | 13.3 | QANOV-223808 |

    @automatic @cert3 @live @next @qa @raitt_drop1
    Examples:
          | product | page    | cv   | jira_id      |
          | blaude  | Account | 13.9 | QANOV-228224 |

    @manual
    Examples:
          | product | page    | cv     | jira_id      |
          | o2de    | Account | 14.2   | QANOV-49161  |
          | o2es    | Account | Future | QANOV-407272 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-202266 @mobile @regression
  Scenario Outline: Badge notification won't disappear after sending the app to background
    Given user is in the "<page>" page
      And user has new Explore content
      And a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon
     When runs the app in the background for "3" seconds
     Then a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | page    | depends_on  | cv   | jira_id     |
          | o2uk    | Account | QANOV-10493 | 13.3 | QANOV-10496 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | page      | depends_on | cv   | jira_id     |
          | moves   | Dashboard |            | 13.3 | QANOV-10497 |

    @automatic @live @next @qa
    Examples:
          | product | page    | depends_on | cv   | jira_id      |
          | vivobr  | Account |            | 13.3 | QANOV-223809 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | page    | depends_on   | cv   | jira_id      |
          | blaude  | Account | QANOV-228224 | 13.9 | QANOV-228229 |

    @manual
    Examples:
          | product | page    | depends_on  | cv     | jira_id      |
          | o2de    | Account | QANOV-49161 | 14.2   | QANOV-49162  |
          | o2es    | Account |             | Future | QANOV-407273 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-91939 @mobile @regression
  Scenario Outline: Badge notification won't disappear after restart the app
    Given user is in the "<page>" page
      And user has new Explore content
     When terminates the app
      And launches the app
      And initiate the app
     Then a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | page    | depends_on  | cv   | jira_id     |
          | o2uk    | Account | QANOV-10493 | 13.3 | QANOV-10499 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | page      | depends_on | cv   | jira_id     |
          | moves   | Dashboard |            | 13.3 | QANOV-10500 |

    @automatic @live @next @qa
    Examples:
          | product | page    | depends_on | cv   | jira_id      |
          | vivobr  | Account |            | 13.3 | QANOV-223810 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | page    | depends_on   | cv   | jira_id      |
          | blaude  | Account | QANOV-228224 | 13.9 | QANOV-228236 |

    @manual
    Examples:
          | product | page    | depends_on  | cv     | jira_id      |
          | o2de    | Account | QANOV-49161 | 14.2   | QANOV-49163  |
          | o2es    | Account |             | Future | QANOV-407274 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-91935 @mobile @smoke @har
  Scenario Outline: Badge notification in Explore tab icon disappears when the user accesses to Explore page
    Given user is in the "<page>" page
      And user has new Explore content
      And a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
     Then the "non_numeric" red badge is not displayed in the "navigation_tab_bar.explore_tab_notification" icon

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | page    | depends_on  | cv   | jira_id     |
          | o2uk    | Account | QANOV-10493 | 13.3 | QANOV-10508 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | page      | depends_on | cv   | jira_id     |
          | moves   | Dashboard |            | 13.3 | QANOV-10509 |

    @automatic @live @next @qa
    Examples:
          | product | page    | depends_on | cv   | jira_id      |
          | vivobr  | Account |            | 13.3 | QANOV-223811 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | page    | depends_on   | cv   | jira_id      |
          | blaude  | Account | QANOV-228224 | 13.9 | QANOV-228242 |

    @manual
    Examples:
          | product | page    | depends_on  | cv     | jira_id      |
          | o2de    | Account | QANOV-49161 | 14.2   | QANOV-49166  |
          | o2es    | Account |             | Future | QANOV-407275 |

  @jira.QANOV-10510 @android @ios @jira.cv.13.3 @jira.link.relates_to.NOV-193920 @mobile @multilogin @no_automatable
  @regression @vivobr
  Scenario: Badge notification won't be shown in the Explore tab when there is new content after changing the selected account coming from explore tab
    Given user is logged in with "2" account/s
      And user is in the "Explore" page
      And user has new Explore content in the other account
     When changes to the other account
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Explore" page is displayed
      And the "navigation_tab_bar.explore_tab_notification" icon is not displayed

  @jira.QANOV-10511 @android @ios @jira.cv.13.3 @jira.link.relates_to.NOV-193919 @mobile @no_automatable @regression
  @vivobr
  Scenario: Badge notification will be shown in the Explore tab when there is new content after changing the selected account coming from a different tab than Explore
    Given user is logged in with "2" account/s
      And user is in the "Account" page
      And user has new Explore content in the other account
     When changes to the other account
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Account" page is displayed
      And a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

  @jira.QANOV-10512 @android @ios @jira.cv.13.3 @jira.link.relates_to.NOV-194614 @mobile @multilogin @no_automatable
  @regression @vivobr
  Scenario: Badge notification won't be shown in the Explore tab when there is new content after login into another account coming from explore tab
    Given user is logged in with "1" account/s
      And user is in the "Explore" page
      And user has new Explore content in the other account
     When logs in another account
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Explore" page is displayed
      And the "navigation_tab_bar.explore_tab_notification" icon is not displayed

  @jira.QANOV-10513 @android @ios @jira.cv.13.3 @jira.link.relates_to.NOV-194617 @mobile @no_automatable @regression
  @vivobr
  Scenario: Badge notification will be shown in the Explore tab when there is new content after login into another account coming from a different tab than Explore
    Given user is logged in with "1" account/s
      And user is in the "Account" page
      And user has new Explore content in the other account
     When logs in another account
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Account" page is displayed
      And a "non_numeric" red badge is displayed in the "navigation_tab_bar.explore_tab_notification" icon

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.detects.TGT-1568 @mobile @regression
  Scenario Outline: Badge notification won't be displayed after restarting the app if there is no new content
    Given user is in the "Explore" page
     When terminates the app
      And launches the app
      And initiate the app
     Then the "non_numeric" red badge is not displayed in the "navigation_tab_bar.explore_tab_notification" icon

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-76622 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-76623 |

    @automatic @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-223812 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228243 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-76624  |
          | o2es    | Future | QANOV-407276 |

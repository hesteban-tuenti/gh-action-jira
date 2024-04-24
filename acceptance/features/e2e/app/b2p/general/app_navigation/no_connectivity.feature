# -*- coding: utf-8 -*-
@jira.QABP-228
Feature: No Connectivity


  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user without data connection who opens the app from killed status: No Connectivity page is displayed
    Content is not cached if the user opens the app from killed status.
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_icon" icon is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-229 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who is in the No Connectivity page and recovers the connectivity, user can reload the page
    Given terminates the app
      And turns on the Airplane mode
      And launches the app
      And the "No Connectivity" page is displayed
      And turns off the Airplane mode
     When clicks on the "retry_button" button
     Then the "Landing Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-230 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who is in the No Connectivity page, tries to reload the screen without connectivity
    Given terminates the app
      And turns on the Airplane mode
      And launches the app
      And the "No Connectivity" page is displayed
     When clicks on the "retry_button" button
     Then the "reload_icon" icon is displayed
      And the "No Connectivity" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-231 |

  @jira.<jira_id> @<product> @TBD @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who was in Any tab, opens the app from background: cached content is displayed
    Content is cached if the user opens the app from background status.
    TBD: Pending to clarify how the cached time is displayed
    Given user is in the "Any Tab" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
     Then the "Any Tab" page is displayed
      And the "no_connectivity_icon" icon is not displayed
      And the "cached_time_alert" element is displayed
      And the cached content is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-232 |

  @jira.<jira_id> @<product> @TBD @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who was in Any tab with the content cached and taps on other tab: No Connectivity screen is displayed
    Content is cached if the user opens the app from background status.
    Given user is in the "Any Tab" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
      And the "Any Tab" page is displayed
      And clicks on any element in the "navigation_tab_bar.icon_list" list
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_icon" icon is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "display_cached_button" button with "[LANG:noconnectivity.display_cached_button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-233 |

  @jira.<jira_id> @<product> @TBD @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who was in Any tab with the content cached and click on a link: No Connectivity screen is displayed
    Content is cached if the user opens the app from background status
    Given user is in the "Any Tab" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
      And the "Any Tab" page is displayed
      And clicks on the "any_link" link
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_icon" icon is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "display_cached_button" button with "[LANG:noconnectivity.display_cached_button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-234 |

  @jira.<jira_id> @<product> @TBD @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who has reached the No Connectivity screen from content cached can return to previous screen
    Content is cached if the user opens the app from background status
    Given user is in the "Any Tab" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
      And the "Any Tab" page is displayed
      And clicks on any element in the "navigation_tab_bar.icon_list" list
      And the "No Connectivity" page is displayed
      And clicks on the "display_cached_button" button
     Then the "Any Tab" page is displayed
      And the "no_connectivity_icon" icon is not displayed
      And the "cached_time_alert" element is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-235 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who is in Any tab page with the content cached and recovers the connectivity can pull to refresh
    Content is cached if the user opens the app from background status
    Given user is in the "Any Tab" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
      And the "Any Tab" page is displayed
      And the "cached_time_alert" element is displayed
      And turns off the Airplane mode
      And launches the app
      And pulls down the page to refresh
     Then the "Any Tab" page is displayed
      And the "no_connectivity_icon" icon is not displayed
      And the "cached_time_alert" element is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-236 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who was in a modal webview, opens the app from background: No Connectivity screen is displayed
    Given user is in the "Modal Webview" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_icon" icon is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-237 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user without connectivity who was in a flow webview, opens the app from background: No Connectivity screen is displayed
    Given user is in the "Flow Webview" page
      And the app is in background
     When turns on the Airplane mode
      And launches the app
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_icon" icon is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_message" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-238 |

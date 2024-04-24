# -*- coding: utf-8 -*-
@jira.QABP-63
Feature: Splash Screen

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user will see the splash screen when is not logged
    Usercentrics popup is displayed when user is opening the app for the first time.
    Given the "Splash Screen" page is displayed
      And the "brand_icon" icon is displayed
      And the "emoji" icon is displayed
      And the "start_now" button with "[LANG:launch_app.splash_screen.start_now]" text is displayed
      And the "cookies_link" link with "[LANG:launch_app.splash_screen.cookies_link]" text is displayed
      And the "data_protection_link" link with "[LANG:launch_app.splash_screen.data_protection_link]" text is displayed
      And the "imprint_link" link with "[LANG:launch_app.splash_screen.imprint_link]" text is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-64 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can access the Login page from Splash screen
    Login page is handled by OB.
    Given the "Splash Screen" page is displayed
     When clicks on the "start_now" button
     Then the "Login" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-172 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can access Cookies Permissions popup from Splash screen
    Given the "Splash Screen" page is displayed
     When clicks on the "cookies_link" link
     Then the "Cookies Permissions" popup is displayed
      And clicks on the "accept_all" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-65 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can access Data protection page from Splash screen
    Given the "Splash Screen" page is displayed
     When clicks on the "data_protection_link" link
     Then the "Data Protection" internal webview is displayed
      And clicks on the "navigation_tab_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-66 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can access Imprint page from Splash screen
    Given the "Splash Screen" page is displayed
     When clicks on the "imprint_link" link
     Then the "Imprint" internal webview is displayed
      And clicks on the "navigation_tab_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-67 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user logged out from the app will see the Maintenance screen when maintenance is enabled
    Given the maintenance mode is in "enabled" status
     When launches the app
     Then the "Maintenance" page is displayed
      And the "maintenance_icon" icon is displayed
      And the "maintenance_title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "maintenance_message" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "maintenance_button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-254 |

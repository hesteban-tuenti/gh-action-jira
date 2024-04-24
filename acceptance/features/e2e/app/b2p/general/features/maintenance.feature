# -*- coding: utf-8 -*-
@jira.QABP-239
Feature: Maintenance


  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who opens the app from background will see the Maintenance screen when maintenance is enabled
    Given the maintenance mode is in "enabled" status
     When launches the app
     Then the "Maintenance" page is displayed
      And the "maintenance_icon" icon is displayed
      And the "maintenance_title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "maintenance_message" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "maintenance_button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-240 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user who opens the app from killed status will see the Maintenance screen when maintenance is enabled
    Given the maintenance mode is in "enabled" status
     When terminates the app
      And launches the app
     Then the "Maintenance" page is displayed
      And the "maintenance_icon" icon is displayed
      And the "maintenance_title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "maintenance_message" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "maintenance_button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-241 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can try to reload the Maintenance when it is still enabled
    Given the maintenance mode is in "enabled" status
     When launches the app
      And the "Maintenance" page is displayed
      And clicks on the "maintenance_button" button
     Then the "Maintenance" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-242 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user clicks on teh reload button in the Maintenance screen when it is already disabled
    Given the maintenance mode is in "enabled" status
     When terminates the app
      And launches the app
      And the "Maintenance" page is displayed
      And the maintenance mode is in "disabld" status
      And clicks on the "maintenance_button" button
     Then the "Landing Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-243 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user will see the Maintenance screen when it is enabled when user navigates through the app
    Given user is in the "Any Tab" page
      And the maintenance mode is in "enabled" status
     When clicks on any element in the "navigation_tab_bar.icon_list" list
     Then the "Maintenance" page is displayed
      And the "maintenance_icon" icon is displayed
      And the "maintenance_title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "maintenance_message" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "maintenance_button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-244 |

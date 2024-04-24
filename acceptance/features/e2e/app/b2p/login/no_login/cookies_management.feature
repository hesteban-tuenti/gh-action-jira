# -*- coding: utf-8 -*-
@jira.QABP-81
Feature: Cookies Management


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: Cookies Permissions popup is displayed when the user opens the <product> app for the first time
    Cookies permissions popup is managed by the UserCentrics CMS (on the OB side)
    The Cookies Permissions popup will appear again if the defined time period is exceeded (defined in the UserCentrics
    CMS).
    Given user just installed the application
     Then the "Cookies Permissions" popup is displayed
      And the "title" textfield with "Einstellungen für Cookies und ähnliche Technologien" text is displayed
      And the "message" textfield is displayed
      And the "categories_tab" tab is displayed
      And the "services_tab" tab is displayed
      And the "categories_list" list is displayed
      And each element in the "categories_list" list has the "name" field
      And each element in the "categories_list" list has the "description" field
      And each element in the "categories_list" list has the "switch" field
      And the "reject_all" button with "[LANG:launch_app.cookies_permissions.reject_all]" text is displayed
      And the "accept_all" button with "[LANG:launch_app.cookies_permissions.accept_all]" text is displayed
      And the "save_selection" button with "[LANG:launch_app.cookies_permissions.save_selection]" text is displayed
      And clicks on the "accept_all" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-82 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can set the cookies preferences in the Cookies Permissions popup
    Cookies permissions popup is managed by the UserCentrics CMS (on the OB side)
    Given the "Cookies Permissions" popup is displayed
     When accepts some cookies
      And clicks on the "save_selection" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | depends_on | cv     | jira_id |
          | was     | QABP-82    | Future | QABP-83 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user can reject all the cookies in the Cookies Permissions popup
    Cookies permissions popup is managed by the UserCentrics CMS (on the OB side)
    Given the "Cookies Permissions" popup is displayed
     When clicks on the "reject_all" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | depends_on | cv     | jira_id |
          | was     | QABP-82    | Future | QABP-84 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: All Cookies preferences are deleted when uninstalling the <product> app
    The preferences are configured per device and when deleting the app, all the preferences will be deleted.
    Given user has set the cookies preferences
     When uninstalls the app
      And user just installed the application
      And launches the app
     Then the "Cookies Permissions" popup is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-85 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: Cookies preferences are not deleted after logging out from <product> app
    The pop-up will not be displayed after logging out, as the preferences are configured per device.
    Given user has set the cookies preferences
     When logs out from the application
      And terminates the app
      And launches the app
     Then the "Cookies Permissions" popup is not displayed
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id |
          | was     | Future | QABP-86 |

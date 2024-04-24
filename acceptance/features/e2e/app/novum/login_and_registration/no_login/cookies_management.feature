# -*- coding: utf-8 -*-
@jira.QANOV-243130
Feature: Cookies Management


  @jira.QANOV-243131 @android @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.O2DE-3152 @live @automatic
  @mobile @next @qa @sanity @har
  Scenario: A Usercentrics popup to manage cookies is displayed when the user opens the app for the first time in blaude
    Cookie permissions: GA, Firebase, so on -> SDK Usercentrics
    SDKs available for phase 1: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia.
    SDKs available for phase 2: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia,
    SpatialBuzz SDK, AEP SDK, Google maps.
    Given user just installed the application
     Then the "Cookies Permissions" popup is displayed
      And the "title" textfield with "Einstellungen für Cookies und ähnliche Technologien" text is displayed
      And the "message" textfield is displayed
      And scrolls down
      And the "categories_tab" tab is displayed
      And the "services_tab" tab is displayed
      And the "categories_list" list is displayed
      And each element in the "categories_list" list has the "name" field
      And each element in the "categories_list" list has the "description" field
      And each element in the "categories_list" list has the "switch" field
      And the "reject_all" button with "[LANG:launch_app.cookies_permissions.reject_all]" text is displayed
      And the "accept_all" button with "[LANG:launch_app.cookies_permissions.accept_all]" text is displayed
      And the "save_selection" button with "[LANG:launch_app.cookies_permissions.save_selection]" text is displayed
      And clicks on the "reject_all" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-243132 @android @automatic @ber @cert3 @ios @jira.cv.14.2 @live @mobile @next @o2de @qa @sanity @har
  Scenario: A Usercentrics popup to manage cookies is displayed when the user opens the app for the first time in o2de
    Cookie permissions: GA, Firebase, so on -> SDK Usercentrics
    SDKs available for phase 1: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia.
    SDKs available for phase 2: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia,
    SpatialBuzz SDK, AEP SDK, Google maps.
    Given user just installed the application
     Then the "Cookies Permissions" popup is displayed
      And the "title" textfield with "Einstellungen für Cookies und ähnliche Technologien" text is displayed
      And the "message" textfield is displayed
      And scrolls down
      And the "categories_tab" tab is displayed
      And the "services_tab" tab is displayed
      And the "categories_list" list is displayed
      And each element in the "categories_list" list has the "name" field
      And each element in the "categories_list" list has the "description" field
      And each element in the "categories_list" list has the "switch" field
      And the "accept_all" button with "[LANG:launch_app.cookies_permissions.accept_all]" text is displayed
      And the "save_selection" button with "[LANG:launch_app.cookies_permissions.save_selection]" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: All cookies permissions will be disabled by default if there is an error with the Usercentrics popup after opening the app for the first time
    SDKs available for phase 1: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia.
    SDKs available for phase 2: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia,
    SpatialBuzz SDK, AEP SDK, Google maps.
    Given user just installed the application
      And user is in the "Splash Screen" page
     When there is an error with Usercentrics popup
     Then the "Cookies Management" popup is not displayed
      And all optional SDKs are disabled

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-243133 |
          | o2de    | 14.2 | QANOV-243134 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A user sets the cookies preferences
    SDKs available for phase 1: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia.
    SDKs available for phase 2: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia,
    SpatialBuzz SDK, AEP SDK, Google maps.
    Given user just installed the application
      And the "Cookies Management" popup is displayed
     When accepts some cookies
      And clicks on the "save_selection_button" button
     Then the accepted SDKs are enabled
      And the rejected SDKs are disabled

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-243131 | QANOV-243143 |
          | o2de    | 14.2 | QANOV-243132 | QANOV-243144 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression @har
  Scenario Outline: A user accepts all the cookies
    SDKs available for phase 1: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia.
    SDKs available for phase 2: Usercentrics SDK (essential), Adjust SDK, Google Analytics, Google tag manager, Medallia,
    SpatialBuzz SDK, AEP SDK, Google maps.
    Given user just installed the application
      And the "Cookies Management" popup is displayed
     When clicks on the "accept_all_button" button
     Then all SDKs are enabled

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-243131 | QANOV-243147 |
          | o2de    | 14.2 | QANOV-243132 | QANOV-243148 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: The Usercentrics popup to manage cookies is displayed again when there are new consents added to the app
    The popup will display the new consent and also the old consents (so the user can change them).
    Given user has set the cookies preferences
     When a new consent is added to the app
      And terminates the app
      And launches the app
     Then the "Cookies Management" popup is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-243143 | QANOV-243145 |
          | o2de    | 14.2 | QANOV-243144 | QANOV-243146 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: All cookies preferences are deleted when unistalling the app
    The preferences are configured per device and when deleting the app, all the preferences will be deleted.
    Given user has set the cookies preferences
     When uninstalls the app
      And user just installed the application
      And launches the app
      And the "Splash Screen" page is displayed
     Then the "Cookies Management" popup is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-243143 | QANOV-243151 |
          | o2de    | 14.2 | QANOV-243144 | QANOV-243152 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: Usercentrics popup to manage cookies is displayed again if the defined time period is exceeded
    Given user has set the cookies preferences
      And terminates the app
      And launches the app
     When the cookies time period is exceeded
     Then the "Cookies Management" popup is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-243143 | QANOV-243153 |
          | o2de    | 14.2 | QANOV-243144 | QANOV-243154 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: Cookies preferences are not deleted after logging out
    The pop-up will not be displayed after logging out, as the preferences are configured per device.
    Given user has set the cookies preferences
     When logs out from the application
      And terminates the app
      And launches the app
     Then the "Cookies Management" popup is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-243143 | QANOV-243155 |
          | o2de    | 14.2 | QANOV-243144 | QANOV-243156 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.9 @manual @mobile @regression
  Scenario Outline: Cookies blocked popup will be displayed when the user tries to open the credentials screen with cookies blocked in safari on iOS devices
    To block the cookies in safari go to: Settings > Safari > Block all cookies
    Given user is logged out
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Cookies Blocked" popup is displayed
      And the "title" textfield with "Cookies sind deaktiviert" text is displayed
      And the "body" textfield with "Aktiviere erst Cookies und/oder Javascript im Browser und versuche es dann erneut" text is displayed
      And the "confirm_button" button with the "OK" format is displayed
      And clicks on the "confirm_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-446761 |
          | o2de    | QANOV-446762 |

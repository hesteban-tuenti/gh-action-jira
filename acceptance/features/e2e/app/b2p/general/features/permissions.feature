# -*- coding: utf-8 -*-
@jira.QABP-205
Feature: Permissions


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @sanity @e2e
  Scenario Outline: A <product> user who just installed the app will see the Camera permissions popup when webview requires them on Android devices
    Given user just installed the application
      And logs in the application
      And user is in the "Camera Permissions Webview" page
     When clicks on the "requires_camera_permission" link
     Then the "Permissions Popup" popup is displayed
      And the "popup.message" textfield is displayed
      And the "popup.accept" button is displayed
      And the "popup.cancel" button is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-206 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @sanity @e2e
  Scenario Outline: A <product> user who just installed the app will see the Camera permissions popup when webview requires them on iOS devices
    Given user just installed the application
      And logs in the application
      And user is in the "Camera Permissions Webview" page
     When clicks on the "requires_camera_permission" link
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield is displayed
      And the "popup.message" textfield with "Diese App verwendet die Kamera, um den Gutscheincode automatisch zu scannen" text is displayed
      And the "popup.accept" button is displayed
      And the "popup.cancel" button is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-207 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @sanity @e2e
  Scenario Outline: A <product> user who just installed the app will see the Location permissions popup when webview requires them on Android devices
    Given user just installed the application
      And logs in the application
      And user is in the "Location Permissions Webview" page
     When clicks on the "requires_location_permission" link
     Then the "Permission Popup" popup is displayed
      And the "popup.message" textfield is displayed
      And the "popup.accept" button is displayed
      And the "popup.cancel" button is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-208 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @sanity @e2e
  Scenario Outline: A <product> user who just installed the app will see the Location permissions popup when webview requires them on iOS devices
    Given user just installed the application
      And logs in the application
      And user is in the "Location Permissions Webview" page
     When clicks on the "requires_location_permission" link
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield is displayed
      And the "popup.message" textfield with "Wir nutzen diese, um einen besseren Service zu bieten" text is displayed
      And the "popup.allow_while_use" button is displayed
      And the "popup.allow_once" button is displayed
      And the "popup.denied" button is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-209 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @smoke @e2e
  Scenario Outline: A <product> user accepts the Camera permissions popup: user is able to use the Camera in the app
    Given user just installed the application
      And logs in the application
      And user is in the "Camera Permissions Webview" page
     When clicks on the "requires_camera_permission" link
      And clicks on the "popup.accept" button
     Then the "Camera Permissions Webview" page is displayed
      And user is able to use the camera

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-210 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @smoke @e2e
  Scenario Outline: A <product> user accepts the Location permissions popup: user is able to use the Location in the app
    Given user just installed the application
      And logs in the application
      And user is in the "Location Permissions Webview" page
     When clicks on the "requires_location_permission" link
      And clicks on the "popup.allow_while_use" button
     Then the "Location Permissions Webview" page is displayed
      And user is able to use the location

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-211 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user rejects the Camera permissions popup: user is not able to use the Camera in the app
    Given user just installed the application
      And logs in the application
      And user is in the "Camera Permissions Webview" page
     When clicks on the "requires_camera_permission" link
      And clicks on the "popup.cancel" button
     Then the "Camera Permissions Webview" page is displayed
      And user is not able to use the camera

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-212 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user rejects the Location permissions popup: user is not able to use the Location in the app
    Given user just installed the application
      And logs in the application
      And user is in the "Location Permissions Webview" page
     When clicks on the "requires_location_permission" link
      And clicks on the "popup.cancel" button
     Then the "Location Permissions Webview" page is displayed
      And user is not able to use the location

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-213 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without camera permissions will see the permission denied popup when webview requires them on Android devices
    Given user has "denied" "camera" permissions
      And user is in the "Camera Permissions Webview" page
     When clicks on the "requires_camera_permission" link
     Then the "Permission Denied" popup is displayed
      And the "popup.title" textfield with "Berechtigungen verweigert" text is displayed
      And the "popup.message" textfield with "Um den Code zu scannen, erlaube die Verwendung der der Kamera in den Einstellungen" text is displayed
      And the "popup.accept" button with "EINSTELLUNGEN" text is displayed
      And the "popup.cancel" button with "SCHLIESSEN" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-214 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without camera permissions will see the permission denied popup when webview requires them on iOS devices
    Given user has "denied" "camera" permissions
      And user is in the "Camera Permissions Webview" page
     When clicks on the "requires_camera_permission" link
     Then the "Permission Denied" popup is displayed
      And the "popup.title" textfield with "Berechtigungen verweigert" text is displayed
      And the "popup.message" textfield with "Um den Code zu scannen, erlaube die Verwendung der der Kamera in den Einstellungen" text is displayed
      And the "popup.accept" button with "Einstellungen" text is displayed
      And the "popup.cancel" button with "Schließen" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-215 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without location permissions will see the permission denied popup when webview requires them on Android devices
    Given user has "denied" "location" permissions
      And user is in the "Location Permissions Webview" page
     When clicks on the "requires_location_permission" link
     Then the "Permission Denied" popup is displayed
      And the "popup.title" textfield with "Berechtigungen verweigert" text is displayed
      And the "popup.message" textfield with "Um den Standortdienst zu verwenden, gehe auf Einstellungen > Standort" text is displayed
      And the "popup.accept" button with "EINSTELLUNGEN" text is displayed
      And the "popup.cancel" button with "SCHLIESSEN" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-216 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without location permissions will see the permission denied popup when webview requires them on iOS devices
    Given user has "denied" "location" permissions
      And user is in the "Location Permissions Webview" page
     When clicks on the "requires_location_permission" link
     Then the "Permission Denied" popup is displayed
      And the "popup.title" textfield with "Berechtigungen verweigert" text is displayed
      And the "popup.message" textfield with "Um den Standortdienst zu verwenden, gehe auf Einstellungen > Standort" text is displayed
      And the "popup.accept" button with "Einstellungen" text is displayed
      And the "popup.cancel" button with "Schließen" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-217 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without <permission> who accepts the permission denied popup is redirected to device settings
    Given user has "denied" "<permission>" permissions
      And user is in the "Permissions Webview" page
     When clicks on the "requires_<permission>_permission" link
      And the "Permission Denied" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Native Settings" page is displayed

    Examples:
          | product | permission | cv     | jira_id  |
          | was     | camera     | Future | QABP-218 |
          | was     | location   | Future | QABP-219 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without camera who rejects the Denied permissions popup: user is not able to use the Camera in the app
    Given user has "denied" "camera" permissions
      And user is in the "Permissions Webview" page
     When clicks on the "requires_camera_permission" link
      And the "Permission Denied" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Camera Permissions Webview" page is displayed
      And user is not able to use the camera

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-220 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression @e2e
  Scenario Outline: A <product> user without location who rejects the Denied permissions popup: user is not able to use the Location in the app
    Given user has "denied" "location" permissions
      And user is in the "Permissions Webview" page
     When clicks on the "requires_location_permission" link
      And the "Permission Denied" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Location Permissions Webview" page is displayed
      And user is not able to use the location

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-221 |

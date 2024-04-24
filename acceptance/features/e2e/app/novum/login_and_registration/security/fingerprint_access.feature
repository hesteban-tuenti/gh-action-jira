# -*- coding: utf-8 -*-
@jira.QANOV-126317
Feature: Fingerprint access


  @jira.<jira_id> @android @jira.cv.10.2 @jira.link.relates_to.NOV-175428 @jira.link.relates_to.NOV-175429
  @jira.link.relates_to.NOV-24786 @jira.link.relates_to.NOV-47610 @jira.link.relates_to.NOV-47617
  @jira.link.relates_to.NOV-58627 @mobile @no_automatable @o2uk @sanity
  Scenario Outline: A user configures PIN during login and a popup to configure the fingerprint is displayed (device with fingerprint) on Android devices
    Given user is "<register_status>" in the application
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FingerPrint" popup is displayed
      And the "title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.title]" text is displayed
      And the "message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.message]" text is displayed
      And the "fingerprint_icon" icon is displayed
      And the "cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.button]" text is displayed

    @har
    Examples:
          | register_status | jira_id   |
          | registered      | QANOV-857 |

    Examples:
          | register_status | jira_id   |
          | not_registered  | QANOV-858 |

  @jira.<jira_id> @<test_priority> @android @jira.cv.10.0 @jira.link.relates_to.NOV-24725 @mobile @no_automatable @o2uk
  Scenario Outline: A user introduces fingerprint in the fingerprint set up (device with fingerprint) on Android devices
    Given user is "<register_status>" in the application
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And introduces fingerprint configured on the device
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is enabled in the application

    @har
    Examples:
          | register_status | test_priority | jira_id   |
          | registered      | smoke         | QANOV-859 |

    Examples:
          | register_status | test_priority | jira_id   |
          | not_registered  | regression    | QANOV-860 |

  @jira.<jira_id> @android @jira.cv.10.2 @jira.link.relates_to.NOV-47622 @mobile @no_automatable @o2uk @regression
  Scenario Outline: A user introduces wrong fingerprint in the fingerprint set up (device with fingerprint) on Android devices
    Given user is "<register_status>" in the application
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And introduces a wrong fingerprint on the device
     Then the "[CONF:landing_tab]" page is displayed
      And the "message" textfield with "Not recognised" text is displayed in "red" color
      And the "alert_icon" icon is displayed

    @har
    Examples:
          | register_status | jira_id   |
          | registered      | QANOV-861 |

    Examples:
          | register_status | jira_id   |
          | not_registered  | QANOV-862 |

  @jira.QANOV-865 @har @ios @jira.cv.10.2 @jira.link.detects.IOS-7285 @jira.link.relates_to.NOV-175428
  @jira.link.relates_to.NOV-175429 @mobile @no_automatable @o2uk @smoke
  Scenario: A user configures PIN during login and a popup to configure the fingerprint is displayed (device with fingerprint) on iOS devices
    Given the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FingerPrint" popup is displayed
      And the "popup.title" textfield with "Do you want to allow My O2 to use TouchID?" text is displayed
      And the "popup.description" textfield with "TouchID will be used to unlock the app faster" text is displayed
      And the "popup.accept" textfield with "Enable" text is displayed
      And the "popup.cancel" button with "Don't allow" text is displayed

  @jira.QANOV-866 @android @har @jira.cv.10.0 @jira.link.relates_to.NOV-24786 @mobile @no_automatable @o2uk @regression
  Scenario: A user skips the fingerprint configuration during the login (device with fingerprint) on Android devices
    Given the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And clicks on the "cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is not enabled in the application

  @jira.<jira_id> @<product> @android @har @jira.cv.10.5 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-65121 @mobile @no_automatable @sanity
  Scenario Outline: A user with biometrics/fingerprint support configures PIN after first login on Android device
    commented_tags="@depends_on.NOV-65005 @depends_on.NOV-53358 @depends_on.NOV-53359"
    Given the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FingerPrint" popup is displayed
      And the "title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.title]" text is displayed
      And the "message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.message]" text is displayed
      And the "fingerprint_icon" icon is displayed
      And the "cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.button]" text is displayed

    Examples:
          | product | login_screen             | depends_on          | jira_id   |
          | moves   | Moves Credentials Login  | QANOV-871:QANOV-879 | QANOV-881 |
          | vivobr  | Vivobr Credentials Login | QANOV-872:QANOV-880 | QANOV-882 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.10.5 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-181726 @jira.link.relates_to.NOV-65121 @mobile @no_automatable @sanity
  Scenario Outline: A user with biometrics/fingerprint support configures PIN after first login on iOS device
    commented_tags="@depends_on.NOV-65005 @depends_on.NOV-53358 @depends_on.NOV-53359"
    Given the device has a "FingerPrint" registered
      And user has not registered in the application previously
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FingerPrint" popup is displayed
      And the "title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.title]" text is displayed
      And the "message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.message]" text is displayed
      And the "cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.cancel_button]" text is displayed
      And the "accept" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.accept_button]" text is displayed

    Examples:
          | product | login_screen             | depends_on          | jira_id     |
          | moves   | Moves Credentials Login  | QANOV-871:QANOV-879 | QANOV-21047 |
          | vivobr  | Vivobr Credentials Login | QANOV-872:QANOV-880 | QANOV-21048 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.5 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-65120 @mobile @no_automatable @regression
  Scenario Outline: A user chooses to dismiss biometrics/fingerprint after first login
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And clicks on the "cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is not enabled in the application

    Examples:
          | product | login_screen             | depends_on | jira_id   |
          | moves   | Moves Credentials Login  | QANOV-881  | QANOV-883 |
          | vivobr  | Vivobr Credentials Login | QANOV-882  | QANOV-884 |

  @jira.<jira_id> @<product> @android @har @jira.cv.10.5 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-65119 @mobile @no_automatable @smoke
  Scenario Outline: A user chooses to activate biometrics/fingerprint after first login on Android devices
    Given the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And introduces fingerprint configured on the device
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is enabled in the application

    Examples:
          | product | login_screen             | depends_on | jira_id   |
          | moves   | Moves Credentials Login  | QANOV-881  | QANOV-885 |
          | vivobr  | Vivobr Credentials Login | QANOV-882  | QANOV-886 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.10.5 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-93089
  @mobile @no_automatable @smoke
  Scenario Outline: A user chooses to activate biometrics/fingerprint after first login in iOS devices
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set Fingerprint" popup is displayed
      And clicks on the "popup.accept" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is enabled in the application

    Examples:
          | product | login_screen             | depends_on | jira_id   |
          | moves   | Moves Credentials Login  | QANOV-881  | QANOV-889 |
          | vivobr  | Vivobr Credentials Login | QANOV-882  | QANOV-890 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @mobile @no_automatable @sanity
  Scenario Outline: A <product> user with Fingerprint configured in the device introduces the PIN during the login: a popup to configure the Fingerprint is displayed on Android devices
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page> Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FingerPrint" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.title]" text is displayed
      And the "fingerprint_icon" icon is displayed
      And the "popup.message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.message]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.button]" text is displayed

    Examples:
          | product | cv    | page   | jira_id      |
          | blaude  | 13.10 | Blaude | QANOV-286533 |
          | o2de    | 14.2  | O2de   | QANOV-286534 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @mobile @no_automatable @sanity
  Scenario Outline: A <product> user with TouchID configured in the device introduces the PIN during the login: a popup to configure the TouchID is displayed on iOS devices
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page> Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FingerPrint" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.message]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.accept_button]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_ios.cancel_button]" text is displayed

    Examples:
          | product | cv    | page   | jira_id      |
          | blaude  | 13.10 | Blaude | QANOV-286535 |
          | o2de    | 14.2  | O2de   | QANOV-286536 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile @no_automatable
  @regression
  Scenario Outline: A <product> user with FingerPrint/TouchID configured in the device skips the FingerPrint/TouchID configuration in the app after introducing the PIN during the login
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page> Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is not enabled in the application

    Examples:
          | product | cv    | page   | depends_on                | jira_id      |
          | blaude  | 13.10 | Blaude | QANOV-286533:QANOV-286535 | QANOV-286537 |
          | o2de    | 14.2  | O2de   | QANOV-286534:QANOV-286536 | QANOV-286538 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile @no_automatable @smoke
  Scenario Outline: A <product> user with Fingerprint configured in the Android device configures the Fingerprint in the app after introducing the PIN during the login
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page> Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And introduces fingerprint configured on the device
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is enabled in the application

    Examples:
          | product | cv    | page   | depends_on   | jira_id      |
          | blaude  | 13.10 | Blaude | QANOV-286533 | QANOV-286539 |
          | o2de    | 14.2  | O2de   | QANOV-286534 | QANOV-286540 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile @no_automatable @smoke
  Scenario Outline: A <product> user with TouchID configured in the iOS device configures the TouchID in the app after introducing the PIN during the login
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page> Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And clicks on the "popup.accept" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FingerPrint" feature is enabled in the application

    Examples:
          | product | cv    | page   | depends_on   | jira_id      |
          | blaude  | 13.10 | Blaude | QANOV-286535 | QANOV-286541 |
          | o2de    | 14.2  | O2de   | QANOV-286536 | QANOV-286542 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile @no_automatable @regression
  Scenario Outline: A <product> user with Fingerprint configured in the Android device inserts wrong Fingerprint in the app after introducing the PIN during the login
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And the device has a "FingerPrint" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page> Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FingerPrint" popup is displayed
      And introduces a wrong fingerprint on the device
     Then the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.title]" text is displayed
      And the "error_fingerprint_icon" icon is displayed
      And the "popup.message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.message]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_set_up_android.button]" text is displayed

    Examples:
          | product | cv    | page   | depends_on   | jira_id      |
          | blaude  | 13.10 | Blaude | QANOV-286533 | QANOV-286543 |
          | o2de    | 14.2  | O2de   | QANOV-286534 | QANOV-286544 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53326 @mobile @no_automatable @smoke
  Scenario Outline: A user with Fingerprint/TouchID enabled in the app can choose to use the PIN code
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "Fingerprint" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Fingerprint" popup is not displayed
      And the "App Pin Code" page is displayed

    Examples:
          | product | cv    | depends_on                                  | jira_id      |
          | moves   | 10.4  | QANOV-1064:QANOV-1067:QANOV-1061:QANOV-1094 | QANOV-1102   |
          | vivobr  | 10.4  | QANOV-1065:QANOV-1068:QANOV-1062:QANOV-1096 | QANOV-1103   |
          | o2uk    | 10.4  | QANOV-1066:QANOV-1069:QANOV-1063:QANOV-1098 | QANOV-1104   |
          | blaude  | 13.10 |                                             | QANOV-286545 |
          | o2de    | 14.2  |                                             | QANOV-286546 |

  @jira.<jira_id> @<product> @android @jira.cv.10.4 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53332
  @mobile @no_automatable @regression
  Scenario Outline: A user introduces wrong fingerprint: error message will be shown in the Fingerprint popup on Android devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "Fingerprint" popup is displayed
      And introduces a wrong fingerprint on the device
     Then the "App Pin Code" page is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.title]" text is displayed
      And the "popup.description" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.description]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_android.button]" text is displayed

    Examples:
          | product | depends_on            | jira_id    |
          | moves   | QANOV-1064:QANOV-1061 | QANOV-1105 |
          | vivobr  | QANOV-1062:QANOV-1065 | QANOV-1106 |
          | o2uk    | QANOV-1066:QANOV-1063 | QANOV-1107 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user with Fingerprint enabled in the app introduces wrong fingerprint to access the app on Android devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "Fingerprint" popup is displayed
      And introduces a wrong fingerprint on the device
     Then the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.title]" text is displayed
      And the "error_fingerprint_icon" icon is displayed
      And the "popup.message" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.message]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_android.button]" text is displayed

    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-286547 |
          | o2de    | 14.2  | QANOV-286548 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user with TouchID enabled in the app introduces wrong fingerprint to access the app on iOS devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "Fingerprint" popup is displayed
      And introduces a wrong fingerprint on the device
     Then the "fingerprint_icon" icon is displayed
      And the "popup.title" textfield with "<popup_title>" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_ios.button]" text is displayed

    Examples:
          | product | cv    | popup_title              | jira_id      |
          | blaude  | 13.10 | Touch ID for "Mein Blau" | QANOV-286549 |
          | o2de    | 14.2  | Touch ID for "Mein O2"   | QANOV-286550 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53562 @mobile @no_automatable @regression
  Scenario Outline: A user with Fingerprint/TouchID enabled in the app who inserted a wrong Fingerprint can select to insert the PIN instead
    internal_checkpoint="With Android Q and superior versions shows the native dialogue from the device. In lower
    Android versions the app custom dialogue is shown. The native changes according the UI of every different
    manufactured."
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "Fingerprint" popup is displayed
      And introduces a wrong fingerprint on the device
      And clicks on the "popup.cancel" button
     Then the "Fingerprint" popup is not displayed
      And the "App Pin Code" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1105                | QANOV-1108   |
          | vivobr  | 10.4  | QANOV-1106                | QANOV-1109   |
          | o2uk    | 10.4  | QANOV-1107                | QANOV-1110   |
          | blaude  | 13.10 | QANOV-286547:QANOV-286549 | QANOV-286551 |
          | o2de    | 14.2  | QANOV-286548:QANOV-286550 | QANOV-286552 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53349 @mobile @no_automatable
  @regression
  Scenario Outline: A user who changed the Fingerprint/TouchID can access the app after having killing it
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When changes the FingerPrint in the device
      And terminates the app
      And launches the app
      And introduces the new FingerPrint configured on the device
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-923    |
          | vivobr  | 10.4  | QANOV-925    |
          | o2uk    | 10.4  | QANOV-927    |
          | blaude  | 13.10 | QANOV-286553 |
          | o2de    | 14.2  | QANOV-286554 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53350 @mobile @no_automatable
  @regression
  Scenario Outline: A user who changed the Fingerprint/TouchID can access the app after running it in background for more than 5 minutes
    Given user is logged in
      And user is in the "Account" page
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When changes the FingerPrint in the device
      And runs the app in the background for "301" seconds
      And introduces the new FingerPrint configured on the device
     Then the "Account" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-929    |
          | vivobr  | 10.4  | QANOV-930    |
          | o2uk    | 10.4  | QANOV-932    |
          | blaude  | 13.10 | QANOV-286555 |
          | o2de    | 14.2  | QANOV-286556 |

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53565 @mobile
  @no_automatable
  Scenario Outline: A <product> user with Fingerprint enabled and with the app in background opens the app after less than 5 minutes: PIN screen doesn't appear and the <screen> screen is opened
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "280" seconds
     Then the "<screen>" page is displayed

    Examples:
          | product | cv    | screen     | test_priority | jira_id      |
          | moves   | 10.4  | Account    | smoke         | QANOV-965    |
          | moves   | 10.4  | Explore    | regression    | QANOV-967    |
          | moves   | 10.4  | Support    | regression    | QANOV-971    |
          | moves   | 10.4  | Profile    | regression    | QANOV-973    |
          | vivobr  | 10.4  | Assinatura | smoke         | QANOV-599417 |
          | vivobr  | 10.4  | Explore    | regression    | QANOV-977    |
          | vivobr  | 10.4  | Menu Mais  | regression    | QANOV-599418 |
          | vivobr  | 10.4  | Profile    | regression    | QANOV-980    |
          | vivobr  | 10.4  | Beneficios | regression    | QANOV-599419 |
          | vivobr  | 10.4  | Finanzas   | regression    | QANOV-599420 |
          | o2uk    | 10.4  | Account    | smoke         | QANOV-981    |
          | o2uk    | 10.4  | Explore    | regression    | QANOV-982    |
          | o2uk    | 10.4  | Support    | regression    | QANOV-984    |
          | o2uk    | 10.4  | Profile    | regression    | QANOV-985    |
          | blaude  | 13.10 | Account    | smoke         | QANOV-286557 |
          | blaude  | 13.10 | Explore    | regression    | QANOV-286558 |
          | blaude  | 13.10 | Support    | regression    | QANOV-286559 |
          | blaude  | 13.10 | Profile    | regression    | QANOV-286560 |
          | o2de    | 14.2  | Account    | smoke         | QANOV-286562 |
          | o2de    | 14.2  | Explore    | regression    | QANOV-286563 |
          | o2de    | 14.2  | Support    | regression    | QANOV-286564 |
          | o2de    | 14.2  | Profile    | regression    | QANOV-286565 |

    @old_app
    Examples:
          | product | cv   | screen  | test_priority | jira_id   |
          | vivobr  | 10.4 | Account | smoke         | QANOV-975 |
          | vivobr  | 10.4 | Support | regression    | QANOV-979 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53565 @mobile @no_automatable
  @regression
  Scenario Outline: A <product> user with Fingerprint enabled and with the app in background opens the app after less than 5 minutes: PIN screen doesn't appear and the Aura screen is opened
    Given user is logged in
      And user has the Aura feature
      And user has a "<account_type>" account type
      And user has "PIN;FingerPrint" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "280" seconds
     Then the "<screen>" page is displayed

    Examples:
          | product | account_type | screen | jira_id   |
          | moves   | telco        | Aura   | QANOV-969 |
          | vivobr  | any          | Aura   | QANOV-978 |
          | o2uk    | postpay      | Aura   | QANOV-983 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @jira.link.relates_to.NOV-53279 @mobile @no_automatable @smoke
  Scenario Outline: A user with Fingerprint enabled in the app opens the app after killing it: "PIN code" screen will be shown with the Fingerprint popup on Android devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
     Then the "Fingerprint" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.title]" text is displayed
      And the "popup.description" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.description]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_android.button]" text is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-1061   |
          | vivobr  | 10.4  | QANOV-1062   |
          | o2uk    | 10.4  | QANOV-1063   |
          | blaude  | 13.10 | QANOV-286567 |
          | o2de    | 14.2  | QANOV-286568 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53325 @mobile @no_automatable @smoke
  Scenario Outline: A user with Fingerprint enabled in the app opens the app after more than 5 minutes in background: "PIN code" screen will be shown with the Fingerprint popup in Android devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When runs the app in the background for "301" seconds
     Then the "Fingerprint" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.title]" text is displayed
      And the "popup.description" textfield with "[LANG:launch_app.app_pin_code.fingerprint_android.description]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_android.button]" text is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-1064   |
          | vivobr  | 10.4  | QANOV-1065   |
          | o2uk    | 10.4  | QANOV-1066   |
          | blaude  | 13.10 | QANOV-286569 |
          | o2de    | 14.2  | QANOV-286570 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-181726
  @jira.link.relates_to.NOV-53279 @mobile @no_automatable @smoke
  Scenario Outline: A user with TouchID enabled in the app opens the app after killing it: "PIN code" screen will be shown with the TouchID popup on iOS devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
     Then the "Fingerprint" popup is displayed
      And the "fingerprint_icon" icon is displayed
      And the "popup.title" textfield with "<popup_title>" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_ios.button]" text is displayed

    Examples:
          | product | cv    | popup_title                                          | jira_id      |
          | moves   | 10.4  | [LANG:launch_app.app_pin_code.fingerprint_ios.title] | QANOV-1094   |
          | vivobr  | 10.4  | [LANG:launch_app.app_pin_code.fingerprint_ios.title] | QANOV-1096   |
          | o2uk    | 10.4  | [LANG:launch_app.app_pin_code.fingerprint_ios.title] | QANOV-1098   |
          | blaude  | 13.10 | Touch ID for "Mein Blau"                             | QANOV-286571 |
          | o2de    | 14.2  | Touch ID for "Mein O2"                               | QANOV-286572 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-181726 @jira.link.relates_to.NOV-53325
  @mobile @no_automatable @smoke
  Scenario Outline: A user with TouchID enabled in the app opens the app after more than 5 minutes in background: "PIN code" screen will be shown with the TouchID popup in iOS devices
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When runs the app in the background for "301" seconds
     Then the "Fingerprint" popup is displayed
      And the "fingerprint_icon" icon is displayed
      And the "popup.title" textfield with "<popup_title>" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.fingerprint_ios.button]" text is displayed

    Examples:
          | product | cv    | popup_title                                          | jira_id      |
          | moves   | 10.4  | [LANG:launch_app.app_pin_code.fingerprint_ios.title] | QANOV-1067   |
          | vivobr  | 10.4  | [LANG:launch_app.app_pin_code.fingerprint_ios.title] | QANOV-1068   |
          | o2uk    | 10.4  | [LANG:launch_app.app_pin_code.fingerprint_ios.title] | QANOV-1069   |
          | blaude  | 13.10 | Touch ID for "Mein Blau"                             | QANOV-286573 |
          | o2de    | 14.6  | Touch ID for "Mein O2"                               | QANOV-286574 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53535 @mobile @no_automatable @regression
  Scenario Outline: A <product> user with Fingerprint/TouchID enabled in the app inserts the Fingerprint after more than 5 minutes in background: user will be redirected to the <screen> screen
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "301" seconds
      And introduces FingePrint configured on the device
     Then the "<screen>" page is displayed

    Examples:
          | product | cv    | screen     | depends_on                | jira_id      |
          | moves   | 10.4  | Account    | QANOV-1064:QANOV-1067     | QANOV-1070   |
          | moves   | 10.4  | Explore    | QANOV-1064:QANOV-1067     | QANOV-1071   |
          | moves   | 10.4  | Support    | QANOV-1064:QANOV-1067     | QANOV-1073   |
          | moves   | 10.4  | Profile    | QANOV-1064:QANOV-1067     | QANOV-1074   |
          | vivobr  | 10.4  | Assinatura | QANOV-1065:QANOV-1068     | QANOV-599426 |
          | vivobr  | 10.4  | Explore    | QANOV-1065:QANOV-1068     | QANOV-1076   |
          | vivobr  | 10.4  | Menu Mais  | QANOV-1065:QANOV-1068     | QANOV-599427 |
          | vivobr  | 10.4  | Profile    | QANOV-1065:QANOV-1068     | QANOV-1082   |
          | vivobr  | 10.4  | Beneficios | QANOV-1065:QANOV-1068     | QANOV-599428 |
          | vivobr  | 10.4  | Finazas    | QANOV-1065:QANOV-1068     | QANOV-599429 |
          | o2uk    | 10.4  | Account    | QANOV-1066:QANOV-1069     | QANOV-1084   |
          | o2uk    | 10.4  | Explore    | QANOV-1066:QANOV-1069     | QANOV-1086   |
          | o2uk    | 10.4  | Support    | QANOV-1066:QANOV-1069     | QANOV-1090   |
          | o2uk    | 10.4  | Profile    | QANOV-1066:QANOV-1069     | QANOV-1092   |
          | blaude  | 13.10 | Account    | QANOV-286569:QANOV-286573 | QANOV-286575 |
          | blaude  | 13.10 | Explore    | QANOV-286569:QANOV-286573 | QANOV-286576 |
          | blaude  | 13.10 | Support    | QANOV-286569:QANOV-286573 | QANOV-286577 |
          | blaude  | 13.10 | Profile    | QANOV-286569:QANOV-286573 | QANOV-286578 |
          | o2de    | 14.2  | Account    | QANOV-286570:QANOV-286574 | QANOV-286580 |
          | o2de    | 14.2  | Explore    | QANOV-286570:QANOV-286574 | QANOV-286581 |
          | o2de    | 14.2  | Support    | QANOV-286570:QANOV-286574 | QANOV-286582 |
          | o2de    | 14.2  | Profile    | QANOV-286570:QANOV-286574 | QANOV-286583 |

    @old_app
    Examples:
          | product | cv   | screen  | depends_on            | jira_id    |
          | vivobr  | 10.4 | Account | QANOV-1065:QANOV-1068 | QANOV-1075 |
          | vivobr  | 10.4 | Support | QANOV-1065:QANOV-1068 | QANOV-1080 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53535 @mobile @no_automatable @regression
  Scenario Outline: A <product> user with Fingerprint enabled in the app inserts the Fingerprint after more than 5 minutes in background: user will be redirected to the Aura screen
    Given user is logged in
      And user has the Aura feature
      And user has a "<account_type>" account type
      And user has "PIN;FingerPrint" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "301" seconds
      And introduces FingePrint configured on the device
     Then the "<screen>" page is displayed

    Examples:
          | product | account_type | screen | depends_on            | jira_id    |
          | moves   | telco        | Aura   | QANOV-1064:QANOV-1067 | QANOV-1072 |
          | vivobr  | any          | Aura   | QANOV-1065:QANOV-1068 | QANOV-1078 |
          | o2uk    | postpay      | Aura   | QANOV-1066:QANOV-1069 | QANOV-1088 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53534 @mobile @no_automatable @smoke
  Scenario Outline: A user with Fingerprint/TouchID enabled in the app inserts the Fingerprint after having the app killed: user will be redirected to the landing tab
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN;FingerPrint" feature "enabled" in the application
     When terminates the app
      And launches the app
      And introduces FingerPrint configured on the device
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1061:QANOV-1094     | QANOV-1099   |
          | vivobr  | 10.4  | QANOV-1062:QANOV-1096     | QANOV-1100   |
          | o2uk    | 10.4  | QANOV-1063:QANOV-1098     | QANOV-1101   |
          | blaude  | 13.10 | QANOV-286567:QANOV-286571 | QANOV-286585 |
          | o2de    | 14.2  | QANOV-286568:QANOV-286572 | QANOV-286586 |

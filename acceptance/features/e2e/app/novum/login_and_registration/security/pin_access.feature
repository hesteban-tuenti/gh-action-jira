# -*- coding: utf-8 -*-
@jira.QANOV-847
Feature: PIN access


  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53802 @manual @mobile @regression
  Scenario Outline: A user with PIN/FingerPrint/FaceId security disabled logs out and logs in again without closing the app: User goes to Landing Tab
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN;FingerPrint;FaceId" feature "disabled" in the application
      And user is in the "Profile" page
     When logs out from the application
      And the "Splash Screen" page is displayed
      And clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
     Then the "App Pin Code" page is not displayed
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | login_screen             | jira_id   |
          | moves   | Moves Credentials Login  | QANOV-848 |
          | vivobr  | Vivobr Credentials Login | QANOV-849 |

  @jira.<jira_id> @UniqueLoginClose @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-58627 @mobile @no_automatable
  @o2uk @regression
  Scenario Outline: A user with the specific Telefonica SIM is redirected to the screen to configure the pin after introduce the credentials
    Given user is "<register_status>" in the application
      And user has a "o2uk" SIM in the device
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_title]" text is displayed
      And the "subtitle_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_subtitle]" text is displayed
      And the "app_pin_code_field" inputtext is displayed
      And the "numeric_keyboard" element is displayed

    Examples:
          | register_status | jira_id   |
          | registered      | QANOV-850 |
          | not_registered  | QANOV-851 |

  @jira.<jira_id> @<automation> @<test_priority> @UniqueLoginClose @android @cert0 @cert1 @ios @jira.cv.10.2
  @jira.link.relates_to.NOV-47610 @live @mobile @next @o2uk
  Scenario Outline: A user without the specific Telefonica SIM is redirected to the screen to configure the pin after introduce the credentials
    Given user is "<register_status>" in the application
      And user does not have a "o2uk" SIM in the device
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_title]" text is displayed
      And the "subtitle_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_subtitle]" text is displayed
      And the "app_pin_code_field" inputtext is displayed
      And the "numeric_keyboard" element is on display

    @har
    Examples:
          | register_status | test_priority | automation | jira_id   |
          | registered      | sanity        | manual     | QANOV-852 |

    Examples:
          | register_status | test_priority | automation | jira_id   |
          | not_registered  | regression    | manual     | QANOV-853 |

  @jira.QANOV-286589 @android @har @ios @jira.cv.14.2 @manual @mobile @o2de @sanity
  Scenario: A o2de user is redirected to the screen to configure the PIN after introducing the credentials
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2de Credentials Login" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Password Login" page is displayed
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_title]" text is displayed
      And the "subtitle_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_subtitle]" text is displayed
      And the "app_pin_code_field" inputtext is displayed
      And the "numeric_keyboard" element is on display

  @jira.QANOV-498058 @android @blaude @har @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-494500 @manual @mobile
  @sanity
  Scenario: A blaude user is redirected to the screen to configure the PIN after introducing the credentials in CIAM login
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Blaude Credentials Login" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_title]" text is displayed
      And the "subtitle_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_subtitle]" text is displayed
      And the "app_pin_code_field" inputtext is displayed
      And the "numeric_keyboard" element is on display

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.9.15 @jira.link.relates_to.NOV-18808
  @jira.link.relates_to.NOV-47614 @manual @mobile @o2uk
  Scenario Outline: A user configures PIN code during login (device without fingerprint configured)
    Given user is "<register_status>" in the application
      And user has "PIN;FingerPrint;FaceId" feature "disabled" in the application
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed

    @har
    Examples:
          | register_status | test_priority | jira_id   |
          | registered      | smoke         | QANOV-854 |

    Examples:
          | register_status | test_priority | jira_id   |
          | not_registered  | regression    | QANOV-855 |

  @jira.QANOV-856 @ios @jira.cv.10.2 @jira.link.relates_to.NOV-91696 @manual @mobile @o2uk @regression
  Scenario: A user with PIN and biometrics deactivated in the device only can set the PIN code in iOS devices
    commented_tags="@depends_on.NOV-47576"
    Given user is in the "Profile" page
      And user has "PIN;FingerPrint;FaceId" feature "disabled" in the application
     When logs out from the application
      And the "Splash Screen" page is displayed
      And clicks on the "start_now" button
      And the "O2uk Credentials Login" page is displayed
      And fills and submits the login credentials
     Then the "App Pin Code" page is displayed
      And the "Set FingerPrint" popup is not displayed

  @jira.QANOV-286592 @android @har @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A o2de user without Fingerprint/TouchID configured in the device can set the PIN code after introducing the credentials
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given the device has no fingerprint registered
      And user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "O2de Credentials Login" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Password Login" page is displayed
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-498059 @android @blaude @har @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-494500 @manual @mobile
  @smoke
  Scenario: A blaude user without Fingerprint/TouchID configured in the device can set the PIN code after introducing the credentials in CIAM login
    Biometric access is named "TouchID" on iOS devices and "Fingerprint" on Android devices.
    Given the device has no fingerprint registered
      And user has set the cookies preferences
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Blaude Credentials Login" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-871 @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65178 @manual @mobile @moves @regression
  Scenario: User registered less than 60 seconds ago sees PIN/Biometric set up screen after login
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_title]" text is displayed
      And the "subtitle_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.set_pin_subtitle]" text is displayed
      And the "app_pin_code_field" inputtext is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "numeric_keyboard" element is on display

  @jira.QANOV-873 @android @har @jira.cv.10.5 @jira.link.depends_on.QANOV-871 @jira.link.depends_on.QANOV-879 @moves
  @no_automatable @smoke
  Scenario: Android user chooses to dismiss PIN configuration after first login with the native back button
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the native "back" button
     Then the "Popup Skip Pin" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_title]" text is displayed
      And the "popup.description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_body]" text is displayed
      And the "popup.accept" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_android]" text is displayed
      And the "popup.cancel" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_android]" text is displayed

  @jira.QANOV-516967 @android @har @jira.cv.10.5 @jira.link.depends_on.QANOV-871 @jira.link.depends_on.QANOV-879 @moves
  @no_automatable @smoke
  Scenario: Android user chooses to dismiss PIN configuration after first login with the close button
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Popup Skip Pin" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_title]" text is displayed
      And the "popup.description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_body]" text is displayed
      And the "popup.accept" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_android]" text is displayed
      And the "popup.cancel" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_android]" text is displayed

  @jira.QANOV-84608 @har @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-871 @jira.link.depends_on.QANOV-879 @moves
  @no_automatable @smoke
  Scenario: iOS user chooses to dismiss PIN configuration after first login
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Popup Skip Pin" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_title]" text is displayed
      And the "popup.description" textfield with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_body]" text is displayed
      And the "popup.accept" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_accept_ios]" text is displayed
      And the "popup.cancel" button with "[LANG:profile.security_and_privacy.biometric_pin_access.popup_skip_pin_button_cancel_ios]" text is displayed

  @jira.QANOV-875 @android @jira.cv.10.5 @jira.link.depends_on.QANOV-873 @mobile @moves @no_automatable @regression
  Scenario: Android user chooses to cancel PIN configuration dismissal after first login
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the native "back" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Popup Skip Pin" popup is not displayed
      And the "App Pin Code" page is displayed

  @jira.QANOV-478549 @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-873 @mobile @moves @no_automatable @regression
  Scenario: iOS user chooses to cancel PIN configuration dismissal after first login
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Popup Skip Pin" popup is not displayed
      And the "App Pin Code" page is displayed

  @jira.QANOV-877 @android @jira.cv.10.5 @jira.link.depends_on.QANOV-873 @manual @mobile @moves @regression
  Scenario: Android user confirms dismissal of PIN configuration after first login
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the native "back" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Popup Skip Pin" popup is not displayed
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-877 @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-873 @manual @mobile @moves @regression
  Scenario: iOS user confirms dismissal of PIN configuration after first login
    Given user has registered less than 60 seconds ago
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Popup Skip Pin" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Popup Skip Pin" popup is not displayed
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-887 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-871 @jira.link.depends_on.QANOV-879
  @jira.link.relates_to.NOV-65127 @manual @mobile @moves @regression
  Scenario: A user without biometrics support configures PIN after first login
    Given user has not registered in the application previously
      And the device does not have a "FingerPrint;FaceId" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed
      And the "Biometric" feature is not available in the application
      And the "App Pin Code" feature is enabled in the application

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-91759 @manual @mobile @regression
  Scenario Outline: User does not have to insert PIN/Biometric after receiving a notification to see it
    Given user is logged in
      And user has the app in "background" status
     When waits "280" seconds
     When receives a "service" notification
      And clicks on the notification
     Then the "Destination Deeplink" page is displayed

    Examples:
          | product | jira_id   |
          | moves   | QANOV-902 |
          | vivobr  | QANOV-904 |
          | o2uk    | QANOV-906 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.5 @jira.link.detects.APPS-7608 @jira.link.relates_to.NOV-65738
  @manual @mobile @regression
  Scenario Outline: User has to insert PIN/Biometric after received a notification to see it when the app is in background
    Given user is logged in
      And user has the app in "background" status
     When waits "301" seconds
      And receives a "service" notification
      And clicks on the notification
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
     Then the "Destination Deeplink" page is displayed

    Examples:
          | product | jira_id   |
          | moves   | QANOV-908 |
          | vivobr  | QANOV-910 |
          | o2uk    | QANOV-912 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65738 @manual @mobile @regression
  Scenario Outline: User has to insert PIN/Biometric after received a notification to see it when the app is killed
    Given user is logged in
     When terminates the app
      And receives a "service" notification
      And clicks on the notification
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
     Then the "Destination Deeplink" page is displayed

    Examples:
          | product | jira_id   |
          | moves   | QANOV-913 |
          | vivobr  | QANOV-914 |
          | o2uk    | QANOV-915 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53347 @manual @mobile @regression
  Scenario Outline: A user who changed the PIN code can access the app after having killing it
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    commented_tags="@depends_on.NOV-47205"
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
      And user is in the "Security And Privacy" page
      And clicks on the "biometric_pin_access_entrypoint" entrypoint
      And the "Pin Biometric" page is displayed
      And clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
      And fills the "app_pin_code_field" inputtext with the "5555" text
      And terminates the app
      And launches the app
      And fills the "app_pin_code_field" inputtext with the "5555" text
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-934    |
          | vivobr  | 10.4  | QANOV-936    |
          | o2uk    | 10.4  | QANOV-938    |
          | blaude  | 13.10 | QANOV-286593 |
          | o2de    | 14.2  | QANOV-286594 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53348 @manual @mobile @regression
  Scenario Outline: A user who changed the PIN code can access the app after running it in background for more than 5 minutes
    commented_tags="@depends_on.NOV-47205"
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
      And user is in the "Security And Privacy" page
      And clicks on the "biometric_pin_access_entrypoint" entrypoint
      And the "Pin Biometric" page is displayed
      And clicks on the "change_pin_link" link
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
      And fills the "app_pin_code_field" inputtext with the "5555" text
      And runs the app in the background for "301" seconds
      And fills the "app_pin_code_field" inputtext with the "5555" text
     Then the "Pin Biometric" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-940    |
          | vivobr  | 10.4  | QANOV-941    |
          | o2uk    | 10.4  | QANOV-943    |
          | blaude  | 13.10 | QANOV-286595 |
          | o2de    | 14.2  | QANOV-286596 |

  @jira.QANOV-986 @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-80828 @manual @mobile @regression @vivobr
  Scenario: User who has several lines logged and has activated the PIN/Biometric can see the name and number of the actual line in PIN screen
    Given user is logged in with "several" lines
      And has logged both lines with CPF
      And user has "PIN;Biometric" feature "enabled" in the application
     When terminates the app
      And launches the app
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "​[LANG:launch_app.app_pin_code.title]" text is displayed
      And the "admiration" icon is displayed
      And the "username" textfield with "​[CONTEXT:user.user_name]" text is displayed
      And the "phonenumber" textfield with "​[CONTEXT:user.number]" text is displayed
      And the "forgot_pin" link with "[LANG:launch_app.app_pin_code.forgot_pin]" text is displayed

  @jira.QANOV-488188 @android @ios @jira.cv.10.5 @manual @mobile @regression @vivobr
  Scenario: User who has several lines logged and has activated the PIN/Biometric can see the name of the actual line in PIN screen
    Given user is logged in with "several" lines
      And has logged both lines with OTP
      And user has "PIN;Biometric" feature "enabled" in the application
     When terminates the app
      And launches the app
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "​[LANG:launch_app.app_pin_code.title]" text is displayed
      And the "admiration" icon is displayed
      And the "username" textfield with "​[CONTEXT:user.user_name]" text is displayed
      And the "phonenumber" textfield with "​[CONTEXT:user.number]" text is displayed
      And the "forgot_pin" link with "[LANG:launch_app.app_pin_code.forgot_pin]" text is displayed

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53337 @manual @mobile
  Scenario Outline: A <product> user with only PIN enabled and with the app in background opens the app after less than 5 minutes: PIN screen doesn't appear and <screen> screen is opened
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "280" seconds
     Then the "<screen>" page is displayed

    Examples:
          | product | cv    | screen    | test_priority | jira_id      |
          | moves   | 10.4  | Account   | smoke         | QANOV-987    |
          | moves   | 10.4  | Explore   | regression    | QANOV-988    |
          | moves   | 10.4  | Gestiones | regression    | QANOV-990    |
          | moves   | 10.4  | Profile   | regression    | QANOV-991    |
          | vivobr  | 10.4  | Account   | smoke         | QANOV-992    |
          | vivobr  | 10.4  | Explore   | regression    | QANOV-993    |
          | vivobr  | 10.4  | Tab Mais  | regression    | QANOV-996    |
          | vivobr  | 10.4  | Profile   | regression    | QANOV-997    |
          | o2uk    | 10.4  | Account   | smoke         | QANOV-998    |
          | o2uk    | 10.4  | Explore   | regression    | QANOV-999    |
          | o2uk    | 10.4  | Support   | regression    | QANOV-1002   |
          | o2uk    | 10.4  | Profile   | regression    | QANOV-1004   |
          | blaude  | 13.10 | Account   | smoke         | QANOV-286597 |
          | blaude  | 13.10 | Explore   | regression    | QANOV-286598 |
          | blaude  | 13.10 | Support   | regression    | QANOV-286599 |
          | blaude  | 13.10 | Profile   | regression    | QANOV-286600 |
          | o2de    | 14.2  | Account   | smoke         | QANOV-286602 |
          | o2de    | 14.2  | Explore   | regression    | QANOV-286603 |
          | o2de    | 14.2  | Support   | regression    | QANOV-286604 |
          | o2de    | 14.2  | Profile   | regression    | QANOV-286605 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53337 @manual @mobile @regression
  Scenario Outline: A <product> user with only PIN enabled and with the app in background opens the app after less than 5 minutes: PIN screen doesn't appear and Aura screen is opened
    Given user is logged in
      And user has the Aura feature
      And user has a "<account_type>" account type
      And user has "PIN" feature "enabled" in the application
      And user is in the "Aura" page
     When runs the app in the background for "280" seconds
     Then the "Aura" page is displayed

    Examples:
          | product | account_type | jira_id    |
          | moves   | telco        | QANOV-989  |
          | vivobr  | any          | QANOV-995  |
          | o2uk    | postpay      | QANOV-1000 |

  @jira.QANOV-1006 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53339 @manual @mobile @moves @regression
  Scenario: A user can select the help icon (!) in the top of the screen in MOVES
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And clicks on the "admiration" icon
     Then the "Configure Access" page is displayed
      And the "title" textfield with "[LANG:launch_app.app_pin_code.configure_access.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.app_pin_code.configure_access.description]" text is displayed

  @jira.QANOV-1007 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53339 @manual @mobile @regression @vivobr
  Scenario: A user can select the help icon (!) in the top of the screen in VIVO
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And clicks on the "admiration" icon
     Then the "Configure Access" page is displayed
      And the "title" textfield with "[LANG:launch_app.app_pin_code.configure_access.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.app_pin_code.configure_access.description]" text is displayed

  @jira.<jira_id> @<execution_mode> @<product> @android @har @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53340 @mobile @smoke
  Scenario Outline: A user taps on the "Forgot your PIN" link in the "PIN code" screen: "Forgot PIN" popup will be displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And clicks on the "forgot_pin_button" button
     Then the "Forgot Your Pin" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.forgot_your_pin.title]" text is displayed
      And the "popup.description" textfield with "[LANG:launch_app.app_pin_code.forgot_your_pin.description]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.app_pin_code.forgot_your_pin.continue]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.forgot_your_pin.cancel]" text is displayed

    Examples:
          | product | depends_on                       | execution_mode | jira_id    |
          | moves   | QANOV-1102:QANOV-1121:QANOV-1127 | manual         | QANOV-1111 |
          | vivobr  | QANOV-1103:QANOV-1123:QANOV-1129 | manual         | QANOV-1112 |

    @cert0 @cert1 @live @next
    Examples:
          | product | depends_on                       | execution_mode | jira_id    |
          | o2uk    | QANOV-1104:QANOV-1125:QANOV-1131 | automatic      | QANOV-1113 |

  @jira.<jira_id> @<client> @<product> @har @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A user taps on the "Forgot your PIN" link in the "PIN code" screen: "Forgot PIN" popup will be displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And clicks on the "forgot_pin_button" button
     Then the "Forgot Your Pin" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.forgot_your_pin.title]" text is displayed
      And the "popup.description" textfield with "<popup_description>" text is displayed
      And the "popup.accept" button with "<popup_accept>" text is displayed
      And the "popup.cancel" button with "<popup_cancel>" text is displayed

    Examples:
          | product | cv    | client  | popup_description                                                                                        | popup_accept | popup_cancel | jira_id      |
          | blaude  | 13.10 | android | Benutzername und Passwort für neue PIN eingeben. Möchtest du dich abmelden und eine neue PIN einrichten? | WEITER       | ABBRECHEN    | QANOV-286607 |
          | blaude  | 13.10 | ios     | Kein Problem. Du kannst eine andere PIN erstellen, wenn du dich erneut anmeldest. Erneut anmelden?       | Fortfahren   | Abbrechen    | QANOV-286608 |
          | o2de    | 14.2  | android | Benutzername und Passwort für neue PIN eingeben. Möchtest du dich abmelden und eine neue PIN einrichten? | WEITER       | ABBRECHEN    | QANOV-286609 |
          | o2de    | 14.2  | ios     | Kein Problem. Du kannst eine andere PIN erstellen, wenn du dich erneut anmeldest. Erneut anmelden?       | Fortfahren   | Abbrechen    | QANOV-286610 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53343 @manual @mobile @regression
  Scenario Outline: A user taps the "Cancel" button in the "Forgot PIN" popup: the popup will be closed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And clicks on the "forgot_pin_button" button
      And the "Forgot Your Pin" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Forgot Your Pin" popup is not displayed
      And the "App Pin Code" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1111                | QANOV-1114   |
          | vivobr  | 10.4  | QANOV-1112                | QANOV-1115   |
          | o2uk    | 10.4  | QANOV-1113                | QANOV-1116   |
          | blaude  | 13.10 | QANOV-286607:QANOV-286608 | QANOV-286611 |
          | o2de    | 14.2  | QANOV-286609:QANOV-286610 | QANOV-286612 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53342 @manual @mobile @regression
  Scenario Outline: A user taps the "Continue" button in the "Forgot PIN" popup: the user will be logged out
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And clicks on the "forgot_pin_button" button
      And the "Forgot Your Pin" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1111                | QANOV-1117   |
          | vivobr  | 10.4  | QANOV-1112                | QANOV-1118   |
          | o2uk    | 10.4  | QANOV-1113                | QANOV-1120   |
          | blaude  | 13.10 | QANOV-286607:QANOV-286608 | QANOV-286613 |
          | o2de    | 14.2  | QANOV-286609:QANOV-286610 | QANOV-286614 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53336 @manual @mobile @smoke
  Scenario Outline: A user with PIN and without Fingerprint/FaceID enabled in the app opens the app after killing it: PIN screen will be shown
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
     When terminates the app
      And launches the app
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.title]" text is displayed
      And the "subtitle_pin_code_text" textfield is not displayed
      And the "admiration" icon is displayed
      And the "forgot_pin" link with "[LANG:launch_app.app_pin_code.forgot_pin]" text is displayed
      And the "keyboard" element is displayed

    Examples:
          | product | jira_id    |
          | moves   | QANOV-1121 |
          | vivobr  | QANOV-1123 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53336 @manual @mobile @smoke
  Scenario Outline: A <product> user with PIN enabled and with Fingerprint/FaceID disabled in the app opens the app after killing it: PIN screen will be displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.title]" text is displayed
      And the "subtitle_pin_code_text" textfield is not displayed
      And the "forgot_pin_button" button with "[LANG:launch_app.app_pin_code.forgot_pin]" text is displayed
      And the "keyboard" element is displayed

    Examples:
          | product | cv    | jira_id      |
          | o2uk    | 10.4  | QANOV-1125   |
          | blaude  | 13.10 | QANOV-286615 |
          | o2de    | 14.2  | QANOV-286616 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53334 @manual @mobile @smoke
  Scenario Outline: User with PIN and without Fingerprint/FaceID enabled in the app opens the app after more than 5 minutes in background: PIN screen will be displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
     When runs the app in the background for "301" seconds
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.title]" text is displayed
      And the "subtitle_pin_code_text" textfield is not displayed
      And the "admiration" icon is displayed
      And the "forgot_pin" link with "[LANG:launch_app.app_pin_code.forgot_pin]" text is displayed
      And the "keyboard" element is displayed

    Examples:
          | product | jira_id    |
          | moves   | QANOV-1127 |
          | vivobr  | QANOV-1129 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53334 @manual @mobile @smoke
  Scenario Outline: A <product> user with PIN enabled and with Fingerprint/FaceID disabled in the app opens the app after more than 5 minutes in background: PIN screen will be displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When runs the app in the background for "301" seconds
     Then the "App Pin Code" page is displayed
      And the "title_pin_code_text" textfield with "[LANG:launch_app.app_pin_code.title]" text is displayed
      And the "subtitle_pin_code_text" textfield is not displayed
      And the "forgot_pin_button" button with "[LANG:launch_app.app_pin_code.forgot_pin]" text is displayed
      And the "keyboard" element is displayed

    Examples:
          | product | cv    | jira_id      |
          | o2uk    | 10.4  | QANOV-1131   |
          | blaude  | 13.10 | QANOV-286617 |
          | o2de    | 14.2  | QANOV-286618 |

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53532 @manual @mobile
  Scenario Outline: A <product> user with PIN enabled and with Fingerprint/FaceID disabled in the app inserts the PIN after having the app in background more than 5 minutes: user will be redirected to the <screen> screen
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "301" seconds
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
     Then the "<screen>" page is displayed

    Examples:
          | product | cv    | screen     | test_priority | depends_on   | jira_id      |
          | moves   | 10.4  | Account    | smoke         | QANOV-1127   | QANOV-1133   |
          | moves   | 10.4  | Explore    | regression    | QANOV-1127   | QANOV-1135   |
          | moves   | 10.4  | Support    | regression    | QANOV-1127   | QANOV-1139   |
          | moves   | 10.4  | Profile    | regression    | QANOV-1127   | QANOV-1141   |
          | vivobr  | 10.4  | Assinatura | smoke         | QANOV-1129   | QANOV-599436 |
          | vivobr  | 10.4  | Explore    | regression    | QANOV-1129   | QANOV-1145   |
          | vivobr  | 10.4  | Menu Mais  | regression    | QANOV-1129   | QANOV-599437 |
          | vivobr  | 10.4  | Profile    | regression    | QANOV-1129   | QANOV-1151   |
          | vivobr  | 10.4  | Beneficios | regression    | QANOV-1129   | QANOV-599438 |
          | vivobr  | 10.4  | Finanzas   | regression    | QANOV-1129   | QANOV-599439 |
          | o2uk    | 10.4  | Account    | smoke         | QANOV-1131   | QANOV-1153   |
          | o2uk    | 10.4  | Explore    | regression    | QANOV-1131   | QANOV-1155   |
          | o2uk    | 10.4  | Support    | regression    | QANOV-1131   | QANOV-1158   |
          | o2uk    | 10.4  | Profile    | regression    | QANOV-1131   | QANOV-1160   |
          | blaude  | 13.10 | Account    | smoke         | QANOV-286617 | QANOV-286619 |
          | blaude  | 13.10 | Explore    | regression    | QANOV-286617 | QANOV-286620 |
          | blaude  | 13.10 | Support    | regression    | QANOV-286617 | QANOV-286621 |
          | blaude  | 13.10 | Profile    | regression    | QANOV-286617 | QANOV-286622 |
          | o2de    | 14.2  | Account    | smoke         | QANOV-286618 | QANOV-286624 |
          | o2de    | 14.2  | Explore    | regression    | QANOV-286618 | QANOV-286625 |
          | o2de    | 14.2  | Support    | regression    | QANOV-286618 | QANOV-286626 |
          | o2de    | 14.2  | Profile    | regression    | QANOV-286618 | QANOV-286627 |

    @old_app
    Examples:
          | product | cv   | screen  | test_priority | depends_on | jira_id    |
          | vivobr  | 10.4 | Account | smoke         | QANOV-1129 | QANOV-1143 |
          | vivobr  | 10.4 | Support | regression    | QANOV-1129 | QANOV-1149 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53532 @manual @mobile @regression
  Scenario Outline: A <product> user with PIN and without Fingerprint/FaceID enabled in the app inserts the PIN after having the app in background more than 5 minutes: user will be redirected to the Aura screen
    Given user is logged in
      And user has the Aura feature
      And user has a "<account_type>" account type
      And user has "PIN" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "301" seconds
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
     Then the "<screen>" page is displayed

    Examples:
          | product | account_type | screen | depends_on | jira_id    |
          | moves   | telco        | Aura   | QANOV-1127 | QANOV-1137 |
          | vivobr  | any          | Aura   | QANOV-1129 | QANOV-1147 |
          | o2uk    | postpay      | Aura   | QANOV-1131 | QANOV-1156 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53533 @manual @mobile @smoke
  Scenario Outline: User with PIN enabled and with Fingerprint/FaceID disabled in the app inserts the PIN after having the app killed: user will be redirected to the landing tab
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | moves   | 10.4  | QANOV-1121   | QANOV-1163   |
          | vivobr  | 10.4  | QANOV-1123   | QANOV-1166   |
          | o2uk    | 10.4  | QANOV-1125   | QANOV-1168   |
          | blaude  | 13.10 | QANOV-286615 | QANOV-286629 |
          | o2de    | 14.2  | QANOV-286616 | QANOV-286630 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53345 @manual @mobile @regression
  Scenario Outline: A user with PIN enabled and with Fingerprint/FaceID disabled in the app introduces wrong PIN: error message is shown
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And fills "app_pin_code_field" inputext with wrong pin code
     Then the "wrong_pin_code" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_text]" text is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1121:QANOV-1127     | QANOV-1173   |
          | vivobr  | 10.4  | QANOV-1123:QANOV-1129     | QANOV-1179   |
          | o2uk    | 10.4  | QANOV-1125:QANOV-1131     | QANOV-1184   |
          | blaude  | 13.10 | QANOV-286617:QANOV-286615 | QANOV-286631 |
          | o2de    | 14.2  | QANOV-286618:QANOV-286616 | QANOV-286632 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53344 @manual @mobile @smoke
  Scenario Outline: A user with PIN enabled and with Fingerprint/FaceID disabled in the app introduces wrong PIN 3 times: popup is displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And fills "app_pin_code_field" inputext with wrong pin code
      And fills "app_pin_code_field" inputext with wrong pin code
      And fills "app_pin_code_field" inputext with wrong pin code
     Then the "Wrong Pin Code" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_code.title]" text is displayed
      And the "popup.description" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_code.description]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.app_pin_code.wrong_pin_code.continue]" text is displayed

    Examples:
          | product | depends_on            | jira_id    |
          | moves   | QANOV-1121:QANOV-1127 | QANOV-1189 |
          | vivobr  | QANOV-1123:QANOV-1129 | QANOV-1195 |
          | o2uk    | QANOV-1125:QANOV-1131 | QANOV-1201 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53344
  @manual @mobile @smoke
  Scenario Outline: A user with PIN enabled and with Fingerprint/FaceID disabled in the app introduces wrong PIN 3 times: popup is displayed
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And user has "FingerPrint;FaceId" feature "disabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And fills "app_pin_code_field" inputext with wrong pin code
      And fills "app_pin_code_field" inputext with wrong pin code
      And fills "app_pin_code_field" inputext with wrong pin code
     Then the "Wrong Pin Code" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_code.title]" text is displayed
      And the "popup.description" textfield with "[LANG:launch_app.app_pin_code.wrong_pin_code.description]" text is displayed
      And the "popup.accept" button with "<button_text>" text is displayed

    Examples:
          | product | cv    | client  | button_text | depends_on                | jira_id      |
          | blaude  | 13.10 | android | WEITER      | QANOV-286617:QANOV-286615 | QANOV-286633 |
          | blaude  | 13.10 | ios     | Fortfahren  | QANOV-286617:QANOV-286615 | QANOV-287458 |
          | o2de    | 14.2  | android | WEITER      | QANOV-286618:QANOV-286616 | QANOV-286634 |
          | o2de    | 14.2  | ios     | Fortfahren  | QANOV-286618:QANOV-286616 | QANOV-287459 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53346 @manual @mobile @regression
  Scenario Outline: A user accepts the popup after introducing wrong PIN 3 times: the user will be redirected to the splash screen
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And fills "app_pin_code_field" inputext with wrong pin code
      And fills "app_pin_code_field" inputext with wrong pin code
      And fills "app_pin_code_field" inputext with wrong pin code
      And the "Wrong Pin Code" popup is displayed
      And clicks on the "popup.continue" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1189                | QANOV-1205   |
          | vivobr  | 10.4  | QANOV-1195                | QANOV-1207   |
          | o2uk    | 10.4  | QANOV-1201                | QANOV-1208   |
          | blaude  | 13.10 | QANOV-286633:QANOV-287458 | QANOV-286635 |
          | o2de    | 14.2  | QANOV-286634:QANOV-287459 | QANOV-286636 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53338 @manual @mobile @smoke
  Scenario Outline: A user without the PIN/FingerPrint/FaceID security enabled opens the app after having it in background: PIN/FingerPrint/FaceID won't be required
    Given user is logged in
      And user has "PIN;FingerPrint;FaceId" feature is not enabled in the application
      And user is in the "Account" page
     When runs the app in the background for "<background_time>" seconds
     Then the "Account" page is displayed

    Examples:
          | product | background_time | jira_id    |
          | moves   | 10              | QANOV-1210 |
          | moves   | 301             | QANOV-1212 |
          | vivobr  | 10              | QANOV-1214 |
          | vivobr  | 301             | QANOV-1217 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53490 @manual @mobile @smoke
  Scenario Outline: A user without the PIN/FingerPrint/FaceID security enabled opens the app after killing it: PIN/FingerPrint/FaceID won't be required
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN;FingerPrint;FaceId" feature is not enabled in the application
     When terminates the app
      And launches the app
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | jira_id    |
          | moves   | QANOV-1219 |
          | vivobr  | QANOV-1221 |

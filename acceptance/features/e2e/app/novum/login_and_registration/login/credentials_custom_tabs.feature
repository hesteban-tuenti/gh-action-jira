# -*- coding: utf-8 -*-
@jira.QANOV-126324
Feature: Credentials Custom Tabs

  Actions Before each Scenario:
    Given user is in the "Splash Screen" page


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the Password Save pop up when accessing to the Login Confirmation page on Android devices
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And user is in the "<page>" browser webview
     When fills and submits the login credentials
     Then the "Login Confirmation" browser webview is displayed
      And the "confirmation_message" textfield with "Te has identificado correctamente" text is displayed
      And the "confirm_button" button with "Comenzar" text is displayed
      And the "password_save" popup is displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | page                    | cv   | jira_id     |
          | moves   | Moves Credentials Login | 14.3 | QANOV-38916 |

    Examples:
          | product | page                   | cv     | jira_id      |
          | o2es    | O2es Credentials Login | Future | QANOV-558976 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see the Password Save pop up when accessing to the Login Confirmation page on iOS devices
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And user is in the "<page>" browser webview
     When fills and submits the login credentials
     Then the "Login Confirmation" browser webview is displayed
      And the "confirmation_message" textfield with "Te has identificado correctamente" text is displayed
      And the "confirm_button" button with "Comenzar" text is displayed
      And the "password_save" popup is displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | page                    | cv   | jira_id     |
          | moves   | Moves Credentials Login | 13.0 | QANOV-38917 |

    Examples:
          | product | page                   | cv     | jira_id      |
          | o2es    | O2es Credentials Login | Future | QANOV-558977 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke @har
  Scenario Outline: User can save his password in a cookie in the device native browser from the Login Confirmation page
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And user is in the "<page>" browser webview
     When fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And the "password_save" popup is displayed
      And clicks on the "password_save.save" button
     Then the password is stored in a cookie in the device native browser
      And the "password_save" popup is not displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | page                    | cv   | jira_id     |
          | moves   | Moves Credentials Login | 13.0 | QANOV-38918 |

    Examples:
          | product | page                   | cv     | jira_id      |
          | o2es    | O2es Credentials Login | Future | QANOV-558978 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can reject the credentials save in the Login Confirmation page
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And user is in the "<page>" browser webview
     When fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And the "password_save" popup is displayed
      And clicks on the "password_save.never" button
     Then the credentials are not stored in a cookie in the device native browser
      And the "password_save" popup is not displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | page                    | cv   | jira_id    |
          | moves   | Moves Credentials Login | 13.0 | QANOV-2482 |

    Examples:
          | product | page                   | cv     | jira_id      |
          | o2es    | O2es Credentials Login | Future | QANOV-558979 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can cancel the credentials save in the Login Confirmation page on iOS devices
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And user is in the "<page>" browser webview
     When fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And the "password_save" popup is displayed
      And clicks on the "password_save.cancel" button
     Then the credentials are not stored in a cookie in the device native browser
      And the "password_save" popup is not displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | page                    | cv   | jira_id     |
          | moves   | Moves Credentials Login | 13.0 | QANOV-38919 |

    Examples:
          | product | page                   | cv     | jira_id      |
          | o2es    | O2es Credentials Login | Future | QANOV-558980 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can close the confirmation screen to save the login credential
    Given user is in the "<page>" browser webview
      And cookies are enabled in the browser
     When fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | page                    | cv   | jira_id     |
          | moves   | Moves Credentials Login | 13.0 | QANOV-38920 |

    Examples:
          | product | page                   | cv     | jira_id      |
          | o2es    | O2es Credentials Login | Future | QANOV-558981 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @mobile @no_automatable @smoke @har
  Scenario Outline: User who starts the login process with a stored password will see the Account Selector popup to set the password on Android devices
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And the credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "continue_button" button
      And clicks on the "pass_field" inputtext
     Then the "Browser Account Selector" popup is displayed
      And the "user_stored_passwords" list is displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.0 | QANOV-38921 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-558982 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @mobile @no_automatable @smoke @har
  Scenario Outline: User who starts the login process with a stored password will see the Account Selector popup to set the password on iOS devices
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And the credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "continue_button" button
      And clicks on the "pass_field" inputtext
     Then the "Browser Account Selector" popup is displayed
      And the "title" textfield that contains the "¿Iniciar sesión" text is displayed
      And the "password_set" button with the "Usar \"LOGIN_CREDENTIAL\"" format is displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.0 | QANOV-38922 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-558983 |

  @jira.QANOV-2605 @android @ber @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-38862 @manual @mobile @moves @smoke
  Scenario: User selects a password to set in the password field on Android devices: password field will be filled
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And the credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "continue_button" button
      And clicks on the "pass_field" inputtext
      And the "Account Selector" popup is displayed
      And clicks on the "0" element in the "user_stored_passwords" list
     Then the "pass_field" inputtext is not empty

  @jira.QANOV-558984 @android @jira.cv.Future @mobile @no_automatable @o2es @smoke
  Scenario: User selects a password to set in the password field on Android devices: password field will be filled
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And the credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And clicks on the "identifier_inputtext" inputtext
      And the "Account Selector" popup is displayed
      And clicks on the "0" element in the "user_stored_passwords" list
     Then the "pass_field" inputtext is not empty

  @jira.QANOV-38923 @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-38862 @manual @mobile @moves @smoke
  Scenario: User taps on the password_set button on iOS devices: password field will be filled
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And the credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "continue_button" button
      And clicks on the "pass_field" inputtext
      And the "Account Selector" popup is displayed
      And clicks on the "password_set" button
     Then the "pass_field" inputtext is not empty

  @jira.QANOV-558985 @ios @jira.cv.Future @mobile @no_automatable @o2es @smoke
  Scenario: User taps on the password_set button on iOS devices: password field will be filled
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And the credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And clicks on the "identifier_inputtext" inputtext
      And the "Account Selector" popup is displayed
      And clicks on the "password_set" button
     Then the "pass_field" inputtext is not empty

  @jira.QANOV-2434 @android @ios @jira.cv.13.0 @jira.link.relates_to.NOV-175537 @manual @mobile @moves @regression
  Scenario: User can close the custom tabs browser webview
    Given user is in the "Moves Credentials Login" browser webview
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-2439 @android @jira.cv.13.0 @jira.link.relates_to.NOV-175538 @manual @mobile @moves @regression
  Scenario: User can go back from the custom tabs browser webview to the Splash from the login screen on Android devices
    Given user is in the "Moves Credentials Login" browser webview
     When clicks on the native "back" button
     Then the "Splash Screen" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: User will see an error when starting the login process without the cookies enabled in the browser
    Given cookies are disabled in the browser
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the "Cookies Disabled Popup" popup is displayed
      And the "accept" button is displayed

    @jira.link.parent_test_plan.QANOV-38862
    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.0 | QANOV-272888 |

    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-558986 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @mobile @no_automatable @smoke @har
  Scenario Outline: User with a default navigator with custom tabs clicks on the start_now button: default navigator is shown embedded in the app
    If there's a default browser selected:
    -> If default browser supports custom tabs
    --> Use that browser (As it will be the only returned one)
    -> If default browser does not support custom tabs
    --> Try open chrome (there is no way to ask), just try it, in custom tabs.
    Given user has default browser with custom tabs
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the default browser is displayed as a custom tab
      And the "<page>" browser webview is displayed

    @jira.link.parent_test_plan.QANOV-310051
    Examples:
          | product | page                    | cv   | jira_id      |
          | moves   | Moves Credentials Login | 14.3 | QANOV-360684 |

    Examples:
          | product | page                     | cv     | jira_id      |
          | blaude  | Blaude Credentials Login | 14.4   | QANOV-360685 |
          | o2de    | O2de Credentials Login   | 14.4   | QANOV-360686 |
          | vivobr  | Vivobr Credentials Login | 14.4   | QANOV-360687 |
          | o2es    | O2es Credentials Login   | Future | QANOV-558988 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: User with a default navigator without custom tabs and Google Chrome installed clicks on the start_now button: Google Chrome app is shown embedded in the app
    If there's a default browser selected:
    -> If default browser supports custom tabs
    --> Use that browser (As it will be the only returned one)
    -> If default browser does not support custom tabs
    --> Try open chrome (there is no way to ask), just try it, in custom tabs.
    Given user has default browser without custom tabs
      And user has installed the "Google Chrome" app
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the Google Chrome browser is displayed as a custom tab
      And the "<page>" browser webview is displayed

    @jira.link.parent_test_plan.QANOV-310051
    Examples:
          | product | page                    | cv   | jira_id      |
          | moves   | Moves Credentials Login | 14.3 | QANOV-360688 |

    Examples:
          | product | page                     | cv     | jira_id      |
          | blaude  | Blaude Credentials Login | 14.4   | QANOV-360689 |
          | o2de    | O2de Credentials Login   | 14.4   | QANOV-360690 |
          | vivobr  | Vivobr Credentials Login | 14.4   | QANOV-360691 |
          | o2es    | O2es Credentials Login   | Future | QANOV-558990 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: User with a default navigator without custom tabs and without Google Chrome installed clicks on the start_now button: Login flow is displayed in an internal webview
    If there's a default browser selected:
    -> If default browser supports custom tabs
    --> Use that browser (As it will be the only returned one)
    -> If default browser does not support custom tabs
    --> Try open chrome (there is no way to ask), just try it, in custom tabs
    Given user has default browser without custom tabs
      And user has not installed the "Google Chrome" app
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<page>" internal webview is displayed

    @jira.link.parent_test_plan.QANOV-310051
    Examples:
          | product | page                    | cv   | jira_id      |
          | moves   | Moves Credentials Login | 14.3 | QANOV-360692 |

    Examples:
          | product | page                     | cv     | jira_id      |
          | blaude  | Blaude Credentials Login | 14.4   | QANOV-360693 |
          | o2de    | O2de Credentials Login   | 14.4   | QANOV-360694 |
          | vivobr  | Vivobr Credentials Login | 14.4   | QANOV-360695 |
          | o2es    | O2es Credentials Login   | Future | QANOV-558992 |

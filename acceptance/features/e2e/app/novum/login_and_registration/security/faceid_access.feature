# -*- coding: utf-8 -*-
@jira.QANOV-126316
Feature: Faceid access


  @jira.<jira_id> @<product> @har @ios @jira.cv.10.5 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-65131
  @mobile @no_automatable @sanity
  Scenario Outline: A user with FaceID support configures PIN after first login in iOS devices
    commented_tags="@depends_on.NOV-53359 @depends_on.NOV-65005 @depends_on.NOV-53358"
    Given the device has a "FaceID" registered
      And user has never logged in the app
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set FaceId" popup is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.faceid_set_up.cancel_button]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.app_pin_code.faceid_set_up.accept_button]" text is displayed

    Examples:
          | product | login_screen             | depends_on          | jira_id   |
          | moves   | Moves Credentials Login  | QANOV-871:QANOV-879 | QANOV-891 |
          | vivobr  | Vivobr Credentials Login | QANOV-872:QANOV-880 | QANOV-892 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.detects.<detects> @mobile @no_automatable @smoke
  Scenario Outline: A user with FaceID in the device configures PIN during login: a popup to configure the FaceID is displayed on iOS devices
    Given the device has a "FaceId" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Set Face Id" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.app_pin_code.faceid_set_up.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.app_pin_code.faceid_set_up.message]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.app_pin_code.faceid_set_up.accept_button]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.app_pin_code.faceid_set_up.cancel_button]" text is displayed

    Examples:
          | product | cv    | login_screen             | detects  | jira_id      |
          | o2uk    | 10.4  | O2uk Credentials Login   | IOS-7285 | QANOV-863    |
          | blaude  | 13.10 | Blaude Credentials Login |          | QANOV-286490 |
          | o2de    | 14.2  | O2de Credentials Login   |          | QANOV-286491 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.<relates_to>
  @mobile @no_automatable @sanity
  Scenario Outline: A user chooses to activate FaceID after first login in iOS devices
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given the device has a "FaceID" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FaceId" popup is displayed
      And clicks on the "popup.accept" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FaceID" feature is enabled in the application

    Examples:
          | product | cv    | login_screen             | relates_to | depends_on   | jira_id      |
          | o2uk    | 10.4  | O2uk Credentials Login   | NOV-54272  | QANOV-863    | QANOV-864    |
          | moves   | 10.5  | Moves Credentials Login  | NOV-65130  | QANOV-891    | QANOV-893    |
          | vivobr  | 10.5  | Vivobr Credentials Login | NOV-65130  | QANOV-892    | QANOV-894    |
          | blaude  | 13.10 | Blaude Credentials Login |            | QANOV-286490 | QANOV-286492 |
          | o2de    | 14.2  | O2de Credentials Login   |            | QANOV-286491 | QANOV-286493 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-65123 @mobile
  @no_automatable @regression
  Scenario Outline: A user chooses to dismiss FaceID after first login in iOS devices
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given the device has a "FaceID" registered
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "<login_screen>" page is displayed
      And fills and submits the login credentials
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "Set FaceId" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "FaceID" feature is not enabled in the application

    Examples:
          | product | cv    | login_screen             | depends_on   | jira_id      |
          | moves   | 10.5  | Moves Credentials Login  | QANOV-891    | QANOV-896    |
          | vivobr  | 10.5  | Vivobr Credentials Login | QANOV-892    | QANOV-898    |
          | o2uk    | 10.4  | O2uk Credentials Login   | QANOV-863    | QANOV-286494 |
          | blaude  | 13.10 | Blaude Credentials Login | QANOV-286490 | QANOV-286495 |
          | o2de    | 14.2  | O2de Credentials Login   | QANOV-286491 | QANOV-286496 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53563 @mobile @no_automatable @regression
  Scenario Outline: A user who changed the FaceID can access the app after having killing it in iOS devices
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When changes the FaceID in the device
      And terminates the app
      And launches the app
      And introduces the new FaceID configured on the device
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-916    |
          | vivobr  | 10.4  | QANOV-917    |
          | o2uk    | 10.4  | QANOV-918    |
          | blaude  | 13.10 | QANOV-286497 |
          | o2de    | 14.2  | QANOV-286498 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53564 @mobile @no_automatable @regression
  Scenario Outline: A user who changed the FaceID can access the app after running it in background for more than 5 minutes in iOS devices
    Given user is logged in
      And user is in the "Account" page
      And user has "PIN;FaceID" feature "enabled" in the application
     When changes the FaceID in the device
      And runs the app in the background for "301" seconds
      And introduces the new FaceID configured on the device
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-919    |
          | vivobr  | 10.4  | QANOV-920    |
          | o2uk    | 10.4  | QANOV-921    |
          | blaude  | 13.10 | QANOV-286499 |
          | o2de    | 14.2  | QANOV-286500 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53566 @mobile @no_automatable @regression
  Scenario Outline: A <product> user with FaceID enabled and with the app in background opens the app after less than 5 minutes: PIN screen doesn't appear in iOS devices and the <screen> screen is opened
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "280" seconds
     Then the "<screen>" page is displayed

    Examples:
          | product | cv    | screen     | jira_id      |
          | moves   | 10.4  | Account    | QANOV-945    |
          | moves   | 10.4  | Explore    | QANOV-946    |
          | moves   | 10.4  | Support    | QANOV-948    |
          | moves   | 10.4  | Profile    | QANOV-949    |
          | vivobr  | 10.4  | Assinatura | QANOV-599389 |
          | vivobr  | 10.4  | Explore    | QANOV-951    |
          | vivobr  | 10.4  | Menu Mais  | QANOV-599390 |
          | vivobr  | 10.4  | Profile    | QANOV-954    |
          | vivobr  | 14.2  | Beneficios | QANOV-599391 |
          | vivobr  | 14.2  | Finanzas   | QANOV-599392 |
          | o2uk    | 10.4  | Account    | QANOV-956    |
          | o2uk    | 10.4  | Explore    | QANOV-958    |
          | o2uk    | 10.4  | Support    | QANOV-962    |
          | o2uk    | 10.4  | Profile    | QANOV-964    |
          | blaude  | 13.10 | Account    | QANOV-286501 |
          | blaude  | 13.10 | Explore    | QANOV-286502 |
          | blaude  | 13.10 | Support    | QANOV-286503 |
          | blaude  | 13.10 | Profile    | QANOV-286504 |
          | o2de    | 14.2  | Account    | QANOV-286506 |
          | o2de    | 14.2  | Explore    | QANOV-286507 |
          | o2de    | 14.2  | Support    | QANOV-286508 |
          | o2de    | 14.2  | Profile    | QANOV-286509 |

    @old_app
    Examples:
          | product | cv   | screen  | jira_id   |
          | vivobr  | 10.4 | Account | QANOV-950 |
          | vivobr  | 10.4 | Support | QANOV-953 |

  @jira.<jira_id> @<product> @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53566 @mobile @no_automatable @regression
  Scenario Outline: A <product> user with FaceID enabled and with the app in background opens the app after less than 5 minutes: PIN screen doesn't appear in iOS devices and the Aura screen is opened
    Given user is logged in
      And user has a "<account_type>" account type
      And user has the Aura feature
      And user has "PIN;FaceID" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "280" seconds
     Then the "<screen>" page is displayed

    Examples:
          | product | account_type | screen | jira_id   |
          | moves   | telco        | Aura   | QANOV-947 |
          | vivobr  | any          | Aura   | QANOV-952 |
          | o2uk    | postpay      | Aura   | QANOV-960 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53329 @mobile @no_automatable @sanity
  Scenario Outline: A user with the FaceID enabled in the app opens the app after killing it: "PIN code" screen will be shown with a FaceID popup in iOS devices
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When terminates the app
      And launches the app
     Then the "App Pin Code" page is displayed
      And the "Face Id" popup is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-1009   |
          | vivobr  | 10.4  | QANOV-1011   |
          | o2uk    | 10.4  | QANOV-1013   |
          | blaude  | 13.10 | QANOV-286511 |
          | o2de    | 14.2  | QANOV-286512 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-53330 @mobile @no_automatable @smoke
  Scenario Outline: A user with the FaceID enabled in the app opens the app after more than 5 minutes in background: "PIN code" screen will be shown with the FaceID popup in iOS devices
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When runs the app in the background for "301" seconds
     Then the "App Pin Code" page is displayed
      And the "Face Id" popup is displayed

    Examples:
          | product | cv    | jira_id      |
          | moves   | 10.4  | QANOV-1015   |
          | vivobr  | 10.4  | QANOV-1017   |
          | o2uk    | 10.4  | QANOV-1019   |
          | blaude  | 13.10 | QANOV-286513 |
          | o2de    | 14.2  | QANOV-286514 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53333 @mobile
  @no_automatable @regression
  Scenario Outline: A user introduces wrong FaceID: an error popup will be shown in iOS devices
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And introduces a wrong FaceID on the device
     Then the "Wrong Face Id" popup is displayed
      And the "popup.title" textfield with "Cara no reconocida Intentar de nuevo" text is displayed
      And the "popup.accept" button with "Volver a probar Face ID" text is displayed
      And the "popup.cancel" button with "Cancelar" text is displayed

    Examples:
          | product | cv    | depends_on                | jira_id      |
          | moves   | 10.4  | QANOV-1009:QANOV-1015     | QANOV-1022   |
          | vivobr  | 10.4  | QANOV-1011:QANOV-1017     | QANOV-1024   |
          | o2uk    | 10.4  | QANOV-1013:QANOV-1019     | QANOV-1025   |
          | blaude  | 13.10 | QANOV-286511:QANOV-286513 | QANOV-286515 |
          | o2de    | 14.2  | QANOV-286512:QANOV-286514 | QANOV-286516 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53489 @mobile
  @no_automatable @regression
  Scenario Outline: A user who inserted a wrong FaceID can cancel to insert the PIN instead in iOS devices
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And introduces a wrong FaceID on the device
      And the "Wrong Face Id" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Wrong Face Id" popup is not displayed
      And the "App Pin Code" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | moves   | 10.4  | QANOV-1022   | QANOV-1026   |
          | vivobr  | 10.4  | QANOV-1024   | QANOV-1027   |
          | o2uk    | 10.4  | QANOV-1025   | QANOV-1028   |
          | blaude  | 13.10 | QANOV-286515 | QANOV-286517 |
          | o2de    | 14.2  | QANOV-286516 | QANOV-286518 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53487 @mobile
  @no_automatable @regression
  Scenario Outline: A user who inserted a wrong FaceID can introduce the FaceID again in iOS devices
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And introduces a wrong FaceID on the device
      And the "Wrong Face Id" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Set Face Id" popup is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | moves   | 10.4  | QANOV-1022   | QANOV-1029   |
          | vivobr  | 10.4  | QANOV-1024   | QANOV-1030   |
          | o2uk    | 10.4  | QANOV-1025   | QANOV-1031   |
          | blaude  | 13.10 | QANOV-286515 | QANOV-286519 |
          | o2de    | 14.2  | QANOV-286516 | QANOV-286520 |

  @jira.<jira_id> @<product> @<test_priority> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-53536 @mobile @no_automatable
  Scenario Outline: A <product> user with the FaceID enabled in the app inserts the FaceID after more than 5 minutes in background: user will be redirected to the <screen> screen
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "301" seconds
      And introduces FaceID configured on the device
     Then the "<screen>" page is displayed

    @har
    Examples:
          | product | cv    | screen     | test_priority | depends_on   | jira_id      |
          | moves   | 10.4  | Account    | smoke         | QANOV-1015   | QANOV-1032   |
          | vivobr  | 10.4  | Assinatura | smoke         | QANOV-1017   | QANOV-599395 |
          | o2uk    | 10.4  | Account    | smoke         | QANOV-1019   | QANOV-1050   |
          | blaude  | 13.10 | Account    | smoke         | QANOV-286513 | QANOV-286521 |
          | o2de    | 14.2  | Account    | smoke         | QANOV-286514 | QANOV-286526 |

    @har @old_app
    Examples:
          | product | cv   | screen  | test_priority | depends_on | jira_id    |
          | vivobr  | 10.4 | Account | smoke         | QANOV-1017 | QANOV-1040 |

    Examples:
          | product | cv    | screen     | test_priority | depends_on   | jira_id      |
          | moves   | 10.4  | Explore    | regression    | QANOV-1015   | QANOV-1033   |
          | moves   | 10.4  | Support    | regression    | QANOV-1015   | QANOV-1036   |
          | moves   | 10.4  | Profile    | regression    | QANOV-1015   | QANOV-1038   |
          | vivobr  | 10.4  | Explore    | regression    | QANOV-1017   | QANOV-1042   |
          | vivobr  | 10.4  | Menu Mais  | regression    | QANOV-1017   | QANOV-599398 |
          | vivobr  | 10.4  | Profile    | regression    | QANOV-1017   | QANOV-1048   |
          | vivobr  | 10.4  | Beneficios | regression    | QANOV-1017   | QANOV-599399 |
          | vivobr  | 10.4  | Finanzas   | regression    | QANOV-1017   | QANOV-599400 |
          | o2uk    | 10.4  | Explore    | regression    | QANOV-1019   | QANOV-1051   |
          | o2uk    | 10.4  | Support    | regression    | QANOV-1019   | QANOV-1055   |
          | o2uk    | 10.4  | Profile    | regression    | QANOV-1019   | QANOV-1057   |
          | blaude  | 13.10 | Explore    | regression    | QANOV-286513 | QANOV-286522 |
          | blaude  | 13.10 | Support    | regression    | QANOV-286513 | QANOV-286523 |
          | blaude  | 13.10 | Profile    | regression    | QANOV-286513 | QANOV-286524 |
          | o2de    | 14.2  | Explore    | regression    | QANOV-286514 | QANOV-286527 |
          | o2de    | 14.2  | Support    | regression    | QANOV-286514 | QANOV-286528 |
          | o2de    | 14.2  | Profile    | regression    | QANOV-286514 | QANOV-286529 |

    @old_app
    Examples:
          | product | cv   | screen  | test_priority | depends_on | jira_id    |
          | vivobr  | 10.4 | Support | regression    | QANOV-1017 | QANOV-1046 |

  @jira.<jira_id> @<product> @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53536 @mobile
  @no_automatable @regression
  Scenario Outline: A <product> user with the FaceID enabled in the app inserts the FaceID after more than 5 minutes in background: user will be redirected to the Aura screen
    Given user is logged in
      And user has the Aura feature
      And user has a "<account_type>" account type
      And user has "PIN;FaceID" feature "enabled" in the application
      And user is in the "<screen>" page
     When runs the app in the background for "301" seconds
      And introduces FaceID configured on the device
     Then the "<screen>" page is displayed

    Examples:
          | product | account_type | screen | depends_on | jira_id    |
          | moves   | telco        | Aura   | QANOV-1015 | QANOV-1034 |
          | vivobr  | any          | Aura   | QANOV-1017 | QANOV-1044 |
          | o2uk    | postpay      | Aura   | QANOV-1019 | QANOV-1053 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-53537
  @mobile @no_automatable @regression
  Scenario Outline: A user with the FaceID enabled in the app inserts the FaceID after having the app killed: user will be redirected to the landing tab in iOS devices
    For MOVES, all Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user is logged in
      And user has "PIN;FaceID" feature "enabled" in the application
     When terminates the app
      And launches the app
      And introduces FaceID configured on the device
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | depends_on   | jira_id      |
          | moves   | 10.4  | QANOV-1009   | QANOV-1058   |
          | vivobr  | 10.4  | QANOV-1011   | QANOV-1059   |
          | o2uk    | 10.4  | QANOV-1013   | QANOV-1060   |
          | blaude  | 13.10 | QANOV-286511 | QANOV-286531 |
          | o2de    | 14.2  | QANOV-286512 | QANOV-286532 |

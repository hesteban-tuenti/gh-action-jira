# -*- coding: utf-8 -*-
@jira.QANOV-5195
Feature: Credentials

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out
      And user is in the "Splash Screen" page


  @jira.QANOV-5450 @android @automatic @ber @har @ios @jira.cv.11.2 @jira.link.relates_to.NOV-111973 @live @mobile @moves
  @next @smoke
  Scenario: User can access to the "Soy titular" tab from the "Soy usuario de línea" tab
    internal_checkpoint=The cert2 tag must be added when the custom tabs are well defined in cert2 for moves
    commented_tags="@depends_on.NOV-111952 @depends_on.NOV-175432"
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And clicks on the "selector_tab.password_selector" tab
     Then the "identity_placeholder" textfield with "NIF/CIF/NIE/Pasaporte" text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed
      And the "register_recover_pass_link" link with "Regístrate o recupera la contraseña" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-272664 @android @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: A Telco In customer can log in the app with user / password
    internal_checkpoint="For DEV, we can use '02000024J' (Telco-in)"
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "telco-in" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Moves Password Login" page is displayed
      And the "dni" textfield with "[CONTEXT:user.user_login]" text is displayed
      And the "password_field" inputtext with the "Contraseña" placeholder is displayed
      And the "eye" icon is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "continue_button" button is disabled
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed
      And the "register" link with "Regístrate o recupera la contraseña" text is displayed

  @jira.QANOV-272667 @android @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: A Telco Out customer can log in the app with user / password
    internal_checkpoint="NOTE: a Telco Out customer is a customer that is being migrated (from Telco to Legado)
    Telco OUT (PROD): FIC075267F"
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "telco-out" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Moves Password Login" page is displayed
      And the "dni" textfield with "[CONTEXT:user.user_login]" text is displayed
      And the "password_field" inputtext with the "Contraseña" placeholder is displayed
      And the "eye" icon is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "continue_button" button is disabled
      And the "access_problems_link" button with "¿Problemas con el acceso?" text is displayed
      And the "register" link with "Regístrate o recupera la contraseña" text is displayed

  @jira.QANOV-5455 @android @automatic @har @jira.cv.11.2 @jira.link.depends_on.QANOV-5450
  @jira.link.relates_to.NOV-111975 @live @mobile @moves @next @smoke
  Scenario: A user can access to the registration screen from the Login screen in Android devices
    internal_checkpoint="NOTE: In ES the registration is a fake registration as this link is taking customers to
    'password recovery'. All customers are registered by default but they might not know it, and that is the reason
    why when accessing instead of just saying 'recover it', as they might not know they already have a psw, they put
    the option to 'register', but as said, this is taking the customer to the OB password recovery flow."
    The cert2 tag must be added when the custom tabs are well defined in cert2 for moves
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
      And clicks on the "register_recover_pass_link" link
     Then the "Moves Recover Password" page is displayed
      And the "document_placeholder" textfield is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-235763 @automatic @har @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450 @jira.link.relates_to.NOV-111975
  @live @mobile @moves @next @smoke
  Scenario: A user can access to the registration screen from the Login screen in iOS devices
    internal_checkpoint="NOTE: In ES the registration is a fake registration as this link is taking customers to
    'password recovery'. All customers are registered by default but they might not know it, and that is the reason
    why when accessing instead of just saying 'recover it', as they might not know they already have a psw, they put
    the option to 'register', but as said, this is taking the customer to the OB password recovery flow."
    The cert2 tag must be added when the custom tabs are well defined in cert2 for moves
     When clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Moves Credentials Login" page is displayed
      And clicks on the "register_recover_pass_link" link
     Then the "Moves Recover Password" page is displayed
      And the "document_placeholder" textfield is displayed

  @jira.QANOV-272670 @android @automatic @ber @cert2 @har @ios @jira.cv.14.3 @live @mobile @moves @next @smoke
  Scenario: A user can see the password input field after inserting a valid NIF/CIF/NIE/Pasaporte
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Moves Password Login" page is displayed
      And the "identity_placeholder" textfield with "NIF/CIF/NIE o Pasaporte" text is displayed
      And the "identity_field" textfield is displayed
      And the "password_placeholder" textfield with "Contraseña" text is displayed
      And the "eye_icon" icon is displayed
      And the "access_button" button with "Acceder" text is displayed
      And the "access_button" app button is disabled
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed
      And the "register_recover_pass_link" link with "Regístrate o recupera la contraseña" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-272671 @android @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: An Admin user can see a webview to register and/or recover his/her password from password screen
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And clicks on the "register" link
     Then the "Password Recovery" browser webview is displayed
      And the "Obtén tu contrseña" header is displayed

  @jira.QANOV-5459 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450 @jira.link.relates_to.NOV-111980 @manual
  @mobile @moves @regression
  Scenario: A user without data connectivity cannot access to the registration screen from the Login screen
    Given user has never accessed to "Password Recovery" internal webview
      And user is in the "Moves Credentials Login" page
      And user turns on the Airplane mode
     When clicks on the "register" link
     Then the "No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-5461 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450 @jira.link.relates_to.NOV-47808 @manual
  @mobile @moves @regression
  Scenario: User can access to the "Problems with access?" screen from the Login screen
    Given user is in the "Moves Credentials Login" page
     When clicks on the "access_problems_link" link
     Then the "Access Problems" internal webview is displayed
      And the "¿Problemas con el acceso?" header is displayed

  @jira.QANOV-272672 @android @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: A user can see the password inserted if the "eye" icon is enabled in the app
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And clicks on the "eye" icon
      And fills the "password_field" inputtext with the "password" text
     Then the "password_field" link with "password" text is displayed

  @jira.QANOV-272673 @android @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: A user cannot see the password inserted if the "eye" icon is disabled in the app
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
     Then the "password_field" link with "********" text is displayed

  @jira.QANOV-5464 @android @automatic @ber @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5456
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-112015 @live @mobile @moves @next @sanity
  Scenario: A telco postpay user can complete the user/password authentication after inserting a valid password
    All Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user has a "telco postpay" account type
     When logs in the application with user and password and accepts permissions
     Then the landing tab page is displayed

  @jira.<jira_id> @<test_priotity> @android @ios @jira.cv.14.3 @mobile @moves
  Scenario Outline: A <account_type> user can complete the user/password authentication after inserting a valid password
    All Telco users will have the Start tab as landing tab instead of the Account tab.
    Given user has a "<account_type>" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Welcome Login" page is displayed
      And the "welcome_image" icon is displayed
      And the "[CONF:landing_tab]" page is displayed

    @automatic @ber @cert2 @live @next
    Examples:
          | account_type  | test_priotity | jira_id      |
          | telco prepay  | sanity        | QANOV-272677 |
          | telco postpay | sanity        | QANOV-437780 |

    @manual
    Examples:
          | account_type   | test_priotity | jira_id      |
          | legado postpay | smoke         | QANOV-272678 |
          | legado prepay  | regression    | QANOV-272679 |
          | telco-in       | regression    | QANOV-272680 |
          | telco-out      | regression    | QANOV-272681 |

  @jira.QANOV-437781 @android @automation.hard @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: A user can see a carousel message after complete the user/password authentication
    All Telco users will have the Start tab as landing tab instead of the Account tab.
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Welcome Login" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed

  @jira.<jira_id> @<test_priotity> @android @ios @jira.cv.14.3 @manual @mobile @moves
  Scenario Outline: A user can see the Login confirmation screen after inserting a valid password
    testing user <user>
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "<account_type>" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Login Confirmation" page is displayed
      And the "movistar_icon" icon is displayed
      And the "confirmation_message" textfield with "Te has identificado correctamente" text is displayed
      And the "confirm_button" button with "Continuar" text is displayed

    Examples:
          | account_type   | user                                  | jira_id     |
          | legado postpay | legado postpay: 14605426N             | QANOV-37537 |
          | legado prepay  | legado prepay: 619270843 or 31653437D | QANOV-37538 |
          | telco          |                                       | QANOV-38914 |

  @jira.<jira_id> @android @har @ios @jira.cv.14.3 @manual @mobile @moves @smoke
  Scenario Outline: A user can complete the user/password authentication after confirm the Login confirmation screen
    Test user <user>
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "<account_type>" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And the "password_save" popup is displayed
      And clicks on the "password_save.cancel" button
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "no_thanks_button" button
     Then the "Welcome Login" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | account_type   | depends_on  | user                                  | jira_id      |
          | legado postpay | QANOV-37537 | legado fusion (priority): 12368348Y   | QANOV-272682 |
          | legado prepay  | QANOV-37538 | legado prepay: 619270843 or 31653437D | QANOV-272683 |
          | telco          |             |                                       | QANOV-272684 |

  @jira.QANOV-272685 @android @ios @jira.cv.14.3 @manual @mobile @moves @regression
  Scenario: User can access to the "Problems with access?" screen from the Password screen
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And clicks on the "access_problems_link" link
     Then the "Access Problems" browser webview is displayed
      And the "¿Problemas con el acceso?" header is displayed

  @jira.QANOV-5483 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5456
  @jira.link.relates_to.NOV-112016 @manual @mobile @moves @regression
  Scenario: A user can access to the "Contact method" screen
    Given user has a "telco" account type
      And user has never logged in the app
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Contact Method" page is displayed
      And the "Tus datos" header is displayed
      And the "description" textfield with "Por favor, comprueba que tus datos están actualizados y selecciona un campo para poder recuperar la contraseña en un futuro." text is displayed
      And the "contact_methods" list is displayed
      And the "continue" button with "Continuar" text is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-5483
  @jira.link.relates_to.NOV-53359 @manual @mobile @moves @regression
  Scenario Outline: A user can modify the contact method
    Given user has a "telco" account type
      And user has never logged in the app
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Contact Method" page is displayed
      And clicks on the "Prefiero usar otro" element in the "contact_methods" list
      And fills the "new_contact_method" inputtext with the "<contact_method_value>" text
      And clicks on the "continue" button
     Then the "Welcome Login" page is displayed
      And the "App Pin Code" page is displayed

    Examples:
          | contact_method_value | jira_id    |
          | email@domain.es      | QANOV-5484 |
          | 678123456            | QANOV-5485 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-5483
  @jira.link.relates_to.NOV-53358 @manual @mobile @moves @regression
  Scenario Outline: A user can select a contact method
    Given user has a "telco" account type
      And user has never logged in the app
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Contact Method" page is displayed
      And clicks on the "<contact_method>" element in the "contact_methods" list
      And clicks on the "continue" button
     Then the "Welcome Login" page is displayed
      And the "App Pin Code" page is displayed

    Examples:
          | contact_method        | jira_id    |
          | [CONTEXT:user.number] | QANOV-5486 |
          | [CONTEXT:user.email]  | QANOV-5487 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  Scenario Outline: Priority & non-priority users will have the new light Movistar look&feel in the <screen> scren
    New mistica brand: https://mistica-h6dfdh86d-tuentisre.vercel.app/?path=/story/welcome--welcome
    The purpouse of this test is just to check that the new light style is applied in the novum-owned flows.
    This test can be closed after the regression of Digital Hub
    Given user has the device set up with light mode
      And user has a "<membership>" membership status
      And user is in the "<screen>" page
     Then the new mistica Movistar brand style is applied

    @har @smoke
    Examples:
          | membership | screen  | jira_id      |
          | priority   | Account | QANOV-295062 |
          | priority   | Start   | QANOV-295064 |

    @regression
    Examples:
          | membership  | screen             | jira_id      |
          | priority    | Consents Gathering | QANOV-295063 |
          | priority    | Invoices           | QANOV-295065 |
          | priority    | Gestiones          | QANOV-295066 |
          | priority    | Profile            | QANOV-295067 |
          | priority    | Explore            | QANOV-295068 |
          | priority    | Splash Screen      | QANOV-295069 |
          | priority    | Login              | QANOV-295070 |
          | priority    | SSO Login          | QANOV-295071 |
          | priority    | In App Message     | QANOV-295072 |
          | no-priority | Account            | QANOV-295073 |
          | no-priority | Consents Gathering | QANOV-295074 |
          | no-priority | Start              | QANOV-295075 |
          | no-priority | Invoices           | QANOV-295076 |
          | no-priority | Gestiones          | QANOV-295077 |
          | no-priority | Profile            | QANOV-295078 |
          | no-priority | Explore            | QANOV-295079 |
          | no-priority | Splash Screen      | QANOV-295080 |
          | no-priority | Login              | QANOV-295081 |
          | no-priority | SSO Login          | QANOV-295082 |
          | no-priority | In App Message     | QANOV-295083 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @regression
  Scenario Outline: Priority & non-priority users will have the new dark Movistar look&feel in the <screen> scren
    New mistica brand: https://mistica-h6dfdh86d-tuentisre.vercel.app/?path=/story/welcome--welcome
    The purpouse of this test is just to check that the new dark style is applied in the novum-owned flows.
    This test can be closed after the regression of Digital Hub
    Given user has the device set up with dark mode
      And user has a "<membership>" membership status
      And user is in the "<screen>" page
     Then the new mistica Movistar brand style is applied

    Examples:
          | membership  | screen             | jira_id      |
          | priority    | Account            | QANOV-295084 |
          | priority    | Consents Gathering | QANOV-295085 |
          | priority    | Start              | QANOV-295086 |
          | priority    | Invoices           | QANOV-295087 |
          | priority    | Gestiones          | QANOV-295088 |
          | priority    | Profile            | QANOV-295089 |
          | priority    | Explore            | QANOV-295090 |
          | priority    | Splash Screen      | QANOV-295091 |
          | priority    | Login              | QANOV-295092 |
          | priority    | In App Message     | QANOV-295093 |
          | no-priority | Account            | QANOV-295094 |
          | no-priority | Consents Gathering | QANOV-295095 |
          | no-priority | Start              | QANOV-295096 |
          | no-priority | Invoices           | QANOV-295097 |
          | no-priority | Gestiones          | QANOV-295098 |
          | no-priority | Profile            | QANOV-295099 |
          | no-priority | Explore            | QANOV-295100 |
          | no-priority | Splash Screen      | QANOV-295101 |
          | no-priority | Login              | QANOV-295102 |
          | no-priority | In App Message     | QANOV-295103 |

  @jira.QANOV-5508 @UniqueLoginClose @android @har @ios @jira.cv.10.2 @jira.link.detects.IOS-7086
  @jira.link.relates_to.NOV-47601 @jira.link.relates_to.QANOV-5505 @manual @mobile @o2uk @smoke
  Scenario: A user can access without the specific Telefonica SIM in the device
    commented_tags="@relates_to.NOV-47602 @relates_to.NOV-47610 @relates_to.NOV-47695 @relates_to.NOV-175429"
    Given user does not have a "o2uk" SIM in the device
     When clicks on the "start_now" button
     Then the "O2uk User Password Login" page is displayed
      And the "Login" header is displayed
      And the "description" textfield with "Please enter your credentials to log in:" text is displayed
      And the "email_field" inputtext with the "Email" placeholder is displayed
      And the "pass_field" inputtext with the "Password" placeholder is displayed
      And the "continue" button with "Continue" text is displayed
      And the "forgotten_log_in_details" link with "Forgotten login details?" text is displayed

  @jira.QANOV-5509 @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-5506 @jira.link.depends_on.QANOV-5507
  @jira.link.depends_on.QANOV-5508 @jira.link.depends_on.QANOV-5734 @jira.link.depends_on.QANOV-5747
  @jira.link.relates_to.NOV-47604 @manual @mobile @o2uk @regression
  Scenario: A user selects "Forgotten login details?" link
    Given user is in the "O2uk User Password Login" page
     When clicks on the "forgotten_log_in_details" link
     Then the "Reset Password" internal webview is displayed
      And the "[LANG:login.recovery_password.header]" header is displayed

  @jira.QANOV-5519 @android @har @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-5520 @jira.link.depends_on.QANOV-5521
  @jira.link.depends_on.QANOV-5522 @jira.link.depends_on.QANOV-5523 @jira.link.depends_on.QANOV-5530
  @jira.link.depends_on.QANOV-5545 @jira.link.relates_to.NOV-200971 @manual @mobile @o2uk @smoke
  Scenario: A user can access explore after Login
     When logs in the application and accepts permissions
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.explore_tab" tab
     Then the "Explore" page is displayed
      And the "Offers" header is displayed

  @jira.<jira_id> @<mode> @<test_priority> @UniqueLoginClose @android @cert0 @cert1 @har @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-91705 @live @mobile @next @o2uk
  Scenario Outline: A <account_type> user with <num_lines> lines can log in the app with a valid account
    other_affected_versions="2021-07, 2022-23"
    Given user has a "<account_type>" account type
      And user has "<num_lines>" mobile lines
     When logs in the application and accepts permissions
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | cv   | account_type  | num_lines | parent_test_plan                                             | test_priority | mode      | jira_id     |
          | 9.11 | PAYM          | 1         | QANOV-24947                                                  | sanity        | automatic | QANOV-5520  |
          | 9.11 | legacy prepay | 1         | QANOV-24947:QANOV-24141                                      | smoke         | manual    | QANOV-5521  |
          | 9.11 | MBB           | 1         | QANOV-24947                                                  | smoke         | manual    | QANOV-5522  |
          | 9.11 | legacy prepay | several   | QANOV-24947:QANOV-24141                                      | smoke         | manual    | QANOV-5530  |
          | 9.11 | MBB           | several   | QANOV-24947                                                  | smoke         | manual    | QANOV-5545  |
          | 12.0 | device        | any       | QANOV-24947:QANOV-35253:QANOV-24141:QANOV-77438:QANOV-178803 | smoke         | manual    | QANOV-37491 |

  @jira.QANOV-5585 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.10.2 @jira.link.relates_to.NOV-47635 @live
  @mobile @netcracker @next @o2uk @regression
  Scenario: A user will be redirected to the landing tab after login
    commented_tags="@relates_to.NOV-47695"
     When logs in the application and accepts permissions
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-5595 @android @har @ios @jira.cv.10.6 @jira.link.relates_to.NOV-80690 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: The user will not see the "Welcome screen" displayed after a login that is not the first
    Given user is "registered" in the application
     When logs in the application and accepts permissions
     Then the "Welcome" page is not displayed

  @jira.<jira_id> @<test_priority> @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-5585 @jira.link.relates_to.NOV-47634
  @manual @mobile @o2uk
  Scenario Outline: A user can configure the permissions after login in iOS devices
    commented_tags="@relates_to.NOV-47610 @relates_to.NOV-175429 @relates_to.NOV-58627 @relates_to.NOV-175428"
    Given user is "<register_status>" in the application
      And user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
     Then the "Grant Notifications Permission" popup is displayed
      And clicks on the "accept" button
      And the "Grant Contact Permission" popup is displayed
      And clicks on the "accept" button
      And the "Grant Location Permission" popup is displayed
      And clicks on the "accept" button

    @har
    Examples:
          | register_status | test_priority | jira_id    |
          | registered      | smoke         | QANOV-5659 |

    Examples:
          | register_status | test_priority | jira_id    |
          | not_registered  | regression    | QANOV-5671 |

  @jira.QANOV-5762 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2 @jira.link.relates_to.NOV-47658
  @manual @mobile @netcracker @o2uk @regression
  Scenario: A user can log in after all but one of his/her subscriptions have been cancelled
    internal_checkpoint="NOTE: The user will have same experience as a single-MSISDN user."
    Given user has "several" mobile lines
      And user has all but one of his/her subscriptions had been cancelled
     When logs in the application and accepts permissions
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-5775 @android @har @ios @jira.cv.10.2 @jira.link.relates_to.NOV-137081 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay multi-msisdn user with companion devices can access to Account when logs into the app for the first time
    internal_checkpoint="We should check this behavior with a user who was receiving a companion device as the first
    line. You can use the verify O2 MW request (/v3/verify) and check if the first msisdn received has 'lead_msisdn'
    (these lines are Companion devices)
    CERT0: arizona2@o2.com / test123 (Added 14/06)"
    Given user has "several" mobile lines
      And user has a "companion" account type
      And user has never logged in the app
      And user is in the "O2uk User Password Login" page
     When logs in the application and accepts permissions
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.account_tab" tab
     Then the primary line selected in "subscription_selector" is not the "companion" account type

  @jira.QANOV-25159 @account_chooser_deprecate @android @automatic @ber @har @ios @jira.cv.12.0
  @jira.link.detects.VIVO-3025 @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @smoke @vivobr
  Scenario: Vivo user can access to the CPF login screen
     When clicks on the "start_now" button
     Then the "Vivobr Credentials Login" page is displayed
      And clicks on the "selector_tab.password_selector" tab
      And the "selector_tab.phone_number_selector" tab with "Número Vivo" text is displayed
      And the "selector_tab.password_selector" tab with "CPF ou E-mail" text is displayed
      And the "selector_tab.password_selector" tab is selected
      And the "insert_credentials_title" textfield is displayed
      And the "identity_placeholder" inputtext with the "Entre com seu CPF ou E-mail" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "not_registered" textfield that contains the "Não tem cadastro?" text is displayed
      And the "register" link with "Cadastre-se agora" text is displayed

  @jira.QANOV-600444 @account_chooser_deprecate @android @ber @har @ios @jira.cv.24.2 @manual @mobile @vivobr
  Scenario: Vivo user can access to the CPF login screen
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And clicks on the "not_number" button
     Then the "Vivobr Credentials CPF Login" page is displayed
      And the "insert_credentials_title" textfield is displayed
      And the "identity_placeholder" inputtext with the "CPF ou e-mail" placeholder is displayed
      And the "not_CPF" textfield that contains the "Quer entrar de outra forma?" text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "register_button" button is displayed

  @jira.QANOV-355877 @android @ber @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile
  @smoke @vivobr
  Scenario: Vivo user can access to the CPF login screen
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
     When clicks on the "start_now" button
     Then the "Vivobr Credentials Login" page is displayed
      And clicks on the "selector_tab.password_selector" tab
      And the "selector_tab.phone_number_selector" tab with "Número Vivo" text is displayed
      And the "selector_tab.password_selector" tab with "CPF ou E-mail" text is displayed
      And the "selector_tab.password_selector" tab is selected
      And the "insert_credentials_title" textfield is displayed
      And the "identity_placeholder" inputtext with the "Entre com seu CPF ou E-mail" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "not_registered" textfield that contains the "Não tem cadastro?" text is displayed
      And the "register" link with "Cadastre-se agora" text is displayed

  @jira.QANOV-600445 @android @ber @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: Vivo user can access to the CPF login screen
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And clicks on the "not_number" button
     Then the "Vivobr Credentials CPF Login" page is displayed
      And the "insert_credentials_title" textfield is displayed
      And the "identity_placeholder" inputtext with the "CPF ou e-mail" placeholder is displayed
      And the "not_CPF" textfield that contains the "Quer entrar de outra forma?" text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "register_button" button is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User who has no products registered under their CPF/email taps on the "Ir para a loja online" button
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "no_products" popup is displayed
      And clicks on the "accept" button
     Then the "Loja online" external webview is displayed
      And clicks on the native "back" button
      And the "Splash Screen" page is displayed

    Examples:
          | email_cpf                    | depends_on  | jira_id     |
          | non_product_registered_CPF   | QANOV-25163 | QANOV-25165 |
          | non_product_registered_email | QANOV-25164 | QANOV-25166 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User who has no products registered under their CPF/email taps on the "Cancelar" button
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "no_products" popup is displayed
      And clicks on the "cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | email_cpf                    | depends_on  | jira_id     |
          | non_product_registered_CPF   | QANOV-25163 | QANOV-25167 |
          | non_product_registered_email | QANOV-25164 | QANOV-25168 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User can register the CPF/Email
    Given user is in the "Vivobr Credentials Login" page
      And user is "not_registered" in the application
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "continue_button" button
      And the "not_registered_user" popup is displayed
      And clicks on the "accept" button
     Then the internal webview is displayed

    Examples:
          | email_cpf            | depends_on  | jira_id     |
          | non_registered_CPF   | QANOV-25169 | QANOV-25171 |
          | non_registered_email | QANOV-25170 | QANOV-25172 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User can go back to the Splash screen from the non-registered CPF/Email popup
    Given user is in the "Vivobr Credentials Login" page
      And user is "not_registered" in the application
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "continue_button" button
      And the "not_registered_user" popup is displayed
      And clicks on the "cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | email_cpf            | depends_on  | jira_id     |
          | non_registered_CPF   | QANOV-25169 | QANOV-25173 |
          | non_registered_email | QANOV-25170 | QANOV-25174 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User with a suspended product can tap on the "Ligue para 1058": the dialer is opened
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "line_not_found" popup is displayed
      And clicks on the "accept" button
     Then the "dialer" app is displayed
      And the "1058" phone number is inserted on the dialer

    Examples:
          | email_cpf                         | depends_on  | jira_id     |
          | suspended_combo_or_landline_CPF   | QANOV-25163 | QANOV-25179 |
          | suspended_phone_number_CPF        | QANOV-25164 | QANOV-25180 |
          | suspended_combo_or_landline_email | QANOV-25169 | QANOV-25181 |
          | suspended_phone_number_email      | QANOV-25170 | QANOV-25182 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User with a suspended product can tap on the "Voltar": the Splash Screen is displayed
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "line_not_found" popup is displayed
      And clicks on the "cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | email_cpf                         | depends_on  | jira_id     |
          | suspended_combo_or_landline_CPF   | QANOV-25163 | QANOV-25183 |
          | suspended_phone_number_CPF        | QANOV-25164 | QANOV-25184 |
          | suspended_combo_or_landline_email | QANOV-25169 | QANOV-25185 |
          | suspended_phone_number_email      | QANOV-25170 | QANOV-25186 |

  @jira.QANOV-25187 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-181726 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @regression
  @vivobr
  Scenario: User who has not accessed the app in 6 months cannot log in
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "not_access_in_6_months_identifier" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "not_access_in_6_months_pwd" text
     Then the "access_disabled" popup is displayed
      And the "message" textfield with "Como faz mais de 6 meses que não acessa o Vivo, por segurança você precisa mudar a sua senha em "Esqueci minha senha"." text is displayed

  @jira.QANOV-25188 @android @har @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @smoke @vivobr
  Scenario: User who introduces a valid CPF or email can access to the screen to introduce the password
    Jeri and control_n monoline users can access only by OTP
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Vivobr Password Login" page is displayed
      And the "insert_password" textfield with "Digite sua senha" text is displayed
      And the "password_field" inputtext with the "Senha" placeholder is displayed
      And the "eye" icon is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "recover_password" link with "Recuperar senha" text is displayed

  @jira.QANOV-600446 @android @har @ios @jira.cv.24.2 @manual @mobile @smoke @vivobr
  Scenario: User who introduces a valid CPF or email can access to the screen to introduce the password
    Given user is in the "Vivobr Credentials Login" page
     When clicks on the "not_number" button
      And fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Vivobr Password Login" page is displayed
      And the "password_field" inputtext with the "Senha" placeholder is displayed
      And the "eye" icon is displayed
      And the "recover_password" link with "Esqueci minha senha" text is displayed
      And the "continue_button" button with "Continuar" text is displayed

  @jira.<jira_id> @<client> @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-200803 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User who is in the screen to insert their password can tap on the back button in an <client> device
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Quit Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.exit_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.exit_popup.message]" text is displayed
      And the "popup.accept" button with "<popup_accept>" text is displayed
      And the "popup.cancel" button with "<popup_cancel>" text is displayed

    Examples:
          | client  | popup_accept                       | popup_cancel                       | jira_id      |
          | android | [LANG:login.exit_popup.accept_adr] | [LANG:login.exit_popup.cancel_adr] | QANOV-25192  |
          | ios     | [LANG:login.exit_popup.accept_ios] | [LANG:login.exit_popup.cancel_ios] | QANOV-292122 |

  @jira.QANOV-25193 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  Scenario: User can go back to the Splash screen from the password introducing screen
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-25194 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app
  @regression @vivobr
  Scenario: User can refuse to cancel the login
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Login Exit" popup is displayed
      And clicks on the "cancel" button
     Then the "Vivobr Password Login" page is displayed

  @jira.QANOV-25195 @account_chooser_deprecate @android @automatic @ber @har @ios @jira.cv.12.0
  @jira.link.detects.VIVO-2293 @jira.link.detects.VIVO-2532 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.parent_test_plan.QANOV-360674 @jira.link.parent_test_plan.QANOV-66163
  @live @mobile @next @sanity @vivobr
  Scenario: Vivo user can login through user/password
    Given user has a "any" plan in "active" status
     When logs in the application with user and password
     Then the landing tab page is displayed

  @jira.QANOV-531858 @android @har @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @sanity
  @vivobr
  Scenario: Vivo user can see loading screen when login through user/password
    Given user has a "any" plan in "active" status
     When logs in the application with user and password
      And terminates the app
      And launches the app
     Then the "Loading Screen" page is displayed
      And the "vivinho_icon" icon is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen_novo_app.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen_novo_app.carousel_message_second]" text is displayed
      And the "check_icon" icon is displayed
      And the "carousel_message" textfield with the "O seu app está pronto, \d+!" format is displayed
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-600447 @android @har @ios @jira.cv.12.0 @manual @mobile @smoke @vivobr
  Scenario: Vivo user can see welcome screen when login through user/password
    Given user has a "any" plan in "active" status
     When logs in the application with user and password
     Then the "Welcome Login" page is displayed
      And the "loading_carousel" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed
      And the landing tab page is displayed

  @jira.QANOV-403107 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @regression
  @smoke @vivobr
  Scenario: Vivo cancelled user can login through user/password
    Given user has all plans in "cancelled" status
      And user has cancelled the plan "less" than "6" months
     When logs in the application with user and password
     Then the landing tab page is displayed

  @jira.QANOV-355890 @android @ber @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile
  @sanity @vivobr
  Scenario: Vivo user can login through user/password
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "any" plan in "active" status
     When logs in the application with user and password
     Then the landing tab page is displayed

  @jira.QANOV-531859 @android @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @sanity
  @vivobr
  Scenario: Vivo user can see loading screen when login through user/password and saving credentials is enabled and no credentials are saved in 4P
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "any" plan in "active" status
     When logs in the application with user and password
      And terminates the app
      And launches the app
     Then the "Loading Screen" page is displayed
      And the "vivinho_icon" icon is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen_novo_app.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen_novo_app.carousel_message_second]" text is displayed
      And the "check_icon" icon is displayed
      And the "carousel_message" textfield with the "O seu app está pronto, \d+!" format is displayed
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-403108 @android @har @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile
  @regression @vivobr
  Scenario: Vivo cancelled user can login through user/password
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has all plans in "cancelled" status
      And user has cancelled the plan "less" than "6" months
     When logs in the application with user and password
     Then the landing tab page is displayed

  @jira.QANOV-56938 @account_chooser_deprecate @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-56585 @manual
  @mobile @regression @vivobr
  Scenario: Vivo user in pending status can login through user/password
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user does not have a "siebel" plan
     When logs in the application with user and password
      And the landing tab page is displayed

  @jira.QANOV-355891 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user in pending status can login through user/password
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user has a "convergente" account type
      And user has a "any" plan in "pending" status
      And user does not have a "siebel" plan
     When logs in the application with user and password
      And the landing tab page is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.7
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr
  Scenario Outline: Siebel user in <user_status> cannot login through user/password
    Given user is in the "Vivobr Credentials Login" page
      And user has "1" plans
      And user has a "siebel" plan in "<user_status>" status
     When logs in the application with user and password
     Then the internal webview is displayed

    Examples:
          | user_status | jira_id     |
          | pending     | QANOV-67130 |
          | suspended   | QANOV-67131 |
          | cancelled   | QANOV-67132 |

  @jira.QANOV-230133 @android @har @jira.cv.14.2 @jira.link.depends_on.QANOV-49056 @manual @mobile @o2de @smoke
  Scenario: A o2de user can see the "Login Credentials" screen on Android devices
    Given user has set the cookies preferences
      And user is in the "O2de Credentials Login" page
     Then the "title" textfield with "Login" text is displayed
      And the "user_psw_description" textfield with "Melden Sie sich mit Ihrer Rufnummer oder Ihrem Nutzernamen an:" text is displayed
      And the "identifier_inputtext" inputtext with the "Rufnummer / Nutzername" placeholder is displayed
      And the "continue_button" button that contains the "Weiter" text is displayed
      And the "forgot_your_password_link" link with "Kennwort vergessen" text is displayed
      And the "otp_description" textfield with "Kennwort nicht zur Hand, aber Smartphone griffbereit?" text is displayed
      And the "login_with_otp_button" button with "Login mit SMS-Code" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-498046 @android @blaude @har @jira.cv.14.10 @jira.link.depends_on.QANOV-49059
  @jira.link.parent_test_plan.QANOV-494500 @manual @mobile @smoke
  Scenario: A blaude user can see the "Login Credentials" screen on Android devices in CIAM login
    Given user has set the cookies preferences
      And user is in the "Blaude Credentials Login" page
     Then the "title" textfield with "Login" text is displayed
      And the "identifier_inputtext" inputtext with the "Rufnummer / E-Mail-Adresse oder Nutzername" placeholder is displayed
      And the "password_inputtext" inputtext with the "Kennwort eingeben" placeholder is displayed
      And the "forgot_your_password_link" link with "Kennwort vergessen?" text is displayed
      And the "continue_button" button that contains the "Einlogen" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-266819 @cert3 @har @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-49056 @manual @mobile @o2de @smoke
  Scenario: A o2de user can see the "Login Credentials" screen on iOS devices
    Given user has set the cookies preferences
      And clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "O2de Credentials Login" page is displayed
     Then the "title" textfield with "Login" text is displayed
      And the "user_psw_description" textfield with "Melden Sie sich mit Ihrer Rufnummer oder Ihrem Nutzernamen an:" text is displayed
      And the "identifier_inputtext" inputtext with the "Rufnummer / Nutzername " placeholder is displayed
      And the "continue_button" button that contains the "Weiter" text is displayed
      And the "forgot_your_password_link" link with "Kennwort vergessen" text is displayed
      And the "otp_description" textfield with "Kennwort nicht zur Hand, aber Smartphone griffbereit?" text is displayed
      And the "login_with_otp_button" button with "Login mit SMS-Code" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-498047 @manual @blaude @har @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-49059
  @jira.link.parent_test_plan.QANOV-494500 @mobile @smoke
  Scenario: A blaude user can see the "Login Credentials" screen on iOS devices in CIAM login
    Given user has set the cookies preferences
      And clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Blaude Credentials Login" page is displayed
     Then the "title" textfield with "Login" text is displayed
      And the "identifier_inputtext" inputtext with the "Rufnummer / E-Mail-Adresse oder Nutzername" placeholder is displayed
      And the "password_inputtext" inputtext with the "Kennwort eingeben" placeholder is displayed
      And the "forgot_your_password_link" link with "Kennwort vergessen?" text is displayed
      And the "continue_button" button that contains the "Einlogen" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-230135 @android @har @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230133 @manual @mobile @o2de @smoke
  Scenario: A user who inserted the proper phone number, email or username can access to the "Login Password" screen
    Given user has set the cookies preferences
      And user is in the "O2de Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "O2de Password Login" page is displayed
      And the "title" textfield with "Login" text is displayed
      And the "credentials_label" textfield with "Rufnummmer / Nutzername / E-Mail-Adresse" text is displayed
      And the "credentials_value" textfield with "[CONTEXT:user.user_login]" text is displayed
      And the "credentials_change_link" link with "ändern" text is displayed
      And the "description" textfield with "Bitte geben Sie Ihr Kennwort ein:" text is displayed
      And the "password_inputtext" inputtext with the "Kennwort" placeholder is displayed
      And the "continue_button" button that contains the "Einloggen" text is displayed
      And the "forgot_your_password_link" link with "Kennwort vergessen" text is displayed
      And the "otp_description" textfield with "Kennwort nicht zur Hand, aber Smartphone griffbereit?" text is displayed
      And the "login_with_otp_button" button with "Login mit SMS-Code" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.<jira_id> @android @har @ios @jira.cv.14.2 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @sanity
  Scenario Outline: A o2de user can log in the app with user/password
    For security reasons, the session has a 6-months duration. After this time, the user will be logged out.
    Given the device has not a "FingerPrint" registered
      And user has a "<account_type>" account type
      And user has a "<product_type>" product
      And user has "<number_products>" products
      And user has set the cookies preferences
      And user is in the "O2de Login Credentials" page
     When fills the "credential_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Login Password" page is displayed
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
     Then the "Welcome Login" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | account_type | product_type  | number_products | detects   | parent_test_plan | jira_id      |
          | prepay       | mobile_line   | 1               | OBO2DE-29 |                  | QANOV-230140 |
          | postpay      | mobile_line   | 1               | OBO2DE-29 |                  | QANOV-230141 |
          | postpay      | my_handy      | 1               |           |                  | QANOV-230142 |
          | postpay      | internet@home | 1               |           | QANOV-437471     | QANOV-230143 |
          | postpay      | any           | several         |           |                  | QANOV-230144 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-494500 @manual @mobile
  @regression @har
  Scenario Outline: A blaude user can log in the app with user/password in CIAM login
    For security reasons, the session has a 6-months duration. After this time, the user will be logged out.
    Given the device has not a "FingerPrint" registered
      And user has a "<account_type>" account type
      And user has a "<product_type>" product
      And user has "<number_products>" products
      And user has set the cookies preferences
      And user is in the "Blaude Login Credentials" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
     Then the "Welcome Login" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | account_type | product_type | number_products | jira_id      |
          | prepay       | mobile_line  | 1               | QANOV-498048 |
          | postpay      | mobile_line  | 1               | QANOV-498049 |
          | postpay      | my_handy     | 1               | QANOV-498050 |
          | postpay      | any          | several         | QANOV-498051 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A user can log in the app with <credential>/password
    Given user has set the cookies preferences
      And user has "<credential>" credential to log in the app
     When logs in the application with <credential> and password and accepts permissions
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv   | credential   | jira_id      |
          | blaude  | 13.9 | phone_number | QANOV-230152 |
          | blaude  | 13.9 | username     | QANOV-230154 |
          | o2de    | 14.2 | phone_number | QANOV-230155 |
          | o2de    | 14.2 | username     | QANOV-230157 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user who accessed to the "<page>" screen can cancel the login flow
    Given user has set the cookies preferences
      And user is in the "<page>" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv   | page                     | depends_on   | jira_id      |
          | blaude  | 13.9 | Blaude Login Credentials | QANOV-49059  | QANOV-230158 |
          | o2de    | 14.2 | O2de Login Credentials   | QANOV-49056  | QANOV-230160 |
          | o2de    | 14.2 | O2de Login Password      | QANOV-230135 | QANOV-230161 |

  @jira.QANOV-230175 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230135 @manual @mobile @o2de @regression
  Scenario: A user in the "O2de Login Password" screen can decide to change the login credentials inserted
    Given user has set the cookies preferences
      And user is in the "O2de Login Password" page
     When clicks on the "credentials_change_link" link
     Then the "O2de Login Credentials" page is displayed
      And the "title" textfield with "Login" text is displayed

  @jira.QANOV-243233 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user is logged out after 6 months (app opened)
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given user has set the cookies preferences
      And user is in the "O2de Login Credentials" page
     When fills the "credential_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Login Password" page is displayed
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "15552000" seconds
     Then the "O2de Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-498052 @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-494500 @manual @mobile
  @regression
  Scenario: A user is logged out after 6 months (app opened) in CIAM login
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given user has set the cookies preferences
      And user is in the "Blaude Login Credentials" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "15552000" seconds
     Then the "Blaude Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-270017 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user is logged out after 6 months (app closed)
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given the device has not a "FingerPrint" registered
      And user has set the cookies preferences
      And user is in the "O2de Login Credentials" page
     When fills the "credential_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Login Password" page is displayed
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And waits "15552000" seconds
      And launches the app
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
      And the "[CONF:landing_tab]" page is displayed
     Then the "O2de Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-498053 @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-494500 @manual @mobile
  @regression
  Scenario: A user is logged out after 6 months (app closed) in CIAM login
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given the device has not a "FingerPrint" registered
      And user has set the cookies preferences
      And user is in the "Blaude Login Credentials" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And waits "15552000" seconds
      And launches the app
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
      And the "[CONF:landing_tab]" page is displayed
     Then the "Blaude Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-270019 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user is logged out after 6 months (app in background)
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given the device has not a "FingerPrint" registered
      And user has set the cookies preferences
      And user is in the "O2de Login Credentials" page
     When fills the "credential_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Login Password" page is displayed
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And runs the app in the background for "15552000" seconds
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
      And the "Support" page is displayed
     Then the "O2de Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-498054 @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-494500 @manual @mobile
  @regression
  Scenario: A user is logged out after 6 months (app in background) in CIAM login
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given the device has not a "FingerPrint" registered
      And user has set the cookies preferences
      And user is in the "Blaude Login Credentials" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And runs the app in the background for "15552000" seconds
      And the "App Pin Code" page is displayed
      And fills the "app_pin_code_field" inputtext with the "[CONTEXT:user.app_pin_code]" text
      And the "Support" page is displayed
     Then the "Blaude Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-453602 @android @ber @har @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User can access to the "Soy titular" tab from the "Soy usuario de línea" tab
    Given user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And clicks on the "selector_tab.password_selector" tab
     Then the "title" textfield with "Escribe tus datos de acceso" text is displayed
      And the "identity_placeholder" textfield with "NIF, NIE, CIF o Pasaporte" text is displayed
      And the "password_placeholder" textfield with "Contraseña" text is displayed
      And the "eye" icon is displayed
      And the "forgot_password_link" link with "He olvidado mi contraseña" text is displayed
      And the "continue_button" button with "Acceder" text is displayed
      And the "resgister_link" link with "¿Es tu primera vez en Mi O2? Regístrate" text is displayed
      And the "access_doubts_link" link with "¿Tienes dudas con el acceso? Más información" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-453603 @android @har @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: A user can access to the registration OB screen from the Login screen
     When clicks on the "start_now" button
      And the "O2es Credentials Login" page is displayed
      And clicks on the "register_link" link
     Then the "TBD" internal webview is displayed

  @jira.QANOV-453604 @android @har @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: A user can access to the recover password OB screen from the Login screen
     When clicks on the "start_now" button
      And the "O2es Credentials Login" page is displayed
      And clicks on the "recover_password_link" link
     Then the "TBD" internal webview is displayed

  @jira.QANOV-453605 @android @ios @jira.cv.Future @manual @mobile @o2es @regression @tbd
  Scenario: A user can access to the more info OB screen from the Login screen
     When clicks on the "start_now" button
      And the "O2es Credentials Login" page is displayed
      And clicks on the "access_doubts_link" link
     Then the internal webview is displayed
      And the "Ayuda" string is displayed

  @jira.QANOV-453606 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user can see the password inserted if the "eye" icon is enabled in the app
    Given user is in the "O2es Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "eye" icon
     Then the "password_field" link with "password" text is displayed

  @jira.QANOV-453607 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user cannot see the password inserted if the "eye" icon is disabled in the app
    Given user is in the "O2es Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_field" inputtext with the "password" text
     Then the "password_field" link with "********" text is displayed

  @jira.QANOV-453608 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user can see the Login confirmation screen after inserting a valid password
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "O2es Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Login Confirmation" page is displayed
      And the "o2es_icon" icon is displayed
      And the "confirmation_message" textfield with "Te has identificado correctamente" text is displayed
      And the "confirm_button" button with "Continuar" text is displayed

  @jira.QANOV-453609 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user can see a welcome screen after complete the user/password authentication
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "O2es Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Welcome Login" page is displayed

  @jira.QANOV-453610 @android @ber @har @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A user can complete the user/password authentication after inserting a valid password
    Given cookies are enabled in the browser
      And saving credentials is enabled in 4P
      And no credentials are saved in 4P
      And user is in the "O2es Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Welcome Login" page is displayed
      And waits "5" seconds
      And the "[CONF:landing_tab]" page is displayed

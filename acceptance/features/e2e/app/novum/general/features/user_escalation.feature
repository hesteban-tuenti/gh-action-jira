# -*- coding: utf-8 -*-
@jira.QANOV-416962
Feature: User escalation


  @jira.QANOV-8176 @android @automatic @ios @jira.cv.10.5 @jira.link.relates_to.NOV-64295 @mobile @moves @qa @sanity
  Scenario: A moves ADMIN LIGHT user access to the "Moves Login For Escalation" screen from "Login escalation required" screen
    internal_checkpoint="With the custom tabs the Login view is opened in browser mode, so the 'identificate' header
    wont be shown on the header"
    commented_tags="@depends_on.NOV-81000"
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user is in the "Personal Data" page
     When clicks on the "shop_identifier_entrypoint" entrypoint
      And the "Login Escalation Required" page is displayed
      And clicks on the "access_with_password" button
     Then the "Moves Login For Escalation" page is displayed
      And the "selector_tab.phone_number_selector" tab is not displayed
      And the "insert_data" textfield with "Escribe tus datos para acceder" text is displayed
      And the "identity_placeholder" inputtext with the "NIF/CIE/NIE/Pasaporte" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "register_recover_pass_link" link with "He olvidado mi contraseña" text is displayed

  @jira.QANOV-417018 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An o2es ADMIN LIGHT user see the "Login escalation required" screen
    Given user has a "admin-light" role
      And user in in the "Login Escalation Required" page
     Then the "Accede como titular" header is displayed
      And the "escalation_icon" icon is displayed
      And the "escalation_title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "escalation_subtitle" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-417019 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An o2es ADMIN LIGHT user access to the "O2es Login For Escalation" screen from "Login escalation required" screen
    Given user has a "admin-light" role
      And user in in the "Login Escalation Required" page
      And clicks on the "access_with_password" button
     Then the "O2es Login For Escalation" page is displayed
      And the "selector_tab.phone_number_selector" tab is not displayed
      And the "insert_data" textfield with "Introduce tus datos de acceso" text is displayed
      And the "identity_placeholder" inputtext with the "NIF/CIE/NIE/Pasaporte" placeholder is displayed
      And the "password_placeholder" inputtext with the "Contraseña" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "register_recover_pass_link" link with "He olvidado mi contraseña" text is displayed

  @jira.QANOV-491875 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es ADMIN LIGHT can insert a valid identity to perform the user escalation
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user is in the "O2es Login For Escalation" page
     When fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
     Then the "O2esAccount" page is displayed

  @jira.QANOV-8178 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8176 @manual @mobile @moves @smoke
  Scenario: An ADMIN LIGHT can insert a valid identity to perform the user escalation
    internal_checkpoint="With the custom tabs the Login view is opened in browser mode, so the 'identificate' header
    wont be shown on the header"
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user is in the "Moves Login For Escalation" page
     When fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
     Then the "Moves Password Login" page is displayed
      And the "password_field" inputtext with the "Contraseña" placeholder is displayed
      And the "continue_button" button with "Acceder" text is displayed

  @jira.QANOV-8180 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8178 @jira.link.relates_to.NOV-64296 @manual
  @mobile @moves @regression
  Scenario: A Telco ADMIN LIGHT cannot perform a login escalation with a password too short: an error message is displayed
    Given user has a "admin-light" role
      And user has a "telco" account type
      And user has the matching subscription selected in the account
      And user is in the "Moves Password Login" page
     When fills the "password_field" inputtext with the "a" text
      And clicks on the "continue_button" button
     Then the "error_message" textfield with "Contraseña incorrecta" text is displayed

  @jira.QANOV-8181 @android @impeded_legacy @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8178 @mobile @moves
  @no_automatable @regression
  Scenario: A legados ADMIN LIGHT cannot perform a login escalation with an invalid password: an error message is displayed
    Given user has a "admin-light" role
      And user has a "legado" account type
      And user has the matching subscription selected in the account
      And user is in the "Moves Password Login" page
     When fills the "password_field" inputtext with the "aninvalidpassword" text
      And clicks on the "continue_button" button
     Then the "error_message" textfield with "La contraseña no es correcta" text is displayed

  @jira.QANOV-8182 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8178 @manual @mobile @moves @regression
  Scenario: A Telco ADMIN LIGHT cannot perform a login escalation with invalid password: an error popup is displayed
    Given user has a "admin-light" role
      And user has a "telco" account type
      And user has the matching subscription selected in the account
      And user is in the "Moves Password Login" page
     When fills the "password_field" inputtext with the "12345678" text
      And clicks on the "continue_button" button
     Then the "invalid_credentials" popup is displayed
      And the popup with "Los datos introducidos no son correctos" title and "Inténtalo de nuevo o pulsa recuperar contraseña." message is displayed

  @jira.QANOV-8183 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8182 @manual @mobile @moves @regression
  Scenario: A telco ADMIN LIGHT closes the invalid credentials popup
    Given user has a "admin-light" role
      And user has a "telco" account type
      And user has the matching subscription selected in the account
      And user is in the "invalid_credentials" popup
     When clicks on the "close" icon
     Then the "Moves Password Login" page is displayed
      And the "password_field" inputtext is not empty

  @jira.QANOV-8184 @android @impeded_mock @jira.cv.10.5 @jira.link.depends_on.QANOV-8178
  @jira.link.parent_test_plan.QANOV-21058 @jira.link.relates_to.NOV-64298 @manual @mobile @moves @regression
  Scenario: An ADMIN LIGHT user performs login escalation with his/her ADMIN credentials and it is the first time that he/she uses that credentials in the app
    internal_checkpoint="The admin credentials used must be the ones related to the admin-light line.
    These are all the flows available for escalation:
    - Consumption screen for mobile line different than the logged one
    - Extra charges screen for mobile line different than the logged one
    - Pay per use detail screen for mobile line different than the logged one
    - Extra charges details for any product included in fusion plan different than the mobile line logged in
    - Bill details
    - Landline extra charges
    - Landline consumption
    - TV extra charges
    - TV Disney+ activation
    - Shop identification in Profile
    - Secure connection activation/deactivation
    - Contact Method
    - Device Renting"
    Given user has a "admin-light" role
      And has never logged in with the admin credentials before
      And user has the matching subscription selected in the account
      And user reaches the "Moves Password Login" page after clicking on "shop_identification_link" in "Profile" page
     When fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "Shop Identification" page is displayed
      And the notification badge is not displayed in the "navigation_tab_bar.aura_tab" icon

  @jira.QANOV-8246 @android @automatic @ber @cert2 @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8178
  @jira.link.detects.APPS-7469 @jira.link.detects.MOVES-2780 @jira.link.detects.MOVES-3495 @jira.link.detects.MOVES-4038
  @jira.link.detects.MOVES-5064 @jira.link.relates_to.NOV-64299 @live @mobile @moves @next @smoke @har
  Scenario: An ADMIN LIGHT user performs login escalation with ADMIN credentials already used
    internal_checkpoint="The admin credentials used must be the ones related to the admin-light line.
    These are all the flows available for escalation:
    - Consumption screen for mobile line different than the logged one
    - Extra charges screen for mobile line different than the logged one
    - Pay per use detail screen for mobile line different than the logged one
    - Extra charges details for any product included in fusion plan different than the mobile line logged in
    - Bill details
    - Landline extra charges
    - Landline consumption
    - TV extra charges
    - TV Disney+ activation
    - Shop identification in Profile
    - Secure connection activation/deactivation
    - Contact Method
    - Device Renting"
    Given user has a "admin-light" role
      And user has registered with "PASAPORTE"
      And user is in the "Personal Data" page
      And clicks on the "shop_identifier_entrypoint" entrypoint
      And the "Login Escalation Required" page is displayed
     When logs in the application with admin credentials
     Then the "Shop Identifier Not Allowed" page is displayed
      And the "Identificación en tienda" header is displayed
      And logs out from the application
      And logs in the application

  @jira.QANOV-8326 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8246 @jira.link.relates_to.NOV-82294 @manual
  @mobile @moves @regression
  Scenario: An ADMIN user taps on the "back" icon after performing the login escalation: the user will be redirected to the main account screen
    internal_checkpoint="These are all the possible flows where back button takes user to Account screen:
    - Consumption screen for mobile line different than the logged one
    - Extra charges screen for mobile line different than the logged one
    - Pay per use detail screen for mobile line different than the logged one
    - Extra charges details for any product included in fusion plan different than the mobile line logged in
    - Bill details
    - Landline extra charges
    - Landline consumption
    - TV extra charges
    - TV Disney+ activation
    - Secure connection activation/deactivation
    - Contact Method
    - Device Renting"
    Given user has a "admin" role
      And user has the matching subscription selected in the account
      And user is in the "Mobile Consumption" page after having performed the user escalation
     When clicks on the "notification_top_bar.back" button
     Then the "Dashboard" page is displayed

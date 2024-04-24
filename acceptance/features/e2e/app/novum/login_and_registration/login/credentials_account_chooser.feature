# -*- coding: utf-8 -*-
@jira.QANOV-272824
Feature: Credentials Account Chooser


  @jira.QANOV-272825 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @sanity
  @har
  Scenario: User without credentials saved in 4p neither in the browser will see the 4P Save Credentials page after submitting login credentials
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
     When user is in the "Moves Credentials Login" browser webview
      And fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And the "password_save" popup is displayed
      And clicks on the "confirm_button" button
     Then the "4P Save Credentials" browser webview is displayed
      And the "title" textfield with "¿Quieres guardar estos datos de acceso para entrar en otras apps de Movistar?" text is displayed
      And the "subtitle" textfield with "Te lo recordaremos cuando inicies sesión en nuestras apps y no tendrás que volver a introducir tus claves." text is displayed
      And the "ok_button" button with "Si, guardar datos" text is displayed
      And the "no_thanks_button" button with "No, gracias" text is displayed

  @jira.QANOV-272826 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User with credentials saved in the browser but not in 4p will see the 4P Save Credentials page after submitting login credentials
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "continue_button" button
      And the "Moves Password Login" browser webview is displayed
      And clicks on the "pass_field" inputtext
      And the "Account Chooser" browser webview is displayed
      And clicks on the "[CONTEXT:credential_stored]" element in the "user_stored_passwords" list
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
     Then the "4P Save Credentials" browser webview is displayed
      And the "title" textfield with "¿Quieres guardar estos datos de acceso para entrar en otras apps de Movistar?" text is displayed
      And the "subtitle" textfield with "Te lo recordaremos cuando inicies sesión en nuestras apps y no tendrás que volver a introducir tus claves." text is displayed
      And the "ok_button" button with "Si, guardar datos" text is displayed
      And the "no_thanks_button" button with "No, gracias" text is displayed

  @jira.QANOV-272827 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User can accept saving the credentials in the 4P Save Credentials page
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
     When user is in the "Moves Credentials Login" browser webview
      And fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "ok_button" button
     Then the "Welcome Login" page is displayed
      And the credential is saved in 4P

  @jira.QANOV-272829 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can choose not saving the credentials in the 4P Save Credentials page
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
     When user is in the "Moves Credentials Login" browser webview
      And fills and submits the login credentials
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "no_thanks_button" button
     Then the "Welcome Login" page is displayed
      And the credential is not saved in 4P

  @jira.QANOV-272831 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @sanity
  @har
  Scenario: User with the credentials saved in 4p will see the Account Chooser when starting the login with a saved credentials: just the actual credential will be shown
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
     Then the "Account Chooser" browser webview is displayed
      And the "title" textfield with "Hola de nuevo" text is displayed
      And the "subtitle" textfield with "Accede con tu usuario a Movistar" text is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list has "1" entries
      And just the "actual" accounts are shown in the "user_4P_stored_credentials" list
      And the "user_4P_stored_credentials" list contains the saved credentials
      And the "manage_users" link with "Gestionar usuarios" text is displayed
      And the "sign_in_with_another_credential" link with "¿No eres tú? Entra con otro usuario" text is displayed

  @jira.QANOV-321451 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User with a DNI/NIF/PASSPORT based credential saved in 4p will see it obfuscated in the Account chooser
    Credentials will expire in 4P after 6 months
    Given user has "1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And the credential saved is based on "DNI/NIF/PASSPORT"
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
     Then the "Account Chooser" browser webview is displayed
      And the credential is obfuscated showing just the "4" last characters

  @jira.QANOV-272833 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User with a msisdn based credential saved in 4p will see it obfuscated in the Account chooser
    Credentials will expire in 4P after 6 months
    Given user has "1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And the credential saved is based on "msisdn"
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
     Then the "Account Chooser" browser webview is displayed
      And the credential is obfuscated hidding "4" characters after the prefix with "\+\d{2}" format

  @jira.QANOV-272834 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can close the Account Chooser page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-272836 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User can select the saved credential and finish the log in process
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "any" element in the "user_4P_stored_credentials" list
     Then the "Welcome Login" page is displayed

  @jira.QANOV-272837 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile
  @regression
  Scenario: User can add a new saved credential in 4P from the Account Chooser
    Credentials will expire in 4P after 6 months
    Does not apply to moves
    Given user has "1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials not stored in 4P
      And the "Account Chooser" browser webview is displayed
      And clicks on the "sign_in_with_another_credential" link
      And the "Moves Credentials Login" page is displayed
      And fills and submits the login credentials not stored in 4P
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "ok_button" button
     Then the new credential is saved in 4P

  @jira.QANOV-272838 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile
  @regression
  Scenario: User who is in the Account Chooser can start logging in with another not saved credential
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "sign_in_with_another_credential" link
     Then the "Moves Credentials Login" page is displayed

  @jira.QANOV-272839 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User will see a popup error when selecting the saved credential, if there is an error in 4P when processing the request
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "[CONTEXT:4P_credential_stored]" element in the "user_4P_stored_credentials" list
      And there is an error in 4P
     Then the "4P Login Error" popup is displayed

  @jira.QANOV-272840 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User can manage the saved credentials from the Manage credentials page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
     Then the "Manage Credentials" browser webview is displayed
      And the "title" textfield with "Hola de nuevo" text is displayed
      And the "subtitle" textfield with "Estos son los usuarios disponibles con los que puedes acceder a la apps de Movistar" text is displayed
      And the "4p_stored_credentials_list" is displayed
      And each element in the "4p_stored_credentials_list" list has the "credential_id" field
      And each element in the "4p_stored_credentials_list" list has the "delete_credential_button" field

  @jira.QANOV-272841 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can close the Manage credentials page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-272842 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User will see a confirmation popup after selecting to delete a credential in the Manage credentials page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "any" element in the "4p_stored_credentials_list" list
     Then the "Delete Credential Popup" popup is displayed
      And the "title" textfield with "¿Seguro que quieres eliminar este usuario?" text is displayed
      And the "description" textfield that contains the "¿Tendrás que volver a iniciar sesión con" text is displayed
      And the "delete" button with "Eliminar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-272844 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can cancel the deletion of a credentials from the Manage credentials page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "any" element in the "4p_stored_credentials_list" list
      And the "Delete Credential Popup" popup is displayed
      And clicks on the "cancel" button
     Then the selected credential is shown in the list
      And the credential is still saved in 4p

  @jira.QANOV-272843 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves @smoke
  @har
  Scenario: User can confirm the deletion of a credentials from the Manage credentials page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "any" element in the "4p_stored_credentials_list" list
      And the "Delete Credential Popup" popup is displayed
      And clicks on the "delete" button
     Then the selected credential is not shown in the list
      And the credential is not longer saved in 4p

  @jira.QANOV-272845 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User who deletes all the credentials will see the Manage Credentials empty case page
    Credentials will expire in 4P after 6 months
    Given user has "1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "any" element in the "4p_stored_credentials_list" list
      And the "Delete Credential Popup" popup is displayed
      And clicks on the "delete" button
     Then the "4p_stored_credentials_list" list is not displayed
      And the "empty_case_icon" icon is displayed
      And the "empty_case_title" textfield with "Has eliminado todos los usuarios guardados" text is displayed
      And the "empty_case_text" textfield with "Vuelve a iniciar sesión para acceder a Movistar" text is displayed
      And the "log_in_button" button with "Iniciar sesión" text is displayed

  @jira.QANOV-272846 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User who deleted all the credentials can log in again
    Credentials will expire in 4P after 6 months
    Given user has "1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "manage_users" button
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "any" element in the "4p_stored_credentials_list" list
      And the "Delete Credential Popup" popup is displayed
      And clicks on the "delete" button
      And the "4p_stored_credentials_list" list is not displayed
      And clicks on the "log_in_button" button
     Then the "Moves Credentials Login" browser webview is displayed

  @jira.QANOV-272847 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User will see a retriable error popup when there is an error in the deletion of a credential from the Manage credentials page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "continue_button" button
      And the "Moves Password Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Manage Credentials" browser webview is displayed
      And clicks on the "any" element in the "4p_stored_credentials_list" list
      And the "Delete Credential Popup" popup is displayed
      And clicks on the "delete" button
      And there is an error in 4P
     Then the "4P Delete Credential Error" popup is displayed
      And the "title" textfield with "Algo ha ido mal" text is displayed
      And the "text" textfield that contains the "no se ha eliminado" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed
      And clicks on the "retry" button
      And the "Manage Credentials" browser webview is displayed

  @jira.QANOV-310288 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can see expired credentials in the Account Chooser page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
     Then the "4p_stored_credentials_list" list is displayed
      And the "expired" element in the "4p_stored_credentials_list" list has the "credential_id" field
      And the "expired" element in the "4p_stored_credentials_list" list has the "chevron" field
      And the "expired" element in the "4p_stored_credentials_list" list has the "description" textfiled with "Por seguridad, vuelve a introducir la contraseña para iniciar sesión" text

  @jira.QANOV-310289 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can refresh the expired credentials in the Account Chooser page
    Credentials will expire in 4P after 6 months
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login credentials
      And the "Account Chooser" browser webview is displayed
      And clicks on the "expired" element in the "user_4P_stored_credentials" list
     Then the "Moves Credentials Login" page is displayed
      And the "identifier_inputtext" is prefilled with the expired credential
      And fills and submits the expired login credentials
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "ok_button" button
      And the "Welcome Login" page is displayed
      And the credential is not longer expired in 4P

  @jira.QANOV-360508 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User who logs out the app will remove the current saved credentials
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Profile" page
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed
     Then the credential is not longer saved in 4P

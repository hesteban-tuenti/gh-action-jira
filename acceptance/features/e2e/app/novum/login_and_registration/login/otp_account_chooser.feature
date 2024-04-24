# -*- coding: utf-8 -*-
@jira.QANOV-310290
Feature: Otp account chooser


  @jira.QANOV-310291 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @sanity @har
  Scenario: User without msisdn saved will see the 4P Save Credentials page after submitting login credentials with OTP
    Given user does not have msisdn stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login msisdn
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
     Then the "4P Save Credentials" browser webview is displayed
      And the "title" textfield with "¿Quieres guardar estos datos de acceso para entrar en otras apps de Movistar?" text is displayed
      And the "subtitle" textfield with "Te los recordaremos cuando inicies sesión en nuestras apps y no tendrás que volver a introducir tus claves." text is displayed
      And the "ok_button" button with "Si, guardar datos" text is displayed
      And the "no_thanks_button" button with "No, gracias" text is displayed

  @jira.QANOV-310292 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @smoke @har
  Scenario: User can accept saving the msisdn in the 4P Save Credentials page
    Given user does not have msisdn stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login msisdn
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "ok_button" button
     Then the "Welcome Login" page is displayed
      And the msisdn is saved in 4p

  @jira.QANOV-310293 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can choose not saving the msisdn credentials in the 4P Save Credentials page
    Given user does not have msisdn stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login msisdn
      And the "Login Confirmation" browser webview is displayed
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "no_thanks_button" button
     Then the "Welcome Login" page is displayed
      And the msisdn is not saved in 4p

  @jira.QANOV-310294 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @sanity
  Scenario: User with the msisdn credentials saved in 4p will see the Account Chooser when starting the login with a saved msisdn
    Given user has ">=1" msisdn saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login msisdn
     Then the "Account Chooser" browser webview is displayed
      And the "title" textfield with "Hola de nuevo" text is displayed
      And the "subtitle" textfield with "Accede con tu usuario a Mi Movistar" text is displayed
      And the "user_4P_stored_msisdns" list is displayed
      And the "user_4P_stored_msisdns" list contains the saved msisdn
      And the "manage_users" link with "Gestionar usuarios" text is displayed

  @jira.QANOV-310295 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @smoke @har
  Scenario: User can select the saved msisdn and finish the log in process
    Given user has "1" msisdn saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login msisdn
      And the "Account Chooser" browser webview is displayed
      And clicks on the "0" element in the "user_4P_stored_msisdn" list
     Then the "Welcome Login" page is displayed

  @jira.QANOV-310296 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @sanity
  Scenario: User with the msisdn credentials saved in 4p will not see the Account Chooser when starting the login with a non saved msisdn
    Given user has ">=1" msisdn saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits a different login msisdn thant the saved one
     Then the "Account Chooser" browser webview is not displayed

  @jira.QANOV-310297 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User with >1 msisdn credentials saved in 4p will only see the msisdn submited in the Login page for Account Chooser when starting the login with a saved msisdn
    Given user has ">1" msisdn saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And accepts "Domain Permission Popup" popup if displayed
      And the "Moves Credentials Login" browser webview is displayed
      And fills and submits the login msisdn
     Then the "Account Chooser" browser webview is displayed
      And the "user_4P_stored_msisdns" list is displayed
      And the "user_4P_stored_msisdns" list has "1" elements
      And the "user_4P_stored_msisdns" list contains the saved msisdn

  @jira.QANOV-310298 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can access the escalation flow
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user is in the "Login Escalation Required" page
     When clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills and submits the login credentials
     Then the "4P Save Credentials" browser webview is displayed

  @jira.QANOV-310299 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @smoke
  Scenario: User can complete the escalation flow and save the admin credentials
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user is in the "Moves Login For Escalation" page
     When fills and submits the login credentials
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "ok_button" button
     Then the page where user initiated the escalation flow is displayed

  @jira.QANOV-310300 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User can complete the escalation flow without saving the admin credentials
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user is in the "Moves Login For Escalation" page
     When fills and submits the login credentials
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "no_thanks_button" button
     Then the page where user initiated the escalation flow is displayed

  @jira.QANOV-310301 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @regression
  Scenario: User with password credentials saved in 4p can access the escalation flow
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Login Escalation Required" page
     When clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills and submits the saved login credentials
     Then the "4P Save Credentials" browser webview is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials
      And the "sign_in_with_another_credential" link is not displayed

  @jira.QANOV-310302 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-310051 @manual @mobile @moves
  @smoke
  Scenario: User with password credentials saved in 4p can complete the escalation flow with the stored credentials
    Given user has ">=1" credentials saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Login Escalation Required" page
     When clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills and submits the saved login credentials
     Then the "4P Save Credentials" browser webview is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials
      And the "sign_in_with_another_credential" link is not displayed

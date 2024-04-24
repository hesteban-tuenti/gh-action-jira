# -*- coding: utf-8 -*-
@jira.QANOV-7114
Feature: Password recovery method

  Actions Before the Feature:
    Given user has a "admin" role


  @jira.QANOV-7433 @android @automatic @ber @cert2 @deprecate_profile_moves @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.relates_to.NOV-81199 @live @mobile @moves @next @regression @sanity
  Scenario: ADMIN user can access to the "Contact method" screen
    internal_checkpoint="the contact method stored will be selected with the radio icon"
    commented_tags="@depends_on.NOV-47205"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Profile" page
     When clicks on the "contact_method_entrypoint" entrypoint
     Then the "Contact Method" page is displayed
      And the "Recuperación de contraseña" header is displayed
      And the "description" textfield is displayed
      And the "primary_contact_radio" icon is displayed
      And the "other_contact_radio" icon is displayed
      And the "save" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.<jira_id> @android @cert2 @deprecate_profile_moves @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.depends_on.QANOV-7433 @jira.link.detects.<detects> @jira.link.parent_test_plan.QANOV-525498
  @jira.link.relates_to.NOV-81206 @live @manual @mobile @moves @next @smoke
  Scenario Outline: A user can change his/her contact method
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Contact Method" page
     When clicks on the "other_contact_radio" button
      And fills the "input_text" inputtext with the "<contact_method>" text
      And clicks on the "save" button
     Then the "warning.text" textfield with "[LANG:profile.security_and_privacy.contact_method.confirmation_message]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | contact_method | detects    | jira_id    |
          | test@gmail.com | MOVES-6894 | QANOV-7435 |
          | 666554433      |            | QANOV-7436 |

  @jira.<jira_id> @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.depends_on.QANOV-7433 @jira.link.parent_test_plan.QANOV-525498 @jira.link.relates_to.NOV-81209 @live @mobile
  @moves @next @regression
  Scenario Outline: A user can not change his/her Contact method with wrong format in the new method
    incorrect input text warning will be shown in red
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Contact Method" page
     When clicks on the "other_contact_radio" icon
      And fills the "input_text" inputtext with the "<method>" text
      And clicks on the "save" button
     Then the "incorrect_input_text_warning" textfield with "[LANG:profile.security_and_privacy.contact_method.incorrect_input_text_warning]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | method         | jira_id    |
          | 66684848484484 | QANOV-7441 |
          | 98245549499494 | QANOV-7442 |
          | ab@ab          | QANOV-7444 |

  @jira.QANOV-7445 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.depends_on.QANOV-7433 @jira.link.parent_test_plan.QANOV-525498 @jira.link.relates_to.NOV-81205 @live @mobile
  @moves @next @regression
  Scenario: A user cannot change the contact method without selecting other method
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Contact Method" page
     When clicks on the "save" button
      And waits until the "warning.text" element is visible
     Then the "warning.text" textfield with "Este medio de contacto ya está en uso. Por favor, utiliza otro diferente. MEDIO_DUPLICADO" text is displayed

  @jira.QANOV-7448 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.relates_to.NOV-81200 @live @mobile @moves @next @regression
  Scenario: ADMIN LIGHT cannot access to the "Contact method" screen: "Upgrade to ADMIN" option will be shown
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user is in the "Security And Privacy" page
     When clicks on the "contact_method_entrypoint" entrypoint
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "login.title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "login.description" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "login.button" button with "Inicia sesión con contraseña" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-596631 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: User can access to the "Recovery method" screen
    Given user is in the "Profile" page
     When clicks on the "password_recovery_entrypoint" entrypoint
     Then the "Recovery Method" page is displayed
      And the "Medio de recuperación de contraseña" header is displayed
      And the "description" textfield with "Indica un móvil o un email para poder recuperar tu contraseña en un futuro en caso de que la olvides. Puedes confirmar este o indicar uno nuevo." text is displayed
      And the "phone_number_title" textfield with "Número de teléfono" text is displayed
      And the "phone_number_radiobutton" icon is displayed
      And the "phone_number_inputtext" inputtext is displayed
      And the "email_title" textfield with "Email" text is displayed
      And the "email_radiobutton" icon is displayed
      And the "email_inputtext" inputtext is displayed
      And the "save" button with "Guardar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-596632 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User with phone number stored as recovery method can see it in "Recovery method" screen
    Given user is in the "Profile" page
      And user has "phone_number" as recovery method
     When clicks on the "password_recovery_entrypoint" entrypoint
     Then the "Recovery Method" page is displayed
      And the "phone_number_radiobutton" element is selected
      And the "phone_number_inputtext" textfield with "[CONTEXT:recovery_phone_number]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-596633 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User with email stored as recovery method can see it in "Recovery method" screen
    Given user is in the "Profile" page
      And user has "email" as recovery method
     When clicks on the "password_recovery_entrypoint" entrypoint
     Then the "Recovery Method" page is displayed
      And the "email_radiobutton" element is selected
      And the "email_box" textfield with "[CONTEXT:recovery_email]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-596634 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User without recovery method can not save changes without adding a recovery method
    Given user is in the "Recovery Method" page
      And user has no recovery method
     When clicks on the "save" button
     Then the "inline_error" textfield with "Este campo es obligatorio" text is displayed

  @jira.QANOV-596635 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: User with phone number stored as recovery method can modify it
    Given user is in the "Recovery Method" page
      And user has "phone_number" as recovery method
     When fills the "phone_number_inputtext" inputtext with the "666554433" text
      And clicks on the "save" button
     Then the "alert" textfield with "Se ha guardado tu método de contacto" text is displayed

  @jira.QANOV-596636 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: User with email stored as recovery method can modify it
    Given user is in the "Recovery Method" page
      And user has "email" as recovery method
     When fills the "email_inputtext" inputtext with the "qacdonovum1@telefonica.com" text
      And clicks on the "save" button
     Then the "alert" textfield with "Se ha guardado tu método de contacto" text is displayed

  @jira.QANOV-596637 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User with phone number stored as recovery method can modify it: An error occurs
    Given user is in the "Recovery Method" page
      And user has "phone_number" as recovery method
     When fills the "phone_number_inputtext" inputtext with the "666554433" text
      And clicks on the "save" button
      And an error occurs
     Then the "alert" textfield with "Ha ocurrido un error" text is displayed

  @jira.QANOV-596638 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User with email stored as recovery method can modify it: An error occurs
    Given user is in the "Recovery Method" page
      And user has "email" as recovery method
     When fills the "email_inputtext" inputtext with the "qacdonovum1@telefonica.com" text
      And clicks on the "save" button
      And an error occurs
     Then the "alert" textfield with "Ha ocurrido un error" text is displayed

  @jira.QANOV-596639 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User with phone number stored as recovery method clicks on the save button without making changes: An error occurs
    Given user is in the "Recovery Method" page
      And user has "phone_number" as recovery method
     When clicks on the "save" button
     Then the "alert" textfield with "No has realizado ningún cambio" text is displayed

  @jira.QANOV-596640 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User with email stored as recovery method clicks on the save button without making changes: An error occurs
    Given user is in the "Recovery Method" page
      And user has "email" as recovery method
     When clicks on the "save" button
     Then the "alert" textfield with "No has realizado ningún cambio" text is displayed

  @jira.QANOV-596641 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User cannot introduce a wrong formated phone number: An error occurs
    Given user is in the "Recovery Method" page
     When fills the "phone_number_inputtext" inputtext with the "60" text
     Then the "inline_phone_number_error" textfield with "Formato incorrecto" text is displayed
      And the "inline_phone_number_error" textfield is displayed in "red" color

  @jira.QANOV-596642 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: User cannot introduce a wrong formated email: An error occurs
    Given user is in the "Recovery Method" page
     When fills the "email_inputtext" inputtext with the "qacdonovum1telefonica.com" text
     Then the "inline_email_error" textfield with "Formato incorrecto" text is displayed
      And the "inline_email_error" textfield is displayed in "red" color

  @jira.QANOV-596643 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario: User with phone number stored as recovery method can change it to an email
    Given user is in the "Recovery Method" page
      And user has "phone_number" as recovery method
     When fills the "email_inputtext" inputtext with the "qacdonovum1@telefonica.com" text
      And clicks on the "save" button
     Then the "alert" textfield with "Se ha guardado tu método de contacto" text is displayed

  @jira.QANOV-596644 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke
  Scenario: User with email stored as recovery method can change it to a phone number
    Given user is in the "Recovery Method" page
      And user has "email" as recovery method
     When fills the "phone_number_inputtext" inputtext with the "666554433" text
      And clicks on the "save" button
     Then the "alert" textfield with "Se ha guardado tu método de contacto" text is displayed

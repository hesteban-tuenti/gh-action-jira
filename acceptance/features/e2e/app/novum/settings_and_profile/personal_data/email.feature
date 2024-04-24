# -*- coding: utf-8 -*-
@jira.QANOV-59912
Feature: Email

  Actions Before the Feature:
    Given user is in the "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible


  @jira.QANOV-59913 @android @automatic @cert2 @har @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @sanity
  Scenario: A telco admin with an email stored can access to the Email Modification screen and see it configured in the input field
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
     When clicks on the "email_address_entrypoint" entrypoint
     Then the "Email Contact" page is displayed
      And the "Email de contacto" header is displayed
      And the "email_title" textfield with "Este es el email de contacto en el que recibirás todas tus comunicaciones como cliente de Telefónica Movistar." text is displayed
      And the "email_input_field" inputtext is displayed
      And the "email_input_placeholder" textfield with "Email" text is displayed
      And the "email_input_field" inputtext with the ".+@\w+.\w+" format is displayed
      And the "email_checkbox_label" textfield with "Acepto el uso de este email para el envío de comunicaciones de novedades Movistar." text is displayed
      And the "email_checkbox" checkbox is displayed
      And the "email_save" button with "Guardar" text is displayed

  @jira.QANOV-59914 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: A telco admin without an email stored can access to the Email Modification screen and see the input field empty
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Profile" page
      And user does not have the "email" contact method set in the application
     When clicks on the "email_address_entrypoint" entrypoint
     Then the "Email Contact" page is displayed
      And the "Email de contacto" header is displayed
      And the "email_title" textfield with "Este es el email de contacto en el que recibirás todas tus comunicaciones como cliente de Telefónica Movistar." text is displayed
      And the "email_input_field" inputtext with the "Email" placeholder is displayed
      And the "email_input_field" inputtext is empty
      And the "email_checkbox" checkbox is not checked
      And the "email_checkbox_text" textfield with "Acepto el uso de este email para el envío de comunicaciones de novedades Movistar." text is displayed
      And the "email_save" button with "Guardar" text is displayed

  @jira.<jira_id> @<priority> @android @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next
  Scenario Outline: A telco admin who <email_stored> an email stored can <action> email and see the success feedback screen
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
      And user <email_stored> the "email" contact method set in the application
     When fills the "email_input_field" inputtext with a valid email
      And clicks on the "email_save" button
     Then the "Feedback Personal Data" page is displayed
      And the "feedback_title" textfield with "Cambios guardados correctamente" text is displayed
      And the "feedback_message" textfield that contains the "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam" text is displayed
      And the "continue_button" button with "Continuar modificando datos" text is displayed
      And the "back_button" button with "Volver a mi perfil" text is displayed
      And the "navigation_top_bar" element is not displayed
      And clicks on the "back_button" button
      And the "Profile" page is displayed

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | email_stored  | action    | priority   | jira_id     |
          | does not have | add a new | regression | QANOV-59916 |

    @automatic
    Examples:
          | email_stored | action              | priority | jira_id     |
          | has          | modify the existing | smoke    | QANOV-59915 |

  @jira.QANOV-59917 @android @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @no_automatable @regression
  Scenario: A telco admin with a email stored sees an error message when trying to save the email without any changes
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Email Contact" page
     When clicks on the "email_save" button
     Then the "warning.text" textfield with "No has realizado ningún cambio" text is displayed

  @jira.QANOV-59919 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.detects.MOVES-6722
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin user cannot modify the email if the email does not exists
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
     When fills the "email_input_field" inputtext with the "988156278@no_existe_este_mail123.com" text
      And clicks on the "email_save" button
     Then the "Feedback Personal Data" page is displayed
      And the "feedback_icon" icon is displayed
      And the "feedback_title" textfield with "El email 988156278@no_existe_este_mail123.com no existe" text is displayed
      And the "feedback_message" textfield with "Por favor, vuelve a intentarlo introduciendo una cuenta de email válida" text is displayed
      And the "retry_button" button with "Reintentar" text is displayed
      And the "back_button" button with "Volver a mi perfil" text is displayed
      And clicks on the "back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-59920 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: User inserts a wrong email in the Email Modification screen: error will be shown
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Email Contact" page
     When fills the "email_input_field" inputtext with the "abc@" text
      And clicks on the "email_save" button
     Then the "error_textfield" textfield with "Email incorrecto" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Email Modification Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Profile" page is displayed

  @jira.<jira_id> @<client> @<execution_mode> @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin inserts an empty email in the Email Modification screen: error will be shown
    In IOS the cleared element is cached and set back after clicking save, therefore is set to manual
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
      And user has the "email" contact method set in the application
     When clears the "email_input_field" inputtext
      And clicks on the "email_save" button
     Then the "error_textfield" textfield with "Este campo es obligatorio" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Email Modification Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Profile" page is displayed

    Examples:
          | client  | execution_mode | jira_id      |
          | android | automatic      | QANOV-59921  |
          | ios     | manual         | QANOV-124205 |

  @jira.QANOV-59922 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin who unselects the email checkbox can still change the email
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
     When unselects the "email_checkbox" checkbox
      And fills the "email_input_field" inputtext with the "abc123@gmail.com" text
      And clicks on the "email_save" button
     Then the "Feedback Personal Data" page is displayed
      And the "feedback_message" textfield that contains the "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam" text is displayed
      And clicks on the "continue_button" button
      And the "Profile" page is displayed

  @jira.QANOV-59923 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin changes the email selecting the checkbox, will see the checkbox enabled the next time that accesses to the Email Modification screen
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
     When selects the "email_checkbox" checkbox
      And fills the "email_input_field" inputtext with the "abc1234@gmail.com" text
      And clicks on the "email_save" button
      And the "Feedback Personal Data" page is displayed
      And the "feedback_message" textfield that contains the "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam" text is displayed
      And clicks on the "continue_button" button
      And the "Personal Data" page is displayed
      And clicks on the "email_address_entrypoint" entrypoint
      And the "Email Contact" page is displayed
     Then the "email_checkbox" checkbox is checked

  @jira.QANOV-118121 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin changes the email unselecting the checkbox, will see the checkbox enabled the next time that accesses to the Email Modification screen
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
     When unselects the "email_checkbox" checkbox
      And fills the "email_input_field" inputtext with the "abc12345@gmail.com" text
      And clicks on the "email_save" button
      And the "Feedback Personal Data" page is displayed
      And the "feedback_message" textfield that contains the "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam" text is displayed
      And clicks on the "continue_button" button
      And the "Personal Data" page is displayed
      And clicks on the "email_address_entrypoint" entrypoint
      And the "Email Contact" page is displayed
     Then the "email_checkbox" checkbox is not checked

  @jira.<jira_id> @<client> @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin tries to go back from the Email modification page: Cancel Email Modification popup is displayed
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Email Contact" page
     When clicks on the "email_input_field" button
      And fills the "email_input_field" inputtext with the "abc@gmail.com" text
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Cancel Email Modification Popup" popup is displayed
      And the "popup.title" textfield with "¿Salir sin guardar cambios?" text is displayed
      And the "popup.message" textfield with "Los cambios no guardados se perderán" text is displayed
      And the "popup.accept" button with "<accept_text>" text is displayed
      And the "popup.cancel" button with "<cancel_text>" text is displayed
      And clicks on the "popup.cancel" button
      And the "Email Contact" page is displayed

    Examples:
          | client  | accept_text | cancel_text | jira_id      |
          | android | SALIR       | CANCELAR    | QANOV-59924  |
          | ios     | Salir       | Cancelar    | QANOV-118122 |

  @jira.QANOV-59925 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.detects.MOVES-6295
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin goes back to the Personal Data page when taps on the "Salir" button on the Cancel Email Modification pop-up
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Email Contact" page
     When clicks on the "email_input_field" button
      And fills the "email_input_field" inputtext with the "abc@gmail.com" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Email Modification Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed

  @jira.QANOV-59926 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin will remain on the Email Modification page when taps on the "Cancelar" button on the Cancel Email Modification pop-up
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Email Contact" page
     When clicks on the "email_input_field" button
      And fills the "email_input_field" inputtext with the "abc@gmail.com" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Email Modification Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed

  @jira.QANOV-59927 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @smoke
  Scenario: A telco admin who is in success feedback screen after changing the email can return to Profile
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
     When fills the "email_input_field" inputtext with the "abc456@gmail.com" text
      And clicks on the "email_save" button
      And the "Feedback Personal Data" page is displayed
      And the "feedback_message" textfield that contains the "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam" text is displayed
      And clicks on the "back_button" button
     Then the "Profile" page is displayed

  @jira.QANOV-59929 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.12.1 @jira.dv.Future
  @jira.link.detects.MOVES-6723 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin who is in success feedback screen after changing the email can continue modifying personal information
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Email Contact" page
     When fills the "email_input_field" inputtext with the "abc4567@gmail.com" text
      And clicks on the "email_save" button
      And the "Feedback Personal Data" page is displayed
      And the "feedback_message" textfield that contains the "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam" text is displayed
      And clicks on the "continue_button" button
     Then the "Personal Data" page is displayed

  @jira.<jira_id> @<impeded> @android @automation.pending_mock @deprecate_profile_moves @ios @jira.cv.12.1 @jira.dv.Future
  @jira.link.detects.<detects> @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves
  Scenario Outline: A telco admin goes back to the <destination_screen> page after a <feedback_screen> in the email change process
    other_affected_versions="2021-09"
    Given user is in the "<feedback_screen>" page
      And user has a "telco" account type
      And user has a "admin" role
     When clicks on the "<feedback_button>" button
     Then the "<destination_screen>" page is displayed

    Examples:
          | feedback_screen    | feedback_button | destination_screen | detects    | impeded      | jira_id     |
          | Feedback Ko        | back_button     | Profile            |            | impeded_mock | QANOV-59928 |
          | Feedback Ko        | retry_button    | Email Modification |            | impeded_mock | QANOV-59930 |
          | Non Existent Email | back_button     | Profile            |            |              | QANOV-59931 |
          | Non Existent Email | retry_button    | Email Modification | MOVES-6302 |              | QANOV-59932 |

  @jira.QANOV-59933 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.12.1 @jira.dv.Future
  @jira.link.detects.ANDROID-9849 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin-light with admin-light role will see the login escalation screen when modifiying/adding the email contact
    App is restarted due to differences navigating back from the Escalation screen. See ANDROID-9849
    Given user has a "telco" account type
      And user has a "admin-light" role
      And user is in the "Email Contact" page
     When fills the "email_input_field" inputtext with the "abc567@gmail.com" text
      And clicks on the "email_save" button
     Then the "Login Escalation Required" page is displayed
      And terminates the app
      And launches the app
      And the "[CONF:landing_tab]" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A BOX7 user with a verified contact email can see the "contact email" entrypoint in the "Change Contact Details" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "verified email" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "contact_email_entrypoint" entrypoint with "E-Mail" text is displayed
      And the "contact_email_description" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email_tag" textfield is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217759:QANOV-283595:QANOV-283597 | QANOV-402198     | QANOV-218366 |

    Examples:
          | product | cv   | depends_on                                          | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-217760:QANOV-283596:QANOV-310943:QANOV-283598 |                  | QANOV-218367 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A BOX7 user with a not verified contact email can see the "contact email" entrypoint in the "Change Contact Details" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "not verified email" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "contact_email_entrypoint" entrypoint with "E-Mail" text is displayed
      And the "contact_email_description" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email_tag" textfield with "Nicht bestätigt" text is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217759:QANOV-283595:QANOV-283597 | QANOV-402198     | QANOV-218368 |

    Examples:
          | product | cv   | depends_on                                          | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-217760:QANOV-283596:QANOV-310943:QANOV-283598 |                  | QANOV-218369 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A BOX7 user without a contact email can see the "contact email" entrypoint in the "Change Contact Details" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "no email" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "contact_email_entrypoint" entrypoint with "E-Mail" text is displayed
      And the "contact_email_description" textfield is not displayed
      And the "contact_email_tag" textfield is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217759:QANOV-283595:QANOV-283597 | QANOV-402198     | QANOV-268979 |

    Examples:
          | product | cv   | depends_on                                          | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-217760:QANOV-283596:QANOV-310943:QANOV-283598 |                  | QANOV-268980 |

  @jira.QANOV-420242 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-283597
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @regression
  Scenario: A RAITT user can see the "contact email" entrypoint in the "Change Contact Details" screen
    All RAITT users have contact email, as they use it for logging in the app.
    RAITT users do not have a "verified/not verified" tag for the "contact email" entrypoint.
    Given user has a "raitt" account type
      And user has a "any" product in "active" status
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "contact_email_entrypoint" entrypoint with "E-Mail" text is displayed
      And the "contact_email_description" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email_tag" textfield is not displayed

  @jira.QANOV-420243 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-218366
  @jira.link.depends_on.QANOV-268979 @jira.link.depends_on.QANOV-420242 @jira.link.parent_test_plan.QANOV-402198 @manual
  @mobile @raitt_drop1 @smoke @har
  Scenario: A RAITT user can access to the "Email Contact" OB webview
    OB webview: prod-raitt-b2c-blau-change-email
    Given user has a "raitt" account type
      And user has a "any" product in "active" status
      And user has a "active" email stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Change Contact Details" page
     When clicks on the "contact_email_entrypoint.chevron" entrypoint
     Then the browser webview with "Login" text in the header is displayed
      And the "Authentifizierung der Rufnummer" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @sanity
  Scenario Outline: A BOX7 user with a verified contact email can access to the "Email Contact" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "active" email stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Change Contact Details" page
     When clicks on the "contact_email_entrypoint.chevron" entrypoint
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And the "title" textfield with "Kontakt-E-Mail" text is displayed
      And the "0" index in the "descriptions" list with "Auf diese E-Mail Adresse erhältst du Informationen zu deinem Vertrag." text is displayed
      And the "1" index in the "descriptions" list with "Bitte überprüfe und bestätige deine E-Mail-Adresse. Du erhältst eine E-Mail mit einem Bestätigungs-Link." text is displayed
      And the "email_inputtext_placeholder" placeholder with "E-Mail-Adresse" text is displayed
      And the "email_inputtext" inputtext is not empty
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "confirm_button" button with "E-Mail-Adresse bestätigen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218366 | QANOV-402198     | QANOV-218370 |

    @manual
    Examples:
          | product | cv   | depends_on   | parent_test_plan          | jira_id      |
          | o2de    | 14.2 | QANOV-218367 | QANOV-402198:QANOV-437471 | QANOV-218371 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @smoke
  Scenario Outline: A BOX7 user with a not verified contact email can access to the "Email Contact Info Feedback" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "not verified" email stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Email Contact Info Feedback" module configured in CMS for "Email Contact Info Feedback" page
      And user is in the "Change Contact Details" page
     When clicks on the "contact_email_entrypoint" entrypoint
     Then the "Email Contact Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "E-Mail-Bestätigung ausstehend" text is displayed
      And the "info_message" textfield with "Sie haben eine E-Mail erhalten. Bitte bestätigen Sie Ihre E-Mail Adresse über den darin enthaltenen Link." text is displayed
      And the "edit_email_button" button with "E-Mail-Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218368 | QANOV-218372 |
          | o2de    | 14.2 | QANOV-218369 | QANOV-218373 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A BOX7 user with a not verified contact email can access to the "Email Contact" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "not verified" email stored in the contact details
      And user has the "Email Contact Info Feedback" module configured in CMS for "Email Contact Info Feedback" page
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact Info Feedback" page
     When clicks on the "edit_email_button" entrypoint
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And the "title" textfield with "Kontakt-E-Mail" text is displayed
      And the "description1" textfield with "Auf diese E-Mail Adresse erhalten Sie Informationen zu Ihrem Vertrag mit persönlichen Daten." text is displayed
      And the "description2" textfield with "Bitte überprüfen und bestätigen Sie deshalb Ihre E-Mail-Adresse. Sie erhalten eine E-Mail mit einem Bestätigungs-Link." text is displayed
      And the "email_inputtext" inputtext with the "E-Mail-Adresse" placeholder is displayed
      And the "email_inputtext" inputtext is not empty
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "confirm_button" button with "E-Mail-Adresse bestätigen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218372 | QANOV-218374 |
          | o2de    | 14.2 | QANOV-218373 | QANOV-218375 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A BOX7 user without a contact email saved can access to the "Email Contact" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "no email" stored in the contact details
      And user has a "any" product in "active" status
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Change Contact Details" page
     When clicks on the "contact_email_entrypoint" entrypoint
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And the "title" textfield with "Kontakt-E-Mail" text is displayed
      And the "description1" textfield with "Auf diese E-Mail Adresse erhalten Sie Informationen zu Ihrem Vertrag mit persönlichen Daten." text is displayed
      And the "description2" textfield with "Bitte überprüfen und bestätigen Sie Deshalb Ihre E-Mail-Adresse. Sie erhalten eine E-Mail mit einem Bestätigungs-Link." text is displayed
      And the "email_inputtext" inputtext with the "E-Mail-Adresse" placeholder is displayed
      And the "email_inputtext" inputtext is empty
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "confirm_button" button with "E-Mail-Adresse bestätigen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | parent_test_plan          | jira_id      |
          | blaude  | 13.9 | QANOV-268979 | QANOV-402198              | QANOV-283696 |
          | o2de    | 14.2 | QANOV-268980 | QANOV-402198:QANOV-437471 | QANOV-283697 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to the data protection info from the "Email Contact" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user has the "Data protection" module configured in CMS for "Data Protection" page
      And user is in the "Email Contact" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed

    Examples:
          | product | cv   | header               | detects    | ddepends_on                            | jira_id      |
          | blaude  | 13.9 | Datenschutz bei Blau | OBO2DE-129 | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218376 |
          | o2de    | 14.2 | Datenschutz          |            | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218377 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cannot add/change the contact email without filling the email field
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     When clears the "email_inputtext" inputtext
      And clicks on the "confirm_button" button
     Then the "email_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218378 |
          | o2de    | 14.2 | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218379 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cannot add/change the contact email without inserting a new valid email
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with the "invalid@email" text
      And clicks on the "confirm_button" button
     Then the "email_error_textfield" textfield with "Falsche E-Mail-Adresse" text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218380 |
          | o2de    | 14.2 | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218381 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: A BOX7 user cannot change the contact email without making any change in the email
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "email" stored in the contact details
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     When clicks on the "confirm_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen" text is displayed

    Examples:
          | product | cv   | detects    | depends_on                | jira_id      |
          | blaude  | 13.9 | OBO2DE-132 | QANOV-218370:QANOV-218374 | QANOV-218382 |
          | o2de    | 14.2 |            | QANOV-218371:QANOV-218375 | QANOV-218383 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tap on back button after filling the email field: a popup is displayed on <client> device
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with the "editing_email" text
      And clicks on the <button> button
     Then the "Email Contact Cancellation" popup is displayed
      And the "title" textfield with "Hinweis" text is displayed
      And the "body" textfield with "Beim Verlassen dieser Ansicht gehen Ihre Eingaben verloren" text is displayed
      And the "continue_button" button with "<continue_button>" text is displayed
      And the "cancel_button" button with "<cancel_button>" text is displayed

    Examples:
          | product | cv   | client  | button                           | continue_button | cancel_button | depends_on                             | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218384 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218385 |
          | o2de    | 14.2 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218386 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218387 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user decides to continue with the change contact email flow after seeing the cancellation popup
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact Cancellation" popup
     When clicks on the "continue_button" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-218384:QANOV-218385 | QANOV-218388 |
          | o2de    | 14.2 | QANOV-218386:QANOV-218387 | QANOV-218389 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user decides to cancel the change contact email flow after seeing the cancellation popup
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact Cancellation" popup
     When clicks on the "cancel_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-218384:QANOV-218385 | QANOV-218390 |
          | o2de    | 14.2 | QANOV-218386:QANOV-218387 | QANOV-218391 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.O2DE-1528 @jira.link.detects.O2DE-2826 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 user can add/change the contact email successfully
    Novum will send a request to the OB for verifying the email, then the OB will send an email to the user with a
    link to complete the verification.
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user has the "Email Contact Success Feedback" module configured in CMS for "Email Contact Success Feedback" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with a valid email
      And clicks on the "confirm_button" button
     Then the "Email Contact Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Die Verifizierung wird durchgeführt." text is displayed
      And the "success_message" textfield with "Bitte warte, bis die Verifizierung abgeschlossen ist." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-402198     | QANOV-218392 |

    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-437471     | QANOV-218393 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to the "Change Contact Details" screen from the "Email Contact Success Feedback" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact Success Feedback" module configured in CMS for "Email Contact Success Feedback" page
      And user is in the "Email Contact Success Feedback" page
     When clicks on the "back_to_contact_details_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218392 | QANOV-218394 |
          | o2de    | 14.2 | QANOV-218393 | QANOV-218395 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user adds/changes the contact email but the confirmation takes too long: an informative screen is displayed
    Novum will send a request to the OB for verifying the email, then the OB will send an email to the user with a
    link to complete the verification.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with a different text
      And clicks on the "confirm_button" button
      And the contact email change takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | depends_on                             | jira_id      |
          | blaude  | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-342567 |
          | o2de    | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-342568 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to "Change Contact Details" screen from the "Email Contact Informative Feedback" screen
    Given user has a "box7" account type
      And user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "back_to_contact_details_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-342567 | QANOV-342569 |
          | o2de    | QANOV-342568 | QANOV-342570 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can verify his/her new contact email
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "not verified email" stored in the contact details
      And user is in the "Change Contact Details" page
     When verifies the contact email
      And waits until the email verification process is completed
     Then the "contact_email_entrypoint" entrypoint with "E-Mail" text is displayed
      And the "contact_email_description" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email_tag" textfield is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218392 | QANOV-223307 |
          | o2de    | 14.2 | QANOV-218393 | QANOV-223308 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to add/change the contact email but an error happens (first 2 attempts)
    The user will see a red warning at the bottom of the screen the first 2 times that he/she tries to change the contact
    email without success. The third attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has tried to change the contact email "<2" times without success
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with a different text
      And clicks on the "confirm_button" button
      And there is an error changing the contact email
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218396 |
          | o2de    | 14.2 | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218397 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can close the error warning after trying to change the contact email without success
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has tried to change the contact email "<2" times without success
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with a different text
      And clicks on the "confirm_button" button
      And there is an error changing the contact email
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Email Contact" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218396 | QANOV-218398 |
          | o2de    | 14.2 | QANOV-218397 | QANOV-218399 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to add/change the contact email but an error happens (third attempt)
    The user will see a red warning at the bottom of the screen the first 2 times that he/she tries to change the contact
    email without success. The third attempt will redirect to a full screen error feedback.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has tried to change the contact email "2" times without success
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user has the "Email Contact Error Feedback" module configured in CMS for "Email Contact Error Feedback" page
      And user is in the "Email Contact" page
     When fills the "email_inputtext" inputtext with a different text
      And clicks on the "confirm_button" button
      And there is an error changing the contact email
     Then the "Email Contact Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send the request" text is displayed
      And the "error_message" textfield with "The request to verify your contact email couldn't be sent. Please try again later." text is displayed
      And the "try_again_later_button" button with "Try again later" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-218370:QANOV-218374:QANOV-283696 | QANOV-218400 |
          | o2de    | 14.2 | QANOV-218371:QANOV-218375:QANOV-283697 | QANOV-218401 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to the "Change Contact Details" screen from the "Email Contact Error Feedback" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact Error Feedback" module configured in CMS for "Email Contact Error Feedback" page
      And user is in the "Email Contact Error Feedback" page
     When clicks on the "try_again_later_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218400 | QANOV-218402 |
          | o2de    | 14.2 | QANOV-218401 | QANOV-218403 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go to previous screen from the "Email Contact Error Feedback" screen on iOS devices
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Email Contact Error Feedback" module configured in CMS for "Email Contact Error Feedback" page
      And user is in the "Email Contact Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218400 | QANOV-218404 |
          | o2de    | 14.2 | QANOV-218401 | QANOV-218405 |

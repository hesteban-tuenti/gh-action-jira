# -*- coding: utf-8 -*-
@jira.QANOV-59934
Feature: Phone Number

  Actions Before the Feature:
    Given user has not the "CUSTOMER_UPDATE_DATA" forbidden use case
      And user is in the "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible


  @jira.QANOV-59935 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.detects.MOVES-5230
  @jira.link.detects.MOVES-6889 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @sanity @har
  Scenario: A telco admin with a phone number stored can access to the Phone Modification screen and see it configured in the input field
    other_affected_versions="2021-09"
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "phone number" contact method set in the application
     When clicks on the "phone_number_entrypoint" entrypoint
     Then the "Phone Number Contact" page is displayed
      And the "Teléfono de contacto" header is displayed
      And the "phone_title" textfield with "Este es el número de teléfono móvil de contacto en el que recibirás todas tus comunicaciones tanto llamadas como SMS como cliente de Telefónica Movistar." text is displayed
      And the "phone_input_field" inputtext is displayed
      And the "phone_input_placeholder" textfield with "Número de teléfono" text is displayed
      And the "phone_input_field" inputtext with the "^(\+\d{2}\s)*\d{3}\s\d{2}\s\d{2}\s\d{2}$" format is displayed
      And the "phone_save" button with "Guardar" text is displayed

  @jira.QANOV-59936 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: A telco admin without a phone number stored can access to the Phone Modification screen and see the input field empty
    other_affected_versions="2021-09"
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "email" contact method set in the application
      And user does not have the "phone number" contact method set in the application
     When clicks on the "phone_number_entrypoint" entrypoint
     Then the "Phone Number Contact" page is displayed
      And the "Teléfono de contacto" header is displayed
      And the "phone_title" textfield with "Este es el número de teléfono móvil de contacto en el que recibirás todas tus comunicaciones tanto llamadas como SMS como cliente de Telefónica Movistar." text is displayed
      And the "phone_input_field" inputtext with the "Número de teléfono" placeholder is displayed
      And the "El campo número de teléfono es obligatorio. Por favor indícanos un número válido" text is displayed under the "phone_input_field" field
      And the "phone_input_field" inputtext is empty
      And the "phone_save" button with "Guardar" text is displayed

  @jira.<jira_id> @<priority> @android @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next
  Scenario Outline: A telco admin who <phone_stored> a phone number stored can <action> phone and see the success feedback screen
    other_affected_versions="2021-09"
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    Given user has a "telco" account type
      And user has a "admin" role
      And user has the "email" contact method set in the application
      And user <phone_stored> the "phone number" contact method set in the application
      And user is in the "Phone Number Contact" page
     When fills the "phone_input_field" inputtext with the "675877998" text
      And clicks on the "phone_save" button
     Then the "Feedback Personal Data" page is displayed
      And the "feedback_title" textfield with "Cambios guardados correctamente" text is displayed
      And the "continue_button" button with "Continuar modificando datos" text is displayed
      And the "back_button" button with "Volver a mi perfil" text is displayed
      And the "navigation_top_bar" element is not displayed
      And clicks on the "continue_button" button
      And the "Personal Data" page is displayed

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | phone_stored  | action    | priority   | jira_id     |
          | does not have | add a new | regression | QANOV-59938 |

    @automatic
    Examples:
          | phone_stored | action              | priority | jira_id     |
          | has          | modify the existing | smoke    | QANOV-59937 |

  @jira.<jira_id> @<client> @<execution_mode> @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin with a phone stored sees an error message when trying to save the phone without any changes
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When clicks on the "phone_save" button
     Then the "warning.text" textfield with "No has realizado ningún cambio" text is displayed

    Examples:
          | client  | execution_mode | jira_id      |
          | android | manual         | QANOV-59939  |
          | ios     | automatic      | QANOV-124223 |

  @jira.<jira_id> @<client> @<mode> @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin inserts a wrong phone number in the Phone Modification screen: error will be shown
      Android scenarios are skipped due to the recurrent error of taking to long to retrieve some elements from some webviews,
    in this case the problem is "error_textfield" textfield.
    Locally the scenario works, but in Jenkins due to the slow perfomance the scenarios provokes a timeout.
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When fills the "phone_input_field" inputtext with the "<invalid_phone>" text
      And clicks on the "phone_save" button
      And waits until the "error_textfield" element is visible
     Then the "error_textfield" textfield with "El número de teléfono móvil no es correcto, por favor revísalo" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Phone Modification Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Profile" page is displayed

    Examples:
          | client  | invalid_phone | mode      | jira_id      |
          | android | 6069751       | manual    | QANOV-59941  |
          | android | 123456789     | manual    | QANOV-59942  |
          | android | 983547896     | manual    | QANOV-225943 |
          | ios     | 6069751       | automatic | QANOV-182855 |
          | ios     | 123456789     | automatic | QANOV-182856 |
          | ios     | 983547896     | automatic | QANOV-225944 |

  @jira.<jira_id> @<client> @<execution_mode> @cert2 @jira.cv.12.1 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin inserts an empty phone number in the Phone Modification screen: error will be shown
    In IOS the cleared element is cached and set back after clicking save, therefore is set to manual
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
      And clicks on the "phone_input_field" inputtext
     When clears the "phone_input_field" inputtext
     Then the "error_textfield" textfield with "Este campo es obligatorio." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Phone Modification Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Profile" page is displayed

    Examples:
          | client  | execution_mode | detects    | jira_id      |
          | android | automatic      | MOVES-6723 | QANOV-59943  |
          | ios     | manual         |            | QANOV-124224 |

  @jira.<jira_id> @<client> @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin tries to go back from the Phone modification page: Cancel Phone Modification popup is displayed
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult).
    Extra steps have been added to restore the cancel status and allow run the test within the suite"
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When clicks on the "phone_input_field" button
      And fills the "phone_input_field" inputtext with the "675876666" text
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Cancel Phone Modification Popup" popup is displayed
      And the "popup.title" textfield with "¿Salir sin guardar cambios?" text is displayed
      And the "popup.message" textfield with "Los cambios no guardados se perderán" text is displayed
      And the "popup.accept" button with "<accept_text>" text is displayed
      And the "popup.cancel" button with "<cancel_text>" text is displayed
      And clicks on the "popup.accept" button
      And the "Personal Data" page is displayed

    Examples:
          | client  | accept_text | cancel_text | jira_id      |
          | android | SALIR       | CANCELAR    | QANOV-59944  |
          | ios     | Salir       | Cancelar    | QANOV-124225 |

  @jira.QANOV-59945 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.detects.MOVES-6295
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin goes back to the Personal Data page when taps on the "Salir" button on the Cancel Phone Modification pop-up
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When clicks on the "phone_input_field" button
      And fills the "phone_input_field" inputtext with the "675876666" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Phone Modification Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed

  @jira.QANOV-59946 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin will remain on the Phone Modification page when taps on the "Cancelar" button on the Cancel Phone Modification Popup pop-up
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult).
    Extra steps have been added to restore the cancel status and allow run the test within the suite"
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When clicks on the "phone_input_field" button
      And fills the "phone_input_field" inputtext with the "675876666" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Phone Modification Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Phone Number Contact" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Cancel Phone Modification Popup" page is displayed
      And clicks on the "popup.accept" button
      And the "Personal Data" page is displayed

  @jira.QANOV-59950 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-525498
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @smoke
  Scenario: A telco admin who is in success feedback screen after changing the phone number can return to Profile
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
      And clears the "phone_input_field" inputtext
     When fills the "phone_input_field" inputtext with the "675878999" text
      And clicks on the "phone_save" button
      And the "Feedback Personal Data" page is displayed
      And the "feedback_title" textfield with "Cambios guardados correctamente" text is displayed
      And clicks on the "back_button" button
     Then the "Profile" page is displayed

  @jira.QANOV-59952 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.12.1 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin who is in success feedback screen after changing the phone number can continue modifying personal information
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When fills the "phone_input_field" inputtext with the "675879999" text
      And clicks on the "phone_save" button
      And the "Feedback Personal Data" page is displayed
      And the "feedback_title" textfield with "Cambios guardados correctamente" text is displayed
      And clicks on the "continue_button" button
     Then the "Personal Data" page is displayed

  @jira.QANOV-59947 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: A telco admin who do not have a contact email saved will not be able to access to the Phone Modification page
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has not an email stored in the personal information
     When clicks on the "phone_number_entrypoint" entrypoint
     Then the "No Email Saved Feedback" page is displayed
      And the "error_title" textfield with "Necesitamos que primero completes tu email de contacto para poder editar tu teléfono" text is displayed
      And the "modify_contact_mail" button with "Editar email de contacto" text is displayed
      And the "back_to_account" button with "Volver a mi perfil" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-59948 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: A telco admin who do not have a contact email saved taps on the "Editar email de contacto" button: Email Modification page is displayed
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has not an email stored in the personal information
     When clicks on the "phone_number_entrypoint" entrypoint
      And the "No Email Saved Feedback" page is displayed
      And clicks on the "modify_contact_mail" button
     Then the "Email Modification" page is displayed
      And the "Email de contacto" header is displayed

  @jira.QANOV-59949 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: A telco admin who do not have a contact email saved taps on the "Editar email de contacto" button and adds a new Email: Email Added Feedback page is displayed
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user has not an email stored in the personal information
     When clicks on the "phone_number_entrypoint" entrypoint
      And the "No Email Saved Feedback" page is displayed
      And clicks on the "modify_contact_mail" button
      And the "Email Modification" page is displayed
      And fills the "email_input_field" inputtext with the "abc@gmail.com" text
      And clicks on the "email_save" button
     Then the "Email Added Feedback" page is displayed
      And the "success_title" textfield with "Cambios guardados correctamente" text is displayed
      And the "success_message" textfield with "Te hemos enviado un email de confirmación que debes abrir. Revisa tu bandeja de entrada o tu bandeja de spam." text is displayed
      And the "modify_another_information" button with "Seguir modificando mi teléfono de contacto" text is displayed
      And the "back_to_account" button with "Volver a mi perfil" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.<jira_id> @android @automation.pending_mock @deprecate_profile_moves @impeded_mock @ios @jira.cv.12.1
  @jira.dv.Future @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario Outline: A telco admin goes to the <destination_screen> page after a <feedback_screen> in the phone change process
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    other_affected_versions="2021-09"
    Given user is in the "<feedback_screen>" page
      And user has a "telco" account type
      And user has a "admin" role
     When clicks on the "<feedback_button>" button
     Then the "<destination_screen>" page is displayed

    @automation.pending_mock
    Examples:
          | feedback_screen         | feedback_button            | destination_screen | jira_id     |
          | Feedback Ko             | back_to_account            | Profile            | QANOV-59951 |
          | Feedback Ko             | retry_button               | Phone Modification | QANOV-59953 |
          | No Email Saved Feedback | back_to_account            | Profile            | QANOV-59954 |
          | Email Added Feedback    | modify_another_information | Phone Modification | QANOV-59955 |
          | Email Added Feedback    | back_to_account            | Profile            | QANOV-59956 |

  @jira.QANOV-59957 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.12.1 @jira.dv.Future
  @jira.link.detects.ANDROID-9849 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario: A telco admin-light with admin-light role cannot modify/add a phone
    If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)
    App is restarted due to differences navigating back from the Escalation screen. See ANDROID-9849
    Given user has a "telco" account type
      And user has a "admin-light" role
      And user is in the "Phone Number Contact" page
      And user has the "phone number" contact method set in the application
     When fills the "phone_input_field" inputtext with the "606975151" text
      And clicks on the "phone_save" button
     Then the "Login Escalation Required" page is displayed
      And terminates the app
      And launches the app
      And the "[CONF:landing_tab]" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User without a contact phone number stored can see the "contact number" entrypoint in the "Change Contact Details" screen
    Given user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "contact_number_entrypoint" entrypoint with "Kontaktrufnummer" text is displayed
      And the "contact_number_description" textfield is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217759 | QANOV-218452 |

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-217760 | QANOV-218453 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User with a contact phone number stored can see the "contact number" entrypoint in the "Change Contact Details" screen
    Given user has a "any" product in "active" status
      And user has a "phone number" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "contact_number_entrypoint" entrypoint with "Kontaktrufnummer" text is displayed
      And the "contact_number_description" textfield is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217759 | QANOV-218454 |

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-217760 | QANOV-218455 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: User without a contact phone number stored can access to the "Phone Number Contact" screen
    Given user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Change Contact Details" page
     When clicks on the "contact_number_entrypoint" entrypoint
     Then the "Phone Number Contact" page is displayed
      And the "Kontaktrufnummer" header is displayed
      And the "title" textfield with "Kontaktrufnummer" text is displayed
      And the "description" textfield with "Verwende hier bitte deine Kontaktrufnummer für den Empfang wichtiger Informationen per SMS. Bitte stelle sicher, dass auf diesem Gerät SMS und Anrufe empfangen werden können." text is displayed
      And the "phone_number_inputtext" inputtext with the "Telefonnummer" placeholder is displayed
      And the "phone_number_inputtext" inputtext is empty
      And the "phone_number_example" textfield with "+49 1234 1245" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Jetzt ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218452 |                  | QANOV-218456 |

    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-218453 | QANOV-437471     | QANOV-218458 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @sanity @har
  Scenario Outline: User with a contact phone number stored can access to the "Phone Number Contact" screen
    For BOX7, a fixed "+49" prefix is displayed in the phone_number_inputtext.
    For RAITT, the fixed "+49" prefix is removed from the phone_number_inputtext.
    Given user has a "any" product in "active" status
      And user has a phone number stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Change Contact Details" page
     When clicks on the "contact_number_entrypoint.chevron" entrypoint
     Then the "Phone Number Contact" page is displayed
      And the "Kontaktrufnummer" header is displayed
      And the "title" textfield with "Kontaktrufnummer" text is displayed
      And the "description" textfield with "Verwende hier bitte deine Kontaktrufnummer für den Empfang wichtiger Informationen per SMS. Bitte stelle sicher, dass auf diesem Gerät SMS und Anrufe empfangen werden können." text is displayed
      And the "phone_number_inputtext_placeholder" placeholder with "Telefonnummer" text is displayed
      And the "phone_number_inputtext" inputtext is not empty
      And the "phone_number_example" textfield with "+49 1234 1245" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Jetzt ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218454 |                  | QANOV-218459 |

    @manual
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-218455 | QANOV-437471     | QANOV-218460 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario Outline: A BOX7 user can see a fixed "+49" prefix in the phone number inputtext
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When clears the "phone_number_inputtext" inputtext
     Then the "phone_number_inputtext" inputtext that contains the "+49" text is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-218456:QANOV-218459 | QANOV-420244 |

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | o2de    | 14.2 | QANOV-218458:QANOV-218460 | QANOV-420245 |

  @jira.QANOV-420246 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-218456
  @jira.link.depends_on.QANOV-218459 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @regression @har
  Scenario: A RAITT user cannot see a fixed "+49" prefix in the phone number inputtext
    For RAITT, the fixed "+49" prefix is removed from the phone_number_inputtext.:
    - If the number starts with “00” we will replace it internally with a “+” for example, “004917612345678” > “+4917612345678”.
    - If the number starts with “0” we will replace it internally with a “+49” for example, “017612345678” > “+4917612345678”.
    - If the user just adds a number, we will append a “+” internally at the beginning, for example “4917612345678” > “+4917612345678”.
    - If the user starts the number with a “+” we will ignore it.
    Given user has a "raitt" account type
      And user has a "any" product in "active" status
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When clears the "phone_number_inputtext" inputtext
     Then the "phone_number_inputtext" inputtext does not contain the "+49" text

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: User can access to the data protection info from the "Phone Number Contact" screen
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user has the "Data protection" module configured in CMS for "Data Protection" page
      And user is in the "Phone Number Contact" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Phone Number Contact" page is displayed
      And the "Kontaktrufnummer" header is displayed

    Examples:
          | product | cv   | header               | depends_on                | detects    | jira_id      |
          | blaude  | 13.9 | Datenschutz bei Blau | QANOV-218456:QANOV-218459 | OBO2DE-207 | QANOV-218461 |
          | o2de    | 14.2 | Datenschutz          | QANOV-218458:QANOV-218460 |            | QANOV-218462 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: User cannot save the contact phone number without filling the phone number field
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When clears the "phone_number_inputtext" inputtext
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                | parent_test_plan | detects    | jira_id      |
          | blaude  | 13.9 | QANOV-218456:QANOV-218459 | QANOV-402198     | OBO2DE-192 | QANOV-218463 |
          | o2de    | 14.2 | QANOV-218458:QANOV-218460 |                  |            | QANOV-218465 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1529
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: User cannot save the contact phone number when inserting an invalid phone number
    The phone numbers will be validated with the Google phone number library.
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "1234" text
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Diese Telefonnummer ist ungültig. Gib eine gültige Nummer ein" text is displayed

    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218456:QANOV-218459 | QANOV-402198     | QANOV-218466 |
          | o2de    | 14.2 | QANOV-218458:QANOV-218460 |                  | QANOV-218467 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cannot save the contact phone number without making any change in the phone number
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218459 | QANOV-218468 |
          | o2de    | 14.2 | QANOV-218460 | QANOV-218469 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User tap on back button after filling the phone number field: a popup is displayed on <client> device
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "160" text
      And clicks on the <button> button
     Then the "Phone Number Contact Cancellation" popup is displayed
      And the "title" textfield with "Hinweis" text is displayed
      And the "body" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "continue_button" button with "<continue_button>" text is displayed
      And the "cancel_button" button with "<cancel_button>" text is displayed

    Examples:
          | product | cv   | client  | button                           | continue_button | cancel_button | depends_on                | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-218456:QANOV-218459 | QANOV-218470 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-218456:QANOV-218459 | QANOV-218471 |
          | o2de    | 14.2 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-218458:QANOV-218460 | QANOV-218472 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-218458:QANOV-218460 | QANOV-218473 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User decides to continue with the change contact phone number flow after seeing the cancellation popup
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact Cancellation" popup
     When clicks on the "continue_button" button
     Then the "Phone Number Contact" page is displayed
      And the "Kontaktrufnummer" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-218470:QANOV-218471 | QANOV-218474 |
          | o2de    | 14.2 | QANOV-218472:QANOV-218473 | QANOV-218475 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User decides to cancel the change contact phone number flow after seeing the cancellation popup
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact Cancellation" popup
     When clicks on the "cancel_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-218470:QANOV-218471 | QANOV-218476 |
          | o2de    | 14.2 | QANOV-218472:QANOV-218473 | QANOV-218477 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.OBO2DE-213
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: User can add the contact phone number successfully
    Given user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user has the "Phone Number Contact Success Feedback" module configured in CMS for "Phone Number Contact Success Feedback" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "01775254777" text
      And clicks on the "save_button" button
     Then the "Phone Number Contact Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Änderung erfolgreich" text is displayed
      And the "success_message" textfield with "Vielen Dank, wir haben deine Daten erfolgreich geändert." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu meinen Daten" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218456 | QANOV-402198     | QANOV-218478 |

    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-218458 | QANOV-437471     | QANOV-218479 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can change the contact phone number: a confirmation popup is displayed
    Given user has a "any" product in "active" status
      And user has a "phone number" stored in the contact details
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with a different text
      And clicks on the "save_button" button
     Then the "Phone Number Contact Confirmation" popup is displayed
      And the "title" textfield with "Du bist dabei, deine Kontaktrufnummer zu ändern" text is displayed
      And the "body" textfield with "Diese kannst du in deinem Profilbereich erneut ändern." text is displayed
      And the "continue_button" button with "OK" text is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218459 | QANOV-218480 |
          | o2de    | 14.2 | QANOV-218460 | QANOV-218481 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cancels to change the contact phone number
    Given user has a "any" product in "active" status
      And user has a "phone number" stored in the contact details
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with a different text
      And clicks on the "save_button" button
      And the "Phone Number Contact Confirmation" popup is displayed
      And clicks on the "cancel_button" button
     Then the "Phone Number Contact" page is displayed
      And the "Kontaktrufnummer" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218480 | QANOV-218482 |
          | o2de    | 14.2 | QANOV-218481 | QANOV-218483 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.OBO2DE-213 @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: User confirms to change the contact phone number: phone number changed successfully
    Given user has a "any" product in "active" status
      And user has a phone number stored in the contact details
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user has the "Phone Number Contact Success Feedback" module configured in CMS for "Phone Number Contact Success Feedback" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "01791111111" text
      And clicks on the "save_button" button
      And the "Phone Number Contact Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Phone Number Contact Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Änderung erfolgreich" text is displayed
      And the "success_message" textfield with "Vielen Dank, wir haben deine Daten erfolgreich geändert." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-218480 | QANOV-402198     | QANOV-218484 |

    @manual
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-218481 | QANOV-437471     | QANOV-218485 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user who is in the "Phone Number Contact Success Feedback" page can tap on the "<button_name>" button
    User can arrive to this Phone Number Contact Success Feedback screen by adding or changing the phone number contact.
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact Success Feedback" module configured in CMS for "Phone Number Contact Success Feedback" page
      And user is in the "Phone Number Contact Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | button_name             | button_id                       | depends_on                | jira_id      |
          | blaude  | 13.9 | Back to contact details | back_to_contact_details_button  | QANOV-218478:QANOV-218484 | QANOV-218486 |
          | blaude  | 13.9 | Close                   | navigation_top_bar.close_button | QANOV-218478:QANOV-218484 | QANOV-218487 |
          | o2de    | 14.2 | Back to contact details | back_to_contact_details_button  | QANOV-218479:QANOV-218485 | QANOV-218488 |
          | o2de    | 14.2 | Close                   | navigation_top_bar.close_button | QANOV-218479:QANOV-218485 | QANOV-218489 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: User tries to add the contact phone number but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to add the
    contact phone number without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
      And user has tried to add the contact phone number "0" times without success
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "TBD" text
      And clicks on the "save_button" button
      And there is an error adding the contact phone number
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

    Examples:
          | product | cv   | depends_on   | detects    | jira_id      |
          | blaude  | 13.9 | QANOV-218456 | OBO2DE-204 | QANOV-218490 |
          | o2de    | 14.2 | QANOV-218458 |            | QANOV-218491 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can close the error warning after trying to add the contact phone number without success
    Given user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
      And user has tried to add the contact phone number "0" times without success
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "TBD" text
      And clicks on the "save_button" button
      And there is an error adding the contact phone number
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Phone Number Contact" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218490 | QANOV-218492 |
          | o2de    | 14.2 | QANOV-218491 | QANOV-218493 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User tries to add the contact phone number but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to add the
    contact phone number without success. The second attempt will redirect to a full screen error feedback.
    Given user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
      And user has tried to add the contact phone number "1" times without success
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user has the "Phone Number Contact Error Feedback" module configured in CMS for "Phone Number Contact Error Feedback" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with the "TBD" text
      And clicks on the "save_button" button
      And there is an error adding the contact phone number
     Then the "Phone Number Contact Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Kontaktrufnummer konnte nicht geändert werden" text is displayed
      And the "error_message" textfield with "Versuchen es später erneut." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218456 | QANOV-218494 |
          | o2de    | 14.2 | QANOV-218458 | QANOV-218495 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: User tries to change the contact phone number but an error happens (first 3 attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to modify the
    contact phone number without success. The fourth attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "any" product in "active" status
      And user has a "phone number" stored in the contact details
      And user has tried to modify the contact phone number "<3" times without success
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with a different text
      And clicks on the "save_button" button
      And there is an error modifying the contact phone number
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

    Examples:
          | product | cv   | depends_on   | detects    | jira_id      |
          | blaude  | 13.9 | QANOV-218459 | OBO2DE-204 | QANOV-218496 |
          | o2de    | 14.2 | QANOV-218460 |            | QANOV-218497 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can close the error warning after trying to change the contact phone number without success
    Given user has a "any" product in "active" status
      And user has a "phone number" stored in the contact details
      And user has tried to modify the contact phone number "<3" times without success
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with a different text
      And clicks on the "save_button" button
      And there is an error modifying the contact phone number
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Phone Number Contact" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218496 | QANOV-218498 |
          | o2de    | 14.2 | QANOV-218497 | QANOV-218499 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User tries to change the contact phone number but an error happens (fourth attempt)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to change the
    contact phone number without success. The fourth attempt will redirect to a full screen error feedback.
    Given user has a "any" product in "active" status
      And user has a "phone number" stored in the contact details
      And user has tried to modify the contact phone number "3" times without success
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user has the "Phone Number Contact Error Feedback" module configured in CMS for "Phone Number Contact Error Feedback" page
      And user is in the "Phone Number Contact" page
     When fills the "phone_number_inputtext" inputtext with a different text
      And clicks on the "save_button" button
      And there is an error modifying the contact phone number
     Then the "Phone Number Contact Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Kontaktrufnummer konnte nicht geändert werden" text is displayed
      And the "error_message" textfield with "Versuchen Sie es später noch einmal." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218459 | QANOV-218500 |
          | o2de    | 14.2 | QANOV-218460 | QANOV-218501 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user who is in the "Phone Number Contact Error Feedback" page can tap on the "<button_name>" button
    User can arrive to this Phone Number Contact Error Feedback screen by adding or changing the phone number contact.
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact Error Feedback" module configured in CMS for "Phone Number Contact Error Feedback" page
      And user is in the "Phone Number Contact Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed
      And the "<destination_header>" header is displayed

    Examples:
          | product | cv   | button_name        | button_id                       | destination_page       | destination_header  | depends_on                | jira_id      |
          | blaude  | 13.9 | Go back to profile | back_to_profile_button          | Profile                | Profil              | QANOV-218494:QANOV-218500 | QANOV-218502 |
          | blaude  | 13.9 | Close              | navigation_top_bar.close_button | Change Contact Details | Kontaktdaten ändern | QANOV-218494:QANOV-218500 | QANOV-218503 |
          | o2de    | 14.2 | Go back to profile | back_to_profile_button          | Profile                | Profil              | QANOV-218495:QANOV-218501 | QANOV-218504 |
          | o2de    | 14.2 | Close              | navigation_top_bar.close_button | Change Contact Details | Kontaktdaten ändern | QANOV-218495:QANOV-218501 | QANOV-218505 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user can go to previous from the "Phone Number Contact Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a "any" product in "active" status
      And user has the "Phone Number Contact Error Feedback" module configured in CMS for "Phone Number Contact Error Feedback" page
      And user is in the "Phone Number Contact Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Phone Number Contact" page is displayed
      And the "Kontaktrufnummer" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-218494:QANOV-218500 | QANOV-218506 |
          | o2de    | 14.2 | QANOV-218495:QANOV-218501 | QANOV-218507 |

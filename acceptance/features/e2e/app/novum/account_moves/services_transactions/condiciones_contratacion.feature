# -*- coding: utf-8 -*-
@jira.QANOV-153317
Feature: Condiciones de contratación


  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-152294 @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves
  Scenario Outline: TELCO ADMIN user WITHOUT a contact email saved can access to the 'Contact Email Change In Contract Conditions' page for the '<initial_page>' flow
    For telco users you can access the page through the Seguridad vertical
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user does not have the "email" contact method set in the application
      And user <prencondition>
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "<initial_page>" page
     When clicks on the "<action_button>" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "Email de contacto" header is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "¡Ya casi estamos!" text is displayed
      And the "description" textfield with "Te vamos a enviar un email con las condiciones de contratación en PDF para poder finalizar la contratación." text is displayed
      And the "email" inputtext with the "Email" placeholder is displayed
      And the "more_information" link with "¿Cómo tratamos tus datos?" text is displayed
      And the "email_save" button with "Continuar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

    @smoke
    Examples:
          | prencondition                           | initial_page      | action_button | depends_on             | jira_id      |
          | has not the "any" data bundle purchased | Bundle Management | manage_button | QANOV-9372:QANOV-77577 | QANOV-153319 |

    @regression
    Examples:
          | prencondition                                             | initial_page                           | action_button | depends_on            | jira_id      |
          | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | accept_button | QANOV-8658            | QANOV-153318 |
          | has the "any" data bundle purchased                       | Bundle Management                      | manage_button | QANOV-9400:QANOV-9402 | QANOV-153320 |
          | has "data_sharing" service in "deactivated" status        | Data Sharing Management                | manage_button | QANOV-26991           | QANOV-153321 |

  @jira.QANOV-153323 @android @automatic @cert2 @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-77577
  @jira.link.depends_on.QANOV-9372 @jira.link.parent_test_plan.QANOV-152294 @live @mobile @moves @next @qa @sanity
  Scenario: TELCO ADMIN user WITH a contact email saved can access to the 'Contact Email Change In Contract Conditions' page for the 'Bundle Management' flow, email is filled
    For telco users you can access the page through the Seguridad vertical
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the "no_one" data bundle purchased
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "email" contact methods
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And waits until the "title" element is visible
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "Email de contacto" header is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "¡Ya casi estamos!" text is displayed
      And the "description" textfield with "Te vamos a enviar un email con las condiciones de contratación en PDF para poder finalizar la contratación." text is displayed
      And the "email" inputtext with the ".+@\w+.\w+" format is displayed
      And the "email" inputtext with the "Email" placeholder is displayed
      And the "more_information" link with "¿Cómo tratamos tus datos?" text is displayed
      And the "email_save" button with "Continuar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-152294 @manual @mobile @moves @smoke
  Scenario Outline: TELCO ADMIN user WITH a contact email saved can access to the 'Contact Email Change In Contract Conditions' page for the '<initial_page>' flow, email is filled
    For telco users you can access the page through the Seguridad vertical
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the "email" contact method set in the application
      And user <prencondition>
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "<initial_page>" page
     When clicks on the "<action_button>" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "¡Ya casi estamos!" text is displayed
      And the "description" textfield with "Te vamos a enviar un email con las condiciones de contratación en PDF para poder finalizar la contratación." text is displayed
      And the "email" inputtext with the "Email" placeholder is displayed
      And the "email" inputtext with the ".+@\w+.\w+" format is displayed
      And the "more_information" link with "¿Cómo tratamos tus datos?" text is displayed
      And the "email_save" button with "Continuar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

    Examples:
          | prencondition                                             | initial_page                           | action_button | depends_on            | jira_id      |
          | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | accept_button | QANOV-8658            | QANOV-153322 |
          | has the "any" data bundle purchased                       | Bundle Management                      | manage_button | QANOV-9400:QANOV-9402 | QANOV-153324 |
          | has "data_sharing" service in "deactivated" status        | Data Sharing Management                | manage_button | QANOV-26991           | QANOV-153325 |

  @jira.QANOV-153326 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user who was on the 'Contact Email Change In Contract Conditions' page taps on the '¿Cómo tratamos tus datos?' link: CMS dynamic page is displayed
    For telco users you can access the page through the Seguridad vertical.
    CMS page name: resumendecontrato-textolegal
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When clicks on the "more_information" link
     Then the "Contract Summary" CMS page is displayed
      And the "Aviso de privacidad" header is displayed
      And the "title" textfield with "Así tratamos tus datos" text is displayed
      And the "description" textfield is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Contact Email Change In Contract Conditions" page is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario Outline: TELCO ADMIN user who <email_status> a contact email saved and who was on the 'Contact Email Change In Contract Conditions' sees an error message when trying to save an empty email
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user <email_status> the "email" contact method set in the application
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When clears the "email" inputtext
      And clicks on the "email_save" button
     Then the "warning_text" textfield with "<warning_text>" text is displayed

    Examples:
          | email_status  | warning_text                      | jira_id      |
          | does not have | Introduce tu email para continuar | QANOV-153327 |
          | has           | Este campo es obligatorio         | QANOV-153328 |

  @jira.QANOV-153329 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user who was on the 'Contact Email Change In Contract Conditions' sees an error message when trying to save an invalid email
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When fills the "email" inputtext with the "abc@" text
      And clicks on the "email_save" button
     Then the "warning_text" textfield with "Email incorrecto" text is displayed

  @jira.QANOV-153330 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user who was on the 'Contact Email Change In Contract Conditions' sets an email that does not exists: KO feedback is displayed
    This error can be emulated filling the "email" inputtext with any no existing email. f.e: "988156278@no_existe_este_mail123.com"
    other_affected_versions="2022-06-B 2021-09"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When fills the "email" inputtext with the "988156278@no_existe_este_mail123.com" text
      And clicks on the "email_save" button
      And there is an API error in the email save API
     Then the "Feedback Error Contact Email Change In Contract Conditions" page is displayed
      And the "feedback_icon" icon is displayed
      And the "feedback_title" textfield with "Algo ha ido mal" text is displayed
      And the "feedback_message" textfield with "El proceso no se ha podido completar.\nInténtalo de nuevo más tarde" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "button" link with "Volver a mi cuenta" text is displayed

  @jira.QANOV-153331 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user who sets an email that does not exists and was on the KO feedback page taps on the "Reintentar" button: "Contact Email Change In Contract Conditions" page is displayed
    This error can be emulated filling the "email" inputtext with any no existing email. f.e: "988156278@no_existe_este_mail123.com"
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When fills the "email" inputtext with the "988156278@no_existe_este_mail123.com" text
      And clicks on the "email_save" button
      And there is an API error in the email save API
      And the "Feedback Error Contact Email Change In Contract Conditions" page is displayed
      And clicks on the "button" button
     Then the "Contact Email Change In Contract Conditions" page is displayed

  @jira.QANOV-153332 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user taps on the "Continuar" button in the Email Change page changing the Contact Email (if any): Popup to continue with the activation is displayed
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When fills the "email" inputtext with the "abc1234@gmail.com" text
      And clicks on the "email_save" button
     Then the "Email Sent Popup" popup is displayed
      And the "title" textfield with "Condiciones de contratación" text is displayed
      And the "message" textfield with "Te hemos enviado un PDF con las condiciones de contratación" text is displayed
      And the "cancel" button with "Cancelar" text is displayed
      And the "accept" button with "Continuar" text is displayed

  @jira.QANOV-153333 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user WITH a contact email taps on the "Continuar" button in the Email Change page without changing the Contact Email: Popup to continue with the activation is displayed
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the "email" contact method set in the application
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When clicks on the "email_save" button
     Then the "Email Sent Popup" popup is displayed
      And the "title" textfield with "Condiciones de contratación" text is displayed
      And the "message" textfield with "Te hemos enviado un email con las condiciones de contratación" text is displayed
      And the "cancel" button with "Cancelar" text is displayed
      And the "accept" button with "Finalizar" text is displayed

  @jira.QANOV-153334 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user who sends an email with the purchase conditions taps on the "Cancelar contratación" option in the "Email Sent Popup" popup: User remains in the "Contact Email Change In Contract Conditions" page
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the "email" contact method set in the application
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Email Sent Popup" popup
     When clicks on the "cancel" button
     Then the "Contact Email Change In Contract Conditions" page is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-152294 @manual @mobile @moves @regression
  Scenario Outline: TELCO ADMIN user who sends an email with the purchase conditions changing the Contact Email (if any) can activate the service from the '<initial_page>' tapping on the "Continuar" button in the "Email Sent Popup" popup
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user <prencondition>
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "<initial_page>" page
     When clicks on the "<action_button>" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And fills the "email" inputtext with the "abc1234@gmail.com" text
      And clicks on the "email_save" button
      And the "Email Sent Popup" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "success_message" textfield with "¡Listo!\nEn breves momentos recibirás un SMS indicando que <expected_text>" text is displayed
      And the "button" button with "Volver" text is displayed

    Examples:
          | prencondition                                             | initial_page                           | action_button | expected_text                                 | depends_on                          | jira_id      |
          | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | accept_button | tu Conexión Segura ya se ha activado          | QANOV-8658:QANOV-153332             | QANOV-153335 |
          | user has not the "any" data bundle purchased              | Bundle Management                      | manage_button | ya puedes disfrutar de tus datos adicionales. | QANOV-9372:QANOV-77577:QANOV-153332 | QANOV-153336 |
          | has the "any" data bundle purchased                       | Bundle Management                      | manage_button | ya puedes disfrutar de tus datos adicionales. | QANOV-9400:QANOV-9402:QANOV-153332  | QANOV-153337 |
          | has "data_sharing" service in "deactivated" status        | Data Sharing Management                | manage_button | tus datos compartidos ya se han desactivado.  | QANOV-26991:QANOV-153332            | QANOV-153338 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-152294 @manual @mobile @moves @regression
  Scenario Outline: TELCO ADMIN user who sends an email with the purchase conditions without changing the Contact Email can activate the service from the '<initial_page>' tapping on the "Continuar" button in the "Email Sent Popup" popup
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the "email" contact method set in the application
      And user <prencondition>
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "<initial_page>" page
     When clicks on the "<action_button>" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And clicks on the "email_save" button
      And the "Email Sent Popup" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "success_message" textfield with "¡Listo!\nEn breves momentos recibirás un SMS indicando que ya puedes disfrutar <expected_text>" text is displayed
      And the "button" button with "Volver" text is displayed

    Examples:
          | prencondition                                             | initial_page                           | action_button | expected_text                    | depends_on                          | jira_id      |
          | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | accept_button | del servicio de Conexión Segura. | QANOV-8658:QANOV-153333             | QANOV-153339 |
          | user has not the "any" data bundle purchased              | Bundle Management                      | manage_button | de tus datos adicionales.        | QANOV-9372:QANOV-77577:QANOV-153333 | QANOV-153340 |
          | has the "any" data bundle purchased                       | Bundle Management                      | manage_button | de tus datos adicionales.        | QANOV-9400:QANOV-9402:QANOV-153333  | QANOV-153341 |
          | has "data_sharing" service in "deactivated" status        | Data Sharing Management                | manage_button | de tus datos compartidos.        | QANOV-26991:QANOV-153333            | QANOV-153342 |

  @jira.QANOV-153344 @android @automation.hard @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile
  @moves @regression
  Scenario: TELCO ADMIN user can go back from the 'Feedback Error Contact Email Change In Contract Conditions' screen to the 'Contact Email Change In Contract Conditions' page tapping on the "Volver" button
    For telco users you can access the page through the Seguridad vertical
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Contact Email Change In Contract Conditions" page
     When fills the "email" inputtext with the "abc1234@gmail.com" text
      And clicks on the "email_save" button
      And there is an API error
      And the "Feedback Error Contact Email Change In Contract Conditions" page is displayed
      And clicks on the "retry" button
     Then the "Contact Email Change In Contract Conditions" page is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-152294 @manual @mobile @moves @regression
  Scenario Outline: TELCO ADMIN-LIGHT user cannot access to the 'Contact Email Change In Contract Conditions' page for the '<initial_page>' flow: Escalation flow is displayed
    For telco users you can access the page through the Seguridad vertical
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin-light" role
      And user has a "telco postpay" account type
      And user <prencondition>
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "<initial_page>" page
     When clicks on the "<action_button>" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

    Examples:
          | prencondition                                             | initial_page                           | action_button | depends_on             | jira_id      |
          | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | accept_button | QANOV-8658             | QANOV-164865 |
          | user has not the "any" data bundle purchased              | Bundle Management                      | manage_button | QANOV-9372:QANOV-77577 | QANOV-164866 |
          | has the "any" data bundle purchased                       | Bundle Management                      | manage_button | QANOV-9400:QANOV-9402  | QANOV-164867 |
          | has "data_sharing" service in "deactivated" status        | Data Sharing Management                | manage_button | QANOV-26991            | QANOV-164868 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.24.3 @mobile @moves @no_automatable @regression
  Scenario Outline: User receives an email after <flow>
    NOTE: do not test in NEXT/PROD environments. Can be tested in CERT2 with any user, the email can be sent to systemtestnovum@gmail.com
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user <prencondition>
      And user is in the "<initial_page>" page
     When finish the flow
     Then a new email is sent to the user eamil with "En este resumen, encontrarás más detalles" subject
      And the email text contains the "Te adelantamos un resumen con las principales características y precios del producto por el que te has interesado." text
      And a PDF is attached to the email

    Examples:
          | flow                     | prencondition                                             | initial_page                           | jira_id      |
          | activate Conexion Segura | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | QANOV-618943 |
          | purchase a data bundle   | user has not the "any" data bundle purchased              | Bundle Management                      | QANOV-618944 |
          | replace a data bundle    | has the "any" data bundle purchased                       | Bundle Management                      | QANOV-618945 |
          | activate Data Sharing    | has "data_sharing" service in "deactivated" status        | Data Sharing Management                | QANOV-618946 |

# -*- coding: utf-8 -*-
@jira.QANOV-8638
Feature: Conexion Segura


  @android @ios @jira.<jira_id> @jira.cv.11.2 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-121754
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario Outline: Legado postpay user with Home Gateway Unit and Conexión segura activated can access to the Conexión segura view
    commented_tags="@depends_on.NOV-121767"
    Given user has a "legado postpay" account type
      And user has a "fusion" plan
      And user has a "HGU router" resource
      And user has the "conexion_segura" service in "activated" status
      And user has the "services-summary" module configured in CMS for "<page>" page for the "<product>" product
      And user has the matching subscription selected in the account
      And user is in the "<screen>" page
     When clicks on the "service.conexion_segura" entrypoint
     Then the "Secure Connection" page is displayed
      And the "status_text" textfield with "Servicio Activado" text is displayed
      And the "description" textfield that contains the "La navegación por Internet de tus líneas Fusión" text is displayed
      And the "manage_button" button with "Gestionar" text is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<screen>" page is displayed

    Examples:
          | screen                | page      | product  | depends_on | jira_id    |
          | Mobile Line Dashboard | dashboard | mobile   | QANOV-8640 | QANOV-8646 |
          | Internet              | internet  | internet | QANOV-8642 | QANOV-8647 |

  @android @ios @jira.<jira_id> @jira.cv.11.2 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-121754
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario Outline: Legado postpay user with Home Gateway Unit and Conexión segura deactivated can access to the Conexión segura view
    commented_tags="@depends_on.NOV-121767"
    Given user has a "legado postpay" account type
      And user has a "fusion" plan
      And user has a "HGU router" resource
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "<page>" page for the "<product>" product
      And user has the matching subscription selected in the account
      And user is in the "<screen>" page
     When clicks on the "service.secure_connection" entrypoint
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Navega libre de riesgos por Internet" text is displayed
      And the "description" textfield that contains the "Protege la navegación por internet de todos los dispositivos conectados a tu red Movistar dentro del hogar" text is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "activate_button" button with "Activar" text is displayed

    Examples:
          | screen                | page      | product  | depends_on | jira_id    |
          | Mobile Line Dashboard | dashboard | mobile   | QANOV-8640 | QANOV-8648 |
          | Internet              | internet  | internet | QANOV-8642 | QANOV-8649 |

  @android @ios @jira.<jira_id> @jira.cv.11.2 @jira.link.depends_on.QANOV-8645 @jira.link.relates_to.NOV-121757
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario Outline: ADMIN and ADMIN-LIGHT Legado user without Home Gateway Unit and with Conexión segura activated can access to the Conexión segura view
    Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router
    commented_tags="@depends_on.NOV-121767"
    Given user has a "<plan>" plan
      And user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "HGU router" resource
      And user has the "conexion_segura" service in "activated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "service.secure_connection" entrypoint
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Servicio activado" text is displayed
      And the "description" textfield that contains the "La navegación por Internet de tu línea de contrato móvil" text is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed
      And the "manage_button" button with "Gestionar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Dashboard" page is displayed
      And the "Línea móvil" header is displayed

    Examples:
          | plan     | jira_id    |
          | fusion   | QANOV-8650 |
          | monoline | QANOV-8651 |

  @android @ios @jira.<jira_id> @jira.cv.11.2 @jira.link.depends_on.QANOV-8645 @jira.link.relates_to.NOV-121757
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario Outline: ADMIN and ADMIN-LIGHT Legado user without Home Gateway Unit and with Conexión segura deactivated can access to the Conexión segura view
    Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router
    commented_tags="@depends_on.NOV-121767"
    Given user has a "<plan>" plan
      And user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "HGU router" resource
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "service.secure_connection" entrypoint
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Navega libre de riesgos por Internet" text is displayed
      And the "description" textfield that contains the "La navegación por Internet de tu línea de contrato móvil por la red de Movistar está protegida" text is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "activate_button" button with "Activar" text is displayed

    Examples:
          | plan     | jira_id    |
          | fusion   | QANOV-8652 |
          | monoline | QANOV-8653 |

  @jira.QANOV-44977 @android @ios @jira.cv.11.15
  @jira.link.parent_test_plan.QANOV-44930 @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO ADMIN user can access to the Hire Conditions PDF for Conexión Segura Móvil
    other_affected_versions="2020-51"
    in legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user does not have a "HGU router" resource
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Hire" page
     When clicks on the "hire_conditions_link" link
     Then a pdf file is download from the "https://www.movistar.es/rpmm/estaticos/residencial/precontrato/res_410_Conexion_segura_movil.pdf" url
      And the PDF file is opened after it is downloaded
      And clicks on the native "back" button
      And the "Secure Connection Hire" page is displayed

  @jira.QANOV-44978 @android @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO ADMIN user can access to the Hire Conditions PDF for Conexión Segura Convergente
    other_affected_versions="2020-51"
    In legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user has a "HGU router" resource
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Hire" page
     When clicks on the "hire_conditions_link" link
     Then a pdf file is download from the "https://www.movistar.es/rpmm/estaticos/residencial/precontrato/res_413_Conexion_segura_fusion.pdf" url
      And the PDF file is opened after it is downloaded
      And clicks on the native "back" button
      And the "Secure Connection Hire" page is displayed

  @jira.QANOV-8658 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8649 @jira.link.depends_on.QANOV-8653
  @jira.link.parent_test_plan.QANOV-152294 @jira.link.relates_to.NOV-121760 @manual @mobile @moves @smoke
  Scenario: ADMIN POSTPAY user can access to the screen to see the Terms and conditions before the activation of Conexión segura
    For telco users you can access the page through the Seguridad vertical,
    in legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Hire" page
     When clicks on the "activate_button" button
     Then the "Secure Connection Terms And Conditions" page is displayed
      And the "title" textfield with "Aceptar condiciones de uso" text is displayed
      And the "description" textfield is displayed
      And the "terms_and_conditions" link with "Términos y condiciones" text is displayed
      And the "accept_button" button with "Aceptar y confirmar" text is displayed

  @jira.QANOV-8659 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8658 @jira.link.parent_test_plan.QANOV-152294
  @jira.link.relates_to.NOV-137061 @manual @mobile @moves @regression
  Scenario: ADMIN user can open the PDF with the terms and conditions
    For telco users you can access the page through the Seguridad vertical,
    in legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Terms And Conditions" page
     When clicks on the "terms_and_conditions" link
     Then the PDF file is opened
      And clicks on the native "back" button
      And the "Secure Connection Terms And Conditions" page is displayed

  @jira.QANOV-8660 @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8658
  @jira.link.parent_test_plan.QANOV-152294 @jira.link.relates_to.NOV-121762 @no_automatable @impeded_legacy
  @mobile @moves @regression
  Scenario: LEGADO ADMIN user can activate Conexión segura
    For legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    other_affected_versions="2022-06-B"
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Terms And Conditions" page
     When clicks on the "accept_button" button
     Then the "Feedback Success" page is displayed
      And the "success_message" textfield with "En las próximas horas recibirás un SMS indicándote que ya puedes disfrutar del servicio Conexión Segura." text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-8662 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8658
  @jira.link.relates_to.NOV-121765 @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO ADMIN user cannot activate Conexión segura if an error occurs accepting the Terms & Conditions
    For legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Terms And Conditions" page
     When clicks on the "accept_button" button
      And there is an API error
     Then the "Feedback Error" page is displayed
      And the "error_message" textfield with "No hemos podido activar el servicio de Conexión Segura. Puedes intentarlo de nuevo más tarde, disculpa las molestias." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-8663 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8658
  @jira.link.relates_to.NOV-121767 @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO ADMIN user can retry the Activation process after accepting the Terms & Conditions results in an error
    For legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Terms And Conditions" page
     When clicks on the "accept_button" button
      And there is an API error
      And the "Feedback Error" page is displayed
      And clicks on the "retry" button
     Then the "Secure Connection Hire" page is displayed
      And the "activate_button" button with "Activar" text is displayed

  @jira.QANOV-8664 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8658
  @jira.link.relates_to.NOV-121800 @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO ADMIN User can go back from the Error screen after trying to accept Terms & Conditions
    For legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Terms And Conditions" page
     When clicks on the "accept_button" button
      And there is an API error
      And the "Feedback Error" page is displayed
      And clicks on the "back" button
     Then the "Secure Connection Terms And Conditions" page is displayed
      And the "title" textfield with "Aceptar condiciones de uso" text is displayed

  @jira.QANOV-8661 @android @automation.hard @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8660
  @jira.link.depends_on.QANOV-8667 @jira.link.relates_to.NOV-121764 @no_automatable @impeded_legacy
  @mobile @moves @regression
  Scenario: Legado ADMIN user can go to the account dashboard after finishing the "Conexion segura" activation/deactivation flow
    For telco users you can access the page through the Seguridad vertical,
    in legado it is accessible through the Mobile Line Dashboard and Internet Dashboard as a service
    Given user has a "admin" role
      And user has a "legado postpay" account type
      And user has confirmed the activation of the "Conexión segura" service
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Feedback Success" page
     When clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.QANOV-8665 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8646 @jira.link.depends_on.QANOV-8647
  @jira.link.depends_on.QANOV-8651 @jira.link.detects.MOVES-5073 @jira.link.parent_test_plan.QANOV-28881
  @jira.link.relates_to.NOV-121769 @manual @mobile @moves @regression
  Scenario: ADMIN user can access to the Deactivation confirmation view before the deactivation of Conexión Segura
    internal_checkpoint="For telco users you can access the page through the Seguridad vertical, in legado it is
    accessible through the Mobile Line Dashboard and Internet Dashboard as a service"
    Given user has a "admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection" page
     When clicks on the "deactivate_button" button
     Then the "Secure Connection Deactivation" page is displayed
      And the "Conexión Segura" header is displayed
      And the "title" textfield with "¿Desactivar Conexión Segura?" text is displayed
      And the "description" textfield is displayed
      And the "cancel_button" button with "Cancelar" text is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed

  @jira.QANOV-8666 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8665 @jira.link.parent_test_plan.QANOV-28881
  @jira.link.relates_to.NOV-121770 @manual @mobile @moves @regression
  Scenario: ADMIN user can cancel the deactivation of the Conexión segura service
    internal_checkpoint="For telco users you can access the page through the Seguridad vertical, in legado it is
    accessible through the Mobile Line Dashboard and Internet Dashboard as a service"
    Given user has a "admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Deactivation" page
     When clicks on the "cancel_button" button
     Then the "Secure Connection" page is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed

  @jira.QANOV-8667 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8665 @jira.link.parent_test_plan.QANOV-28881
  @jira.link.relates_to.NOV-121771 @manual @mobile @moves @regression
  Scenario: ADMIN user can deactivate Conexión segura
    internal_checkpoint="For telco users you can access the page through the Seguridad vertical, in legado it is
    accessible through the Mobile Line Dashboard and Internet Dashboard as a service"
    Given user has a "admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection Deactivation" page
     When clicks on the "deactivate_button" button
     Then the "Feedback Success" page is displayed
      And the "success_message" textfield with "Solicitud de baja del servicio Conexión Segura realizada correctamente" text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-8668 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-8647 @jira.link.depends_on.QANOV-8651
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-121772 @manual @mobile @moves @regression
  Scenario: User can Manage her/his Conexión segura
    internal_checkpoint="For telco users you can access the page through the Seguridad vertical, in legado it is
    accessible through the Mobile Line Dashboard and Internet Dashboard as a service"
    Given user has a "admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection" page
     When clicks on the "manage_button" button
     Then the browser webview with "Área privada Movistar" text in the header is displayed
      And the "Conexión Segura" textfield is displayed
      And the "Dar de baja" textfield is displayed
      And the "Gestionar" textfield is displayed

  @android @ios @jira.<jira_id> @jira.cv.11.2 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-121939 @manual
  @mobile @moves @regression
  Scenario Outline: ADMIN-LIGHT cannot activate/deactivate Conexión Segura
    internal_checkpoint="For telco users you can access the page through the Seguridad vertical, in legado it is
    accessible through the Mobile Line Dashboard and Internet Dashboard as a service"
    Given user has a "admin-light" role
      And user has the "conexion_segura" service in "<status>" status
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Secure Connection" page
     When clicks on the "<button>" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

    Examples:
          | status      | button            | depends_on                                  | jira_id    |
          | activated   | deactivate_button | QANOV-8646:QANOV-8647:QANOV-8650:QANOV-8651 | QANOV-8669 |
          | deactivated | activate_button   | QANOV-8648:QANOV-8649:QANOV-8652:QANOV-8653 | QANOV-8670 |

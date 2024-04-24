# -*- coding: utf-8 -*-
@jira.QANOV-324876
Feature: Conexion Segura Module

  Actions Before the Feature:
    Given user is in the "Start" page
      And user has the "secure-connection" module configured in CMS for "start" page
      And pulls down the page to refresh
      And the "Start" page is displayed


  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @mobile @moves @webapp
  Scenario Outline: Telco postpay user with '<role>' role and conexión segura service deactivated can see the Conexión Segura Module in the Start tab with an activation button
    Given user has a "telco postpay" account type
      And user has a "<role>" role
      And user has "several" mobile lines in plan
      And user has the "conexion_segura" service in "deactivated" status in all lines
      And user is in the "Start" page
     Then the "secure_connection.icon" icon is displayed
      And the "secure_connection.subtitle" textfield with "Conexión Segura" text is displayed
      And the "secure_connection.title" textfield with "Protección y tranquilidad para navegar sin riesgos por internet" text is displayed
      And the "secure_connection.description" textfield with "<description>" text is displayed
      And the "secure_connection.additional_description" textfield that contains the "Tu contrato incluye este servicio" text is displayed
      And the "secure_connection.additional_description_check" icon is displayed
      And the "secure_connection.button_primary" button with "Activar" text is displayed
      And the "secure_connection.link" link with "Más información" text is displayed

    @ber @sanity @automatic @qa
    Examples:
          | role  | description                                                                        | jira_id      |
          | admin | Activa Conexión Segura y navega libre de riesgos y con todas tus líneas protegidas | QANOV-324877 |

    @regression @manual
    Examples:
          | role        | description                                                            | jira_id      |
          | admin-light | Activa Conexión Segura y navega libre de riesgos en tu línea protegida | QANOV-324878 |

  @jira.QANOV-324879 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @smoke @webapp @next @live @cert2 @qa
  Scenario: Telco postpay user with 'ADMIN' role and conexión segura service deactivated taps on the "Activar" button: Conexión segura activation flow is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "conexion_segura" service in "deactivated" status
      And user has "1" plans
      And user is in the "Start" page
      And waits until the "secure_connection" element is visible
     When clicks on the "secure_connection.button_primary" button
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Navega libre de riesgos por Internet" text is displayed
      And the "title1" textfield that contains the "Gratis" text is displayed
      And the "description1" textfield that contains the "Sin permanencia ni compromisos." text is displayed
      And the "title2" textfield that contains the "Navega seguro" text is displayed
      And the "description2" textfield that contains the "Protege la navegación de tu línea móvil conectada a la red (3G/4G) de Movistar." text is displayed
      And the "title3" textfield that contains the "Sin instalación" text is displayed
      And the "description3" textfield that contains the "No requiere instalación en los dispositivos porque la protección se ofrece desde la red de Movistar." text is displayed
      And the "activate_button" button with "Activar" text is displayed

  @jira.QANOV-392777 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @regression @webapp @next @live @cert2 @qa
  Scenario: Telco postpay user with 'ADMIN' role and conexión segura service deactivated with more than 1 plan taps on the "Activar" button: Disambiguation page is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "conexion_segura" service in "deactivated" status
      And user has "several" mobile lines in plan
      And user is in the "Start" page
      And waits until the "secure_connection" element is visible
     When clicks on the "secure_connection.button_primary" button
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "title" field
      And each element in the "lines.list" list has the "subtitle" field
      And the "title" field of "lines.list" list entries will match the user mobile lines

  @jira.QANOV-324880 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with 'ADMIN-LIGHT' role and conexión segura service deactivated taps on the "Activar" button: "Login Escalation Required" flow is displayed
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has the "conexion_segura" service in "deactivated" status
      And user is in the "Start" page
     When clicks on the "conexion_segura.button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-324881 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with conexión segura service deactivated taps on the "Más información" button: OB webview is displayed
    Given user has a "telco postpay" account type
      And user has the "conexion_segura" service in "deactivated" status
      And user is in the "Start" page
     When clicks on the "conexion_segura.link" link
     Then the internal webview is displayed
      And the header that contains the "Conexión Segura: Navega" text is displayed
      And the "Conexión Segura" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves
  Scenario Outline: Telco postpay user with '<role>' role and conexión segura service activated with all the lines protected can see the Conexión Segura Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "<role>" role
      And user has the "conexion_segura" service in "activated" status
      And user has all the lines protected
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.title" textfield with "Conexión Segura" text is displayed
      And the "conexion_segura.subtitle" textfield with "<subtitle>" text is displayed
      And the "conexion_segura.description" textfield is displayed
      And the "conexion_segura.additional_description" textfield is not displayed
      And the "conexion_segura.button" button is not displayed
      And the "conexion_segura.link" link with "Ver detalle" text is displayed

    @smoke
    Examples:
          | role  | subtitle                          | jira_id      |
          | admin | Todas tus líneas están protegidas | QANOV-324882 |

    @regression
    Examples:
          | role        | subtitle                | jira_id      |
          | admin-light | Tu línea está protegida | QANOV-324883 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves
  Scenario Outline: Telco postpay user with '<role>' role and conexión segura service activated with threats can see the Conexión Segura Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "<role>" role
      And user has all the lines protected
      And user has the "conexion_segura" service in "activated" status
      And user has any threat in the last 30 days
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.title" textfield with "Conexión Segura" text is displayed
      And the "conexion_segura.subtitle" textfield with "<subtitle>" text is displayed
      And the "conexion_segura.description" textfield with the "<description>" format is displayed
      And the "conexion_segura.additional_description" textfield is not displayed
      And the "conexion_segura.button" button is not displayed
      And the "conexion_segura.link" link with "Ver detalle" text is displayed

    @smoke
    Examples:
          | role  | subtitle                          | description                                                 | jira_id      |
          | admin | Todas tus líneas están protegidas | \d+ amenazas bloqueadas en .* lineas en los últimos 30 días | QANOV-324884 |

    @regression
    Examples:
          | role        | subtitle                | description                                                | jira_id      |
          | admin-light | Tu línea está protegida | \d+ amenazas bloqueadas en tu línea en los últimos 30 días | QANOV-324885 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario Outline: Telco postpay user with '<role>' role and conexión segura service activated without all the lines protected and does not have any threat can see the Conexión Segura Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "<role>" role
      And user has the "conexion_segura" service in "activated" status
      And user does not have all the lines protected
      And user does not have any threat in the last 30 days
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.title" textfield with "Conexión Segura" text is displayed
      And the "conexion_segura.label" textfield with "Pendiente de activar" text is displayed
      And the "conexion_segura.label" label is displayed in "yellow" color
      And the "conexion_segura.subtitle" textfield with "<subtitle>" text is displayed
      And the "conexion_segura.description" textfield with "<description>" text is displayed
      And the "conexion_segura.button" button is not displayed
      And the "conexion_segura.link" link with "Ver detalle" text is displayed

    Examples:
          | role        | subtitle                   | description                                                                   | jira_id      |
          | admin       | Protege todas tus líneas   | No se han encontrado amenazas en los últimos 30 días en tus líneas protegidas | QANOV-324886 |
          | admin-light | Tu línea está desprotegida | Tu línea aún no cuenta con protección de Conexión Segura                      | QANOV-392778 |

  @jira.QANOV-324887 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with 'admin' role and conexión segura service activated without all the lines protected and with threats can see the Conexión Segura Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "conexion_segura" service in "activated" status
      And user does not have all the lines protected
      And user has any threat in the last 30 days
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.title" textfield with "Conexión Segura" text is displayed
      And the "conexion_segura.label" textfield is not displayed
      And the "conexion_segura.subtitle" textfield with the ".* de tus líneas está desprotegida" format is displayed
      And the "conexion_segura.description" textfield with the "\d+ amenazas bloqueadas en \d+ lineas en los últimos 30 días" format is displayed
      And the "conexion_segura.button" button is not displayed
      And the "conexion_segura.link" link with "Ver detalle" text is displayed

  @jira.QANOV-324888 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with 'admin' role and conexión segura service activated with all the lines unprotected can see the Conexión Segura Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has all the lines unprotected
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.title" textfield with "Conexión Segura" text is displayed
      And the "conexion_segura.label" textfield with "Pendiente de activar" text is displayed
      And the "conexion_segura.label" label is displayed in "yellow" color
      And the "conexion_segura.subtitle" textfield with the "Protege todas tus lineas" format is displayed
      And the "conexion_segura.description" textfield with the "Tienes alguna línea que aún no cuenta con la protección de Conexión Segura" format is displayed
      And the "conexion_segura.button" button is not displayed
      And the "conexion_segura.link" link with "Ver detalle" text is displayed

  @jira.QANOV-324889 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with conexión segura service activated taps on the "Ver detalle" link: OB webview is displayed
    Given user has a "telco postpay" account type
      And user has the "conexion_segura" service in "activated" status
      And user is in the "Start" page
     When clicks on the "conexion_segura.link" link
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Conexión Segura" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-324890 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: User can see an error module if the Conexión Segura card failed to load
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Start" page
     When an error occurs loading the "conexion_segura" card
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "conexion_segura" module is not displayed
      And the "Algo ha ido mal" string is displayed

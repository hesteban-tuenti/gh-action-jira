# -*- coding: utf-8 -*-
@jira.QANOV-324922
Feature: Security Module


  @jira.QANOV-324925 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @sanity @qa @webapp
  Scenario: User with a 'Smart Wifi' service contracted can see the service card on the Seguridad module
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "smart_wifi" service in "activated" status
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "smart_wifi.tag" textfield is not displayed
      And the "smart_wifi.icon" icon is displayed
      And the "smart_wifi.title" textfield is displayed
      And the "smart_wifi.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "smart_wifi.link" link with "Ver detalle" text is displayed

  @jira.QANOV-324924 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @sanity @qa @webapp
  Scenario: User with a 'Conexión Segura' service contracted in all lines can see the service card on the Seguridad module
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "conexion_segura" service in "activated" status in all lines
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "conexion_segura.tag" textfield is not displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.title" textfield is displayed
      And the "conexion_segura.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "conexion_segura.link" link with "Ver detalle" text is displayed

  @jira.QANOV-324926 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with conexión segura service activated taps on the Conexión Segura module link: OB webview is displayed
    Text link: Ver detalles → take user to OB web-view to manage the service. id: hub_conexion_segura
    Given user has a "telco postpay" account type
      And user has the "conexion_segura" service in "activated" status
      And user is in the "Dashboard" page
     When clicks on the "conexion_segura.link" link
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Conexión Segura" string is displayed

  @jira.QANOV-324927 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @smoke
  Scenario: Telco postpay user and conexión segura service deactivated in at least one line can see the Conexión Segura Module in the Dashboard with an activate button
    Given user has a "telco postpay" account type
      And user has the "conexion_segura" service in "deactivated" status in more than "0" lines
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "conexion_segura.icon" icon is displayed
      And the "conexion_segura.tag" textfield with "Pendiente de activar" text is displayed
      And the "conexion_segura.tag" label is displayed in "yellow" color
      And the "conexion_segura.title" textfield is displayed
      And the "conexion_segura.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "conexion_segura.link" link with "Más información" text is displayed
      And the "conexion_segura.button_primary" button with "Activar" text is displayed

  @jira.QANOV-324928 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @smoke
  Scenario: Telco postpay user with 'ADMIN' role and conexión segura service deactivated taps on the Conexión Segura module button: Activation flow is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "conexion_segura" service in "deactivated" status
      And user is in the "Dashboard" page
     When clicks on the "conexion_segura.button_primary" link
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Navega libre de riesgos por Internet" text is displayed
      And the "description" textfield that contains the "Protege la navegación por internet de todos los dispositivos conectados a tu red Movistar dentro del hogar" text is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "activate_button" button with "Activar" text is displayed

  @jira.QANOV-324929 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with 'ADMIN-LIGHT' role and conexión segura service deactivated taps on the Conexión Segura module button: Escalation flow is displayed
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has the "conexion_segura" service in "deactivated" status
      And user is in the "Dashboard" page
     When clicks on the "conexion_segura.button_primary" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-361088 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @smoke
  Scenario: Telco postpay user with 'ADMIN' role and conexión segura service deactivated taps on the Conexión Segura module link: External webview is shown
    Text link: Más información → this link opens the OB web-view with more details about the product: https://www.movistar.es/particulares/conexion-segura
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "conexion_segura" service in "deactivated" status
      And user is in the "Dashboard" page
     When clicks on the "conexion_segura.link" button
     Then the external webview is displayed
      And the "Conexión Segura" string is displayed

  @jira.QANOV-324930 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated taps on the Smart Wifi module link: Internet Dashboard is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "1" products of "internet" type
      And user has the "smart_wifi" service in "activated" status
      And user is in the "Dashboard" page
     When clicks on the "smart_wifi.link" link
     Then the "Internet" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-324931 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated and several Internet products taps on the Smart Wifi module link: Disambiguation page is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has ">1" products of "internet" type
      And user has the "smart_wifi" service in "activated" status
      And user is in the "Dashboard" page
     When clicks on the "smart_wifi.link" link
     Then the "Disambiguation" page is displayed
      And the "disambiguation_products" list is displayed
      And each element in the "disambiguation_products" list has the "icon" field
      And each element in the "disambiguation_products" list has the "title" field with "Internet" text
      And each element in the "disambiguation_products" list has the "subtitle" field

  @jira.QANOV-324932 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated and several Internet products taps on any internet product in the Disambiguation page: Internet Dashboard is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has ">1" products of "internet" type
      And user has the "smart_wifi" service in "activated" status
      And user is in the "Dashboard" page
     When clicks on the "smart_wifi.link" link
      And the "Disambiguation" page is displayed
      And clicks on the "any" element in the "disambiguation_products" list
     Then the "Internet" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Disambiguation" page is displayed

  @jira.QANOV-324933 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @qa @webapp
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @automatic @mobile @moves @regression
  Scenario: Telco postpay ADMIN user and Smart Wifi service deactivated can see the Smart Wifi Module in the Account page
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a "internet" product
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "deactivated" status
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "smart_wifi.icon" icon is displayed
      And the "smart_wifi.tag" textfield with "Pendiente de activar" text is displayed
      And the "smart_wifi.tag" label is displayed in "yellow" color
      And the "smart_wifi.title" textfield is displayed
      And the "smart_wifi.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "smart_wifi.link" link with "Más información" text is displayed
      And the "smart_wifi.button_primary" button with "Activar" text is displayed

  @jira.QANOV-361089 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay user with 'ADMIN' role and Smart Wifi service deactivated taps on the Smart Wifi module link: Store App is displayed
    Text link: Más información: goes to  https://www.movistar.es/particulares/movil/servicios/app-smartwifi/
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "smart_wifi" service in "deactivated" status
      And user is in the "Dashboard" page
     When clicks on the "smart_wifi.link" link
     Then the external webview is displayed
      And the "App Smart Wifi" string is displayed

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: Telco postpay user with 'ADMIN' role and Smart Wifi service deactivated taps on the Smart Wifi module button: Store App is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "smart_wifi" service in "deactivated" status
      And user is in the "Dashboard" page
     When clicks on the "smart_wifi.button_primary" button
     Then the "<app>" app is displayed
      And the "Smart Wifi" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-324934 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-324935 |

  @jira.QANOV-324936 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay user with 'ADMIN-LIGHT' role won't see the Smart Wifi module in the Dashboard
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has a "admin-light" role
      And user is in the "Dashboard" page
     Then the "smart_wifi" module is not displayed

  @jira.QANOV-328257 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay user without HGU won't see the Smart Wifi module in the Dashboard
    Given user has a "telco postpay" account type
      And user does not have a "HGU router" resource
      And user is in the "Dashboard" page
     Then the "smart_wifi" module is not displayed

  @jira.QANOV-325145 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user and Movistar Cloud service deactivated can see the Movistar Cloud Module in the Account page
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has the "movistar_cloud" service in "deactivated" status
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "movistar_cloud.icon" icon is displayed
      And the "movistar_cloud.tag" textfield with "Pendiente de activar" text is displayed
      And the "movistar_cloud.tag" label is displayed in "yellow" color
      And the "movistar_cloud.title" textfield is displayed
      And the "movistar_cloud.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "movistar_cloud.link" link with "Más información" text is displayed
      And the "movistar_cloud.button_primary" button with "Activar" text is displayed

  @jira.QANOV-428124 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @smoke
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @qa @webapp @live @cert2 @next
  Scenario: Telco postpay user without the Movistar Cloud service and with the app installed taps on the Movistar Cloud module link: External webview is shown
    Más información: https://www.movistar.es/particulares/tienda/servicios-digitales/cloud
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in more than "0" lines
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "movistar_cloud.icon" icon is displayed
      And the "movistar_cloud.tag" textfield with "Pendiente de activar" text is displayed
      And the "movistar_cloud.tag" label is displayed in "yellow" color
      And the "movistar_cloud.title" textfield is displayed
      And the "movistar_cloud.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "movistar_cloud.link" link with "Más información" text is displayed
      And the "movistar_cloud.button_primary" button with "Activar" text is displayed

  @jira.QANOV-361090 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user without the Movistar Cloud service and with the app installed taps on the Movistar Cloud module link: External webview is shown
    Más información: https://www.movistar.es/particulares/tienda/servicios-digitales/cloud
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in more than "0" lines
      And user has installed the "Movistar Cloud" app
      And user is in the "Dashboard" page
     When clicks on the "movistar_cloud.link" link
     Then the external webview is displayed
      And the "Movistar Cloud" string is displayed

  @jira.QANOV-361091 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user without the Movistar Cloud service and with the app installed taps on the Movistar Cloud module button: Movistar Cloud app is displayed
    Regardless the service status the button will lead to https://micloud.movistar.es/app/ (App store or the App)
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in more than "0" lines
      And user has installed the "Movistar Cloud" app
      And user is in the "Dashboard" page
     When clicks on the "movistar_cloud.button_primary" button
     Then the "Movistar Cloud" app is displayed

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568 @manual
  @mobile @moves @regression
  Scenario Outline: Telco postpay user without the Movistar Cloud service and without the app installed taps on the Movistar Cloud module link: App store is displayed
    Regardless the service status the button will lead to https://micloud.movistar.es/app/ (App store or the App)
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in more than "0" lines
      And user does not have installed the "Movistar Cloud" app
      And user is in the "Dashboard" page
     When clicks on the "movistar_cloud.button_primary" button
     Then the "<app>" app is displayed
      And the "Movistar Cloud" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-361092 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-361093 |

  @jira.QANOV-324923 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @sanity @qa @webapp
  Scenario: User with a 'Movistar Cloud' service contracted can see the service card on the Seguridad module
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "movistar_cloud" service in "activated" status in all lines
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "movistar_cloud.tag" textfield is not displayed
      And the "movistar_cloud.icon" icon is displayed
      And the "movistar_cloud.title" textfield is displayed
      And the "movistar_cloud.description" textfield that contains the "Servicio incluido en tu contrato" text is displayed
      And the "movistar_cloud.link" link with "Ver detalle" text is displayed
      And the "movistar_cloud.button_primary" button is not displayed

  @jira.QANOV-324937 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with the Movistar Cloud service the app installed taps on the Movistar Cloud module link: Movistar Cloud app is displayed
    Regardless the service status the button will lead to https://micloud.movistar.es/app/ (App store or the App)
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "activated" status in all lines
      And user has installed the "Movistar Cloud" app
      And user is in the "Dashboard" page
     When clicks on the "movistar_cloud.link" link
     Then the "Movistar Cloud" app is displayed

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @manual @mobile @moves @regression
  Scenario Outline: Telco postpay user with the Movistar Cloud service and without the app installed taps on the Movistar Cloud module link: App store is displayed
    Regardless the service status the button will lead to https://micloud.movistar.es/app/ (App store or the App)
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "activated" status in all lines
      And user does not have installed the "Movistar Cloud" app
      And user is in the "Dashboard" page
     When clicks on the "movistar_cloud.link" link
     Then the "<app>" app is displayed
      And the "Movistar Cloud" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-328259 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-328260 |

  @jira.<jira_id> @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @smoke @qa @webapp
  Scenario Outline: User with a '<title>' service contracted can see the service card on the Seguridad module
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has the "<purchased_service>" service in "activated" status
      And user is in the "Dashboard" page
     Then the "security_section_header" textfield is displayed
      And the "<purchased_service>.icon" icon is displayed
      And the "<purchased_service>.title" textfield is displayed
      And the "<purchased_service>.link" link with "Ver detalle" text is displayed

    Examples:
          | purchased_service | title                     | jira_id      |
          | movistar_prosegur | Movistar Prosegur Alarmas | QANOV-324938 |
          | movistar_car      | Movistar Car              | QANOV-324939 |
          | qustodio          | Qustodio                  | QANOV-324940 |

  @jira.<jira_id> @TBD @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario Outline: User with a '<purchased_service>' service purchashed can access the details from the Dashboard
    Given user has the "<purchased_service>" service in "activated" status
      And user is in the "Dashboard" page
     When clicks on the "<purchased_service>.link" link
     Then the "<app>" app is displayed
      And the "<app_page>" page is displayed in the "<app>" store

    @android
    Examples:
          | purchased_service | app        | app_page                  | jira_id      |
          | movistar_prosegur | Play Store | Movistar Prosegur Alarmas | QANOV-324941 |
          | movistar_car      | Play Store | Movistar Car              | QANOV-324942 |

    @ios
    Examples:
          | purchased_service | app       | app_page                  | jira_id      |
          | movistar_prosegur | App Store | Movistar Prosegur Alarmas | QANOV-340973 |
          | movistar_car      | App Store | Movistar Car              | QANOV-340974 |

  @jira.QANOV-324943 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with a 'qustodio' service purchashed for just "1" member can access the details from the Dashboard
    Given user has the "qustodio" service in "activated" status for "1" member
      And user is in the "Dashboard" page
     When clicks on the "qustodio.link" link
     Then the browser webview with "Iniciar sesión" text in the header is displayed
      And the "qustodio" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-324944 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with a 'qustodio' service purchashed for ">1" members can access to the disamiguation page from the Dashboard
    Given user has the "qustodio" service in "activated" status for ">1" member
      And user is in the "Dashboard" page
     When clicks on the "qustodio.link" link
     Then the "Products Disambiguation" page is displayed
      And the "Qustodio" header is displayed
      And the "title" textfield with "Selecciona un servicio" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "icon" field
      And each element in the "products_list" list has the "device_model" textfield with the "Suscripción .*" format
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-324945 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with a 'qustodio' service purchashed for ">1" members selects a member from the disambiguation page: TBD page is displayed
    Given user has the "qustodio" service in "activated" status for "1" member
      And user is in the "Dashboard" page
     When clicks on the "qustodio.link" link
      And the "Products Disambiguation" page is displayed
      And clicks on any element in the "products_list" list
     Then the internal webview with "TBD" header is displayed
      And the "TBD" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Products Disambiguation" page is displayed

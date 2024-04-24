# -*- coding: utf-8 -*-
@jira.QANOV-127137
Feature: Account Moves Deeplinks

  Actions After the Feature:
    Then restarts the navigation
     And navigates to "[CONF:landing_tab]" page

  @jira.<jira_id> @android @ios @jira.cv.11.9 @jira.link.relates_to.NOV-209705 @manual @mobile @moves @regression
  Scenario Outline: A telco postpay user can open the <product> TV product details deeplink
    internal_checkpoint="the view opened is part of the TV management purchase flow
    Users:
    Cine con Disney+ not activated: FIC055532F
    Cine con Disney+ activated: FIC052358F"
    other_affected_versions="2020-23-b"
    Given user has a "telco postpay" account type
      And user has the "<product>" TV pack available to purchase
     When opens the "Account.Configurar mi TV" deeplink with "<params>" parameters
     Then The "<page_name>" page is displayed
      And the card with "<product>" text on the "element_name" field is displayed in the "packages" carousel

    Examples:
          | params                        | product          | page_name       | jira_id    |
          | product-details-target-id=946 | Cine con Disney+ | Package Details | QANOV-8364 |

  @jira.QANOV-8385 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-186319
  @mobile @moves @no_automatable @regression
  Scenario: A user who completed a flow initiated from disambiguation screen tap the acknowledgement button: user is redirected to the Account dashboard
    Given user has "several" mobile lines
      And user opens the "Account.Data Purchase" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And user clicks on the "0" element in the "lines.list" list
      And the "Data Management" page is displayed
     When user completes a flow
      And taps the "acknowledgement" button
     Then the "Account" page is displayed

  @jira.<jira_id> @android @manual @cert2 @ios @jira.cv.11.6 @jira.link.detects.MOVES-4890
  @jira.link.relates_to.NOV-186322 @live @mobile @moves @next @regression
  Scenario Outline: A telco postpay user with <role> role can access to the Consents Management webview (ATC) from the "Consent Management" deeplink
    internal_checkpoint="NOTE: Could change with the ATC phase 2."
    Given user has a "telco postpay" account type
      And user has a "<role>" role
     When opens the "Account.Consent Management" deeplink with the app in "killed" status
     Then the "Privacy Preferences Movistar" page is displayed
      And the "Preferencias de privacidad" header is displayed

    Examples:
          | role        | jira_id    |
          | admin       | QANOV-8393 |
          | admin-light | QANOV-8394 |

  @jira.<jira_id> @android @automatic @cert2 @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.<relates_to> @jira.link.detects.IOS-8969
  @live @mobile @moves @next @regression
  Scenario Outline: A user can open the "<deeplink_name>" deeplink
    Given user has a "<product_type>" product
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed
      And the internal webview with "<header_name>" header is displayed

    Examples:
          | cv   | relates_to | product_type | deeplink_name      | page_name          | header_name | parent_test_plan        | jira_id    |
          | 10.5 | NOV-92061  | landline     | Account.Línea fija | LandlineDashboard  | Línea fija  | QANOV-28881             | QANOV-8396 |
          | 11.8 | NOV-201333 | internet     | Account.Internet   | Internet           | Internet    | QANOV-25222:QANOV-28881 | QANOV-8397 |

  @jira.QANOV-8398 @android @automatic @cert2 @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-28881 @jira.link.relates_to.NOV-92060 @jira.link.detects.IOS-8969 @live @mobile
  @moves @next @regression
  Scenario: A user with fusion or pikolin plan can open the "Account.Televisión" deeplink
    Given user has a "fusion;pikolin" plan
     When opens the "Account.Televisión" deeplink with the app in "killed" status
     Then the "TVDashboard" page is displayed
      And the internal webview with "Televisión" header is displayed

  @jira.QANOV-44519 @android @ber @impeded_legacy @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-189597 @mobile
  @moves @no_automatable @regression
  Scenario: A legado user with 1 mobile line can open the 'Account.Mobile' deeplink: Mobile Line Dashboard is displayed
    Given user has a "legado" account type
      And user has "1" mobile lines
     When opens the "Account.Mobile" deeplink with the app in "killed" status
     Then the "Account" page is displayed

  @jira.QANOV-26927 @android @automatic @cert2 @ios @jira.cv11.10 @jira.link.relates_to.NOV-215420 @live @mobile @moves
  @next @regression
  Scenario: A user with fusion plan can open the "Account.Change to other miMovistar plan" deeplink
    Given user has a "fusion" plan
     When opens the "Account.Change to other miMovistar plan" deeplink with the app in "killed" status
     Then the browser webview with "miMovistar" text in the header is displayed
      And waits until the "Configura tu pack" string in browser is displayed

  @jira.QANOV-8413 @android @automatic @cert2 @ios @jira.cv.10.5 @jira.link.detects.MOVES-4893
  @jira.link.relates_to.NOV-64119 @live @mobile @moves @next @smoke
  Scenario: A user with monoline plan can open the "Consumption" deeplink
    Given user has a "monoline" plan
     When opens the "Account.Consumption" deeplink with the app in "killed" status
     Then the "Consumption" page is displayed

  @jira.QANOV-8415 @android @manual @cert2 @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121899 @live @mobile @moves
  @next @regression
  Scenario: A postpay user with monoline plan can open the "Data Purchase" deeplink
    Given user has a "monoline" plan
      And user has "1" plans
      And user has a "postpay" account type
     When opens the "Account.Data Purchase" deeplink with the app in "killed" status
     Then the "Bundle Purchase" page is displayed

  @jira.QANOV-21948 @android @automatic @ios @jira.cv.11.12 @jira.link.parent_test_plan.QANOV-28881
  @jira.link.relates_to.NOV-219867 @mobile @moves @qa @regression
  Scenario: A user with Conexión Segura Convergente in "any" status can open the "Conexión segura" deeplink
    internal_checkpoint="Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router
    User: 52996101F (Legado)"
    Given user has a "telco" account type
      And user has a "HGU router" resource
     When opens the "Account.Conexion Segura" deeplink with the app in "killed" status
     Then the internal webview with "Conexión Segura" header is displayed
      And the "Disfruta de una navegación" string in internal webview is displayed

  @jira.QANOV-35062 @android @automatic @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881
  @jira.link.parent_test_plan.QANOV-44930 @mobile @moves @qa @regression
  Scenario: A user with Conexión Segura Convergente in "deactivated" status can open the "Conexión segura Hire" deeplink
    internal_checkpoint="Just tested the deactivated casuistic in deeplinks because cannot be tested on other side of the app.
    Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router"
    Given user has a "telco" account type
      And user has a "HGU router" resource
      And user has "several" mobile lines
      And user has the "secure_connection" service in "deactivated" status
     When opens the "Account.Conexion Segura Hire" deeplink with the app in "killed" status
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Navega libre de riesgos por Internet" text is displayed
      And the "title_one" textfield that contains the "Gratis" text is displayed
      And the "description_one" textfield that contains the "Sin permanencia ni compromisos." text is displayed
      And the "title_two" textfield that contains the "Navega seguro" text is displayed
      And the "description_two" textfield that contains the "Protege la navegación de tu línea móvil conectada a la red (3G/4G) de Movistar." text is displayed
      And the "title_three" textfield that contains the "Sin instalación" text is displayed
      And the "description_three" textfield that contains the "No requiere instalación en los dispositivos porque la protección se ofrece desde la red de Movistar." text is displayed
      And the "hire_conditions" link with "Puedes descargar en PDF un resumen de condiciones de contratación. Son vinculantes si completas la compra en este momento." text is displayed
      And the "activate_button" button with "Activar" text is displayed

  @jira.QANOV-36673 @android @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881 @manual @mobile @moves
  @regression
  Scenario: A user with Conexión Segura Convergente in "activated" status can open the "Conexión segura Management" deeplink
    internal_checkpoint="Just tested the deactivated casuistic in deeplinks because cannot be tested on other side of the app.
    Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router"
    Given user has a "telco" account type
      And user has a "HGU router" resource
      And user has the "secure_connection" service in "activated" status on a line
     When opens the "Account.Conexion Segura Management" deeplink with the app in "killed" status
     Then the "Secure Connection" page is displayed
      And the "status_text" textfield with "Servicio Activado" text is displayed
      And the "description" textfield that contains the "La navegación por Internet de tus líneas Fusión" text is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed
      And the "manage_button" button with "Gestionar" text is displayed

  @jira.QANOV-35064 @android @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881
  @jira.link.parent_test_plan.QANOV-44930 @manual @mobile @moves @regression
  Scenario: A user with just one mobile line and Conexión Segura Móvil in "deactivated" status can open the "Conexión segura Hire" deeplink
    internal_checkpoint="Just tested the deactivated casuistic in deeplinks because cannot be tested on other side of the app
    Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router"
    Given user has a "telco" account type
      And user does not have a "HGU router" resource
      And user has "1" mobile lines
      And user has the "secure_connection" service in "deactivated" status
     When opens the "Account.Conexion Segura Hire" deeplink with the app in "killed" status
     Then the "Secure Connection Hire" page is displayed
      And the "status_text" textfield with "Navega libre de riesgos por Internet" text is displayed
      And the "title_one" textfield that contains the "Gratis" text is displayed
      And the "description_one" textfield that contains the "Sin permanencia ni compromisos." text is displayed
      And the "title_two" textfield that contains the "Navega seguro" text is displayed
      And the "description_two" textfield that contains the "Protege la navegación de tu línea móvil conectada a la red (3G/4G) de Movistar." text is displayed
      And the "title_three" textfield that contains the "Sin instalación" text is displayed
      And the "description_three" textfield that contains the "No requiere instalación en los dispositivos porque la protección se ofrece desde la red de Movistar." text is displayed
      And the "hire_conditions" link with "Puedes descargar en PDF un resumen de condiciones de contratación. Son vinculantes si completas la compra en este momento." text is displayed
      And the "activate_button" button with "Activar" text is displayed

  @jira.QANOV-35065 @android @automatic @cert2 @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881 @live @mobile
  @moves @next @regression
  Scenario: A user with more than one line and Conexión Segura Móvil in "deactivated" status can open the "Conexión segura Hire" deeplink
    internal_checkpoint="Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router"
    Given user has a "telco" account type
      And user does not have a "HGU router" resource
      And user has "several" mobile lines
      And user has the "secure_connection" service in "deactivated" status in more than "1" lines
     When opens the "Account.Conexion Segura Hire" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "0" element in the "lines.list" list
     Then the "Secure Connection Hire" page is displayed
      And the "Conexión Segura" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed

  @jira.QANOV-36674 @android @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881 @manual @mobile @moves
  @regression
  Scenario: A user with just one mobile line and Conexión Segura Móvil in "activated" status can open the "Conexión segura Management" deeplink
    internal_checkpoint="Just tested the deactivated casuistic in deeplinks because cannot be tested on other side of the app
    Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router"
    Given user has a "telco" account type
      And user does not have a "HGU router" resource
      And user has "1" mobile lines
      And user has the "secure_connection" service in "activated" status
     When opens the "Account.Conexion Segura Management" deeplink with the app in "killed" status
     Then the "Secure Connection" page is displayed
      And the "status_text" textfield with "Servicio activado" text is displayed
      And the "description" textfield that contains the "La navegación por Internet de tu línea de contrato móvil" text is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed
      And the "manage_button" button with "Gestionar" text is displayed

  @jira.QANOV-36675 @android @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881 @manual @mobile @moves @next
  @regression
  Scenario: A user with more than one line and Conexión Segura Móvil in "activated" status can open the "Conexión segura Management" deeplink
    internal_checkpoint="Differences between Conexión Segura Convergente and Conexión Segura Móvil:
    - Móvil: Without HGU router or mobile line with '#' tariff (monoline)
    - Convergente: With HGU router"
    Given user has a "telco" account type
      And user does not have a "HGU router" resource
      And user has "several" mobile lines
      And user has the "secure_connection" service in "activated" status in more than "1" lines
     When opens the "Account.Conexion Segura Management" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "0" element in the "lines.list" list
     Then the internal webview with "Conexión Segura" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @smoke
  Scenario Outline: A user can open "Speed Upgrade" deeplink
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has just one plan eligible for a "<speed_option>" speed upgrade
      And user has not upgraded the internet speed
     When opens the "Account.Speed Upgrade" deeplink with the app in "killed" status
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "<page_title>" text is displayed
      And the "subtitle" textfield with "Movistar sube la velocidad de tu fibra para que naveges sin límites aún más rápido." text is displayed
      And the "subtitle_with_link" textfield with "<page_text>" text is displayed
      And the "terms_conditions_link" link with "movistar.es/contratos" text is displayed
      And the "finish" button with "Finalizar" text is displayed

    Examples:
          | speed_option   | header              | page_title                             | page_text                                                                                                                                                                                                              | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | Sube la velocidad de tu fibra a 1 Gb   | Al continuar estas aceptando que la velocidad de navegación de tu fibra pase a ser de 1 Gb sin alterar ningún otro componente de tu producto. Puedes consultar las condiciones del producto que tienes contratado en   | QANOV-26134 |
          | 100Mb to 300Mb | Subida de velocidad | Sube la velocidad de tu fibra a 300 Mb | Al continuar estas aceptando que la velocidad de navegación de tu fibra pase a ser de 300 Mb sin alterar ningún otro componente de tu producto. Puedes consultar las condiciones del producto que tienes contratado en | QANOV-47757 |

  @jira.QANOV-26135 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario: A user not eligible to a Speed Upgrade can open "Speed Upgrade" deeplink: Error feedback is displayed
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has no plan eligible for a speed upgrade
     When opens the "Account.Speed Upgrade" deeplink with the app in "killed" status
     Then the "Speed Upgrade" page is displayed
      And the "Tus productos" header is displayed
      And the "informative_title" textfield with "Listado de productos" text is displayed
      And the "informative_message" textfield with "No tines disponible ningún producto para este proceso" text is displayed
      And the "go_to_account" button with "Ir a mi cuenta" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-26136 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario: A user eligible to a Speed Upgrade and with the promo already activated can open "Speed Upgrade" deeplink: Error feedback is displayed
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has just one plan eligible for a speed upgrade
      And user has already upgraded the internet speed
     When opens the "Account.Speed Upgrade" deeplink with the app in "killed" status
     Then the "Speed Upgrade" page is displayed
      And the "Tus productos" header is displayed
      And the "informative_title" textfield with "Se ha producido un error" text is displayed
      And the "informative_message" textfield with "No tines disponible ningún producto para este proceso" text is displayed
      And the "go_to_account" button with "Ir a mi cuenta" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario Outline: A user eligible to a Speed Upgrade and with the promo already activated but the change has not yet taken effect can open "Speed Upgrade" deeplink: Informative feedback is displayed
    other_affected_versions="2021-01"
    internal_checkpoint="As it could take between 24 and 48 hours to have this updated,
    we will disable the page in which customers can opt-in to the upgrade.
    So if customers access through any point such as deeplink, Explore, push notification, internet dashboard,
    the page will be disable."
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has just one plan eligible for a "<speed_option>" speed upgrade
      And user has already upgraded the internet speed but the change has not yet taken effect
     When opens the "Account.Speed Upgrade" deeplink with the app in "killed" status
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Ya habías solicitado el aumento de la velocidad a <upgrade_vale>" text is displayed
      And the "informative_message" textfield with "El cambio se hará efectivo en las próximas horas" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | speed_option   | header              | upgrade_vale | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | 1 Gb         | QANOV-26137 |
          | 100Mb to 300Mb | Subida de velocidad | 300 Mb       | QANOV-47758 |

  @jira.QANOV-26138 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario: A user with more than one plan eligible to a Speed upgrade can open "Speed Upgrade" deeplink: Disambiguation screen is displayed
    other_affected_versions=2021-01 2021-18
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has more than one plan eligible for a speed upgrade
     When opens the "Account.Speed Upgrade" deeplink with the app in "killed" status
     Then the "Disambiguation" page is displayed
      And the "disambiguation_products" list is displayed
      And each element in the "disambiguation_lines" list has the "line_number_or_name" field
      And each element in the "disambiguation_lines" list has the "plan_name" field

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario Outline: A user with more than one plan eligible to a Speed upgrade can open "Speed Upgrade" deeplink and selects a product: Speed Upgrade page is displayed
    other_affected_versions="2021-01"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has more than one plan eligible for a "<speed_option>" speed upgrade
     When opens the "Account.Speed Upgrade" deeplink with the app in "killed" status
      And the "Disambiguation" page is displayed
      And the "disambiguation_products" list is displayed
      And clicks on the "1" element in the "disambiguation_products" list
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed

    Examples:
          | speed_option   | header              | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | QANOV-26139 |
          | 100Mb to 300Mb | Subida de velocidad | QANOV-47759 |

  @jira.QANOV-44617 @android @automatic @cert2 @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-28881 @live @mobile
  @moves @next @regression
  Scenario: User who hasn't activated Movistar Cloud can access to Movistar Cloud deeplink
    other_affected_versions="2020-46-B"
    Given user has a "postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status
      And user has "1" mobile lines
     When opens the "Account.Movistar Cloud Hire" deeplink with the app in "killed" status
     Then the "Movistar Cloud Hire" page is displayed
      And the "Movistar Cloud" header is displayed
      And the "title" textfield with "Movistar Cloud" text is displayed
      And the "pre_title" textfield with "Instala y accede a la app de Movistar Cloud para activar el servicio." text is displayed
      And the "features" elements are displayed
      And the "button" button with "Ir a Movistar Cloud" text is displayed

  @jira.QANOV-35169 @android @automatic @cert2 @ios @jira.cv.11.14 @jira.link.detects.IOS-6933
  @jira.link.parent_test_plan.QANOV-28881 @live @mobile @moves @next @regression
  Scenario: User who has activated Movistar Cloud can access to Movistar Cloud Management deeplink
    other_affected_versions="2020-46-B"
    Given user has a "postpay" account type
      And user has the "movistar_cloud" service in "activated" status
     When opens the "Account.Movistar Cloud Management" deeplink with the app in "killed" status
     Then the "Movistar Cloud" page is displayed
      And the "Movistar Cloud" header is displayed
      And the "status_description" textfield with the "Ya puedes guardar las fotos, vídeos y documentos de tu línea \d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "pick_action_text" textfield with "¿Qué quieres hacer?" text is displayed
      And the "0" index in the "module_list" list has the "title" field with "Subir contenido a la nube" text
      And the "0" index in the "module_list" list has the "description" field with "Guarda tus recuerdos para que nunca se pierdan" text
      And the "1" index in the "module_list" list has the "title" field with "Libera espacio de tu móvil" text
      And the "1" index in the "module_list" list has the "description" field with "Borra el contenido que ya hayas subido a Movistar Cloud" text

  @jira.QANOV-47760 @android @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario: User who has activated Movistar Cloud can access to Movistar Cloud deeplink
    other_affected_versions="2020-51-B"
    Given user has a "postpay" account type
      And user has the "movistar_cloud" service in "activated" status
      And user has "1" mobile lines
     When opens the "Account.Movistar Cloud" deeplink with the app in "killed" status
     Then the "Movistar Cloud" page is displayed
      And the "Movistar Cloud" header is displayed
      And the "status_description" textfield with the "Ya puedes guardar las fotos, vídeos y documentos de tu línea \d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "pick_action_text" textfield with "¿Qué quieres hacer?" text is displayed
      And the "0" index in the "module_list" list has the "title" field with "Subir contenido a la nube" text
      And the "0" index in the "module_list" list has the "description" field with "Guarda tus recuerdos para que nunca se pierdan" text
      And the "1" index in the "module_list" list has the "title" field with "Libera espacio de tu móvil" text
      And the "1" index in the "module_list" list has the "description" field with "Borra el contenido que ya hayas subido a Movistar Cloud" text

  @jira.QANOV-47761 @android @automatic @cert2 @ios @jira.cv.11.15 @live @mobile @moves @next @qa @regression
  Scenario: User who has deactivated Movistar Cloud in a line can access to Movistar Cloud deeplink
    other_affected_versions="2020-51-B"
    Given user has a "postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in a line
      And user has "several" mobile lines
     When opens the "Account.Movistar Cloud" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And selects the matching line in the line disambiguation page
     Then the "Movistar Cloud Hire" page is displayed
      And the "Movistar Cloud" header is displayed
      And the "title" textfield with "Movistar Cloud" text is displayed
      And the "pre_title" textfield with "Instala y accede a la app de Movistar Cloud para activar el servicio." text is displayed
      And the "features" elements are displayed
      And the "button" button with "Ir a Movistar Cloud" text is displayed

  @jira.QANOV-49260 @android @impeded_legacy @ios @jira.cv.12.0 @jira.link.detects.MOVES-4895
  @jira.link.detects.NOVUMCC-4364 @mobile @moves @no_automatable @regression
  Scenario: User who has deactivated Movistar Cloud in several lines can access to Movistar Cloud Improved deeplink, only deactivated lines are displayed in disambiguation screen
    other_affected_versions="2021-03-b"
    internal_checkpoint="User in PROD: 05960856S"
    Given user has a "legado postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in more than "1" lines
      And user has the "movistar_cloud" service in "activated" status in a line
      And user has ">1" mobile lines
     When opens the "Account.Movistar Cloud Improved" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And only the "deactivated" lines are displayed in the "line.list" list

  @jira.QANOV-49261 @android @impeded_legacy @ios @jira.cv.12.0 @jira.link.detects.MOVES-4895
  @jira.link.detects.NOVUMCC-4364 @mobile @moves @no_automatable @regression
  Scenario: User who has deactivated Movistar Cloud in a line can access to Movistar Cloud Improved deeplink, Movistar Cloud page is displayed
    other_affected_versions="2021-03-b"
    Given user has a "legado postpay" account type
      And user has the "movistar_cloud" service in "deactivated" status in a line
      And user has the "movistar_cloud" service in "activated" status in a line
      And user has ">1" mobile lines
     When opens the "Account.Movistar Cloud Improved" deeplink with the app in "killed" status
     Then the "Movistar Cloud" page is displayed
      And the "Movistar Cloud" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves @regression
  Scenario Outline: A user who hasn't purchased a Game Pass Ultimate (GPU) product opens the "Account.GPU purchase" deeplink: GPU purchase webview is displayed
    The Game Pass product can only be purchased by:
    - Telco with a Fusión
    - Telco with a postpay mobile line
    - Titular / titular light
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user does not have purchased any Game Pass Ultimate subscription
      And user has the matching subscription selected in the account
     When opens the "Account.GPU purchase" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "navigation_top_bar.url" inputtext that contains the "game-pass-ultimate" text is displayed

    Examples:
          | plan           | jira_id      |
          | fusion;pikolin | QANOV-116178 |
          | monoline       | QANOV-116179 |

  @jira.QANOV-116180 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves
  @regression
  Scenario: A user with 1/several Game Pass Ultimate (GPU) subscription/s opens the "Account.GPU purchase" deeplink: GPU purchase webview is displayed
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has purchased ">0" Game Pass Ultimate subscriptions
      And user has the matching subscription selected in the account
      And user is in the "Profile" page
     When opens the "Account.GPU purchase" deeplink with the app in "killed" status
     Then the internal webview with "Compra segura - Movistar" header is displayed
      And the "Quiero contratar Xbox Game Pass Ultimate" string is displayed

  @jira.QANOV-116181 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves
  @regression
  Scenario: A user with 1/several Game Pass Ultimate (GPU) subscription/s opens the "Account.GPU add subscription" deeplink: GPU add subscription webview is displayed
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has purchased ">0" Game Pass Ultimate subscriptions
      And user has the matching subscription selected in the account
      And user is in the "Profile" page
     When opens the "Account.GPU add subscription" deeplink with the app in "killed" status
     Then the internal webview with "Compra segura - Movistar" header is displayed
      And the "Quiero contratar Xbox Game Pass Ultimate" string is displayed

  @jira.QANOV-116182 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves
  @regression
  Scenario: A user with just one Game Pass Ultimate (GPU) subscription opens the "Account.GPU view details" deeplink: GPU details webview is displayed
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has purchased "1" Game Pass Ultimate subscriptions
      And user has the matching subscription selected in the account
      And user is in the "Profile" page
     When opens the "Account.GPU view details" deeplink with the app in "killed" status
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Xbox Game Pass Ultimate" string is displayed

  @jira.QANOV-116183 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves
  @regression
  Scenario: A user with several Game Pass Ultimate (GPU) subscriptions opens the "Account.GPU view details" deeplink: disambiguation screen is displayed
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has purchased ">1" Game Pass Ultimate subscriptions
      And user has the matching subscription selected in the account
      And user is in the "Profile" page
     When opens the "Account.GPU view details" deeplink with the app in "killed" status
     Then the "Subscription Disambiguation" page is displayed
      And the "subscriptions" list is displayed
      And all the subscriptions purchased are displayed in the "subscriptions" list
      And each element in the "subscriptions" list has the "icon" field
      And each element in the "subscriptions" list has the "product_name" textfield with "Game Pass Ultimate" text
      And each element in the "subscriptions" list has the "subscription_name" field
      And each element in the "subscriptions" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-116184 @android @ios @jira.cv.12.5 @jira.link.depends_on.QANOV-116183
  @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves @regression
  Scenario: A user with several Game Pass Ultimate (GPU) subscriptions who is in disambiguation screen selects a subscription
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has purchased ">1" Game Pass Ultimate subscriptions
      And user has the matching subscription selected in the account
     When opens the "Account.GPU view details" deeplink with the app in "killed" status
      And the "Subscription Disambiguation" page is displayed
      And clicks on the "0" element in the "subscriptions" list
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Xbox Game Pass Ultimate" string is displayed

  @jira.QANOV-116185 @android @ios @jira.cv.12.5 @jira.link.depends_on.QANOV-116184
  @jira.link.parent_test_plan.QANOV-114881 @manual @mobile @moves @regression
  Scenario: A user with several Game Pass Ultimate (GPU) subscriptions who is in disambiguation screen after having selected a subscription, can pick a different one
    other_affected_versions="2021-30"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has purchased ">1" Game Pass Ultimate subscriptions
      And user has the matching subscription selected in the account
     When opens the "Account.GPU view details" deeplink with the app in "killed" status
      And the "Subscription Disambiguation" page is displayed
      And clicks on the "0" element in the "subscriptions" list
      And the browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Subscription Disambiguation" page is displayed
      And clicks on the "1" element in the "subscriptions" list
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Xbox Game Pass Ultimate" string is displayed

  @jira.QANOV-134680 @android @ios @jira.cv.12.5 @manual @mobile @moves @regression
  Scenario: A prepay user with monoline plan can open the "Bundle Purchase" deeplink
    other_affected_versions="2021-37"
    Given user has a "monoline" plan
      And user has a "prepay" account type
     When opens the "Account.Bundle Purchase" deeplink with the app in "killed" status
     Then the "Bundle Purchase" page is displayed
      And the "Compra de bonos" header is displayed
      And the "balance_title" textfield with "Tu saldo" text is displayed
      And the "balance_amount" textfield with the "\d+,\d\d €" format is displayed
      And the "pick_bundle" textfield with "Selecciona un bono" text is displayed
      And each element in the "bundle_list" list has the "name" field
      And each element in the "bundle_list" list has the "more_info" textfield with "Más info" text
      And each element in the "bundle_list" list has the "price" textfield with the "\d+,\d\d €" format
      And each element in the "bundle_list" list has the "select" textfield with "Seleccionar" text
      And the "secure_site" textfield with "100% seguro" text is displayed

  @jira.QANOV-269730 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-260586 @manual @mobile @moves
  @regression
  Scenario: A user with one deactivated mobile line can open the "Account.Mobile Lines Activation" deeplink: "Mobile Line Activation" page is displayed
    Given user has "1" mobile lines in "deactivated" status
     When opens the "Account.Mobile Lines Activation" deeplink with the app in "killed" status
     Then the "Mobile Line Activation" page is displayed
      And the "Líneas móviles" header is displayed
      And the "info_image" image is displayed
      And the "title" textfield that contains the "Caracterísiticas de tu tarifa" text is displayed
      And the "description" textfield is displayed
      And the "button" button with "Activar línea" text is displayed

  @jira.QANOV-360683 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-260586 @mobile @moves @regression
  Scenario: A user with landline can access to the NT deeplink
    other_affected_versions="2021-10"
    Given user has a "landline" product
      And opens the "Account.NT" deeplink with the app in "killed" status
     Then the "Mis Tokens" page is displayed
      And the "Mis tokens" header is displayed
      And the "my_tokens_page.button" button is displayed

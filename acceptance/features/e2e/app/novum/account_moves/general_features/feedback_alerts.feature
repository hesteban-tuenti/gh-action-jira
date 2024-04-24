# -*- coding: utf-8 -*-
@jira.QANOV-26109
Feature: Feedback alerts

  Actions Before each Scenario:
    Given user has the "alerts" module configured in CMS for "dashboard" page


  @jira.<jira_id> @android @automation.hard @impeded_legacy @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222
  @manual @mobile @moves @regression
  Scenario Outline: Legado user eligible to a <speed_option> upgrade can see the speed upgrade alert on the Account dashboard
    alert_name: internet-speed-upgrade-available
    other_affected_versions="2021-01"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has not upgraded the internet speed
      And user has not closed the "speed_upgrade_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "speed_upgrade_alert.alert" element is on display
      And the "speed_upgrade_alert.title" textfield with "<alert_title>" text is displayed
      And the "speed_upgrade_alert.text" textfield with "<alert_text>" text is displayed
      And the "speed_upgrade_alert.link" link with "Sube ahora" text is displayed
      And the "speed_upgrade_alert.info_icon" icon is displayed
      And the "speed_upgrade_alert.close_button" button is displayed

    Examples:
          | speed_option | alert_title                           | alert_text                                                                | jira_id     |
          | 600Mb to 1Gb | Aún no has subido tu fibra hasta 1 Gb | Activa ya la subida de velocidad para navegar sin límites aún más rápido. | QANOV-26110 |

    @impeded_mock
    Examples:
          | speed_option   | alert_title                         | alert_text                                                                | jira_id     |
          | 100Mb to 300Mb | Aún no has subido tu fibra a 300 Mb | Activa ya la subida de velocidad para navegar sin límites aún más rápido. | QANOV-47747 |

  @jira.<jira_id> @android @automation.hard @impeded_legacy @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222
  @manual @mobile @moves @regression
  Scenario Outline: Legado user eligible to <speed_option> upgrade can access to the Speed Upgrade page from the alert CTA
    User: FIC28640 / telco2020
    alert_name: internet-speed-upgrade-available
    other_affected_versions="2021-01"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has not upgraded the internet speed
      And user has not closed the "speed_upgrade_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "speed_upgrade_alert.link" link
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "<page_title>" text is displayed
      And the "subtitle" textfield with "<page_subtitle>" text is displayed
      And the "subtitle_with_link" textfield with "<page_text>" text is displayed
      And the "terms_conditions_link" link with "movistar.es/contratos" text is displayed
      And the "finish" button with "Finalizar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | speed_option | header              | page_title                               | page_subtitle                                                                 | page_text                                                                                                                                                                                                            | jira_id     |
          | 600Mb to 1Gb | Subida de velocidad | Sube la velocidad de tu fibra hasta 1 Gb | Navega sin límites aún más rápido y disfruta de la máxima velocidad en fibra. | Al continuar estas aceptando que la velocidad de navegación de tu fibra pase a ser de 1 Gb sin alterar ningún otro componente de tu producto. Puedes consultar las condiciones del producto que tienes contratado en | QANOV-26113 |

    @impeded_mock
    Examples:
          | speed_option   | header              | page_title                             | page_subtitle                                                                       | page_text                                                                                                                                                                                                              | jira_id     |
          | 100Mb to 300Mb | Subida de velocidad | Sube la velocidad de tu fibra a 300 Mb | Movistar sube la velocidad de tu fibra para que naveges sin límites aún más rápido. | Al continuar estas aceptando que la velocidad de navegación de tu fibra pase a ser de 300 Mb sin alterar ningún otro componente de tu producto. Puedes consultar las condiciones del producto que tienes contratado en | QANOV-47749 |

  @jira.<jira_id> @android @automation.hard @impeded_legacy @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario Outline: Legado ADMIN who had already updated the Internet Speed <speed_option> but the change has not yet taken effect: can see the speed upgrade alert on the Account dashboard
    alert_name: internet-speed-upgrade-available
    other_affected_versions="2021-01"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has already upgraded the internet speed but the change has not yet taken effect
      And user has not closed the "speed_upgrade_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "speed_upgrade_alert.alert" element is on display
      And the "speed_upgrade_alert.title" textfield with "<alert_title>" text is displayed
      And the "speed_upgrade_alert.text" textfield with "<alert_text>" text is displayed
      And the "speed_upgrade_alert.link" link with "Sube ahora" text is displayed
      And the "speed_upgrade_alert.info_icon" icon is displayed
      And the "speed_upgrade_alert.close_button" button is displayed

    Examples:
          | speed_option   | alert_title                         | alert_text                                                                | jira_id     |
          | 600Mb to 1Gb   | Aún no has subido tu fibra a 1 Gb   | Activa ya la subida de velocidad para navegar sin límites aún más rápido. | QANOV-26114 |
          | 100Mb to 300Mb | Aún no has subido tu fibra a 300 Mb | Activa ya la subida de velocidad para navegar sin límites aún más rápido. | QANOV-47750 |

  @jira.<jira_id> @android @automation.hard @impeded_legacy @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario Outline: Legado ADMIN who had already updated the Internet Speed <speed_option> but the change has not yet taken effect clicks on the alert CTA: The informative page is displayed
    alert_name: internet-speed-upgrade-available
    other_affected_versions="2021-01"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has already upgraded the internet speed but the change has not yet taken effect
      And user has not closed the "speed_upgrade_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "speed_upgrade_alert.link" link
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Ya habías solicitado el aumento de la velocidad a <upgrade_vale>" text is displayed
      And the "informative_message" textfield with "El cambio se hará efectivo en las próximas horas" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | speed_option   | header              | upgrade_vale | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | 1 Gb         | QANOV-26115 |
          | 100Mb to 300Mb | Subida de velocidad | 300 Mb       | QANOV-47751 |

  @jira.QANOV-26116 @android @automation.hard @impeded_legacy @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-25222 @manual @mobile @moves @regression
  Scenario: Legado ADMIN who has already updated the Internet Speed won't see the speed upgrade alert on the Account dashboard
    alert_name: internet-speed-upgrade-available
    other_affected_versions="2021-01"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has a plan eligible for a speed upgrade
      And user has already upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "speed_upgrade_alert.alert" element is not on display

  @jira.QANOV-26118 @android @automation.hard @impeded_legacy @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-25222
  @manual @mobile @moves @regression
  Scenario: ADMIN user NOT eligible for a Speed Upgrade won't see the speed upgrade alert on the Account dashboard
    alert_name: internet-speed-upgrade-available
    other_affected_versions="2021-01"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has not a plan eligible for a speed upgrade
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "speed_upgrade_alert.alert" element is not on display

  @jira.<jira_id> @android @automation.hard @impeded_legacy @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-25222
  @manual @mobile @moves @regression
  Scenario Outline: Admin or admin-light user eligible to <speed_option> upgrade wont see the alert after after completing the activation flow
    alert_name: internet-speed-upgrade-available
    If the activation is not effective, the alert will appear again 24 hours after its closure
    other_affected_versions="2021-09"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "internet" product
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Internet speed upgrade available" preconfiguration
      And user has a plan eligible for a "<speed_option>" speed upgrade
      And user has not upgraded the internet speed
      And user has not closed the "speed_upgrade_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "speed_upgrade_alert.link" link
      And the "Speed Upgrade" page is displayed
      And clicks on the "finish" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed
      And the "speed_upgrade_alert.alert" element is not on display

    Examples:
          | speed_option   | jira_id     |
          | 600Mb to 1Gb   | QANOV-65800 |
          | 100Mb to 300Mb | QANOV-65801 |

  @jira.QANOV-68948 @android @automation.hard @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288
  @manual @mobile @moves @smoke
  Scenario: Legado FUSION with renting device user who didn't choose a renting device will see an alert advising him to choose one
    Sin terminal R2R elegido: FIC54828 / Atlas2021
    alert_name: renting-device-available-alert-id
    audience: renting-device-available-for-plan
    other_affected_versions="2021-14-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "renting-device-available-for-plan" audience
      And user has not closed the "device_renting_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "device_renting_alert.alert" element is on display
      And the "device_renting_alert.title" textfield with "Ya puedes elegir tu dispositivo" text is displayed
      And the "device_renting_alert.text" textfield with "Selecciona ahora el dispositivo incluido en tu nuevo plan Fusión." text is displayed
      And the "device_renting_alert.link" link with "Elegir dispositivo" text is displayed
      And the "device_renting_alert.info_icon" icon is displayed
      And the "device_renting_alert.close_button" button is displayed

  @jira.QANOV-68949 @android @automation.hard @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288
  @manual @mobile @moves @regression
  Scenario: ADMIN Legado FUSION with renting device and who didn't choose a renting device taps on the Device Renting Alert link: Informative page is displayed
    Sin terminal R2R elegido: FIC54828 / Atlas2021
    alert_name: renting-device-available-alert-id
    audience: renting-device-available-for-plan
    other_affected_versions="2021-14-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "renting-device-available-for-plan" audience
      And user has not closed the "device_renting_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device_renting_alert.link" button
     Then the browser webview with "Elegir dispositivo" text in the header is displayed
      And the "Select Device" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Ya puedes elegir tu dispositivo" text is displayed
      And the "informative_message" textfield is displayed
      And the "informative_button" button with "Elegir dispositivo" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed
      And the communications and leisure content is displayed

  @jira.QANOV-68950 @android @automation.hard @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288
  @manual @mobile @moves @regression
  Scenario: ADMIN Legado FUSION with renting device who accessed to the 'Elegir dispositivo' page from the Device Renting Alert taps on the 'informative_button' button: Modal webview is displayed
    Sin terminal R2R elegido: FIC54828 / Atlas2021
    alert_name: renting-device-available-alert-id
    audience: renting-device-available-for-plan
    other_affected_versions="2021-14-B"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "renting-device-available-for-plan" audience
      And user has not closed the "device_renting_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device_renting_alert.link" button
      And the "Select Device" page is displayed
      And clicks on the "informative_button" button
     Then the internal webview is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "smartphone libre incluido" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed
      And the communications and leisure content is displayed

  @jira.QANOV-68951 @android @automation.hard @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288
  @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT Legado FUSION with renting device who accessed to the 'Elegir dispositivo' page from the Device Renting Alert taps on the 'informative_button' button: Login Escalation Required screen is displayed
    Sin terminal R2R elegido: FIC54828 / Atlas2021
    alert_name: renting-device-available-alert-id
    audience: renting-device-available-for-plan
    other_affected_versions="2021-14-B"
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "renting-device-available-for-plan" audience
      And user has not closed the "device_renting_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device_renting_alert.link" button
      And the "Select Device" page is displayed
      And clicks on the "informative_button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-144889 @android @automation.hard @impeded_legacy @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @manual @mobile @moves @smoke
  Scenario: Legado FUSION user with a renting device consolidated and with an additional device offered will see an alert advising him to choose other device
    Con terminal R2R recibido: FIC60593 / CPruebasFIC60593
    alert_name: additional-renting-device-available-alert-id
    audience: can-have-another-renting-device
    other_affected_versions="2021-43"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "in_progress" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "can-have-another-renting-device" audience
      And user has not closed the "device_renting_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "device_renting_alert.alert" element is on display
      And the "device_renting_alert.title" textfield with "Elige tu dispositivo adicional" text is displayed
      And the "device_renting_alert.text" textfield with "Ya puedes añadir un dispositivo adicional a tu Fusión a un precio especial" text is displayed
      And the "device_renting_alert.link" link with "Elegir dispositivo" text is displayed
      And the "device_renting_alert.info_icon" icon is displayed
      And the "device_renting_alert.close_button" button is displayed

  @jira.QANOV-144890 @android @automation.hard @impeded_legacy @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @manual @mobile @moves @regression
  Scenario: ADMIN Legado FUSION user with a renting device consolidated and with an additional device offered taps on the Device Renting Alert link: OB webview is displayed
    Con terminal R2R recibido: FIC60593 / CPruebasFIC60593
    alert_name: additional-renting-device-available-alert-id
    audience: can-have-another-renting-device
    OB webview ID: eleccion_terminal_adicional_fusion
    other_affected_versions="2021-43"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a "fusion" plan with a renting device
      And user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "in_progress" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "can-have-another-renting-device" audience
      And user has not closed the "device_renting_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device_renting_alert.link" button
     Then the browser webview with "Compra dispositivo con Fusión" text in the header is displayed
      And the "Elige el dispositivo que quieres añadir al Fusión que has contratado" string is displayed
      And the "Dispositivos adicionales" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed
      And the communications and leisure content is displayed

  @jira.QANOV-144891 @android @automation.hard @impeded_legacy @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT Legado FUSION user with a renting device consolidated and with an additional device offered taps on the Device Renting Alert link: Login Escalation Required screen is displayed
    Con terminal R2R recibido: FIC60593 / CPruebasFIC60593
    alert_name: additional-renting-device-available-alert-id
    audience: can-have-another-renting-device
    other_affected_versions="2021-43"
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has a "fusion" plan with a renting device
      And user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "in_progress" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "can-have-another-renting-device" audience
      And user has not closed the "device_renting_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device_renting_alert.link" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-68952 @android @automation.hard @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: Legado FUSION with renting device user who already choose all the offered renting devices won't see an alert advising him to choose one
    Con terminal R2R recibido: FIC60593 / CPruebasFIC60593
    alert_name: additional-renting-device-available-alert-id
    audience: can-have-another-renting-device
    other_affected_versions="2021-14-B 2021-26-B 2021-35 2021-43"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "offered" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has a "manual" provider
      And the alert configured in CMS has the "can-have-another-renting-device" audience
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "device_renting_alert" alert is not displayed

  @jira.QANOV-144892 @android @automation.hard @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: Legado FUSION with renting device user who has any r2r device in progress (pedido en vuelo) won't see an alert advising him to choose one
    FIC49725 / Rojo2021
    other_affected_versions="2021-14-B 2021-26-B 2021-35 2021-43"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has ">0" renting devices in "in_progress" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "device_renting_alert" alert is not displayed

  @jira.QANOV-144893 @android @impeded_legacy @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471 @manual @mobile
  @moves @regression
  Scenario: Legado FUSION with renting device user who already choose the two renting devices won't see an alert advising him to choose one
    It is assumed that the 4P APIs once the user have 2 R2R devices as consolidated, they will not return more devices as offerable
    other_affected_versions="2021-43"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "2" renting devices in "received" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "device_renting_alert" alert is not displayed

  @jira.QANOV-7414 @android @automation.pending_mock @impeded_legacy @ios @jira.cv.11.7
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-202290 @manual @mobile @moves @regression
  Scenario: User who has contracted an unlimited tariff and has data sharing deactivated can see an alert in her Account dashboard about the new unlimited tariff
    alert_name: enjoy-unlimited-data
    Given user has a "legado" account type
      And user has an unlimited tariff in "any" of the mobile lines
      And user has "data_sharing" service in "deactivated" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Enjoy unlimited data" preconfiguration
      And user has not closed the "unlimited_data" alert in "never" hours
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "unlimited_data.alert" element is on display
      And the "unlimited_data.title" textfield with "Ahora tienes datos ilimitados" text is displayed
      And the "unlimited_data.text" textfield with "Mantente siempre conectado con datos infinitos" text is displayed
      And the "unlimited_data.close_button" button is displayed
      And the "unlimited_data.link" link is not displayed

  @jira.QANOV-7422 @android @automation.pending_mock @impeded_legacy @impeded_mock @ios @jira.cv.11.7
  @jira.link.depends_on.QANOV-7417 @jira.link.depends_on.QANOV-7420 @jira.link.depends_on.QANOV-7429
  @jira.link.depends_on.QANOV-7432 @jira.link.depends_on.QANOV-7453 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-202299 @manual @mobile @moves @regression
  Scenario: User taps on the "Gestionar datos" link of the alert to deactivate Data sharing
    alert_name: deactivate-data-sharing-v2
    Given user has a "legado" account type
      And user has an unlimited tariff in "all" of the mobile lines
      And user has "data_sharing" service in "activated" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Check unlimited data" preconfiguration
      And user has not closed the "unlimited_data" alert in "never" hours
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "unlimited_data.link" link
     Then the "Data Management" page is displayed
      And the "data_sharing_activate" module is displayed
      And the "data_sharing_activate.manage" button with "Desactivar" text is displayed

  @jira.QANOV-7424 @android @automation.pending_mock @impeded_legacy @ios @jira.cv.11.7
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-202314 @manual @mobile @moves @regression
  Scenario: User who has contracted an unlimited tariff and has data sharing deactivated can see an alert in the Mobile line dashboard about the new unlimited tariff
    alert_name: enjoy-unlimited-data
    Given user has a "legado" account type
      And user has an unlimited tariff in "all" of the mobile lines
      And user has "data_sharing" service in "deactivated" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Enjoy unlimited data" preconfiguration
      And user has not closed the "unlimited_data" alert in "never" hours
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "any" mobile line
     Then the "Mobile Line Dashboard" is displayed
      And the "unlimited_data.title" textfield with "Ahora tienes datos ilimitados" text is displayed
      And the "unlimited_data.text" textfield with "Mantente siempre conectado con datos infinitos" text is displayed
      And the "unlimited_data.close_button" button is displayed
      And the "unlimited_data.link" link is not displayed

  @jira.QANOV-7440 @android @impeded_legacy @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-202318 @mobile @moves @no_automatable @regression
  Scenario: Legados user who has contracted an unlimited tariff and has data sharing activated wont see any alert on the Account dashboard about deactivate Data Sharing
    alert_name: deactivate-data-sharing-v2
    Given user has a "legado" account type
      And user has an unlimited tariff in "any" of the mobile lines
      And user has "data_sharing" service in "activated" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Check unlimited data" preconfiguration
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "unlimited_data.alert" element is not on display

  @jira.QANOV-7447 @android @impeded_legacy @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-202319 @mobile @moves @no_automatable @regression
  Scenario: Legados user who has contracted an unlimited tariff and has data sharing activated wont see any alert on the Mobile Line Dashboard about deactivate Data Sharing
    alert_name: deactivate-data-sharing-v2
    Given user has a "legado" account type
      And user has an unlimited tariff in "any" of the mobile lines
      And user has "data_sharing" service in "activated" status
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "Check unlimited data" preconfiguration
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page
     Then the "unlimited_data.alert" element is not on display

  @jira.QANOV-9322 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-9320
  @jira.link.relates_to.NOV-119889 @mobile @moves @no_automatable @regression
  Scenario: User does not have enough credit to buy any bundle: An alert is shown
    Given user has a "legado prepay" account type
      And user does not have balance enough to buy any of the bundles
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase" page
     Then each element in the "bundle_list" list has the "select" disabled
      And the "alert" alert is displayed
      And the "alert.title" textfield with "No tienes saldo suficiente" text is displayed
      And the "alert.text" textfield with "No tienes saldo suficiente para comprar este bono. Haz una recarga de saldo ahora." text is displayed
      And the "alert.link" link with "Recargar saldo" text is displayed
      And the "alert.close" icon is displayed

  @jira.QANOV-377186 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @regression
  Scenario: User with unpaid debt can see an alert
    Given user has a "telco postpay" account type
      And user has "upaid" debt
      And user has the matching subscription selected in the account
      And user is in the "Invoices" page
     Then the "alert" alert is displayed
      And the "alert.icon" icon is displayed
      And the "alert.title" textfield with "Tienes facturas pendientes de pago que puedes abonar a continuación" text is displayed
      And the "alert.link" link with "Pagar facturas" text is displayed
      And the "alert.close" icon is displayed

  @jira.QANOV-377187 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @regression
  Scenario: User with payable documents can see an alert
    Given user has a "telco postpay" account type
      And user has "pending" payable documents
      And user has the matching subscription selected in the account
      And user is in the "Invoices" page
     Then the "alert" alert is displayed
      And the "alert.icon" icon is displayed
      And the "alert.title" textfield with "Tienes facturas pendientes de pago que puedes abonar a continuación" text is displayed
      And the "alert.link" link with "Pagar facturas" text is displayed
      And the "alert.close" icon is displayed

  @jira.QANOV-525449 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user can see an alert on the Account dashboard informing that the App won't be available for his kind of user
    Given user has a "legado" account type
      And user is in the "Account" page
     Then the "alert" alert is displayed
      And the "alert.title" textfield with "Cierre de acceso a la app" text is displayed
      And the "alert.text" textfield with "Desde el día 02/2/2024 no podrás acceder a la app Mi Movistar. Tenemos una alternativa para ti." text is displayed
      And the "alert.link" link with "Más información" text is displayed
      And the "alert.close" icon is displayed

  @jira.QANOV-525450 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user can click on the 'Más información' link of the 'Legados deprecation' alert: "Legacy Deprecation Informative" page is displayed
    Given user has a "legado" account type
      And user is in the "Account" page
     When clicks on the "alert.link" link
     Then the "Legacy Deprecation Informative" page is displayed
      And the "warning_image" icon is displayed
      And the "title" textfield with "Cierre de acceso a la app" text is displayed
      And the "description" textfield that contains the "Lo sentimos, a partir del 02/2/2024 ya no podrás acceder a la app Mi Movistar." text is displayed
      And the "description" textfield that contains the "Como alternativa, te proponemos que entres en movistar.es con tu usuario y contraseña habituales." text is displayed
      And the "button" button with "Entendido" text is displayed

  @jira.QANOV-525451 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user can click on the 'Entendido' button in the 'Legacy Deprecation Informative' page
    Given user has a "legado" account type
      And user is in the "Account" page
     When clicks on the "alert.link" link
      And the "Legacy Deprecation Informative" page is displayed
      And clicks on the "button" button
     Then the "Account" page is displayed

  @jira.QANOV-525452 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user can close the 'Legados deprecation' alert
    Given user has a "legado" account type
      And user is in the "Account" page
      And the "alert" alert is displayed
     When clicks on the "alert.close" button
     Then the "alert" alert is not displayed

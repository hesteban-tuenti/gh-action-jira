# -*- coding: utf-8 -*-
@jira.QANOV-68943
Feature: Rented Device Roundel


  @jira.QANOV-96934 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @no_automatable @mobile @moves @regression
  @impeded_legacy
  Scenario: ADMIN-LIGHT LEGADO FUSION with renting device who accessed to the 'Elegir dispositivo' page from the "Device" Roundel taps on the 'informative_button' button: Login Escalation Required screen is displayed
    TELCO
    Sin terminal R2R elegido: FIC54828 / Atlas2021
    Legado
    Sin terminal R2R elegido: 53767270D (Shadow) - light: 615184326
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
      And the "Select Device" page is displayed
      And clicks on the "informative_button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-96936 @android @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @mobile @moves
  @no_automatable @smoke
  Scenario: legado postpay FUSION with a received renting device taps on the "Device" Roundel: Device page is displayed with the Device Renting module
    Legado
    Con terminal R2R recibido: 49737985W (Shadow)
    start_date format: Fecha de pedido: 00/00/0000
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "1" renting devices in "received" status
      And user has "0" renting devices in "in_progress" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
     Then the "Device" page is displayed
      And the "Detalle de terminal" header is displayed
      And the "rented_device" module is displayed
      And the "rented_device.device_model" textfield is displayed
      And the "rented_device.start_date" textfield with the "Fecha de pedido: (0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[0-2])\/(20\d\d)" format is displayed
      And the "rented_device.associate_line" textfield with the "Línea asociada: \d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "rented_device.monthly_fee" textfield with the "\d*(,\d\d)?€/ mes (impuestos no incl.)" format is displayed
      And the "rented_device.link" textfield with "Ver condiciones" text is displayed

  @jira.QANOV-96937 @android @impeded_mock @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @mobile @moves
  @no_automatable @regression
  Scenario: Legado postpay FUSION with a received renting device with end_date can see the field in the 'Device module'
    Legado
    Con terminal R2R recibido: 49737985W (Shadow)
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "1" renting devices in "received" status
      And user has "0" renting devices in "in_progress" status
      And the user has "end_date" in the rented device
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
     Then the "Device" page is displayed
      And the "Detalle de terminal" header is displayed
      And the "rented_device" module is displayed
      And the "rented_device.end_date" textfield with the "Fecha fin de arrendamiento: (0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[0-2])\/(20\d\d)" format is displayed

  @jira.QANOV-96938 @android @impeded_mock @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @mobile @moves
  @no_automatable @regression
  Scenario: legado postpay FUSION with a received renting device taps on the 'Device module' link: PDF file with the reting conditions is displayed on Android devices
    Legado
    Con terminal R2R recibido: 49737985W (Shadow)
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "1" renting devices in "received" status
      And user has "0" renting devices in "in_progress" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
      And the "Device" page is displayed
      And clicks on the "rented_device.link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And the "CONDICIONES" string is displayed

  @jira.QANOV-96939 @impeded_mock @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @mobile @moves
  @no_automatable @regression
  Scenario: legado postpay FUSION with a received renting device taps on the 'Device module' link: PDF file with the reting conditions is displayed on iOS devices
    Legado
    Con terminal R2R recibido: 49737985W (Shadow)
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "1" renting devices in "received" status
      And user has "0" renting devices in "in_progress" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
      And the "Device" page is displayed
      And clicks on the "rented_device.link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And the "CONDICIONES" string is displayed

  @jira.QANOV-75182 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @no_automatable @mobile @moves
  @regression @impeded_legacy
  Scenario: Legado Postpay user with an OLD FUSION plan without renting device cannot see the 'Device' roundel in the Account dashboard
    Legado
    Antiguo portfolio: 09187017N/ temporal2021, 50444875X / perrorojo
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has the communications and leisure content displayed
      And user does not have a "fusion" plan with a renting device
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "device.icon" icon is not displayed
      And the "device.label" textfield is not displayed

  @jira.QANOV-99442 @android @impeded_mock @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @mobile @moves
  @no_automatable @regression
  Scenario: Legado postpay user with a FUSION plan with a renting device in "in progress" status taps on the "Device" Roundel: Device Rent In Process CMS dynamic page is displayed
    Note that at the moment for renting devices with cost > 0€ (Non default device) cannot check
    if the rented device is chosen or not, so at the moment, the experience for this kind of users will be like the non chosen Device
    Pedido en vuelo (Drop 1) Legado
    other_affected_versions="2021-26-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "received" status
      And user has "1" renting devices in "in_progress" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
     Then the "Device Rent In Process Legado" CMS page is displayed
      And the "Device" header is displayed
      And the "button" button with "Entendido" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-99443 @android @impeded_mock @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @mobile @moves
  @no_automatable @regression
  Scenario: Legado postpay user with a FUSION plan with a renting device in "in progress" status taps on the "Entendido" button in the Device Rent In Process CMS page: user goes back to account page
    Note that at the moment for renting devices with cost > 0€ (Non default device) cannot check
    if the rented device is chosen or not, so at the moment, the experience for this kind of users will be like the non chosen Device
    Pedido en vuelo (Drop 1) Legado
    other_affected_versions="2021-26-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "received" status
      And user has "1" renting devices in "in_progress" status
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Device Rent In Process Legado" CMS page
     When clicks on the "button" button
     Then the "Account" page is displayed

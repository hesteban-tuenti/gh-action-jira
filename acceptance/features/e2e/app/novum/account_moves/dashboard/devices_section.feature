# -*- coding: utf-8 -*-
@jira.QANOV-325838
Feature: Devices section


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @qa
  @webapp
  Scenario Outline: User can see the devices module in the main dashboard page if have <num_devices> number of devices and with r2r
    Given user has "<num_devices>" products of "r2r_device;equipment" type
      And user has ">0" products of "r2r_device" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
      And waits until the "devices_module.title" element is visible
     Then the "devices_module_title" textfield is displayed
      And the "devices_module.icon" icon is displayed
      And the "devices_module.title" textfield with "Dispositivos y equipamiento" text is displayed
      And the "devices_module.products_list" list is displayed
      And the "devices_module.products_list" list has "<num_rows>" elements
      And each element in the "devices_module.products_list" list has the "icon" field
      And each element in the "devices_module.products_list" list has the "title" field
      And each element in the "devices_module.products_list" list has the "chevron" field
      And the "devices_module.link" link with the "<link_text>" format is displayed
      And the "devices_module.button" button is not displayed

    @ber @sanity
    Examples:
          | num_devices | num_rows | link_text       | jira_id      |
          | 2           | 2        | Más información | QANOV-325839 |

    @smoke
    Examples:
          | num_devices | num_rows | link_text         | jira_id      |
          | 3           | 3        | Más información   | QANOV-325840 |
          | >3          | 3        | Ver todos \(\d+\) | QANOV-325841 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @regression
  Scenario Outline: User can see the devices module in the main dashboard page if they have <num_equipments> number of equipments with r2r
    Given user has "<num_equipments>" products of "equipment" type
      And user has "0" products of "r2r_device" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
      And waits until the "devices_module.title" element is visible
     Then the "devices_module_title" textfield is displayed
      And the "devices_module.icon" icon is displayed
      And the "devices_module.title" textfield with "Dispositivos y equipamiento" text is displayed
      And the "devices_module.products_list" list is displayed
      And the "devices_module.products_list" list has "<num_rows>" elements
      And the element in "0" position in the "devices_module.products_list" list has the "label" field
      And the element in "0" position of the "devices_module.products_list" list has the "label" field with "yellow" color
      And each element in the "devices_module.products_list" list has the "title" field
      And each element in the "devices_module.products_list" list has the "chevron" field
      And each element in the "devices_module.products_list" list has the "icon" field
      And the "devices_module.link" link with the "<link_text>" format is displayed
      And the "devices_module.button" button is not displayed

    @automatic @cert2 @live @next @webapp
    Examples:
          | num_equipments | num_rows | link_text       | jira_id      |
          | 2              | 3        | Más información | QANOV-420777 |

    @manual
    Examples:
          | num_equipments | num_rows | link_text         | jira_id      |
          | 1              | 2        | Más información   | QANOV-420778 |
          | 3              | 3        | Ver todos \(\d+\) | QANOV-420779 |

  @jira.QANOV-341349 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke @webapp
  Scenario: User with only 1 equipment devices and no rented devices can see the devices module in the Dashboard
    Trio/Duo and monoline users can have bought equipments without having renting devices (not even offered)
    Given user has "0" products of "r2r_device" type
      And user has "1" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module_title" textfield is displayed
      And the "devices_module.icon" icon is displayed
      And the "devices_module.title" textfield is displayed
      And the "devices_module.products_list" list is not displayed
      And the "devices_module.link" link with the "Más información" format is displayed
      And the "devices_module.button" button is not displayed

  @jira.QANOV-325845 @android @automatic @ber @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live
  @mobile @moves @next @qa @smoke @webapp
  Scenario: User with only 1 selected rented device and no equipments can see the devices module in the main dashboard
    Given user has "1" renting devices in "received" status
      And user has "0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module_title" textfield is displayed
      And the "devices_module.icon" icon is displayed
      And the "devices_module.title" textfield is displayed
      And the "devices_module.products_list" list is not displayed
      And the "devices_module_datacard.tag" tag is not displayed
      And the "devices_module.link" link with the "Más información" format is displayed
      And the "devices_module.button" button is not displayed

  @jira.QANOV-446895 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @qa @webapp @smoke
  Scenario: User with only one in_progress rented device and no equipments can see the devices module in the main dashboard
    Given user has "1" renting devices in "in_progress" status
      And user has "0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module_title" textfield is displayed
      And the "devices_module.icon" icon is displayed
      And the "devices_module.title" textfield is displayed
      And the "devices_module.products_list" list is not displayed
      And the "devices_module_datacard.tag" tag is not displayed
      And the "devices_module.link" link with the "Más información" format is displayed
      And the "devices_module.button" button is not displayed

  @jira.QANOV-446896 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @qa @webapp @smoke
  Scenario: User with only one in_progress rented device clicks on the r2r device: Dynamic page is displayed
    Given user has "1" renting devices in "in_progress" status
      And user has "0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Devices Dashboard" page
      And waits until the "r2r.products_list" list is displayed
     When clicks on any element in the "r2r.products_list" list
      And waits until the "Tu dispositivo está en proceso de envío" string in internal webview is displayed
     Then the "Si lo deseas puedes consultar su estado desde" string is displayed

  @jira.QANOV-325847 @android @automatic @ber @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live
  @mobile @moves @next @qa @sanity @webapp
  Scenario: User without a selected rented device and no equipments can see the devices module in the main dashboard
    Given user has "0" products of "equipment" type
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "received;in_progress" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module_title" textfield is displayed
      And the "devices_module_datacard.icon" icon is displayed
      And the "devices_module_datacard.tag" label with "Pendiente de elección" text is displayed
      And the "devices_module_datacard.tag" label is displayed in "yellow" color
      And the "devices_module_datacard.title" textfield with "Dispositivo incluido" text is displayed
      And the "devices_module_datacard.pretitle" textfield with "Ya puedes elegir tu dispositivo" text is displayed
      And the "devices_module.products_list" list is not displayed
      And the "devices_module_datacard.button_primary" button with "Elegir dispositivo" text is displayed
      And the "devices_module_datacard.link" link with the "Más información" format is displayed

  @jira.QANOV-325849 @android @automatic @ber @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live
  @mobile @moves @next @qa @smoke @webapp
  Scenario: ADMIN user without a selected device or equipment can access to the device selection page
    The "Select Device" page is a dynamic content page configured through the CMS. It should contain:
    - an informative icon
    - a title
    - a description
    - a button redirecting to an OB webview
    Given user has "0" products of "equipment" type
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "received;in_progress" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user has a "admin" role
      And user is in the "Dashboard" page
     When clicks on the "devices_module.button" button
     Then the "Internal Mode" page is displayed
      And the "Elegir dispositivo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-325850 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user without a selected device or equipment sees the User Escalation when accessing to the device selection page
    The "Select Device" page is a dynamic content page configured through the CMS. It should contain:
    - an informative icon
    - a title
    - a description
    - a button redirecting to an OB webview
    Given user has "0" products of "equipment" type
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "received;in_progress" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user has a "admin-light" role
      And user is in the "Dashboard" page
     When clicks on the "devices_module.button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-325851 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @sanity
  Scenario: User with several devices (at least one a rented device) can access to the rented device details webview
    Given user has ">1" products of "r2r_device;equipment" type
      And user has ">0" renting devices in "received;in_progress" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     When clicks on the "devices_module.r2r_device_row" button
     Then the internal webview is displayed
      And the "Àrea privada Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-325852 @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile @moves
  @next @qa @smoke
  Scenario: User with several devices (at least one an equipment) can download the equipment guide in iOS devices
    Given user has "<3" products of "device" type
      And user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     When clicks on the "devices_module.equipment_row" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-341350 @android @automatic @cert2 @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke
  Scenario: User with several devices (at least one an equipment) can download the equipment guide in Android devices
    Given user has "<3" products of "device" type
      And user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     When clicks on the "devices_module.equipment_row" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-325853 @android @automatic @ber @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live
  @mobile @moves @next @qa @sanity @webapp
  Scenario: User with renting devices and without pending to choose devices can access to the Devices Dashboard screen
    Given user has ">0" products of "r2r_device" type
      And user has "0" renting devices in "offered" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
      And waits until the "devices_module.link" element is visible
     When clicks on the "devices_module.link" link
     Then the "Devices Dashboard" page is displayed
      And the "Dispositivos" header is displayed
      And the "title" textfield with "Dispositivos y equipamiento" text is displayed
      And the "r2r.title" textfield with "DISPOSITIVOS" text is displayed
      And the "r2r.products_list" list is displayed
      And each element in the "r2r.products_list" list has the "icon" field
      And each element in the "r2r.products_list" list has the "title" field
      And each element in the "r2r.products_list" list has the "subtitle" field
      And each element in the "r2r.products_list" list has the "chevron" field

  @jira.QANOV-325854 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke @webapp
  Scenario: User with a additional device pending to choose can see them in the Devices Dashboard
    Given user has ">0" renting devices in "offered" status
      And user has ">0" renting devices in "received" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
      And waits until the "devices_module.link" element is visible
     When clicks on the "devices_module.link" link
     Then the "Devices Dashboard" page is displayed
      And the "Dispositivos" header is displayed
      And the "title" textfield with "Dispositivos y equipamiento" text is displayed
      And waits until the "r2r.title" element is visible
      And the "r2r.title" textfield with "DISPOSITIVOS" text is displayed
      And the "r2r.products_list" list has ">0" elements
      And each element in the "r2r.products_list" list has the "icon" field
      And each element in the "r2r.products_list" list has the "title" field
      And each element in the "r2r.products_list" list has the "chevron" field
      And any element in the "r2r.products_list" list has the "label" textfield with the "Pendiente de elección" text
      And any element in the "r2r.products_list" list has the "title" textfield with the "Dispositivo adicional" text

  @jira.QANOV-420780 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke @webapp
  Scenario: User with a device pending to choose can see them in the Devices Dashboard
    Given user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "received;in_progress" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
      And waits until the "devices_module.link" element is visible
     When clicks on the "devices_module.link" link
     Then the "Devices Dashboard" page is displayed
      And the "Dispositivos" header is displayed
      And the "title" textfield with "Dispositivos y equipamiento" text is displayed
      And waits until the "r2r.title" element is visible
      And the "r2r.title" textfield with "DISPOSITIVOS" text is displayed
      And the "r2r.products_list" list has ">0" elements
      And each element in the "r2r.products_list" list has the "icon" field
      And each element in the "r2r.products_list" list has the "title" field
      And each element in the "r2r.products_list" list has the "chevron" field
      And any element in the "r2r.products_list" list has the "label" textfield with the "Pendiente de elección" text
      And any element in the "r2r.products_list" list has the "title" textfield with the "Dispositivo incluido" text

  @jira.QANOV-325855 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with a free device can see them in the Devices Dashboard
    Given user has a free device
      And user is in the "Dashboard" page
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And waits until the "devices_module.link" element is visible
     When clicks on the "devices_module.link" link
     Then the "Devices Dashboard" page is displayed
      And the "Dispositivos" header is displayed
      And the "title" textfield with "Dispositivos y equipamiento" text is displayed
      And the "r2r.title" textfield with "DISPOSITIVOS" text is displayed
      And the "r2r.products_list" list has ">1" elements
      And each element in the "r2r.products_list" list has the "icon" field
      And each element in the "r2r.products_list" list has the "title" field
      And each element in the "r2r.products_list" list has the "chevron" field
      And any element in the "r2r.products_list" list has the "subtitle" textfield with the "Dispositivo libre" text

  @jira.QANOV-325858 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @sanity @webapp
  Scenario: User with equipment devices can access to the Devices Dashboard screen
    Given user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
      And waits until the "devices_module.link" element is visible
     When clicks on the "devices_module.link" link
     Then the "Devices Dashboard" page is displayed
      And the "Dispositivos" header is displayed
      And the "title" textfield with "Dispositivos y equipamiento" text is displayed
      And waits until the "equipments.title" element is visible
      And the "equipments.title" textfield with "EQUIPAMIENTO" text is displayed
      And the "equipments.products_list" list is displayed
      And each element in the "equipments.products_list" list has the "icon" field
      And each element in the "equipments.products_list" list has the "title" field
      And each element in the "equipments.products_list" list has the "subtitle" field
      And each element in the "equipments.products_list" list has the "chevron" field

  @jira.QANOV-325861 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke @webapp
  Scenario: User can see the "Te puede interesar" section in the Devices Dashboard page
    The list is a snapcard element configured via CMS and the cards configured can change anytime
    Given user has ">0" products of "r2r_device;equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Devices Dashboard" page
     Then the "other_services_title" textfield is displayed
      And the "other_services_products_list" list is displayed
      And each element in the "other_services_products_list" list has the "icon" field
      And each element in the "other_services_products_list" list has the "title" field

  @jira.QANOV-341351 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @smoke
  Scenario: User with a renting device pending to choose and a received one can access an OB webview
    The "Select Device" page is a dynamic content page configured through the CMS. It should contain:
    - an informative icon
    - a title
    - a description
    - a button redirecting to an OB webview
    Given user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Devices Dashboard" page
     When clicks on any element in the "r2r.products_list" list with the "label" field
     Then the browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Devices Dashboard" page is displayed

  @jira.QANOV-325863 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke
  Scenario: ADMIN User with a renting device pending to choose and none received can access to the device selection page from the Devices Dashboard
    The "Select Device" page is a dynamic content page configured through the CMS. It should contain:
    - an informative icon
    - a title
    - a description
    - a button redirecting to an OB webview
    Given user has "0" renting devices in "received;in_progress" status
      And user has ">0" renting devices in "offered" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user has a "admin" role
      And user is in the "Devices Dashboard" page
     When clicks on any element in the "r2r.products_list" list with the "label" field
     Then the "Internal Mode" page is displayed
      And the "Elegir dispositivo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Devices Dashboard" page is displayed

  @jira.QANOV-325865 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT User with a renting device pending to choose and none received can access to the device selection page from the Devices Dashboard
    The "Select Device" page is a dynamic content page configured through the CMS. It should contain:
    - an informative icon
    - a title
    - a description
    - a button redirecting to an OB webview
    Given user has "0" renting devices in "received;in_progress" status
      And user has ">0" renting devices in "offered" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user has a "admin-light" role
      And user is in the "Devices Dashboard" page
     When clicks on any element in the "r2r.products_list" list with the "label" field
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Devices Dashboard" page is displayed

  @jira.QANOV-325867 @android @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @smoke
  Scenario: User with a rented device can access the device details webview from the Devices Dashboard
    Given user has ">0" renting devices in "received" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Devices Dashboard" page
     When clicks on any element in the "r2r.products_list" list with the "label" field
     Then the internal webview is displayed
      And the "Área privada Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Devices Dashboard" page is displayed

  @jira.QANOV-325869 @automatic @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile @moves
  @next @qa @smoke
  Scenario: User with an equipment can download the equipment guide from the Devices Dashboard in iOS devices
    Given user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Devices Dashboard" page
     When clicks on any element in the "equipments.products_list" list
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Devices Dashboard" page is displayed

  @jira.QANOV-341352 @android @automatic @cert2 @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke
  Scenario: User with an equipment can download the equipment guide from the Devices Dashboard in Android devices
    Given user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Devices Dashboard" page
     When clicks on any element in the "equipments.products_list" list
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-325877 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with <4 renting devices and equipments can see them in the correct order in the Dashboard
    Given user has ">0" products of "r2r_device" type
      And user has ">0" products of "equipment" type
      And user has "<4" products of "r2r_device;equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module.equipment_row" row is under the "devices_module.r2r_device_row" row

  @jira.QANOV-325880 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with >3 renting devices and equipments can see them in the correct order in the Dashboard
    Given user has ">3" products of "r2r_device" type
      And user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module.equipment_row" row is not displayed

  @jira.QANOV-325882 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with renting devices and equipments can see them in the Devices Dashboard
    Given user has ">0" products of "r2r_device" type
      And user has ">0" products of "equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Device Dashboard" page
     Then the "equipments_section" section is under the "r2r_section" section

  @jira.QANOV-325884 @android @automatic @ber @cert2 @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live
  @mobile @moves @next @qa @smoke @webapp
  Scenario: User won't see the module if they don't have any renting device available or equipment
    Currently the monoline, duo and trio plans don't have r2r devices offered as part of they're plan.
    Given user has "0" products of "r2r_device;equipment" type
      And user has "0" renting devices in "offered" status
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     Then the "devices_module" module is not displayed

  @jira.QANOV-325886 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see an error in the module if it fails to load
    Given user has ">0" products of "r2r_device;equipment" type
      And user has the "hub-devices-summary" module configured in CMS for "dashboard-user" page
      And user is in the "Dashboard" page
     When an error occurs loading the "devices_module" module
     Then the "devices_module_title" textfield is displayed
      And the "devices_module.error_title" textfield with "Algo ha ido mal" text is displayed
      And the "devices_module.error_subtitle" textfield with "El contenido no se puede mostrar" text is displayed

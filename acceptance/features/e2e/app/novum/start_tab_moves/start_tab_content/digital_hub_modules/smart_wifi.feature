# -*- coding: utf-8 -*-
@jira.QANOV-324833
Feature: Smart Wifi Module

  Actions Before the Feature:
    Given user is in the "Start" page
      And pulls down the page to refresh
      And the "Start" page is displayed



  @jira.QANOV-324834 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @automatic @mobile @moves @sanity @webapp @qa
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service deactivated can see the Smart Wifi Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "deactivated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     Then the "smart_wifi_router.pretitle" textfield with "Smart Wifi" text is displayed
      And the "smart_wifi_router.title" textfield with "Mi wifi" text is displayed
      And the "smart_wifi_router.description" textfield with "La conexión de tu hogar de un vistazo dentro y fuera de casa" text is displayed
      And the "smart_wifi_router.wifi_details.name_placeholder" textfield with "Nombre" text is displayed
      And the "smart_wifi_router.wifi_details.wifi_name" inputtext is not empty
      And the "smart_wifi_router.wifi_details.unfold" icon is displayed
      And the "smart_wifi_router.wifi_details.password_placeholder" textfield with "Contraseña" text is displayed
      And the "smart_wifi_router.wifi_details.wifi_password" inputtext that contains the "***" text is displayed
      And the "smart_wifi_router.wifi_details.see_password" icon is displayed
      And the "smart_wifi_router.button_primary" button with "Instalar Smart Wifi" text is displayed

  @jira.QANOV-324835 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @automatic @mobile @moves @smoke @qa
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service deactivated can see all the WiFis clicking on the unfold icon
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "deactivated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "smart_wifi_router.wifi_details.unfold" button
     Then the "Smart Wifi Options Sheet" sheet is displayed
      And the "sheet_title" textfield with "WiFi" text is displayed
      And the "sheet_subtitle" textfield with the "\d+ redes WiFi en tu router" format is displayed
      And the "sheet_wifi_list" list is displayed
      And each element has the "icon" field displayed in the "sheet_wifi_list" list
      And each element has the "wifi_name" field displayed in the "sheet_wifi_list" list
      And each element has the "selector" field displayed in the "sheet_wifi_list" list
      And clicks on the "0" element in the "sheet_wifi_list" list
      And the "Start" page is displayed

  @jira.QANOV-324836 @android @automation.hard @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service deactivated can change the WiFi selected in the Smart Wifi module
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has ">1" wifi nets associated to the router
      And user has the "smart_wifi" service in "deactivated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "smart_wifi_router.wifi_details.unfold" button
      And the "smart_wifi_action_sheet" sheet is displayed
      And clicks on the "selector" button of "sheet_wifi_list" list with "1" index
     Then the "smart_wifi_action_sheet" sheet is not displayed
      And the "smart_wifi.wifi_details.wifi_name" inputtext is filled with the selected wifi information
      And the "smart_wifi.wifi_details.wifi_password" inputtext is filled with the selected wifi information

  @jira.QANOV-324837 @android @automation.hard @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service deactivated can see the WiFi password in the Smart Wifi module
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "deactivated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "smart_wifi_router.wifi_details.see_password" button
     Then the "smart_wifi.wifi_details.wifi_password" inputtext is not hidden by "*" characters

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: Telco ADMIN postpay user with HGU and smart wifi service deactivated taps on the "Instalar Smart Wifi" button: Store App is displayed
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "deactivated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "smart_wifi_router.button" button
     Then the "<app>" app is displayed
      And the "Smart Wifi" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-324838 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-324839 |

  @jira.QANOV-324840 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated without the App installed can see the Smart Wifi Module in the Start tab with a Install button
    Given user has a "telco postpay" account type
      And user has not installed the "Smart Wifi" app
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_router.icon" icon is displayed
      And the "smart_wifi_router.title" textfield with "Smart Wifi" text is displayed
      And the "smart_wifi_router.subtitle" textfield is displayed
      And the "smart_wifi_router.description" textfield is displayed
      And the "smart_wifi_router.button" button with "Instalar Smart Wifi" text is displayed
      And the "smart_wifi_router.link" link is not displayed

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: Telco ADMIN postpay user with HGU and smart wifi service activated without the App installed taps on the "Instalar Smart Wifi" button: Store App is displayed
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has not installed the "Smart Wifi" app
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "smart_wifi_router.button" button
     Then the "<app>" app is displayed
      And the "Smart Wifi" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-324841 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-324842 |

  @jira.QANOV-324843 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated with the App installed can see the Smart Wifi Module in the Start tab with a Management link
    Given user has a "telco postpay" account type
      And user has installed the "Smart Wifi" app
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_router.icon" icon is displayed
      And the "smart_wifi_router.title" textfield with "Smart Wifi" text is displayed
      And the "smart_wifi_router.subtitle" textfield is displayed
      And the "smart_wifi_router.description" textfield is displayed
      And the "smart_wifi_router.link" link with "Gestionar dispositivos" text is displayed
      And the "smart_wifi_router.button" button is not displayed

  @jira.QANOV-324844 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated and with the app installed taps on the "Gestionar dispositivos" link: Internet page is displayed
    Given user has a "telco postpay" account type
      And user has installed the "Smart Wifi" app
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "smart_wifi_router.link" button
     Then the "Internet" page is displayed

  @jira.QANOV-324845 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated with "0" devices connected will see the "Ningún dispositivo conectado" title
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-devices" module configured in CMS for "start" page
      And user has "0" devices connected to the router
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_devices.icon" icon is displayed
      And the "smart_wifi_devices.title" textfield with "Smart Wifi" text is displayed
      And the "smart_wifi_devices.subtitle" textfield with "Ningún dispositivo conectado" text is displayed
      And the "smart_wifi_devices.description" textfield with "0 móviles y 0 tablets" text is displayed
      And the "smart_wifi_devices.devices_list" list is not displayed

  @jira.QANOV-324846 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated with several devices connected but none are mobiles or tablets won't see any device in the list
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-devices" module configured in CMS for "start" page
      And user has ">0" devices connected to the router
      And user has "0" mobile devices connected to the router
      And user has "0" tablets connected to the router
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_devices.icon" icon is displayed
      And the "smart_wifi_devices.title" textfield with "Smart Wifi" text is displayed
      And the "smart_wifi_devices.subtitle" textfield with the "\d+ dispositivos conectados al wifi" format is displayed
      And the "smart_wifi_devices.description" textfield with "0 móviles y 0 tablets" text is displayed
      And the "smart_wifi_devices.devices_list" list is not displayed

  @jira.QANOV-324847 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated with devices can see the Smart Wifi Module in the Start tab with a Management link
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-devices" module configured in CMS for "start" page
      And user has ">0; <=10" mobile or tablet devices connected to the router
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_devices.icon" icon is displayed
      And the "smart_wifi_devices.title" textfield with "Smart Wifi" text is displayed
      And the "smart_wifi_devices.subtitle" textfield with the "\d+ dispositivos conectados al wifi" format is displayed
      And the "smart_wifi_devices.description" textfield with "\d+ móvil(es)? y \d tablet(s)?" text is displayed
      And the "smart_wifi_devices.devices_list" list is displayed
      And each element has the "icon" field displayed in the "smart_wifi_devices.devices_list" list
      And each element has the "name" field displayed in the "smart_wifi_devices.devices_list" list

  @jira.QANOV-324848 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated with ">10" devices connected will see the "+X dispositivos" card
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-devices" module configured in CMS for "start" page
      And user has ">10" mobile or tablet devices connected to the router
      And user has a "admin" role
      And user is in the "Start" page
     Then the "smart_wifi_devices.devices_list" list has "11" elements
      And the last element in the "smart_wifi_devices.devices_list" list has the "name" field with the "\+\d+ dispositivos" format

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: Telco ADMIN postpay user with HGU and smart wifi service activated with a device in "<device_status>" status will see it on a pill with "<color>" color
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-devices" module configured in CMS for "start" page
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "<device_status>" status
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_devices.devices_list" list is displayed
      And the device with "<device_status>" status is shown in "<color>" color

    Examples:
          | device_status | color | jira_id      |
          | activated     | green | QANOV-324849 |
          | deactivated   | gray  | QANOV-324850 |

  @jira.QANOV-324851 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with HGU and smart wifi service activated with several routers will see one card for each router
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has the "smart_wifi" service in "activated" status
      And user has the "smart-wifi-routers-widget" module configured in CMS for "start" page
      And user has ">1" routers
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "smart_wifi_carousel" carousel is displayed
      And each element has the "icon" field displayed in the "smart_wifi_carousel" list
      And each element has the "title" field displayed in the "smart_wifi_carousel" list
      And each element has the "subtitle" field displayed in the "smart_wifi_carousel" list
      And each element has the "description" field displayed in the "smart_wifi_carousel" list
      And swipes the "smart_wifi_carousel" carousel in "left" direction

  @jira.QANOV-324852 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN-LIGHT postpay user won't see the Smart Wifi Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "HGU router" resource
      And user has a "admin-light" role
      And user is in the "Start" page
     Then the "smart_wifi" module is not displayed

  @jira.QANOV-324853 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user without a HGU router won't see the Smart Wifi Module in the Start tab
    Given user has a "telco postpay" account type
      And user does not have a "HGU router" resource
      And user has a "admin" role
      And user is in the "Start" page
     Then the "smart_wifi" module is not displayed

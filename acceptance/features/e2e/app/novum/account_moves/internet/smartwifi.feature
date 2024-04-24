# -*- coding: utf-8 -*-
@jira.QANOV-8412
Feature: SmartWifi

  Actions Before the Feature:
    Given user has a "postpay" account type
      And user has a internet product with "Fibra" connectivity
      And user has the "smart_wifi" service in "activated" status


  @jira.QANOV-324891 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @automatic @mobile @moves @sanity @webapp @qa
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated access to the Internet Dashboard: Smart Wifi modules are displayed
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user is in the "MovesInternetDashboard" page
     Then the "smart_wifi_section_title" textfield with "Smart WiFi" text is displayed
      And the "smart_wifi_connected_devices.icon" icon is displayed
      And the "smart_wifi_connected_devices.title" textfield with the "\d+ dispositivos conectados al wifi" format is displayed
      And the "smart_wifi_connected_devices.description" textfield with the "\d+ móvil(es)? y \d tablet(s)?" format is displayed
      And the "smart_wifi_connected_devices.link" link with "Gestionar dispositivos" text is displayed
      And the "share_password.icon" icon is displayed
      And the "share_password.title" textfield with "Compartir contraseña" text is displayed
      And the "wifi_data.icon" icon is displayed
      And the "wifi_data.title" textfield with "Datos de tu wifi" text is displayed

  @jira.QANOV-324892 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with 0 devices connected can see the smart wifi module
    Given user has a "admin" role
      And user has "0" devices connected to the router
      And user is in the "Internet" page
     Then the "smart_wifi_section_title" textfield with "Smart WiFi" text is displayed
      And the "smart_wifi.icon" icon is displayed
      And the "smart_wifi.title" textfield with "Ningún dispositivo contectado" text is displayed
      And the "smart_wifi.subtitle" textfield with "0 móviles y 0 tablets" text is displayed
      And the "smart_wifi.devices_list" list is not displayed
      And the "smart_wifi.link" link with "Gestionar dispositivos" text is displayed

  @jira.QANOV-324893 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @mobile @moves @sanity @automatic @webapp @qa
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with several devices connected can see the smart wifi module
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user is in the "Internet Dashboard" page
     Then the "smart_wifi_section_title" textfield with "Smart WiFi" text is displayed
      And the "smart_wifi_connected_devices.icon" icon is displayed
      And the "smart_wifi_connected_devices.title" textfield with the "\d+ dispositivos conectados al wifi" format is displayed
      And the "smart_wifi_connected_devices.description" textfield with the "\d+ móvil(es)? y \d tablet(s)?" format is displayed
      And the "smart_wifi_connected_devices.devices_list" list is displayed
      And each element has the "icon" field displayed in the "smart_wifi_connected_devices.devices_list" list
      And each element has the "name" field displayed in the "smart_wifi_connected_devices.devices_list" list
      And each element has the "manage_device" field displayed in the "smart_wifi_connected_devices.devices_list" list
      And the "smart_wifi_connected_devices.devices_list" list is ordered with the "mobile" devices first
      And the "smart_wifi_connected_devices.link" link with "Gestionar dispositivos" text is displayed

  @jira.QANOV-324894 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with a connected device in "active" status can pause the device
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "active" status
      And user is in the "Internet" page
     When clicks on the "manage_device" button of the device in "active" status of the "smart_wifi.devices_list" list
      And waits until the device status change become effective
     Then the "manage_device" icon is shown paused for the "active" device in the "smart_wifi.devices_list" list

  @jira.QANOV-324895 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with a connected device in "active" status tries to pause the device but an error happens
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "active" status
      And user is in the "Internet" page
     When clicks on the "manage_device" button of the device in "active" status of the "smart_wifi.devices_list" list
      And waits until the device status change become effective
      And there is an error
     Then the "manage_device" icon is shown active for the "active" device in the "smart_wifi.devices_list" list

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: Telco postpay ADMIN user with Smart Wifi service activated with a connected device in "paused" status tries to activate the device: Warning pop up is displayed
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "paused" status
      And user is in the "Internet" page
     When clicks on the "manage_device" button of the device in "paused" status of the "smart_wifi.devices_list" list
     Then the "Hour Restriction Warning" popup is displayed
      And the "popup.title" textfield with "<title>" text is displayed
      And the "popup.message" textfield with "<message>" text is displayed
      And the "popup.accept" button with "<activate>" text is displayed
      And the "popup.cancel" button with "<cancel>" text is displayed

    @android
    Examples:
          | title                                            | message                                      | activate         | cancel   | jira_id      |
          | ESTE DISPOSITIVO PUEDE TENER RESTRICCIÓN HORARIA | SI ACTIVA LA CONEXIÓN ANULARÁ SU RESTRICCIÓN | ACTIVAR CONEXIÓN | CANCELAR | QANOV-324896 |

    @ios
    Examples:
          | title                                            | message                                      | activate         | cancel   | jira_id      |
          | Este dispositivo puede tener restricción horaria | Si activa la conexión anulará su restricción | Activar conexión | Cancelar | QANOV-324897 |

  @jira.QANOV-324898 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with a connected device in "paused" status who was in the Warning pop up cancels the device activation
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "paused" status
      And user is in the "Internet" page
     When clicks on the "manage_device" button of the device in "paused" status of the "smart_wifi.devices_list" list
      And the "Hour Restriction Warning" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Internet" page is displayed
      And the "manage_device" icon is shown paused for the "paused" device in the "smart_wifi.devices_list" list

  @jira.QANOV-324899 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with a connected device in "paused" status cannot activate the device if an error occurs
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "paused" status
      And user is in the "Internet" page
     When clicks on the "manage_device" button of the device in "paused" status of the "smart_wifi.devices_list" list
      And the "Hour Restriction Warning" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Internet" page is displayed
      And waits until the device status change become effective
      And there is an error
     Then the "manage_device" icon is shown paused for the "paused" device in the "smart_wifi.devices_list" list

  @jira.QANOV-324900 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated with a connected device in "paused" status can activate the device
    Given user has a "admin" role
      And user has ">0" mobile or tablet devices connected to the router
      And user has a device in "paused" status
      And user is in the "Internet" page
     When clicks on the "manage_device" button of the device in "paused" status of the "smart_wifi.devices_list" list
      And the "Hour Restriction Warning" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Internet" page is displayed
      And waits until the device status change become effective
     Then the "manage_device" icon is shown active for the "paused" device in the "smart_wifi.devices_list" list

  @jira.QANOV-324901 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN user with Smart Wifi service activated and the app installed clicks on the "Gestionar dispositivos" link: SmartWiFi app is displayed
    Given user has installed the "Smart Wifi" app
      And user has a "admin" role
      And user is in the "Internet" page
     When clicks on the "smart_wifi.link" link
     Then the "Smart Wifi" app is displayed

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: Telco postpay ADMIN user with Smart Wifi service activated and without the app installed clicks on the "Gestionar dispositivos" link: Store app is displayed
    Given user does not have installed the "Smart Wifi" app
      And user has a "admin" role
      And user is in the "Internet" page
     When clicks on the "smart_wifi.link" link
     Then the "<app>" app is displayed
      And the "Smart Wifi" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-324902 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-324903 |

  @jira.QANOV-324904 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: User with Smart WiFi service can share the WiFi password from the Internet dashboard
    Given user has a "admin" role
      And user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet" page
     When clicks on the "share_password" module
     Then a native drop-down with several sharing options is displayed

  @jira.QANOV-324905 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service and with more than one wifi can access to the WiFi disambiguation page tapping on the share_password module
    Given user has a "admin" role
      And user has ">1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet" page
     When clicks on the "share_password" module
     Then the "WiFi Disambiguation" page is displayed
      And the "Tus redes wifi" header is displayed
      And the "wifi_list" list is displayed
      And each element in the "wifi_list" list has the "icon" field
      And each element in the "wifi_list" list has the "title" field
      And each element in the "wifi_list" list has the "chevron" field
      And the "wifi_list" list has ">1" elements

  @jira.QANOV-324906 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service and with more than one wifi taps on any wifi in the disambiguation page after tapping on the share_password module: Native sharing options is displayed
    Given user has a "admin" role
      And user has ">1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet" page
     When clicks on the "share_password" module
      And the "WiFi Disambiguation" page is displayed
      And clicks on the "1" element in the "wifi_list" list
     Then the "Internet" page is displayed
      And a native drop-down with several sharing options is displayed

  @jira.QANOV-324907 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: User with Smart WiFi service and with "0" wifi can access to the WiFi empty case page
    Given user has "0" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet" page
     When clicks on the "wifi_data" module
     Then the "WiFi" page is displayed
      And the "WiFi" header is displayed
      And the "wifi_list" list is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Aquí podrás gestionar los datos de tus wifis" text is displayed
      And the "description" textfield with "Verás el nombre y la contraseña correspondiente a cada una de tus wifis" text is displayed

  @jira.QANOV-324908 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @mobile @moves @qa @sanity @webapp
  Scenario: User with Smart WiFi service and with just one WiFi network can access to WiFi details
    The wifi name input text is prefilled with the current wifi name
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary-internet" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet Dashboard" page
     When clicks on the "wifi_data" module
     Then the "WiFi" page is displayed
      And the "Wifi" header is displayed
      And the "title" textfield with "Tu red y contraseña" text is displayed
      And the "wifi_name_title" textfield with "Nombre de tu red" text is displayed
      And the "wifi_name" inputtext is not empty
      And the "wifi_password_title" textfield that contains the "Contraseña" text is displayed
      And the "wifi_password" inputtext is displayed
      And the "see_password" icon is displayed
      And the "save" button with "Guardar" text is displayed

  @jira.QANOV-324909 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service can change the WiFi name
    Do not test the wifi name change with a real user
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When fills the "wifi_name" inputtext with the "testtesttest" text
      And clicks on the "save" button
     Then the "Feedback Success" page is displayed
      And the "success_title" textfield with "Has actualizado los datos de tu red" text is displayed
      And the "success_subtitle" textfield with "Ten en cuenta que los cambios pueden tardar unos minutos en aplicarse." text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed

  @jira.QANOV-324910 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service can change the WiFi password
    Do not test the wifi password change with a real user
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When fills the "wifi_password" inputtext with the "testtesttest" text
      And clicks on the "save" button
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_message" textfield with "Has actualizado los datos de tu red" text is displayed
      And the "description" textfield with "Ten en cuenta que los cambios pueden tardar unos minutos en aplicarse." text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed

  @jira.QANOV-324911 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service taps "back_to_account" button in confirmation screen after changing name or password
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When fills the "wifi_password" inputtext with the "testtesttest" text
      And clicks on the "save" button
      And user is in the "Feedback Success" page
     When clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed

  @jira.<jira_id> @ios @android @jira.cv.11.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario Outline: User with Smart WiFi service cannot change the WiFi password with invalid password
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When fills the "wifi_password" inputtext with the "<value>" text
      And clicks on the "save" button
      And the "error_message" textfield with "<error_message>" text is displayed

    Examples:
          | value                                                                 | error_message                        | jira_id      |
          | test                                                                  | Introduce al menos 8 caracteres      | QANOV-324912 |
          | testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttests | El número máximo de caracteres es 63 | QANOV-324913 |

  @jira.QANOV-324914 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service cannot change the WiFi name/password if an API error occurs
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When fills the "wifi_name" inputtext with the "testtesterror" text
      And fills the "wifi_password" inputtext with the "testtesterror" text
      And clicks on the "save" button
      And there is an API error
     Then the "Feedback Error" page is displayed
      And the "error_title" textfield with "Lo sentimos" text is displayed
      And the "error_message" textfield with "No hemos podido guardar los datos. Vuelve a intentarlo en unos minutos." text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed

  @jira.QANOV-324915 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service taps "back_to_account" button in error screen after changing name or password
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When fills the "wifi_name" inputtext with the "testtesterror" text
      And fills the "wifi_password" inputtext with the "testtesterror" text
      And clicks on the "save" button
      And there is an API error
      And user is in the "Feedback Error" page
     When clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed

  @jira.QANOV-324916 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service can see the WiFi password tapping on the eye icon
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When clicks on the "see_password" icon
     Then the "WiFi" password is displayed

  @jira.QANOV-324917 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @regression
  Scenario: User with Smart WiFi service can share the WiFi password from the WiFi page
    Given user has "1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "WiFi" page
     When clicks on the "share_password" link
     Then a native drop-down with several sharing options is displayed

  @jira.QANOV-324918 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: User with Smart WiFi service and with more than one wifi can access to the WiFi disambiguation page
    Given user has ">1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet" page
     When clicks on the "wifi_data" module
     Then the "WiFi Disambiguation" page is displayed
      And the "Tus redes wifi" header is displayed
      And the "wifi_list" list is displayed
      And each element in the "wifi_list" list has the "icon" field
      And each element in the "wifi_list" list has the "title" field
      And each element in the "wifi_list" list has the "chevron" field
      And the "wifi_list" list has ">1" elements

  @jira.QANOV-324919 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @jira.link.parent_test_plan.QANOV-56661 @manual @mobile @moves @smoke
  Scenario: User with Smart WiFi service and with more than one wifi taps on any wifi in the disambiguation page: WiFi page is displayed
    Given user has ">1" wifi activated
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet" page
     When clicks on the "wifi_data" module
      And the "WiFi Disambiguation" page is displayed
      And clicks on the "1" element in the "wifi_list" list
     Then the "WiFi" page is displayed
      And the "WiFi" header is displayed
      And the "title" textfield with "Tu red y contraseña" text is displayed
      And the "wifi_name_title" textfield with "Nombre de tu red" text is displayed
      And the "wifi_name" inputtext is not empty
      And the "wifi_password_title" textfield that contains the "Contraseña" text is displayed
      And the "wifi_password" inputtext is displayed
      And the "see_password" icon is displayed
      And the "share_password_icon" icon is displayed
      And the "share_password_link" link with "Compartir contraseña" text is displayed
      And the "save" button with "Guardar" text is displayed

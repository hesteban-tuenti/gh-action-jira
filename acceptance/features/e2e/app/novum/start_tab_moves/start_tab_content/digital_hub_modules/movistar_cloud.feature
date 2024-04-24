# -*- coding: utf-8 -*-
@jira.QANOV-324854
Feature: Movistar Cloud Module

  Actions Before the Feature:
    Given user is in the "Start" page
      And user has the "movistar-cloud" module configured in CMS for "start" page
      And pulls down the page to refresh
      And the "Start" page is displayed


  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @mobile @moves
  Scenario Outline: Telco ADMIN postpay user with the the Movistar Cloud service deactivated and who <app_status> the app installed can see the Movistar Cloud Module in the Start tab with a "<button>" button
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "several" mobile lines
      And user <app_status> installed the "CLOUD" app
      And user has the "movistar_cloud" service in "deactivated" status in all lines
      And user is in the "Start" page
     Then the "movistar_cloud.module_icon" icon is displayed
      And the "movistar_cloud.card.pretitle" textfield with "Movistar Cloud" text is displayed
      And the "movistar_cloud.card.title" textfield with "Almacenamiento ilimitado en la nube para lo que necesites" text is displayed
      And the "movistar_cloud.card.description" textfield with "Activa Movistar Cloud y despreocúpate del espacio en tu dispositivo" text is displayed
      And the "movistar_cloud.additional_description" textfield that contains the "Tu contrato incluye este servicio" text is displayed
      And the "movistar_cloud.additional_description_check" icon is displayed
      And the "movistar_cloud.card.button_primary" button with "<button>" text is displayed
      And the "movistar_cloud.card.link" link with "Para tus otras líneas" text is displayed

    @ber @sanity @automatic @next @live @cert2 @qa
    Examples:
          | app_status | button  | jira_id      |
          | has not    | Activar | QANOV-324855 |

    @regression @manual
    Examples:
          | app_status | button     | jira_id      |
          | has        | Ir a Cloud | QANOV-324856 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario Outline: Telco ADMIN postpay MONOLINE user with the the Movistar Cloud service deactivated and who <app_status> the app installed can see the Movistar Cloud Module in the Start tab with a "<button>" button
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "1" line
      And user <app_status> installed the "Movistar Cloud" app
      And user has the "movistar_cloud" service in "deactivated" status
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "movistar_cloud.module_icon" icon is displayed
      And the "movistar_cloud.title" textfield with "Movistar Cloud" text is displayed
      And the "movistar_cloud.subtitle" textfield with "Almacenamiento ilimitado en la nube para lo que necesites" text is displayed
      And the "movistar_cloud.description" textfield with "Activa Movistar Cloud y despreocúpate del espacio en tu dispositivo" text is displayed
      And the "movistar_cloud.additional_description" textfield that contains the "Tu contrato incluye este servicio" text is displayed
      And the "movistar_cloud.additional_description_check" icon is displayed
      And the "movistar_cloud.button" button with "<button>" text is displayed
      And the "movistar_cloud.link" link is not displayed

    Examples:
          | app_status | button     | jira_id      |
          | has not    | Activar    | QANOV-324857 |
          | has        | Ir a Cloud | QANOV-324858 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario Outline: Telco ADMIN-LIGHT postpay user with the the Movistar Cloud service deactivated and who <app_status> the app installed can see the Movistar Cloud Module in the Start tab with a "<button>" button
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user <app_status> installed the "Movistar Cloud" app
      And user has the "movistar_cloud" service in "deactivated" status
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "movistar_cloud.module_icon" icon is displayed
      And the "movistar_cloud.title" textfield with "Movistar Cloud" text is displayed
      And the "movistar_cloud.subtitle" textfield with "Almacenamiento ilimitado en la nube para lo que necesites" text is displayed
      And the "movistar_cloud.description" textfield with "Activa Movistar Cloud y despreocúpate del espacio en tu dispositivo" text is displayed
      And the "movistar_cloud.additional_description" textfield that contains the "Tu contrato incluye este servicio" text is displayed
      And the "movistar_cloud.additional_description_check" icon is displayed
      And the "movistar_cloud.button" button with "<button>" text is displayed
      And the "movistar_cloud.link" link is not displayed

    Examples:
          | app_status | button     | jira_id      |
          | has not    | Activar    | QANOV-324859 |
          | has        | Ir a Cloud | QANOV-324860 |

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @mobile @moves
  Scenario Outline: Telco ADMIN postpay user with the the Movistar Cloud service activated for any lines and who <app_status> the app installed can see the Movistar Cloud Module in the Start tab with a "<button>" button
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user <app_status> installed the "CLOUD" app
      And user has the "movistar_cloud" service in "activated" status but in "deactivated" status in at least a line
      And user is in the "Start" page
     Then the "movistar_cloud.card.pretitle" textfield with "Movistar Cloud" text is displayed
      And the "movistar_cloud.card.title" textfield with "Activa Movistar Cloud para todas tus líneas" text is displayed
      And the "movistar_cloud.card.description" textfield with "Al menos una de tus líneas no disfruta de almacenamiento ilimitado en la nube" text is displayed
      And the "movistar_cloud.additional_description" textfield is not displayed
      And the "movistar_cloud.mobile_lines_list" list is displayed
      And the "movistar_cloud.card.button_primary" button with "<button>" text is displayed
      And the "movistar_cloud.card.link" link with "Para tus otras líneas" text is displayed

    @ber @sanity @automatic @cert2 @live @next @qa
    Examples:
          | app_status | button  | jira_id      |
          | has not    | Activar | QANOV-324861 |

    @regression @manual
    Examples:
          | app_status | button     | jira_id      |
          | has        | Ir a Cloud | QANOV-324862 |

  @jira.QANOV-324863 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @smoke
  Scenario: Telco ADMIN postpay user with the the Movistar Cloud service with less than 6 lines and the service activated for any lines can see the Movistar Cloud Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has ">1; <=6" lines
      And user <app_status> installed the "Movistar Cloud" app
      And user has the "movistar_cloud" service in "activated" status
      And user has the "movistar_cloud" service in "deactivated" status for at least one line
      And user is in the "Start" page
     Then the "movistar_cloud.mobile_lines_list" list is displayed
      And each element has the "icon" field displayed in the "movistar_cloud.mobile_lines_list" list
      And each element in the "movistar_cloud.mobile_lines_list" list has the "mobile_line" textfield with the "6\d\d \d\d \d\d" format

  @jira.QANOV-324864 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user with the the Movistar Cloud service with more than 6 lines and the service activated for any lines can see the Movistar Cloud Module in the Start tab
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has ">6" lines
      And user has the "movistar_cloud" service in "activated" status
      And user has the "movistar_cloud" service in "deactivated" status for at least one line
      And user is in the "Start" page
     Then the "movistar_cloud.mobile_lines_list" list has "7" elements
      And the last element in the "movistar_cloud.mobile_lines_list" list has the "mobile_line" field with the "\+\d+ líneas" format

  @jira.<jira_id> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-319568
  @manual @mobile @moves @smoke
  Scenario Outline: Telco postpay user with the the Movistar Cloud service deactivated and who does not have the app installed taps on the "Activar" button: Store App is displayed
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "activated" status
      And user has the "movistar_cloud" service in "deactivated" status for at least one line
      And user does not have installed the "Movistar Cloud" app
      And user is in the "Start" page
     When clicks on the "movistar_cloud.button" button
     Then the "<app>" app is displayed
      And the "Movistar Cloud" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-324865 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-324866 |

  @jira.QANOV-324867 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with the the Movistar Cloud service deactivated and who has the app installed taps on the "Ir a Cloud" button: Movistar cloud app is displayed
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "activated" status
      And user has the "movistar_cloud" service in "deactivated" status for at least one line
      And user has installed the "Movistar Cloud" app
      And user is in the "Start" page
     When clicks on the "movistar_cloud.button" button
     Then the "Movistar Cloud" app is displayed

  @jira.QANOV-324868 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco ADMIN postpay user taps on the "Para tus otras líneas" button: Options to share de Movistar cloud link are displayed
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "activated" status
      And user has the "movistar_cloud" service in "deactivated" status for at least one line
      And user has a "admin" role
      And user has ">1" lines
      And user is in the "Start" page
     When clicks on the "movistar_cloud.link" link
     Then the native sharing options are displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario Outline: Telco ADMIN postpay user with movistar cloud service activated but with a line with the service in "<device_status>" status will see it on a pill with "<color>" color
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has ">1" lines
      And user has the "movistar_cloud" service in "activated" status
      And user has the "movistar_cloud" service in "deactivated" status for at least one line
      And user has the "movistar_cloud" service in "<device_status>" status for a line
      And user has a "admin" role
      And user is in the "Start" page
     Then the "security_section_header" textfield with "Seguridad" text is displayed
      And the "movistar_cloud.mobile_lines_list" list is displayed
      And the mobile line with "<device_status>" status is shown in "<color>" color

    Examples:
          | device_status | color | jira_id      |
          | activated     | green | QANOV-324869 |
          | deactivated   | gray  | QANOV-324870 |

  @jira.QANOV-324871 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: Telco postpay user with the Movistar cloud service enabled for all the lines won't see the Movistar Cloud module in Start
    Given user has a "telco postpay" account type
      And user has the "movistar_cloud" service in "activated" status for all the lines
      And user is in the "Start" page
     Then the "movistar_cloud" module is not displayed

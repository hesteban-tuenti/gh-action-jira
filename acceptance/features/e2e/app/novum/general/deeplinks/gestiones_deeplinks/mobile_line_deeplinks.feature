# -*- coding: utf-8 -*-
@jira.QANOV-555330
Feature: Mobile Line Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with just one mobile line can open the '<deeplink>' OB deeplink
    Given user has a "telco" account type
      And user has a "<role>" role
      And user has "1" mobile lines of "<line_type>" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "<text>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | deeplink                               | line_type | role  | header                | text                                | jira_id      |
          | Management Check Puk And Imei          | postpay   | any   | Área privada Movistar | Consulta de PUK e IMEI              | QANOV-555331 |
          | Management Robbery Suspension          | postpay   | any   | Área privada Movistar | Bloqueo de línea por robo o pérdida | QANOV-555332 |
          | Management Emocion Online Payments     | postpay   | admin | Trustportal           | Gestión por línea de Emoción        | QANOV-555333 |
          | Management Roaming                     | postpay   | any   | Área privada Movistar | Si viajas al extranjero             | QANOV-555334 |
          | Management Topup                       | prepay    | any   | Recargar saldo        | Recarga online de saldo             | QANOV-555335 |
          | Management Advance Balance             | prepay    | any   | TBD                   | TBD                                 | QANOV-555336 |
          | Management Add Bundle                  | prepay    | any   | TBD                   | TBD                                 | QANOV-555337 |
          | Management Voicemail                   | postpay   | any   | Área privada Movistar | Buzón de voz                        | QANOV-555338 |
          | Management Calls Data Restriction      | postpay   | any   | Área privada Movistar | Bloquear las llamadas a números     | QANOV-555340 |
          | Management Special Numbers Restriction | postpay   | any   | Área privada Movistar | Restricción de llamadas             | QANOV-555341 |
          | Management Missed Calls                | postpay   | any   | Área privada Movistar | Llamadas perdidas                   | QANOV-555342 |
          | Management Premium Messages            | postpay   | any   | Área privada Movistar | Bloquear SMS/mensajería premium     | QANOV-555343 |
          | Management Private Number Call         | postpay   | any   | Área privada Movistar | Ocultación de identidad             | QANOV-555344 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with >1 mobile lines can open the '<deeplink>' OB deeplink: Disambiguation page is displayed
    Given user has a "telco" account type
      And user has a "any" role
      And user has ">1" mobile lines of "<line_type>" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "title" textfield with the "\d\d\d \d\d \d\d" format
      And each element in the "lines.list" list has the "subtitle" field
      And the "title" field of "lines.list" list entries will match the user mobile lines of "<line_type>" type

    Examples:
          | deeplink                               | line_type | jira_id      |
          | Management Check Puk And Imei          | any       | QANOV-555345 |
          | Management Robbery Suspension          | postpay   | QANOV-555346 |
          | Management Roaming                     | postpay   | QANOV-555348 |
          | Management Advance Balance             | prepay    | QANOV-555350 |
          | Management Add Bundle                  | prepay    | QANOV-555351 |
          | Management Voicemail                   | any       | QANOV-555352 |
          | Management Calls Data Restriction      | any       | QANOV-555354 |
          | Management Special Numbers Restriction | any       | QANOV-555355 |
          | Management Missed Calls                | any       | QANOV-555356 |
          | Management Premium Messages            | any       | QANOV-555357 |
          | Management Private Number Call         | any       | QANOV-555358 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario Outline: A telco user with >1 mobile lines can open the '<deeplink>' OB deeplink and clicks on any line in the Disambiguation page
    Given user has a "telco" account type
      And user has a "any" role
      And user has ">1" mobile lines of "<line_type>" type
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "<text>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | deeplink                               | line_type | header                | text                                | jira_id      |
          | Management Check Puk And Imei          | postpay   | Área privada Movistar | Consulta de PUK e IMEI              | QANOV-555359 |
          | Management Robbery Suspension          | postpay   | Área privada Movistar | Bloqueo de línea por robo o pérdida | QANOV-555360 |
          | Management Roaming                     | postpay   | Área privada Movistar | Si viajas al extranjero             | QANOV-555362 |
          | Management Advance Balance             | prepay    | TBD                   | TBD                                 | QANOV-555364 |
          | Management Add Bundle                  | prepay    | TBD                   | TBD                                 | QANOV-555365 |
          | Management Voicemail                   | postpay   | Área privada Movistar | Buzón de voz                        | QANOV-555366 |
          | Management Calls Data Restriction      | postpay   | Área privada Movistar | Bloquear las llamadas a números     | QANOV-555368 |
          | Management Special Numbers Restriction | postpay   | Área privada Movistar | Restricción de llamadas             | QANOV-555369 |
          | Management Missed Calls                | postpay   | Área privada Movistar | Llamadas perdidas                   | QANOV-555370 |
          | Management Premium Messages            | postpay   | Área privada Movistar | Bloquear SMS/mensajería premium     | QANOV-555371 |
          | Management Private Number Call         | postpay   | Área privada Movistar | Ocultación de identidad             | QANOV-555372 |

  @jira.QANOV-555373 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @smoke @ber
  Scenario: A telco postpay user with just one mobile line can open the 'Data Management' internal deeplink: Data Management page is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "1" mobile lines of "postpay" type
     When opens the "Gestiones.Data Management" deeplink with the app in "killed" status
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_management" module is displayed

  @jira.QANOV-555374 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user with >1 mobile lines can open the 'Data Management' internal deeplink: Disambiguation page is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has ">1" mobile lines of "postpay" type
     When opens the "Gestiones.Data Management" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "title" textfield with the "\d\d\d \d\d \d\d" format
      And each element in the "lines.list" list has the "subtitle" field
      And the "title" field of "lines.list" list entries will match the user mobile lines of "postpay" type

  @jira.QANOV-555375 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression @ber
  Scenario: A telco postpay user with >1 mobile lines can open the 'Data Management' internal deeplink and clicks on any line in the Disambiguation page: Data Management page is displayed
    Given user has a "telco postpay" account type
      And user has ">1" mobile lines of "postpay" type
      And user has a "admin" role
     When opens the "Gestiones.Data Management" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_management" module is displayed

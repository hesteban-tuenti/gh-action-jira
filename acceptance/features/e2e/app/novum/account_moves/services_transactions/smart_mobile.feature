# -*- coding: utf-8 -*-
@jira.QANOV-495267
Feature: Smart Mobile


  @jira.QANOV-495268 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user tries to access to the "Configure Connectivity" page: Escalation flow is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin-light" role
      And user has a "telco postpay" account type
      And user tries to access to the "Configure Connectivity" page
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-495269 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user not registered to "misTokens" tries to access to the "Configure Connectivity" page: "MisTokens Disambiguation" page is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is not registered to network tokenization
      And user tries to access to the "Configure Connectivity" page
     Then the "MisTokens Disambiguation" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Activa el programa Mis tokens" text is displayed
      And the "subtitle" textfield with "Para disfrutar de Smart Mobile, tienes que darte de alta en el programa Mis tokens y tener al menos 50 tokens para canjear." text is displayed
      And the "button" textfield with "Ir a Mis tokens" text is displayed

  @jira.QANOV-495270 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user not registered to "misTokens" clicks on the "Ir a Mis Tokens" button from the "MisTokens Disambiguation" page: NT webview is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is not registered to network tokenization
      And user tries to access to the "Configure Connectivity" page
      And user is in the "MisTokens Disambiguation" page
     When clicks on the "button" button
     Then the internal webview with "Mis tokens" header is displayed
      And the "Empezar ahora" string is displayed

  @jira.QANOV-495271 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user registered to "misTokens" but without enough tokens to activate any boost tries to access to the "Configure Connectivity" page: "MisTokens Disambiguation" page is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has "<50" tokens
      And user tries to access to the "Configure Connectivity" page
     Then the "MisTokens Disambiguation" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Consigue más tokens" text is displayed
      And the "subtitle" textfield with "Para poder activar una sesión Smart Mobile necesitas canjear al menos 50 tokens." text is displayed
      And the "button" textfield with "Conseguir tokens" text is displayed

  @jira.QANOV-495272 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user registered to "misTokens" without enough tokens to activate any boost clicks on the "Conseguir tokens" button from the "MisTokens Disambiguation" page: NT webview is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has "<50" tokens
      And user tries to access to the "Configure Connectivity" page
     When clicks on the "button" button
     Then the internal webview with "Mis Tokens" header is displayed
      And the "Conseguir tokens" string is displayed

  @jira.QANOV-495273 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @smoke @ber
  Scenario: Postpay user registered to "misTokens" with enough tokens to activate any boost can see the "Configure Connectivity" page
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     Then the "Configure Connectivity" page is displayed
      And the "Conectividad" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "Smart Mobile, tu conexión al siguiente nivel" text is displayed
      And the "subtitle" textfield that contains the "Potencia el rendimiento de tu red con Smart Mobile. Disfrutarás de más velocidad y mejor respuesta." text is displayed
      And the "subtitle" textfield that contains the "Para activar una sesión, tu línea debe ser Movistar, estar conectada a la red móvil 4G o 5G y no a la wifi para sacarle todo el partido." text is displayed
      And the "subtitle" textfield that contains the "Ten en cuenta que para activar una sesión necesitas ser parte del programa Mis tokens disponer de un mínimo de 50." text is displayed
      And the "button" button with "Comprobar" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @regression
  Scenario Outline: Postpay user <condition> clicks on the "Comprobar" button: Informative feedback is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    On iOS devices cannot check if the mobile is connected to a Movistar network, this will be done just on Android
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is <condition>
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
     Then the "Smart Mobile Informative Feedback" page is displayed
      And the "Conectividad" header is displayed
      And the "informative_icon" icon is displayed
      And the "title" textfield with "Necesitas conectarte a la red móvil 4G o 5G de Movistar" text is displayed
      And the "subtitle" textfield that contains the "Puedes activar Smart Mobile, pero no notarás ninguna mejora." text is displayed
      And the "subtitle" textfield that contains the "Recuerda que tienes que desconectar tu wifi antes de activar la sesión." text is displayed
      And the "subtitle" textfield that contains the "Si tienes otra línea Movistar en la que quieras activar el servicio, recuerda que solo se ha comprobado la red en este dispositivo por lo que podría no ser optimizable en otros." text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "go_back_link" link with "Volver al inicio" text is displayed

    @android
    Examples:
          | condition                           | jira_id      |
          | not connected to a movistar network | QANOV-495274 |

    @android @ios
    Examples:
          | condition                   | jira_id      |
          | connected to a "3G" network | QANOV-501193 |
          | connnected to wifi          | QANOV-495275 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @regression
  Scenario Outline: Postpay user connected to a Movistar network with a really <condition> internet quality clicks on the "Comprobar" button: Informative feedback is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    On iOS devices cannot check if the mobile is connected to a Movistar network, this will be done just on Android
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is connected to a movistar network
      And the internet connection is really <condition>
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
     Then the "Smart Mobile Informative Feedback" page is displayed
      And the "Conectividad" header is displayed
      And the "informative_icon" icon is displayed
      And the "title" textfield with "<title>" text is displayed
      And the "subtitle" textfield that contains the "<text1>" text is displayed
      And the "subtitle" textfield that contains the "<text2>" text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "go_back_link" link with "Volver al inicio" text is displayed

    Examples:
          | condition | title                                         | text1                                                                                                                               | text2                                                                                                                                                                             | jira_id      |
          | good      | En este momento, tu conexión es excelente     | Puedes activar Smart Mobile, pero no notarás ninguna mejora.                                                                        | Si tienes otra línea Movistar en la que quieras activar el servicio, recuerda que solo se ha comprobado la red en este dispositivo por lo que podría no ser optimizable en otros. | QANOV-495276 |
          | bad       | Parece que hay algún problema con tu conexión | Quizás tengas poca cobertura, estés lejos de una antena o entre mucha gente. Puedes activar el servicio, pero no notarás la mejora. | Si tienes otra línea Movistar en la que quieras activar el servicio, recuerda que solo se ha comprobado la red en este dispositivo por lo que podría no ser optimizable en otros. | QANOV-495277 |

  @jira.QANOV-495278 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user connected that does not meets the requisites for the boost in Informative feedback page click on the "Volver al inicio" link: Start of the flow is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is connected to wifi
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "go_back_link" link
     Then the "Smart Mobile Informative Feedback" page is closed
      And the user is in the page from which started the flow

  @jira.QANOV-495279 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @smoke
  Scenario: Postpay user connected to a Movistar network with a bad internet quality clicks on the "Comprobar" button: OK feedback
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    On iOS devices cannot check if the mobile is connected to a Movistar network, this will be done just on Android
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is connected to a movistar network
      And user is connected to a "4G/5G" network
      And the internet connection is bad
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
     Then the "Smart Mobile Informative Feedback" page is displayed
      And the "Conectividad" header is displayed
      And the "internet_icon" icon is displayed
      And the "title" textfield with "¡Listo! Ya puedes optimizar tu conexión" text is displayed
      And the "subtitle" textfield that contains the "Esta línea cumple los requisitos para potenciar la red con Smart Mobile." text is displayed
      And the "subtitle" textfield that contains the "Si tienes otra línea Movistar en la que quieras activar el servicio, recuerda que solo se ha comprobado la red en este dispositivo por lo que podría no ser optimizable en otros." text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "go_back_link" link is not displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @smoke @ber
  Scenario Outline: Postpay user with <num_lines> lines clicks on the "Continuar" button: "Smart Mobile Line Selection" page is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    On iOS devices cannot check if the mobile is connected to a Movistar network, this will be done just on Android
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has "<num_lines>" products of "mobile_line" type
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is connected to a movistar network
      And user is connected to a "4G/5G" network
      And the internet connection is bad
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
     Then the "Smart Mobile Line Selection" page is displayed
      And the "Conectividad" header is displayed
      And the "title" textfield with "Mejora tu experiencia de red" text is displayed
      And the "subtitle" textfield that contains the "Selecciona tu línea para activar la sesión" text is displayed
      And the "mobile_lines_list" list is displayed
      And the "mobile_lines_list" list has "<num_lines>" entries
      And each element in the "mobile_lines_list" list has the "icon" field
      And each element in the "mobile_lines_list" list has the "phone_number" textfield with the "\d\d\d \d\d\d \d\d\d" format
      And each element in the "mobile_lines_list" list has the "radio_button" field
      And the "continue_button" button with "Continuar" text is displayed

    Examples:
          | num_lines | jira_id      |
          | 1         | QANOV-495280 |
          | >1        | QANOV-501196 |

  @jira.QANOV-495282 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with the boost active in one line won't see that line in the list to activate in the "Smart Mobile Line Selection" page
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has ">1" products of "mobile_line" type
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user has the boost active for "1" line
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
     Then the "Smart Mobile Line Selection" page is displayed
      And the "Conectividad" header is displayed
      And the "mobile_lines_list" list is displayed
      And the "mobile_lines_list" list does not have any line with the boost active

  @jira.QANOV-495283 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Smart Mobile Line Selection" page clicks on the "Continuar" button without selecting any line: Crouton is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "continue_button" button
     Then the "crouton_message" textfield with "Selecciona una línea para continuar" text is displayed

  @jira.QANOV-495284 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @smoke
  Scenario: Postpay user in the "Smart Mobile Line Selection" page clicks on the "Continuar" button selecting any line: "Smart Mobile Minutes Selection" page is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
     Then the "Smart Mobile Minutes Selection" page is displayed
      And the "Conectividad" header is displayed
      And the "actual_balance.icon" icon is displayed
      And the "actual_balance.title" textfield with "Balance actual" text is displayed
      And the "actual_balance.amount" textfield with the "\d+ tokens" format is displayed
      And the "minutes_selection_title" textfield with "Selecciona la duración que prefieras" text is displayed
      And the "minutes_selection_list" list is displayed
      And the "minutes_selection_list" list has "3" entries
      And each element in the "minutes_selection_list" list has the "duration" textfield with the "\d+ minutos" format
      And each element in the "minutes_selection_list" list has the "tokens" textfield with the "\d+ tokens" format
      And each element in the "minutes_selection_list" list has the "radio_button" field
      And the "terms_and_conditions" checkbox is displayed
      And the "terms_and_conditions_text" textfield with "He léido los términos y condiciones" text is displayed
      And the "terms_and_conditions_link" link with "términos y condiciones" text is displayed
      And the "activate_button" button with "Activar Boost" text is displayed

  @jira.QANOV-495285 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Smart Mobile Minutes Selection" page clicks on the "términos y condiciones" link: PDF will be opened
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "terms_and_conditions_link" link
     Then a PDF with the terms and conditions is opened

  @jira.QANOV-495286 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Smart Mobile Minutes Selection" page clicks in the "Activar Boost" button without selecting any minutes: crouton is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "activate_button" link
     Then the "crouton_message" textfield with "Selecciona una duración para continuar" text is displayed

  @jira.QANOV-495287 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user without enough tokens to select a boost in the "Smart Mobile Minutes Selection" page clicks on that boost and in the activate button: crouton is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has "50" tokens
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the option with ">50" tokens value in the "minutes_selection_list" list
      And clicks on the "activate_button" link
     Then the "crouton_message" textfield with "Necesitas más tokens para seleccionar esta duración" text is displayed
      And the "crouton_message" crouton is displayed in "red" color

  @jira.QANOV-495288 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Smart Mobile Minutes Selection" page clicks in the "Activar Boost" button without accepting the T&C: crouton is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "0" element in the "minutes_selection_list" list
      And clicks on the "activate_button" link
     Then the "crouton_message" textfield with "Acepta los términos y condiciones para continuar" text is displayed

  @jira.QANOV-495289 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Smart Mobile Minutes Selection" page tries to activate the boost but an error happened: Error feedback is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "0" element in the "minutes_selection_list" list
      And clicks on the "terms_and_conditions" checkbox
      And clicks on the "activate_button" link
      And an error happens during the operation
     Then the "Smart Mobile Ko Feedback" page is displayed
      And the "Conectividad" header is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "Tu sesión Smart Mobile no se ha activado" text is displayed
      And the "negative_feedback_subtitle" textfield with "Ha ocurrido un error durante la activación. Inténtalo de nuevo más tarde." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Smart Mobile Minutes Selection" page is displayed

  @jira.QANOV-495290 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Smart Mobile Ko Feedback" page clicks on the "Reintentar" button: The operation will be retried
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "0" element in the "minutes_selection_list" list
      And clicks on the "terms_and_conditions" checkbox
      And clicks on the "activate_button" link
      And an error happens during the operation
      And clicks on the "retry" button
      And the operation goes good
     Then the "Smart Mobile Success Feedback" page is displayed
      And the "success_feedback_icon" icon is displayed
      And the "success_feedback_title" textfield with "Has activado una sesión Smart Mobile" text is displayed
      And the "success_feedback_subtitle" textfield with "Tu conexión se optimizará durante el tiempo que hayas seleccionado." text is displayed
      And the "button" button with "Entendido" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-495291 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @smoke
  Scenario: Postpay user in the "Smart Mobile Minutes Selection" page can activate the boost: Success feedback is displayed
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "0" element in the "minutes_selection_list" list
      And clicks on the "terms_and_conditions" checkbox
      And clicks on the "activate_button" link
     Then the "Smart Mobile Success Feedback" page is displayed
      And the "success_feedback_icon" icon is displayed
      And the "success_feedback_title" textfield with "Has activado una sesión Smart Mobile" text is displayed
      And the "success_feedback_subtitle" textfield with "Tu conexión se optimizará durante el tiempo que hayas seleccionado." text is displayed
      And the "button" button with "Entendido" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-495292 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user in the "Success feedback" page can close the Feedback
    The access to the 'Configure Connectivity' page could be done from:
    - Deeplink: /link/smart-mobile-activation
    - Explore page (if the user has landline, mobile line and app version >= 14.11)
    NOTE: The 'Configure Connectivity' page will be discriminated by an audience so, there is no error cases for users without landline or mobile line or with app version < 14.11
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "greater" than "14.11"
      And user is registered to network tokenization
      And user has ">=50" tokens
      And user does not have the boost active for "all" lines
      And user is in the "Configure Connectivity" page
     When clicks on the "button" button
      And the "Smart Mobile Informative Feedback" page is displayed
      And clicks on the "continue_button" button
      And the "Smart Mobile Line Selection" page is displayed
      And clicks on the "0" element in the "mobile_lines_list" list
      And clicks on the "continue_button" button
      And the "Smart Mobile Minutes Selection" page is displayed
      And clicks on the "0" element in the "minutes_selection_list" list
      And clicks on the "terms_and_conditions" checkbox
      And clicks on the "activate_button" link
      And the "Smart Mobile Success Feedback" page is displayed
      And clicks on the "button" button
     Then the "Configure Connectivity" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @regression
  Scenario Outline: Postpay user without <product> access to the "Configure Connectivity" page: Empty case is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user does not have "<product>" product
      And user is in the "Smart Mobile Dashboard" page
     Then the "title" textfield with "Smart Mobile" text is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "<title>" text is displayed
      And the "empty_case.subtitle" textfield with "<subtitle>" text is displayed

    Examples:
          | product     | title                                                         | subtitle                                                                                                   | jira_id      |
          | landline    | Necesitas tener una línea fija para activar este servicio     | Para optimizar la conexión de una línea móvil con Smart Mobile, necesitas tener contratada una línea fija. | QANOV-495295 |
          | mobile_line | Necesitas al menos una línea móvil para activar este servicio | No tienes líneas móviles en las que activar esta mejora.                                                   | QANOV-495296 |

  @jira.QANOV-495297 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with the app version < 14.11 access to the "Smart Mobile Dashboard" page: Empty case is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "lower" than "14.11"
      And user is in the "Smart Mobile Dashboard" page
     Then the "title" textfield with "Smart Mobile" text is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Necesitas tener la app de Movistar actualizada" text is displayed
      And the "empty_case.subtitle" textfield with "Actualiza la app para poder acceder al servicio de Smart Mobile" text is displayed
      And the "empty_case.button" textfield with "Actualizar app" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @regression
  Scenario Outline: Postpay user with the app version <14.11 clicks on the "Actualizar app" button: <app> is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And the app version is "lower" than "14.11"
      And user is in the "Smart Mobile Dashboard" page
     When clicks on the "empty_case.button" button
     Then the "<app>" app is displayed
      And the "Mi Movistar" page is displayed in the "<app>" store

    @android
    Examples:
          | app        | jira_id      |
          | Play Store | QANOV-516627 |

    @ios
    Examples:
          | app       | jira_id      |
          | App Store | QANOV-516628 |

  @jira.QANOV-495298 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with landline and mobile line without boost sessions access to the "Smart Mobile Dashboard" page: Empty case is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for "0" lines
      And user is in the "Smart Mobile Dashboard" page
     Then the "title" textfield with "Smart Mobile" text is displayed
      And the "active_sessions_title" textfield with "Sesiones activas" text is displayed
      And the "active_sessions" list is not displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "En este momento no tienes sesiones activas" text is displayed
      And the "empty_case.subtitle" textfield with "Aquí verás en qué líneas tienes una sesión activa y cuánto tiempo le queda." text is displayed
      And the "managment_title" textfield with "Gestiones" text is displayed
      And the "management_carousel" carousel with "Activar Smart Mobile" cards is displayed

  @jira.QANOV-495299 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with landline and mobile line without boost sessions clicks on the access to the "Activar Smart Mobile" button: "Configure Connectivity" page is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for "0" lines
      And user is in the "Smart Mobile Dashboard" page
     When clicks on the "Activar Smart Mobile" button
     Then the "Configure Connectivity" page is displayed
      And the "Conectividad" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "Smart Mobile, tu conexión al siguiente nivel" text is displayed

  @jira.QANOV-495294 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user without sessions clicks on the 'Activar Smart Mobile' button: Escalation is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin-light" role
      And user has the boost active for "0" lines
      And user has a "telco postpay" account type
      And user is in the "Smart Mobile Dashboard" page
     When clicks on the "Activar Smart Mobile" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-495300 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves @smoke @ber
  Scenario: Postpay user with landline and mobile line with boost sessions in all the lines can access to the "Smart Mobile Dashboard" page: List is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for "all" lines
      And user is in the "Smart Mobile Dashboard" page
     Then the "Conectividad" header is displayed
      And the the "title" textfield with "Smart Mobile" text is displayed
      And the "active_sessions_title" textfield with "Sesiones activas" text is displayed
      And the "active_sessions" list has one entry for each mobile line
      And each element in the "active_sessions" list has the "icon" field
      And each element in the "active_sessions" list has the "duration" textfield with the "Termina a las \d\d\:\d\d h" format
      And each element in the "active_sessions" list has the "mobile_line" textfield with the "\d\d\d \d\d\d \d\d\d" format
      And the "managment_title" textfield is not displayed
      And the "management_carousel" carousel is not displayed

  @jira.QANOV-495301 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with landline and mobile line with boost sessions but not in all the lines can access to the "Smart Mobile Dashboard" page: List and services are displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for ">0" lines
      And user has not the boost active for "all" lines
      And user is in the "Smart Mobile Dashboard" page
     Then the "title" textfield with "Smart Mobile" text is displayed
      And the "active_sessions_title" textfield with "Sesiones activas" text is displayed
      And the "active_sessions" list has ">0" entries
      And each element in the "active_sessions" list has the "icon" field
      And each element in the "active_sessions" list has the "duration" textfield with the "Termina a las \d\d\:\d\d h" format
      And each element in the "active_sessions" list has the "mobile_line" textfield with the "\d\d\d \d\d\d \d\d\d" format
      And the "managment_title" textfield with "Gestiones" text is displayed
      And the "management_carousel" carousel with "Activar Smart Mobile en otra línea" cards is displayed

  @jira.QANOV-495302 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with landline and mobile line with boost sessions but not in all the lines clicks on the access to the "Activar Smart Mobile" button: "Configure Connectivity" page is displayed
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for ">0" lines
      And user has not the boost active for "all" lines
      And user is in the "Smart Mobile Dashboard" page
     When clicks on the "Activar Smart Mobile en otra línea" button
     Then the "Configure Connectivity" page is displayed
      And the "Conectividad" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "Smart Mobile, tu conexión al siguiente nivel" text is displayed

  @jira.QANOV-495303 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user with the boost active in the current line access to the "Smart Mobile Dashboard" page: One line is displayed in the list
    The access to the 'Smart Mobile Dashboard' page could be done from:
    - Deeplink: /link/connectivity-boost
    - Mis productos dashboard if the user has any session active
    Given user has a "admin" role
      And user has a "admin-light" role
      And user has a "telco postpay" account type
      And user has the boost active for the current line
      And user is in the "Smart Mobile Dashboard" page
     Then the "title" textfield with "Smart Mobile" text is displayed
      And the "active_sessions_title" textfield with "Sesiones activas" text is displayed
      And the "active_sessions" list has "1" entries
      And each element in the "active_sessions" list has the "icon" field
      And each element in the "active_sessions" list has the "duration" textfield with the "Termina a las \d\d\:\d\d h" format
      And each element in the "active_sessions" list has the "mobile_line" textfield with the "\d\d\d \d\d\d \d\d\d" format
      And just the current line is displayed in the "active_sessions" list
      And the "managment_title" textfield is not displayed
      And the "management_carousel" carousel is not displayed

  @jira.QANOV-495304 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with a boost session that just expired will se a notification
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for ">0" lines
     When the boost session expires
     Then a notification in received
      And the "notification_icon" icon is displayed
      And the "notification_title" textfield with "Mi Movistar" text is displayed
      And the "notification_body" textfield with the "La sesión de tu línea \d\d\d \d\d\d \d\d\d ha terminado" format is displayed

  @jira.QANOV-495305 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-492944 @manual @mobile @moves
  @regression
  Scenario: Postpay user with a boost session that just expired clicks on the notification: "Smart Mobile Dashboard" page is displayed
    Given user has a "admin" role
      And user has a "telco postpay" account type
      And user has a "landline" product
      And user has a "mobile_line" product
      And user has the boost active for ">0" lines
     When the boost session expires
      And a notification in received
      And clicks on the notification
     Then the "Smart Mobile Dashboard" page is displayed
      And the "title" textfield with "Smart Mobile" text is displayed
      And the "active_sessions_title" textfield with "Sesiones activas" text is displayed

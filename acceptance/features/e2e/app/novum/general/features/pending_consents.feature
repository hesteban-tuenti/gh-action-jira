# -*- coding: utf-8 -*-
@jira.QANOV-204878
Feature: Pending Consents


  @jira.QANOV-204879 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT without pending consents access to the App: Landing page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has not "pending" consents
      And user has a "any_admin" role
      And user is logged out
     When user is logged in
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-204880 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599
  @automatic @mobile @moves @sanity @ber @qa
  Scenario: TELCO ADMIN or ADMIN-LIGHT with pending consents access to the App: Consents Gathering page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    2022-23 NOTES: The "Aceptar todas" button will be removed temporally until the UX team included the "Rechazar todas" button
    Given user has a "telco" account type
      And user has a pending consent
      And user has a "any_admin" role
      And user is logged out
      When user logs in to see the consents page
     Then the "Consents Gathering" page is displayed
      And the "Preferencias de privacidad" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "title" textfield with "Preferencias de privacidad" text is displayed
      And the "description" textfield is displayed
      And the "accept_all" button with "Aceptar todas" text is displayed
      And the "reject_all" button with "Rechazar todas" text is displayed
      And the "consents_list" list is displayed
      And each element in the "consents_list" list has the "label" label with "Pendiente" text
      And each element in the "consents_list" list has the "label" element with "yellow" color
      And each element in the "consents_list" list has the "title" field
      And each element in the "consents_list" list has the "description" field
      And each element in the "consents_list" list has the "accept_button" button with "Aceptar" text
      And each element in the "consents_list" list has the "reject_button" button with "Rechazar" text
      And each element in the "consents_list" list has the "link" link with "Más información" text
      And the "save" button with "Guardar cambios" text is displayed

  @jira.QANOV-204881 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT can close the Consents Gathering page: Start tab page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user is in the "Consents Gathering" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-204890 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "Aceptar todas" button in the Consents Gathering page: Manage Pending Consents Popup is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    2022-23 NOTES: The "Aceptar todas" button will be removed temporally until the UX team included the "Rechazar todas" button
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Gathering" page
     When clicks on the "accept_all" button
     Then the "Manage Pending Consents" popup is displayed
      And the "popup.title" textfield with "¿Aceptar todas las preferencias?" text is displayed
      And the "popup.message" textfield with "Podrás descargar el PDF y modificar de nuevo las preferencias en tu perfil" text is displayed
      And the "popup.accept" button with "Aceptar todas" text is displayed
      And the "popup.cancel" button with "Cancelar" text is displayed

  @jira.QANOV-204891 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "Cancelar" button in the Manage Pending Consents Popup from the Consents Gathering page: Popup will be closed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user is in the "Consents Gathering" page
     When clicks on the "accept_all" button
      And the "Manage Pending Consents" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Consents Gathering" page is displayed

  @jira.QANOV-204892 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "navigation_top_bar.close_button" button in the Consents Gathering page without accept/decline any consent: Page is closed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user is in the "Consents Gathering" page
      And user manages "0" pending consents
     When clicks on the "navigation_top_bar.close_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-204893 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "Guardar cambios" button in the Consents Gathering page without accept/decline any consent: A crouton is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user is in the "Consents Gathering" page
      And user manages "0" pending consents
     When clicks on the "save" button
     Then the "crouton_message" textfield with "No has realizado ningún cambio" text is displayed
      And the "Consents Gathering" page is displayed

  @jira.QANOV-204894 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "Aceptar todas" button in the Manage Pending Consents Popup from the Consents Gathering page: 'Consents Management Success Feedback' page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    2022-23 NOTES: The "Aceptar todas" button will be removed temporally until the UX team included the "Rechazar todas" button
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user is in the "Consents Gathering" page
     When clicks on the "accept_all" button
      And the "Manage Pending Consents" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Consents Management Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Los cambios se han guardado correctamente" text is displayed
      And the "success_message" textfield with "Ahora puedes descargar el PDF y, si lo necesitas, modificar de nuevo las preferencias desde tu perfil" text is displayed
      And the "main" button with "Descargar PDF" text is displayed
      And the "secondary" button with "Cerrar" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves @smoke
  Scenario Outline: TELCO ADMIN or ADMIN-LIGHT taps on the "<button_copy>" button of any pending consent: The "<button_copy>" button is shown checked
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Gathering" page
     When clicks on the "<button>" button of any element of the "consents_list" list
     Then the "<button>" button is shown checked

    Examples:
          | button_copy | button        | jira_id      |
          | Aceptar     | accept_button | QANOV-204895 |
          | Rechazar    | reject_button | QANOV-204896 |

  @jira.<jira_id> @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves @regression
  Scenario Outline: TELCO ADMIN or ADMIN-LIGHT can access to the Description Consent page for a '<consent_status>' consent
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Gathering" page
     When clicks on the "link" link of a consent in "<consent_status>" status in the "consents_list" list
     Then the "Description Consent" page is displayed
      And the "[CONTEXT:selected_consent.title]" header is displayed
      And the "label" label with "Pendiente" text is displayed
      And the "label" label is displayed in "yellow" color
      And the "title" textfield with "[CONTEXT:selected_consent.title]" text is displayed
      And the "description" textfield is displayed
      And the "mobile_lines_with_this_consent_title" textfield with "Líneas a las que aplica" text is displayed
      And each element in the "mobile_lines_with_this_consent" list has the "icon" field
      And each element in the "mobile_lines_with_this_consent" list has the "title" field
      And the "manage_consents_text" textfield with "¿Quieres aceptar o rechazar esta preferencia?" text is displayed
      And the "accept_button" button with "Aceptar" text is displayed
      And the "reject_button" button with "Rechazar" text is displayed
      And the "<checked_button>" button is shown checked
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consents Gathering" page is displayed

    Examples:
          | consent_status | checked_button | jira_id      |
          | accepted       | accept_button  | QANOV-204899 |
          | rejected       | reject_button  | QANOV-204900 |
          | pending        | none           | QANOV-204901 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile
  @moves
  Scenario Outline: TELCO ADMIN or ADMIN-LIGHT can '<action>' a consent in <consent_status> status from the Description Consent page
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Gathering" page
     When clicks on the "link" link of a consent in "<consent_status>" status in the "consents_list" list
      And the "Description Consent" page is displayed
      And clicks on the "<manage_button>" button
     Then the "label" label with "Pendiente" text is displayed
      And the "label" label is displayed in "yellow" color
      And the "title" textfield with "[CONTEXT:selected_consent.title]" text is displayed
      And the "description" textfield is displayed
      And the "mobile_lines_with_this_consent_title" textfield with "Líneas a las que aplica" text is displayed
      And each element in the "mobile_lines_with_this_consent" list has the "icon" field
      And each element in the "mobile_lines_with_this_consent" list has the "title" field
      And the "manage_consents_text" textfield with "¿Quieres aceptar o rechazar esta preferencia?" text is displayed
      And the "accept_button" button with "Aceptar" text is displayed
      And the "reject_button" button with "Rechazar" text is displayed
      And the "<checked_button>" button is shown checked
      And the "<unchecked_buttons>" buttons are shown unchecked
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consents Gathering" page is displayed

    Examples:
          | action | consent_status | manage_button | checked_button | unchecked_buttons | test_priority | jira_id      |
          | accept | pending        | accept_button | accept_button  | reject_button     | regression    | QANOV-204902 |
          | reject | pending        | reject_button | reject_button  | accept_button     | regression    | QANOV-204903 |
          | reject | accepted       | reject_button | reject_button  | accept_button     | regression    | QANOV-204905 |
          | accept | rejected       | accept_button | accept_button  | reject_button     | smoke         | QANOV-204907 |

  @jira.QANOV-204908 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN-LIGHT can access to the Description Consent page for any consent: the lines list will contain the line with which the user is logged in
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "admin-light" role
      And user is in the "Consents Gathering" page
     When clicks on the "link" link of any element of the "consents_list" list
     Then the "Description Consent" page is displayed
      And the "[CONTEXT:selected_consent.title]" header is displayed
      And the "mobile_lines_with_this_consent_title" textfield with "Líneas a las que aplica" text is displayed
      And each element in the "mobile_lines_with_this_consent" list has the "icon" field
      And each element in the "mobile_lines_with_this_consent" list has the "title" field
      And any element in the "mobile_lines_with_this_consent" list has the "title" textfield with the "[CONTEXT:logged_mobile_line]" text
      And the "manage_consents_text" textfield with "¿Quieres aceptar o rechazar esta preferencia?" text is displayed
      And the "accept_button" button with "Aceptar" text is displayed
      And the "reject_button" button with "Rechazar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consents Gathering" page is displayed

  @jira.QANOV-204909 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves @smoke
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "Guardar cambios" button in the Consents Gathering page after accept/decline any consent: 'Consents Management Success Feedback' page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user manages ">0" pending consents
      And user is in the "Consents Gathering" page
     When clicks on the "save" button
     Then the "Consents Management Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Los cambios se han guardado correctamente" text is displayed
      And the "success_message" textfield with "Ahora puedes descargar el PDF y, si lo necesitas, modificar de nuevo las preferencias desde tu perfil" text is displayed
      And the "main" button with "Descargar PDF" text is displayed
      And the "secondary" button with "Cerrar" text is displayed

  @jira.QANOV-204910 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT taps on the "navigation_top_bar.close_button" button in the Consents Gathering page after accept/decline any consent: page will be closed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user manages ">0" pending consents
      And user is in the "Consents Gathering" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-204911 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT can close the Consents Management Success Feedback: Start tab page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Management Success Feedback" page
     When clicks on the "secondary" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-204912 @android @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT can download a PDF with the summary of the managed consents on Android devices
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Management Success Feedback" page
     When clicks on the "main" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-204913 @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT can download a PDF with the summary of the managed consents on iOS devices
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Management Success Feedback" page
     When clicks on the "main" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.QANOV-204914 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT access to the 'Consents Management Success Feedback' page but the API fails and No PDF is returned
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user manages ">0" pending consents
      And user is in the "Consents Gathering" page
     When clicks on the "save" button
      And the API that provides the PDF file fails
     Then the "Consents Management Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Los cambios se han guardado correctamente" text is displayed
      And the "success_message" textfield is not displayed
      And the "main" button with "Cerrar" text is displayed
      And the "secondary" button is not displayed

  @jira.QANOV-204915 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT tries to download the PDF file but there is an API error: Error feedback screen is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user manages ">0" pending consents
      And user is in the "Consents Gathering" page
     When clicks on the "save" button
      And there is an API error
     Then the "Consents Management Error Feedback" page is displayed
      And the "Guardar cambios" header is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Algo ha ido mal" text is displayed
      And the "error_message" textfield with "El proceso no se ha completado. Inténtelo de nuevo más tarde." text is displayed
      And the "main" button with "Volver a mi línea" text is displayed

  @jira.QANOV-204916 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT saves the consents changes but there is an API error: Error feedback screen is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is logged out
      And user is logged in
      And user manages ">0" pending consents
      And user is in the "Consents Gathering" page
     When clicks on the "save" button
      And the "Consents Management Success Feedback" page is displayed
      And clicks on the "main" button
      And the API that provides the PDF file fails
     Then the "Consents Management Error Feedback" page is displayed
      And the "Descargar PDF" header is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Algo ha ido mal" text is displayed
      And the "error_message" textfield with "El PDF no se ha descargado. Inténtalo de nuevo más tarde." text is displayed
      And the "main" button with "Volver a mi línea" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves @regression
  Scenario Outline: TELCO ADMIN or ADMIN-LIGHT who was on the 'Consents Management Error Feedback' page taps on the '<button_text>' button: Start tab page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Management Error Feedback" page
     When clicks on the "<button>" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | button                          | button_text                     | jira_id      |
          | main                            | Volver a mi línea               | QANOV-204917 |
          | navigation_top_bar.close_button | navigation_top_bar.close_button | QANOV-204918 |

  @jira.QANOV-223639 @android @ios @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-194599 @manual @mobile @moves
  @regression
  Scenario: TELCO ADMIN or ADMIN-LIGHT who was on the 'Consents Management Error Feedback' page taps on the 'navigation_top_bar.back_button' button: 'Consents Gathering' page is displayed
    The 'Consents Gathering' page will be displayed:
    - after a login
    - Setting the app to Foreground 24 hours (aprox) after closing the 'Consents Gathering' page before
    Given user has a "telco" account type
      And user has a "pending" consent
      And user has a "any_admin" role
      And user is in the "Consents Management Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Consents Gathering" page is displayed

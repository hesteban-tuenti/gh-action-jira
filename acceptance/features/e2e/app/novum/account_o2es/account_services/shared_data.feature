# -*- coding: utf-8 -*-
@jira.QANOV-492994
Feature: Shared data

  Actions Before each Scenario:
    Given user has a "convergente" plan
      And user is in the "Mobile Dashboard" page
      And user has the matching subscription selected in the account
      And user has the "Services List" module configured in CMS for "Mobile Dashboard" page


  @jira.QANOV-492995 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user with data sharing deactivated can see the deactivated tag in the service row from Mobile Dashboard screen
    Given user has data sharing deactivated
     Then the "shared_data_row.title" textfield with "Compartir datos" text is displayed
      And the "shared_data_row.tag" tag with "Desactivado" text is displayed
      And the "shared_data_row.tag" tag is displayed in "grey" color

  @jira.QANOV-492996 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A convergente user with data sharing activated can see the activated tag in the service row from Mobile Dashboard screen
    Given user has data sharing activated
      And the "shared_data_row.tag" tag with "Activado" text is displayed
      And the "shared_data_row.tag" tag is displayed in "blue" color

  @jira.QANOV-492997 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A convergente user can access the data sharing info screen from Mobile Dashboard screen
     When clicks on the "shared_data_row" entrypoint
     Then the "Data Sharing" page is displayed
      And the "Compartir datos" header is displayed
      And the "title_1" textfield with "¿En qué consiste este servicio?" text is displayed
      And the "text_1" textfield with "Con este servicio, todas las líneas móviles asociadas a tu fibra comenzarán a compartir sus datos entre ellas. La activación no tiene coste y se renovará automáticamente cada mes." text is displayed
      And the "title_2" textfield with "¿Cúando puedo activarlo?" text is displayed
      And the "text_2" textfield with "Este servicio se puede activar solo una vez en cada ciclo de facturación. Si lo desactivas en mitad de un ciclo de facturación, no podrás volver a activarlo hasta el próximo ciclo." text is displayed
      And the "activate_button" button with "Activar" text is displayed

  @jira.QANOV-492998 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A convergente user can see the popup to activate data sharing
    Given user has data sharing deactivated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "activate_button" button
     Then the "Sharing Data Popup" popup is displayed
      And the "popup.title" textfield with "¿Activar Compartir datos?" text is displayed
      And the "popup.text" textfield with "Recuerda que solo podrás hacerlo una vez en cada ciclo de facturación" text is displayed
      And the "popup.accept" button with "Activar" text is displayed
      And the "popup.accept" button with "Cancelar" text is displayed

  @jira.QANOV-492999 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user can cancel the activatation of data sharing
    Given user has data sharing deactivated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "activate_button" button
      And clicks on the "popup.cancel" button
     Then the "Data Sharing" popup is not displayed
      And the "Data Sharing" page is displayed

  @jira.QANOV-493000 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user can activate data sharing service
    Given user has data sharing deactivated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "activate_button" button
      And clicks on the "popup.accept" button
     Then the "Feedback Data Sharing" page is displayed
      And the "check_icon" icon is displayed
      And the "title" textfield with "Estamos activando el servicio" text is displayed
      And the "text" textfield with "Recibirás un SMS de confirmación en unas horas, cuando se empiecen a compartir los datos." text is displayed
      And the "back_button" button with "Volver al inicio" text is displayed

  @jira.QANOV-493001 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user that activates data sharing service can go back to Mobile Dashboard screen
    Given user has data sharing deactivated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "activate_button" button
      And clicks on the "popup.accept" button
      And the "Feedback Data Sharing" page is displayed
      And clicks on the "back_button" button
     Then the "Mobile Dashboard" page is displayed

  @jira.QANOV-493002 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user tries to activate data sharing service: An error occurs
    Given user has data sharing deactivated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "activate_button" button
      And clicks on the "popup.accept" button
      And an error occurs
     Then the "Feedback Data Sharing" page is displayed
      And the "warning_icon" icon is displayed
      And the "title" textfield with "Compartir datos no se ha activado" text is displayed
      And the "text" textfield with "El servicio Compartir datos no se ha activado. Por favor, inténtalo de nuevo más tarde. Si el problema continúa, ponte en contacto con nosotros en el 1551." text is displayed
      And the "back_button" button with "Volver al inicio" text is displayed

  @jira.QANOV-493003 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user that tries to activate data sharing service and an error occurs during the process can go back to Mobile Dashboard screen
    Given user has data sharing deactivated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "activate_button" button
      And clicks on the "popup.accept" button
      And an error occurs
      And the "Feedback Data Sharing" page is displayed
      And clicks on the "back_button" button
     Then the "Mobile Dashboard" page is displayed

  @jira.QANOV-493004 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A convergente user can see the popup to deactivate data sharing
    Given user has data sharing activated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "deactivate_button" button
     Then the "Sharing Data Popup" popup is displayed
      And the "popup.title" textfield with "¿Desactivar Compartir datos?" text is displayed
      And the "popup.text" textfield with "No podrás volver a activarlo hasta el próximo ciclo de facturación" text is displayed
      And the "popup.accept" button with "Desactivar" text is displayed
      And the "popup.accept" button with "Cancelar" text is displayed

  @jira.QANOV-493005 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user can cancel the deactivatation of data sharing
    Given user has data sharing activated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "deactivate_button" button
      And clicks on the "popup.cancel" button
     Then the "Data Sharing" popup is not displayed
      And the "Data Sharing" page is displayed

  @jira.QANOV-493006 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user can deactivate data sharing service
    Given user has data sharing activated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "deactivate_button" button
      And clicks on the "popup.accept" button
     Then the "Feedback Data Sharing" page is displayed
      And the "check_icon" icon is displayed
      And the "title" textfield with "Has desactivado Compartir datos" text is displayed
      And the "text" textfield with "Recibirás un SMS en las próximas horas con la confirmación de la desactivación." text is displayed
      And the "back_button" button with "Volver al inicio" text is displayed

  @jira.QANOV-493007 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user can go back to Mobile Dashboard screen after deactivate data sharing service
    Given user has data sharing activated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "deactivate_button" button
      And clicks on the "popup.accept" button
      And the "Feedback Data Sharing" page is displayed
      And clicks on the "back_button" button
     Then the "Mobile Dashboard" page is displayed

  @jira.QANOV-493008 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user tries to deactivate data sharing service: An error occurs
    Given user has data sharing activated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "deactivate_button" button
      And clicks on the "popup.accept" button
      And an error occurs
     Then the "Feedback Data Sharing" page is displayed
      And the "warning_icon" icon is displayed
      And the "title" textfield with "Compartir datos no se ha desactivado" text is displayed
      And the "text" textfield with "El servicio Compartir datos no se ha desactivado. Por favor, inténtalo de nuevo más tarde. Si el problema continúa, ponte en contacto con nosotros en el 1551." text is displayed
      And the "back_button" button with "Volver al inicio" text is displayed

  @jira.QANOV-493009 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user goes back to Mobile Dashboard screen after an error occurs trying to deactivate data sharing service
    Given user has data sharing activated
     When clicks on the "shared_data_row" entrypoint
      And the "Data Sharing" page is displayed
      And clicks on the "deactivate_button" button
      And clicks on the "popup.accept" button
      And an error occurs
      And the "Feedback Data Sharing" page is displayed
      And clicks on the "back_button" button
     Then the "Mobile Dashboard" page is displayed

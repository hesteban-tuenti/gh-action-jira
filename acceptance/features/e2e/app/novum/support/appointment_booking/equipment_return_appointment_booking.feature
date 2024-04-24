# -*- coding: utf-8 -*-
@jira.QANOV-293571
Feature: Equipment Return Appointment Booking


  @jira.QANOV-293572 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves @smoke
  Scenario: A user can see the option to return equipment in the appointment booking service list
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
     Then the "Store Appointment Booking Service Selection" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "Selecciona el servicio que necesitas" text is displayed
      And the "appointment_booking_services" list is displayed
      And the "4" element in the "appointment_booking_services" list with "5. Devolución de equipos" text is displayed

  @jira.QANOV-293573 @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves @regression
  Scenario: A user that selects the option to return equipment in the Store Appointment Booking Service Selection sees a popup when locker is available in iOS devices
    Given user is in the "Store Appointment Booking" page
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
     Then the "Locker Available" popup is displayed
      And the "popup.title" textfield with "Tienda con Locker disponible" text is displayed
      And the "popup.message" textfield with "Entrega tus equipos sin esperas." text is displayed
      And the "popup.accept" button with "Reservar mi locker" text is displayed
      And the "popup.cancel" button with "Continuar reserva" text is displayed

  @jira.QANOV-293574 @android @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves @regression
  Scenario: A user that selects the option to return equipment in the Store Appointment Booking Service Selection sees a popup when locker is available in Android devices
    TBC if close button will be displayed
    Given user is in the "Store Appointment Booking" page
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
     Then the "Locker Available" popup is displayed
      And the "popup.title" textfield with "Tienda con Locker disponible" text is displayed
      And the "popup.message" textfield with "Entrega tus equipos sin esperas." text is displayed
      And the "popup.accept" button with "RESERVAR MI LOCKER" text is displayed
      And the "popup.cancel" button with "CONTINUAR RESERVA" text is displayed
      And the "popup.close_button" button is displayed

  @jira.QANOV-293575 @android @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves @regression
  Scenario: A user that closes the Locker Available popup in Android continues the appointment booking flow
    TBC if close button will be displayed
    Given user is in the "Store Appointment Booking" page
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
      And the "Locker Available" popup is displayed
      And clicks on the "popup.close_button" button
     Then the "Store Appointment Booking Date Selection" page is displayed

  @jira.QANOV-293576 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @automatic @mobile @moves
  @sanity @cert2 @live @next
  Scenario: A user can access the webview to get a locker in the store
    Store with lockers: Gran Via Madrid
     When opens the "Gestiones.Appointment Booking" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
      And selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
      And the "Locker Available" popup is displayed
      And clicks on the "popup.accept" button
     Then the browser webview is displayed
      And the "recogida de equipamiento" string is displayed

  @jira.QANOV-293577 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves
  @regression
  Scenario: User completes the OB flow to book a locker: The user returns to the Landing tab is displayed
    Given user is in the "Store Appointment Booking" page
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
      And the "Locker Available" popup is displayed
      And clicks on the "popup.accept" button
      And the browser webview is displayed
      And completes the flow to book a locker
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-293578 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves
  @regression
  Scenario: A user can continue the appointment booking without selecting a locker
    Given user is in the "Store Appointment Booking" page
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
      And the "Locker Available" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Store Appointment Booking Date Selection" page is displayed

  @jira.QANOV-293579 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves @smoke
  Scenario: A user can complete the process of the appointment booking without selecting a locker
    You can try with the store in Gran Via, Madrid
    Given user is in the "Store Appointment Booking" page
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
      And the "Locker Available" popup is displayed
      And clicks on the "popup.cancel" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on tomorrow date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm_button" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_subtitle" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed    And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_map" map is displayed
      And the "store_location_address" textfield is displayed
      And the "store_phone_number_title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_number" textfield with the "\+\d{11}" format is displayed
      And the "store_phone_call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-293580 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @mobile @moves
  @regression
  Scenario: A user can complete the process of the appointment booking when the store does not have any lockers available
    Given user is in the "Store Appointment Booking" page
     When selects a store without lockers available
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "4" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on tomorrow date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm_button" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_subtitle" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_map" map is displayed
      And the "store_location_address" textfield is displayed
      And the "store_phone_number_title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_number" textfield with the "\+\d{11}" format is displayed
      And the "store_phone_call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

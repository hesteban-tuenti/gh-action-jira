# -*- coding: utf-8 -*-
@jira.QANOV-293582
Feature: Equipment Return Appointment Booking


  @jira.QANOV-293583 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @smoke @web
  Scenario: A user can see the option to return equipment in the appointment booking service list
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And the "Store Appointment Booking Service Selection" page is loaded
     Then the "3" index in the "stores_list" list has the "3. Devolución de equipos" field

  @jira.QANOV-293584 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @regression @web
  Scenario: A user that selects the option to return equipment in the Store Appointment Booking Service Selection sees a popup when locker is available
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
     Then the "Locker Available Popup" page is loaded
      And the text of the element "popup.title" is equal to "Tienda con Locker disponible"
      And the text of the element "popup.message" is equal to "Entrega tus equipos sin esperas."
      And the text of the element "popup.accept" is equal to "Reservar mi locker"
      And the text of the element "popup.cancel" is equal to "Continuar reserva"

  @jira.QANOV-293585 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @sanity @tbd @web
  Scenario: A user can access the web to get a locker in the store
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "Locker Available Popup" page is loaded
      And I click on the "popup.accept" button
     Then the "tbd" page is loaded

  @jira.QANOV-293586 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @regression @web
  Scenario: User completes the OB flow to book a locker: The user returns to the Support page
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "Locker Available Popup" page is loaded
      And I click on the "popup.accept" button
      And completes the flow to book a locker
     Then the "Support" page is loaded

  @jira.QANOV-293587 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @smoke @web
  Scenario: A user can continue the appointment booking without selecting a locker
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "Locker Available Popup" page is loaded
      And I click on the "popup.cancel" button
     Then the "Store Appointment Booking Date Selection" page is loaded

  @jira.QANOV-293588 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @smoke @web
  Scenario: A user can complete the process of the appointment booking without selecting a locker
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When selects a store with lockers available
      And the "Store Appointment Booking Service Selection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "Locker Available Popup" page is loaded
      And I click on the "popup.cancel" button
      And the "Store Appointment Booking Date Selection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "Store Appointment Booking Contact Info" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "Store Appointment Booking Summary" page is loaded
      And I click on the "confirm_button" button
     Then the "Store Appointment Booking Success Feedback" page is loaded
      And the "close_button" element is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_subtitle" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed    And the "appointment_store_name" element is displayed
      And the "appointment_service" element is displayed
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_link" is equal to "¿Qué necesitas llevar a la tienda?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

  @jira.QANOV-293589 @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-292147 @manual @moves @regression @web
  Scenario: A user can complete the process of the appointment booking when the store does not have any lockers available
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When selects a store without lockers available
      And the "Store Appointment Booking Service Selection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "Locker Available Popup" page is loaded
      And I click on the "popup.cancel" button
      And the "Store Appointment Booking Date Selection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "Store Appointment Booking Contact Info" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "Store Appointment Booking Summary" page is loaded
      And I click on the "confirm_button" button
     Then the "Store Appointment Booking Success Feedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "success_title" is equal to "Locker reservado"
      And the text of the element "success_subtitle" is equal to "Te hemos enviado el código de tu Locker por email y SMS."
      And the "appointment_store_name" element is displayed
      And the "appointment_service" element is displayed
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_link" is equal to "¿Qué necesitas llevar a la tienda?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

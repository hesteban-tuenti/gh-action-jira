# -*- coding: utf-8 -*-
@jira.QANOV-67890 @not_hardening
Feature: Device Collection Appointment Booking


  @jira.QANOV-67891 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @smoke
  @web @ber
  Scenario: A user can access to the appointment booking page to start the flow for device collection
    internal_checkpoint="The url with parameters used is an example of the ones linked in the device collection landing page after purchasing a new Fusion plan in the Movistar web.
    It's valid for any user, not only a user that had purchased the new Fusion plan"
    other_affected_versions=2021-14-B
     When I go to "[CONF:appointment_booking.web_url_device_collection]" web page
     Then the "StoreAppointmentBooking" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "Selecciona una tienda Movistar"
      And the text of the element "appointment_booking_subtitle" is equal to "Introduce una dirección o comparte la actual para ver las tiendas cercanas."
      And the text of the element "store_search_placeholder" is equal to "Introduce una dirección o CP…"

  @jira.QANOV-67893 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can see the screen to select the date for store appointment booking for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
     Then the "StoreAppointmentBookingDateSelection" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "¿Cuándo quieres reservar tu cita?"
      And the text of the element "appointment_booking_subtitle" is equal to "Selecciona la fecha y hora que prefieras"
      And the "calendar_input" element is displayed

  @jira.QANOV-67894 @automatic @cert2 @jira.cv.12.1 @jira.link.detects.DBD-137 @jira.link.detects.DBD-401
  @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression @web @ber
  Scenario: A user can select a date and a slot to the store appointment for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
     Then the "StoreAppointmentBookingContactInfo" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the "remaining_time_clock_icon" element is displayed
      And the text of the element "remaining_time_text" has the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format
      And the text of the element "appointment_booking_title" is equal to "Introduce tus datos de contacto"
      And the "name_input" element is displayed
      And the text of the web element "name_placeholder" is equal to "Nombre"
      And the "surname_input" element is displayed
      And the text of the web element "surname_placeholder" is equal to "Apellidos"
      And the "personal_id_input" element is displayed
      And the text of the web element "personal_id_placeholder" is equal to "NIF/CIF/NIE/Pasaporte"
      And the "email_input" element is displayed
      And the text of the web element "email_placeholder" is equal to "Email"
      And the "phone_number_input" element is displayed
      And the text of the web element "phone_number_placeholder" is equal to "Número de teléfono"
      And the "more_info_input" element is displayed
      And the text of the web element "more_info_placeholder" is equal to "Cuéntanos más sobre tu visita"
      And the text of the web element "more_info_optional_placeholder" is equal to " (opcional)"
      And the text of the web element "smartphone_insurance_label" is equal to "Me gustaría contratar seguro"
      And the text of the web element "legal_terms_text" contains "He leído y acepto los Términos legales"
      And the text of the web element "legal_terms_link" contains "Términos legales"
      And the text of the element "next" is equal to "Siguiente"

  @jira.QANOV-67895 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can see the legal terms for the store appointment contact information provided for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I scroll to the element "legal_terms_link"
      And I click on the "legal_terms_link" element
     Then the "ConfirmationPopup" page is loaded
      And the text of the element "title" is equal to "Términos legales"
      And the text of the element "message" contains "Movistar informa que los datos que se facilitan en el presente formulario serán tratados por Telefónica de España S.A.U. y Telefónica Móviles España S.A.U. (en adelante Movistar) como corresponsables con la finalidad de proporcionarle la información comercial solicitada, así como el resto de finalidades que se hubieran permitido o autorizado de conformidad con lo dispuesto en https://www.movistar.es/privacidad Movistar informa que dispondrá de los siguientes medios para ejercer sus derechos"
      And the text of the element "accept_text" is equal to "Aceptar términos legales"
      And the text of the element "cancel_text" is equal to "Cancelar"

  @jira.QANOV-67896 @automatic @cert2 @jira.cv.12.1 @jira.link.detects.DBD-139 @jira.link.parent_test_plan.QANOV-67582
  @live @moves @next @smoke @web @ber
  Scenario: A user can see a summary of the store appointment for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
     Then the "StoreAppointmentBookingSummary" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the "remaining_time_clock_icon" element is displayed
      And the text of the element "remaining_time_text" has the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format
      And the text of the element "appointment_booking_title" is equal to "Resumen de tu cita"
      And the text of the element "appointment_booking_subtitle" is equal to "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala."
      And the text of the element "store_info_title" is equal to "Tienda"
      And the "store_info_name" element is displayed
      And the "store_info_edit_link" element is displayed
      And the text of the element "appointment_date_title" is equal to "Fecha de la cita"
      And the "appointment_date_date" element is displayed
      And the text of the element "appointment_date_slot" has the "^\d?\d:\d\dH$" format
      And the "appointment_date_edit_link" element is displayed
      And the text of the element "contact_info_title" is equal to "Datos personales"
      And the text of the element "contact_info_name" is equal to "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]"
      And the text of the element "contact_info_email_phone_number" is equal to "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]"
      And the "contact_info_edit_link" element is displayed
      And the text of the element "smartphone_title" is equal to "Smartphone"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone_storage_color" is equal to "[CONF:appointment_booking.smartphone_storage] - [CONF:appointment_booking.smartphone_color]"
      And the "smartphone_edit_link" element is displayed
      And the text of the element "confirm_button" is equal to "Confirmar"

  @jira.QANOV-77295 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the Movistar store from the store appointment summary screen for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "appointment_service" is equal to "1. Recogida Dispositivo Incluido"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"

  @jira.QANOV-77296 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the appointment date from the store appointment summary screen for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "appointment_date_edit_link" element
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "appointment_service" is equal to "1. Recogida Dispositivo Incluido"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"

  @jira.QANOV-77297 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the contact info from the store appointment summary screen for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "contact_info_edit_link" element
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I replace the "name_input" field value with "[CONF:appointment_booking.client_name_modified]"
      And I replace the "surname_input" field value with "[CONF:appointment_booking.client_surname_modified]"
      And I replace the "email_input" field value with "[CONF:appointment_booking.client_email_modified]"
      And I replace the "phone_number_input" field value with "[CONF:appointment_booking.client_phone_number_modified]"
      And I replace the "more_info_input" field value with "Esto es una prueba de Novum editada"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And the text of the element "contact_info_name" is equal to "[CONF:appointment_booking.client_name_modified] [CONF:appointment_booking.client_surname_modified]"
      And the text of the element "contact_info_email_phone_number" is equal to "[CONF:appointment_booking.client_email_modified] - [CONF:appointment_booking.client_phone_number_modified]"
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "appointment_service" is equal to "1. Recogida Dispositivo Incluido"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"

  @jira.QANOV-67897 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can go to the Movistar page to choose another smartphone for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "smartphone_edit_link" element
     Then the current URL is "https://www.movistar.es/moviles/" after "5" seconds

  @jira.QANOV-67898 @automatic @cert1 @jira.cv.12.1 @jira.link.detects.DBD-140 @jira.link.parent_test_plan.QANOV-67582
  @moves @sanity @web @ber
  Scenario: A user can see the confirmation of the store appointment for device collection
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "success_title" is equal to "Reserva confirmada"
      And the text of the element "success_subtitle" is equal to "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS."
      And the "appointment_store_name" element is displayed
      And the text of the element "appointment_service" is equal to "1. Recogida Dispositivo Incluido"
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_authorization_link" is equal to "¿Puedo autorizar a alguien para que vaya en mi lugar?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the "smartphone.icon" element is displayed
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"
      And the text of the element "store_phone_title" is equal to "Teléfono tienda"
      And the text of the element "store_phone_number" has the "\+\d{11}" format
      And the "store_phone_call_icon" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

  @jira.QANOV-134426 @cert1 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @sanity @web
  Scenario: A user can modify the chosen smartphone from the create appointment success screen for device collection
    Given I go to "[CONF:appointment_booking.web_url_device_collection]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I click on the "smartphone_edit_link" element
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I wait "2" seconds
      And I scroll to the element "smartphone_brand_input"
      And I replace the "smartphone_brand_input" field value with "[CONF:appointment_booking.smartphone_brand_modified]"
      And I scroll to the element "smartphone_model_input"
      And I replace the "smartphone_model_input" field value with "[CONF:appointment_booking.smartphone_model_modified]"
      And I scroll to the element "smartphone_color_input"
      And I replace the "smartphone_color_input" field value with "[CONF:appointment_booking.smartphone_color_modified]"
      And I scroll to the element "smartphone_storage_input"
      And I replace the "smartphone_storage_input" field value with "[CONF:appointment_booking.smartphone_storage_modified]"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And the text of the element "smartphone_title" is equal to "Smartphone"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand_modified] [CONF:appointment_booking.smartphone_model_modified]"
      And the text of the element "smartphone_storage_color" is equal to "[CONF:appointment_booking.smartphone_storage_modified] - [CONF:appointment_booking.smartphone_color_modified]"
      And the "smartphone_edit_link" element is displayed
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand_modified] [CONF:appointment_booking.smartphone_model_modified]"
      And the text of the element "smartphone_brand_storage" is equal to "[CONF:appointment_booking.smartphone_storage_modified]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color_modified]"

  @jira.QANOV-67899 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can see the option to device collection in the service list when accessing to the appointment booking url without parameters
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
     Then the "StoreAppointmentBookingServiceSelection" page is loaded
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "Selecciona el servicio que necesitas"
      And the "appointment_booking_services" list of elements is displayed
      And the "appointment_booking_services" elements list contains the text "1. Recogida Dispositivo Incluido"

  @jira.QANOV-67900 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can select a date and a slot to the store appointment after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
     Then the "StoreAppointmentBookingContactInfo" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the "remaining_time_clock_icon" element is displayed
      And the text of the element "remaining_time_text" has the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format
      And the text of the element "appointment_booking_title" is equal to "Introduce tus datos de contacto"
      And the "name_input" element is displayed
      And the text of the web element "name_placeholder" is equal to "Nombre"
      And the "surname_input" element is displayed
      And the text of the web element "surname_placeholder" is equal to "Apellidos"
      And the "personal_id_input" element is displayed
      And the text of the web element "personal_id_placeholder" is equal to "NIF/CIF/NIE/Pasaporte"
      And the "email_input" element is displayed
      And the text of the web element "email_placeholder" is equal to "Email"
      And the "phone_number_input" element is displayed
      And the text of the web element "phone_number_placeholder" is equal to "Número de teléfono"
      And the "more_info_input" element is displayed
      And the text of the web element "more_info_placeholder" is equal to "Cuéntanos más sobre tu visita"
      And the text of the web element "more_info_optional_placeholder" is equal to " (opcional)"
      And the text of the element "smartphone_collection_title" is equal to "¿En qué smartphone estás interesado?"
      And the "smartphone_brand_input" element is displayed
      And the text of the web element "smartphone_brand_placeholder" is equal to "Marca del smartphone"
      And the "smartphone_model_input" element is displayed
      And the text of the web element "smartphone_model_placeholder" is equal to "Modelo del smartphone"
      And the "smartphone_color_input" element is displayed
      And the text of the web element "smartphone_color_placeholder" is equal to "Color del smartphone"
      And the "smartphone_storage_input" element is displayed
      And the text of the web element "smartphone_storage_placeholder" is equal to "Capacidad de memoria"
      And the text of the web element "smartphone_storage_optional_placeholder" is equal to " (opcional)"
      And the text of the web element "smartphone_storage_legend" is equal to "64GB, 128GB..."
      And the text of the web element "smartphone_insurance_label" is equal to "Me gustaría contratar seguro"
      And the text of the web element "legal_terms_text" contains "He leído y acepto los Términos legales"
      And the text of the web element "legal_terms_link" contains "Términos legales"
      And the text of the element "next" is equal to "Siguiente"

  @jira.QANOV-67901 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can see the legal terms for the store appointment contact information provided after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I click on the "legal_terms_link" element
     Then the "ConfirmationPopup" page is loaded
      And the text of the element "title" is equal to "Términos legales"
      And the text of the element "message" contains "Movistar informa que los datos que se facilitan en el presente formulario serán tratados por Telefónica de España S.A.U. y Telefónica Móviles España S.A.U. (en adelante Movistar) como corresponsables con la finalidad de proporcionarle la información comercial solicitada, así como el resto de finalidades que se hubieran permitido o autorizado de conformidad con lo dispuesto en https://www.movistar.es/privacidad Movistar informa que dispondrá de los siguientes medios para ejercer sus derechos"
      And the text of the element "accept_text" is equal to "Aceptar términos legales"
      And the text of the element "cancel_text" is equal to "Cancelar"

  @jira.QANOV-67902 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression
  @web @ber
  Scenario: A user can not continue with the appointment booking without filling the mandatory contact information after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I click on the "next" button
     Then the text of the element "name_error" is equal to "Este campo es obligatorio"
      And the text of the element "surname_error" is equal to "Este campo es obligatorio"
      And the text of the element "personal_id_error" is equal to "Este campo es obligatorio"
      And the text of the element "email_error" is equal to "Este campo es obligatorio"
      And the text of the element "phone_number_error" is equal to "Este campo es obligatorio"
      And the text of the element "smartphone_brand_error" is equal to "Este campo es obligatorio"
      And the text of the element "smartphone_model_error" is equal to "Este campo es obligatorio"
      And the text of the element "smartphone_color_error" is equal to "Este campo es obligatorio"

  @jira.QANOV-67903 @automatic @cert2 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @smoke
  @web @ber
  Scenario: A user can see a summary of the store appointment after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
     Then the "StoreAppointmentBookingSummary" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the "remaining_time_clock_icon" element is displayed
      And the text of the element "remaining_time_text" has the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format
      And the text of the element "appointment_booking_title" is equal to "Resumen de tu cita"
      And the text of the element "appointment_booking_subtitle" is equal to "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala."
      And the text of the element "store_info_title" is equal to "Tienda"
      And the "store_info_name" element is displayed
      And the "store_info_edit_link" element is displayed
      And the text of the element "appointment_service_title" is equal to "Motivo de la cita"
      And the "appointment_service_service" element is displayed
      And the "appointment_service_edit_link" element is displayed
      And the text of the element "appointment_date_title" is equal to "Fecha de la cita"
      And the "appointment_date_date" element is displayed
      And the text of the element "appointment_date_slot" has the "^\d?\d:\d\dH$" format
      And the "appointment_date_edit_link" element is displayed
      And the text of the element "contact_info_title" is equal to "Datos personales"
      And the text of the element "contact_info_name" is equal to "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]"
      And the text of the element "contact_info_email_phone_number" is equal to "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]"
      And the "contact_info_edit_link" element is displayed
      And the text of the element "smartphone_title" is equal to "Smartphone"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone_storage_color" is equal to "[CONF:appointment_booking.smartphone_storage] - [CONF:appointment_booking.smartphone_color]"
      And the "smartphone_edit_link" element is displayed
      And the text of the element "confirm_button" is equal to "Confirmar"

  @jira.QANOV-84628 @automatic @cert2 @jira.cv.12.3 @jira.link.detects.DBD-217 @jira.link.detects.DBD-270
  @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @regression @web @ber
  Scenario: A user can see a summary of the store appointment after selecting the device collection service without filling the smartphone storage
    other_affected_versions=2021-18
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
     Then the "StoreAppointmentBookingSummary" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the "remaining_time_clock_icon" element is displayed
      And the text of the element "remaining_time_text" has the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format
      And the text of the element "appointment_booking_title" is equal to "Resumen de tu cita"
      And the text of the element "appointment_booking_subtitle" is equal to "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala."
      And the text of the element "store_info_title" is equal to "Tienda"
      And the "store_info_name" element is displayed
      And the "store_info_edit_link" element is displayed
      And the text of the element "appointment_service_title" is equal to "Motivo de la cita"
      And the "appointment_service_service" element is displayed
      And the "appointment_service_edit_link" element is displayed
      And the text of the element "appointment_date_title" is equal to "Fecha de la cita"
      And the "appointment_date_date" element is displayed
      And the text of the element "appointment_date_slot" has the "^\d?\d:\d\dH$" format
      And the "appointment_date_edit_link" element is displayed
      And the text of the element "contact_info_title" is equal to "Datos personales"
      And the text of the element "contact_info_name" is equal to "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]"
      And the text of the element "contact_info_email_phone_number" is equal to "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]"
      And the "contact_info_edit_link" element is displayed
      And the text of the element "smartphone_title" is equal to "Smartphone"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone_storage_color" is equal to "[CONF:appointment_booking.smartphone_color]"
      And the "smartphone_edit_link" element is displayed
      And the text of the element "confirm_button" is equal to "Confirmar"

  @jira.QANOV-77298 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the Movistar store from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"

  @jira.QANOV-77299 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the appointment service from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "appointment_service_edit_link" element
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "2" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And the "personal_id_input" element is not displayed
      And the "smartphone_brand_input" element is not displayed
      And the "smartphone_model_input" element is not displayed
      And the "smartphone_color_input" element is not displayed
      And the "smartphone_storage_input" element is not displayed
      And the "smartphone_insurance_check" element is not displayed
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the "smartphone" module is not displayed

  @jira.QANOV-77300 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the appointment date from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "appointment_date_edit_link" element
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"

  @jira.QANOV-77301 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can modify the contact info from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "contact_info_edit_link" element
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I replace the "name_input" field value with "[CONF:appointment_booking.client_name_modified]"
      And I replace the "surname_input" field value with "[CONF:appointment_booking.client_surname_modified]"
      And I replace the "personal_id_input" field value with "[CONF:appointment_booking.client_dni_modified]"
      And I replace the "email_input" field value with "[CONF:appointment_booking.client_email_modified]"
      And I replace the "phone_number_input" field value with "[CONF:appointment_booking.client_phone_number_modified]"
      And I replace the "more_info_input" field value with "Esto es una prueba de Novum editada"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And the text of the element "contact_info_name" is equal to "[CONF:appointment_booking.client_name_modified] [CONF:appointment_booking.client_surname_modified]"
      And the text of the element "contact_info_email_phone_number" is equal to "[CONF:appointment_booking.client_email_modified] - [CONF:appointment_booking.client_phone_number_modified]"
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"

  @jira.QANOV-67904 @automatic @cert1 @jira.cv.12.1 @jira.link.detects.DBD-163 @jira.link.parent_test_plan.QANOV-67582
  @moves @regression @web @ber
  Scenario: A user can modify the choosen smartphone info from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "smartphone_edit_link" element
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I wait "2" seconds
      And I scroll to the element "smartphone_brand_input"
      And I replace the "smartphone_brand_input" field value with "[CONF:appointment_booking.smartphone_brand_modified]"
      And I scroll to the element "smartphone_model_input"
      And I replace the "smartphone_model_input" field value with "[CONF:appointment_booking.smartphone_model_modified]"
      And I scroll to the element "smartphone_color_input"
      And I replace the "smartphone_color_input" field value with "[CONF:appointment_booking.smartphone_color_modified]"
      And I scroll to the element "smartphone_storage_input"
      And I replace the "smartphone_storage_input" field value with "[CONF:appointment_booking.smartphone_storage_modified]"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And the text of the element "smartphone_title" is equal to "Smartphone"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand_modified] [CONF:appointment_booking.smartphone_model_modified]"
      And the text of the element "smartphone_storage_color" is equal to "[CONF:appointment_booking.smartphone_storage_modified] - [CONF:appointment_booking.smartphone_color_modified]"
      And the ¡"smartphone_edit_link" element is displayed
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand_modified] [CONF:appointment_booking.smartphone_model_modified]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage_modified]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color_modified]"

  @jira.QANOV-67905 @automatic @cert1 @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @moves @smoke @web @ber
  Scenario: A user can see the confirmation of the store appointment after selecting the device collection service
    other_affected_versions=2021-14-B
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "success_title" is equal to "Reserva confirmada"
      And the text of the element "success_subtitle" is equal to "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS."
      And the "appointment_store_name" element is displayed
      And the text of the element "appointment_service" is equal to "1. Recogida Dispositivo Incluido"
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_authorization_link" is equal to "¿Puedo autorizar a alguien para que vaya en mi lugar?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the "smartphone.icon" element is displayed
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"
      And the text of the element "store_phone_title" is equal to "Teléfono tienda"
      And the text of the element "store_phone_number" has the "\+\d{11}" format
      And the "store_phone_call_icon" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

  @jira.QANOV-84629 @automatic @cert1 @jira.cv.12.3 @jira.link.detects.DBD-217 @jira.link.detects.DBD-270
  @jira.link.parent_test_plan.QANOV-67582 @moves @regression @web @ber
  Scenario: A user can see the confirmation of the store appointment after selecting the device collection service without filling the smartphone storage
    other_affected_versions=2021-18
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "success_title" is equal to "Reserva confirmada"
      And the text of the element "success_subtitle" is equal to "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS."
      And the "appointment_store_name" element is displayed
      And the text of the element "appointment_service" is equal to "1. Recogida Dispositivo Incluido"
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_authorization_link" is equal to "¿Puedo autorizar a alguien para que vaya en mi lugar?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the "smartphone.icon" element is displayed
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color]"
      And the text of the element "store_phone_title" is equal to "Teléfono tienda"
      And the text of the element "store_phone_number" has the "\+\d{11}" format
      And the "store_phone_call_icon" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

  @jira.QANOV-134427 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @regression @web
  Scenario: A user can modify the chosen smartphone from the create appointment success screen after selecting the device collection service
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the item with "1. Recogida Dispositivo Incluido" text from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "personal_id_input" field with "[CONF:appointment_booking.client_dni]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I fill in the "smartphone_brand_input" field with "[CONF:appointment_booking.smartphone_brand]"
      And I fill in the "smartphone_model_input" field with "[CONF:appointment_booking.smartphone_model]"
      And I fill in the "smartphone_color_input" field with "[CONF:appointment_booking.smartphone_color]"
      And I fill in the "smartphone_storage_input" field with "[CONF:appointment_booking.smartphone_storage]"
      And I check the box "smartphone_insurance_check"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I click on the "smartphone_edit_link" element
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I wait "2" seconds
      And I scroll to the element "smartphone_brand_input"
      And I replace the "smartphone_brand_input" field value with "[CONF:appointment_booking.smartphone_brand_modified]"
      And I scroll to the element "smartphone_model_input"
      And I replace the "smartphone_model_input" field value with "[CONF:appointment_booking.smartphone_model_modified]"
      And I scroll to the element "smartphone_color_input"
      And I replace the "smartphone_color_input" field value with "[CONF:appointment_booking.smartphone_color_modified]"
      And I scroll to the element "smartphone_storage_input"
      And I replace the "smartphone_storage_input" field value with "[CONF:appointment_booking.smartphone_storage_modified]"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And the text of the element "smartphone_title" is equal to "Smartphone"
      And the text of the element "smartphone_brand_model" is equal to "[CONF:appointment_booking.smartphone_brand_modified] [CONF:appointment_booking.smartphone_model_modified]"
      And the text of the element "smartphone_storage_color" is equal to "[CONF:appointment_booking.smartphone_storage_modified] - [CONF:appointment_booking.smartphone_color_modified]"
      And the "smartphone_edit_link" element is displayed
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded
      And the text of the element "smartphone.title" is equal to "[CONF:appointment_booking.smartphone_brand_modified] [CONF:appointment_booking.smartphone_model_modified]"
      And the text of the element "smartphone.subtitle" is equal to "[CONF:appointment_booking.smartphone_storage_modified]"
      And the text of the element "smartphone_color" is equal to "[CONF:appointment_booking.smartphone_color_modified]"

# -*- coding: utf-8 -*-
@jira.QANOV-67872
Feature: Device Collection Appointment Booking

    Actions After the Feature:
    Given terminates the app
      And launches the app
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-67873 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile
  @moves @smoke
  Scenario: A user can access to the appointment booking screen to start the flow for device collection
    internal_checkpoint="The url with parameters used is an example of the ones linked in the device collection landing page after purchasing a new Fusion plan in the Movistar web.
    It's valid for any user, not only a user that had purchased the new Fusion plan"
    other_affected_versions=2021-14-B
     When user opens the "Support.Device Collection" deeplink with the app in "killed" status
     Then the "Store Appointment Booking" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "Selecciona una tienda Movistar" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Introduce una dirección o comparte la actual para ver las tiendas cercanas." text is displayed
      And the "store_search_inputtext" inputtext is displayed
      And the "store_search_inputtext_placeholder" placeholder with "Introduce una dirección o CP…" text is displayed

  @jira.QANOV-67875 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile
  @moves @regression
  Scenario: A user can see the screen to select the date for store appointment booking for device collection
    other_affected_versions=2021-14-B
    Given user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
     Then the "Store Appointment Booking Date Selection" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "¿Cuándo quieres reservar tu cita?" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Escoge la hora que prefieras" text is displayed
      And the "calendar_input" inputtext is displayed

  @jira.QANOV-67876 @android @manual @ios @jira.cv.12.1 @jira.link.detects.DBD-137
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @regression
  Scenario: A user can select a date and a slot to the store appointment for device collection
    internal_checkpoint="Contact info indicated in the test case for user FIC065891F in NEXT/PROD"
    other_affected_versions=2021-14-B
    Given user has the "email" contact methods
      And user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "remaining_time_clock_icon" icon is displayed
      And the "remaining_time_text" textfield with the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "appointment_booking_title_textfield" textfield with "Introduce tus datos de contacto" text is displayed
      And the "name_input" inputtext with "[CONF:appointment_booking.test_client_name]" text is displayed
      And the "surname_input" inputtext with "[CONF:appointment_booking.test_client_surname]" text is displayed
      And the "personal_id_input" inputtext is displayed
      And the "email_input" inputtext with "[CONTEXT:contact_method_email]" text is displayed
      And the "phone_number_input" inputtext is displayed
      And the "more_info_input" inputtext is displayed
      And the "more_info_placeholder" textfield with "Cuéntanos más sobre tu visita" text is displayed
      And the "more_info_optional_placeholder" textfield with " (opcional)" text is displayed
      And the "smartphone_insurance_label" textfield with "Me gustaría contratar seguro" text is displayed
      And the "smartphone_insurance_check" checkbox is displayed
      And the "legal_terms_check" checkbox is displayed
      And the "legal_terms_text" textfield with "He leído y acepto los Términos legales" text is displayed
      And the "legal_terms_link" link with "Términos legales" text is displayed
      And the "next_button" button with "Siguiente" text is displayed

  @jira.<jira_id> @<client> @manual @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile @moves
  @regression
  Scenario Outline: A user can see the legal terms for the store appointment contact information provided for device collection
    other_affected_versions=2021-14-B
    Given user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_link" link
     Then the "Store Appointment Booking Legal Terms" popup is displayed
      And the "popup.title" textfield with "Términos legales" text is displayed
      And the "popup.message" textfield that contains the "Movistar informa que los datos que se facilitan en el presente formulario serán tratados por Telefónica de España S.A.U. y Telefónica Móviles España S.A.U. (en adelante Movistar) como corresponsables con la finalidad de proporcionarle la información comercial solicitada, así como el resto de finalidades que se hubieran permitido o autorizado de conformidad con lo dispuesto en https://www.movistar.es/privacidad" text is displayed
      And the "popup.accept" button with "<accept_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | accept_button            | cancel_button | jira_id     |
          | android | ACEPTAR TÉRMINOS LEGALES | CANCELAR      | QANOV-67877 |
          | ios     | Aceptar términos legales | Cancelar      | QANOV-67878 |

  @jira.QANOV-67879 @android @automatic @ber @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582
  @mobile @moves @smoke @cert2 @live @next @qa
  Scenario: A user can see a summary of the store appointment for device collection
    other_affected_versions=2021-14-B
    Given user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And clicks on the "stores_list_tab" button
      And clicks on the "stores_list_first" button
      And clicks on the "book_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And scrolls to "legal_terms_check" button
      And clicks on the "legal_terms_check" button
      And clicks on the "next" button
     Then the "Store Appointment Booking Summary" page is displayed
      And the "Movistar" header is displayed
      And the "close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "remaining_time_clock_icon" icon is displayed
      And the "remaining_time_text" textfield with the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "appointment_booking_title" textfield with "Resumen de tu cita" text is displayed
      And the "appointment_booking_subtitle" textfield with "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala." text is displayed
      And the "store_info_title" textfield with "Tienda" text is displayed
      And the "store_info_name" textfield is displayed
      And the "store_info_edit_link" button is displayed
      And the "appointment_date_title" textfield with "Fecha de la cita" text is displayed
      And the "appointment_date_date" textfield is displayed
      And the "appointment_date_slot" textfield is displayed
      And the "appointment_date_edit_link" button is displayed
      And the "contact_info_title" textfield with "Datos personales" text is displayed
      And the "contact_info_name" textfield with "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]" text is displayed
      And the "contact_info_email_phone_number" textfield with "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]" text is displayed
      And the "contact_info_edit_link" button is displayed
      And the "smartphone_title" textfield with "Smartphone" text is displayed
      And the "smartphone_brand_model" textfield with "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone_storage_color" textfield with "[CONF:appointment_booking.smartphone_storage] - [CONF:appointment_booking.smartphone_color]" text is displayed
      And the "smartphone_edit_link" button is displayed
      And the "confirm_button" button with "Confirmar" text is displayed

  @jira.QANOV-77284 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the Movistar store from the store appointment summary screen for device collection
    other_affected_versions=2021-14-B
    Given user opens the "[CONF:appointment_booking.web_url_device_collection]" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "store_info.edit" link
      And "Store Appointment Booking" page is displayed
      And clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "appointment_service" textfield with "1. Recogida Dispositivo Incluido" text is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-77285 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the appointment date from the store appointment summary screen for device collection
    other_affected_versions=2021-14-B
    Given user opens the "[CONF:appointment_booking.web_url_device_collection]" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "appointment_date.edit" link
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "appointment_service" textfield with "1. Recogida Dispositivo Incluido" text is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-77286 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the contact info from the store appointment summary screen for device collection
    other_affected_versions=2021-14-B
    Given user opens the "[CONF:appointment_booking.web_url_device_collection]" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "contact_info.edit" link
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name_modified]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname_modified]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni_modified]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email_modified]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number_modified]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum editada" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And the "contact_info.name" textfield with "[CONF:appointment_booking.client_name_modified] [CONF:appointment_booking.client_surname_modified]" text is displayed
      And the "contact_info.email" textfield with "[CONF:appointment_booking.client_email_modified]" text is displayed
      And the "contact_info.phone_number" textfield with "[CONF:appointment_booking.client_phone_number_modified]" text is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "appointment_service" textfield with "1. Recogida Dispositivo Incluido" text is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-67880 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile
  @moves @regression
  Scenario: A user can go to the Movistar page to choose another smartphone
    other_affected_versions=2021-14-B
    Given user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "smartphone.edit_link" link
     Then the internal webview is displayed
      And the header that contains the "dispositivo" text is displayed

  @jira.QANOV-67881 @android @automatic @ber @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile @moves
  @sanity @qa
  Scenario: A user can see the confirmation of the store appointment for device collection
    Mocks in QA are implemented to work with the 'tomorrow' day. This scenario is automated to run in QA environment picking tomorrow.
    other_affected_versions=2021-14-B
    Given user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And clicks on the "stores_list_tab" button
      And clicks on the "0" element in the "stores_list" list
      And clicks on the "book_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on tomorrow date in the appointments calendar
      And waits until the "next" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And scrolls to "smartphone_insurance_check" button
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm_button" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "close_button" button is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_subtitle" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield with "1. Recogida Dispositivo Incluido" text is displayed
      And the "smartphone.icon" icon is displayed
      And the "smartphone.title" textfield with "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.pretitle" textfield with "[CONF:appointment_booking.smartphone_storage]" text is displayed
      And the "smartphone.description" textfield with "[CONF:appointment_booking.smartphone_color]" text is displayed
      And the "appointment_slot_time" textfield with the "\d{2}\/\d{2}\/\d{4} de \d{2}:\d{2} a \d{2}:\d{2}" format is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_map" map is displayed
      And the "store_address" textfield is displayed
      And the "store_phone_title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_number" textfield with the "\+\d{11}" format is displayed
      And the "store_phone_call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-131929 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can modify the chosen smartphone from the create appointment success screen for device collection
    Given user opens the "[CONF:appointment_booking.web_url_device_collection]" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "smartphone.edit_link" link
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand_modified]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model_modified]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color_modified]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage_modified]" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "smartphone" module is displayed
      And the "smartphone.icon" icon is displayed
      And the "smartphone.brand" textfield with "[CONF:appointment_booking.smartphone_brand_modified]" text is displayed
      And the "smartphone.model" textfield with "[CONF:appointment_booking.smartphone_model_modified]" text is displayed
      And the "smartphone.storage" textfield with "[CONF:appointment_booking.smartphone_storage_modified]" text is displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color_modified]" text is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-67882 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile
  @moves @regression
  Scenario: A user can see the option to device collection in the service list
    other_affected_versions=2021-14-B
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
      And the "0" element in the "appointment_booking_services" list with "1. Recogida Dispositivo Incluido" text is displayed

  @jira.QANOV-67883 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile
  @moves @regression
  Scenario: A user can select a date and a slot to the store appointment after selecting the device collection service
    internal_checkpoint="Contact info indicated in the test case for user FIC065891F in NEXT/PROD"
    other_affected_versions=2021-14-B
    Given user has the "email" contact methods
      And user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "remaining_time_clock_icon" icon is displayed
      And the "remaining_time_text" textfield with the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "appointment_booking_title_textfield" textfield with "Introduce tus datos de contacto" text is displayed
      And the "name_input" inputtext with "[CONF:appointment_booking.test_client_name]" text is displayed
      And the "surname_input" inputtext with "[CONF:appointment_booking.test_client_surname]" text is displayed
      And the "personal_id_input" inputtext is displayed
      And the "email_input" inputtext with "[CONTEXT:contact_method_email]" text is displayed
      And the "phone_number_input" inputtext is displayed
      And the "more_info_input" inputtext is displayed
      And the "more_info_placeholder" textfield with "Cuéntanos más sobre tu visita" text is displayed
      And the "more_info_optional_placeholder" textfield with " (opcional)" text is displayed
      And the "smartphone_collection_title" textfield with "¿En qué smartphone estás interesado?" text is displayed
      And the "smartphone_collection_subtitle" textfield with "Es necesario que rellenes todos los campos obligatorios. Recuerda que las recogidas de equipamiento y/o smartphones están sujetas a disponibilidad en tienda." text is displayed
      And the "smartphone_brand_input" inputtext is displayed
      And the "smartphone_brand_placeholder" textfield with "Marca del smartphone" text is displayed
      And the "smartphone_model_input" inputtext is displayed
      And the "smartphone_model_placeholder" textfield with "Modelo del smartphone" text is displayed
      And the "smartphone_color_input" inputtext is displayed
      And the "smartphone_color_placeholder" textfield with "Color del smartphone" text is displayed
      And the "smartphone_storage_input" inputtext is displayed
      And the "smartphone_storage_placeholder" textfield with "Capacidad de memoria" text is displayed
      And the "smartphone_storage_optional_placeholder" textfield with " (opcional)" text is displayed
      And the "smartphone_storage_legend" textfield with "64GB, 128GB..." text is displayed
      And the "smartphone_insurance_label" textfield with "Me gustaría contratar seguro" text is displayed
      And the "smartphone_insurance_check" checkbox is displayed
      And the "legal_terms_check" checkbox is displayed
      And the "legal_terms_text" textfield with "He leído y acepto los Términos legales" text is displayed
      And the "legal_terms_link" link with "Términos legales" text is displayed
      And the "next_button" button with "Siguiente" text is displayed

  @jira.<jira_id> @<client> @manual @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile @moves
  @regression
  Scenario Outline: A user can see the legal terms for the store appointment contact information provided after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_link" link
     Then the "Store Appointment Booking Legal Terms" popup is displayed
      And the "popup.title" textfield with "Términos legales" text is displayed
      And the "popup.message" textfield that contains the "Movistar informa que los datos que se facilitan en el presente formulario serán tratados por Telefónica de España S.A.U. y Telefónica Móviles España S.A.U. (en adelante Movistar) como corresponsables con la finalidad de proporcionarle la información comercial solicitada, así como el resto de finalidades que se hubieran permitido o autorizado de conformidad con lo dispuesto en https://www.movistar.es/privacidad" text is displayed
      And the "popup.accept" button with "<accept_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | accept_button            | cancel_button | jira_id     |
          | android | ACEPTAR TÉRMINOS LEGALES | CANCELAR      | QANOV-67884 |
          | ios     | Aceptar términos legales | Cancelar      | QANOV-67885 |

  @jira.<jira_id> @<client> @<execution> @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @regression
  Scenario Outline: A user can not continue with the appointment booking without filling the mandatory contact information after selecting the device collection service
    other_affected_versions=2021-14-B
    Automated only in Android because the inputtext clearing is not working on iOS (NOV-232297)
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clears the "name_input" inputtext
      And clears the "surname_input" inputtext
      And clears the "email_input" inputtext
      And clears the "phone_number_input" inputtext
      And clicks on the "next_button" button
     Then the "name_error" textfield with "Este campo es obligatorio" text is displayed
      And the "surname_error" textfield with "Este campo es obligatorio" text is displayed
      And the "personal_id_error" textfield with "Este campo es obligatorio" text is displayed
      And the "email_error" textfield with "Este campo es obligatorio" text is displayed
      And the "phone_number_error" textfield with "Este campo es obligatorio" text is displayed
      And the "smartphone_brand_error" textfield with "Este campo es obligatorio" text is displayed
      And the "smartphone_model_error" textfield with "Este campo es obligatorio" text is displayed
      And the "smartphone_color_error" textfield with "Este campo es obligatorio" text is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | manual    | QANOV-67886  |
          | ios     | manual    | QANOV-235675 |

  @jira.QANOV-67887 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile
  @moves @smoke
  Scenario: A user can see a summary of the store appointment after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the enter key for the "smartphone_storage_input" inputtext
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Summary" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "remaining_time_clock_icon" icon is displayed
      And the "remaining_time_text" textfield with the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "appointment_booking_title_textfield" textfield with "Resumen de tu cita" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala." text is displayed
      And the "store_info" module is displayed
      And the "store_info.title" textfield with "Tienda" text is displayed
      And the "store_info.name" textfield is displayed
      And the "store_info.edit_link" link that contains the "Editar" text is displayed
      And the "appointment_service" module is displayed
      And the "appointment_service.title" textfield with "Motivo de la cita" text is displayed
      And the "appointment_service.service" textfield is displayed
      And the "appointment_service.edit_link" link that contains the "Editar" text is displayed
      And the "appointment_date" module is displayed
      And the "appointment_date.title" textfield with "Fecha de la cita" text is displayed
      And the "appointment_date.date" textfield is displayed
      And the "appointment_date.slot" textfield is displayed
      And the "appointment_date.edit_link" link that contains the "Editar" text is displayed
      And the "contact_info" module is displayed
      And the "contact_info.title" textfield with "Datos personales" text is displayed
      And the "contact_info.name" textfield with "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]" text is displayed
      And the "contact_info.email_phone_number" textfield with "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]" text is displayed
      And the "contact_info.edit_link" link that contains the "Editar" text is displayed
      And the "smartphone" module is displayed
      And the "smartphone.title" textfield with "Smartphone" text is displayed
      And the "smartphone.brand_model" textfield with "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.storage_color" textfield with "[CONF:appointment_booking.smartphone_storage] - [CONF:appointment_booking.smartphone_color]" text is displayed
      And the "smartphone.edit_link" link that contains the "Editar" text is displayed
      And the "confirm_button" button with "Confirmar" text is displayed

  @jira.QANOV-84623 @android @manual @ios @jira.cv.12.3 @jira.link.detects.DBD-217 @jira.link.detects.DBD-270
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @regression
  Scenario: A user can see a summary of the store appointment after selecting the device collection service without filling the smartphone storage
    other_affected_versions=2021-18
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And clicks on the enter key for the "smartphone_color_input" inputtext
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Summary" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "remaining_time_clock_icon" icon is displayed
      And the "remaining_time_text" textfield with the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "appointment_booking_title_textfield" textfield with "Resumen de tu cita" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala." text is displayed
      And the "store_info" module is displayed
      And the "store_info.title" textfield with "Tienda" text is displayed
      And the "store_info.name" textfield is displayed
      And the "store_info.edit_link" link that contains the "Editar" text is displayed
      And the "appointment_service" module is displayed
      And the "appointment_service.title" textfield with "Motivo de la cita" text is displayed
      And the "appointment_service.service" textfield is displayed
      And the "appointment_service.edit_link" link that contains the "Editar" text is displayed
      And the "appointment_date" module is displayed
      And the "appointment_date.title" textfield with "Fecha de la cita" text is displayed
      And the "appointment_date.date" textfield is displayed
      And the "appointment_date.slot" textfield is displayed
      And the "appointment_date.edit_link" link that contains the "Editar" text is displayed
      And the "contact_info" module is displayed
      And the "contact_info.title" textfield with "Datos personales" text is displayed
      And the "contact_info.name" textfield with "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]" text is displayed
      And the "contact_info.email_phone_number" textfield with "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]" text is displayed
      And the "contact_info.edit_link" link that contains the "Editar" text is displayed
      And the "smartphone" module is displayed
      And the "smartphone.title" textfield with "Smartphone" text is displayed
      And the "smartphone.brand_model" textfield with "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.storage_color" textfield with "[CONF:appointment_booking.smartphone_color]" text is displayed
      And the "smartphone.edit_link" link that contains the "Editar" text is displayed
      And the "confirm_button" button with "Confirmar" text is displayed

  @jira.QANOV-77287 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the Movistar store from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "store_info.edit" link
      And the "Store Appointment Booking" page is displayed
      And clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-77288 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the appointment service from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "appointment_service.edit" link
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And the "personal_id_input" inputttext is not displayed
      And the "smartphone_brand_input" inputttext is not displayed
      And the "smartphone_model_input" inputttext is not displayed
      And the "smartphone_color_input" inputttext is not displayed
      And the "smartphone_storage_input" inputttext is not displayed
      And the "smartphone_insurance_check" checkbox is not displayed
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "smartphone" module is not displayed

  @jira.QANOV-77289 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the appointment date from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "appointment_date.edit" link
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-77290 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the contact info from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "contact_info.edit_link" link
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name_modified]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname_modified]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni_modified]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email_modified]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number_modified]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum editada" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And the "contact_info.name" textfield with "[CONF:appointment_booking.client_name_modified] [CONF:appointment_booking.client_surname_modified]" text is displayed
      And the "contact_info.email" textfield with "[CONF:appointment_booking.client_email_modified]" text is displayed
      And the "contact_info.phone_number" textfield with "[CONF:appointment_booking.client_phone_number_modified]" text is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-67888 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: A user can modify the choosen smartphone info from the store appointment summary screen after selecting the device collection service
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "smartphone.edit_link" link
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand_modified]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model_modified]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color_modified]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage_modified]" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And the "smartphone" module is displayed
      And the "smartphone.title" textfield with "Smartphone" text is displayed
      And the "smartphone.brand" textfield with "[CONF:appointment_booking.smartphone_brand_modified]" text is displayed
      And the "smartphone.model" textfield with "[CONF:appointment_booking.smartphone_model_modified]" text is displayed
      And the "smartphone.storage" textfield with "[CONF:appointment_booking.smartphone_storage_modified]" text is displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color_modified]" text is displayed
      And the "smartphone.edit" link with "Editar" text is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "smartphone" module is displayed

  @jira.QANOV-67889 @android @manual @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-67582 @mobile @moves
  @smoke
  Scenario: A user can see the confirmation of the store appointment after selecting the device collection service
    Mocks in QA are implemented to work with the 'tomorrow' day. This scenario is automated to run in QA environment picking tomorrow.
    other_affected_versions=2021-14-B
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on tomorrow date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the enter key for the "smartphone_storage_input" inputtext
      And clicks on the "smartphone_insurance_check" checkbox
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
      And the "appointment_service" textfield with "1. Recogida Dispositivo Incluido" text is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_map" map is displayed
      And the "store_location_address" textfield is displayed
      And the "smartphone.icon" icon is displayed
      And the "smartphone.brand_model" textfield with "[CONF:appointment_booking.smartphone_brand] [CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.storage" textfield with "[CONF:appointment_booking.smartphone_storage]" text is displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color]" text is displayed
      And the "store_phone_number_title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_number" textfield with the "\+\d{11}" format is displayed
      And the "store_phone_call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-84624 @android @ios @jira.cv.12.3 @jira.link.detects.DBD-217 @jira.link.parent_test_plan.QANOV-67582 @manual
  @mobile @moves @regression
  Scenario: A user can see the confirmation of the store appointment after selecting the device collection service without filling the smartphone storage
    other_affected_versions=2021-18
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "personal_id_input" inputtext with the "[CONF:appointment_booking.client_dni]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield with "1. Recogida Dispositivo Incluido" text is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "smartphone" module is displayed
      And the "smartphone.icon" icon is displayed
      And the "smartphone.brand" textfield with "[CONF:appointment_booking.smartphone_brand]" text is displayed
      And the "smartphone.model" textfield with "[CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.storage" textfield is not displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color]" text is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-131930 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can modify the chosen smartphone from the create appointment success screen after selecting the device collection service
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the element with "1. Recogida Dispositivo Incluido" text in the "appointment_booking_services_list" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "any" available slots for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage]" text
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "smartphone.edit_link" link
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "smartphone_brand_input" inputtext with the "[CONF:appointment_booking.smartphone_brand_modified]" text
      And fills the "smartphone_model_input" inputtext with the "[CONF:appointment_booking.smartphone_model_modified]" text
      And fills the "smartphone_color_input" inputtext with the "[CONF:appointment_booking.smartphone_color_modified]" text
      And fills the "smartphone_storage_input" inputtext with the "[CONF:appointment_booking.smartphone_storage_modified]" text
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "smartphone" module is displayed
      And the "smartphone.icon" icon is displayed
      And the "smartphone.brand" textfield with "[CONF:appointment_booking.smartphone_brand_modified]" text is displayed
      And the "smartphone.model" textfield with "[CONF:appointment_booking.smartphone_model_modified]" text is displayed
      And the "smartphone.storage" textfield with "[CONF:appointment_booking.smartphone_storage_modified]" text is displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color_modified]" text is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-224239 @TBD @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user without the "email" contact and who accesed to 'Store Appointment Booking' method won't see any text in the "email_input" inputfield and the comercial communications checkbox is displayed
    Given user has not the "email" contact methods
      And user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "email_input" inputtext is displayed
      And the "email_input" inputtext is empty
      And the "phone_number_input" inputtext is displayed
      And the "phone_number_input" inputtext is empty
      And the "commercial_communications_label" textfield with "Acepto el uso de este email para el envío de comunicaciones relacionadas con mi contrato" text is displayed
      And the "commercial_communications_check" checkbox is displayed
      And the "commercial_communications_check" checkbox is not checked

  @jira.QANOV-224240 @TBD @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user with an "email" contact method and who accesed to 'Store Appointment Booking' edits the email: comercial communications checkbox is displayed
    Given user has the "email" contact methods
      And user is in the "Store Appointment Booking" page
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "0" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "email_input" inputtext with the "systemtestnovum@gmail.com" text
     Then the "commercial_communications_label" textfield with "Acepto el uso de este email para el envío de comunicaciones relacionadas con mi contrato" text is displayed
      And the "commercial_communications_check" checkbox is displayed
      And the "commercial_communications_check" checkbox is not checked

  @jira.QANOV-224241 @TBD @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user without the "email" contact method and who accesed to 'Store Appointment Booking' from deeplink won't see any text in the "email_input" inputfield and the comercial communications checkbox is displayed
    Given user has not the "email" contact methods
      And user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "email_input" inputtext is displayed
      And the "email_input" inputtext is empty
      And the "phone_number_input" inputtext is displayed
      And the "phone_number_input" inputtext is empty
      And the "commercial_communications_label" textfield with "Acepto el uso de este email para el envío de comunicaciones relacionadas con mi contrato" text is displayed
      And the "commercial_communications_check" checkbox is displayed
      And the "commercial_communications_check" checkbox is not checked

  @jira.QANOV-224242 @TBD @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user with an "email" contact method and who accesed to 'Store Appointment Booking' from deeplink edits the email: comercial communications checkbox is displayed
    Given user has the "email" contact methods
      And user opens the "Support.Device Collection" deeplink with the app in "killed" status
      And the "Store Appointment Booking" page is displayed
     When fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "email_input" inputtext with the "systemtestnovum@gmail.com" text
     Then the "commercial_communications_label" textfield with "Acepto el uso de este email para el envío de comunicaciones relacionadas con mi contrato" text is displayed
      And the "commercial_communications_check" checkbox is displayed
      And the "commercial_communications_check" checkbox is not checked

# -*- coding: utf-8 -*-
@jira.QANOV-36683 @not_hardening
Feature: Store Appointment Booking


  @jira.QANOV-36684 @automatic @cert2 @jira.cv.11.14 @live @moves @next @smoke @web @ber
  Scenario: A user can access to the appointment booking page to start the flow
     When I go to "[CONF:appointment_booking.web_url]" web page
     Then the "StoreAppointmentBooking" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "Selecciona una tienda Movistar"
      And the text of the element "appointment_booking_subtitle" is equal to "Introduce una dirección o comparte la actual para ver las tiendas cercanas."
      And the "store_search" element is displayed
      And the text of the element "store_search_placeholder" is equal to "Introduce una dirección o CP…"

  @jira.QANOV-36685 @automatic @cert2 @jira.cv.11.14 @live @moves @next @smoke @web @ber
  Scenario: A user can see the share location module to see the nearest Movistar stores
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
     Then the "share_location_icon" element is displayed
      And the text of the element "share_location_title" is equal to "Usar mi ubicación actual"
      And the text of the element "share_location_subtitle" is equal to "Solo usaremos tu ubicación esta vez"

  @jira.QANOV-36686 @automation.hard @jira.cv.11.14 @manual @moves @smoke @web
  Scenario: A user can share the location to see the nearest Movistar stores the first time accessing the web
    Given I have not granted "location" permissions to the browser for the "[CONF:appointment_booking.web_url]" web page
      And I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And the "share_location" element is displayed
      And I click on the "share_location" element
      And I click on the "allow_button" button
     Then the "store_search" inputtext filled with the actual location is displayed
      And the "stores_list" list is displayed
      And the map with the ">=1" nearest Movistar stores to "actual_location" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.QANOV-36687 @automation.hard @jira.cv.11.14 @manual @moves @smoke @web
  Scenario: A user with location permissions granted can share the location to see the nearest Movistar stores
    Given I have granted "location" permissions to the browser for the "[CONF:appointment_booking.web_url]" web page
      And I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And the "share_location" element is displayed
      And I click on the "share_location" element
     Then the "store_search" inputtext filled with the actual location is displayed
      And the "stores_list" list is displayed
      And the map with the ">=1" nearest Movistar stores to "actual_location" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.QANOV-77302 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user will see an error message after searching a location to see the nearest Movistar stores and rejecting location permissions the first time accessing the web
    Given I have not granted "location" permissions to the browser for the "[CONF:appointment_booking.web_url]" web page
      And I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And the "share_location" element is displayed
      And I click on the "share_location" element
      And I click on the "deny_button" button
     Then the text of the element "error_message_title" is equal to "Lo sentimos, no logramos localizarte"
      And the text of the element "error_message_subtitle" is equal to "Por favor, introduce una dirección en el buscador y selecciona una tienda."

  @<test_priority> @automatic @cert2 @jira.<jira_id> @jira.cv.11.14 @live @moves @next @web @ber
  Scenario Outline: A user can see the list of the nearest Movistar stores with <number_stores> stores near the searched location
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "<search_location>"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
     Then there are "<stores_displayed>" elements on the "stores_list" elements list
      And the elements in the "stores_list" list are in numerical "ascending" order by the "distance" field
      And each item in the "stores_list" list has the "store_name" field
      And each item in the "stores_list" list has the "store_address" field
      And each item in the "stores_list" list has the "distance" field

    Examples:
          | number_stores | stores_displayed | search_location                                               | test_priority | jira_id     |
          | >=15          | 15               | [CONF:appointment_booking.search_location]                    | smoke         | QANOV-36688 |
          | 15            | 15               | [CONF:appointment_booking.search_location_15_movistar_stores] | regression    | QANOV-36689 |
          | 5             | 5                | [CONF:appointment_booking.search_location_5_movistar_stores]  | regression    | QANOV-36690 |
          | 1             | 1                | [CONF:appointment_booking.search_location_1_movistar_stores]  | regression    | QANOV-36691 |

  @<test_priority> @automation.hard @jira.<jira_id> @jira.cv.11.14 @manual @moves @web
  Scenario Outline: A user with <number_stores> Movistar stores near can search a location to see the nearest Movistar stores
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
      And there is "<number_stores>" stores near the "<location>" location
     When I click on the "store_search" element
      And I fill in the "store_search" field with "<location>"
      And I press the Enter key on "store_search" field
     Then the map with the "<stores_displayed>" nearest Movistar stores to "<location>" is displayed
      And the map will be centered in the nearest Movistar store

    Examples:
          | number_stores | stores_displayed | location                                                     | test_priority | jira_id     |
          | 1             | 1                | [CONF:appointment_booking.search_location_1_movistar_stores] | regression    | QANOV-36692 |
          | >=3           | 3                | [CONF:appointment_booking.search_location]                   | smoke         | QANOV-36693 |

  @jira.QANOV-36696 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user can zoom out the map to see more of the nearest Movistar stores
    internal_checkpoint="user will see a maximum of 15 stores in the map"
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And I click on the "map.zoom_out_button" element
     Then the map with the ">3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed

  @jira.QANOV-36697 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user can move the map to other location to see the nearest Movistar stores
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And moves the map to other location
     Then the "search_in_this_zone" button is displayed
      And the text of the element "search_in_this_zone" is equal to "Buscar por esta zona"

  @jira.QANOV-36698 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user can search to see the nearest Movistar stores after moving the map to other location
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And moves the map to "[CONF:appointment_booking.search_location_modified]" location
      And I click on the "search_in_this_zone" button
     Then the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location_modified]" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.QANOV-36699 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user cannot see the the nearest Movistar stores in a location without Movistar stores
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_no_movistar_stores]"
      And I press the Enter key on "store_search" field
      And waits until the "google_map" element is visible
     Then the "google_map" element is displayed
      And the "google_map_stores" list is not displayed
      And the text of the element "error_message_title" is equal to "No hay tiendas en esta ubicación."
      And the text of the element "error_message_subtitle" is equal to "Por favor, inténtalo de nuevo con otra dirección"

  @jira.QANOV-36704 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can start the store appointment booking flow from the Movistar stores list
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

  @jira.QANOV-36705 @automatic @cert2 @jira.cv.11.14 @live @moves @next @smoke @web @ber
  Scenario: A user can select the first service for the store appointment booking
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "1" position from "appointment_booking_services" elements list
     Then the "StoreAppointmentBookingDateSelection" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "¿Cuándo quieres reservar tu cita?"
      And the text of the element "appointment_booking_subtitle" is equal to "Selecciona la fecha y hora que prefieras"
      And the "calendar_input" element is displayed

  @jira.QANOV-36706 @automatic @cert2 @jira.cv.11.14 @live @moves @next @smoke @web @ber
  Scenario: A user can select the second service for the store appointment booking
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
     Then the "StoreAppointmentBookingDateSelection" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "¿Cuándo quieres reservar tu cita?"
      And the text of the element "appointment_booking_subtitle" is equal to "Selecciona la fecha y hora que prefieras"
      And the "calendar_input" element is displayed

  @jira.QANOV-36707 @automatic @cert2 @jira.cv.11.14 @live @moves @next @smoke @web @ber
  Scenario: A user can select the third service for the store appointment booking
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
     Then the "StoreAppointmentBookingDateSelection" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "¿Cuándo quieres reservar tu cita?"
      And the text of the element "appointment_booking_subtitle" is equal to "Selecciona la fecha y hora que prefieras"
      And the "calendar_input" element is displayed

  @jira.QANOV-36708 @automatic @cert2 @jira.cv.11.14 @live @moves @next @smoke @web @ber
  Scenario: A user can select the fourth service for the store appointment booking
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "4" position from "appointment_booking_services" elements list
     Then the "StoreAppointmentBookingDateSelection" page is loaded
      And the "close_button" element is displayed
      And the "appointment_booking_progress_bar" element is displayed
      And the text of the element "appointment_booking_title" is equal to "¿Cuándo quieres reservar tu cita?"
      And the text of the element "appointment_booking_subtitle" is equal to "Selecciona la fecha y hora que prefieras"
      And the "calendar_input" element is displayed

  @jira.QANOV-36709 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user cannot continue with the appointment booking without selecting a slot
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I wait "1" seconds
      And I click on the "next" element
     Then the text of the element "form_error" is equal to "Tienes que seleccionar una opción"

  @jira.QANOV-84630 @automation.hard @jira.cv.12.3 @manual @moves @smoke @web
  Scenario: A user cannot select any day in the calendar before tomorrow
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And I click on "any" Movistar store in the map
      And I click on the "store_information.appointment_booking_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the "2" element in the "appointment_booking_services" list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on calendar icon in the "calendar_input" datepicker
     Then all days before "tomorrow" will be disabled in the "calendar_input" datepicker

  @jira.QANOV-36710 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user cannot continue with the appointment booking when there is no free slot
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar support field with "70" days from today
     Then the text of the element "error_message_title" is equal to "No hay citas disponibles para esta fecha"
      And the text of the element "error_message_subtitle" is equal to "Lo sentimos, no quedan horas disponibles. Por favor, selecciona otro día."

  @automatic @cert2 @jira.<jira_id> @jira.cv.11.14 @jira.link.detects.DBD-137 @jira.link.parent_test_plan.QANOV-67582
  @live @moves @next @smoke @web @ber
  Scenario Outline: A user can select a date and a slot to the store appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "<daytime>" available slot for the Movistar store
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
      And the "email_input" element is displayed
      And the text of the web element "email_placeholder" is equal to "Email"
      And the "phone_number_input" element is displayed
      And the text of the web element "phone_number_placeholder" is equal to "Número de teléfono"
      And the "more_info_input" element is displayed
      And the text of the web element "more_info_placeholder" is equal to "Cuéntanos más sobre tu visita"
      And the text of the web element "more_info_optional_placeholder" is equal to " (opcional)"
      And the text of the web element "legal_terms_text" contains "He leído y acepto los Términos legales"
      And the text of the web element "legal_terms_link" contains "Términos legales"
      And the text of the element "next" is equal to "Siguiente"

    Examples:
          | daytime   | jira_id     |
          | morning   | QANOV-36711 |
          | afternoon | QANOV-36712 |

  @jira.QANOV-36713 @automatic @cert2 @jira.cv.11.14 @jira.link.detects.WEB-2 @jira.link.parent_test_plan.QANOV-67582
  @live @moves @next @regression @web @ber
  Scenario: A user can see the legal terms for the store appointment contact information provided
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" web button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I scroll to the element "legal_terms_link"
      And I click on the "legal_terms_link" web button
     Then the "ConfirmationPopup" page is loaded
      And the text of the element "title" is equal to "Términos legales"
      And the text of the element "message" contains "Movistar informa que los datos que se facilitan en el presente formulario serán tratados por Telefónica de España S.A.U. y Telefónica Móviles España S.A.U. (en adelante Movistar) como corresponsables con la finalidad de proporcionarle la información comercial solicitada, así como el resto de finalidades que se hubieran permitido o autorizado de conformidad con lo dispuesto en https://www.movistar.es/privacidad Movistar informa que dispondrá de los siguientes medios para ejercer sus derechos"
      And the text of the element "accept_text" is equal to "Aceptar términos legales"
      And the text of the element "cancel_text" is equal to "Cancelar"

  @jira.QANOV-36714 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can accept the legal terms for the store appointment contact information provided
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I scroll to the element "legal_terms_link"
      And I click on the "legal_terms_link" element
      And the "ConfirmationPopup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" web button
     Then the "StoreAppointmentBookingContactInfo" page is loaded
      And the "legal_terms_check" checkbox is enabled

  @jira.QANOV-36715 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can cancel to accept the legal terms for the store appointment contact information provided
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I scroll to the element "legal_terms_link"
      And I click on the "legal_terms_link" web button
      And the "ConfirmationPopup" page is loaded
      And waits until the "cancel" element is visible
      And I click on the "cancel" button
     Then the "StoreAppointmentBookingContactInfo" page is loaded
      And the "legal_terms_check" checkbox is disabled

  @jira.QANOV-36716 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can not continue with the appointment booking without filling the mandatory contact information
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I click on the "next" button
     Then the text of the element "name_error" is equal to "Este campo es obligatorio"
      And the text of the element "surname_error" is equal to "Este campo es obligatorio"
      And the text of the element "email_error" is equal to "Este campo es obligatorio"
      And the text of the element "phone_number_error" is equal to "Este campo es obligatorio"

  @automatic @cert2 @jira.<jira_id> @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario Outline: A user can not continue with the appointment booking with wrong email
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "<wrong_email>"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I click on the "next" button
     Then the text of the element "email_error" is equal to "Email incorrecto"

    Examples:
          | wrong_email | jira_id     |
          | a           | QANOV-36717 |
          | a@          | QANOV-36718 |
          | @gmail.com  | QANOV-36719 |
          | gmail.com   | QANOV-36720 |

  @jira.QANOV-77303 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can not continue with the appointment booking without accepting the legal terms
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I click on the "next" button
     Then the text of the element "legal_terms_error" is equal to "Tienes que aceptar los Términos legales"

  @jira.QANOV-36721 @automatic @cert2 @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-67582 @live @moves @next @smoke
  @web @ber
  Scenario: A user can see a summary of the store appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "1" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
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
      And the text of the element "confirm_button" is equal to "Confirmar"

  @jira.QANOV-36722 @automatic @cert1 @jira.cv.11.14 @moves @regression @web @ber
  Scenario: A user can modify the Movistar store from the store appointment summary screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the element "store_info_edit_link"
      And I wait "1" seconds
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_modified]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-36723 @automatic @cert1 @jira.cv.11.14 @moves @regression @web @ber
  Scenario: A user can modify the appointment service from the store appointment summary screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the element "appointment_service_edit_link"
      And I wait "1" seconds
      And I click on the "appointment_service_edit_link" element
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-36724 @automatic @cert1 @jira.cv.11.14 @moves @regression @web @ber
  Scenario: A user can modify the appointment date from the store appointment summary screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the element "appointment_date_edit_link"
      And I wait "1" seconds
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
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-36725 @automatic @cert1 @jira.cv.11.14 @moves @smoke @web @ber
  Scenario: A user can modify the contact info from the store appointment summary screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the element "contact_info_edit_link"
      And I wait "1" seconds
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
      And the "contact_info_edit_link" element is displayed
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-36726 @automatic @cert1 @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-67582 @moves @sanity @web @ber
  Scenario: A user can see the confirmation of the store appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "success_title" is equal to "Reserva confirmada"
      And the text of the element "success_subtitle" is equal to "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS."
      And the "appointment_store_name" element is displayed
      And the "appointment_service" element is displayed
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_authorization_link" is equal to "¿Puedo autorizar a alguien para que vaya en mi lugar?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the text of the element "store_phone_title" is equal to "Teléfono tienda"
      And the text of the element "store_phone_number" has the "\+\d{11}" format
      And the "store_phone_call_icon" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

  @jira.QANOV-134416 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @automatic @moves @regression @web @cert1 @ber
  Scenario: A user can access to a webview with information about how to authorize another person to go to the store from the create appointment success screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "appointment_store_authorization_link" element
     Then the current URL is "https://atencionalcliente.movistar.es/?f=1507" after "5" seconds

  @jira.QANOV-134417 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @automatic @moves @smoke @web @cert1 @ber
  Scenario: A user can access to the edit store appointment screen from the create appointment success screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
     Then the "Edit Store Appointment" page is loaded
      And the "close_button" element is displayed
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
      And the text of the element "confirm_button" is equal to "Confirmar"

  @jira.QANOV-134418 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @smoke @web
  Scenario: A user can modify the Movistar store from the edit store appointment screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "store_info_edit_link"
      And I wait "1" seconds
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_modified]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-134419 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @regression @web
  Scenario: A user can modify the appointment service from the edit store appointment screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "appointment_service_edit_link"
      And I wait "1" seconds
      And I click on the "appointment_service_edit_link" element
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-134420 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @regression @web
  Scenario: A user can modify the appointment date from the edit store appointment screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "appointment_date_edit_link"
      And I wait "1" seconds
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
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-134421 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @regression @web
  Scenario: A user can modify the contact info from the edit store appointment screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "contact_info_edit_link"
      And I wait "1" seconds
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
      And the "contact_info_edit_link" element is displayed
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-134422 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @regression @web
  Scenario: A user can modify a store appointment from the edit appointment success screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "store_info_edit_link"
      And I wait "1" seconds
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_modified]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "store_info_edit_link"
      And I wait "1" seconds
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_modified]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-134423 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @moves @regression @web
  Scenario: A user can cancel a store appointment from the edit appointment success screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "store_info_edit_link"
      And I wait "1" seconds
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_modified]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded
      And I scroll to the element "cancel_appointment_link"
      And I wait "1" seconds
      And I click on the "cancel_appointment_link" element
      And the "ConfirmationPopup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" web button
     Then the "Store Appointment Booking Cancelled Feedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "appointment_cancelled_title" is equal to "Reserva cancelada"
      And the text of the element "appointment_cancelled_subtitle" is equal to "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites."
      And the text of the element "book_another_appointment_button" is equal to "Reservar otra cita"

  @jira.QANOV-36727 @automatic @cert1 @jira.cv.11.14 @moves @regression @web @ber
  Scenario: A user can see a ConfirmationPopup before cancelling a store appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I scroll to the element "cancel_appointment_link"
      And I wait "1" seconds
      And I click on the "cancel_appointment_link" element
     Then the "ConfirmationPopup" page is loaded
      And the text of the element "title" is equal to "Cancelar cita"
      And the text of the element "message" is equal to "¿Seguro que quieres cancelar la cita?"
      And the text of the element "accept" is equal to "Cancelar cita"
      And the text of the element "cancel" is equal to "Volver"

  @jira.QANOV-36728 @automatic @cert1 @jira.cv.11.14 @moves @regression @web @ber
  Scenario: A user does not confirm the cancelation of a store appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I scroll to the element "cancel_appointment_link"
      And I wait "1" seconds
      And I click on the "cancel_appointment_link" element
      And the "ConfirmationPopup" page is loaded
      And waits until the "cancel" element is visible
      And I click on the "cancel" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded

  @jira.QANOV-36729 @automatic @cert1 @jira.cv.11.14 @moves @smoke @web @ber
  Scenario: A user can cancel a store appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I scroll to the element "cancel_appointment_link"
      And I wait "1" seconds
      And I click on the "cancel_appointment_link" element
      And the "ConfirmationPopup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" web button
     Then the "Store Appointment Booking Cancelled Feedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "appointment_cancelled_title" is equal to "Reserva cancelada"
      And the text of the element "appointment_cancelled_subtitle" is equal to "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites."
      And the text of the element "book_another_appointment_button" is equal to "Reservar otra cita"

  @jira.QANOV-36730 @automatic @cert1 @jira.cv.11.14 @moves @regression @web @ber
  Scenario: A user can start a new appointment booking after cancelling an appointment
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I scroll to the element "cancel_appointment_link"
      And I wait "1" seconds
      And I click on the "cancel_appointment_link" element
      And the "ConfirmationPopup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" web button
      And the "Store Appointment Booking Cancelled Feedback" page is loaded
      And I wait "2" seconds
      And I click on the "book_another_appointment_button" button
     Then the "StoreAppointmentBooking" page is loaded

  @jira.QANOV-36731 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user can see a session expired error after waiting more than 5 minutes to complete the contact information
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And I click on "any" Movistar store in the map
      And I click on the "store_information.appointment_booking_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the "2" element in the "appointment_booking_services" list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on calendar icon in the "calendar_input" datepicker
      And I click on "any" date in the "calendar_input" calendar
      And I click on "any" slot in the checkbox with the "any" available slots for the Movistar store
      And I click on the "next_button" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I wait "301" seconds
     Then the "Store Appointment Booking Expired Session Feedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "expired_session_title" is equal to "Tu reserva ha expirado"
      And the text of the element "expired_session_subtitle" is equal to "Lo sentimos, has tardado demasiado en introducir tus datos y la reserva ha expirado. Por favor, escoge otra hora."
      And the text of the element "select_new_slot" is equal to "Seleccionar nueva hora"

  @jira.QANOV-36732 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user can see a session expired error after waiting more than 5 minutes to confirm the appointment booking
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And I click on "any" Movistar store in the map
      And I click on the "store_information.appointment_booking_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the "2" element in the "appointment_booking_services" list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on calendar icon in the "calendar_input" datepicker
      And I click on "any" date in the "calendar_input" calendar
      And I click on "any" slot in the checkbox with the "any" available slots for the Movistar store
      And I click on the "next_button" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next_button" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I wait "301" seconds
     Then the "Store Appointment Booking Expired Session Feedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "expired_session_title" is equal to "Tu reserva ha expirado"
      And the text of the element "expired_session_subtitle" is equal to "Lo sentimos, has tardado demasiado en introducir tus datos y la reserva ha expirado. Por favor, escoge otra hora."
      And the text of the element "select_new_slot" is equal to "Seleccionar nueva hora"

  @jira.QANOV-36733 @automation.hard @jira.cv.11.14 @manual @moves @regression @web
  Scenario: A user can restart the appoint booking flow after the session expired
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And I click on "any" Movistar store in the map
      And I click on the "store_information.appointment_booking_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the "2" element in the "appointment_booking_services" list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on calendar icon in the "calendar_input" datepicker
      And I click on "any" date in the "calendar_input" calendar
      And I click on "any" slot in the checkbox with the "any" available slots for the Movistar store
      And I click on the "next_button" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I wait "301" seconds
      And the "Store Appointment Booking Expired Session Feedback" page is loaded
      And I click on the "select_new_slot" button
     Then the "StoreAppointmentBookingDateSelection" page is loaded

  @jira.QANOV-36734 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can close the store appointment booking map screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "close_button" button
      And I wait "1" seconds
      And I click on the "close_popup_accept" button
     Then the current URL is "https://www.movistar.es/"

  @jira.QANOV-36735 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can close the store appointment booking service screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "1" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I click on the "close_button" button
      And I wait "1" seconds
      And I click on the "close_popup_accept" button
     Then the current URL is "https://www.movistar.es/"

  @jira.QANOV-36736 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can close the StoreAppointmentBookingDateSelection screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "1" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "1" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "close_button" button
      And I wait "1" seconds
      And I click on the "close_popup_accept" button
     Then the current URL is "https://www.movistar.es/"

  @jira.QANOV-36737 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can close the StoreAppointmentBookingContactInfo screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "1" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "1" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I click on the "close_button" button
      And I wait "1" seconds
      And I click on the "close_popup_accept" button
     Then the current URL is "https://www.movistar.es/"

  @jira.QANOV-36738 @automatic @cert2 @jira.cv.11.14 @live @moves @next @regression @web @ber
  Scenario: A user can close the StoreAppointmentBookingSummary screen
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "StoreAppointmentBooking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "1" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I click on the "close_button" button
      And I wait "1" seconds
      And I click on the "close_popup_accept" button
     Then the current URL is "https://www.movistar.es/"

  @jira.QANOV-134424 @manual @cert1 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @moves @regression @web
  @jira.link.detects.DBD-410
  Scenario: A user can see the confirmation of the store appointment accessing with the url with the store
    Given I go to "[CONF:appointment_booking.web_url_with_store]" web page
      And the "StoreAppointmentBookingServiceSelection" page is loaded
     When I press the element in "2" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And the "close_button" element is displayed
      And the text of the element "success_title" is equal to "Reserva confirmada"
      And the text of the element "success_subtitle" is equal to "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS."
      And the "appointment_store_name" element is displayed
      And the "appointment_service" element is displayed
      And the text of the element "appointment_slot_time" has the "\d?\d:\d{2}H" format
      And the "appointment_date" element is displayed
      And the text of the element "appointment_store_authorization_link" is equal to "¿Puedo autorizar a alguien para que vaya en mi lugar?"
      And the "store_map" element is displayed
      And the "store_address" element is displayed
      And the text of the element "store_phone_title" is equal to "Teléfono tienda"
      And the text of the element "store_phone_number" has the "\+\d{11}" format
      And the "store_phone_call_icon" element is displayed
      And the text of the element "edit_appointment_button" is equal to "Editar cita"
      And the text of the element "cancel_appointment_link" is equal to "Cancelar cita"

  @jira.QANOV-134425 @manual @cert1 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @moves @regression @web
  @jira.link.detects.DBD-408
  Scenario: A user can modify the appointment store from the create appointment success screen accessing with the url with the store
    Given I go to "[CONF:appointment_booking.web_url_with_store]" web page
      And the "StoreAppointmentBookingServiceSelection" page is loaded
     When I press the element in "2" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I fill in the "name_input" field with "[CONF:appointment_booking.client_name]"
      And I fill in the "surname_input" field with "[CONF:appointment_booking.client_surname]"
      And I fill in the "email_input" field with "[CONF:appointment_booking.client_email]"
      And I fill in the "phone_number_input" field with "[CONF:appointment_booking.client_phone_number]"
      And I fill in the "more_info_input" field with "Esto es una prueba de Novum"
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
      And the "StoreAppointmentBookingSuccessFeedback" page is loaded
      And I click on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is loaded
      And I scroll to the element "store_info_edit_link"
      And I wait "1" seconds
      And I click on the "store_info_edit_link" element
      And the "StoreAppointmentBooking" page is loaded
      And I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location_modified]"
      And I press the Enter key on "store_search" field
      And the "stores_list" list is displayed
      And I click on the "appointment_booking" field on the "0" element in the "stores_list" web list
      And I click on the "book_button" button
      And the "StoreAppointmentBookingServiceSelection" page is loaded
      And I press the element in "3" position from "appointment_booking_services" elements list
      And the "StoreAppointmentBookingDateSelection" page is loaded
      And I click on the "calendar_input" element
      And I fill in the "calendar_input" calendar field with any day with available slots
      And I click on any "any" available slot for the Movistar store
      And I click on the "next" button
      And the "StoreAppointmentBookingContactInfo" page is loaded
      And I check the box "legal_terms_check"
      And I click on the "next" button
      And the "StoreAppointmentBookingSummary" page is loaded
      And I scroll to the bottom of the page
      And I wait "1" seconds
      And I click on the "confirm_button" button
     Then the "Edit StoreAppointmentBookingSuccessFeedback" page is loaded

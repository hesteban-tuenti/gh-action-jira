# -*- coding: utf-8 -*-
@jira.QANOV-25004
Feature: Store Appointment Booking


  @jira.QANOV-25006 @android @manual @ios @jira.cv.11.14 @mobile @moves @smoke
  Scenario: A user can see the share location module to see the nearest Movistar stores
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
     Then the "share_location_icon" icon is displayed
      And the "share_location_title" textfield with "Usar mi ubicación actual" text is displayed
      And the "share_location_subtitle" textfield with "Solo usaremos tu ubicación esta vez" text is displayed

  @jira.QANOV-25007 @android @automation.hard @ios @jira.cv.11.14 @manual @mobile @moves @smoke
  Scenario: A user can share the location to see the nearest Movistar stores
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And the "share_location" module is displayed
      And clicks on the "share_location" module
     Then the "store_search" inputtext filled with the actual location is displayed
      And the "map_tab" tab is selected
      And the map with the ">=1" nearest Movistar stores to "actual_location" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.11.14 @mobile @moves @next @live @cert2
  @webapp
  Scenario Outline: A user can see the list of the nearest Movistar stores with <number_stores> stores near the searched location
    Given user is in the "Store Appointment Booking" page
      And fills the "store_search" inputtext with the "<search_location>" text
      And clicks on the search key for the "store_search" inputtext
      And waits until the "stores_list_tab" element is visible
      And clicks on the "stores_list_tab" tab
     Then the "stores_list_tab" tab is selected
      And the "stores_list" list is displayed
      And the "stores_list" list has "<stores_displayed>" elements
      And the elements in the "stores_list" list are in numerical "ascending" order by the "distance" field
      And each element in the "stores_list" list has the "store_name" field
      And each element in the "stores_list" list has the "store_address" field
      And each element in the "stores_list" list has the "distance" field
      And clicks on the "stores_list_map" button
      And clicks on the "store_search_clear_button" button

    Examples:
          | number_stores | stores_displayed | search_location                                               | test_priority | ber | jira_id     |
          | >=15          | 15               | [CONF:appointment_booking.search_location]                    | smoke         | ber | QANOV-25008 |
          | 15            | 15               | [CONF:appointment_booking.search_location_15_movistar_stores] | regression    |     | QANOV-25009 |
          | 5             | 5                | [CONF:appointment_booking.search_location_5_movistar_stores]  | regression    |     | QANOV-25010 |
          | 1             | 1                | [CONF:appointment_booking.search_location_1_movistar_stores]  | regression    |     | QANOV-25011 |

  @jira.<jira_id> @<test_priority> @android @automation.hard @ios @jira.cv.11.14 @jira.link.detects.SUBO-5261
  @jira.link.detects.SUBO-5262 @jira.link.detects.SUBO-5336 @manual @mobile @moves
  Scenario Outline: A user with <number_stores> Movistar stores near can search a location to see the nearest Movistar stores
    Given user is in the "Store Appointment Booking" page
      And there is "<number_stores>" stores near the "<location>" location
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "<location>" text
     Then the "map_tab" tab is selected
      And the map with the "<stores_displayed>" nearest Movistar stores to "<location>" is displayed
      And the map will be centered in the nearest Movistar store

    Examples:
          | number_stores | stores_displayed | location                                                     | test_priority | jira_id     |
          | 1             | 1                | [CONF:appointment_booking.search_location_1_movistar_stores] | regression    | QANOV-25012 |
          | >=3           | 3                | [CONF:appointment_booking.search_location]                   | smoke         | QANOV-25013 |

  @jira.QANOV-77291 @android @ios @jira.cv.11.14 @jira.link.detects.DBD-171 @manual @mobile @moves @regression
  Scenario: A user can go back to the map from the stores list
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And clicks on the "stores_list_tab" tab
      And clicks on the "map_tab" tab
     Then the "map_tab" tab is selected
      And the map with the "3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.QANOV-77292 @android @automation.hard @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can search a location to see the nearest Movistar stores after accepting location permissions
    Given user has denied "location" permissions
      And user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And clicks on the "share_location" module
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "store_search" inputtext filled with the actual location is displayed
      And the "map_tab" tab is selected
      And the map with the ">=1" nearest Movistar stores to "actual_location" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.QANOV-77293 @android @automation.hard @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user will see an error message after searching a location to see the nearest Movistar stores and rejecting location permissions
    Given user has denied "location" permissions
      And user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And clicks on the "share_location" module
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "error_message_title" textfield with "Lo sentimos, no logramos localizarte" text is displayed
      And the "error_message_subtitle" textfield with "Por favor, introduce una dirección en el buscador y selecciona una tienda." text is displayed

  @jira.QANOV-25016 @android @automation.hard @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can zoom out the map to see more of the nearest Movistar stores
    internal_checkpoint="user will see a maximum of 15 stores in the map"
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And zooms out in the map
     Then the map with the ">3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed

  @jira.QANOV-25017 @android @automation.hard @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can move the map to other location to see the nearest Movistar stores
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And moves the map to other location
     Then the "search_in_this_zone" button with "Buscar por esta zona" text is displayed

  @jira.QANOV-25018 @android @automation.hard @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can search to see the nearest Movistar stores after moving the map to other location
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And moves the map to "[CONF:appointment_booking.search_location_modified]"location
      And clicks on the "search_in_this_zone" button
     Then the "map_tab" tab is selected
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location_modified]" is displayed
      And the map will be centered in the nearest Movistar store

  @jira.QANOV-25019 @android @manual @ios @jira.cv.11.14 @jira.link.detects.DBD-55 @mobile @moves
  @regression
  Scenario: A user cannot see the nearest Movistar stores in a location without Movistar stores
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location_no_movistar_stores]" text
      And clicks on the search key for the "store_search" inputtext
     Then the "map_tab" tab is selected
      And the "google_map" map is displayed
      And the "Map Warning" warning is displayed
      And the "warning.text" textfield with "Lo sentimos, no hay tiendas en esta ubicación." text is displayed
      And waits until the "Map Warning" warning is not displayed
      And the "Store Appointment Booking" page is displayed
      And the "google_map.stores" list is not displayed
      And clicks on the "store_search_clear_button" button

  @jira.QANOV-25020 @android @manual @ios @jira.cv.11.14 @jira.link.detects.DBD-57 @mobile @moves
  @regression
  Scenario: A user cannot see the list of the nearest Movistar stores in a location without Movistar stores
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location_no_movistar_stores]" text
      And clicks on the search key for the "store_search" inputtext
      And clicks on the "stores_list_tab" tab
     Then the "stores_list_tab" tab is selected
      And the "error_message_title" textfield with "No hay tiendas en esta ubicación." text is displayed
      And the "error_message_subtitle" textfield with "Por favor, inténtalo de nuevo con otra dirección" text is displayed
      And clicks on the "map_tab" tab
      And clicks on the "store_search_clear_button" button

  @jira.QANOV-25026 @android @manual @ios @jira.cv.11.14 @mobile @moves @smoke
  Scenario: A user can see the information card about a Movistar store in the map
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
     Then the "map_store_information_popup" element is on display
      And the "map_store_information_popup.store_name_textfield" textfield is displayed
      And the "map_store_information_popup.store_address_textfield" textfield is displayed
      And the "map_store_information_popup.distance_textfield" textfield is displayed
      And the "map_store_information_popup.appointment_booking_button" button with "Reservar Cita" text is displayed
      And the "map_store_information_popup_close_button" button is displayed
      And clicks on the "store_search_clear_button" button

  @jira.QANOV-25027 @android @manual @ios @jira.cv.11.14 @mobile @moves @regression
  Scenario: A user can close the information card about a Movistar store in the map
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup_close_button" button
     Then the "map_store_information_popup" element is not on display
      And clicks on the "store_search_clear_button" button

  @jira.QANOV-25028 @android @manual @ios @jira.cv.11.14 @jira.link.detects.DBD-175 @mobile @moves
  @smoke
  Scenario: A user can start the store appointment booking flow from the map
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
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

  @jira.QANOV-25029 @android @manual @ios @jira.cv.11.14 @mobile @moves @regression
  Scenario: A user can start the store appointment booking flow from the Movistar stores list
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And clicks on the "stores_list_tab" tab
      And the "stores_list" list is displayed
      And clicks on the "appointment_booking_button" button of "stores_list" list with "0" index
     Then the "Store Appointment Booking Service Selection" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "Selecciona el servicio que necesitas" text is displayed
      And the "appointment_booking_services" list is displayed

  @jira.<jira_id> @android @manual @ios @jira.cv.<cv> @jira.link.parent_test_plan.<test_plan> @mobile
  @moves @smoke
  Scenario Outline: A user can select a service for the store appointment booking
    Given
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And clicks on the "stores_list_tab" tab
      And the "stores_list" list is displayed
      And clicks on the "appointment_booking_button" button of "stores_list" list with "0" index
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "<index>" element in the "appointment_booking_services" list
     Then the "Store Appointment Booking Date Selection" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "¿Cuándo quieres reservar tu cita?" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Escoge la hora que prefieras" text is displayed
      And the "calendar_input" inputtext is displayed

    Examples:
          | index | cv    | test_plan    | jira_id      |
          | 0     | 11.14 |              | QANOV-25030  |
          | 1     | 11.14 |              | QANOV-25031  |
          | 2     | 11.14 |              | QANOV-25032  |
          | 3     | 11.14 |              | QANOV-25033  |
          | 2     | 14.3  | QANOV-292147 | QANOV-293581 |

  @jira.QANOV-25034 @android @manual @ios @jira.cv.11.14 @mobile @moves @regression
  Scenario: A user cannot continue with the appointment booking without selecting a slot
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And clicks on the "stores_list_tab" tab
      And the "stores_list" list is displayed
      And clicks on the "appointment_booking_button" button of "stores_list" list with "0" index
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
     Then the "next_button" webview element is disabled

  @jira.QANOV-84625 @android @automation.hard @jira.cv.12.3 @manual @mobile @moves @regression
  Scenario: A user cannot select any day in the calendar before tomorrow
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
     Then all days before "tomorrow" will be disabled in the "calendar_input" datepicker

  @jira.<jira_id> @automation.hard @ios @jira.cv.12.3 @manual @mobile @moves @regression
  Scenario Outline: A user will see an error when selecting any day in the calendar before tomorrow
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "<selected_day>" date in the "calendar_input" calendar
     Then the "Fecha no permitida" text is displayed under the "calendar_input" field

    Examples:
          | selected_day | jira_id     |
          | today        | QANOV-84626 |
          | yesterday    | QANOV-84627 |

  @jira.QANOV-34322 @android @manual @ios @jira.cv.11.14 @jira.link.detects.DBD-56 @mobile @moves
  @regression
  Scenario: A user cannot continue with the appointment booking when there is no free slot
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And clicks on the "stores_list_tab" tab
      And the "stores_list" list is displayed
      And clicks on the "appointment_booking_button" button of "stores_list" list with "0" index
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date more than two months from today in the appointments calendar
     Then the "error_message_title" textfield with "No hay citas disponibles para esta fecha" text is displayed
      And the "error_message_subtitle" textfield with "Lo sentimos, no quedan horas disponibles. Por favor, selecciona otro día." text is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.14 @jira.link.detects.DBD-137 @jira.link.detects.SUBO-5213
  @jira.link.detects.SUBO-5408 @manual @mobile @moves @regression
  Scenario Outline: A user without contact information can select a date and a slot to the store appointment
    Given user is in the "Store Appointment Booking" page
      And the user has not provided contact info to Movistar
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on calendar icon in the "calendar_input" datepicker
      And clicks on "any" date in the "calendar_input" calendar
      And clicks in "any" slot in the checkbox with the "<daytime>" available slots for the Movistar store
      And clicks on the "next" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "reamining_time.clock_icon" icon is displayed
      And the "remaining time.text" textfield with "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "name_input" inputtext with the "Nombre" placeholder is displayed
      And the "surname_input" inputtext with the "Apellidos" placeholder is displayed
      And the "email_input" inputtext with the "Email" placeholder is displayed
      And the "phone_number_input" inputtext with the "Número de teléfono" placeholder is displayed
      And the "more_info_input" inputtext with the "Cuentanos más sobre tu visita" placeholder is displayed
      And the "more_info_input.optional_text" textfield with "Campo opcional" text is displayed
      And the "legal_terms_check" checkbox with "He leído y acepto los Términos legales" text is displayed
      And the "legal_terms_link" link with "Términos legales" text is displayed
      And the "next" button with "Siguiente" text is displayed

    Examples:
          | daytime   | jira_id     |
          | morning   | QANOV-25035 |
          | afternoon | QANOV-25036 |

  @jira.<jira_id> @android @manual @ios @jira.cv.11.14 @jira.link.detects.DBD-137 @jira.link.detects.DBD-61
  @jira.link.detects.SUBO-5213 @jira.link.detects.SUBO-5306 @jira.link.parent_test_plan.QANOV-67582 @mobile @moves
  @smoke
  Scenario Outline: A user with contact information can select a date and a slot to the store appointment
    internal_checkpoint="Contact info indicated in the test case for user FIC065891F in NEXT/PROD"
    Given user has the "email" contact methods
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "<daytime>" available slot for the Movistar store
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
      And the "email_input" inputtext with "[CONTEXT:contact_method_email]" text is displayed
      And the "phone_number_input" inputtext is displayed
      And the "more_info_input" inputtext is displayed
      And the "more_info_placeholder" textfield with "Cuéntanos más sobre tu visita" text is displayed
      And the "more_info_optional_placeholder" textfield with " (opcional)" text is displayed
      And the "legal_terms_check" checkbox is displayed
      And the "legal_terms_text" textfield with "He leído y acepto los Términos legales" text is displayed
      And the "legal_terms_link" link with "Términos legales" text is displayed
      And the "next_button" button with "Siguiente" text is displayed

    Examples:
          | daytime   | jira_id     |
          | morning   | QANOV-34323 |
          | afternoon | QANOV-34324 |

  @jira.QANOV-224243 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user with an "email" contact method won't see the comercial communications checkbox
    Given user has the "email" contact method set in the application
      And user has a "admin" role
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "morning" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
     Then the "email_input" inputtext is displayed
      And the "email_input" inputtext is not empty
      And the "phone_number_input" inputtext is displayed
      And the "phone_number_input" inputtext is not empty
      And the "commercial_communications_label" textfield is not displayed
      And the "commercial_communications_check" checkbox is not displayed

  @jira.QANOV-224244 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT user without an "email" contact method won't see the comercial communications checkbox
    Given user has not the "email" contact method set in the application
      And user has a "admin-light" role
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "morning" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
     Then the "commercial_communications_label" textfield is not displayed
      And the "commercial_communications_check" checkbox is not displayed

  @jira.QANOV-224245 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT user with an "email" contact method edits the email: won't see the comercial communications checkbox
    Given user has the "email" contact method set in the application
      And user has a "admin-light" role
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "morning" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "email_input" inputtext with the "systemtestnovum@gmail.com" text
     Then the "email_input" inputtext is displayed
      And the "email_input" inputtext is not empty
      And the "phone_number_input" inputtext is displayed
      And the "phone_number_input" inputtext is not empty
      And the "commercial_communications_label" textfield is not displayed
      And the "commercial_communications_check" checkbox is not displayed

  @jira.QANOV-224246 @TBD @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user without the "email" contact method won't see any text in the "email_input" inputfield and the comercial communications checkbox is displayed
    Given user has not the "email" contact method set in the application
      And user has a "admin" role
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "morning" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
     Then the "email_input" inputtext is displayed
      And the "email_input" inputtext is empty
      And the "phone_number_input" inputtext is displayed
      And the "phone_number_input" inputtext is empty
      And the "commercial_communications_label" textfield with "Acepto el uso de este email para el envío de comunicaciones relacionadas con mi contrato" text is displayed
      And the "commercial_communications_check" checkbox is displayed
      And the "commercial_communications_check" checkbox is not checked

  @jira.QANOV-224247 @TBD @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @manual @mobile @moves @regression
  Scenario: ADMIN user with an "email" contact method edits the email: comercial communications checkbox is displayed
    Given user has the "email" contact method set in the application
      And user has a "admin" role
      And user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "morning" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "email_input" inputtext with the "systemtestnovum@gmail.com" text
     Then the "commercial_communications_label" textfield with "Acepto el uso de este email para el envío de comunicaciones relacionadas con mi contrato" text is displayed
      And the "commercial_communications_check" checkbox is displayed
      And the "commercial_communications_check" checkbox is not checked

  @jira.<jira_id> @<client> @manual @jira.cv.11.14 @jira.link.detects.DBD-174 @jira.link.detects.SUBO-5209
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @regression
  Scenario Outline: A user can see the legal terms for the store appointment contact information provided
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
          | android | ACEPTAR TÉRMINOS LEGALES | CANCELAR      | QANOV-25037 |
          | ios     | Aceptar términos legales | Cancelar      | QANOV-36679 |

  @jira.QANOV-25038 @android @manual @ios @jira.cv.11.14 @mobile @moves @regression
  Scenario: A user can accept the legal terms for the store appointment contact information provided
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_link" link
      And the "Store Appointment Booking Legal Terms" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "legal_terms_check" checkbox is checked

  @jira.QANOV-36680 @android @manual @ios @jira.cv.11.14 @mobile @moves @regression
  Scenario: A user can cancel to accept the legal terms for the store appointment contact information provided
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And clicks on the "legal_terms_link" link
      And the "Store Appointment Booking Legal Terms" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Store Appointment Booking Contact Info" page is displayed
      And the "legal_terms_check" checkbox is not checked

  @jira.<jira_id> @<client> @manual @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-214805 @mobile
  @moves @regression
  Scenario Outline: A user can not continue with the appointment booking without filling the mandatory contact information
    Automated only in Android because the inputtext clearing is not working on iOS (NOV-232297)
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And the "email_error" textfield with "Este campo es obligatorio" text is displayed
      And the "phone_number_error" textfield with "Este campo es obligatorio" text is displayed

    Examples:
          | client  | jira_id      |
          | android | QANOV-67886  |
          | ios     | QANOV-235676 |

  @jira.<jira_id> @android @ios @jira.link.parent_test_plan.QANOV-214805 @mobile @moves @regression
  Scenario Outline: A user can not continue with the appointment booking with wrong email
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "email_input" inputtext with the "<wrong_email>" text
      And clicks on the "next_button" button
     Then the "email_error" textfield with "Email incorrecto" text is displayed

    @manual @jira.cv.11.14
    Examples:
          | wrong_email | jira_id     |
          | a           | QANOV-25040 |
          | a@          | QANOV-25041 |
          | @gmail.com  | QANOV-25042 |
          | gmail.com   | QANOV-25043 |

    @jira.cv.13.5 @manual
    Examples:
          | wrong_email                          | jira_id      |
          | 988156278@no_existe_este_mail123.com | QANOV-224248 |

  @jira.QANOV-77294 @android @manual @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-214805 @mobile
  @moves @regression
  Scenario: A user can not continue with the appointment booking without accepting the legal terms
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next_button" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next_button" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the "next_button" button
     Then the "legal_terms_error" textfield with "Este campo es obligatorio" text is displayed

  @jira.QANOV-25044 @android @automatic @ber @ios @jira.cv.11.14 @jira.link.detects.SUBO-5208
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @smoke @cert2 @live @next @qa @webapp
  Scenario: A user can see a summary of the store appointment
    Given user is in the "Store Appointment Booking" page
      And the "Store Appointment Booking" page is displayed
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And clicks on the "stores_list_tab" button
      And clicks on the "stores_list_first" button
      And clicks on the "book_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on any date in the appointments calendar
      And waits until the "next" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And scrolls to "legal_terms_check" button
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
     Then the "Store Appointment Booking Summary" page is displayed
      And the "close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "remaining_time_clock_icon" icon is displayed
      And the "remaining_time_text" textfield with the "Te quedan [0-5][0-9]:[0-5][0-9] min para finalizar la reserva" format is displayed
      And the "appointment_booking_title" textfield with "Resumen de tu cita" text is displayed
      And the "appointment_booking_subtitle" textfield with "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala." text is displayed
      And the "store_info_title" textfield with "Tienda" text is displayed
      And the "store_info_name" textfield is displayed
      And the "store_info_edit_link" button is displayed
      And the "appointment_service_title" textfield with "Motivo de la cita" text is displayed
      And the "appointment_service_service" textfield is displayed
      And the "appointment_service_edit_link" button is displayed
      And the "appointment_date_title" textfield with "Fecha de la cita" text is displayed
      And the "appointment_date_date" textfield is displayed
      And the "appointment_date_slot" textfield is displayed
      And the "appointment_date_edit_link" button is displayed
      And the "contact_info_title" textfield with "Datos personales" text is displayed
      And the "contact_info_name" textfield with "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]" text is displayed
      And the "contact_info_email_phone_number" textfield with "[CONF:appointment_booking.client_email] - [CONF:appointment_booking.client_phone_number]" text is displayed
      And the "contact_info_edit_link" button is displayed
      And the "confirm_button" button with "Confirmar" text is displayed

  @jira.QANOV-25045 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can modify the Movistar store from the store appointment summary screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "store_info.edit" link
      And the "Store Appointment Booking" page is displayed
      And clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location_modified]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location_modified]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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

  @jira.QANOV-25046 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can modify the appointment service from the store appointment summary screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "appointment_service.edit" link
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "3" element in the "appointment_booking_services" list
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

  @jira.QANOV-25047 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can modify the appointment date from the store appointment summary screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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

  @jira.QANOV-25048 @android @ios @jira.cv.11.14 @manual @mobile @moves @smoke
  Scenario: A user can modify the contact info from the store appointment summary screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "contact_info.edit" link
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name_modified]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname_modified]" text
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

  @jira.QANOV-25049 @android @automatic @ber @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-67582
  @jira.link.parent_test_plan.QANOV-96368 @mobile @moves @sanity @qa @webapp
  Scenario: A user can see the confirmation of the store appointment
    Mocks in QA are implemented to work with the 'tomorrow' day. This scenario is automated to run in QA environment picking tomorrow.
    Given user is in the "Store Appointment Booking" page
      And the "Store Appointment Booking" page is displayed
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And clicks on the "stores_list_tab" button
      And clicks on the "0" element in the "stores_list" list
      And clicks on the "book_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is displayed
      And clicks on tomorrow date in the appointments calendar
      And waits until the "next" element is visible
      And clicks on any "any" available slot for the Movistar store
      And clicks on the "next" button
      And the "Store Appointment Booking Contact Info" page is displayed
      And fills the "name_input" inputtext with the "[CONF:appointment_booking.client_name]" text
      And fills the "surname_input" inputtext with the "[CONF:appointment_booking.client_surname]" text
      And fills the "email_input" inputtext with the "[CONF:appointment_booking.client_email]" text
      And fills the "phone_number_input" inputtext with the "[CONF:appointment_booking.client_phone_number]" text
      And fills the "more_info_input" inputtext with the "Esto es una prueba de Novum" text
      And clicks on the enter key for the "more_info_input" inputtext
      And scrolls to "legal_terms_check" button
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm_button" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "close_button" button is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_subtitle" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield with the "\d{2}\/\d{2}\/\d{4} de \d{2}:\d{2} a \d{2}:\d{2}" format is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_map" map is displayed
      And the "store_address" textfield is displayed
      And the "store_phone_title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_number" textfield with the "\+\d{11}" format is displayed
      And the "store_phone_call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-131918 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can access to a webview with information about how to authorize another person to go to the store from the create appointment success screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "appointment_store_authorization_link" link
     Then the internal webview is displayed
      And the "Atención al cliente y Ayuda - Movistar" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Store Appointment Booking Success Feedback" page is displayed

  @jira.QANOV-131919 @android @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can call to the store phone number from the create appointment success screen in Android devices
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "store_phone_module.call_link" link
     Then the "dialer" app is displayed

  @jira.QANOV-131920 @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can see a popup to call to the store phone number from the create appointment success screen in iOS devices
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "store_phone_module.call_link" link
     Then the "Call Store" popup is displayed
      And the "popup.accept" button that contains the "Llamar" text is displayed
      And the "popup.cancel" button with "Cancelar" text is displayed

  @jira.QANOV-131921 @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can cancel to call to the store phone number from the create appointment success screen in iOS devices
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "store_phone_module.call_link" link
      And the "Call Store" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Store Appointment Booking Success Feedback" page is displayed

  @jira.QANOV-131922 @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can call to the store phone number from the create appointment success screen in iOS devices
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "store_phone_module.call_link" link
      And the "Call Store" popup is displayed
      And clicks on the "popup.accept" button
     Then the "dialer" app is displayed

  @jira.QANOV-131923 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @smoke
  Scenario: A user can access to the edit store appointment screen from the create appointment success screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
     Then the "Edit Store Appointment" page is displayed
      And the "Movistar" header is displayed
      And the "appointment_booking_title" textfield with "Resumen de tu cita" text is displayed
      And the "appointment_booking_subtitle" textfield with "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala." text is displayed
      And the "store_info" module is displayed
      And the "store_info.title" textfield with "Tienda" text is displayed
      And the "store_info.name" textfield is displayed
      And the "store_info.edit" link with "Editar" text is displayed
      And the "appointment_service" module is displayed
      And the "appointment_service.title" textfield with "Motivo de la cita" text is displayed
      And the "appointment_service.service" textfield is displayed
      And the "appointment_service.edit" link with "Editar" text is displayed
      And the "appointment_date" module is displayed
      And the "appointment_date.title" textfield with "Fecha de la cita" text is displayed
      And the "appointment_date.date" textfield is displayed
      And the "appointment_date.slot" textfield is displayed
      And the "appointment_date.edit" link with "Editar" text is displayed
      And the "contact_info" module is displayed
      And the "contact_info.title" textfield with "Datos personales" text is displayed
      And the "contact_info.name" textfield with "[CONF:appointment_booking.client_name] [CONF:appointment_booking.client_surname]" text is displayed
      And the "contact_info.email" textfield with "[CONF:appointment_booking.client_email]" text is displayed
      And the "contact_info.phone_number" textfield with "[CONF:appointment_booking.client_phone_number]" text is displayed
      And the "contact_info.edit" link with "Editar" text is displayed
      And the "confirm" button with "Confirmar" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  Scenario Outline: A <role> user can modify a store appointment from the create appointment success screen
    Tested only the flow to modify the store, that includes all the screens, the other flows will be tested in the appointment management feature, are the same flows
    The admin light and user roles edit flow will only be available here and in the email link, so we need to test all the roles
    Given user has a "<role>" role
      And user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "store_info.edit" link
      And the "Store Appointment Booking" page is displayed
      And clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location_modified]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location_modified]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "success_map_title" textfield with "Tienes una cita en" text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

    @smoke
    Examples:
          | role        | jira_id      |
          | admin-light | QANOV-131925 |
          | admin       | QANOV-131926 |

  @jira.QANOV-134095 @android @ios @jira.cv.12.5 @jira.link.detects.DBD-413 @jira.link.parent_test_plan.QANOV-96368
  @manual @mobile @moves @regression
  Scenario: A user can modify a store appointment from the edit appointment success screen
    Given user has a "admin" role
      And user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "store_info.edit" link
      And the "Store Appointment Booking" page is displayed
      And clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location_modified]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location_modified]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
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
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "success_map_title" textfield with "Tienes una cita en" text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-134096 @android @ios @jira.cv.12.5 @jira.link.detects.DBD-415 @jira.link.parent_test_plan.QANOV-96368
  @manual @mobile @moves @smoke
  Scenario: A user can cancel a store appointment from the edit appointment success screen
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
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
      And the "Edit Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment_link" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Store Appointment Booking Cancelled Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_cancelled_title" textfield with "Reserva cancelada" text is displayed
      And the "appointment_cancelled_subtitle" textfield with "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites." text is displayed
      And the "book_another_appointment" button with "Reservar otra cita" text is displayed

  @jira.<jira_id> @<client> @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario Outline: A user can see a confirmation popup before cancelling a store appointment in <client> devices
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment_link" link
     Then the "Store Appointment Cancel Confirmation" popup is displayed
      And the "popup.title" textfield with "Cancelar cita" text is displayed
      And the "popup.message" textfield with "¿Seguro que quieres cancelar la cita?" text is displayed
      And the "popup.accept" button with "<accept_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | accept_button | cancel_button | jira_id     |
          | android | CANCELAR CITA | VOLVER        | QANOV-25050 |
          | ios     | Cancelar cita | Volver        | QANOV-34862 |

  @jira.QANOV-25051 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user does not confirm the cancelation of a store appointment
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment_link" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Store Appointment Booking Success Feedback" page is displayed

  @jira.QANOV-25052 @android @manual @ios @jira.cv.11.14 @mobile @moves @smoke
  Scenario: A user can cancel a store appointment
    Mocks in QA are implemented to work with the 'tomorrow' day. This scenario is automated to run in QA environment picking tomorrow.
    Given user is in the "Store Appointment Booking" page
     When fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And clicks on the search key for the "store_search" inputtext
      And the "google_map" map is displayed
      And the "google_map.stores" list is displayed
      And clicks on the "0" element in the "google_map.stores" list
      And the "map_store_information_popup" element is on display
      And clicks on the "map_store_information_popup.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment_link" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Store Appointment Booking Cancelled Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_cancelled_title" textfield with "Reserva cancelada" text is displayed
      And the "appointment_cancelled_subtitle" textfield with "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites." text is displayed
      And the "book_another_appointment" button with "Reservar otra cita" text is displayed

  @jira.QANOV-25053 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can start a new appointment booking after cancelling an appointment
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment_link" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And the "Store Appointment Booking Cancelled Feedback" page is displayed
      And clicks on the "book_another_appointment" button
     Then the "Store Appointment Booking" page is displayed

  @jira.QANOV-25054 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can see a session expired error after waiting more than 5 minutes to complete the contact information
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And waits "301" seconds
     Then the "Store Appointment Booking Expired Session Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "expired_session_title" textfield with "Tu reserva ha expirado" text is displayed
      And the "expired_session_subtitle" textfield with "Lo sentimos, has tardado demasiado en introducir tus datos y la reserva ha expirado. Por favor, escoge otra hora." text is displayed
      And the "select_new_slot" button with "Seleccionar nueva hora" text is displayed

  @jira.QANOV-25055 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can see a session expired error after waiting more than 5 minutes to confirm the appointment booking
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And waits "301" seconds
     Then the "Store Appointment Booking Expired Session Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "expired_session_title" textfield with "Tu reserva ha expirado" text is displayed
      And the "expired_session_subtitle" textfield with "Lo sentimos, has tardado demasiado en introducir tus datos y la reserva ha expirado. Por favor, escoge otra hora." text is displayed
      And the "select_new_slot" button with "Seleccionar nueva hora" text is displayed

  @jira.QANOV-25056 @android @ios @jira.cv.11.14 @manual @mobile @moves @regression
  Scenario: A user can restart the appoint booking flow after the session expired
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And waits "301" seconds
      And the "Store Appointment Booking Expired Session Feedback" page is displayed
      And clicks on the "select_new_slot" button
     Then the "Store Appointment Booking Date Selection" page is displayed

  @jira.QANOV-131927 @android @ios @jira.cv.12.5 @jira.link.detects.DBD-410 @jira.link.parent_test_plan.QANOV-96368
  @manual @mobile @moves @regression
  Scenario: A user can see the confirmation of the store appointment accessing with the url with the store
    Given user opens the "[CONF:appointment_booking.web_url_with_store]" deeplink with the app in "killed" status
      And the "Store Appointment Booking Service Selection" page is displayed
     When clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "smartphone_insurance_check" checkbox
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
     Then the "Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva confirmada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed      And the "appointment_store_name" textfield is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield with "2. Recogida Dispositivo Incluido Fusión" text is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "smartphone" module is displayed
      And the "smartphone.icon" icon is displayed
      And the "smartphone.brand" textfield with "[CONF:appointment_booking.smartphone_brand]" text is displayed
      And the "smartphone.model" textfield with "[CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.storage" textfield with "[CONF:appointment_booking.smartphone_storage]" text is displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color]" text is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-131928 @android @ios @jira.cv.12.5 @jira.link.detects.DBD-408 @jira.link.parent_test_plan.QANOV-96368
  @manual @mobile @moves @regression
  Scenario: A user can modify the appointment store from the create appointment success screen accessing with the url with the store
    Given user opens the "[CONF:appointment_booking.web_url_with_store]" deeplink with the app in "killed" status
      And the "Store Appointment Booking Service Selection" page is displayed
     When clicks on the "2" element in the "appointment_booking_services" list
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm" button
      And the "Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "store_info.edit" link
      And the "Store Appointment Booking" page is displayed
      And clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_location_modified]" text
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location_modified]" is displayed
      And clicks on "any" Movistar store in the map
      And clicks on the "store_information.appointment_booking" button
      And the "Store Appointment Booking Service Selection" page is displayed
      And clicks on the "2" element in the "appointment_booking_services" list
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
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "success_map_title" textfield with "Tienes una cita en" text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_location_info" module is displayed
      And the "store_location_info.store_map" map is displayed
      And the "store_location_info.address" textfield is displayed
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_link" textfield with "Llamar" text is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-224249 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @no_automatable @regression
  Scenario: ADMIN user who changes the contact email and checks the comercial communications checkbox and clicks on the 'next_button' button can see the email modified in the personal data section in profile
    Given user is in the "Store Appointment Booking Contact Info" page
      And user has a "admin" role
     When fills the "email_input" inputtext with the "prueba_cambio_email@gmail.com" text
      And clicks on the "commercial_communications_check" checkbox
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Summary" page is displayed
      And the "crouton_message" textfield with "Tu email principal ha sido actualizado" text is displayed
      And goes to the "Email Contact" page
      And the "email_input_field" inputtext with "prueba_cambio_email@gmail.com" text is displayed

  @jira.QANOV-224250 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-214805
  @jira.link.parent_test_plan.QANOV-67582 @mobile @moves @no_automatable @regression
  Scenario: ADMIN user who changes the contact email and does not check the comercial communications checkbox and clicks on the 'next_button' button won't see the email modified in the personal data section in profile
    Given user is in the "Store Appointment Booking Contact Info" page
      And user has a "admin" role
     When fills the "email_input" inputtext with the "prueba_cambio_email@gmail.com" text
      And clicks on the "next_button" button
     Then the "Store Appointment Booking Summary" page is displayed
      And the "crouton_message" textfield is not displayed
      And goes to the "Email Contact" page
      And the "email_input_field" inputtext is displayed
      And the "email_input_field" inputtext does not have the "prueba_cambio_email@gmail.com" text

# -*- coding: utf-8 -*-
@jira.QANOV-96896
Feature: Appointment Management

  @jira.QANOV-322975 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: TELCO user without appointments (past nor pending) access to the My appointments page: Empty case is displayed
    Given user has a "telco" account type
      And user has "0" pending appointments
      And user has "0" past appointments
      And user is in the "My Appointments" page
     Then the "Mis citas en tienda" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "no_appointments_icon" icon is displayed
      And the "no_appointments_title_textfield" textfield with "No tienes citas en tienda" text is displayed
      And the "no_appointments_subtitle_textfield" textfield with "En esta página podrás gestionar tus próximas citas y consultar las citas pasadas" text is displayed
      And the "appointment_booking_button" button with "Pedir nueva cita" text is displayed

  @jira.QANOV-96901 @android @automatic @ber @cert2 @ios @jira.cv.12.5 @jira.link.detects.DBD-375
  @jira.link.detects.DBD-376 @jira.link.parent_test_plan.QANOV-293817 @jira.link.parent_test_plan.QANOV-96368 @live
  @mobile @moves @next @qa @smoke
  Scenario: A user with a pending appointment and no past appointments can access to the "Mis citas en tienda" screen
    Given user has a "admin" role
      And user has "1" pending appointments
      And user has "0" past appointments
      And user is in the "My Appointments" page
     Then the "Mis citas en tienda" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "next_appointments_title_textfield" textfield with "Próximas citas" text is displayed
      And the "next_appointments.list" list is displayed
      And the "next_appointments.list" list has "1" elements
      And each element in the "next_appointments.list" list has the "title" field
      And each element in the "next_appointments.list" list has the "pretitle" field
      And each element in the "next_appointments.list" list has the "appointment_slot_date_time" field
      And each element in the "next_appointments.list" list has the "link" field with "Cambiar cita" text
      And the "past_appointments_title_textfield" textfield is not displayed
      And the "past_appointments.list" list is not displayed
      And the "see_all_past_appointments_link" link is not displayed
      And the "appointment_booking_button" button with "Pedir nueva cita" text is displayed

  @jira.<jira_id> @android @manual @ios @jira.cv.12.5 @jira.link.detects.DBD-477
  @jira.link.parent_test_plan.QANOV-96368 @mobile @moves @qa @regression @jira.link.detects.IOS-8352
  Scenario Outline: A user with <number_pending_appointments> pending appointment/s and more than 2 past appointments can access to the "Mis citas en tienda" screen
    QA env users: qamoves-3 / qamoves-4
    Given user has a "admin" role
      And user has "<number_pending_appointments>" pending appointments
      And user has ">2" past appointments
      And user is in the "My Appointments" page
     Then the "Movistar" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "next_appointments_title_textfield" textfield with "Próximas citas" text is displayed
      And the "next_appointments_list" list is displayed
      And the "next_appointments_list" list has "<number_pending_appointments>" elements
      And each element in the "next_appointments_list" list has the "appointment_store_name" field
      And each element in the "next_appointments_list" list has the "appointment_service" field
      And each element in the "next_appointments_list" list has the "appointment_slot_time" field
      And each element in the "next_appointments_list" list has the "appointment_date" field
      And each element in the "next_appointments_list" list has the "manage_my_appointment_link" field with "Cambiar cita" text
      And the "past_appointments_title_textfield" textfield with "Citas pasadas" text is displayed
      And the "past_appointments_list" list is displayed
      And the "past_appointments_list" list has "2" elements
      And each element in the "past_appointments_list" list has the "appointment_store_name" field
      And each element in the "past_appointments_list" list has the "appointment_service" field
      And each element in the "past_appointments_list" list has the "appointment_date" field
      And the "see_all_past_appointments_link" link with "Ver todas mis citas pasadas" text is displayed
      And the "appointment_booking_button" button with "Pedir nueva cita" text is displayed

    Examples:
          | number_pending_appointments | jira_id     |
          | 1                           | QANOV-96902 |
          | 3                           | QANOV-96903 |

  @jira.QANOV-96904 @android @manual @cert2 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-96368 @live @mobile @moves @next @regression
  Scenario: A user with more than 2 past appointments and no pending appointments can access to the "Mis citas en tienda" screen
    Given user has a "admin" role
      And user has "0" pending appointments
      And user has ">2" past appointments
      And user is in the "My Appointments" page
     Then the "Movistar" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "next_appointments_title_textfield" textfield is not displayed
      And the "next_appointments_list" list is not displayed
      And the "past_appointments_title_textfield" textfield with "Citas pasadas" text is displayed
      And the "past_appointments_list" list is displayed
      And the "past_appointments_list" list has "2" elements
      And each element in the "past_appointments_list" list has the "appointment_store_name" field
      And each element in the "past_appointments_list" list has the "appointment_service" field
      And each element in the "past_appointments_list" list has the "appointment_date" field
      And the "see_all_past_appointments_link" link with "Ver todas mis citas pasadas" text is displayed
      And the "appointment_booking_button" button with "Pedir nueva cita" text is displayed

  @jira.<jira_id> @<test_priority> @android @automatic @ios @jira.cv.12.5 @jira.link.detects.DBD-405
  @jira.link.detects.MOVES-7891 @jira.link.parent_test_plan.QANOV-96368 @mobile @moves @qa
  Scenario Outline: A user with a pending appointment and <number_past_appointments> past appointments can access to the "Mis citas en tienda" screen
    QA env users: qamoves-6 / qamoves-7
    Given user has a "admin" role
      And user has "1" pending appointments
      And user has "<number_past_appointments>" past appointments
      And user is in the "My Appointments" page
     Then the "Mis citas en tienda" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "next_appointments_title_textfield" textfield with "Próximas citas" text is displayed
      And the "next_appointments.list" list is displayed
      And the "next_appointments.list" list has "1" elements
      And each element in the "next_appointments.list" list has the "title" field
      And each element in the "next_appointments.list" list has the "subtitle" field
      And each element in the "next_appointments.list" list has the "appointment_slot_date_time" field
      And each element in the "next_appointments.list" list has the "link" field with "Cambiar cita" text
      And the "past_appointments_title_textfield" textfield with "Citas pasadas" text is displayed
      And the "past_appointments.list" list is displayed
      And the "past_appointments.list" list has "<number_past_appointments>" elements
      And each element in the "past_appointments.list" list has the "title" field
      And each element in the "past_appointments.list" list has the "subtitle" field
      And each element in the "past_appointments.list" list has the "appointment_slot_date_time" field
      And the "see_all_past_appointments_link" link is not displayed
      And the "appointment_booking_button" button with "Pedir nueva cita" text is displayed

    Examples:
          | number_past_appointments | test_priority | jira_id     |
          | 1                        | sanity        | QANOV-96905 |
          | 2                        | smoke         | QANOV-96906 |

  @jira.<jira_id> @TBD @android @manual @ios @jira.cv.12.7 @jira.link.detects.DBD-392 @jira.link.detects.DBD-433
  @jira.link.parent_test_plan.QANOV-96368 @mobile @moves @qa @regression
  Scenario Outline: A user with more than two past appointments can see all the past appointments
    QA env users: qamoves-3 / qamoves-4
    Given user has a "admin" role
      And user has "<number_past_appointments>" past appointments
      And user is in the "My Appointments" page
     When clicks on the "see_all_past_appointments_link" link
     Then the "Past Appointments" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "past_appointments_title_textfield" textfield with "Citas pasadas" text is displayed
      And the "past_appointments_list" list is displayed
      And the "past_appointments_list" list has "<number_past_appointments>" elements
      And each element in the "past_appointments_list" list has the "appointment_store_name" field
      And each element in the "past_appointments_list" list has the "appointment_service" field
      And each element in the "past_appointments_list" list has the "appointment_slot_time" field
      And each element in the "past_appointments_list" list has the "appointment_date" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Appointments" page is displayed

    Examples:
          | number_past_appointments | jira_id     |
          | 3                        | QANOV-96907 |
          | 5                        | QANOV-96908 |

  @jira.QANOV-131913 @android @manual @cert2 @ios @jira.cv.12.5 @jira.link.detects.DBD-476
  @jira.link.parent_test_plan.QANOV-96368 @live @mobile @moves @next @qa @regression
  Scenario: A user can access to the appointment booking screen from the "My Appointments" screen
    Given user has a "admin" role
      And user has ">=0" pending appointments
      And user has ">0" past appointments
      And user is in the "My Appointments" page
     When clicks on the "appointment_booking_button" button
     Then the "Store Appointment Booking" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "Selecciona una tienda Movistar" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Introduce una dirección o comparte la actual para ver las tiendas cercanas." text is displayed
      And the "store_search_inputtext" inputtext is displayed
      And the "store_search_inputtext_placeholder" placeholder with "Introduce una dirección o CP…" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Appointments" page is displayed

  @jira.<jira_id> @<client> @automatic @ber @cert2 @jira.cv.12.5 @jira.link.detects.DBD-406 @jira.link.detects.DBD-474
  @jira.link.parent_test_plan.QANOV-96368 @live @mobile @moves @next @qa @smoke
  Scenario Outline: A user can see more information about a pending appointment in <client> devices
    Given user has a "admin" role
      And user has ">0" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "link" field of "next_appointments.list" list with "any" index
     Then the "Next Appointment Details" page is displayed
      And the "navigation_top_bar.<button>" button is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "appointment_store_authorization_link" link with "¿Puedo autorizar a alguien para que vaya en mi lugar?" text is displayed
      And the "store_map" map is displayed
      And the "store_address" textfield is displayed
      And the "store_phone_title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_number" textfield is displayed
      And the "store_phone_call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "My Appointments" page is displayed

    Examples:
          | client  | button       | jira_id      |
          | android | back_button  | QANOV-96909  |
          | ios     | close_button | QANOV-207678 |

  @jira.QANOV-109280 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can see a webview with information about what should bring to the store
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "appointment_store_authorization_link" link
     Then the internal webview is displayed
      And the "Atención al cliente y Ayuda - Movistar" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Next Appointment Details" page is displayed

  @jira.QANOV-109285 @android @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can call to the store phone number in Android devices
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "store_phone_module.call_icon" link
     Then the "dialer" app is displayed

  @jira.QANOV-131914 @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can see a popup to call to the store phone number in iOS devices
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "store_phone_module.call_icon" link
     Then the "Call Store" popup is displayed
      And the "popup.accept" button that contains the "Llamar" text is displayed
      And the "popup.cancel" button with "Cancelar" text is displayed

  @jira.QANOV-131915 @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can cancel to call to the store phone number in iOS devices
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "store_phone_module.call_icon" link
      And the "Call Store" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Next Appointment Details" page is displayed

  @jira.QANOV-131916 @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: A user can call to the store phone number in iOS devices
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "store_phone_module.call_icon" link
      And the "Call Store" popup is displayed
      And clicks on the "popup.accept" button
     Then the "dialer" app is displayed

  @jira.<jira_id> @<client> @manual @cert2 @jira.cv.12.5 @jira.link.detects.DBD-407
  @jira.link.parent_test_plan.QANOV-96368 @live @mobile @moves @next @qa @smoke
  Scenario Outline: A user can access to the screen to edit an appointment in <client> devices
    Given user has a "admin" role
      And user has ">0" pending appointments
      And user has "0" pending appointments with the device collection service
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
     Then the "Edit Store Appointment" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.<button>" button is displayed
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
      And the "contact_info.name" textfield is displayed
      And the "contact_info.email_phone_number" textfield is displayed
      And the "contact_info.edit_link" link that contains the "Editar" text is displayed
      And the "confirm_button" button with "Confirmar" text is displayed

    Examples:
          | client  | button       | jira_id      |
          | android | back_button  | QANOV-109286 |
          | ios     | close_button | QANOV-207679 |

  @jira.<jira_id> @<client> @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario Outline: A user can access to the screen to edit an appointment for device collection in <client> devices
    Given user has a "admin" role
      And user has "1" pending appointment with the "device_collection" service
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of the element with the "appointment_service" field with "2. Recogida Dispositivo Incluido Fusión" text in the "next_appointments_list" list
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
     Then the "Edit Store Appointment" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.<button>" button is displayed
      And the "appointment_booking_title" textfield with "Resumen de tu cita" text is displayed
      And the "appointment_booking_subtitle" textfield with "Te recordamos que la hora es orientativa. Revisa los datos de tu reserva y confírmala." text is displayed
      And the "store_info" module is displayed
      And the "store_info.title" textfield with "Tienda" text is displayed
      And the "store_info.name" textfield is displayed
      And the "store_info.edit" link with "Editar" text is displayed
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
      And the "smartphone" module is displayed
      And the "smartphone.title" textfield with "Smartphone" text is displayed
      And the "smartphone.brand" textfield with "[CONF:appointment_booking.smartphone_brand]" text is displayed
      And the "smartphone.model" textfield with "[CONF:appointment_booking.smartphone_model]" text is displayed
      And the "smartphone.storage" textfield with "[CONF:appointment_booking.smartphone_storage]" text is displayed
      And the "smartphone.color" textfield with "[CONF:appointment_booking.smartphone_color]" text is displayed
      And the "smartphone.edit" link with "Editar" text is displayed
      And the "confirm" button with "Confirmar" text is displayed

    Examples:
          | client  | button       | jira_id      |
          | android | back_button  | QANOV-109288 |
          | ios     | close_button | QANOV-207680 |

  @jira.QANOV-109289 @android @manual @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @mobile @moves @qa
  @regression
  Scenario: A user can modify the Movistar store from the edit store appointment screen
    Given user has a "admin" role
      And user has ">0" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "store_info.edit_link" link
      And the "Store Appointment Booking" page is displayed
      And fills the "store_search_inputtext" inputtext with the "[CONF:appointment_booking.search_location_modified]" text
      And clicks on the search key for the "store_search_inputtext" inputtext
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
      And clicks on the "legal_terms_check" checkbox
      And clicks on the "next_button" button
      And the "Store Appointment Booking Summary" page is displayed
      And clicks on the "confirm_button" button
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
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
      And clicks on the "navigation_top_bar.close_button" button
      And user is in the "My Appointments" page

  @jira.QANOV-109290 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can modify the appointment service from the edit store appointment screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
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
      And the "store_phone_module" module is displayed
      And the "store_phone_module.title" textfield with "Teléfono tienda" text is displayed
      And the "store_phone_module.phone_number" textfield is displayed
      And the "store_phone_module.call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-109291 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can modify the appointment date from the edit store appointment screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
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
      And the "store_phone_module.call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-109292 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can modify the contact info from the edit store appointment screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
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
      And the "store_phone_module.call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-109294 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can modify the choosen smartphone from the edit store appointment screen
    Given user has a "admin" role
      And user has "1" pending appointment with the "device_collection" service
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of the element with the "appointment_service" field with "2. Recogida Dispositivo Incluido Fusión" text in the "next_appointments_list" list
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
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
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "success_title" textfield with "Reserva editada" text is displayed
      And the "success_title" textfield with "Tienes una cita. Te enviaremos la información de tu reserva por email y SMS." text is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield with "2. Recogida Dispositivo Incluido Fusión" text is displayed
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
      And the "store_phone_module.call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-134093 @TBD @android @ios @jira.cv.12.5 @jira.link.detects.DBD-413 @jira.link.parent_test_plan.QANOV-96368
  @manual @mobile @moves @regression
  Scenario: A user can modify the appointment date from the edit store appointment success screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
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
      And the "store_phone_module.call_icon" icon is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-134094 @android @ios @jira.cv.12.5 @jira.link.detects.DBD-415 @jira.link.parent_test_plan.QANOV-96368
  @manual @mobile @moves @regression
  Scenario: A user can cancel a store appointment from the edit store appointment success screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
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
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Store Appointment Booking Cancelled Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_cancelled_title" textfield with "Reserva cancelada" text is displayed
      And the "appointment_cancelled_subtitle" textfield with "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites." text is displayed
      And the "book_another_appointment" button with "Reservar otra cita" text is displayed

  @jira.<jira_id> @<client> @manual @cert2 @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @live @mobile @moves
  @next @qa @smoke
  Scenario Outline: A user can can see a confirmation popup before cancelling a store appointment from the edit store appointment screen in <client> devices
    Given user has a "admin" role
      And user has ">0" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "cancel_appointment_link" link
     Then the "Store Appointment Cancel Confirmation" popup is displayed
      And the "popup.title" textfield with "Cancelar cita" text is displayed
      And the "popup.message" textfield with "¿Seguro que quieres cancelar la cita?" text is displayed
      And the "popup.accept" button with "<accept_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | accept_button | cancel_button | jira_id      |
          | android | CANCELAR CITA | VOLVER        | QANOV-109295 |
          | ios     | Cancelar cita | Volver        | QANOV-109296 |

  @jira.QANOV-109297 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user does not confirm the cancelation of a store appointment from the edit store appointment screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Next Appointment Details" page is displayed

  @jira.QANOV-109298 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @smoke
  Scenario: A user can cancel a store appointment from the edit store appointment screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Store Appointment Booking Cancelled Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_cancelled_title" textfield with "Reserva cancelada" text is displayed
      And the "appointment_cancelled_subtitle" textfield with "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites." text is displayed
      And the "book_another_appointment" button with "Reservar otra cita" text is displayed

  @jira.QANOV-109300 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can start a new appointment booking after cancelling an appointment from the edit store appointment screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And the "Store Appointment Booking Cancelled Feedback" page is displayed
      And clicks on the "book_another_appointment" button
     Then the "Store Appointment Booking" page is displayed

  @jira.QANOV-131917 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can access to the screen to edit an appointment from the edit store appointment success feedback screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user has "0" pending appointment with the "device_collection" service
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "confirm" button
      And the "Edit Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "edit_appointment_button" button
     Then the "Edit Store Appointment" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.back_button" button is displayed
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

  @jira.<jira_id> @<client> @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario Outline: A user can can see a confirmation popup before cancelling a store appointment from the edit store appointment success feedback screen in <client> devices
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "confirm" button
      And the "Edit Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment" link
     Then the "Store Appointment Cancel Confirmation" popup is displayed
      And the "popup.title" textfield with "Cancelar cita" text is displayed
      And the "popup.message" textfield with "¿Seguro que quieres cancelar la cita?" text is displayed
      And the "popup.accept" button with "<accept_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | accept_button | cancel_button | jira_id      |
          | android | CANCELAR CITA | VOLVER        | QANOV-109301 |
          | ios     | Cancelar cita | Volver        | QANOV-109302 |

  @jira.QANOV-109303 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user does not confirm the cancelation of a store appointment from the edit store appointment success feedback screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "confirm" button
      And the "Edit Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Edit Store Appointment Booking Success Feedback" page is displayed

  @jira.QANOV-109305 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can cancel a store appointment from the edit store appointment success feedback screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "confirm" button
      And the "Edit Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Store Appointment Booking Cancelled Feedback" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_cancelled_title" textfield with "Reserva cancelada" text is displayed
      And the "appointment_cancelled_subtitle" textfield with "Has cancelado tu cita. Recuerda que puedes concertar otra cita cuando lo necesites." text is displayed
      And the "book_another_appointment" button with "Reservar otra cita" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Next Appointment Details" page is displayed

  @jira.QANOV-109306 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves
  @regression
  Scenario: A user can start a new appointment booking after cancelling an appointment from the edit store appointment success feedback screen
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
      And the "Next Appointment Details" page is displayed
      And clicks on the "edit_appointment_button" button
      And the "Edit Store Appointment" page is displayed
      And clicks on the "confirm" button
      And the "Edit Store Appointment Booking Success Feedback" page is displayed
      And clicks on the "cancel_appointment" link
      And the "Store Appointment Cancel Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And the "Store Appointment Booking Cancelled Feedback" page is displayed
      And clicks on the "book_another_appointment" button
     Then the "Store Appointment Booking" page is displayed

  @jira.QANOV-322976 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-96368 @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT user cannot access to the Appointment management page
    Given user has a "admin" role
      And user has "any" pending appointments
      And user is in the "My Appointments" page
     When clicks on the "manage_my_appointment_link" field of "next_appointments_list" list with "0" index
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

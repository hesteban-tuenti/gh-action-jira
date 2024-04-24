# -*- coding: utf-8 -*-
@jira.QANOV-125951
Feature: Appointment Booking Errors


  @jira.QANOV-25023 @android @automation.pending_mock @ios @jira.cv.11.14 @jira.link.detects.SUBO-5322 @manual @mobile
  @moves @regression
  Scenario: A user cannot see the map of the nearest Movistar stores when a loading error occurs
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_wrong_location]" text
      And a loading error ocurrs
     Then the "map_tab" tab is selected
      And the "loading_error_title" textfield with "Algo ha salido mal" text is displayed
      And the "loading_error_subtitle" textfield with "Por favor, vuelve a intentarlo" text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-25024 @android @automation.pending_mock @ios @jira.cv.11.14 @jira.link.detects.SUBO-5322 @manual @mobile
  @moves @regression
  Scenario: A user cannot see the list of the nearest Movistar stores when a loading error occurs
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And fills the "store_search" inputtext with the "[CONF:appointment_booking.search_wrong_location]" text
      And a loading error ocurrs
      And clicks on the "stores_list_tab" tab
     Then the "stores_list_tab" tab is selected
      And the "loading_error_title" textfield with "Algo ha salido mal" text is displayed
      And the "loading_error_subtitle" textfield with "Por favor, vuelve a intentarlo" text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-25025 @android @automation.pending_mock @ios @jira.cv.11.14 @jira.link.detects.SUBO-5323 @manual @mobile
  @moves @regression
  Scenario: A user cannot share the location to see the nearest Movistar stores if a geolocation error ocurrs
    Given user is in the "Store Appointment Booking" page
     When clicks on the "store_search" inputtext
      And the "share_location" module is displayed
      And clicks on the "share_location" module
      And a geolocation error occurs
     Then the "error_message_title" textfield with "Lo sentimos, no logramos localizarte" text is displayed
      And the "error_message_subtitle" textfield with "Por favor, introduce una dirección en el buscador y selecciona una tienda." text is displayed

  @jira.QANOV-45491 @android @automation.pending_mock @ios @jira.cv.11.15 @manual @mobile @moves @regression
  Scenario: A user cannot continue with the appointment booking when an error occurs obtaining the free slots
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
      And clicks on "today" date in the "calendar_input" calendar
      And an error occurs obtaining the free slots
     Then the "error_message_title" textfield with "Algo ha ido mal" text is displayed
      And the "error_message_subtitle" textfield with "No se pueden cargar las citas disponibles." text is displayed
      And the "retry" button with "Reintentar" text is displayed

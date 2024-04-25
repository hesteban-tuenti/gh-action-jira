# -*- coding: utf-8 -*-
@jira.QANOV-306251
Feature: Appointment Booking Errors

  @jira.QANOV-36701 @web @jira.cv.11.14 @manual @moves @regression
  @automation.pending_mock
  Scenario: A user cannot see the nearest Movistar stores when a loading error occurs
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_wrong_location]"
      And I press the Enter key on "store_search" field
      And a loading error ocurrs
     Then the text of the element "loading_error_title" is equal to "Algo ha salido mal"
      And the text of the element "loading_error_subtitle" is equal to "Por favor, vuelve a intentarlo"
      And the text of the element "retry_button" is equal to "Reintentar"

  @jira.QANOV-36702 @web @jira.cv.11.14 @manual @moves @regression
  @automation.pending_mock
  Scenario: A user cannot share the location to see the nearest Movistar stores if a geolocation error ocurrs
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When I click on the "store_search" element
      And the "share_location" element is displayed
      And I click on the "share_location" element
      And a geolocation error occurs
     Then the text of the element "error_message_title" is equal to "Lo sentimos, no logramos localizarte"
      And the text of the element "error_message_subtitle" is equal to "Por favor, introduce una dirección en el buscador y selecciona una tienda."

  @jira.QANOV-45492 @web @jira.cv.11.15 @manual @moves @regression
  @automation.pending_mock
  Scenario: A user cannot continue with the appointment booking when an error occurs obtaining the free slots
    Given I go to "[CONF:appointment_booking.web_url]" web page
      And the "Store Appointment Booking" page is loaded
     When I click on the "store_search" element
      And I fill in the "store_search" field with "[CONF:appointment_booking.search_location]"
      And I press the Enter key
      And the map with the "<=3" nearest Movistar stores to "[CONF:appointment_booking.search_location]" is displayed
      And I click on "any" Movistar store in the map
      And I click on the "store_information.appointment_booking_button" button
      And the "Store Appointment Booking Service Selection" page is loaded
      And I click on the "2" element in the "appointment_booking_services" list
      And the "Store Appointment Booking Date Selection" page is loaded
      And I click on calendar icon in the "calendar_input" datepicker
      And I click on "today" date in the "calendar_input" calendar
      And an error occurs obtaining the free slots
     Then the text of the element "error_message_title" is equal to "Algo ha ido mal"
      And the text of the element "error_message_subtitle" is equal to "No se pueden cargar las citas disponibles."
      And the text of the element "retry_button" is equal to "Reintentar"

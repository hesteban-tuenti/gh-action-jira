# -*- coding: utf-8 -*-
@jira.QANOV-296668
Feature: Appointment reschedule module


  @jira.QANOV-296669 @android @automatic @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-295355 @mobile @moves @qa @smoke @webapp
  Scenario: A user with just one pending installation appointment can see a module in Start tab with the appointment info
    User: qamoves-05
    Given user has a "telco" account type
      And user has "1" pending installation appointment
      And user has "0" pending appointments
      And user is in the "Start" page
     When waits until the "appointments" element is visible
     Then the "appointments" module is displayed
      And the "appointments_section_title" textfield with "TUS PRÓXIMAS CITAS" text is displayed
      And the "appointments.carousel" list has "1" elements
      And each element in the "appointments.carousel" list has the "title" field with "Instalación" text
      And each element in the "appointments.carousel" list has the "product" field
      And each element in the "appointments.carousel" list has the "calendar_icon" field
      And each element in the "appointments.carousel" list has the "date" textfield with the "(\d\d\/\d\d\/\d\d de \d\d:\d\d a \d\d:\d\d)|(\d\d\/\d\d\/\d\d al \d\d\/\d\d\/\d\d)" format
      And each element in the "appointments.carousel" list has the "link" link with "Cambiar cita" text

  @jira.QANOV-426019 @android @automatic @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-295355 @mobile @moves @qa @smoke @webapp
  Scenario: A user with just one pending appointment can see a module in Start tab with the appointment info
    User: qamoves-02
    Given user has a "telco" account type
      And user has "1" pending appointments
      And user has "0" pending installation appointment
      And user is in the "Start" page
     When waits until the "appointments" element is visible
     Then the "appointments" module is displayed
      And the "appointments_section_title" textfield with "TUS PRÓXIMAS CITAS" text is displayed
      And the "appointments.carousel" list has "1" elements
      And each element in the "appointments.carousel" list has the "title" field
      And each element in the "appointments.carousel" list has the "product" field
      And each element in the "appointments.carousel" list has the "calendar_icon" field
      And each element in the "appointments.carousel" list has the "date" textfield with the "\d\d\/\d\d\/20\d\d \d\d:\d\d" format
      And each element in the "appointments.carousel" list has the "link" link with "Cambiar cita" text

  @jira.QANOV-296670 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @mobile @moves
  @qa @sanity @webapp
  Scenario: A user with >1 appointments can see a module in Start tab with all the appointments info
    User: qamoves-04
    Given user has a "telco" account type
      And user has ">0" pending installation appointment
      And user has ">0" pending appointments
      And user is in the "Start" page
     When waits until the "appointments" element is visible
     Then the "appointments" module is displayed
      And the "appointments_section_title" textfield with "TUS PRÓXIMAS CITAS" text is displayed
      And the "appointments.carousel" list has ">1" elements
      And each element in the "appointments.carousel" list has the "title" field
      And each element in the "appointments.carousel" list has the "product" field
      And each element in the "appointments.carousel" list has the "calendar_icon" field
      And each element in the "appointments.carousel" list has the "date" field
      And each element in the "appointments.carousel" list has the "link" link with "Cambiar cita" text

  @jira.<jira_id> @<client> @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @mobile @moves @qa @smoke
  Scenario Outline: A user with >1 pending appointment can swipe the installation appointment cards
    user: qamoves-04
    Given user has a "telco" account type
      And user has ">1" pending appointments
      And user is in the "Start" page
     When waits until the "appointments" element is visible
     Then the "appointments.carousel" list can be swiped

    @automatic
    Examples:
          | client  | jira_id      |
          | android | QANOV-296671 |

    @manual
    Examples:
          | client | jira_id      |
          | ios    | QANOV-617339 |

  @jira.QANOV-296672 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user with a installation appointment can access the OB webview to reschedule the appointment
    Given user has a "telco" account type
      And user has "1" pending installation appointment
      And user has "0" pending appointments
      And user is in the "Start" page
     When clicks on the "link" link of any element of the "appointments.carousel" list
     Then the browser webview with "Mis pedidos" text in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-296673 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user with a installation appointment can see the new appointment after rescheduling an installation
    Given user has a "telco" account type
      And user has "1" pending installation appointment
      And user has "0" pending appointments
      And user is in the "Start" page
     When clicks on the "link" link of any element of the "appointments.carousel" list
      And the browser webview is displayed
      And completes the flow to change the appointment date
      And the "Start" page is displayed
     Then the "pending_installation" card is updated with the new date

  @jira.QANOV-426020 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @mobile @moves
  @qa @smoke
  Scenario: A user with a pending appointment can access the "Next Appointment Details" page to reschedule the appointment
    User: qamoves-02
    Given user has a "telco" account type
      And user has "0" pending installation appointment
      And user has "1" pending appointments
      And user is in the "Start" page
     When waits until the "appointments" element is visible
      And clicks on the "link" link of any element of the "appointments.carousel" list
     Then the "Next Appointment Details" page is displayed
      And the "Movistar" header is displayed
      And the "appointment_store_name" textfield is displayed
      And the "appointment_service" textfield is displayed
      And the "appointment_slot_time" textfield is displayed
      And the "edit_appointment_button" button with "Editar cita" text is displayed
      And the "cancel_appointment_link" link with "Cancelar cita" text is displayed

  @jira.QANOV-296673 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user with a pending appointment can see the new appointment after rescheduling an installation
    Given user has a "telco" account type
      And user has "0" pending installation appointment
      And user has "1" pending appointments
      And user is in the "Start" page
     When clicks on the "link" link of any element of the "appointments.carousel" list
      And the "Next Appointment Details" page is displayed
      And the "Movistar" header is displayed
      And completes the flow to change the appointment date
      And the "Start" page is displayed
     Then the "pending_appointment" card is updated with the new date

  @jira.QANOV-296674 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user with pending appointment and an order on track can see both modules in the correct order
    Given user has a "telco" account type
      And user has ">0" pending appointments
      And user has ">0" orders on track
      And user is in the "Start" page
     Then the "order_tracking" module is under "appointments" module

  @jira.QANOV-296675 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user can no longer see the pending installation module once the appointment has taken place
    Given user has a "telco" account type
      And user has finished an appointment
      And user has "0" pending appointments
      And user is in the "Start" page
     Then the "appointments" module is not displayed

  @jira.QANOV-296676 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user can not see the installation appointment module if there are no appointments
    Given user has a "telco" account type
      And user has "0" pending appointments
      And user is in the "Start" page
     Then the "appointments" module is not displayed

  @jira.QANOV-296677 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-295355 @manual @mobile @moves
  @regression
  Scenario: A user can see an error if the installation appointment module does not load properly
    Given user has a "telco" account type
      And user has "0" pending appointments
      And there is an error retrieving the module
     Then the "appointments_error" module is displayed
      And the "pappointments_error.title" textfield with "Algo ha ido mal" text is displayed
      And the "appointments_error.icon" icon is displayed
      And the "appointments_error.body" textfield with "Tus próximas citas no se pueden mostrar." text is displayed

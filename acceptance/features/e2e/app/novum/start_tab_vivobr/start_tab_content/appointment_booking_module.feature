# -*- coding: utf-8 -*-
@jira.QANOV-97604
Feature: Appointment Booking module

  Actions Before each Scenario:
    Given user has the "appointment-booking" module configured in CMS for "start" page


  @jira.<jira_id> @<execution_mode> @<test_priority> @android @ios @jira.cv.<cv> @mobile @qa @vivobr @old_app
  Scenario Outline: A user with Start tab will see the appointment booking module
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "autodiagnostic_appointment_booking_section_title" textfield with "PODEMOS TE AJUDAR" text is displayed
      And the "autodiagnostic" module is displayed
      And the "appointment_booking" module is displayed
      And the "appointment_booking.image" image is displayed
      And the "appointment_booking.subtitle" textfield with "Precisa ir a uma loja?" text is displayed
      And the "appointment_booking.description" textfield with "Confira a loja mais próxima e agende sua visita rapidamente" text is displayed
      And the "appointment_booking.appointment_button" button with "Agendar atendimento" text is displayed

    Examples:
          | account_type | plans   | test_priority | execution_mode | cv   | jira_id      |
          | convergente  | 1       | smoke         | automatic      | 12.5 | QANOV-97605  |
          | multivivo    | 1       | regression    | automatic      | 12.5 | QANOV-97606  |
          | beatrix      | 1       | sanity        | automatic      | 12.5 | QANOV-97607  |
          | any          | several | smoke         | automatic      | 13.6 | QANOV-153057 |

  @jira.QANOV-117492 @android @automatic @ios @jira.cv.12.5 @mobile @qa @regression @vivobr @old_app
  Scenario: A user with Start tab will see the appointment booking module
    Given user has any "legacy prepay;jeri prepay;control_n;jeri control" account types
      And user has "1" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
      And the "autodiagnostic" module is not displayed
      And the "appointment_booking" module is displayed
      And the "appointment_booking.image" image is displayed
      And the "appointment_booking.subtitle" textfield with "Precisa ir a uma loja?" text is displayed
      And the "appointment_booking.description" textfield with "Confira a loja mais próxima e agende sua visita rapidamente" text is displayed
      And the "appointment_booking.appointment_button" button with "Agendar atendimento" text is displayed

  @jira.<jira_id> @<execution_mode> @android @ios @jira.cv.<cv> @live @mobile @next @regression @vivobr @old_app
  Scenario Outline: A user with Start tab taps on the appointment booking button: the user will be redirected to the Agendamento em Loja
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "appointment_booking.appointment_button" button
     Then the internal webview with "Agendamento em Loja" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | account_type  | plans   | execution_mode | cv   | jira_id      |
          | convergente   | 1       | manual         | 12.5 | QANOV-97608  |
          | multivivo     | 1       | manual         | 12.5 | QANOV-97609  |
          | beatrix       | 1       | manual         | 12.5 | QANOV-97610  |
          | legacy prepay | 1       | manual         | 12.5 | QANOV-117493 |
          | jeri prepay   | 1       | manual         | 13.8 | QANOV-274590 |
          | jeri control  | 1       | manual         | 14.0 | QANOV-313087 |
          | control_n     | 1       | manual         | 14.0 | QANOV-313088 |
          | any           | several | manual         | 13.6 | QANOV-153058 |

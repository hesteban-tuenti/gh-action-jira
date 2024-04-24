# -*- coding: utf-8 -*-
@jira.QABP-164
Feature: Otp

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can login with OTP
    Login page is handled by OB.
    Given user is in the "Login" page
     When clicks on the "otp_login" button
      And the "Otp" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And fills "otac_edit_box" inputext with otac
      And clicks on the "continue" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-165 |

  @jira.<jira_id> @<product> @TBD @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user with an associated SIM in the device can log on the iOS app with PIN code from keyboard
    Login page is handled by OB.
    Given user has a "<product>" SIM in the device
      And user is in the "Login" page
     When clicks on the "otp_login" button
      And the "Otp" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the pin code is suggested by native keyboard
      And fills "otac_edit_box" inputext from keyboard suggestion
      And clicks on the "continue" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-166 |

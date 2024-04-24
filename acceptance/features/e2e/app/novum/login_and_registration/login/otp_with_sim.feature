# -*- coding: utf-8 -*-
@jira.QANOV-126295
Feature: OTP With SIM

  Actions Before each Scenario:
    Given user is logged out


  @jira.QANOV-38908 @android @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-38862 @jira.link.relates_to.NOV-175491
  @mobile @moves @no_automatable @sanity @har
  Scenario: A user with the sim in the device completes the mobile authentication successfully on android devices with Custom tabs
    Given user has a "store" version app installed
      And user has a "moves" SIM in the device
      And the device has no PIN/fingerprint registered
      And user is in the "Moves Credentials Login" browser webview is displayed
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-38909 @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-38862 @jira.link.relates_to.NOV-175492 @mobile
  @moves @no_automatable @sanity @har
  Scenario: A user with the sim in the device completes the mobile authentication successfully on iOS devices with Custom tabs
    Given user has a "moves" SIM in the device
      And the device has no PIN/fingerprint registered
      And user is in the "Moves Credentials Login" browser webview is displayed
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-25152 @android @impeded_mock @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-24947 @manual @mobile @smoke @vivobr @har
  Scenario: User with an associated SIM in the device and mobile coverage can log in the app on android devices
    Given user has a "store" version app installed
      And user has a "vivobr" SIM in the device
      And user is registered more than "60" seconds ago
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
     Then the "loading_carousel" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed
      And the landing tab page is displayed

  @jira.QANOV-25153 @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @smoke @vivobr @har
  Scenario: User with an associated SIM in the device and mobile coverage can log in the app using PIN code on iOS devices
    Given user has a "vivobr" SIM in the device
      And user is registered more than "60" seconds ago
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
     Then the "loading_carousel" page is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_second]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen.carousel_message_third]" text is displayed
      And the landing tab page is displayed

  @jira.QANOV-25155 @android @automation.pending_mock @impeded_mock @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @smoke @vivobr @har
  Scenario: User with an associated SIM in the device and mobile coverage can ask for a new PIN on android devices
    Given user has a "store" version app installed
      And user has a "vivobr" SIM in the device
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And sms pincode is not received
      And waits "61" seconds
      And clicks on the "new_pin_code" link
     Then sms with new pin code is received
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And the landing tab page is displayed

  @jira.QANOV-25156 @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @smoke @vivobr @har
  Scenario: User with an associated SIM in the device and mobile coverage can ask for a new PIN on iOS devices
    Given user has a "vivobr" SIM in the device
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And sms pincode is not received
      And waits "61" seconds
      And clicks on the "new_pin_code" link
     Then sms with new pin code is received
      And fills "otac_edit_box" inputext with otac
      And the landing tab page is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile @regression @har
  Scenario Outline: A user with an associated SIM in the device can log in the android app with PIN code
    Given the device has not a "FingerPrint" registered
      And user has set the cookies preferences
      And user has a "store" version app installed
      And user has a "<product>" SIM in the device
      And user is registered more than "60" seconds ago
     When clicks on the "start_now" button
      And the "<page> Login Credentials" page is displayed
      And clicks on the "login_with_otp_button" button
      And the "<page> Login Phone Number" page is displayed
      And fills the "phone_number_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "request_code_button" button
      And the "<page> Login SMS Code" page is displayed
      And fills the "sms_code_inputtext" inputtext with the SMS code
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv   | page   | jira_id      |
          | blaude  | 13.9 | Blaude | QANOV-230232 |
          | o2de    | 14.2 | O2de   | QANOV-230233 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile @regression @har
  Scenario Outline: A user with an associated SIM in the device can log in the iOS app with PIN code
    Given the device has not a "FingerPrint;FaceId" registered
      And user has set the cookies preferences
      And user has a "<product>" SIM in the device
      And user is registered more than "60" seconds ago
     When clicks on the "start_now" button
      And the "<page> Login Credentials" page is displayed
      And clicks on the "login_with_otp_button" button
      And the "<page> Login Phone Number" page is displayed
      And fills the "phone_number_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "request_code_button" button
      And the "<page> Login SMS Code" page is displayed
      And fills the "sms_code_inputtext" inputtext with the SMS code
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv   | page   | jira_id      |
          | blaude  | 13.9 | Blaude | QANOV-230234 |
          | o2de    | 14.2 | O2de   | QANOV-230235 |

  @jira.QANOV-453636 @android @ber @ios @jira.cv.Future @mobile @no_automatable @o2es @regression @har
  Scenario: A user with the sim in the device completes the mobile authentication successfully
    Given user has a "store" version app installed
      And user has a "o2es" SIM in the device
      And user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

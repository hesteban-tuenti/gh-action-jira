# -*- coding: utf-8 -*-
@jira.QANOV-215115
Feature: Call And SMS Configuration

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status


  @jira.QANOV-215116 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44456 @jira.link.detects.O2DE-1409
  @jira.link.detects.O2DE-3159 @manual @mobile @o2de @sanity @ber
  Scenario: A multisim user with several multicard SIMs in active status can access to the "Call And SMS Configuration" screen
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Only multicard sims in active status will be displayed in the "receive_calls" and "receive_sms_mms" modules.
    More than one SIM might receive calls at the same time. Only one SIM might receive SMS/MMS at the same time.
    User: 017623201255 / #NQT#tlfncD3
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.call_and_sms_configuration_entrypoint" entrypoint
     Then the "Call And SMS Configuration" page is displayed
      And the "Anruf- und SMS-Einstellungen" header is displayed
      And the "title" textfield with "Anruf- und SMS-Einstellungen" text is displayed
      And the "description" textfield with "Hier kannst du festlegen, welche Multicards bei einem eingehenden Anruf klingeln sollen und welche SIM-Karten SMS/MMS empfangen sollen." text is displayed
      And the "receive_call" module is displayed
      And the "receive_call.title" textfield with "Anrufe" text is displayed
      And the "receive_call.description" textfield with the "Wähle die Geräte aus, die bei einem eingehenden Anruf an die Rufnummer [\d,\ ]+ klingeln sollen." format is displayed
      And the "calls_sims_list" list is displayed
      And each element in the "calls_sims_list" list has the "sim_number" field
      And each element in the "calls_sims_list" list has the "sim_name" field
      And each element in the "calls_sims_list" list has the "sim_checkbox" field
      And the "receive_sms_mms" module is displayed
      And the "receive_sms_mms.title" textfield with "SMS/MMS" text is displayed
      And the "receive_sms_mms.description" textfield with the "Auf welcher SIM-Karte willst du SMS/MMS empfangen?" format is displayed
      And the "smsmms_sims_list" list is displayed
      And each element in the "smsmms_sims_list" list has the "sim_number" field
      And each element in the "smsmms_sims_list" list has the "sim_name" field
      And each element in the "smsmms_sims_list" list has the "sim_radiobutton" field
      And the "save_button" button with "Jetzt ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-215118 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215116 @manual @mobile @o2de @regression
  Scenario: A multisim user cannot update the "Call And SMS Configuration" service without making any change
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Call And SMS Configuration" page
     When clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.QANOV-215119 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215116 @manual @mobile @o2de @regression
  Scenario: A multisim user cannot update the "Call And SMS Configuration" service without selecting at least a SIM in the "receive_calls" module
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Call And SMS Configuration" page
     When unselects all the "sim_checkbox" checkboxes in the "calls_sims_list" list
      And clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Mindestens eine SIM muss Anrufe erhalten können" text is displayed

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.QANOV-215116 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user can tap on the back button after making a change in "Call And SMS Configuration" page: a popup is displayed on <client> device
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Call And SMS Configuration" page
     When clicks on a different sim in the "smsmms_sims_list" list
      And clicks on the <button> button
     Then the "Call And SMS Configuration Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | button                           | continue_button | cancel_button | jira_id      |
          | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-215120 |
          | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-215121 |

  @jira.QANOV-215122 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215120 @jira.link.depends_on.QANOV-215121
  @manual @mobile @o2de @regression
  Scenario: A multisim user decides to continue with the "Call And SMS Configuration" flow after seeing the cancellation popup
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Call And SMS Configuration Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Call And SMS Configuration" page is displayed

  @jira.QANOV-215123 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215120 @jira.link.depends_on.QANOV-215121
  @manual @mobile @o2de @regression
  Scenario: A multisim user decides to cancel the "Call And SMS Configuration" flow after seeing the cancellation popup
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Call And SMS Configuration Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Account" page is displayed

  @jira.QANOV-215124 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215116 @manual @mobile @o2de @smoke @ber
  Scenario: A multisim user can update the "Call And SMS Configuration" service
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user has the "Update Call And SMS Configuration Success Feedback" module configured in CMS for "Update Call And SMS Configuration Success Feedback" page
      And user is in the "Call And SMS Configuration" page
     When clicks on a different sim in the "smsmms_sims_list" list
      And clicks on the "save_button" button
     Then the "Update Call And SMS Configuration Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Vielen Dank. Deine Daten werden geändert." text is displayed
      And the "success_message" textfield with "Deine Anruf- und SMS-Einstellungen werden in unseren Systemen aktualisiert und Können jederzeit unter "Vertragsservices" erneut geändert werden." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215124 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user who updated the Calls & SMS configuration successfully can tap on the "<button_name>" button in the Success Feedback screen
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Update Call And SMS Configuration Success Feedback" module configured in CMS for "Update Call And SMS Configuration Success Feedback" page
      And user is in the "Update Call And SMS Configuration Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

    Examples:
          | button_name       | button_id                       | jira_id      |
          | Back to dashboard | back_to_dashboard_button        | QANOV-215125 |
          | Close             | navigation_top_bar.close_button | QANOV-215126 |

  @jira.QANOV-215127 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215116 @manual @mobile @o2de @regression
  Scenario: A multisim user wants to update the "Call And SMS Configuration" service but an error happens: request finished unsuccessfully
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user has the "Update Call And SMS Configuration Error Feedback" module configured in CMS for "Update Call And SMS Configuration Error Feedback" page
      And user is in the "Call And SMS Configuration" page
     When clicks on a different sim in the "smsmms_sims_list" list
      And clicks on the "save_button" button
      And there is an error updating the call and sms configuration
     Then the "Update Call And SMS Configuration Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send your request" text is displayed
      And the "error_message" textfield with "Please try again later." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215127 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user who updated the Calls & SMS configuration unsuccessfully can tap on the "<button_name>" button in the Error Feedback screen
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Update Call And SMS Configuration Error Feedback" module configured in CMS for "Update Call And SMS Configuration Error Feedback" page
      And user is in the "Update Call And SMS Configuration Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

    Examples:
          | button_name       | button_id                       | jira_id      |
          | Back to dashboard | back_to_dashboard_button        | QANOV-215128 |
          | Close             | navigation_top_bar.close_button | QANOV-215129 |

  @jira.QANOV-215130 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215127 @manual @mobile @o2de @regression
  Scenario: A multisim user who updated the Calls & SMS configuration unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has "several" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Update Call And SMS Configuration Error Feedback" module configured in CMS for "Update Call And SMS Configuration Error Feedback" page
      And user is in the "Update Call And SMS Configuration Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Call And SMS Configuration" page is displayed
      And the "Anruf- und SMS-Einstellungen" header is displayed

  @jira.QANOV-215131 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44456 @jira.link.detects.O2DE-1408 @manual
  @mobile @o2de @smoke
  Scenario: A multisim user with only one multicard SIM in active status can access to the "Call And SMS Configuration" screen
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Only multicard sims in active status will be displayed in the "receive_calls" and "receive_sms_mms" modules.
    Given user has "1" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.call_and_sms_configuration_entrypoint" entrypoint
     Then the "Call And SMS Configuration" page is displayed
      And the "Anruf- und SMS-Einstellungen" header is displayed
      And the "image" image is displayed
      And the "title" textfield with "Anruf- und SMS-Einstellungen" text is displayed
      And the "description" textfield with "Hier kannst du festlegen, welche Multicards Anrufe bzw. SMS/ MMS empfangen sollen, sobald du mehr als eine SIM aktiviert hast." text is displayed
      And the "request_new_sim_button" button with "Zusatz-SIM bestellen" text is displayed
      And the "receive_call" module is not displayed
      And the "receive_sms_mms" module is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-215134 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215131 @manual @mobile @o2de @regression
  Scenario: A multisim user with only one multicard SIM in active status can go to request a new SIM from the "Call And SMS Configuration" screen
    The complete "Add new SIM" flow is defined in the sim_addition.feature of the services_transactions folder.
    Given user has "1" SIMs of "multicard" type in "active" status
      And user has the matching subscription selected in the account
      And user has the "Call And SMS Configuration" module configured in CMS for "Call And SMS Configuration" page
      And user is in the "Call And SMS Configuration" page
     When clicks on the "request_new_sim_button" button
     Then the "Sim Addition Choose Services" page is displayed
      And the "Zusatz-SIM" header is displayed

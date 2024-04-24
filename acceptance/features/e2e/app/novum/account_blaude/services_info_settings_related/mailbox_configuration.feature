# -*- coding: utf-8 -*-
@jira.QANOV-215254
Feature: Mailbox Configuration

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account


  @jira.QANOV-215255 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202565
  @jira.link.detects.OBO2DE-106 @automatic @mobile @sanity @ber @cert3 @live @next @raitt_drop1 @webapp @qa
  Scenario: A postpay user can access to the "Mailbox Configuration" screen
    The current mailbox password is never displayed, so the form field is always empty when the user enters the flow.
    Given user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "mailbox_configuration_entrypoint" entrypoint
     Then the "Mailbox Configuration" page is displayed
      And the "Mailboxeinstellungen" header is displayed
      And the "header.title" textfield with "Mailbox Geheimzahl ändern" text is displayed
      And the "header.description" textfield with "Ändere hier deine Mailbox-Geheimzahl und präge dir diese ein. Du brauchst die Mailbox-Geheimzahl z.B., um vom Festnetz oder aus dem Ausland auf deine Mailbox zugreifen zu können." text is displayed
      And the "pin_inputtext" inputtext is displayed
      And the "pin_label" textfield with "Neue vierstellige PIN eingeben" text is displayed
      And the "save_button" button with "Änderung speichern" text is displayed

  @jira.QANOV-215257 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215255 @manual @mobile @regression
  Scenario: A postpay user cannot change the mailbox password without inserting a new password
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Mailbox Configuration" page
     When clicks on the "save_button" button
     Then the "pin_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-215258 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215255 @manual @mobile @regression
  Scenario: A postpay user cannot change the mailbox password without inserting a valid PIN
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Mailbox Configuration" page
     When fills the "pin_inputtext" inputtext with the "123" text
      And clicks on the "save_button" button
     Then the "pin_error_textfield" textfield with "Mailbox-Pin muss vier Ziffern haben." text is displayed

  @jira.QANOV-555222 @android @blaude @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-215255 @manual @mobile @regression
  Scenario: A postpay user cannot change the mailbox password if the PIN is too weak
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Mailbox Configuration" page
     When fills the "pin_inputtext" inputtext with the "1234" text
      And clicks on the "save_button" button
     Then the "pin_error_textfield" textfield with "Die PIN ist zu schwach." text is displayed

  @jira.<jira_id> @<client> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-215255 @jira.link.detects.O2DE-1633
  @manual @mobile @regression
  Scenario Outline: A postpay user can tap on the back button after making a change in "Mailbox Configuration" page: a popup is displayed on <client> devices
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Mailbox Configuration" page
     When fills the "pin_inputtext" inputtext with the "1937" text
      And clicks on the <button> button
     Then the "Mailbox Configuration Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | button                           | continue_button | cancel_button | jira_id      |
          | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-215259 |
          | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-215260 |

  @jira.QANOV-215261 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215259
  @jira.link.depends_on.QANOV-215260 @manual @mobile @regression
  Scenario: A postpay user decides to continue with the "Mailbox Configuration" flow after seeing the cancellation popup
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Mailbox Configuration Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Mailbox Configuration" page is displayed

  @jira.QANOV-215262 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215259
  @jira.link.depends_on.QANOV-215260 @manual @mobile @regression
  Scenario: A postpay user decides to cancel the "Mailbox Configuration" flow after seeing the cancellation popup
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user is in the "Mailbox Configuration Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Account" page is displayed

  @jira.QANOV-215263 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215255 @jira.link.detects.OBO2DE-95
  @automatic @mobile @smoke @ber @qa @raitt_drop1
  Scenario: A postpay user can change the mailbox password successfully
    This feedback screen won't be a MODAL screen, so it will not have a "close" button in the header.
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user has the "Mailbox Configuration Success Feedback" module configured in CMS for "Mailbox Configuration Success Feedback" page
      And user is in the "Mailbox Configuration" page
     When fills the "pin_inputtext" inputtext with the "1937" text
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank. Deine Einstellungen werden geändert." text is displayed
      And the "message" textfield with "Die Bearbeitung des Auftrags dauert in der Regel wenige Minuten." text is displayed
      And the "main_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-215264 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215263 @manual @mobile @regression
  Scenario: A postpay user who changed the mailbox password successfully can go back to the dashboard from the Success Feedback screen
    Given user has the "Mailbox Configuration Success Feedback" module configured in CMS for "Mailbox Configuration Success Feedback" pag
      And user is in the "Mailbox Configuration Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-215266 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215255 @manual @mobile @regression
  Scenario: A postpay user wants to change the mailbox password but an error happens: process finished unsuccessfully
    To simulate this error, you can insert the pin 6666 in DEV environment.
    Given user has the "Mailbox Configuration" module configured in CMS for "Mailbox Configuration" page
      And user has the "Mailbox Configuration Error Feedback" module configured in CMS for "Mailbox Configuration Error Feedback" pag
      And user is in the "Mailbox Configuration" page
     When fills the "pin_inputtext" inputtext with the "6954" text
      And clicks on the "save_button" button
      And there is an error updating the mailbox configuration
     Then the "Mailbox Configuration Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Ein allgemeiner Fehler ist aufgetreten." text is displayed
      And the "error_message" textfield with "Bitte versuchen es später noch einmal." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215267 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215266 @manual @mobile @regression
  Scenario: A postpay user who changed the mailbox password unsuccessfully can go back to the dashboard from the Error Feedback screen
    Given user has the "Mailbox Configuration Error Feedback" module configured in CMS for "Mailbox Configuration Error Feedback" pag
      And user is in the "Mailbox Configuration Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.<jira_id> @<client> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-215266 @manual @mobile @regression
  Scenario Outline: A postpay user who changed the mailbox password unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Mailbox Configuration Error Feedback" module configured in CMS for "Mailbox Configuration Error Feedback" pag
      And user is in the "Mailbox Configuration Error Feedback" page
     When clicks on the <button> button
     Then the "Mailbox Configuration" page is displayed
      And the "Mailboxeinstellungen" header is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-215268 |
          | ios     | "navigation_top_bar.back_button" | QANOV-215269 |

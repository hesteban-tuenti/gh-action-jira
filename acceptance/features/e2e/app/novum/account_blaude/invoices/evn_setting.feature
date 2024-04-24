# -*- coding: utf-8 -*-
@jira.QANOV-204721
Feature: EVN setting

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page


  @jira.QANOV-204722 @android @automatic @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204367 @mobile @qa
  @regression @webapp
  Scenario: Postpay user can see the "EVN" setting in the Bills screen when it's deactivated
    Given user has "evn" service in "deactivated" status
      And user is in the "Bills" page
     Then the "evn_entrypoint.title" textfield with "EVN Einstellungen" text is displayed
      And the "evn_entrypoint.subtitle" textfield is not displayed
      And the "evn_entrypoint.tag" textfield with "Deaktiviert" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204367 @manual @mobile @qa @regression
  @webapp
  Scenario Outline: Postpay user can see the "EVN" setting in the Bills screen when it's activated with <option> option
    Given user has "evn" service in "activated" status with "<option>" option
      And user is in the "Bills" page
     Then the "evn_entrypoint.title" textfield with "EVN Einstellungen" text is displayed
      And the "bills_settings.subtitle" textfield with "<description>" text is displayed
      And the "bills_settings.tag" textfield with "Aktiv" text is displayed

    Examples:
          | option                   | description                      | jira_id      |
          | display_complete_number  | Vollständige Rufnummer angezeigt | QANOV-204723 |
          | display_shortened_number | Gekürzte Rufnummer anzeigen      | QANOV-548913 |

  @jira.QANOV-204724 @android @automatic @ber @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204722
  @jira.link.detects.O2DE-3163 @mobile @qa @raitt_drop1 @sanity @webapp
  Scenario: Postpay user can access to the EVN setting when it is deactivated
    Given user has "evn" service in "deactivated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "Bills" page
     When clicks on the "evn_entrypoint" entrypoint
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed
      And the "title" textfield with "Einzelverbindungsnachweis beantragen" text is displayed
      And the "description" textfield with "Falls Du mehrere Rufnummern auf einer Rechnung besitzt, wird Dir der Einzelverbindungsnachweis (EVN) hinsichtlich aller dieser Rufnummern bereitgestellt" text is displayed
      And the "receive_evn_switch_title" textfield with "Einzelverbindungsnachweis erhalten" text is displayed
      And the "receive_evn_switch" switch is displayed
      And the "receive_evn_switch" switch is disabled
      And the "phone_numbers_display_format_title" module is not displayed
      And the "full_format_radiobutton" button is not displayed
      And the "abridged_format_radiobutton" button is not displayed
      And the "data_protection_info_1" textfield is not displayed
      And the "data_protection_info_2" textfield is not displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @live @manual @mobile @next
  @qa @raitt_drop1 @smoke @webapp
  Scenario Outline: Postpay user can access to the EVN setting when it's activated with <option> option
    Given user has "evn" service in "activated" status with "<option>" option
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "Bills" page
     When clicks on the "evn_entrypoint" entrypoint
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed
      And the "title" textfield with "Einzelverbindungsnachweis beantragen" text is displayed
      And the "description" textfield with "Falls Du mehrere Rufnummern auf einer Rechnung besitzt, wird Dir der Einzelverbindungsnachweis (EVN) hinsichtlich aller dieser Rufnummern bereitgestellt" text is displayed
      And the "receive_evn_switch_title" textfield with "Einzelverbindungsnachweis erhalten" text is displayed
      And the "receive_evn_switch" switch is displayed
      And the "receive_evn_switch" switch is enabled
      And the "phone_numbers_display_format_title" textfield with "RUFNUMMERN IM EVN WERDEN IN FOLGENDEM FORMAT ANGEZEIGT" text is displayed
      And the "full_format_radiobutton" button is displayed
      And the "full_format_radiobutton.title" textfield with "Vollständig" text is displayed
      And the "full_format_radiobutton.description" textfield with "Anzeige der vollständigen Rufnummer" text is displayed
      And the "abridged_format_radiobutton" button is displayed
      And the "abridged_format_radiobutton.title" textfield with "Gekürzt" text is displayed
      And the "abridged_format_radiobutton.description" textfield with "Letzte 3 Ziffern werden nicht angezeigt" text is displayed
      And the "full_format_radiobutton" button is selected
      And the "data_protection_info_1" textfield with "Mit der Anforderung des Einzelverbindungsnachweises bestätige ich, dass alle Personen, die diesen Anschluss bzw. diese Anschlüsse benutzen, bzw. benutzen werden, über die Auflistung der einzelnen Verbindungen informiert wurden bzw. informiert werden. Für betrieblich und behördlich genutzte Anschlüsse erkläre ich ferner, dass Betriebsrat oder Personalvertretung, sofern notwendig, entsprechend den gesetzlichen Vorschriften beteiligt wurde." text is displayed
      And the "data_protection_info_2" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Änderungen speichern" text is displayed

    Examples:
          | option                   | radio_button                | depends_on   | jira_id      |
          | display_complete_number  | full_format_radiobutton     | QANOV-204723 | QANOV-204725 |
          | display_shortened_number | abridged_format_radiobutton | QANOV-548913 | QANOV-548914 |

  @jira.QANOV-284834 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204725 @manual @mobile @regression
  Scenario: A postpay user with EVN activated can access to the data protection info from the "EVN settings" screen
    Given user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz bei Blau" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "EVN Settings" page is displayed

  @jira.QANOV-204726 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204724
  @jira.link.depends_on.QANOV-204725 @manual @mobile @regression
  Scenario: Postpay user cannot save the EVN setting if no changes are made
    Given user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.QANOV-204727 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204724 @manual @mobile @regression
  Scenario: Postpay user can enable the EVN setting
    Given user has "evn" service in "deactivated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
     Then the "receive_evn.switch" switch is enabled
      And the "phone_number_display" module is displayed
      And the "phone_number_display.title" textfield with "RUFNUMMERN IM EVN WERDEN IN FOLGENDEM FORMAT ANGEZEIGT" text is displayed
      And the "phone_number_display.complete_title" textfield with "Vollständig" text is displayed
      And the "phone_number_display.complete_label" textfield with "Anzeige der vollständingen Rufnummer" text is displayed
      And the "phone_number_display.complete_radiobutton" button is displayed
      And the "phone_number_display.complete_radiobutton" button is selected
      And the "phone_number_display.shortened_title" textfield with "Gekürzt" text is displayed
      And the "phone_number_display.shortened_label" textfield with "Letzte 3 Ziffern werden nicht angezeigt" text is displayed
      And the "phone_number_display.shortened_radiobutton" button is displayed
      And the "data_protection" module is displayed
      And the "data_protection_info1" textfield with "Mit der Anforderung des Einzelverbindungsnachweises bestätige ich, dass alle Personen, die diesen Anschluss bzw. diese Anschlüsse benutzen, bzw. benutzen werden, über die Auflistung der einzelnen Verbindungen informiert wurden bzw. informiert werden. Für betrieblich und behördlich genutzte Anschlüsse erkläre ich ferner, dass Betriebsrat oder Personalvertretung, sofern notwendig, entsprechend den gesetzlichen Vorschriften beteiligt wurde." text is displayed
      And the "data_protection_info2" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Änderungen speichern" text is displayed

  @jira.QANOV-204728 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204725 @manual @mobile @regression
  Scenario: Postpay user can disable the EVN setting
    Given user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
     Then the "receive_evn.switch" switch is disabled
      And the "phone_number_display" module is not displayed
      And the "data_protection" module is not displayed
      And the "save_button" button with "Änderungen speichern" text is displayed

  @jira.QANOV-204730 @android @automatic @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204728
  @jira.link.detects.O2DE-2783 @mobile @qa @raitt_drop1 @smoke
  Scenario: Postpay user can deactivate the EVN setting successfully
    Given user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "message" textfield with "Wir aktualisieren deine Einstellungen zum EVN in Kürze." text is displayed
      And the "main_button" button with "Zurück zu Rechnungen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.<jira_id> @android @automatic @<ber> @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204727
  @jira.link.detects.O2DE-2783 @mobile @qa @raitt_drop1 @smoke
  Scenario Outline: Postpay user can activate the EVN setting with <option> option successfully
    Given user has "evn" service in "deactivated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
      And clicks on the "<radio_button>" button
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "message" textfield with "Wir aktualisieren deine Einstellungen zum EVN in Kürze." text is displayed
      And the "main_button" button with "Zurück zu Rechnungen" text is displayed
      And clicks on the "main_button" button
      And the "Bills" page is displayed

    Examples:
          | option                   | radio_button                | ber | jira_id      |
          | display_complete_number  | full_format_radiobutton     | ber | QANOV-204729 |
          | display_shortened_number | abridged_format_radiobutton |     | QANOV-548915 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204729
  @jira.link.depends_on.QANOV-204730 @manual @mobile @regression
  Scenario Outline: A postpay user who is in the "EVN Success Feedback" screen can tap on the "<button_name>" button
    Given user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

    Examples:
          | button_name               | button_id                        | jira_id      |
          | Back to invoices settings | back_to_invoices_settings_button | QANOV-204731 |
          | Close                     | navigation_top_bar.close_button  | QANOV-204732 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: Postpay user tries to <user_action> the EVN setting but an error happens
    The user will see a red warning at the bottom of the screen the first 2 times that he/she tries to update the EVN
    setting without success. The third attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "evn" service in "<evn_status>" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
      And clicks on the "save_button" button
      And there is an error updating the EVN setting
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | user_action | evn_status  | depends_on   | jira_id      |
          | activate    | deactivated | QANOV-204727 | QANOV-204733 |
          | deactivate  | active      | QANOV-204728 | QANOV-204734 |

  @jira.QANOV-204735 @android @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-204733 @jira.link.depends_on.QANOV-204734
  @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to update the EVN setting without success
    Given user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
      And clicks on the "save_button" button
      And there is an error updating the EVN setting
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "EVN Settings" page is displayed
      And the "error_warning" warning is not displayed

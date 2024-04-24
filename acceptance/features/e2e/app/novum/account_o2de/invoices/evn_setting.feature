# -*- coding: utf-8 -*-
@jira.QANOV-204706
Feature: EVN setting

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page


  @jira.QANOV-204707 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126 @manual @mobile @o2de @regression
  Scenario: Postpay user can see the "EVN" setting in the Bills screen when it's deactivated
    Given user has "evn" service in "deactivated" status
      And user is in the "Bills" page
     Then the "evn_entrypoint.title" textfield with "EVN Einstellungen" text is displayed
      And the "evn_entrypoint.subtitle" textfield is not displayed
      And the "evn_entrypoint.tag" textfield with "Deaktiviert" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can see the "EVN" setting in the Bills screen when it's activated with <option> option
    Given user has "evn" service in "activated" status with "<option>" option
      And user is in the "Bills" page
     Then the "evn_entrypoint.title" textfield with "EVN Einstellungen" text is displayed
      And the "evn_entrypoint.subtitle" textfield with "<description>" text is displayed
      And the "evn_entrypoint.tag" textfield with "Aktiv" text is displayed

    Examples:
          | option                   | description                      | jira_id      |
          | display_complete_number  | Vollständige Rufnummer angezeigt | QANOV-204708 |
          | display_shortened_number | Gekürzte Rufnummer anzeigen      | QANOV-548916 |

  @jira.QANOV-204709 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204707 @jira.link.detects.O2DE-3163
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: Postpay user can access to the EVN setting when it is deactivated
    Given user has "evn" service in "deactivated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "Bills" page
     When clicks on the "evn_entrypoint" entrypoint
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed
      And the "title" textfield with "Einzelverbindungsnachweis beantragen" text is displayed
      And the "description" textfield with "Falls Du mehrere Rufnummern auf einer Rechnung besitzt, wird Dir der Einzelverbindungsnachweis (EVN) hinsichtlich aller dieser Rufnummern bereitgestellt" text is displayed
      And the "receive_evn.switch_name" textfield with "Einzelverbindungsnachweis erhalten" text is displayed
      And the "receive_evn.switch" switch is displayed
      And the "receive_evn.switch" switch is disabled
      And the "phone_number_display" module is not displayed
      And the "data_protection" module is not displayed
      And the "save_button" button with "Änderungen speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: Postpay user can access to the EVN setting when it's activated with <option> option
    Given user has "evn" service in "activated" status with "<option>" option
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "Bills" page
     When clicks on the "evn_entrypoint" entrypoint
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed
      And the "title" textfield with "Einzelverbindungsnachweis beantragen" text is displayed
      And the "description" textfield with "Falls Du mehrere Rufnummern auf einer Rechnung besitzt, wird Dir der Einzelverbindungsnachweis (EVN) hinsichtlich aller dieser Rufnummern bereitgestellt" text is displayed
      And the "receive_evn.switch_name" textfield with "Einzelverbindungsnachweis erhalten" text is displayed
      And the "receive_evn.switch" switch is displayed
      And the "receive_evn.switch" switch is enabled
      And the "phone_number_display" module is displayed
      And the "phone_number_display.title" textfield with "RUFNUMMERN IM EVN WERDEN IN FOLGENDEM FORMAT ANGEZEIGT" text is displayed
      And the "phone_number_display.complete_title" textfield with "Vollständig" text is displayed
      And the "phone_number_display.complete_label" textfield with "Anzeige der vollständingen Rufnummer" text is displayed
      And the "phone_number_display.complete_radiobutton" button is displayed
      And the "phone_number_display.shortened_title" textfield with "Gekürzt" text is displayed
      And the "phone_number_display.shortened_label" textfield with "Letzte 3 Ziffern werden nicht angezeigt" text is displayed
      And the "phone_number_display.shortened_radiobutton" button is displayed
      And the "<radio_button>" button is selected
      And the "data_protection" module is displayed
      And the "data_protection_info1" textfield with "Mit der Anforderung des Einzelverbindungsnachweises bestätige ich, dass alle Personen, die diesen Anschluss bzw. diese Anschlüsse benutzen, bzw. benutzen werden, über die Auflistung der einzelnen Verbindungen informiert wurden bzw. informiert werden. Für betrieblich und behördlich genutzte Anschlüsse erkläre ich ferner, dass Betriebsrat oder Personalvertretung, sofern notwendig, entsprechend den gesetzlichen Vorschriften beteiligt wurde." text is displayed
      And the "data_protection_info2" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Änderungen speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

    Examples:
          | option                   | radio_button          | depends_on   | jira_id      |
          | display_complete_number  | complete_radiobutton  | QANOV-204708 | QANOV-204710 |
          | display_shortened_number | shortened_radiobutton | QANOV-548916 | QANOV-548917 |

  @jira.QANOV-284835 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204710 @manual @mobile @o2de @regression
  Scenario: A postpay user with EVN activated can access to the data protection info from the "EVN settings" screen
    Given user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "EVN Settings" page is displayed

  @jira.QANOV-204711 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204709 @jira.link.depends_on.QANOV-204710
  @manual @mobile @o2de @regression
  Scenario: Postpay user cannot save the EVN setting if no changes are made
    Given user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.QANOV-204712 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204709 @manual @mobile @o2de @regression
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

  @jira.QANOV-204713 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204710 @manual @mobile @o2de @regression
  Scenario: Postpay user can disable the EVN setting
    Given user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
     Then the "receive_evn.switch" switch is disabled
      And the "phone_number_display" module is not displayed
      And the "data_protection" module is not displayed
      And the "save_button" button with "Änderungen speichern" text is displayed

  @jira.QANOV-204715 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204713
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can deactivate the EVN setting successfully
    Given user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
      And clicks on the "save_button" button
     Then the "EVN Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "success_message" textfield with "Wir aktualisieren deine Einstellungen zum EVN in Kürze." text is displayed
      And the "back_to_invoices_button" button with "Zurück zu Rechnungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @<ber> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204712
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: Postpay user can activate the EVN setting with <option> option successfully
    Given user has "evn" service in "deactivated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn.switch" switch
      And clicks on the "<radio_button>" button
      And clicks on the "save_button" button
     Then the "EVN Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "success_message" textfield with "Wir aktualisieren deine Einstellungen zum EVN in Kürze." text is displayed
      And the "back_to_invoices_button" button with "Zurück zu Rechnungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | option                   | radio_button          | ber | jira_id      |
          | display_complete_number  | complete_radiobutton  |     | QANOV-204714 |
          | display_shortened_number | shortened_radiobutton | ber | QANOV-548918 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204714 @jira.link.depends_on.QANOV-204715
  @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who is in the "EVN Success Feedback" screen can tap on the "<button_name>" button
    Given user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

    Examples:
          | button_name               | button_id                        | jira_id      |
          | Back to invoices settings | back_to_invoices_settings_button | QANOV-204716 |
          | Close                     | navigation_top_bar.close_button  | QANOV-204717 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
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
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen" text is displayed

    Examples:
          | user_action | evn_status  | depends_on   | jira_id      |
          | activate    | deactivated | QANOV-204712 | QANOV-204718 |
          | deactivate  | active      | QANOV-204713 | QANOV-204719 |

  @jira.QANOV-204720 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-204718 @jira.link.depends_on.QANOV-204719 @manual
  @mobile @o2de @regression
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

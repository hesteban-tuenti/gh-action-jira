# -*- coding: utf-8 -*-
@jira.QANOV-403506
Feature: EVN Configuration

  Actions Before each Scenario:
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status


  @jira.QANOV-543156 @android @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-403507 @jira.link.depends_on.QANOV-403508
  @manual @mobile @o2de @smoke
  Scenario: A BOX7 prepay user can access to the "EVN Settings" OB webview
    This flow needs api evolution as user-settings api does not work for prepays. Current temporal solution is for prepay
    users to be redirected to an ob webview instead of novum flow (which fails for prepays).
    Given user has a "box7" account type
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "evn_configuration_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Ecare Prepaid" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-403525 @TBD @android @blaude @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-403507
  @jira.link.depends_on.QANOV-403508 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @sanity
  Scenario: A RAITT prepay user can access to the "EVN Settings" OB webview
    OB webview: prod-raitt-b2c-blau-evn-cost-overview
    Given user has a "raitt" account type
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "evn_configuration_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-403507 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-171313
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A prepay user can see the "EVN setting" entrypoint when it's deactivated
    Given user has "evn" service in "deactivated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
     Then the "evn_configuration_tag" textfield with "Deaktiviert" text is displayed
      And the "evn_configuration_entrypoint" entrypoint with "EVN Einstellungen" text is displayed
      And the "evn_configuration_description" textfield is not displayed

  @jira.QANOV-403508 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-171313
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A prepay user can see the "EVN setting" entrypoint when it's activated
    Given user has "evn" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
     Then the "evn_configuration_tag" textfield is not displayed
      And the "evn_configuration_entrypoint" entrypoint with "EVN Einstellungen" text is displayed
      And the "evn_configuration_description" textfield with the "(Vollständige|Gekürzte) Rufnummer angezeigt" format is displayed

  @jira.QANOV-403509 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403507
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @smoke
  Scenario: A BOX7 prepay user can access to the "EVN Settings" screen when it's deactivated
    Given user has a "box7" account type
      And user has "evn" service in "deactivated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "evn_configuration_entrypoint" entrypoint
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed
      And the "title" textfield with "Einzelverbingungsnachweis beantragen" text is displayed
      And the "description" textfield with "Falls Du mehrere Rufnummern auf einer Rechnung besitzt, wird Dir der EVN hinsichtlich aller dieser Rufnummern bereitgestellt" text is displayed
      And the "receive_evn_switch_title" textfield with "Einzelverbindungsnachweis erhalten" text is displayed
      And the "receive_evn_switch" switch is displayed
      And the "receive_evn_switch" switch is disabled
      And the "phone_numbers_display_format_title" module is not displayed
      And the "full_format_radiobutton" button is not displayed
      And the "abridged_format_radiobutton" button is not displayed
      And the "data_protection_info_1" textfield is not displayed
      And the "data_protection_info_2" textfield is not displayed
      And the "save_button" button with "Änderungen speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-403510 @android @ber @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403508
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @sanity
  Scenario: A BOX7 prepay user can access to the "EVN Settings" screen when it's activated
    Given user has a "box7" account type
      And user has "evn" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "evn_configuration_entrypoint" entrypoint
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed
      And the "title" textfield with "Einzelverbingungsnachweis beantragen" text is displayed
      And the "description" textfield with "Falls Du mehrere Rufnummern auf einer Rechnung besitzt, wird Dir der EVN hinsichtlich aller dieser Rufnummern bereitgestellt" text is displayed
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
      And the "data_protection_info_1" textfield with "Mit der Anforderung des Einzelverbindungsnachweises bestätige ich, dass alle Personen, die diesen Anschluss bzw. diese Anschlüsse benutzen, bzw. benutzen werden, über die Auflistung der einzelnen Verbindungen informiert wurden bzw. informiert werden. Für betrieblich und behördlich genutzte Anschlüsse erkläre ich ferner, dass Betriebsrat oder Personalvertretung, sofern notwendig, entsprechend den gesetzlichen Vorschriften beteiligt wurde." text is displayed
      And the "data_protection_info_2" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Änderungen speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-403511 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403510
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user with EVN activated can access to the data protection info from the "EVN settings" screen
    Given user has a "box7" account type
      And user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz bei Blau" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "EVN Settings" page is displayed

  @jira.QANOV-403512 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403509
  @jira.link.depends_on.QANOV-403510 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user cannot save the EVN setting if no changes are made
    Given user has a "box7" account type
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.QANOV-403513 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403509
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user can enable the EVN setting
    Given user has a "box7" account type
      And user has "evn" service in "deactivated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
     Then the "receive_evn_switch" switch is enabled
      And the "phone_number_display_module" module is displayed
      And the "phone_numbers_display_format_title" textfield with "RUFNUMMERN IM EVN WERDEN IN FOLGENDEM FORMAT ANGEZEIGT" text is displayed
      And the "full_format_radiobutton.title" textfield with "Vollständig" text is displayed
      And the "full_format_radiobutton.description" textfield with "Anzeige der vollständingen Rufnummer" text is displayed
      And the "full_format_radiobutton" button is displayed
      And the "phone_number_display.complete_radiobutton" button is selected
      And the "abridged_format_radiobutton.title" textfield with "Gekürzt" text is displayed
      And the "abridged_format_radiobutton.description" textfield with "Letzte 3 Ziffern werden nicht angezeigt" text is displayed
      And the "abridged_format_radiobutton" button is displayed
      And the "data_protection_module" module is displayed
      And the "data_protection_info1" textfield with "Mit der Anforderung des Einzelverbindungsnachweises bestätige ich, dass alle Personen, die diesen Anschluss bzw. diese Anschlüsse benutzen, bzw. benutzen werden, über die Auflistung der einzelnen Verbindungen informiert wurden bzw. informiert werden. Für betrieblich und behördlich genutzte Anschlüsse erkläre ich ferner, dass Betriebsrat oder Personalvertretung, sofern notwendig, entsprechend den gesetzlichen Vorschriften beteiligt wurde." text is displayed
      And the "data_protection_info2" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button with "Änderungen speichern" text is displayed

  @jira.QANOV-403514 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403510
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user can disable the EVN setting
    Given user has a "box7" account type
      And user has "evn" service in "activated" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
     Then the "receive_evn_switch" switch is disabled
      And the "phone_number_display_module" module is not displayed
      And the "data_protection_module" module is not displayed
      And the "save_button" button with "Änderungen speichern" text is displayed

  @jira.<jira_id> @android @<ber> @blaude @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @smoke
  Scenario Outline: A BOX7 prepay user can <user_action> the EVN setting successfully
    Given user has a "box7" account type
      And user has "evn" service in "<evn_status>" status
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "message" textfield with "Wir aktualisieren deine Einstellungen zum EVN in Kürze." text is displayed
      And the "main_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" screen is displayed

    Examples:
          | user_action | evn_status  | depends_on   | ber | jira_id      |
          | activate    | deactivated | QANOV-403509 | ber | QANOV-403515 |
          | deactivate  | activated   | QANOV-403510 |     | QANOV-403516 |

  @jira.QANOV-403517 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403515
  @jira.link.depends_on.QANOV-403516 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user who is in the "EVN Success Feedback" screen can go back to the account dashboard
    Given user has a "box7" account type
      And user has the "EVN Success Feedback" module configured in CMS for "EVN Success Feedback" page
      And user is in the "EVN Success Feedback" page
     When clicks on the "main_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user tries to <user_action> the EVN setting but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to update the EVN
    setting without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "box7" account type
      And user has "evn" service in "<evn_status>" status
      And user has tried to update the EVN setting "0" times without success
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
      And clicks on the "save_button" button
      And there is an error updating the EVN setting
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | user_action | evn_status  | depends_on   | jira_id      |
          | activate    | deactivated | QANOV-403509 | QANOV-403518 |
          | deactivate  | active      | QANOV-403510 | QANOV-403519 |

  @jira.QANOV-403520 @android @blaude @jira.cv.Future @jira.link.depends_on.QANOV-403518
  @jira.link.depends_on.QANOV-403519 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user can close the error warning after trying to update the EVN setting without success on android devices
    Given user has a "box7" account type
      And user has tried to update the EVN setting "0" times without success
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
      And clicks on the "save_button" button
      And there is an error updating the EVN setting
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "EVN Settings" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-403521 @TBD @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403509
  @jira.link.depends_on.QANOV-403510 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user tries to update the EVN setting but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to update the EVN
    setting without success. The second attempt will redirect to a full screen error feedback.
    Given user has a "box7" account type
      And user has tried to update the EVN setting "1" times without success
      And user has the "EVN settings" module configured in CMS for "EVN Settings" page
      And user has the "EVN Settings Error Feedback" module configured in CMS for "EVN Settings Error Feedback" page
      And user is in the "EVN Settings" page
     When clicks on the "receive_evn_switch" switch
      And clicks on the "save_button" button
      And there is an error updating the EVN setting
     Then the "EVN Settings Error Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "TBD" text is displayed
      And the "message" textfield with "TBD" text is displayed
      And the "main_button" button with "Try again later" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-403522 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403521
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A BOX7 prepay user can go to the "EVN Settings" screen from the "EVN settings Error Feedback" screen
    Given user has a "box7" account type
      And user has the "EVN Settings Error Feedback" module configured in CMS for "EVN Settings Error Feedback" page
      And user is in the "EVN Settings Error Feedback" page
     When clicks on the "main_button" button
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-403521
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user can go to previous screen from the "EVN Settings Error Feedback" screen
    Given user has a "box7" account type
      And user has the "EVN Settings Error Feedback" module configured in CMS for "EVN Settings Error Feedback" page
      And user is in the "EVN Settings Error Feedback" page
     When clicks on the "<back_button>" button
     Then the "EVN Settings" page is displayed
      And the "EVN beantragen" header is displayed

    Examples:
          | client  | back_button                      | jira_id      |
          | ios     | "navigation_top_bar.back_button" | QANOV-403523 |
          | android | native "back"                    | QANOV-403524 |

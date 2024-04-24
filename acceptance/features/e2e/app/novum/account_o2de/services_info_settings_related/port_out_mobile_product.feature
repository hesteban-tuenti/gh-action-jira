# -*- coding: utf-8 -*-
@jira.QANOV-242914
Feature: Port out for mobile product

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has not the "SUBSCRIPTION_PHONE_NUMBER_OUT_PORTING" forbidden use case


  @jira.QANOV-267364 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44456 @manual @mobile @o2de @smoke
  Scenario: A prepay user who wants to port-out a line within this week can access to the "Port Out This Week Info" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Port Out This Week Info" module configured in CMS for "Port Out This Week Info" page
      And user is in the "Account" page
     When clicks on the "porting_entrypoint" entrypoint
     Then the "Port Out This Week Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Bevor es losgeht" text is displayed
      And the "description" textfield with "Im nachfolgenden Prozess kannst du deine Portierungserklärung (Freigabe deiner Rufnummer) beantragen." text is displayed
      And the "subtitle" textfield with "SO GEHT'S WEITER:" text is displayed
      And the "point1" textfield with "Du erhaltst eine Bestätigung, sobald die Freigabe deiner Rufnummer erfolgreich war. Ab dann kannst du eine Portierung deiner O2 Rufnummer bei deinem neuen Anbieter beauftragen." text is displayed
      And the "point2" textfield with "Erfolgt innerhalb von 30 Tagen keine Anfrage, wird die Freigabe deiner Rufnummer gelöscht und muss neu beauftragt werden." text is displayed
      And the "point3" textfield with "Sobald die Rufnummer zum neuen Anbieter übertragen wurde, wird der Vertrag mit einer neuen O2 Rufnummer weitergeführt und kann zu den bisherigen Konditionen genutzt werden." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-242915 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242879 @manual @mobile @o2de @smoke
  Scenario: A postpay user who wants to port-out a line can access to the "Port Out Choose When" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Porting Choose Type" module configured in CMS for "Porting Choose Type" page
      And user has the "Port Out Choose When" module configured in CMS for "Port Out Choose When" page
      And user is in the "Porting Choose Type" page
     When clicks on the "port_out_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port Out Choose When" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Wann soll die Rufnummernmitnahme durchgeführt werden?" text is displayed
      And the "this_week_option.name" textfield with "Sofortiger wechsel" text is displayed
      And the "this_week_option.radiobutton" button is displayed
      And the "end_of_contract_option.name" textfield with "Zum Vertragsende" text is displayed
      And the "end_of_contract_option.radiobutton" button is displayed
      And the "this_week_option.title" textfield with "SOFORTIGER WECHSEL" text is displayed
      And the "this_week_option.description" textfield with "Die Rufnummermitnahme erfolgt innerhalb von 8 Werktagen. Voraussetzung: die Freigabe der Rufnummer wurde beantragt (telefonisch oder schriftlich)." text is displayed
      And the "end_of_contract_option.title" textfield with "ZUM VERTRAGSENDE" text is displayed
      And the "end_of_contract_option.description" textfield with "Die Rufnummer wird übertragen, sobald der Vertrag beim alten Anbieter endet. Voraussetzung: Der Vertrag deines alten Anbieters wurde gekündigt und die Rufnummermitnahme beantragt." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242916 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242915 @manual @mobile @o2de @regression
  Scenario: A postpay user who wants to port-out a line within this week can access to the "Port Out This Week Info" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Choose When" module configured in CMS for "Port Out Choose When" page
      And user has the "Port Out This Week Info" module configured in CMS for "Port Out This Week Info" page
      And user is in the "Port Out Choose When" page
     When clicks on the "this_week_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port Out This Week Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Bevor es losgeht" text is displayed
      And the "description" textfield with "Im nachfolgenden Prozess kannst du deine Portierungserklärung (Freigabe deiner Rufnummer) beantragen." text is displayed
      And the "subtitle" textfield with "SO GEHT'S WEITER:" text is displayed
      And the "point1" textfield with "Du erhälst eine Bestätigung, sobald die Freigabe deiner Rufnummer erfolgreich war. Ab dann kannst du eine Portierung deiner O2 Rufnummer bei deinem neuen Anbieter beauftragen." text is displayed
      And the "point2" textfield with "Erfolgt innerhalb von 30 Tagen keine Anfrage, wird die Freigabe deiner Rufnummer gelöscht und muss neu beauftragt werden." text is displayed
      And the "point3" textfield with "Sobald die Rufnummer zum neuen Anbieter übertragen wurde, wird der Vertrag mit einer neuen O2 Rufnummer weitergeführt und kann zu den bisherigen Konditionen genutzt werden." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242917 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242915 @manual @mobile @o2de @regression
  Scenario: A postpay user who wants to port-out a line by the end of the contract term can access to the "Port Out End Contract Info" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Choose When" module configured in CMS for "Port Out Choose When" page
      And user has the "Port Out End Contract Info" module configured in CMS for "Port Out End Contract Info" page
      And user is in the "Port Out Choose When" page
     When clicks on the "end_of_contract_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port Out End Contract Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Rufnummernmitnahme zum Ende der Vertragslaufzeit" text is displayed
      And the "description" textfield with "Eine Portierungserklärung ist nicht notwendig. Es ist jedoch darauf zu achten, dass der Vertrag fristgerecht gekündigt wird." text is displayed
      And the "subtitle" textfield with "GUT ZU WISSEN:" text is displayed
      And the "point1" textfield with "Den Portierungssauftrag kannst du bei deinem neuen Anbieter ab 4 Monate vor und 90 Tage nach dem Vertragsende stellen." text is displayed
      And the "point2" textfield with "Du erhälst eine SMS/E-Mail mit dem Portierungsdatum ebenso wie die Bestätigung nach erfolgreicher Portierung." text is displayed
      And the "ok_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-254328 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242915 @manual @mobile @o2de @regression
  Scenario: A postpay user who wants to port-out a line by the end of the contract term can go back to the dashboard from the "Port Out End Contract Info" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Choose When" module configured in CMS for "Port Out Choose When" page
      And user has the "Port Out End Contract Info" module configured in CMS for "Port Out End Contract Info" page
      And user is in the "Port Out Choose When" page
     When clicks on the "end_of_contract_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port Out End Contract Info" page is displayed
      And clicks on the "ok_button" button
     Then the "Account" page is displayed

  @jira.QANOV-242918 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242916 @jira.link.depends_on.QANOV-267364
  @manual @mobile @o2de @smoke
  Scenario: A user who wants to port-out a line within this week can access to the "Port Out Check Info" screen
    The "birth date" info is optional, so that row will only be displayed for users who have this info in the OB systems.
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out This Week Info" module configured in CMS for "Port Out This Week Info" page
      And user has the "Port Out Check Info" module configured in CMS for "Port Out Check Info" page
      And user is in the "Port Out This Week Info" page
     When clicks on the "continue_button" button
     Then the "Port Out Check Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Überprüfe deine Daten" text is displayed
      And the "description" textfield with "Diese Infromationen benötigst du für die Rufnummernmitnahme zum anderen Anbieter." text is displayed
      And the "phone_number_title" textfield with "Rufnummer zur Mitnahme" text is displayed
      And the "phone_number_value" textfield is displayed
      And the "full_name_title" textfield with "Vor- und Nachname" text is displayed
      And the "full_name_value" textfield is displayed
      And the "birth_date_title" textfield with "Geburtsdatum" text is displayed
      And the "birth_date_value" textfield with the "\d{2}/\d{2}/\d{4}" format is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242919 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242918 @jira.link.detects.O2DE-1780 @manual
  @mobile @o2de @regression
  Scenario: A user who wants to port-out a line within this week can access to the data protection info from the "Port Out Check Info" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Check Info" module configured in CMS for "Port Out Check Info" page
      And user is in the "Port Out Check Info" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Check Info" page is displayed

  @jira.QANOV-242920 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242918 @manual @mobile @o2de @regression
  Scenario: A user who wants to port-out a line within this week can access to the "Port Out Declaration" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Check Info" module configured in CMS for "Port Out Check Info" page
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user is in the "Port Out Check Info" page
     When clicks on the "continue_button" button
     Then the "Port Out Declaration" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Portierungserklärung" text is displayed
      And the "description" textfield with the "Ich möchte meine O2-Rufnummer \+49\d+ freigeben, um diese zu einem anderen Anbieter mitzunehmen." format is displayed
      And the "subtitle" textfield with "GUT ZU WISSEN:" text is displayed
      And the "point1" textfield with "Der Vertrag wird bis zur Kündigung mit einer neuen O2 Nummer weitergeführt." text is displayed
      And the "point2" textfield with "Die Portierungserklärung ist nach Abschicken 30 Tage gültig." text is displayed
      And the "point3" textfield with the "Die Freigabe und Portierung deiner Rufnummer ist kostenlos." format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242921 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242920 @manual @mobile @o2de @sanity
  Scenario: A postpay user who wants to port-out a line within this week can access to the "Port Out Summary" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And user is in the "Port Out Declaration" page
     When clicks on the "continue_button" button
     Then the "Port Out Summary" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with the "Portierung der Rufnummer 49\d+" format is displayed
      And the "porting.title" textfield with "Kosten der Portierung (inkl. MwSt.)" text is displayed
      And the "porting.description" textfield with "Erscheint auf der nächsten Rechnung." text is displayed
      And the "porting.value" textfield with the "\d+,\d\d €" format is displayed
      And the "total.title" textfield with "Gesamtkosten (inkl. MwSt.)" text is displayed
      And the "total.value" textfield with the "\d+,\d\d €" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-267365 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242920 @manual @mobile @o2de @smoke
  Scenario: A prepay user with enough balance who wants to port-out a line within this week can access to the "Port Out Summary" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And user is in the "Port Out Declaration" page
     When clicks on the "continue_button" button
     Then the "Port Out Summary" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with the "Portierung der Rufnummer 49\d+" format is displayed
      And the "current_balance.title" textfield with "Aktuelles Guthhaben" text is displayed
      And the "current_balance.value" textfield with the "\d+,\d\d €" format is displayed
      And the "porting.title" textfield with "Kosten der Portierung (inkl. MwSt.)" text is displayed
      And the "porting.description" textfield with "Einmalige Servicekosten" text is displayed
      And the "porting.value" textfield with the "\d+,\d\d €" format is displayed
      And the "total.title" textfield with "Gesamtkosten (inkl. MwSt.)" text is displayed
      And the "total.value" textfield with the "\d+,\d\d €" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-267366 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242920 @manual @mobile @o2de @smoke
  Scenario: A prepay user without enough balance who wants to port-out a line within this week can access to the "Port Out Summary" screen
    It will be an alert with a title, a description and a "topup" button.
    The title configured in CMS for this alert should be "Guthaben aufladen".
    The description configured in CMS for this alert should be "Um diesen Service nutzen zu Können, du musst zunächst
    dein Guthaben aufladen.".
    The topup button will redirect to the Topup screen.
    No "close" button will be displayed for this alert.
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has not enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And user is in the "Port Out Declaration" page
     When clicks on the "continue_button" button
     Then the "Port Out Summary" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "alert" element is on display
      And the "alert.title" textfield with "[CONTEXT:preconfigured_alert.title]" text is displayed
      And the "alert.description" textfield with the "[CONTEXT:preconfigured_alert.description]" format is displayed
      And the "alert.topup_button" button with "Jetzt aufladen" text is displayed
      And the "alert.close_button" button is not displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with the "Portierung der Rufnummer 49\d+" format is displayed
      And the "current_balance.insufficient_balance_tag" textfield with "Wartet auf Aufladung" text is displayed
      And the "current_balance.title" textfield with "Aktuelles Guthhaben" text is displayed
      And the "current_balance.value" textfield with the "\d+,\d\d €" format is displayed
      And the "porting.title" textfield with "Kosten der Protierung (inkl. MwSt.)" text is displayed
      And the "porting.description" textfield with "Einmalige Servicekosten" text is displayed
      And the "porting.value" textfield with the "\d+,\d\d €" format is displayed
      And the "total.title" textfield with "Total (IVA incl.)" text is displayed
      And the "total.value" textfield with the "\d+,\d\d €" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-267367 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-267366 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance to port-out a line taps on the alert link in "Port Out Summary" screen: a popup is displayed
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has not enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And the "Alerts" module configured in CMS for "Port Out Summary" page has a "insufficient-balance-to-port-out" preconfigured provider
      And user is in the "Port Out Summary" page
     When clicks on the "alert.topup_button" button
     Then the "Go To Topup Confirmation" popup is displayed
      And the "popup.title" textfield with "Guthaben aufladen" text is displayed
      And the "popup.message" textfield with "Rufnummernmitnahme mit genügend Guthaben wiederholen." text is displayed
      And the "popup.accept" button with the "(ZUR AUFLADUNG|Zur aufladung)" format is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-267368 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-267367 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance to port-out a line cancels to topup during the Port Out flow
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has not enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And the "Alerts" module configured in CMS for "Port Out Summary" page has a "insufficient-balance-to-port-out" preconfigured provider
      And user is in the "Go To Topup Confirmation" popup
     When clicks on the "popup.cancel" button
     Then the "Port Out Summary" page is displayed

  @jira.QANOV-267369 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-267367 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance to port-out a line confirms to topup during the Port Out flow
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has not enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And the "Alerts" module configured in CMS for "Port Out Summary" page has a "insufficient-balance-to-port-out" preconfigured provider
      And user is in the "Go To Topup Confirmation" popup
     When clicks on the "popup.accept" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Port Out Summary" page is displayed

  @jira.QANOV-267370 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-267366 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance cannot access to the "Port Out Confirmation" screen
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has not enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And the "Alerts" module configured in CMS for "Port Out Summary" page has a "insufficient-balance-to-port-out" preconfigured provider
      And user is in the "Port Out Summary" popup
     When clicks on the "continue_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast nicht ausreichend Guthaben." text is displayed

  @jira.QANOV-267371 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-267370 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance can close the error warning
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has not enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Declaration" module configured in CMS for "Port Out Declaration" page
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And the "Alerts" module configured in CMS for "Port Out Summary" page has a "insufficient-balance-to-port-out" preconfigured provider
      And user is in the "Port Out Summary" popup
     When clicks on the "continue_button" button
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Port Out Summary" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-337904 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-242921 @manual @mobile @o2de @regression
  Scenario: A postpay user who wants to port-out a line within this week can access to the "Port Out Confirmation" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Summary" page
     When clicks on the "continue_button" button
     Then the "Port Out Confirmation" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with the "Über den Status deiner Portierung erhältst du eine E-Mail an deine aktuelle Kontakt E-Mail Adresse:" format is displayed
      And the "porting.title" textfield with "Kosten der Protierung (inkl. MwSt.)" text is displayed
      And the "porting.description" textfield with "Erscheint auf der nächsten Rechnung." text is displayed
      And the "porting.value" textfield with the "\d+,\d\d €" format is displayed
      And the "contact_email.value" textfield is displayed
      And the "contact_email.label" textfield is displayed
      And the "contact_email.chevron" icon is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-337905 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-267365 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance who wants to port-out a line within this week can access to the "Port Out Confirmation" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Summary" module configured in CMS for "Port Out Summary" page
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Summary" page
     When clicks on the "continue_button" button
     Then the "Port Out Confirmation" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with the "Über den Status deiner Portierung erhältst du eine E-Mail an deine aktuelle Kontakt E-Mail Adresse:" format is displayed
      And the "current_balance.title" textfield with "Aktuelles Guthhaben" text is displayed
      And the "current_balance.value" textfield with the "\d+,\d\d €" format is displayed
      And the "porting.title" textfield with "Kosten der Protierung (inkl. MwSt.)" text is displayed
      And the "porting.description" textfield with "Einmalige Servicekosten" text is displayed
      And the "porting.value" textfield with the "\d+,\d\d €" format is displayed
      And the "contact_email.value" textfield is displayed
      And the "contact_email.label" textfield is displayed
      And the "contact_email.chevron" icon is displayed
      And the "pay_now_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-268899 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-337904 @manual @mobile @o2de @regression
  Scenario: A postpay user with a verified contact email can see the "contact email" module in the "Port Out Confirmation" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has a "verified email" stored in the contact details
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     Then the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.label" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed

  @jira.QANOV-268900 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-337904 @jira.link.detects.O2DE-3192 @manual
  @mobile @o2de @regression
  Scenario: A postpay user with a not-verified contact email can see the "contact email" module in the "Port Out Confirmation" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has a "not verified email" stored in the contact details
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     Then the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed

  @jira.QANOV-268901 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-337904 @manual @mobile @o2de @regression
  Scenario: A postpay user without a contact email saved can see the "contact email" module in the "Port Out Confirmation" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has a "no email" stored in the contact details
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     Then the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed

  @jira.QANOV-268902 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-337905 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and with a verified contact email can see the "contact email" module in the "Port Out Confirmation" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has a "verified email" stored in the contact details
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     Then the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.label" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed

  @jira.QANOV-268903 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-337905 @jira.link.detects.O2DE-3192 @manual
  @mobile @o2de @regression
  Scenario: A prepay user with enough balance and with a not-verified contact email can see the "contact email" module in the "Port Out Confirmation" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has a "not verified email" stored in the contact details
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     Then the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed

  @jira.QANOV-268904 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-337905 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without a contact email saved can see the "contact email" module in the "Port Out Confirmation" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has a "no email" stored in the contact details
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     Then the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed

  @jira.<jira_id> @android @<ber> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-337904 @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user with a <email_status> contact email can port-out a line within this week successfully
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has a "<email_status> email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "continue_button" button
     Then the "Port Out Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Auftrag ist eingegangen." text is displayed
      And the "success_message" textfield with "Du erhälst eine Bestätigungs-SMS/E-Mail, sobald deine Rufnummer freigegeben wurde." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | email_status | ber | jira_id      |
          | active       | ber | QANOV-242923 |
          | not verified |     | QANOV-268907 |

  @jira.<jira_id> @android @<ber> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-337905 @manual @mobile @o2de @smoke
  Scenario Outline: A prepay user with enough balance and a <email_status> contact email can port-out a line within this week successfully
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has a "<email_status> email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "pay_now_button" button
     Then the "Port Out Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Auftrag ist eingegangen." text is displayed
      And the "success_message" textfield with "Du erhälst eine Bestätigungs-SMS/E-Mail, sobald deine Rufnummer freigegeben wurde." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | email_status | ber | jira_id      |
          | active       | ber | QANOV-267373 |
          | not verified |     | QANOV-268911 |

  @jira.QANOV-268908 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-337904 @manual @mobile @o2de @regression
  Scenario: A postpay user without contact email taps to pay the port-out request: a warning popup is displayed
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has a "no email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "continue_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Die Portabilitätsbestätigung kann dann an die hinzugefügte E-Mail-Adresse gesendet werden." text is displayed
      And the "popup.cancel" button with "E-Mail hinzufügen" text is displayed
      And the "popup.accept" button with "Jetzt nicht" text is displayed

  @jira.QANOV-268909 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-268908 @manual @mobile @o2de @regression
  Scenario: A postpay user without a contact email can cancel the port-out request
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has a "no email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "continue_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Confirmation" page is displayed
      And the "Rufnummernmitnahme" header is displayed

  @jira.QANOV-268910 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-268908 @manual @mobile @o2de @regression
  Scenario: A postpay user without a contact email can request the port-out successfully without adding the email
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has a "no email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "continue_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Port Out Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Auftrag ist eingegangen." text is displayed
      And the "success_message" textfield with "Du erhälst eine Bestätigungs-SMS/E-Mail, sobald deine Rufnummer freigegeben wurde." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-268912 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-337905 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without contact email taps to pay the port-out request: a warning popup is displayed
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has a "no email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "pay_now_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Die Portabilitätsbestätigung kann dann an die hinzugefügte E-Mail-Adresse gesendet werden." text is displayed
      And the "popup.cancel" button with "E-Mail hinzufügen" text is displayed
      And the "popup.accept" button with "Jetzt nicht" text is displayed

  @jira.QANOV-268913 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-268912 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without a contact email can cancel the port-out request
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has a "no email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "pay_now_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Confirmation" page is displayed
      And the "Rufnummernmitnahme" header is displayed

  @jira.QANOV-268914 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-268912 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without a contact email can request the port-out successfully without verifying the email
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has a "no email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "pay_now_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Port Out Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Auftrag ist eingegangen." text is displayed
      And the "success_message" textfield with "Du erhälst eine Bestätigungs-SMS/E-Mail, sobald deine Rufnummer freigegeben wurde." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242924 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242923 @jira.link.depends_on.QANOV-267373
  @jira.link.depends_on.QANOV-268910 @jira.link.depends_on.QANOV-268914 @manual @mobile @o2de @regression
  Scenario: A user can go back to the dashboard from the "Port Out Success Feedback" screen
    Given user has the "Port Out Success Feedback" module configured in CMS for "Port Out Success Feedback" page
      And user is in the "Port Out Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-242925 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-337904 @manual @mobile @o2de @regression
  Scenario: A postpay user with a contact email fails to port-out a line within this week
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has a "email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Error Feedback" module configured in CMS for "Port Out Error Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "continue_button" button
      And there is an error porting the line
     Then the "Port Out Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte leider nicht bearbeitet werden" text is displayed
      And the "error_message" textfield with "Bitte versuchen Sie es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-267374 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-337905 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and a contact email fails to port-out a line within this week
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has a "email" stored in the contact details
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user has the "Port Out Error Feedback" module configured in CMS for "Port Out Error Feedback" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "pay_now_button" button
      And there is an error porting the line
     Then the "Port Out Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte leider nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242926 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242925 @jira.link.depends_on.QANOV-267374
  @manual @mobile @o2de @regression
  Scenario: A user can go back to the dashboard from the "Port Out Error Feedback" screen
    Given user has the "Port Out Error Feedback" module configured in CMS for "Port Out Error Feedback" page
      And user is in the "Port Out Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.QANOV-242925 @jira.link.depends_on.QANOV-267374 @manual
  @mobile @o2de @regression
  Scenario Outline: A user can go to previous screen from the "Port Out Error Feedback" screen on <client> devices
    Given user has the "Port Out Error Feedback" module configured in CMS for "Port In Error Feedback" page
      And user is in the "Port Out Error Feedback" page
     When clicks on the <button> button
     Then the "Port Out Confirmation" page is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-242927 |
          | ios     | "navigation_top_bar.back_button" | QANOV-242928 |

  @jira.QANOV-268905 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268899 @jira.link.depends_on.QANOV-268900
  @jira.link.depends_on.QANOV-268901 @manual @mobile @o2de @regression
  Scenario: A postpay user can access to change the contact email from the "Port Out Confirmation" screen
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Confirmation" page is displayed
      And the "Rufnummernmitnahme" header is displayed

  @jira.QANOV-268906 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268902 @jira.link.depends_on.QANOV-268903
  @jira.link.depends_on.QANOV-268904 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance can access to change the contact email from the "Port Out Confirmation" screen
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Confirmation" page is displayed
      And the "Rufnummernmitnahme" header is displayed

  @jira.QANOV-342532 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268905 @jira.link.detects.O2DE-2173 @manual
  @mobile @o2de @regression
  Scenario: A postpay user goes back to the "Port Out Confirmation" screen after updating the email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Port Out Confirmation" page is displayed
      And the "contact_email.value" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342533 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268906 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance goes back to the "Port Out Confirmation" screen after updating the email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Port Out Confirmation" page is displayed
      And the "contact_email.value" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342534 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268905 @manual @mobile @o2de @regression
  Scenario: A postpay updates the contact email from the "Port Out Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has a "postpay" account type
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the contact email but the confirmation takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Confirmation" page is displayed

  @jira.QANOV-342535 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268906 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance updates the contact email from the "Port Out Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has a "prepay" account type
      And user has not a porting requested
      And user has enough balance to port-out a line
      And user has the matching subscription selected in the account
      And user has the "Port Out Confirmation" module configured in CMS for "Port Out Confirmation" page
      And user is in the "Port Out Confirmation" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the contact email but the confirmation takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port Out Confirmation" page is displayed

  @jira.QANOV-342536 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-342534 @jira.link.depends_on.QANOV-342535
  @manual @mobile @o2de @regression
  Scenario: A user can go back to "Port Out Confirmation" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Port Out Confirmation" page is displayed

  @jira.QANOV-242929 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242879 @jira.link.depends_on.QANOV-44456
  @manual @mobile @o2de @smoke
  Scenario: A user cannot access to the porting flow if a port-out has already been requested for that line
    Given user has a port-out requested
      And user has the matching subscription selected in the account
      And user has the "Porting Already Requested" module configured in CMS for "Porting Already Requested" page
      And user is in the "Services" page
     When clicks on the "services.porting_entrypoint" entrypoint
     Then the "Porting Already Requested" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with the "Die Mitnahme deiner Rufnummer +49\d+ wurde in Auftrag gegeben." format is displayed
      And the "description" textfield with the "Die Portierungserklärung ist gültig bis \d{2}\/\d{2}\/\d{4}. In diesem Zeitraum kannst du die Mitnahme deiner Rufnummer bei deinem neuen Anbieter beantragen." format is displayed
      And the "info_title" textfield with "INFORMATIONEN ZUR RUFNUMMERNMITNAHME:" text is displayed
      And the "phone_number_title" textfield with "Rufnummer zur Mitnahme" text is displayed
      And the "phone_number_value" textfield is displayed
      And the "full_name_title" textfield with the "Vor- und Nachname" text is displayed
      And the "full_name_value" textfield is displayed
      And the "birth_date_title" textfield with the "Geburtsdatum" text is displayed
      And the "birth_date_value" textfield with the "\d{2}/\d{2}/\d{4}" format is displayed
      And the "ok_button" button with "OK" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242930 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-242929 @manual @mobile @o2de @regression
  Scenario: A user can go back to the Services screen from the to the "Porting Already Requested"
    Given user has a port-out requested
      And user has the matching subscription selected in the account
      And user has the "Porting Already Requested" module configured in CMS for "Porting Already Requested" page
      And user is in the "Porting Already Requested" page
     When clicks on the "ok_button" button
     Then the "Services" page is displayed

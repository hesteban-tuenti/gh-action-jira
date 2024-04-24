# -*- coding: utf-8 -*-
@jira.QANOV-242842
Feature: Port in

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "SUBSCRIPTION_PHONE_NUMBER_PORTING" forbidden use case


  @jira.QANOV-242843 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-202565 @manual @mobile @smoke
  @raitt_drop1
  Scenario: A postpay user can access to the "Porting Choose Type" screen
    NOTE: The request done to Kernel to obtain the information about if there is a previous port-in "in-progress" cannot be
    implemented because Box7 doesn't provide that information (OB4PDE-113). For that reason the Novum APP won't be able to
    block two consecutive port-in requests. However, we can know if a port-out has been requested.
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Porting Choose Type" module configured in CMS for "Porting Choose Type" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "porting_entrypoint" entrypoint
     Then the "Porting Choose Type" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Beauftragen ganz einfach die Mitnahme deiner Rufnummer" text is displayed
      And the "port_in_option.name" textfield with "Zu Blau mitnehmen" text is displayed
      And the "port_in_option.radiobutton" button is displayed
      And the "port_out_option.name" textfield with "Zu einem anderen Anbieter mitnehmen" text is displayed
      And the "port_out_option.radiobutton" button is displayed
      And the "port_in.title" textfield with "ZU BLAU MITNEHMEN" text is displayed
      And the "port_in.description" textfield with "Hier kannst du die Mitnahme deiner bestehenden Rufnummer zu Blau beauftragen." text is displayed
      And the "port_out.title" textfield with "ZU EINEM ANDEREN ANBIETER MITNEHMEN" text is displayed
      And the "port_out.description" textfield with "Hier kannst du deine Rufnummer für einen Anbieterwechsel aus einem laufenden Vertrag freigeben (Portierungserklärung)." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242844 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242843 @jira.link.detects.O2DE-2171
  @manual @mobile @smoke @raitt_drop1
  Scenario: A postpay user who wants to port-in a line can access to the "Port In Choose Line" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Porting Choose Type" module configured in CMS for "Porting Choose Type" page
      And user has the "Port In Choose Line" module configured in CMS for "Port In Choose Line" page
      And user is in the "Porting Choose Type" page
     When clicks on the "port_in_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port In Choose Line" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Um welchen Vertragstyp handelt es sich?" text is displayed
      And the "postpay_option.name" textfield with "Vertrag mit Laufzeit" text is displayed
      And the "postpay_option.radiobutton" button is displayed
      And the "prepay_option.name" textfield with "Prepaid" text is displayed
      And the "prepay_option.radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242845 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242844 @jira.link.detects.O2DE-2171
  @manual @mobile @smoke
  Scenario: A postpay user who wants to port-in a postpay line can access to the "Port In Choose When" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Line" module configured in CMS for "Port In Choose Line" page
      And user has the "Port In Choose When" module configured in CMS for "Port In Choose When" page
      And user is in the "Port In Choose Line" page
     When clicks on the "postpay_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port In Choose When" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "title" textfield with "Wann soll die Rufnummernmitnahme durchgeführt werden?" text is displayed
      And the "this_week_option.name" textfield with "Sofortiger Wechsel" text is displayed
      And the "this_week_option.radiobutton" button is displayed
      And the "end_of_contract_option.name" textfield with "Zum Vertragsende" text is displayed
      And the "end_of_contract_option.radiobutton" button is displayed
      And the "this_week.title" textfield with "SOFORTIGER WECHSEL" text is displayed
      And the "this_week.description" textfield with "Die Rufnummermitnahme erfolgt innerhalb von 8 Werktagen. Voraussetzung: die Freigabe der Rufnummer wurde beantragt (telefonisch oder schriftlich)." text is displayed
      And the "end_of_contract.title" textfield with "ZUM VERTRAGSENDE" text is displayed
      And the "end_of_contract.description" textfield with "Die Rufnummer wird übertragen, sobald der Vertrag beim alten Anbieter endet. Voraussetzung: Der Vertrag deines alten Anbieters wurde gekündigt und die Rufnummermitnahme beantragt." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242846 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242845 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a postpay line can access to the "Port In Info" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Line" module configured in CMS for "Port In Choose Line" page
      And user has the "Port In Choose When" module configured in CMS for "Port In Choose When" page
      And user has the "Port In Info" module configured in CMS for "Port In Info" page
      And user is in the "Port In Choose Line" page
     When clicks on the "postpay_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Choose When" page is displayed
      And clicks on the "this_week_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port In Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Bevor es losgeht" text is displayed
      And the "subtitle" textfield with "SO GEHT'S WEITER:" text is displayed
      And the "point1" textfield with "Rufnummer beim alten Anbieter freigeben." text is displayed
      And the "point2" textfield with "Formular ausfüllen. Bitte gib deine persönlichen Daten exakt so ein, wie sie bei deinem Alt-Anbieter hinterlegt sind." text is displayed
      And the "point3" textfield with "Wir bestätigen den Eingang des Portierungsauftrags per SMS/E-mail. Über den weiteren Verlauf sowie das Portierungsdatum informieren wir dich zeitnah." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242847 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242844 @manual @mobile @smoke
  Scenario: A postpay user who wants to port-in a prepay line can access to the "Port In Info" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Line" module configured in CMS for "Port In Choose Line" page
      And user has the "Port In Info" module configured in CMS for "Port In Info" page
      And user is in the "Port In Choose Line" page
     When clicks on the "prepay_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port In Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Bevor es losgeht" text is displayed
      And the "subtitle" textfield with "SO GEHT'S WEITER:" text is displayed
      And the "point1" textfield with "Rufnummer beim alten Anbieter freigeben." text is displayed
      And the "point2" textfield with "Formular ausfüllen. Bitte gib deine persönlichen Daten exakt so ein, wie sie bei deinem Alt-Anbieter hinterlegt sind." text is displayed
      And the "point3" textfield with "Wir bestätigen den Eingang des Portierungsauftrags per SMS/E-mail. Über den weiteren Verlauf sowie das Portierungsdatum informieren wir dich zeitnah." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242848 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242846
  @jira.link.depends_on.QANOV-242847 @mobile @sanity @automatic @cert3 @live @next @webapp
  Scenario: A postpay user who wants to port-in a line can access to the "Port In Choose Previous Carrier" screen
    Carrier information and the most popular list is provided by the API.
    Given user has not a port in requested
      And user has the matching subscription selected in the account
      And user has the "Port In Info" module configured in CMS for "Port In Info" page
      And user has the "Port In Choose Previous Carrier" module configured in CMS for "Port In Choose Previous Carrier" page
      And user is in the "Port In Out Choose Type" page
      And clicks on the "port_in_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Choose Line" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Out Choose When" page is displayed
      And clicks on the "this_week_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Out Info" page is displayed
     When clicks on the "continue_button" button
     Then the "Port In Choose Previous Carrier" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "first" position
      And the "title" textfield with "Alten Anbieter wählen" text is displayed
      And the "description" textfield with "Wähle aus der Liste deinen alten Anbieter aus." text is displayed
      And the "carrier_search_inputtext" inputtext is displayed
      And the "carrier_search_placeholder" placeholder with "Anbieter suchen" text is displayed
      And the "carriers.popular_title" textfield with "GÄNGIGE ANBIETER" text is displayed
      And the "carriers.popular_list" list is displayed
      And each element in the "carriers.popular_list" list has the "name" field
      And the "carriers.all_title" textfield with "ALLE ANBIETER" text is displayed
      And the "carriers.all_list" list is displayed
      And each element in the "carriers.all_list" list has the "name" field
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-242849 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242848 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot access to the "Port In Insert Phone Number" screen without selecting a carrier
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Previous Carrier" module configured in CMS for "Port In Choose Previous Carrier" page
      And user is in the "Port In Choose Previous Carrier" page
     When clicks on the "continue_button" button
     Then the "Port In Select Carrier" popup is displayed
      And the "popup.title" textfield with "Anbieter wählen" text is displayed
      And the "popup.message" textfield with "Wählen deinen alten Anbieter um fortzufahren" text is displayed
      And the "popup.accept" textfield with the "(OK|Ok)" format is displayed
      And clicks on the "popup.accept" button
      And the "Port In Choose Previous Carrier" page is displayed

  @jira.QANOV-242850 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242848 @jira.link.detects.O2DE-2162
  @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line can search for a carrier using just some characters
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Previous Carrier" module configured in CMS for "Port In Choose Previous Carrier" page
      And user is in the "Port In Choose Previous Carrier" page
     When fills the "carrier_search_inputtext" inputtext with the "V" text
     Then the "carriers_list" list is displayed
      And each element in the "popular_carriers_list" list has the "name" textfield with the ".*Vi.*" format
      And each element in the "all_carriers_list" list has the "name" textfield with the ".*Vi.*" format
      And the "continue_button" button with "Weiter" text is displayed
      And the "carrier_search_clear_icon" icon is displayed

  @jira.QANOV-242851 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242848 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line can search for a carrier using the full name
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Previous Carrier" module configured in CMS for "Port In Choose Previous Carrier" page
      And user is in the "Port In Choose Previous Carrier" page
     When fills the "carrier_search_inputtext" inputtext with the "Victorvox" text
     Then the "popular_carriers_list" list is displayed
      And the "popular_carriers_list" list has "1" elements
      And the "0" index in the "popular_carriers_list" list has the "name" field with "Victorvox (VICT)" text
      And the "all_carriers_list" list is displayed
      And the "all_carriers_list" list has "1" elements
      And the "0" index in the "all_carriers_list" list has the "name" field with "Victorvox (VICT)" text
      And the "continue_button" button with "Weiter" text is displayed
      And the "carrier_search_clear_icon" icon is displayed

  @jira.QANOV-242852 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242850
  @jira.link.depends_on.QANOV-242851 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line can remove the carrier search
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Previous Carrier" module configured in CMS for "Port In Choose Previous Carrier" page
      And user is in the "Port In Choose Previous Carrier" page
     When fills the "carrier_search_inputtext" inputtext with the "Victorvox" text
      And clicks on the "carrier_search_clear_icon" icon
     Then the "carrier_search_inputtext" inputtext is empty
      And the "carrier_search_clear_icon" icon is not displayed
      And the "popular_carriers_list" list is displayed
      And the "popular_carriers_list" list has ">1" elements
      And the "all_carriers_list" list is displayed
      And the "all_carriers_list" list has ">1" elements
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-242853 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242848 @manual @mobile @smoke
  Scenario: A postpay user who wants to port-in a line can access to the "Port In Insert Phone Number" screen after selecting a carrier
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Previous Carrier" module configured in CMS for "Port In Choose Previous Carrier" page
      And user has the "Port In Insert Phone Number" module configured in CMS for "Port In Insert Phone Number" page
      And user is in the "Port In Choose Previous Carrier" page
     When fills the "carrier_search_inputtext" inputtext with the "V" text
      And clicks on any element in the "all_carriers_list" list
      And clicks on the "continue_button" button
     Then the "Port In Insert Phone Number" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "second" position
      And the "title" textfield with "Handynummer eingeben" text is displayed
      And the "description" textfield with "Gib die Mobilfunknummer ein, die du zu Blau mitnehmen möchtest." text is displayed
      And the "phone_number_inputtext" inputtext with the "Handynummer" placeholder is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242854 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242853 @jira.link.detects.O2DE-1780
  @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line can access to the data protection info from the "Port In Insert Phone Number" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Insert Phone Number" module configured in CMS for "Port In Insert Phone Number" page
      And user is in the "Port In Insert Phone Number" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz bei Blau" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port In Insert Phone Number" page is displayed

  @jira.QANOV-242855 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242853 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot access to the "Port In Choose Customer Type" screen without inserting a phone number
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Insert Phone Number" module configured in CMS for "Port In Insert Phone Number" page
      And user is in the "Port In Insert Phone Number" page
     When clicks on the "continue_button" button
     Then the "phone_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-242856 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242853 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot access to the "Port In Choose Customer Type" screen inserting a phone number with wrong format
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Insert Phone Number" module configured in CMS for "Port In Insert Phone Number" page
      And user is in the "Port In Insert Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "1234" text
      And clicks on the "continue_button" button
     Then the "phone_number_error_textfield" textfield with "Diese Telefonnummer ist ungültig. Gib eine gültige Nummer ein" text is displayed

  @jira.QANOV-242857 @TBD @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242853
  @jira.link.detects.O2DE-2163 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot access to the "Port In Choose Customer Type" screen inserting a non German phone number
    The app is forcing a german prefix (+49) in the phone number, so it is not possible to add a number with another prefix.
    The number validation is delegated into a google library, so we don't have control on this.
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Insert Phone Number" module configured in CMS for "Port In Insert Phone Number" page
      And user is in the "Port In Insert Phone Number" page
     When clicks on the "phone_number_inputtext" inputtext
     Then the "+49" prefix is displayed in the "phone_number_inputtext" field

  @jira.QANOV-242858 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242848 @manual @mobile @smoke
  Scenario: A postpay user who wants to port-in a line can access to the "Port In Choose Customer Type" screen after inserting a valid phone number
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Insert Phone Number" module configured in CMS for "Port In Insert Phone Number" page
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user is in the "Port In Insert Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "continue_button" button
     Then the "Port In Choose Customer Type" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "third" position
      And the "title" textfield with "Kundentyp wählen" text is displayed
      And the "private_customer_option.name" textfield with "Privatkunde" text is displayed
      And the "private_customer_option.radiobutton" button is displayed
      And the "business_customer_option.name" textfield with "Geschäftskunde" text is displayed
      And the "business_customer_option.radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242859 @android @ber @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242858
  @jira.link.detects.O2DE-2164 @jira.link.detects.O2DE-2171 @automatic @mobile @smoke @cert3 @live @next @webapp @raitt_drop1
  Scenario: A postpay user who wants to port-in a line can access to the "Port In Check Info" screen after selecting a private customer
    The form will be shown empty (no pre-filled).
    Given user has not a port in requested
      And user has the matching subscription selected in the account
      And stores the current line in the context storage with key "current_line"
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Out Choose Type" page
      And clicks on the "port_in_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Choose Line" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Out Choose When" page is displayed
      And clicks on the "this_week_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Out Info" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Choose Previous Carrier" page is displayed
      And clicks on any element in the "carriers.popular_list" list
      And waits "2" seconds
      And clicks on the "continue_button" button
      And the "Port In Insert Phone Number" page is displayed
      And fills the "phone_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "continue_button" button
      And the "Port In Choose Customer Type" page is displayed
     When clicks on the "business_customer_radiobutton" button
      And waits "2" seconds
      And clicks on the "continue_button" button
     Then the "Port In Check Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fourth" position
      And the "title" textfield with "Persönliche Daten" text is displayed
      And the "description" textfield with "Achte darauf, dass die angegebenen Daten exakt den Angaben bei deinem alten Anbieter entsprechen." text is displayed
      And the "current_phone_number_title" textfield with "Aktuelle Rufnummer" text is displayed
      And the "current_phone_number_value" textfield with "[CONTEXT:current_line]" text is displayed
      And the "phone_number_to_port_in_title" textfield with "Handynummer zur Mitnahme" text is displayed
      And the "phone_number_to_port_in_value" textfield with "+4915234567891" text is displayed
      And the "name_inputtext" inputtext is displayed
      And the "name_label" textfield with "Name" text is displayed
      And the "name_inputtext" inputtext is empty
      And the "surname_inputtext" inputtext is displayed
      And the "surname_label" textfield with "Nachname" text is displayed
      And the "surname_inputtext" inputtext is empty
      And the "birth_datepicker" inputtext is displayed
      And the "birth_label" textfield with "Geburtsdatum" text is displayed
      And the "birth_datepicker" inputtext is empty
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-242860 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242858
  @jira.link.detects.O2DE-2164 @jira.link.detects.O2DE-2171 @automatic @mobile @smoke @cert3 @live @next @webapp @raitt_drop1
  Scenario: A postpay user who wants to port-in a line can access to the "Port In Check Info" screen after selecting a business customer
    The form will be shown empty (no pre-filled).
    Given user has not a port in requested
      And user has the matching subscription selected in the account
      And stores the current line in the context storage with key "current_line"
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Out Choose Type" page
      And clicks on the "port_in_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Choose Line" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Out Choose When" page is displayed
      And clicks on the "this_week_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Out Info" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Choose Previous Carrier" page is displayed
      And clicks on any element in the "carriers.popular_list" list
      And waits "1" seconds
      And clicks on the "continue_button" button
      And the "Port In Insert Phone Number" page is displayed
      And fills the "phone_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "continue_button" button
      And the "Port In Choose Customer Type" page is displayed
     When clicks on the "business_customer_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Port In Check Info" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fourth" position
      And the "title" textfield with "Persönliche Daten" text is displayed
      And the "description" textfield with "Achte darauf, dass die angegebenen Daten exakt den Angaben bei deinem alten Anbieter entsprechen." text is displayed
      And the "current_phone_number_title" textfield with "Aktuelle Rufnummer" text is displayed
      And the "current_phone_number_value" textfield with "[CONTEXT:current_line]" text is displayed
      And the "phone_number_to_port_in_title" textfield with "Handynummer zur Mitnahme" text is displayed
      And the "phone_number_to_port_in_value" textfield with "+4915234567891" text is displayed
      And the "name_inputtext" inputtext is displayed
      And the "name_label" textfield with "Name" text is displayed
      And the "name_inputtext" inputtext is empty
      And the "surname_inputtext" inputtext is displayed
      And the "surname_label" textfield with "Nachname" text is displayed
      And the "surname_inputtext" inputtext is empty
      And the "birth_datepicker" inputtext is displayed
      And the "birth_label" textfield with "Geburtsdatum" text is displayed
      And the "birth_datepicker" inputtext is empty
      And the "company_name_inputtext" inputtext is displayed
      And the "company_name_label" textfield with "Firma" text is displayed
      And the "company_name_inputtext" inputtext is empty
      And the "client_number_inputtext" inputtext is displayed
      And the "client_number_label" textfield with "Kundennummer" text is displayed
      And the "client_number_inputtext" inputtext is empty
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-242861 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242859
  @jira.link.depends_on.QANOV-242860 @jira.link.detects.O2DE-1780 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line can access to the data protection info from the "Port In Check Info" screen
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Check Info" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz bei Blau" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port In Check Info" page is displayed

  @jira.<jira_id> @<client> @blaude @jira.cv.13.10 @jira.link.depends_on.QANOV-242859 @jira.link.depends_on.QANOV-242860
  @jira.link.detects.O2DE-1781 @manual @mobile @regression
  Scenario Outline: A postpay user who wants to port-in a line taps on the Back button after changing the customer info
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Check Info" page
     When fills the "name_inputtext" inputtext with the "Testing" text
      And clicks on the <button> button
     Then the "Port In Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<accept_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | button                           | cancel_button | accept_button | jira_id      |
          | android | native "back"                    | ABBRECHEN     | VERLASSEN     | QANOV-242862 |
          | ios     | "navigation_top_bar.back_button" | Abbrechen     | Verlassen     | QANOV-242863 |

  @jira.QANOV-242864 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242862
  @jira.link.depends_on.QANOV-242863 @manual @mobile @regression
  Scenario: A postpay user decides to continue with the port-in flow after seeing the cancellation popup
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Port In Check Info" page is displayed

  @jira.QANOV-242865 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242862
  @jira.link.depends_on.QANOV-242863 @manual @mobile @regression
  Scenario: A postpay user decides to cancel the port-in flow after seeing the cancellation popup
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Port In Choose Customer Type" page is displayed

  @jira.QANOV-254312 @android @blaude @jira.cv.13.10 @jira.link.depends_on.QANOV-242859 @jira.link.depends_on.QANOV-242860
  @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot select a future birth date on android devices
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Check Info" page
     When clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
     Then all days after "today" will be disabled in the "birth_calendar" calendar

  @jira.QANOV-254313 @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242859 @jira.link.depends_on.QANOV-242860
  @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot select a future birth date on iOS devices
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Check Info" page
     When clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "tomorrow" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
     Then the "birth_datepicker_error_textfield" textfield with "Unzulässiges Datum" text is displayed

  @jira.QANOV-242866 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242859 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot access to the "Port In Email Address" screen without filling all the private customer fields
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "private_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And clears the "name_inputtext" inputtext
      And clears the "surname_inputtext" inputtext
      And clears the "birth_datepicker" datepicker
      And clicks on the "continue_button" button
     Then the "name_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "surname_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "birth_datepicker_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-242867 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242860 @manual @mobile @regression
  Scenario: A postpay user who wants to port-in a line cannot access to the "Port In Email Address" screen without filling all the business customer fields
    Given user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "business_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And clears the "name_inputtext" inputtext
      And clears the "surname_inputtext" inputtext
      And clears the "birth_datepicker" datepicker
      And clears the "company_name_inputtext" inputtext
      And clears the "client_number_inputtext" inputtext
      And clicks on the "continue_button" button
     Then the "name_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "surname_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "birth_datepicker_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "company_name_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "client_number_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-337882 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-242859 @jira.link.detects.O2DE-3396
  @manual @mobile @smoke
  Scenario: A postpay user with a verified contact email can access to the "Port In Email Address" screen after selecting a private customer
    Given user has a "verified email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "private_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "any" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
      And clicks on the "continue_button" button
     Then the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fifth" position
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Wir bestätigen Ihnen den Eingang des Portierungsauftrags an Ihre Kontakt E-Mail Adresse. Über den Verlauf der Portierung sowie das Portierungsdatum informieren wir Sie ebenfalls." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-337883 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-242860 @jira.link.detects.O2DE-3396
  @manual @mobile @regression
  Scenario: A postpay user with a verified contact email can access to the "Port In Email Address" screen after selecting a business customer
    Given user has a "verified email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "business_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "any" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
      And fills the "company_name_inputtext" inputtext with the "Lufthansa" text
      And fills the "client_number_inputtext" inputtext with the "36654206754" text
      And clicks on the "continue_button" button
     Then the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fifth" position
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Wir bestätigen dir den Eingang des Portierungsauftrags an deine Kontakt E-Mail Adresse. Über den Verlauf der Portierung sowie das Portierungsdatum informieren wir dich ebenfalls." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-268863 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-242859 @jira.link.detects.O2DE-2165
  @jira.link.detects.O2DE-2171 @manual @mobile @regression
  Scenario: A postpay user with a not verified contact email can access to the "Port In Email Address" screen after selecting a private customer
    Given user has a "not verified email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "private_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "any" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
      And clicks on the "continue_button" button
     Then the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fifth" position
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Wir bestätigen dir den Eingang des Portierungsauftrags an deine Kontakt E-Mail Adresse. Über den Verlauf der Portierung sowie das Portierungsdatum informieren wir dich ebenfalls." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-268864 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-242860 @jira.link.detects.O2DE-2165
  @jira.link.detects.O2DE-2171 @manual @mobile @smoke
  Scenario: A postpay user with a not verified contact email can access to the "Port In Email Address" screen after selecting a business customer
    Given user has a "not verified email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "business_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "any" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
      And fills the "company_name_inputtext" inputtext with the "Lufthansa" text
      And fills the "client_number_inputtext" inputtext with the "36654206754" text
      And clicks on the "continue_button" button
     Then the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fifth" position
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Wir bestätigen dir den Eingang des Portierungsauftrags an deine Kontakt E-Mail Adresse. Über den Verlauf der Portierung sowie das Portierungsdatum informieren wir dich ebenfalls." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-268865 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-242859 @jira.link.detects.O2DE-2165
  @jira.link.detects.O2DE-2171 @manual @mobile @regression
  Scenario: A postpay user without a contact email saved can access to the "Port In Email Address" screen after selecting a private customer
    Given user has a "no email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "private_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "any" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
      And clicks on the "continue_button" button
     Then the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fifth" position
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Wir bestätigen dir den Eingang des Portierungsauftrags an deine Kontakt E-Mail Adresse. Über den Verlauf der Portierung sowie das Portierungsdatum informieren wir dich ebenfalls." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-268866 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-242860 @jira.link.detects.O2DE-2165
  @jira.link.detects.O2DE-2171 @manual @mobile @regression
  Scenario: A postpay user without a contact email saved can access to the "Port In Email Address" screen after selecting a business customer
    Given user has a "no email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Choose Customer Type" module configured in CMS for "Port In Choose Customer Type" page
      And user has the "Port In Check Info" module configured in CMS for "Port In Check Info" page
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Choose Customer Type" page
     When clicks on the "business_customer_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on the "birth_datepicker" datepicker
      And the "birth_calendar" calendar is displayed
      And selects "any" date in the "birth_calendar" calendar
      And the "Port In Check Info" page is displayed
      And fills the "company_name_inputtext" inputtext with the "Lufthansa" text
      And fills the "client_number_inputtext" inputtext with the "36654206754" text
      And clicks on the "continue_button" button
     Then the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed
      And the "progress_steps" progress bar is on "fifth" position
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Wir bestätigen dir den Eingang des Portierungsauftrags an deine Kontakt E-Mail Adresse. Über den Verlauf der Portierung sowie das Portierungsdatum informieren wir dich ebenfalls." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.<depends_on> @mobile @smoke
  Scenario Outline: A postpay user with a <email_status> contact email user can port-in a line successfully
    Given user has a "<email_status>" email stored in the contact details
      And user has not a port in requested
      And user has the matching subscription selected in the account
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user has the "Port In Success Feedback" module configured in CMS for "Port In Success Feedback" page
      And user is in the "Port In Out Choose Type" page
      And clicks on the "port_in_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Choose Line" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Out Choose When" page is displayed
      And clicks on the "this_week_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Out Info" page is displayed
      And clicks on the "continue_button" button
      And the "Port In Choose Previous Carrier" page is displayed
      And clicks on any element in the "carriers.popular_list" list
      And clicks on the "continue_button" button
      And the "Port In Insert Phone Number" page is displayed
      And fills the "phone_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "continue_button" button
      And the "Port In Choose Customer Type" page is displayed
      And clicks on the "private_customer_radiobutton" button
      And clicks on the "continue_button" button
      And the "Port In Check Info" page is displayed
      And fills the "name_inputtext" inputtext with the "Novum" text
      And fills the "surname_inputtext" inputtext with the "QA" text
      And clicks on yesterday date in "birth_datepicker" calendar input
      And clicks on the "continue_button" button
      And the "Port In Email Address" page is displayed
     When clicks on the "continue_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Dein Auftrag ist eingegangen." text is displayed
      And the "message" textfield with "Sobald dein Alt-Anbieter die Rufnummernmitnahme bestätigt hat, informieren wir dich über dein Portierungsdatum." text is displayed
      And the "main_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @ber @automatic @qa @raitt_drop1
  Examples:
          | email_status | depends_on                | jira_id      |
          | active       | QANOV-337882:QANOV-337883 | QANOV-242870 |

  @manual
  Examples:
          | email_status | depends_on                | jira_id      |
          | not verified | QANOV-268863:QANOV-268864 | QANOV-268869 |

  @jira.QANOV-268870 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-268865 @jira.link.depends_on.QANOV-268866
  @jira.link.detects.O2DE-2170 @manual @mobile @regression
  Scenario: A postpay user with no contact email taps to confirm the port-in: a warning popup is displayed
    Given user has a "no email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Email Address" page
     When clicks on the "confirm_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Die Portabilitätsbestätigung kann dann an die hinzugefügte E-Mail-Adresse gesendet werden." text is displayed
      And the "popup.cancel" button with "E-Mail hinzufügen" text is displayed
      And the "popup.accept" button with "Jetzt nicht" text is displayed

  @jira.QANOV-268871 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-268870 @manual @mobile @regression
  Scenario: User without a contact email can cancel the port-in request
    Given user has a "no email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Email Address" page
     When clicks on the "confirm_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed

  @jira.QANOV-268872 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-268870 @manual @mobile @regression
  Scenario: User without a contact email can request the port-in successfully without adding the email
    Given user has a "no email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user has the "Port In Success Feedback" module configured in CMS for "Port In Success Feedback" page
      And user is in the "Port In Email Address" page
     When clicks on the "confirm_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Port In Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Auftrag ist eingegangen." text is displayed
      And the "success_message" textfield with "Sobald dein Alt-Anbieter die Rufnummernmitnahme bestätigt hat, informieren wir dich über dein Portierungsdatum." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242871 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242870
  @jira.link.depends_on.QANOV-268872 @manual @mobile @regression
  Scenario: A postpay user can go back to the dashboard from the "Port In Success Feedback" screen
    Given user has the "Port In Success Feedback" module configured in CMS for "Port In Success Feedback" page
      And user is in the "Port In Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-242872 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-337882 @jira.link.depends_on.QANOV-337883
  @manual @mobile @regression
  Scenario: A postpay user with a contact email can port-in a line unsuccessfully
    Given user has a "email" stored in the contact details
      And user has not a porting requested
      And user has the matching subscription selected in the account
      And user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user has the "Port In Error Feedback" module configured in CMS for "Port In Error Feedback" page
      And user is in the "Port In Email Address" page
     When clicks on the "confirm_button" button
      And there is an error porting the line
     Then the "Port In Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte leider nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-242873 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242872 @manual @mobile @regression
  Scenario: A postpay user can go back to the dashboard from the "Port In Error Feedback" screen
    Given user has the "Port In Error Feedback" module configured in CMS for "Port In Error Feedback" page
      And user is in the "Port In Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-242872 @manual @mobile @regression
  Scenario Outline: A postpay user can go to previous screen from the "Port In Error Feedback" screen on <client> devices
    Given user has the "Port In Error Feedback" module configured in CMS for "Port In Error Feedback" page
      And user is in the "Port In Error Feedback" page
     When clicks on the <button> button
     Then the "Port In Email Address" page is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-242874 |
          | ios     | "navigation_top_bar.back_button" | QANOV-242875 |

  @jira.QANOV-268867 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-268863
  @jira.link.depends_on.QANOV-268864 @jira.link.depends_on.QANOV-268865 @jira.link.depends_on.QANOV-268866
  @jira.link.depends_on.QANOV-337882 @jira.link.depends_on.QANOV-337883 @manual @mobile @regression
  Scenario: A postpay user can access to change the contact email from the "contact email" entrypoint in the "Port In Email Address" screen
    Given user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Email Address" page
     When clicks on the "email_address_chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port In Email Address" page is displayed
      And the "Rufnummernmitnahme" header is displayed

  @jira.QANOV-342521 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-268867 @manual @mobile @regression
  Scenario: A postpay user goes back to the "Port In Email Address" screen after updating the contact email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Email Address" page
     When clicks on the "email_address_chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Port In Email Address" page is displayed
      And the "contact_email.email" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342522 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-268867 @manual @mobile @regression
  Scenario: A postpay user changes the contact email from the "Port In Email Address" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Port In Email Address" module configured in CMS for "Port In Email Address" page
      And user is in the "Port In Email Address" page
     When clicks on the "email_address_chevron" icon
      And the "Email Contact" page is displayed
      And updates the contact email but the confirmation takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Port In Email Address" page is displayed

  @jira.QANOV-342523 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-342522 @manual @mobile @regression
  Scenario: A user can go back to "Port In Email Address" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Port In Email Address" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-195664
Feature: SIM Swap

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has a SIM in any of "active;suspended" status
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "SIMs list" modules configured in CMS for "Sim Management" page
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user has the "Swap SIM Choose Type" module configured in CMS for "Swap SIM Choose Type" page


  @jira.QANOV-195665 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195495 @jira.link.depends_on.QANOV-195496
  @jira.link.depends_on.QANOV-206017 @jira.link.depends_on.QANOV-206020 @jira.link.detects.O2DE-2958
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @smoke
  Scenario: A postpay user can start the "Swap SIM" flow for an active or suspended SIM
    Only active or blocked SIMs will have the setting to Swap SIM.
    eSIM is only available for postpay user.
    Same flow for UDP and non-UDP postpay tariffs, only prices can change.
    If the tariff/pack is eligible for 5GSA, a "What is 5G SA" entrypoint will be displayed at the bottom of the screen.
    Given user has a "postpay" account type
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
     Then the "Swap SIM Choose Type" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "SIM-Karten Typ wählen" text is displayed
      And the "description" textfield with "Wähle den passenden SIM-Karten Typ:" text is displayed
      And the "plastic_option.label" textfield with "SIM-Karte (Triple SIM)" text is displayed
      And the "plastic_option.radiobutton" button is displayed
      And the "plastic_option.radiobutton" button is selected
      And the "esim_option.label" textfield with "eSIM (Fest im Gerät verbaut)" text is displayed
      And the "esim_option.radiobutton" button is displayed
      And the "plastic.title" textfield with "SIM-Karte" text is displayed
      And the "plastic.description" textfield with "Triple-SIM (3-in-1 für Micro-, Nano-, Standard-Slot)" text is displayed
      And the "esim.title" textfield with "eSIM" text is displayed
      And the "esim.description" textfield with "Fest im Gerät verbaut. Bitte prüfe, ob du ein eSIM-fähiges Gerät hast." text is displayed
      And the "sim_faq_entrypoint" entrypoint with "SIM FAQ" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-574904 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-195665
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G will see a "What is 5G SA" entrypoint at the bottom of the screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user is in the "Swap SIM Choose Type" page
     Then the "5gsa_info_entrypoint" entrypoint with "What is 5G SA" text is displayed

  @jira.QANOV-574905 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-574904
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G can access to the "What is 5G SA" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "5gsa_info_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Choose Type" page is displayed

  @jira.QANOV-420571 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195495 @jira.link.depends_on.QANOV-195496
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A prepay user can start the "Swap SIM" flow for an active or suspended SIM
    Only active or blocked SIMs will have the setting to Swap SIM.
    eSIM is only available for postpay user.
    Same flow for UDP and non-UDP postpay tariffs, only prices can change.
    Given user has a "prepay" account type
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
     Then the "Swap SIM Choose Type" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "SIM-Karten Typ wählen" text is displayed
      And the "description" textfield with "Wähle den passenden SIM-Karten Typ:" text is displayed
      And the "plastic_option.label" textfield with "SIM-Karte (Triple SIM)" text is displayed
      And the "plastic_option.radiobutton" button is displayed
      And the "plastic_option.radiobutton" button is selected
      And the "esim_option.label" textfield is not displayed
      And the "esim_option.radiobutton" button is not displayed
      And the "plastic.title" textfield with "SIM-Karte" text is displayed
      And the "plastic.description" textfield with "Triple-SIM (3-in-1 für Micro-, Nano-, Standard-Slot)" text is displayed
      And the "esim.title" textfield is not displayed
      And the "esim.description" textfield is not displayed
      And the "sim_faq_entrypoint" entrypoint with "SIM FAQ" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-195691 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195665 @jira.link.depends_on.QANOV-420571
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can access to the "SIM FAQ" screen from the "Swap SIM Choose Type" screen
    Given user has the "SIM FAQ" module configured in CMS for "SIM FAQ" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "sim_faq_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "FAQs" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Choose Type" page is displayed

  @jira.QANOV-195669 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-420571 @jira.link.detects.O2DE-3073
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A prepay user can access to the "Swap SIM Choose Reason" screen after selecting the SIM type
    List of reasons is provided by API.
    By Box7 limitations, Postpay lines only shows one reason: "Swap". Prepay lines will show the whole list of reasons.
    Given user has a "prepay" account type
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "continue_button" button
     Then the "Swap SIM Choose Reason" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "Wähle einen Grund für den SIM-Karten-Tausch:" text is displayed
      And the "reasons_list" list is displayed
      And each element in the "reasons_list" list has the "reason" field
      And each element in the "reasons_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-574906 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195665
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a SIM that supports 5GSA can access to the "Swap SIM Choose Reason" screen after selecting the SIM type
    List of reasons is provided by API.
    By Box7 limitations, Postpay lines only shows one reason: "Swap". Prepay lines will show the whole list of reasons.
    The page to select a reason for the sim swap won't be displayed when the SIM is not 5g SA capable.
    Given user has a "postpay" account type
      And user has a SIM that supports 5g
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "continue_button" button
     Then the "Swap SIM Choose Reason" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "Wähle einen Grund für den SIM-Karten-Tausch:" text is displayed
      And the "reasons_list" list is displayed
      And each element in the "reasons_list" list has the "reason" field
      And each element in the "reasons_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-195671 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195669 @jira.link.detects.O2DE-1395
  @manual @mobile @o2de @sanity
  Scenario: A prepay user with enough balance can access to the "Swap SIM Order Confirmation" screen for a plastic SIM
    The list of prices displayed comes from the API.
    For the Swap SIM flow, only the 'balance' payment method is allowed for prepay BOX7 users.
    If there is no contact phone number, the MSISDN field will not be displayed.
    Prepay users will not be able to change the contact email or shipping address from this screen.
    Given user has a "prepay" account type
      And user has enough balance to swap the SIM
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Alerts;Swap SIM Order Confirmation" modules configured in CMS for "Swap SIM Order Confirmation" page
      And the "Alerts" module configured in CMS for "Swap SIM Order Confirmation" page has a "insufficient-balance-to-swap-sim" preconfigured provider
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "alert" element is not on display
      And the "title" textfield with "Deine Bestellung" text is displayed
      And the "personal_details" module is displayed
      And the "personal_details.title" textfield with "PERSÖNLICHE DATEN" text is displayed
      And the "personal_details.account_holder_value" textfield is displayed
      And the "personal_details.account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "personal_details.contact_msisdn_value" textfield is displayed
      And the "personal_details.contact_msisdn_label" textfield with "Rufnummer" text is displayed
      And the "personal_details.email_address_value" textfield is displayed
      And the "personal_details.email_address_label" textfield is displayed
      And the "personal_details.email_address_chevron" icon is displayed
      And the "personal_details.shipping_address_value" textfield is displayed
      And the "personal_details.shipping_address_label" textfield with "Kontakt- & Lieferadresse" text is displayed
      And the "personal_details.shipping_address_chevron" icon is displayed
      And the "order_details" module is displayed
      And the "order_details.title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "order_details.current_balance_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "order_details.current_balance_label" textfield with "Aktuelles Guthaben" text is displayed
      And the "order_details.sim_line_value" textfield is displayed
      And the "order_details.sim_line_label" textfield with "Die neue SIM wird mit diesem Vertrag verknüpft" text is displayed
      And the "order_details.prices list" list is displayed
      And each element in the "order_details.prices list" list has the "name" field
      And each element in the "order_details.prices list" list has the "payment_type" textfield with the "(Einmalig|Monatlich) \(inkl. MwSt.\)" format
      And each element in the "order_details.prices list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB, die Leistungsbeschreibung sowie die gültige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "total_amount_name" textfield with "Gesamtkosten" text is displayed
      And the "total_amount_label" textfield with "Alle Preise inkl. MwSt." text is displayed
      And the "total_amount_oneshot_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_oneshot_label" textfield with "einmalig" text is displayed
      And the "total_amount_monthly_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_monthly_label" textfield with "monatlich" text is displayed
      And the "confirm_purchase_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-195673 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195669 @jira.link.detects.O2DE-1395 @manual
  @mobile @o2de @smoke
  Scenario: A prepay user without enough balance can access to the "Swap SIM Order Confirmation" screen for a plastic SIM
    It will be an alert with a title, a description and a "topup" button:
    - The title configured in CMS for this alert should be "Guthaben aufladen".
    - The description configured in CMS for this alert should be "Die Kosten werden von deinem Guthaben abgezogen. Bitte
    stelle sicher, dass ausreichend Guthaben vorhanden ist.".
    - The topup button will redirect to the Topup screen.
    - No "close" button will be displayed for this alert.
    The list of prices displayed comes from the API.
    For the Swap SIM flow, only the 'balance' payment method is allowed for prepay BOX7 users.
    If there is no contact phone number, the MSISDN field will not be displayed.
    Prepay users will not be able to change the contact email or shipping address from this screen.
    Given user has a "prepay" account type
      And user has not enough balance to swap the SIM
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Alerts;Swap SIM Order Confirmation" modules configured in CMS for "Swap SIM Order Confirmation" page
      And the "Alerts" module configured in CMS for "Swap SIM Order Confirmation" page has a "insufficient-balance-to-swap-sim" preconfigured provider
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "alert" element is on display
      And the "alert.title" textfield with "[CONTEXT:preconfigured_alert.title]" text is displayed
      And the "alert.description" textfield with the "[CONTEXT:preconfigured_alert.description]" format is displayed
      And the "alert.topup_button" button with "Zur Aufladung" text is displayed
      And the "alert.close_button" button is not displayed
      And the "title" textfield with "Deine Bestellung" text is displayed
      And the "personal_details" module is displayed
      And the "personal_details.title" textfield with "PERSÖNLICHE DATEN" text is displayed
      And the "personal_details.account_holder_value" textfield is displayed
      And the "personal_details.account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "personal_details.contact_msisdn_value" textfield is displayed
      And the "personal_details.contact_msisdn_label" textfield with "Rufnummer" text is displayed
      And the "personal_details.email_address_value" textfield is displayed
      And the "personal_details.email_address_label" textfield is displayed
      And the "personal_details.email_address_chevron" icon is displayed
      And the "personal_details.shipping_address_value" textfield is displayed
      And the "personal_details.shipping_address_label" textfield with "Kontakt- & Lieferadresse" text is displayed
      And the "personal_details.shipping_address_chevron" icon is displayed
      And the "order_details" module is displayed
      And the "order_details.title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "order_details.current_balance.insufficient_balance_tag" textfield with "Guthaben aufladen" text is displayed
      And the "order_details.current_balance_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "order_details.current_balance_label" textfield with "Aktuelles Guthaben" text is displayed
      And the "order_details.sim_line_value" textfield is displayed
      And the "order_details.sim_line_label" textfield with "Die neue SIM wird mit diesem Vertrag verknüpft" text is displayed
      And the "order_details.prices list" list is displayed
      And each element in the "order_details.prices list" list has the "name" field
      And each element in the "order_details.prices list" list has the "payment_type" textfield with the "(Einmalig|Monatlich) \(inkl. MwSt.\)" format
      And each element in the "order_details.prices list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB, die Leistungsbeschreibung sowie die gültige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "total_amount_name" textfield with "Gesamtkosten" text is displayed
      And the "total_amount_label" textfield with "Alle Preise inkl. MwSt." text is displayed
      And the "total_amount_oneshot_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_oneshot_label" textfield with "einmalig" text is displayed
      And the "total_amount_monthly_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_monthly_label" textfield with "monatlich" text is displayed
      And the "confirm_purchase_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-195675 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195673 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance taps on the alert link in "Swap SIM Order Confirmation" screen: a popup is displayed
    Given user has a "prepay" account type
      And user has not enough balance to swap the SIM
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Alerts;Swap SIM Order Confirmation" modules configured in CMS for "Swap SIM Order Confirmation" page
      And the "Alerts" module configured in CMS for "Swap SIM Order Confirmation" page has a "insufficient-balance-to-swap-sim" preconfigured provider
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "alert.topup_button" button
     Then the "Go To Topup Confirmation" popup is displayed
      And the "popup.title" textfield with "Guthaben aufladen" text is displayed
      And the "popup.message" textfield with "Nach der Aufladung kannst du eine Ersatz-SIM beantragen." text is displayed
      And the "popup.accept" button with the "(JETZT AUFLADEN|Jetzt aufladen)" format is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-195681 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195673 @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance cannot complete de SIM Swap flow: a popup is displayed
    Given user has a "prepay" account type
      And user has a "box7" account type
      And user has not enough balance to swap the SIM
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
     Then the "Go To Topup Confirmation" popup is displayed
      And the "popup.title" textfield with "Guthaben aufladen" text is displayed
      And the "popup.message" textfield with "Nach der Aufladung kannst du eine Ersatz-SIM beantragen." text is displayed
      And the "popup.accept" button with the "(JETZT AUFLADEN|Jetzt aufladen)" format is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-195677 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195675 @jira.link.depends_on.QANOV-195681
  @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance cancels to topup during the Swap SIM flow
    Given user has a "prepay" account type
      And user has not enough balance to swap the SIM
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Alerts;Swap SIM Order Confirmation" modules configured in CMS for "Swap SIM Order Confirmation" page
      And the "Alerts" module configured in CMS for "Swap SIM Order Confirmation" page has a "insufficient-balance-to-swap-sim" preconfigured provider
      And user is in the "Go To Topup Confirmation" popup
     When clicks on the "popup.cancel" button
     Then the "Swap SIM Order Confirmation" page is displayed

  @jira.QANOV-195679 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195675 @jira.link.depends_on.QANOV-195681
  @manual @mobile @o2de @regression
  Scenario: A prepay user without enough balance confirms to topup during the Swap SIM flow
    Given user has a "prepay" account type
      And user has not enough balance to swap the SIM
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Alerts;Swap SIM Order Confirmation" modules configured in CMS for "Swap SIM Order Confirmation" page
      And the "Alerts" module configured in CMS for "Swap SIM Order Confirmation" page has a "insufficient-balance-to-swap-sim" preconfigured provider
      And user is in the "Go To Topup Confirmation" popup
     When clicks on the "popup.accept" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed

  @jira.QANOV-214519 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-574906 @jira.link.detects.O2DE-1395
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @sanity
  Scenario: A postpay user with a SIM that supports 5g can access to the "Swap SIM Order Confirmation" screen for a plastic SIM
    The list of prices displayed comes from the API. The prices for UDP tariffs and non-UDP tariffs can be different.
    If there is no contact phone number, the MSISDN field will not be displayed.
    Postpay users will be able to change the contact email or shipping address from this screen.
    Depending of the 5g SA capability, the price might change accordingly. Coming from API.
    Given user has a "postpay" account type
      And user has a SIM that supports 5g
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "Deine Bestellung" text is displayed
      And the "personal_details" module is displayed
      And the "personal_details.title" textfield with "PERSÖNLICHE DATEN" text is displayed
      And the "personal_details.account_holder_value" textfield is displayed
      And the "personal_details.account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "personal_details.contact_msisdn_value" textfield is displayed
      And the "personal_details.contact_msisdn_label" textfield with "Rufnummer" text is displayed
      And the "personal_details.email_address_value" textfield is displayed
      And the "personal_details.email_address_label" textfield is displayed
      And the "personal_details.email_address_chevron" icon is displayed
      And the "personal_details.shipping_address_value" textfield is displayed
      And the "personal_details.shipping_address_label" textfield with "Kontakt- & Lieferadresse" text is displayed
      And the "personal_details.shipping_address_chevron" icon is displayed
      And the "order_details" module is displayed
      And the "order_details.title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "order_details.sim_line_value" textfield is displayed
      And the "order_details.sim_line_label" textfield with "Die neue SIM wird mit diesem Vertrag verknüpft" text is displayed
      And the "order_details.prices list" list is displayed
      And each element in the "order_details.prices list" list has the "name" field
      And each element in the "order_details.prices list" list has the "payment_type" textfield with the "(Einmalig|Monatlich) \(inkl. MwSt.\)" format
      And each element in the "order_details.prices list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB, die Leistungsbeschreibung sowie die gültige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "total_amount_name" textfield with "Gesamtkosten" text is displayed
      And the "total_amount_label" textfield with "Alle Preise inkl. MwSt." text is displayed
      And the "total_amount_oneshot_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_oneshot_label" textfield with "einmalig" text is displayed
      And the "total_amount_monthly_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_monthly_label" textfield with "monatlich" text is displayed
      And the "confirm_purchase_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-574907 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-195665
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a SIM that does not support 5g can access to the "Swap SIM Order Confirmation" screen for a plastic SIM
    The list of prices displayed comes from the API. The prices for UDP tariffs and non-UDP tariffs can be different.
    If there is no contact phone number, the MSISDN field will not be displayed.
    Postpay users will be able to change the contact email or shipping address from this screen.
    Depending of the 5g SA capability, the price might change accordingly. Coming from API.
    Given user has a "postpay" account type
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "Deine Bestellung" text is displayed
      And the "personal_details" module is displayed
      And the "personal_details.title" textfield with "PERSÖNLICHE DATEN" text is displayed
      And the "personal_details.account_holder_value" textfield is displayed
      And the "personal_details.account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "personal_details.contact_msisdn_value" textfield is displayed
      And the "personal_details.contact_msisdn_label" textfield with "Rufnummer" text is displayed
      And the "personal_details.email_address_value" textfield is displayed
      And the "personal_details.email_address_label" textfield is displayed
      And the "personal_details.email_address_chevron" icon is displayed
      And the "personal_details.shipping_address_value" textfield is displayed
      And the "personal_details.shipping_address_label" textfield with "Kontakt- & Lieferadresse" text is displayed
      And the "personal_details.shipping_address_chevron" icon is displayed
      And the "order_details" module is displayed
      And the "order_details.title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "order_details.sim_line_value" textfield is displayed
      And the "order_details.sim_line_label" textfield with "Die neue SIM wird mit diesem Vertrag verknüpft" text is displayed
      And the "order_details.prices list" list is displayed
      And each element in the "order_details.prices list" list has the "name" field
      And each element in the "order_details.prices list" list has the "payment_type" textfield with the "(Einmalig|Monatlich) \(inkl. MwSt.\)" format
      And each element in the "order_details.prices list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB, die Leistungsbeschreibung sowie die gültige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "total_amount_name" textfield with "Gesamtkosten" text is displayed
      And the "total_amount_label" textfield with "Alle Preise inkl. MwSt." text is displayed
      And the "total_amount_oneshot_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_oneshot_label" textfield with "einmalig" text is displayed
      And the "total_amount_monthly_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_monthly_label" textfield with "monatlich" text is displayed
      And the "confirm_purchase_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-214520 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-574906 @jira.link.detects.O2DE-1395
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @sanity
  Scenario: A postpay user with a SIM that supports 5g can access to the "Swap SIM Order Confirmation" screen for a eSIM
    The list of prices displayed comes from the API. The prices for UDP tariffs and non-UDP tariffs can be different.
    If there is no contact phone number, the MSISDN field will not be displayed.
    Postpay users will be able to change the contact email from this screen.
    Depending of the 5g SA capability, the price might change accordingly. Coming from API.
    Given user has a "postpay" account type
      And user has a SIM that supports 5g
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "esim_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "Deine Bestellung" text is displayed
      And the "personal_details" module is displayed
      And the "personal_details.title" textfield with "PERSÖNLICHE DATEN" text is displayed
      And the "personal_details.account_holder_value" textfield is displayed
      And the "personal_details.account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "personal_details.contact_msisdn_value" textfield is displayed
      And the "personal_details.contact_msisdn_label" textfield with "Rufnummer" text is displayed
      And the "personal_details.email_address_value" textfield is displayed
      And the "personal_details.email_address_label" textfield is displayed
      And the "personal_details.email_address_chevron" icon is displayed
      And the "personal_details.shipping_address_value" textfield is not displayed
      And the "personal_details.shipping_address_label" textfield is not displayed
      And the "personal_details.shipping_address_chevron" icon is not displayed
      And the "order_details" module is displayed
      And the "order_details.title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "order_details.sim_line_value" textfield is displayed
      And the "order_details.sim_line_label" textfield with "Die neue SIM wird mit diesem Vertrag verknüpft" text is displayed
      And the "order_details.prices list" list is displayed
      And each element in the "order_details.prices list" list has the "name" field
      And each element in the "order_details.prices list" list has the "payment_type" textfield with the "(Einmalig|Monatlich) \(inkl. MwSt.\)" format
      And each element in the "order_details.prices list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB, die Leistungsbeschreibung sowie die gültige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "total_amount_name" textfield with "Gesamtkosten" text is displayed
      And the "total_amount_label" textfield with "Alle Preise inkl. MwSt." text is displayed
      And the "total_amount_oneshot_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_oneshot_label" textfield with "einmalig" text is displayed
      And the "total_amount_monthly_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_monthly_label" textfield with "monatlich" text is displayed
      And the "confirm_purchase_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-574919 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-195665
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a SIM that does not support 5g can access to the "Swap SIM Order Confirmation" screen for a eSIM
    The list of prices displayed comes from the API. The prices for UDP tariffs and non-UDP tariffs can be different.
    If there is no contact phone number, the MSISDN field will not be displayed.
    Postpay users will be able to change the contact email from this screen.
    Depending of the 5g SA capability, the price might change accordingly. Coming from API.
    Given user has a "postpay" account type
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Choose Type" page
     When clicks on the "esim_option.radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "title" textfield with "Deine Bestellung" text is displayed
      And the "personal_details" module is displayed
      And the "personal_details.title" textfield with "PERSÖNLICHE DATEN" text is displayed
      And the "personal_details.account_holder_value" textfield is displayed
      And the "personal_details.account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "personal_details.contact_msisdn_value" textfield is displayed
      And the "personal_details.contact_msisdn_label" textfield with "Rufnummer" text is displayed
      And the "personal_details.email_address_value" textfield is displayed
      And the "personal_details.email_address_label" textfield is displayed
      And the "personal_details.email_address_chevron" icon is displayed
      And the "personal_details.shipping_address_value" textfield is not displayed
      And the "personal_details.shipping_address_label" textfield is not displayed
      And the "personal_details.shipping_address_chevron" icon is not displayed
      And the "order_details" module is displayed
      And the "order_details.title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "order_details.sim_line_value" textfield is displayed
      And the "order_details.sim_line_label" textfield with "Die neue SIM wird mit diesem Vertrag verknüpft" text is displayed
      And the "order_details.prices list" list is displayed
      And each element in the "order_details.prices list" list has the "name" field
      And each element in the "order_details.prices list" list has the "payment_type" textfield with the "(Einmalig|Monatlich) \(inkl. MwSt.\)" format
      And each element in the "order_details.prices list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB, die Leistungsbeschreibung sowie die gültige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "total_amount_name" textfield with "Gesamtkosten" text is displayed
      And the "total_amount_label" textfield with "Alle Preise inkl. MwSt." text is displayed
      And the "total_amount_oneshot_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_oneshot_label" textfield with "einmalig" text is displayed
      And the "total_amount_monthly_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "total_amount_monthly_label" textfield with "monatlich" text is displayed
      And the "confirm_purchase_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-268931 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-195673
  @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907
  @jira.link.depends_on.QANOV-574919 @manual @mobile @o2de @regression
  Scenario: A user with a verified contact email can see the "contact email" module in the "Swap SIM Order Confirmation" screen
    Given user has a "verified email" stored in the contact details
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Order Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "E-Mail-Adresse" text is displayed
      And the "email_address_chevron" icon is displayed

  @jira.QANOV-268932 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-195673
  @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907
  @jira.link.depends_on.QANOV-574919 @jira.link.detects.O2DE-3192 @manual @mobile @o2de @regression
  Scenario: A user with a not-verified contact email can see the "contact email" module in the "Swap SIM Order Confirmation" screen
    Given user has a "not verified email" stored in the contact details
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Order Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield with the "Nicht (hinterlegt/bestätigt)" format text is displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "email_address_chevron" icon is displayed

  @jira.QANOV-268933 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-195673
  @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907
  @jira.link.depends_on.QANOV-574919 @manual @mobile @o2de @regression
  Scenario: A user without a contact email can see the "contact email" module in the "Swap SIM Order Confirmation" screen
    Given user has a "no email" stored in the contact details
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Order Confirmation" page
     Then the "email_adddress" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with "Kontakt E-Mail" text is displayed
      And the "email_address_label" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "email_address_chevron" icon is displayed

  @jira.<jira_id> @android @jira.cv.14.2 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-195673
  @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907
  @jira.link.depends_on.QANOV-574919 @manual @mobile @o2de @regression
  Scenario Outline: A user can access to the "<legal_document>" legal document from the "Swap SIM Order Confirmation" screen on Android devices
    Given user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "<legal_document>" module configured in CMS for "<legal_document>" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "<link>" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Swap SIM Order Confirmation" page is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-195689 |
          | services_description_link | Services Description | QANOV-214523 |
          | price_list_link           | Price List           | QANOV-214524 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-214525 |

  @jira.<jira_id> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-195673
  @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907
  @jira.link.depends_on.QANOV-574919 @manual @mobile @o2de @regression
  Scenario Outline: A user can access to the "<legal_document>" legal document from the "Swap SIM Order Confirmation" screen on iOS devices
    Given user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "<legal_document>" module configured in CMS for "<legal_document>" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "<link>" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-297980 |
          | services_description_link | Services Description | QANOV-297981 |
          | price_list_link           | Price List           | QANOV-297982 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-297983 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195671 @manual @mobile
  @o2de
  Scenario Outline: A prepay user with enough balance and a <email_status> contact email confirms to swap the SIM: Swap SIM finished successfully
    Given user has a "prepay" account type
      And user has enough balance to swap the SIM
      And user has a "<email_status> email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
     Then the "Swap SIM Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine neue SIM wurde erfolgreich bestellt." text is displayed
      And the "success_message" textfield with "Den Bestellstatus deiner SIM kannst du jederzeit in deinem Profil unter Bestellungen einsehen." text is displayed
      And the "success_message2" textfield with "It has been paid with your balance." text is displayed
      And the "back_to_sim_management_button" button with "Zurück zur SIM-Verwaltung" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

    Examples:
          | email_status | test_priority | ber | jira_id      |
          | active       | smoke         | ber | QANOV-195693 |
          | not verified | regression    |     | QANOV-268939 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214519
  @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919
  @jira.link.detects.O2DE-1399 @jira.link.detects.O2DE-2782 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de
  Scenario Outline: A postpay user with a <email_status> contact email confirms to swap the SIM: Swap SIM finished successfully
    Given user has a "postpay" account type
      And user has a "<email_status> email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "confirm_purchase_button" button
     Then the "Swap SIM Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karten Bestellung" text is displayed
      And the "success_message" textfield with "Den Bestellstatus deiner SIM kannst du jederzeit in deinem Profil unter Bestellungen einsehen." text is displayed
      And the "back_to_sim_management_button" button with "Zurück zur SIM-Verwaltung" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

    Examples:
          | email_status | test_priority | ber | parent_test_plan | jira_id      |
          | active       | smoke         | ber | QANOV-555760     | QANOV-214536 |
          | not verified | regression    |     |                  | QANOV-268941 |

  @jira.QANOV-268940 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-195671 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without contact email taps to pay the swap SIM request: a warning popup is displayed
    Given user has a "prepay" account type
      And user has enough balance to swap the SIM
      And user has a "no email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Füge eine Adresse hinzu, um eine Bestätigung per E-Mail zu erhalten." text is displayed
      And the "popup.cancel" button with the "(E-Mail hinzufügen|E-MAIL HINZUFÜGEN)" format is displayed
      And the "popup.accept" button with the "(Jetzt nicht|JETZT NICHT)" format is displayed

  @jira.QANOV-268942 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520
  @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919 @jira.link.parent_test_plan.QANOV-386653 @manual
  @mobile @o2de @regression
  Scenario: A postpay user without contact email taps to pay the swap SIM request: a warning popup is displayed
    Given user has a "postpay" account type
      And user has a "no email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "confirm_purchase_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Füge eine Adresse hinzu, um eine Bestätigung per E-Mail zu erhalten." text is displayed
      And the "popup.cancel" button with the "(E-Mail hinzufügen|E-MAIL HINZUFÜGEN)" format is displayed
      And the "popup.accept" button with the "(Jetzt nicht|JETZT NICHT)" format is displayed

  @jira.QANOV-268943 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-195671 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without contact email can cancel the swap SIM request
    Given user has a "prepay" account type
      And user has enough balance to swap the SIM
      And user has a "no email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed

  @jira.QANOV-268944 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520
  @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919 @jira.link.parent_test_plan.QANOV-386653 @manual
  @mobile @o2de @regression
  Scenario: A postpay user without contact email can cancel the swap SIM request
    Given user has a "postpay" account type
      And user has a "no email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "confirm_purchase_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed

  @jira.QANOV-268945 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-195671 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and without contact email can request to swap SIM successfully without adding the email
    Given user has a "prepay" account type
      And user has enough balance to swap the SIM
      And user has a "no email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Swap SIM Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karten Bestellung" text is displayed
      And the "success_message" textfield with "Den Bestellstatus deiner SIM kannst du jederzeit in deinem Profil unter Bestellungen einsehen." text is displayed
      And the "back_to_sim_management_button" button with "Zurück zur SIM-Verwaltung" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

  @jira.QANOV-268946 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520
  @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919 @jira.link.parent_test_plan.QANOV-386653 @manual
  @mobile @o2de @regression
  Scenario: A postpay user without contact email can request to swap SIM successfully without adding the email
    Given user has a "postpay" account type
      And user has a "no email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "confirm_purchase_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Swap SIM Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karten Bestellung" text is displayed
      And the "success_message" textfield with "Den Bestellstatus deiner SIM kannst du jederzeit in deinem Profil unter Bestellungen einsehen." text is displayed
      And the "back_to_sim_management_button" button with "Zurück zur SIM-Verwaltung" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195693 @jira.link.depends_on.QANOV-214536
  @jira.link.depends_on.QANOV-268945 @jira.link.depends_on.QANOV-268946 @jira.link.parent_test_plan.QANOV-386653 @manual
  @mobile @o2de @regression
  Scenario Outline: A user who finished the Swap SIM successfully can tap on the "<button_name>" button in the Success Feedback screen
    Given user has the "Swap SIM Success Feedback" module configured in CMS for "Swap SIM Success Feedback" page
      And user is in the "Swap SIM Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed

    Examples:
          | button_name            | button_id                     | destination_page | jira_id      |
          | Back to SIM Management | back_to_sim_management_button | SIM Details      | QANOV-195695 |
          | Back to dashboard      | back_to_dashboard_button      | Account          | QANOV-195696 |

  @jira.QANOV-195698 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195671 @manual @mobile @o2de @regression
  Scenario: A prepay user with enough balance and a contact email confirms to swap the SIM but an error happens: Swap SIM finished unsuccessfully
    Given user has a "prepay" account type
      And user has enough balance to swap the SIM
      And user has a "email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Error Feedback" module configured in CMS for "Swap SIM Error Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.swap_sim_entrypoint" entrypoint
      And the "Swap SIM Choose Type" page is displayed
      And clicks on the "plastic_option.radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Swap SIM Choose Reason" page is displayed
      And clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
      And there is an error requesting to swap the sim
     Then the "Swap SIM Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "SIM-Karte konnte nicht bestellt werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

  @jira.QANOV-214537 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214519 @jira.link.depends_on.QANOV-214520
  @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919 @jira.link.parent_test_plan.QANOV-386653 @manual
  @mobile @o2de @regression
  Scenario: A postpay user with a contact email confirms to swap the SIM but an error happens: Swap SIM finished unsuccessfully
    Given user has a "postpay" account type
      And user has a "email" stored in the contact details
      And user has the "Swap SIM Choose Reason" module configured in CMS for "Swap SIM Choose Reason" page
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Swap SIM Error Feedback" module configured in CMS for "Swap SIM Error Feedback" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "confirm_purchase_button" button
      And there is an error requesting to swap the sim
     Then the "Swap SIM Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "SIM-Karte konnte nicht bestellt werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

  @jira.QANOV-195700 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195698 @jira.link.depends_on.QANOV-214537
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can go back to the dashboard from the "Swap SIM Error Feedback" screen
    Given user has the "Swap SIM Error Feedback" module configured in CMS for "Swap SIM Error Feedback" page
      And user is in the "Swap SIM Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-195702 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195698 @jira.link.depends_on.QANOV-214537
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user who finished the Swap SIM unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Swap SIM Error Feedback" module configured in CMS for "Swap SIM Error Feedback" page
      And user is in the "Swap SIM Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed

  @jira.QANOV-195703 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-214519
  @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919
  @jira.link.detects.O2DE-3078 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can access to edit the shipping address from the "Swap SIM Order Confirmation" screen
    The shipping address section is only available if the user has selected a Plastic SIM.
    The "Shipping address" flow will be defined in the Profile folder.
    Given user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "shipping_address_chevron" icon
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed

  @jira.QANOV-195705 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195703 @jira.link.detects.O2DE-2987
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user goes back to the "Swap SIM Order Confirmation" screen after updating the shipping address
    The shipping address section is only available if the user has selected a Plastic SIM.
    User can choose between a physical address and a mailbox as a shipping address.
    NOTE: if the shipping address change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has a "any" address saved as the shipping address
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "shipping_address_chevron" icon
      And the "Shipping Address" page is displayed
      And updates the shipping address successfully
      And the "Shipping Address Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "shipping_address_value" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342545 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195703
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user updates the shipping address from the "Swap SIM Order Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The shipping address section is only available if the user has selected a Plastic SIM.
    The "Shipping address" flow will be defined in the Profile folder.
    User can choose between a physical address and a mailbox as a shipping address.
    Given user has a "any" address saved as the shipping address
      And user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "shipping_address_chevron" icon
      And the "Shipping Address" page is displayed
      And updates the shipping address but the confirmation takes too long
     Then the "Shipping Address Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden in Kürze übernommen." text is displayed
      And the "back_to_account_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed

  @jira.QANOV-342547 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-342545
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can go back to "Account" screen from the "Shipping Address Informative Feedback" screen
    Given user has the "Shipping Address Informative Feedback" module configured in CMS for "Shipping Address Informative Feedback" page
      And user is in the "Shipping Address Informative Feedback" page
     When clicks on the "back_to_account_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-268937 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-195671 @jira.link.depends_on.QANOV-214519
  @jira.link.depends_on.QANOV-214520 @jira.link.depends_on.QANOV-574907 @jira.link.depends_on.QANOV-574919
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can access to change the contact email from the "Swap SIM Order Confirmation" screen
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "email_address_chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed

  @jira.QANOV-342548 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268937
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user goes back to the "Swap SIM Order Confirmation" screen after updating the email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "email_address_chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Swap SIM Order Confirmation" page is displayed
      And the "Ersatz SIM-Karte" header is displayed
      And the "email_address_value" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342550 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268937
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user updates the contact email from the "Swap SIM Order Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Swap SIM Order Confirmation" module configured in CMS for "Swap SIM Order Confirmation" page
      And user is in the "Swap SIM Order Confirmation" page
     When clicks on the "email_address_chevron" icon
      And the "Email Contact" page is displayed
      And updates the contact email but the confirmation takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Die Verifizierung wird durchgeführt." text is displayed
      And the "info_message" textfield with "Bitte warte, bis die Verifizierung abgeschlossen ist." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Swap SIM Order Confirmation" page is displayed

  @jira.QANOV-342552 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-342550
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can go back to "Swap SIM Order Confirmation" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Swap SIM Order Confirmation" page is displayed

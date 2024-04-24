# -*- coding: utf-8 -*-
@jira.QANOV-214550
Feature: Order an additional SIM

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has a SIM in any of "active;in_preparation;activating" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page


  @jira.QANOV-387918 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-206017
  @jira.link.depends_on.QANOV-206018 @jira.link.depends_on.QANOV-206019 @jira.link.parent_test_plan.QANOV-386653 @manual
  @mobile @o2de @sanity @jira.link.detects.O2DE-3412
  Scenario: A multisim user with a UDP tariff can access to the "Sim Addition" flow for a SIM in in_preparation, activating or active status
    A postpay user cannot order more multicards than the allowed limit of multicards. The app does not know the maximum
    number of multicards. Then, we need to warn the user that if the process returns an error it could be because of this.
    User: 017623201255 / #NQT#tlfncD3
    Given user has a UDP tariff
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
     Then the "Sim Addition Choose Services" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed
      And the "title" textfield with "SIM-Karte wählen" text is displayed
      And the "description" textfield with "Abhängig davon, wofür du dein Gerät nutzen möchtest." text is displayed
      And the "alert" element is on display
      And the "alert.icon" icon is displayed
      And the "alert.title" textfield with "Das Hinzufügen von SIM-Karten ist begrenzt" text is displayed
      And the "alert.description" textfield with "Wenn du die vertragliche Höchstzahl von SIM-Karten überschritten hast, wird deine Anforderung abgelehnt." text is displayed
      And the "multicard_option.label" textfield with "Multicard (Daten, Anrufe, SMS)" text is displayed
      And the "multicard_option.radiobutton" button is displayed
      And the "multicard_option.radiobutton" button is selected
      And the "datacard_option.label" textfield with "Datacard (Nur Daten)" text is displayed
      And the "datacard_option.radiobutton" button is displayed
      And the "multicard_info.title" textfield with "Multicard" text is displayed
      And the "multicard_info.description" textfield with "2 GB Highspeed Datenvolumen inkl. EU-Roaming." text is displayed
      And the "multicard_info.description2" textfield with "Für die Apple Watch ist die Bestellung nur über die Apple Watch möglich." text is displayed
      And the "datacard_info.title" textfield with "Datacard (Keine Anrufe möglich)" text is displayed
      And the "datacard_info.description" textfield with "30 GB Highspeed-Datenvolumen inkl. EU-Roaming." text is displayed
      And the "sim_faq_entrypoint" entrypoint with "SIM FAQ" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-387919 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-206017
  @jira.link.depends_on.QANOV-206018 @jira.link.depends_on.QANOV-206019 @jira.link.detects.O2DE-3412
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim user with a non-UDP tariff can access to the "Sim Addition" flow for a SIM in in_preparation, activating or active status
    A postpay user cannot order more multicards than the allowed limit of multicards. The app does not know the maximum
    number of multicards. Then, we need to warn the user that if the process returns an error it could be because of this.
    A postpay user with a non-UDP tariff cannot order an extra Datacard.
    User: 017623201252 / #NQT#tlfncD3 (3 UPD lines: 4917623201258, 4917623201251, 4917623201255, 3 non-UPD lines: 4917621182774, 4917623201256, 4917623201252)
    Given user has a non-UDP tariff
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
     Then the "Sim Addition Choose Services" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed
      And the "title" textfield with "SIM-Karte wählen" text is displayed
      And the "description" textfield with "Abhängig davon, wfür du dein Gerät nutzen möchtest." text is displayed
      And the "alert" element is on display
      And the "alert.icon" icon is displayed
      And the "alert.title" textfield with "Das Hinzufügen von SIM-Karten ist begrenzt" text is displayed
      And the "alert.description" textfield with "Wenn du die vertragliche Höchstzahl von SIM-Karten überschritten hast, wird deine Anforderung abgelehnt." text is displayed
      And the "multicard_option.label" textfield with "Multicard (Daten, Anrufe, SMS)" text is displayed
      And the "multicard_option.radiobutton" button is displayed
      And the "multicard_option.radiobutton" button is selected
      And the "datacard_option.label" textfield is not displayed
      And the "datacard_option.radiobutton" button is not displayed
      And the "multicard_info.title" textfield with "Multicard" text is displayed
      And the "multicard_info.description" textfield with "2 GB Highspeed Datenvolumen inkl. EU-Roaming." text is displayed
      And the "multicard_info.description2" textfield with "Für die Apple Watch ist die Bestellung nur über die Apple Watch möglich." text is displayed
      And the "datacard_info.title" textfield is not displayed
      And the "datacard_info.description" textfield is not displayed
      And the "sim_faq_entrypoint" entrypoint with "SIM FAQ" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-214553 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214551 @jira.link.depends_on.QANOV-387918
  @jira.link.depends_on.QANOV-387919 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user can access to the "SIM FAQ" screen from the "Sim Addition Choose Services" screen
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "SIM FAQ" module configured in CMS for "SIM FAQ" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "sim_faq_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "FAQs" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Choose Services" page is displayed

  @jira.QANOV-387920 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-214551 @jira.link.depends_on.QANOV-387918
  @jira.link.depends_on.QANOV-387919 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim user can access to the "Sim Addition Choose Format" screen
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
     Then the "SIM addition Choose Format" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed
      And the "title" textfield with "SIM Typ wählen" text is displayed
      And the "description" textfield with "SIM-Karte (Triple SIM) oder eSIM" text is displayed
      And the "alert" element is on display
      And the "alert.icon" icon is displayed
      And the "alert.title" textfield with "Das Hinzufügen von SIM-Karten ist begrenzt" text is displayed
      And the "alert.description" textfield with "Wenn du die vertragliche Höchstzahl von SIM-Karten überschritten hast, wird deine Anforderung abgelehnt." text is displayed
      And the "plastic_option.label" textfield with "SIM-Karte (Triple SIM)" text is displayed
      And the "plastic_option.radiobutton" button is displayed
      And the "plastic_option.radiobutton" button is selected
      And the "esim_option.label" textfield with "eSIM (Fest im Gerät verbaut)" text is displayed
      And the "esim_option.radiobutton" button is displayed
      And the "plastic_info.title" textfield with "SIM-Karte" text is displayed
      And the "plastic_info.description" textfield with "Triple-SIM (3-in-1 für Micro-, Nano-, Standart- Slot)" text is displayed
      And the "esim_info.title" textfield with "eSIM" text is displayed
      And the "esim_info.description" textfield with "Fest in Gerät verbaut. Bitte prüfe, ob du ein eSIM-fähiges Gerät hast." text is displayed
      And the "sim_faq_entrypoint" entrypoint with "SIM FAQ" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-214556 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214554 @jira.link.depends_on.QANOV-387920
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user can access to the "SIM FAQ" screen from the "SIM addition Choose Format" screen
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "SIM FAQ" module configured in CMS for "SIM FAQ" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "sim_faq_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "FAQs" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Choose Format" page is displayed

  @jira.QANOV-214557 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214554 @jira.link.depends_on.QANOV-387920
  @jira.link.detects.O2DE-2923 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim user can access to the "Sim Addition Order Confirmation" screen for a pSIM
    The list of prices displayed comes from the API (prices can change for UDP and non-UDP tariffs).
    If there is no contact phone number, the MSISDN field will not be displayed.
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "plastic_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Sim Addition Order Confirmation" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed
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

  @jira.QANOV-214558 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214554 @jira.link.depends_on.QANOV-387920
  @jira.link.detects.O2DE-2923 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim user can access to the "Sim Addition Order Confirmation" screen for a eSIM
    The list of prices displayed comes from the API (prices can change for UDP and non-UDP tariffs).
    If there is no contact phone number, the MSISDN field will not be displayed.
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "esim_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Sim Addition Order Confirmation" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed
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

  @jira.<jira_id> @android @jira.cv.14.2 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario Outline: A user can access to the "<legal_document>" legal document from the "Sim Addition Order Confirmation" screen on Android devices
    Given user has installed the "Google Drive" app
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "<legal_document>" module configured in CMS for "<legal_document>" page
      And user is in the "Sim Addition Order Confirmation" page
     When clicks on the "<link>" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Sim Addition Order Confirmation" page is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-286705 |
          | services_description_link | Services Description | QANOV-286706 |
          | price_list_link           | Price List           | QANOV-286707 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-286708 |

  @jira.<jira_id> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.detects.<detects> @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario Outline: A user can access to the "<legal_document>" legal document from the "Sim Addition Order Confirmation" screen on iOS devices
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "<legal_document>" module configured in CMS for "<legal_document>" page
      And user is in the "Sim Addition Order Confirmation" page
     When clicks on the "<link>" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Order Confirmation" page is displayed

    Examples:
          | link                      | legal_document       | detects  | jira_id      |
          | terms_and_conditions_link | Terms And Conditions |          | QANOV-310367 |
          | services_description_link | Services Description | IOS-9144 | QANOV-310371 |
          | price_list_link           | Price List           |          | QANOV-310373 |
          | right_of_withdrawal_link  | Right Of Withdrawal  |          | QANOV-310376 |

  @jira.QANOV-268947 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user with a verified contact email can see the "contact email" module in the "Sim Addition Order Confirmation" screen
    Given user has a "verified email" stored in the contact details
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Addition Order Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "E-Mail-Adresse" text is displayed
      And the "email_address_chevron" icon is displayed

  @jira.QANOV-268948 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user with a not-verified contact email can see the "contact email" module in the "Sim Addition Order Confirmation" screen
    Given user has a "not verified email" stored in the contact details
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Addition Order Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield with "Not verified" text is displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "Please go to your inbox to verified your email, if not you will not receive any notification." text is displayed
      And the "email_address_chevron" icon is displayed

  @jira.QANOV-268949 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user without a contact email saved can see the "contact email" module in the "Sim Addition Order Confirmation" screen
    Given user has a "no email" stored in the contact details
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Addition Order Confirmation" page
     Then the "email_adddress" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with "Kontakt E-Mail" text is displayed
      And the "email_address_label" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "email_address_chevron" icon is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke @<ber>
  Scenario Outline: A multisim user with <email_status> email confirms to add an additional SIM: SIM request finished successfully
    Right now, if the user has exceed the maximum number of SIMs in his account, the app is showing a success message althought the
    SIM is not requested. For short term mitigation, we have added thhe message_1.
    Given user has a "<email_status> email" stored in the contact details
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "Sim Addition Success Feedback" module configured in CMS for "Sim Addition Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
     Then the "Sim Addition Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karten Bestellung" text is displayed
      And the "success_message1" textfield with "Multicard: Falls du die maximale Anzahl an Multicards erreicht hast, kannst du keine weitere Multicard bestellen." text is displayed
      And the "success_message2" textfield with "Den Bestellstatus deiner SIM kannst du jederzeit in deinem Profil unter Bestellungen einsehen." text is displayed
      And the "back_to_sim_management_button" button with "Zurück zur SIM-Verwaltung" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

    Examples:
          | email_status | ber | jira_id      |
          | active       | ber | QANOV-214564 |
          | not verified |     | QANOV-268951 |

  @jira.QANOV-268952 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user without contact email taps to pay for the additional SIM: a warning popup is displayed
    Given user has a "no email" stored in the contact details
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Füge eine Adresse hinzu, um eine Bestätigung per E-Mail zu erhalten." text is displayed
      And the "popup.cancel" button with the "(E-Mail hinzufügen|E-MAIL HINZUFÜGEN)" format is displayed
      And the "popup.accept" button with the "(Jetzt nicht|JETZT NICHT)" format is displayed

  @jira.QANOV-268953 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-268952 @jira.link.parent_test_plan.QANOV-386653
  @manual @mobile @o2de @regression
  Scenario: A multisim user without contact email can cancel the additional SIM request
    Given user has a "no email" stored in the contact details
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed

  @jira.QANOV-268954 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-268952 @jira.link.parent_test_plan.QANOV-386653
  @manual @mobile @o2de @regression
  Scenario: A multisim user without contact email can request the additional SIM successfully without adding the email
    Right now, if the user has exceed the maximum number of SIMs in his account, the app is showing a success message althought the
    SIM is not requested. For short term mitigation, we have added thhe message_1.
    Given user has a "no email" stored in the contact details
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "Sim Addition Success Feedback" module configured in CMS for "Sim Addition Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Sim Addition Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karten Bestellung" text is displayed
      And the "success_message1" textfield with "Multicard: Falls du die maximale Anzahl an Multicards erreicht hast, kannst du keine weitere Multicard bestellen." text is displayed
      And the "success_message2" textfield with "Den Bestellstatus deiner SIM kannst du jederzeit in deinem Profil unter Bestellungen einsehen." text is displayed
      And the "back_to_sim_management_button" button with "Zurück zur SIM-Verwaltung" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214564 @jira.link.depends_on.QANOV-268951
  @jira.link.depends_on.QANOV-268954 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user who requested to add an additional SIM successfully can tap on the "<button_name>" button in the Success Feedback screen
    Given user has the "Sim Addition Success Feedback" module configured in CMS for "Sim Addition Success Feedback" page
      And user is in the "Sim Addition Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed

    Examples:
          | button_name            | button_id                     | destination_page | jira_id      |
          | Back to SIM Management | back_to_sim_management_button | SIM Details      | QANOV-214565 |
          | Back to dashboard      | back_to_dashboard_button      | Account          | QANOV-214566 |

  @jira.QANOV-387921 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user with a contact email confirms to add an additional SIM but an error happens: SIM request finished unsuccessfully
    Given user has a "email" stored in the contact details
      And user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "Sim Addition Error Feedback" module configured in CMS for "Sim Addition Error Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "confirm_purchase_button" button
      And there is an error requesting to add an additional sim
     Then the "Sim Addition Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "SIM-Karte bestellen" text is displayed
      And the "error_message" textfield with "Du kannst online leider keine (weitere) SIM-Karte bestellen oder austauschen. Bitte wende d ich an die Hotline." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-214569 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-387921 @jira.link.parent_test_plan.QANOV-386653
  @manual @mobile @o2de @regression
  Scenario: A multisim user can go back to the dashboard from the "Sim Addition Error Feedback" screen
    Given user has the "Sim Addition Error Feedback" module configured in CMS for "Sim Addition Error Feedback" page
      And user is in the "Sim Addition Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-214571 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-387921 @jira.link.parent_test_plan.QANOV-386653
  @manual @mobile @o2de @regression
  Scenario: A multisim user who requested to add an additional SIM unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Sim Addition Error Feedback" module configured in CMS for "Sim Addition Error Feedback" page
      And user is in the "Sim Addition Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Sim Addition Order Confirmation" page is displayed
      And the "Zusatz-SIM" header is displayed

  @jira.QANOV-214572 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim user can access to edit the shipping address from the "Sim Addition Order Confirmation" screen
    The shipping address section is only available if the user has selected a Plastic SIM.
    The "Shipping address" flow will be defined in the Profile folder.
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "shipping_address_chevron" icon
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Order Confirmation" page is displayed

  @jira.QANOV-214573 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214572 @jira.link.detects.LOC-1276
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user can go back to the "Sim Addition Order Confirmation" screen after updating the shipping address
    The shipping address section is only available if the user has selected a Plastic SIM.
    The "Shipping address" flow will be defined in the Profile folder.
    NOTE: if the shipping address change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "shipping_address_chevron" icon
      And the "Shipping Address" page is displayed
      And updates the shipping address successfully
      And the "Shipping Address Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Sim Addition Order Confirmation" page is displayed
      And the "Zusatz-SIM" header is displayed
      And the "shipping_address_value" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342553 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214572
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user updates the shipping address from the "Sim Addition Order Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The shipping address section is only available if the user has selected a Plastic SIM.
    The "Shipping address" flow will be defined in the Profile folder.
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "shipping_address_chevron" icon
      And the "Shipping Address" page is displayed
      And updates the shipping address but the confirmation takes too long
     Then the "Shipping Address Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden in Kürze übernommen." text is displayed
      And the "back_to_account_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Order Confirmation" page is displayed

  @jira.QANOV-342554 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-342553
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can go back to "Account" screen from the "Shipping Address Informative Feedback" screen
    Given user has the "Shipping Address Informative Feedback" module configured in CMS for "Shipping Address Informative Feedback" page
      And user is in the "Shipping Address Informative Feedback" page
     When clicks on the "back_to_account_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-268950 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-214557 @jira.link.depends_on.QANOV-214558
  @jira.link.depends_on.QANOV-268949 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user can access to change the contact email from the "Sim Addition Order Confirmation" screen
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "email_address_chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And the "Zusatz-SIM bestellen" header is displayed

  @jira.QANOV-342555 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268950
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user goes backs to the "Sim Addition Order Confirmation" screen after updating the contact email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "email_address_chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Sim Addition Order Confirmation" page is displayed
      And the "email_address_value" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342556 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-268950
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim user changes the contact email from the "Sim Addition Order Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Sim Addition Choose Services" module configured in CMS for "Sim Addition Choose Services" page
      And user has the "Sim Addition Choose Format" module configured in CMS for "Sim Addition Choose Format" page
      And user has the "Sim Addition Order Confirmation" module configured in CMS for "Sim Addition Order Confirmation" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.order_additional_sim_entrypoint" entrypoint
      And the "Sim Addition Choose Services" page is displayed
      And clicks on the "continue_button" button
      And the "SIM addition Choose Format" page is displayed
      And clicks on the "continue_button" button
      And the "Sim Addition Order Confirmation" page is displayed
      And clicks on the "email_address_chevron" icon
      And the "Email Contact" page is displayed
      And updates the contact email but the confirmation takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Addition Order Confirmation" page is displayed

  @jira.QANOV-342557 @android @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-342556
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A user can go back to "Sim Addition Order Confirmation" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "back_to_account_button" button
     Then the "Account" page is displayed

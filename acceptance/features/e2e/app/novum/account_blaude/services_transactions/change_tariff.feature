# -*- coding: utf-8 -*-
@jira.QANOV-189971
Feature: Change Tariff

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.<jira_id> @<ber> @<execution_mode> @<priority> @android @blaude @cert3 @ios @jira.cv.13.9
  @jira.link.depends_on.QANOV-203575 @live @mobile @next
  Scenario Outline: A postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can change the tariff from the account dashboard
    Postpay users are taken to a webview in order to change or extend their tariffs
    Given user has a "postpay" account type
      And user <has_hasnot> a contract cancellation requested for a "mobile_line" product
      And user has a "mobile_line" tariff with the earliest possible extension date in the "<time>"
      And user has the matching subscription selected in the account
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

    @raitt_drop3
    Examples:
          | has_hasnot | time   | header  | priority | execution_mode | ber | jira_id      |
          | has not    | future | blau.de | smoke    | manual         |     | QANOV-203645 |

    Examples:
          | has_hasnot | time   | header  | priority   | execution_mode | ber | jira_id      |
          | has not    | past   | blau.de | smoke      | automatic      | ber | QANOV-203647 |
          | has        | future | TBD     | regression | manual         |     | QANOV-203651 |
          | has        | past   | TBD     | regression | manual         |     | QANOV-261520 |

  @jira.<jira_id> @<priority> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @manual @mobile
  Scenario Outline: A postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can change the tariff from the "My Tariff" screen
    Postpay users are taken to a webview in order to change or extend their tariffs
    Given user has a "postpay" account type
      And user <has_hasnot> a contract cancellation requested for a "mobile_line" product
      And user has a "mobile_line" tariff with the earliest possible extension date in the "<time>"
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "tariff_header.change_tariff_button" button
     Then the browser webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed

    Examples:
          | has_hasnot | time   | header | priority   | depends_on   | jira_id      |
          | has not    | future | TBD    | smoke      | QANOV-203581 | QANOV-203649 |
          | has not    | past   | TBD    | regression | QANOV-203582 | QANOV-203650 |
          | has        | future | TBD    | regression | QANOV-203583 | QANOV-203653 |
          | has        | past   | TBD    | regression | QANOV-260052 | QANOV-261521 |

  @jira.QANOV-189972 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.O2DE-1870
  @jira.link.detects.OBO2DE-137 @jira.link.detects.OBO2DE-390 @jira.link.detects.OBO2DE-702 @live @mobile @next
  @raitt_drop3 @sanity @webapp
  Scenario: A prepay user with an active product can access to the "Available Tariffs" screen from the "Account" screen
    The AKTIV label in blue color is rendered above the current tariff name.
    The tariff cards could show the renewal period.
    There are some prepay users who cannot change the tariff by some business rules (for these users, the product-offers
    API will not return any offer with category.id='tariff'). These users will not see the 'offered_tariffs_list' list.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user has the "Current Tariff;Offered Tariffs List" modules configured in CMS for "Available Tariffs" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
     Then the "Available Tariffs" page is displayed
      And the "Tarif wechseln" header is displayed
      And the "current_tariff" module is displayed
      And the "current_tariff.tag" textfield with "Dein aktueller Tarif" text is displayed
      And the "current_tariff.title" textfield is displayed
      And the "current_tariff.price_title" textfield with "Preis" text is displayed
      And the "current_tariff.price_subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "current_tariff.price_value" textfield with the "(\d+,\d\d €|Kostenlos)" format is displayed
      And the "offered_tariffs.list" list is displayed
      And each element in the "offered_tariffs.list" list has the "title" field
      And each element in the "offered_tariffs.list" list has the "price_title" textfield with "Preis" text
      And each element in the "offered_tariffs.list" list has the "price_subtitle" textfield with "(inkl. MwSt.)" text
      And each element in the "offered_tariffs.list" list has the "price_value" textfield with the "(\d+,\d\d €|Kostenlos)" format
      And each element in the "offered_tariffs.list" list has the "description" field
      And each element in the "offered_tariffs.list" list has the "button_primary" textfield with "Details" text

  @jira.QANOV-189973 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189972 @jira.link.detects.OBO2DE-137
  @jira.link.detects.OBO2DE-390 @manual @mobile @raitt_drop3 @smoke
  Scenario: A prepay user with an active product can access to the "Available Tariffs" screen from the "My Tariff" screen
    The AKTIV label in blue color is rendered above the current tariff name.
    The tariff cards could show the renewal period.
    There are some prepay users who cannot change the tariff by some business rules (for these users, the product-offers
    API will not return any offer with category.id='tariff'). These users will not see the 'offered_tariffs_list' list.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user has the "Current Tariff;Offered Tariffs List" modules configured in CMS for "Available Tariffs" page
      And user is in the "My Tariff" page
     When clicks on the "tariff_header.change_tariff_button" button
     Then the "Available Tariffs" page is displayed
      And the "Tarif wechseln" header is displayed
      And the "current_tariff" module is displayed
      And the "current_tariff.status_tag" textfield with "Dein aktueller Tarif" text is displayed
      And the "current_tariff.name" textfield is displayed
      And the "current_tariff.price_title" textfield with "Preis" text is displayed
      And the "current_tariff.price_subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "current_tariff.price_value" textfield with the "(\d+,\d\d €|Kostenlos)" format is displayed
      And the "offered_tariffs_list" list is displayed
      And each element in the "offered_tariffs_list" list has the "name" field
      And each element in the "offered_tariffs_list" list has the "price_title" textfield with "Preis" text
      And each element in the "offered_tariffs_list" list has the "price_subtitle" textfield with "(inkl. MwSt.)" text
      And each element in the "offered_tariffs_list" list has the "price_value" textfield with the "(\d+,\d\d €|Kostenlos)" format
      And each element in the "offered_tariffs_list" list has the "description" field
      And each element in the "offered_tariffs_list" list has the "select_tariff_button" textfield with "Details" text
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed

  @jira.QANOV-189974 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189972
  @jira.link.depends_on.QANOV-189973 @jira.link.detects.O2DE-1867 @jira.link.detects.O2DE-1868
  @jira.link.detects.O2DE-2786 @live @mobile @next @raitt_drop3 @smoke @webapp
  Scenario: A prepay user can select a tariff
    Tariff could display (provided by API):
    - tariff name
    - tariff price
    - renewal period
    - other details
    - button to continue
    The description is not tappeable.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "button_primary" button of any element of the "offered_tariffs.list" list
     Then the "Selected Tariff" page is displayed
      And the "Details zum Tarif" header is displayed
      And the "header.title" textfield is displayed
      And the "tariff_price.title" textfield with "Preis" text is displayed
      And the "tariff_price.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "tariff_price.value" textfield with the "(\d+,\d\d €|Kostenlos)" format is displayed
      And the "renewal_period.title" textfield with "Laufzeit" text is displayed
      And the "renewal_period.subtitle" textfield with "(autom. Verlängerung)" text is displayed
      And the "renewal_period.value" textfield with the "\d+ (Tage|Wochen|Monat)" format is displayed
      And the "details_title" textfield with "DETAILS" text is displayed
      And the "details_description" textfield is displayed
      And the "continue_button" button with "Zahlungsmethode wählen" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189972 @manual @mobile @raitt_drop3
  @regression
  Scenario Outline: A prepay user can close "Selected Tariff" screen and go back to "<initial_page>" screen
    This scenario starts the flow to reach the "Selected Tariff" screen from "Account" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "<module>" module configured in CMS for "<initial_page>" page
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user is in the "<initial_page>" page
     When clicks on the "<change_tariff_button>" button
      And the "Available Tariffs" page is displayed
      And clicks on the "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "<initial_page>" page is displayed

    Examples:
          | initial_page | module        | change_tariff_button               | depends_on   | jira_id      |
          | Account      | Tariff Card   | tariff_card.button_primary         | QANOV-189972 | QANOV-189975 |
          | My Tariff    | Tariff Header | tariff_header.change_tariff_button | QANOV-189973 | QANOV-189976 |

  @jira.QANOV-189981 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189974
  @jira.link.parent_test_plan.QANOV-402198 @live @mobile @next @raitt_drop3 @smoke @webapp
  Scenario: A prepay user with bank account in "activated" status can access the "Tariff Payment Method" screen
    For BOX7 users, the last digits of the bank account will be displayed.
    For RAITT users, the last digits of the 'first' bank account will be displayed.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has "bank_account" service in "activated" status
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "button_primary" button of any element of the "offered_tariffs.list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
     Then the "Tariff Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed
      And the "header.title" textfield with "Womit möchtest du zahlen?" text is displayed
      And the "header.description" textfield with "Du kannst deinen neuen Tarif über deine Bankverbindung oder dein aktuelles Guthaben bezahlen." text is displayed
      And the "tariff.title" textfield is displayed
      And the "tariff.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "tariff.value" textfield with the "\d+,\d\d €" format is displayed
      And the "payment_methods_title" textfield with "ZAHLUNGSMETHODEN" text is displayed
      And the "payment_methods.balance_title" textfield with "Aktuelles Guthaben" text is displayed
      And the "payment_methods.balance_amount" textfield with the "^\d+,\d\d €( \(Aufladung notwendig\))?$" format is displayed
      And the "payment_methods.bankaccount_title" textfield with "Bankverbindung" text is displayed
      And the "payment_methods.bankaccount_number" textfield with the "^[A-Z]{2}\*+\d{4}$" format is displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-189983 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189974 @manual @mobile @raitt_drop3
  @smoke
  Scenario: A prepay user without bank account can access the "Tariff Payment Method" screen
    Tag "Deactivated" is displayed in the place of the bank account
    Tapping on the chevron close to the "Deactivated" label takes the user to the bank account activation process
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user does not have bank account
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user is in the "Selected Tariff" page
     When clicks on the "continue_button" button
     Then the "Tariff Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed
      And the "tariff_payment_methods" module is displayed
      And the "title_textfield" textfield with "Womit möchtest du zahlen?" text is displayed
      And the "description_textfield" textfield with "Du kannst deinen neuen Tarif über deine Bankverbindung oder dein aktuelles Guthaben bezahlen" text is displayed
      And the "tariff.name_label" textfield is displayed
      And the "tariff.price_sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "tariff.price_value" textfield with the "\d+,\d\d €" format is displayed
      And the "payment_methods.title" textfield with "ZAHLUNGSMETHODEN" text is displayed
      And the "payment_methods.balance_title" textfield with "Aktuelles Guthaben" text is displayed
      And the "payment_methods.balance_amount" textfield with the "^\d+,\d\d €( \(Aufladung notwendig\))?$" format is displayed
      And the "payment_methods.balance_radiobutton" button is displayed
      And the "payment_methods.bankaccount_tag" textfield with "Nicht hinterlegt" text is displayed
      And the "payment_methods.bankaccount_title" textfield with "Bankverbindung" text is displayed
      And the "payment_methods.bankaccount_number" textfield is not displayed
      And the "payment_methods.bankaccount_radiobutton" button is not displayed
      And the "payment_methods.bankaccount_chevron" icon is displayed
      And the "bankaccount_info.title" textfield with "Bankverindung einrichten" text is displayed
      And the "bankaccount_info.description" textfield with "Guthaben aufladen leicht gemacht. Laden dein Guthaben bequem per Bankeinzug auf. Hinterlege hierfür einfach deine Bankverbindung." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-532739 @android @blaude @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-189974 @manual @mobile @regression
  Scenario: A prepay user with bank account in "pending" status can access the "Tariff Payment Method" screen
    The chevron icon is not displayed because the users won't be able to access the "Bank Account" screen when it is in
    pending status.
    To test on QA: prepay07
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has "bank_account" service in "pending" status
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user is in the "Selected Tariff" page
     When clicks on the "continue_button" button
     Then the "Tariff Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed
      And the "tariff_payment_methods" module is displayed
      And the "title_textfield" textfield with "Womit möchtest du zahlen?" text is displayed
      And the "description_textfield" textfield with "Du kannst deinen neuen Tarif über deine Bankverbindung oder dein aktuelles Guthaben bezahlen" text is displayed
      And the "tariff.name_label" textfield is displayed
      And the "tariff.price_sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "tariff.price_value" textfield with the "\d+,\d\d €" format is displayed
      And the "payment_methods.title" textfield with "ZAHLUNGSMETHODEN" text is displayed
      And the "payment_methods.balance_title" textfield with "Aktuelles Guthaben" text is displayed
      And the "payment_methods.balance_amount" textfield with the "^\d+,\d\d €( \(Aufladung notwendig\))?$" format is displayed
      And the "payment_methods.balance_radiobutton" button is displayed
      And the "payment_methods.bankaccount_tag" textfield with "Kurzfristige Sperre nach Erstnutzung" text is displayed
      And the "payment_methods.bankaccount_title" textfield with "Bankverbindung" text is displayed
      And the "payment_methods.bankaccount_number" textfield with the "^[A-Z]{2}\*+\d{4}$" format is displayed
      And the "payment_methods.bankaccount_radiobutton" button is not displayed
      And the "payment_methods.bankaccount_chevron" icon is not displayed
      And the "continue_button" button with "Weiter" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-189984 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189982 @manual @mobile @raitt_drop3
  @regression
  Scenario: A prepay user without enough balance to change the tariff sees a message in "Tariff Payment Methods" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has not enough balance to purchase "any" tariff
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user is in the "Available Tariffs" page
     When clicks on the "select_tariff_button" button of the eligible tariff to purchase
      And the "Tariff Payment Methods" page is displayed
     Then the "payment_methods.balance_amount" textfield that contains the "(Aufladung notwendig)" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189981
  @jira.link.depends_on.QANOV-189982 @jira.link.depends_on.QANOV-189983 @jira.link.depends_on.QANOV-532739 @manual @mobile
  @raitt_drop3 @regression
  Scenario Outline: A prepay user can close the "Tariff Payment Method" screen and go back to "<initial_page>" screen
    The scenario gets back to the point where it started, at "<initial_page>" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "<module>" module configured in CMS for "<initial_page>" page
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user is in the "<initial_page>" page
     When clicks on the "<change_tariff_button>" button
      And the "Available Tariffs" page is displayed
      And clicks on "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "<initial_page>" page is displayed

    Examples:
          | initial_page | change_tariff_button               | module        | jira_id      |
          | Account      | tariff_card.button_primary         | Tariff Card   | QANOV-189985 |
          | My Tariff    | tariff_header.change_tariff_button | Tariff Header | QANOV-189986 |

  @jira.QANOV-420474 @android @automatic @ber @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-189981
  @jira.link.parent_test_plan.QANOV-402198 @mobile @raitt_drop3 @smoke @webapp
  Scenario: A prepay user decides to pay the tariff change with his/her bank account: the "Order confirmation" screen is displayed
    Tariffs with EECC flag will display:
    - a "legal_documents_textfield" textfield with 5 links.
    - an additional paragraph under the "legal_documents_textfield" textfield.
    Tariffs without EECC flag will display:
    - a "legal_documents_textfield" textfield with 4 links (the eecc link is not displayed).
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has "bank_account" service in "activated" status
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "button_primary" button of any element of the "offered_tariffs.list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Tariff Order Confirmation" page is displayed
      And the "Bestellbestätigung" header is displayed
      And the "legal_info_title" textfield with "GESETZLICHE PFLICHTINFORMATIONEN" text is displayed
      And the "legal_info_description" textfield that contains the "Informationen zur Verarbeitung von personenbezogenen Daten im Rahmen eines Blau-Telekommunikationsvertrages und deinen Betroffenenrechten werden im " text is displayed
      And the "legal_info_link" link with "Datenschutzmerkblatt" text is displayed
      And the "your_order_title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "your_order.title" textfield is displayed
      And the "your_order.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "your_order.value" textfield with the "\d+,\d\d €" format is displayed
      And the "legal_documents_textfield" textfield is displayed
      And the "change_tariff_button" button with "Jetzt kostenpflichtig bestellen" text is displayed

  @jira.QANOV-403561 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-189981
  @jira.link.depends_on.QANOV-189982 @jira.link.depends_on.QANOV-189983 @jira.link.parent_test_plan.QANOV-402198 @manual
  @mobile @raitt_drop3 @smoke
  Scenario: A prepay user with enough balance decides to pay the tariff change with his/her balance: the "Order confirmation" screen is displayed
    Users without enough balance cannot change the tariff.
    Tariffs with EECC flag will display:
    - a "legal_documents_textfield" textfield with 5 links.
    - an additional paragraph under the "legal_documents_textfield" textfield.
    Tariffs without EECC flag will display:
    - a "legal_documents_textfield" textfield with 4 links (the eecc link is not displayed).
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has enough balance to purchase tariffs
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Tariff Order Confirmation" page is displayed
      And the "Bestellbestätigung" header is displayed
      And the "legal_info.title" textfield with "GESETZLICHE PFLICHTINFORMATIONEN" text is displayed
      And the "legal_info.description" textfield with "Informationen zur Verarbeitung von personenbezogenen Daten im Rahmen eines Blau-Telekommunikationsvertrages und deinen Betroffenenrechten werden im Datenschutzmerkblatt für Kunden bereitgestellt." text is displayed
      And the "legal_info.link" link with "Datenschutzmerkblatt" text is displayed
      And the "your_order_title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "your_order.tariff_name" textfield is displayed
      And the "your_order.tariff_label" textfield with "(inkl. MwSt.)" text is displayed
      And the "your_order.tariff_price" textfield with the "\d+,\d\d €" format is displayed
      And the "legal_documents_textfield" textfield is displayed
      And the "change_tariff_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-403562 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-189981
  @jira.link.depends_on.QANOV-189982 @jira.link.depends_on.QANOV-189983 @jira.link.parent_test_plan.QANOV-402198 @manual
  @mobile @raitt_drop3 @regression
  Scenario: A prepay user without enough balance decides to pay the tariff change with his/her balance: a popup is displayed
    Users without enough balance cannot change the tariff.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has not enough balance to purchase tariffs
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Go To Topup Confirmation" popup is displayed
      And the "popup.title" textfield with "Guthaben aufladen" text is displayed
      And the "popup.message" textfield with "Sobald dein Guthaben aufgeladen wurde, kannst du mit der Tarifwechsel fortfahren" text is displayed
      And the "popup.accept" button with the "(JETZT AUFLADEN|Jetzt aufladen)" format is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed
      And clicks on the "popup.cancel" button
      And the "Tariff Payment Methods" page is displayed

  @jira.QANOV-403563 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-403562
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user without enough balance goes to the Topup screen from the change tariff flow
    Users without enough balance cannot change the tariff.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has not enough balance to purchase tariffs
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Go To Topup Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Topup" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Payment Methods" page is displayed

  @jira.QANOV-420476 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-403561
  @jira.link.depends_on.QANOV-420474 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user can see an EECC link and an additional text when selecting a tariff with EECC flag
    Tariffs with EECC flag (terms of contract) will display:
    - a "legal_documents_textfield" textfield with 5 links.
    - an additional paragraph under the "legal_documents_textfield" textfield.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has selected a tariff with eecc flag
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     Then the "legal_documents_textfield" textfield with "Die Bestellung erfolgt auf Grundlage der AGB, der Leistungsbeschreibung, der Preisliste sowie der Vertragszusammenfassung. Dir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "contract_summary_link" link with "Vertragszusammenfassung" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "additional_textfield" textfield with "Die vorgenannten Dokumente haben wir dir per E-Mail übersandt sowie in deiner Postbox unter Deine Vertragsunterlagen zur Verfügung gestellt. Wenn du auf dieser Grundlage bestellen möchtest, klicke jetzt auf Kostenpflichtig bestellen." text is displayed

  @jira.QANOV-420477 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-403561
  @jira.link.depends_on.QANOV-420474 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user cannot see an EECC link or an additional text when selecting a tariff without EECC flag
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has selected a tariff without eecc flag
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     Then the "legal_documents_textfield" textfield with "Die Bestellung erfolgt auf Grundlage der AGB, der Leistungsbeschreibung, der Preisliste. Dir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "additional_textfield" textfield is not displayed

  @jira.QANOV-189980 @TBD @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-189987
  @jira.link.depends_on.QANOV-189988 @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420474
  @jira.link.depends_on.QANOV-420475 @jira.link.detects.O2DE-3708 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @raitt_drop3 @regression
  Scenario: A prepay user can access to the legal info link from the "Tariff Order confirmation" screen on Android devices
    Link: https://static2-blau.o9.de/resource/blob/9334/56265758f7efe1a15114d1ceafda46b8/datenschutzmerkblatt-telefonica-pdf-download-data.pdf
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has installed the "Google Drive" app
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     When clicks on the "legal_info.link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "TBD.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Order Confirmation" page is displayed

  @jira.QANOV-292091 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189987 @jira.link.depends_on.QANOV-189988
  @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420474 @jira.link.depends_on.QANOV-420475
  @jira.link.detects.O2DE-3708 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user can access to the legal info link from the "Tariff Order confirmation" screen on iOS devices
    Link: https://static2-blau.o9.de/resource/blob/9334/56265758f7efe1a15114d1ceafda46b8/datenschutzmerkblatt-telefonica-pdf-download-data.pdf
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has installed the "Google Drive" app
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     When clicks on the "legal_info.link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Order Confirmation" page is displayed

  @jira.<jira_id> @TBD @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-189987
  @jira.link.depends_on.QANOV-189988 @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420474
  @jira.link.depends_on.QANOV-420475 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A prepay user can access to the "<legal_document>" legal document from the "Tariff Order Confirmation" screen on Android devices
    BLAU BOX7 links: TBD
    BLAU RAITT links:
    - AGB --> https://www.o2online.de/app/o2-app/agb-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=blau_agb_prepaid&utm_term=navigation_service_information_other&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ablau_agb_prepaid%7Cct%3Anavigation_service_information_other
    - Leistungsbeschreibung --> https://o2.de/produktinformationsblatt?utm_source=native&utm_medium=nf_app_novum&utm_campaign=pp_produktinformationsblatt&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3App_produktinformationsblatt%7Cct%3Anavigation_service_information_tariff
    - Preisliste --> https://www.o2online.de/app/o2-app/pl-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=preisliste_prepaid&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Apreisliste_prepaid%7Cct%3Anavigation_service_information_tariff
    - Widerrufsrecht --> https://www.o2online.de/app/o2-app/wr-postpaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=o2_widerrufsbelehrung&utm_term=navigation_service_move-and-change_vertrag&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ao2_widerrufsbelehrung%7Cct%3Anavigation_service_move-and-change_vertrag
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has installed the "Google Drive" app
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     When clicks on the "<link>" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "TBD.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Order Confirmation" page is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-189989 |
          | services_description_link | Services Description | QANOV-189990 |
          | price_list_link           | Price List           | QANOV-189991 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-189992 |

  @jira.<jira_id> @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189987 @jira.link.depends_on.QANOV-189988
  @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420474 @jira.link.depends_on.QANOV-420475
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A prepay user can access to the "<legal_document>" legal document from the "Tariff Order Confirmation" screen on iOS devices
    BLAU BOX7 links: TBD
    BLAU RAITT links:
    - AGB --> https://www.o2online.de/app/o2-app/agb-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=blau_agb_prepaid&utm_term=navigation_service_information_other&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ablau_agb_prepaid%7Cct%3Anavigation_service_information_other
    - Leistungsbeschreibung --> https://o2.de/produktinformationsblatt?utm_source=native&utm_medium=nf_app_novum&utm_campaign=pp_produktinformationsblatt&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3App_produktinformationsblatt%7Cct%3Anavigation_service_information_tariff
    - Preisliste --> https://www.o2online.de/app/o2-app/pl-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=preisliste_prepaid&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Apreisliste_prepaid%7Cct%3Anavigation_service_information_tariff
    - Widerrufsrecht --> https://www.o2online.de/app/o2-app/wr-postpaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=o2_widerrufsbelehrung&utm_term=navigation_service_move-and-change_vertrag&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ao2_widerrufsbelehrung%7Cct%3Anavigation_service_move-and-change_vertrag
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     When clicks on the "<link>" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-292092 |
          | services_description_link | Services Description | QANOV-292093 |
          | price_list_link           | Price List           | QANOV-292094 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-292095 |

  @jira.QANOV-420478 @TBD @android @blaude @jira.cv.14.8 @jira.link.depends_on.QANOV-420476
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user who selected a tariff with EECC flag can access to the "Contract summary" legal document from the "Tariff Order Confirmation" screen on Android devices
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has selected a tariff with eecc flag
      And user has installed the "Google Drive" app
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     When clicks on the "contract_summary_link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "TBD.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tariff Order Confirmation" page is displayed

  @jira.QANOV-420479 @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420476
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user who selected a tariff with EECC flag can access to the "Contract summary" legal document from the "Tariff Order Confirmation" screen on iOS devices
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has selected a tariff with eecc flag
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "Tariff Order Confirmation" page
     When clicks on the "contract_summary_link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189987
  @jira.link.depends_on.QANOV-189988 @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420474
  @jira.link.depends_on.QANOV-420475 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A prepay user can close the "Tariff Order Confirmation" screen and go back to "<initial_page>" screen
    The scenario gets back to the point where it started, at "<initial_page>" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "<module>" module configured in CMS for "<initial_page>" page
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user is in the "<initial_page>" page
     When clicks on the "<change_tariff_button>" button
      And the "Available Tariffs" page is displayed
      And clicks on "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "<initial_page>" page is displayed

    Examples:
          | initial_page | change_tariff_button               | module        | jira_id      |
          | Account      | tariff_card.button_primary         | Tariff Card   | QANOV-189995 |
          | My Tariff    | tariff_header.change_tariff_button | Tariff Header | QANOV-189998 |

  @jira.QANOV-189993 @android @automatic @ber @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-189987
  @jira.link.depends_on.QANOV-420474 @jira.link.detects.O2DE-1872 @jira.link.detects.OBO2DE-88
  @jira.link.parent_test_plan.QANOV-402198 @mobile @qa @raitt_drop3 @smoke
  Scenario: A prepay user with bank account in activated status completes the change tariff payment with bank account
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has "bank_account" service in "activated" status
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user has the "Change Tariff Success Feedback" module configured in CMS for "Change Tariff Success Feedback" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "button_primary" button of any element of the "offered_tariffs.list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "change_tariff_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank" text is displayed
      And the "message" textfield with "Dein Tarifwechsel wird in Kürze durchgeführt. Sobald der Vorgang abgeschlossen ist, erhältst du eine Bestätigungs-SMS." text is displayed
      And the "main_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-189994 @android @automatic @ber @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-189988
  @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420475 @jira.link.detects.O2DE-1872
  @jira.link.detects.OBO2DE-88 @jira.link.parent_test_plan.QANOV-402198 @mobile @qa @raitt_drop3 @smoke
  Scenario: A prepay user with enough balance completes the change tariff payment with balance
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has enough balance to purchase tariffs
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user has the "Change Tariff Success Feedback" module configured in CMS for "Change Tariff Success Feedback" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
      And the "Available Tariffs" page is displayed
      And clicks on the "button_primary" button of any element of the "offered_tariffs.list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "change_tariff_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank" text is displayed
      And the "message" textfield with "Dein Tarifwechsel wird in Kürze durchgeführt. Sobald der Vorgang abgeschlossen ist, erhältst du eine Bestätigungs-SMS." text is displayed
      And the "main_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-189993
  @jira.link.depends_on.QANOV-189994 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A prepay user can close the "Change Tariff Success Feedback" screen an go back to "<initial_page>" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "<module>" module configured in CMS for "<initial_page>" page
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user has the "Change Tariff Success Feedback" module configured in CMS for "Change Tariff Success Feedback" page
      And user is in the "<initial_page>" page
     When clicks on the "<change_tariff_button>" button
      And the "Available Tariffs" page is displayed
      And clicks on "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "change_tariff_button" button
      And the "Change Tariff Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "<initial_page>" page is displayed

    Examples:
          | initial_page | change_tariff_button               | module        | jira_id      |
          | Account      | tariff_card.button_primary         | Tariff Card   | QANOV-189995 |
          | My Tariff    | tariff_header.change_tariff_button | Tariff Header | QANOV-189996 |

  @jira.QANOV-189999 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-189993
  @jira.link.depends_on.QANOV-189994 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user can go back to the dashboard from the "Change Tariff Success Feedback" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "Change Tariff Success Feedback" module configured in CMS for "Change Tariff Success Feedback" page
      And user is in the "Change Tariff Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-190001 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189987
  @jira.link.depends_on.QANOV-420474 @jira.link.detects.O2DE-1871 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user confirms the change tariff payment with bank account but an error happens: purchase finished unsuccessfully
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has "bank_account" service in "activated" status
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user has the "Change Tariff Error Feedback" module configured in CMS for "Change Tariff Error Feedback" page
      And user is in the "Tariff Payment Methods" page
     When clicks on the "payment_methods.bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "change_tariff_button" button
      And there is an error changing the tariff
     Then the "Change Tariff Error Feedback" page is displayed
      And the "title" textfield with "Dein Tarifwechsel konnte nicht durchgeführt werden." text is displayed
      And the "subtitle" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-190005 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189988
  @jira.link.depends_on.QANOV-403561 @jira.link.depends_on.QANOV-420475 @jira.link.detects.O2DE-1871 @manual @mobile
  @raitt_drop3 @regression
  Scenario: A prepay user with enough balance confirms the change tariff payment with balance but an error happens: purchase finished unsuccessfully
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has enough balance to purchase tariffs
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user has the "Change Tariff Error Feedback" module configured in CMS for "Change Tariff Error Feedback" page
      And user is in the "Available Tariffs" page
     When clicks on the "select_tariff_button" button of the eligible tariff to purchase
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "payment_methods.balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "change_tariff_button" button
      And there is an error changing the tariff
     Then the "Change Tariff Error Feedback" page is displayed
      And the "error_feedback" module is displayed
      And the "title" textfield with "Dein Tarifwechsel konnte nicht durchgeführt werden." text is displayed
      And the "subtitle" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-190001
  @jira.link.depends_on.QANOV-190005 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A prepay user can close the "Change Tariff Error Feedback" screen and go back to "<initial_page>" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "<module>" module configured in CMS for "<initial_page>" page
      And user has the "Offered Tariffs List" module configured in CMS for "Available Tariffs" page
      And user has the "Selected Tariff" module configured in CMS for "Selected Tariff" page
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user has the "Tariff Order Confirmation" module configured in CMS for "Tariff Order Confirmation" page
      And user has the "Change Tariff Error Feedback" module configured in CMS for "Change Tariff Error Feedback" page
      And user is in the "<initial_page>" page
     When clicks on the "<change_tariff_button>" button
      And the "Available Tariffs" page is displayed
      And clicks on "select_tariff_button" button of any element of the "offered_tariffs_list" list
      And the "Selected Tariff" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Payment Methods" page is displayed
      And clicks on the "continue_button" button
      And the "Tariff Order Confirmation" page is displayed
      And clicks on the "change_tariff_button" button
      And there is an error changing the tariff
      And the "Change Tariff Error Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "<initial_page>" page is displayed

    Examples:
          | initial_page | change_tariff_button               | module        | jira_id      |
          | Account      | tariff_card.button_primary         | Tariff Card   | QANOV-190002 |
          | My Tariff    | tariff_header.change_tariff_button | Tariff Header | QANOV-190003 |

  @jira.QANOV-190008 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-190001
  @jira.link.depends_on.QANOV-190005 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user can go back to the dashboard from the "Change Tariff Error Feedback" screen
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has the "Change Tariff Error Feedback" module configured in CMS for "Change Tariff Error Feedback" page
      And user is in the "Change Tariff Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-190009 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189983
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @smoke
  Scenario: A BOX7 prepay user without registered bank account can access to the "Bank Account Edition" screen to activate bank account
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has a changeable tariff
      And user does not have bank account
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user is in the "Tariff Payment Methods" page
     When clicks on the "payment_methods.bankaccount_chevron" icon
     Then the "Bank Account Edition" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Payment Methods" page is displayed

  @jira.QANOV-403566 @TBD @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-189983
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @smoke
  Scenario: A RAITT prepay user without registered bank account can access to the "Bank Account Edition" OB webview to activate bank account
    Given user has a "raitt" account type
      And user has a "prepay" account type
      And user has a changeable tariff
      And user does not have bank account
      And user has the "Tariff Payment Methods" module configured in CMS for "Tariff Payment Methods" page
      And user is in the "Tariff Payment Methods" page
     When clicks on the "payment_methods.bankaccount_chevron" icon
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Payment Methods" page is displayed

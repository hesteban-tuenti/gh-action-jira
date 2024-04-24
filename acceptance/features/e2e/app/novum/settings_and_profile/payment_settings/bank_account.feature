# -*- coding: utf-8 -*-
@jira.QANOV-215488
Feature: Bank Account

  Actions Before the Feature:
    Given user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has not the "ACCOUNT_UPDATE_BANK_ACCOUNT" forbidden use case


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User without bank account saved can see the "bank account" entrypoint in the "Payment Settings" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user does not have bank account
      And user has a "any" product in "active" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "bank_account_description" textfield is not displayed
      And the "bank_account_tag" textfield with "Nicht hinterlegt" text is displayed
      And the "bank_account_chevron" icon is displayed

    @raitt_drop3
    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-217324:QANOV-217326:QANOV-217341 | QANOV-217344 |

    Examples:
          | product | cv   | depends_on                                                       | jira_id      |
          | o2de    | 14.2 | QANOV-217325:QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 | QANOV-217345 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: User with bank account saved can see the "bank account" entrypoint in the "Payment Settings" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    For BOX7 users, the last digits of the bank account will be displayed.
    For RAITT users, the last digits of the 'first' bank account will be displayed.
    Given user has "bank_account" service in "activated" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "bank_account_description" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "bank_account_tag" textfield is not displayed
      And the "bank_account_chevron" icon is displayed

    @raitt_drop3
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217324:QANOV-217326:QANOV-217341 | QANOV-402198     | QANOV-217346 |

    Examples:
          | product | cv   | depends_on                                                       | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-217325:QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 |                  | QANOV-217347 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User with bank account in pending status can see the "bank account" entrypoint in the "Payment Settings" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    For BOX7 users, the last digits of the bank account will be displayed.
    For RAITT users, the last digits of the 'first' bank account will be displayed.
    The chevron icon is not displayed because the users won't be able to access the "Bank Account" screen when it is in
    pending status.
    Given user has "bank_account" service in "pending" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "bank_account_description" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "bank_account_tag" textfield with "Kurzfristige Sperre nach Erstnutzung" text is displayed
      And the "bank_account_chevron" icon is not displayed

    Examples:
          | product | depends_on                                                       | jira_id      |
          | blaude  | QANOV-217324:QANOV-217326:QANOV-217341                           | QANOV-533005 |
          | o2de    | QANOV-217325:QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 | QANOV-533006 |

  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @smoke
  Scenario Outline: A BOX7 prepay user with bank account in <bank_account_status> status can access to the "<destination_screen>" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Blau prepay user with bank account deactivated: 015731700857 / #brt1234
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "bank_account" service in "<bank_account_status>" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Payment Settings" page is displayed
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
     Then the "<destination_screen>" page is displayed
      And the "title" textfield with "<title>" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @qa @raitt_drop3
    Examples:
          | product | cv   | bank_account_status | destination_screen         | title                     | ber | parent_test_plan | jira_id      |
          | blaude  | 13.9 | deactivated         | Bank Account Configuration | Bankverbindung einrichten | ber | QANOV-402198     | QANOV-215489 |
          | blaude  | 13.9 | activated           | Bank Account Details       | Bankverbindung bearbeiten |     | QANOV-402198     | QANOV-283611 |

    @manual
    Examples:
          | product | cv   | bank_account_status | destination_screen         | title                     | ber | parent_test_plan | jira_id      |
          | o2de    | 14.2 | deactivated         | Bank Account Configuration | Bankverbindung einrichten | ber |                  | QANOV-215490 |
          | o2de    | 14.2 | activated           | Bank Account Details       | Bankverbindung bearbeiten |     |                  | QANOV-283612 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user with bank account in activated status and with Telco product/s and My Handy product/s can access to the "Bank Account Details" screen for Telco products
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user has "bank_account" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" module configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
      And the "Payment Settings" page is displayed
      And clicks on the "bank_account_entrypoint" entrypoint
     Then the "Bank Account Details" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-402198     | QANOV-283613 |
          | o2de    | 14.2 | mobile_line;internet_at_home |                  | QANOV-283615 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user without bank account and with Telco product/s and My Handy product/s can access to the "Bank Account Configuration" screen for Telco products
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" module configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
      And the "Payment Settings" page is displayed
      And clicks on the "bank_account_entrypoint" entrypoint
     Then the "Bank Account Configuration" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-402198     | QANOV-215491 |
          | o2de    | 14.2 | mobile_line;internet_at_home |                  | QANOV-215492 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user with bank account in activated status and with Telco product/s and My Handy product/s can access to the "Bank Account Details" screen for a My Handy product
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user has "bank_account" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" module configured in CMS for "Distributive Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on any element in the "products_list" list that contains the "****" text
     Then the "Bank Account Details" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Distributive Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-402198     | QANOV-283616 |
          | o2de    | 14.2 | mobile_line;internet_at_home |                  | QANOV-283617 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user without bank account and with Telco product/s and My Handy product/s can access to the "Bank Account Configuration" screen for a My Handy product
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" module configured in CMS for "Distributive Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on any element in the "products_list" list that contains the "****" text
     Then the "Bank Account Configuration" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Distributive Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-402198     | QANOV-215497 |
          | o2de    | 14.2 | mobile_line;internet_at_home |                  | QANOV-215498 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user with bank account in active status and with only Telco product/s can access to the "Bank Account Details" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has "1" lines of the "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user does not have a "my_handy" account type
      And user has the "bank_account" service in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Payment Settings" page is displayed
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
     Then the "Bank Account Details" page is displayed
      And the "title" textfield with "Bankverbindung bearbeiten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @qa @raitt_drop3
    Examples:
          | product | cv   | postpay_products | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line      | QANOV-402198     | QANOV-283618 |

    @manual
    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home |                  | QANOV-283620 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A BOX7 postpay user without bank account status and with only Telco product/s can access to the "<destination_screen>" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has "1" lines of the "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user does not have a "my_handy" account type
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Payment Settings" page is displayed
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
     Then the "Bank Account Configuration" page is displayed
      And the "title" textfield with "Bankverbindung einrichten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @qa @raitt_drop3
    Examples:
          | product | cv   | postpay_products | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line      | QANOV-402198     | QANOV-215493 |

    @manual
    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home |                  | QANOV-215494 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user with bank account in activated status and with only one My Handy product can access to the "Bank Account Details" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has "1" products
      And user has "bank_account" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Bank Account Details" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @raitt_drop3
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-402198     | QANOV-283621 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 |                  | QANOV-283622 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A BOX7 postpay user without bank account and with only one My Handy product can access to the "Bank Account Configuration" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has "1" products
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Bank Account Configuration" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @raitt_drop3
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-402198     | QANOV-215495 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 |                  | QANOV-215496 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay BOX7 user with only one My Handy product and the bank account in pending status can access to "Bank Account Info Feedback" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Telco products (mobile postpay and internet@home) have the same account associated and the same settings. Each Handy products
    can have a different account.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has "1" products
      And user has "bank_account" service in "pending" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Bank Account Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Bankverbindung wird eingerichtet." text is displayed
      And the "info_message" textfield with "Bitte beachte, dass das Hinterlegen der Bankverbindung einige Tage dauern kann." text is displayed
      And the "back_to_payment_settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-218354 |
          | o2de    | 14.2 | QANOV-218355 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user with only one My Handy product who is in the "Bank Account Info Feedback" page can tap on the "Back to payment settings" button
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has "bank_account" service in "pending" status
      And user has a "any" product in "active" status
      And user has the "Bank Account Info Feedback" module configured in CMS for "Bank Account Info Feedback" page
      And user is in the "Bank Account Info Feedback" page
     When clicks on the "back_to_payment_settings_button" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-218354 | QANOV-215541 |
          | o2de    | 14.2 | QANOV-218355 | QANOV-533184 |

  @jira.QANOV-420240 @android @ber @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @raitt_drop3 @smoke @har
  Scenario: A RAITT user can access to the "Bank account" OB webview
    Given user has a "raitt" account type
      And user is in the "Payment Settings" page
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
     Then the browser webview with "Zahlungsdaten" text in the header is displayed
      And the "Zahlungsdaten" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1428
  @jira.link.detects.O2DE-1429 @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A BOX7 user without bank account can see the content of the "Bank Account Edition" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user does not have bank account
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Edition" page
      And user is in the "Payment Settings" page
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
      And the "Bank Account Edition" page is displayed
     Then the "title" textfield with "Bankverbindung einrichten" text is displayed
      And the "description" textfield with "So bezahlst du deine monatliche Rechnung automatisch und kannst bequem In-App-Käufe tätigen." text is displayed
      And the "account_holder_value" textfield is displayed
      And the "account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "account_holder_link" link with "Anderer Kontoinhaber?" text is displayed
      And the "iban_inputtext" inputtext is empty
      And the "iban_inputtext_placeholder" placeholder with "IBAN" text is displayed
      And the "iban_label" textfield with "IBAN-Format: DEXX XXXX XXXX XXXX XXXX XX" text is displayed
      And the "foreign_bank_account_title" textfield with "Anderen Kontoinhaber oder europäische Bankverbindung angeben?" text is displayed
      And the "foreign_bank_account_description" textfield with "Zum Angeben eines anderen Kontoinhaber oder einer Bankverbindung in der EU dieses Formular verwenden." text is displayed
      And the "foreign_bank_account_link" link with "Zum Formular" text is displayed
      And the "about_bank_account_title" textfield with "INFORMATION ZUR DATENVERARBEITUNG" text is displayed
      And the "about_bank_account_description" textfield with "Ich/Wir ermächtigen Telefónica Germany GmbH & Co. OHG Zahlungen von meinem/unseren Konto mittels Lastschrift einzuziehen. Zugleich weise ich/wir meinen/unseren Zahlungsdienstleister an, die von der Telefónica Germany GmbH & Co. OHG auf mein/unser Konto gezogenen Lastschriften einzulösen (SEPA-Mandat). Die Änderung muss mind. 7 Tage vor Fälligkeit der nächsten Rechnung durchgeführt werden." text is displayed
      And the "data_declaration_textfield" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_declaration_link" link with "Datenschutzerklärung" text is displayed
      And the "bank_account_button" button with "Jetzt ändern" text is displayed

    @manual @raitt_drop3
    Examples:
          | product | cv   | depends_on                                                                                                                        | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-215489:QANOV-283611:QANOV-215491:QANOV-283613:QANOV-215493:QANOV-283616:QANOV-215495:QANOV-283618:QANOV-215497:QANOV-283621 |                  | QANOV-215499 |

    @manual
    Examples:
          | product | cv   | depends_on                                                                                                                        | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-215490:QANOV-283612:QANOV-215492:QANOV-283615:QANOV-215494:QANOV-283617:QANOV-215496:QANOV-283620:QANOV-215498:QANOV-283622 | QANOV-437471     | QANOV-215500 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A BOX7 user with bank account activated can see the content of the "Bank Account Details" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has a "any" product in "active" status
      And user has the "Bank Account" module configured in CMS for "Bank Account" page
      And user is in the "Payment Settings" page
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
      And the "Bank Account Details" page is displayed
     Then the "title" textfield with "Bankverbindung bearbeiten" text is displayed
      And the "description" textfield with "Hier Kannst du deine Bankverbindung ändern." text is displayed
      And the "0" index in the "payment_info_list" list has the "value" field
      And the element in "0" position in the "payment_info_list" list has the "label" field with the "Vertragsinhaber" text
      And the "account_holder_link" link with "Anderer Kontoinhaber?" text is displayed
      And the element in "1" position in the "payment_info_list" list has the "value" field with the "^[A-Z]{2}[\*\ ]+\*[\d\ ]{4}$" format
      And the element in "1" position in the "payment_info_list" list has the "label" field with the "IBAN" text
      And the "2" index in the "payment_info_list" list has the "value" field
      And the element in "2" position in the "payment_info_list" list has the "label" field with the "BIC" text
      And the "3" index in the "payment_info_list" list has the "value" field
      And the element in "3" position in the "payment_info_list" list has the "label" field with the "Bankname" text
      And the "foreign_bank_account_title" textfield with "Anderen Kontoinhaber oder europäische Bankverbindung angeben?" text is displayed
      And the "foreign_bank_account_description" textfield with "Zum Angeben eines anderen Kontoinhaber oder einer Bankverbindung in der EU dieses Formular verwenden." text is displayed
      And the "foreign_bank_account_link" link with "Zum Formular" text is displayed
      And the "about_bank_account_title" textfield with "INFORMATION ZUR DATENVERARBEITUNG" text is displayed
      And the "about_bank_account_description" textfield with "Ich/Wir ermächtigen Telefónica Germany GmbH & Co. OHG Zahlungen von meinem/unseren Konto mittels Lastschrift einzuziehen. Zugleich weise ich/wir meinen/unseren Zahlungsdienstleister an, die von der Telefónica Germany GmbH & Co. OHG auf mein/unser Konto gezogenen Lastschriften einzulösen (SEPA-Mandat). Die Änderung muss mind. 7 Tage vor Fälligkeit der nächsten Rechnung durchgeführt werden." text is displayed
      And the "data_declaration_textfield" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_declaration_link" link with "Datenschutzerklärung" text is displayed
      And the "edit_bank_account_button" button with "Jetzt ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @raitt_drop3
    Examples:
          | product | cv   | depends_on                                                                                                                        | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-215489:QANOV-283611:QANOV-215491:QANOV-283613:QANOV-215493:QANOV-283616:QANOV-215495:QANOV-283618:QANOV-215497:QANOV-283621 |                  | QANOV-215501 |

    @manual
    Examples:
          | product | cv   | depends_on                                                                                                                        | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-215490:QANOV-283612:QANOV-215492:QANOV-283615:QANOV-215494:QANOV-283617:QANOV-215496:QANOV-283620:QANOV-215498:QANOV-283622 | QANOV-437471     | QANOV-215502 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1428
  @jira.link.detects.O2DE-1429 @jira.link.detects.O2DE-1935 @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A BOX7 user with bank account activated can access to edit the bank account
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    For security reasons, the bank account input fields will be empty.
    Given user has a "box7" account type
      And user has the "bank_account" service in "activated" status
      And user has a "any" product in "active" status
      And user has the "Bank Account" module configured in CMS for "Bank Account" page
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Edition" page
      And user is in the "Payment Settings" page
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
      And the "Bank Account Details" page is displayed
     When clicks on the "edit_bank_account_button" button
     Then the "Bank Account Edition" page is displayed
      And the "Bankverbindung" header is displayed
      And the "title" textfield with "Bankverbindung bearbeiten" text is displayed
      And the "description" textfield with "Hier Kannst du deine Bankverbindung ändern." text is displayed
      And the "account_holder_value" textfield is displayed
      And the "account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "account_holder_link" link with "Anderer Kontoinhaber?" text is displayed
      And the "iban_inputtext" inputtext is empty
      And the "iban_inputtext_placeholder" placeholder with "IBAN" text is displayed
      And the "iban_label" textfield with "IBAN-Format: DEXX XXXX XXXX XXXX XXXX XX" text is displayed
      And the "foreign_bank_account_title" textfield with "Anderen Kontoinhaber oder europäische Bankverbindung angeben?" text is displayed
      And the "foreign_bank_account_description" textfield with "Zum Angeben eines anderen Kontoinhaber oder einer Bankverbindung in der EU dieses Formular verwenden." text is displayed
      And the "foreign_bank_account_link" link with "Zum Formular" text is displayed
      And the "about_bank_account_title" textfield with "INFORMATION ZUR DATENVERARBEITUNG" text is displayed
      And the "about_bank_account_description" textfield with "Ich/Wir ermächtigen Telefónica Germany GmbH & Co. OHG Zahlungen von meinem/unseren Konto mittels Lastschrift einzuziehen. Zugleich weise ich/wir meinen/unseren Zahlungsdienstleister an, die von der Telefónica Germany GmbH & Co. OHG auf mein/unser Konto gezogenen Lastschriften einzulösen (SEPA-Mandat). Die Änderung muss mind. 7 Tage vor Fälligkeit der nächsten Rechnung durchgeführt werden." text is displayed
      And the "data_declaration_textfield" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_declaration_link" link with "Datenschutzerklärung" text is displayed
      And the "bank_account_button" button with "Bankverbindung ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @raitt_drop3
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-215501 |                  | QANOV-283623 |

    @manual
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-215502 | QANOV-437471     | QANOV-283624 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1431
  @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to the "change the account holder" document from the "Bank Account Configuration" screen for android devices
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has installed the "Google Drive" app
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When clicks on the "account_holder_link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215499:QANOV-283623 | QANOV-215503 |
          | o2de    | 14.2 | QANOV-215500:QANOV-283624 | QANOV-215504 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1431 @manual
  @mobile @regression
  Scenario Outline: A BOX7 user can access to the "change the account holder" document from the "Bank Account Configuration" screen for iOS devices
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When clicks on the "account_holder_link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215499:QANOV-283623 | QANOV-311515 |
          | o2de    | 14.2 | QANOV-215500:QANOV-283624 | QANOV-311516 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to the "foreign bank account" document from the "Bank Account Configuration" screen for android devices
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has installed the "Google Drive" app
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When clicks on the "foreign_bank_account_link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-215499:QANOV-283623 | QANOV-324643 |
          | o2de    | QANOV-215500:QANOV-283624 | QANOV-324644 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to the "foreign bank account" document from the "Bank Account Configuration" screen for iOS devices
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When clicks on the "foreign_bank_account_link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-215499:QANOV-283623 | QANOV-324645 |
          | o2de    | QANOV-215500:QANOV-283624 | QANOV-324646 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.OBO2DE-184
  @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to Data Declaration screen from the "Bank Account Configuration" screen
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When clicks on the "data declaration_link" link
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | header               | depends_on                | jira_id      |
          | blaude  | 13.9 | Datenschutz bei Blau | QANOV-215499:QANOV-283623 | QANOV-215505 |
          | o2de    | 14.2 | Datenschutz          | QANOV-215500:QANOV-283624 | QANOV-215506 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cannot save the bank account without filling all the mandatory fields
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When clears the "iban_inputtext" inputtext
      And clicks on the "bank_account_button" button
     Then the "iban_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215499:QANOV-283623 | QANOV-215507 |
          | o2de    | 14.2 | QANOV-215500:QANOV-283624 | QANOV-215508 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cannot save the bank account inserting an IBAN with wrong format
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE89" text
      And clicks on the "bank_account_button" button
     Then the "iban_error_textfield" textfield with "Falsche IBAN" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215499:QANOV-283623 | QANOV-215509 |
          | o2de    | 14.2 | QANOV-215500:QANOV-283624 | QANOV-215510 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can tap on back button after making any change in the "Bank Account" page: a cancellation popup is displayed on <client> device
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE89" text
      And clicks on the "<button>" button
     Then the "Bank Account Cancellation" popup is displayed
      And the "title" textfield with "Hinweis" text is displayed
      And the "body" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "continue_button" button with "<continue_button>" text is displayed
      And the "cancel_button" button with "<cancel_button>" text is displayed

    Examples:
          | client  | cv   | product | button                           | continue_button | cancel_button | depends_on                | jira_id      |
          | android | 13.9 | blaude  | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-215499:QANOV-283623 | QANOV-215515 |
          | ios     | 13.9 | blaude  | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-215499:QANOV-283623 | QANOV-215516 |
          | android | 14.2 | o2de    | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-215500:QANOV-283624 | QANOV-215517 |
          | ios     | 14.2 | o2de    | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-215500:QANOV-283624 | QANOV-215518 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user decides to continue with the "Bank Account" flow after seeing the cancellation popup
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Cancellation" popup
     When clicks on the "continue_button" button
     Then the "Bank Account Configuration" page is displayed
      And the "Bankverbindung" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215515:QANOV-215516 | QANOV-215519 |
          | o2de    | 14.2 | QANOV-215517:QANOV-215518 | QANOV-215520 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user decides to cancel the "Bank Account" flow after seeing the cancellation popup
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Cancellation" popup
     When clicks on the "cancel_button" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215515:QANOV-215516 | QANOV-215521 |
          | o2de    | 14.2 | QANOV-215517:QANOV-215518 | QANOV-215522 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A BOX7 user can activate the bank account successfully
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    There are several websites to generate IBAN numbers: https://www.mobilefish.com/services/iban/iban.php
    NOTE: if the bank account activation takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has a "box7" account type
      And user does not have bank account
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user has the "Bank Account Success Feedback" module configured in CMS for "Bank Account Success Feedback" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE43 8319 0217 1349 6730 01" text
      And clicks on the "bank_account_button" button
     Then the "Bank Account Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten." text is displayed
      And the "success_message" textfield with "Wir werden deine Daten aktualisieren. Bitte beachte, dass da Hinterlegen der Bankverbindung einige Tage dauern kann." text is displayed
      And the "back_to_payment_settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    @raitt_drop3
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-215499 | QANOV-402198     | QANOV-215523 |

    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-215500 | QANOV-437471     | QANOV-215524 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to activate the bank account but an error happens (first attempt)
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    The user will see a red warning at the bottom of the screen the first  time that he/she tries to activate the
    bank account without success. The second attempt will redirect to a full screen error feedback.
    Given user has a "box7" account type
      And user does not have bank account
      And user has tried to activate the bank account "0" times without success
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE89 3704 0044 0532 0130 00" text
      And clicks on the "bank_account_button" button
      And there is an error activating the bank account
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

    Examples:
          | product | cv   | depends_on   | detects    | jira_id      |
          | blaude  | 13.9 | QANOV-215499 | OBO2DE-202 | QANOV-215529 |
          | o2de    | 14.2 | QANOV-215500 |            | QANOV-215530 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can close the error warning after trying to activate the bank account without success
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user does not have bank account
      And user has tried to activate the bank account "0" times without success
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE89 3704 0044 0532 0130 00" text
      And clicks on the "bank_account_button" button
      And there is an error activating the bank account
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Bank Account Edition" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-215529 | QANOV-215531 |
          | o2de    | 14.2 | QANOV-215530 | QANOV-215532 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to activate the bank account but an error happens (second attempt)
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    The user will see a red warning at the bottom of the screen the first  time that he/she tries to activate the
    bank account without success. The second attempt will redirect to a full screen error feedback.
    Given user has a "box7" account type
      And user does not have bank account
      And user has tried to activate the bank account "1" times without success
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user has the "Bank Account Error Feedback" module configured in CMS for "Bank Account Error Feedback" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE89 3704 0044 0532 0130 00" text
      And clicks on the "bank_account_button" button
      And there is an error activating the bank account
     Then the "Bank Account Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Anforderung aktuell unsendbar" text is displayed
      And the "error_message" textfield with "Versuch es später noch einmal" text is displayed
      And the "back_to_payment settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-215499 | QANOV-215533 |
          | o2de    | 14.2 | QANOV-215500 | QANOV-215534 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can modify the bank account: a confirmation popup is displayed
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with a different text
      And clicks on the "bank_account_button" button
     Then the "Edit Bank Account Confirmation" popup is displayed
      And the "title" textfield with "Du änderst gleich deine Bankverbindung" text is displayed
      And the "body" textfield with "Kannst du im Profilbereich wieder ändern" text is displayed
      And the "continue_button" button with "OK" text is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-283623 | QANOV-215535 |
          | o2de    | 14.2 | QANOV-283624 | QANOV-215536 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cancels to modify the bank account
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with a different text
      And clicks on the "bank_account_button" button
      And the "Edit Bank Account Confirmation" popup is displayed
      And clicks on the "cancel_button" button
     Then the "Bank Account Edition" page is displayed
      And the "Bankverbindung" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-215535 | QANOV-215537 |
          | o2de    | 14.2 | QANOV-215536 | QANOV-215538 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A BOX7 user confirms to modify the bank account: bank account changed successfully
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    NOTE: if the bank account change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user has the "Bank Account Success Feedback" module configured in CMS for "Bank Account Success Feedback" page
      And user is in the "Payment Settings" page
      And clicks on the element with "name" field with "[LANG:profile.dashboard.payment_settings.bank_account]" value of the "payment_settings_list" list
      And the "Bank Account Details" page is displayed
     When clicks on the "edit_bank_account_button" button
      And the "Bank Account Configuration" page is displayed
      And fills the "iban_inputtext" inputtext with the "DE89370400440532013000" text
      And clicks on the "bank_account_button" button
      And the "Bank Account Edition Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Bank Account Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten." text is displayed
      And the "success_message" textfield with "Wir werden deine Daten aktualisieren. Bitte beachte, dass das Hinterlegen der Bankverbindung einige Tage dauern kann." text is displayed
      And the "back_to_payment_settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "back_to_payment_settings_button" button
      And the "Payment Settings" page is displayed

    @automatic @live @next @raitt_drop3
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-215535 | QANOV-402198     | QANOV-215539 |

    @manual
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-215536 | QANOV-437471     | QANOV-215540 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to modify the bank account but an error happens (first attempt)
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    The user will see a red warning at the bottom of the screen the first  time that he/she tries to activate the
    bank account without success. The second attempt will redirect to a full screen error feedback.
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has tried to modify the bank account "0" times without success
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with a different text
      And clicks on the "bank_account_button" button
      And the "Edit Bank Account Confirmation" popup is displayed
      And clicks on the "continue_button" button
      And there is an error modifying the bank account
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-283623 | QANOV-215545 |
          | o2de    | 14.2 | QANOV-283624 | QANOV-215546 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can close the error warning after trying to modify the bank account without success
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has tried to modify the bank account "0" times without success
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with a different text
      And clicks on the "bank_account_button" button
      And the "Edit Bank Account Confirmation" popup is displayed
      And clicks on the "continue_button" button
      And there is an error modifying the bank account
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Bank Account Edition" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-215545 | QANOV-215547 |
          | o2de    | 14.2 | QANOV-215546 | QANOV-215548 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user tries to modify the bank account but an error happens (second attempt)
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    The user will see a red warning at the bottom of the screen the first  time that he/she tries to activate the
    bank account without success. The second attempt will redirect to a full screen error feedback.
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has tried to modify the bank account "1" times without success
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user has the "Bank Account Error Feedback" module configured in CMS for "Bank Account Error Feedback" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with a different text
      And clicks on the "bank_account_button" button
      And the "Edit Bank Account Confirmation" popup is displayed
      And clicks on the "continue_button" button
      And there is an error modifying the bank account
     Then the "Bank Account Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Anforderung aktuell unsendbar" text is displayed
      And the "error_message" textfield with "Versuch es später noch einmal" text is displayed
      And the "back_to_payment settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-283623 | QANOV-215549 |
          | o2de    | 14.2 | QANOV-283624 | QANOV-215550 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user who is in the "Bank Account Success Feedback" page can tap on the "<button_name>" button
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    User can arrive to this Success Feedback screen by activating or changing the bank account.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Success Feedback" module configured in CMS for "Bank Account Success Feedback" page
      And user is in the "Bank Account Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | depends_on                | button_name              | button_id                       | jira_id      |
          | blaude  | 13.9 | QANOV-215523:QANOV-215539 | Back to payment settings | back_to_payment_settings_button | QANOV-215525 |
          | blaude  | 13.9 | QANOV-215523:QANOV-215539 | Close                    | navigation_top_bar.close_button | QANOV-215526 |
          | o2de    | 14.2 | QANOV-215524:QANOV-215540 | Back to payment settings | back_to_payment_settings_button | QANOV-215527 |
          | o2de    | 14.2 | QANOV-215524:QANOV-215540 | Close                    | navigation_top_bar.close_button | QANOV-215528 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user who is in the "Bank Account Error Feedback" screen can tap on the "<button_name>" button
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    User can arrive to this Error Feedback screen by activating or changing the bank account.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Error Feedback" module configured in CMS for "Bank Account Error Feedback" page
      And user is in the "Bank Account Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed

    Examples:
          | product | cv   | depends_on                | button_name              | button_id                       | jira_id      |
          | blaude  | 13.9 | QANOV-215533:QANOV-215549 | Back to payment settings | back_to_payment_settings_button | QANOV-215551 |
          | blaude  | 13.9 | QANOV-215533:QANOV-215549 | Close                    | navigation_top_bar.close_button | QANOV-215552 |
          | o2de    | 14.2 | QANOV-215534:QANOV-215550 | Back to payment settings | back_to_payment_settings_button | QANOV-215553 |
          | o2de    | 14.2 | QANOV-215534:QANOV-215550 | Close                    | navigation_top_bar.close_button | QANOV-215554 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go to previous screen from the "Bank Account Error Feedback" screen on iOS devices
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has the "Bank Account Error Feedback" module configured in CMS for "Bank Account Error Feedback" page
      And user is in the "Bank Account Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Bank Account Configuration" page is displayed
      And the "Bankverbindung" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-215533:QANOV-215549 | QANOV-216398 |
          | o2de    | 14.2 | QANOV-215534:QANOV-215550 | QANOV-216399 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A BOX7 user with bank account in activated status cannot access to "Bank Account Edition" screen if all products are cancelled
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    This screen will be displayed in "only read" mode.
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has all products in "cancelled" status
      And user has the "Bank Account" module configured in CMS for "Bank Account" page
      And user is in the "Bank Account" page
     Then the "title" textfield with "Bankverbindung" text is displayed
      And the "description" textfield with "Aktuell kannst du hier die Bankverbingdung nicht ändern. Bei Fragen wende dich an die Kundenbetreuung." text is displayed
      And the "account_holder_value" textfield is displayed
      And the "account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "account_holder_link" link is not displayed
      And the "iban_value" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "iban_label" textfield with "IBAN" text is displayed
      And the "bic_value" textfield is displayed
      And the "bic_label" textfield with "BIC number" text is displayed
      And the "bank_name_value" textfield is displayed
      And the "bank_name_label" textfield with "Bankname" text is displayed
      And the "about_bank_account_title" textfield with "INFORMATION ZUR BANKKONTOBEARBEITUNG" text is displayed
      And the "about_bank_account_description" textfield is displayed
      And the "data declaration_textfield" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data declaration_link" link with "Datenschutzerklärung" text is displayed
      And the "return_pay_configuration" button with "Zurück zu Zahlungseinstellungen" text is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | blaude  | 14.1 | QANOV-306250              | QANOV-308045 |
          | o2de    | 14.2 | QANOV-306250:QANOV-437471 | QANOV-308046 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.24.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A BOX7 user changes the bank account but the confirmation takes too long: an informative screen is displayed
    To check bank account: prepay [bank-account-management], postpay [invoice-payment]
    There are several websites to generate IBAN numbers: https://www.mobilefish.com/services/iban/iban.php
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has a "any" product in "active" status
      And user has the "Bank Account Edition" module configured in CMS for "Bank Account Configuration" page
      And user has the "Bank Account Informative Feedback" module configured in CMS for "Bank Account Informative Feedback" page
      And user is in the "Bank Account Configuration" page
     When fills the "iban_inputtext" inputtext with the "DE89370400440532013000" text
      And clicks on the "bank_account_button" button
      And the "Bank Account Edition Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the bank account change takes too long
     Then the "Bank Account Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "back_to_payment_settings_button" button with "Zurück zu den Zahlungseinstellungen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-215535 | QANOV-620359 |
          | o2de    | QANOV-215536 | QANOV-620360 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.24.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A BOX7 user can go back to "Payment Settings" screen from the "Bank Account Informative Feedback" screen
    Given user has a "box7" account type
      And user has the "Bank Account Informative Feedback" module configured in CMS for "Bank Account Informative Feedback" page
      And user is in the "Bank Account Informative Feedback" page
     When clicks on the "back_to_payment_settings_button" button
     Then the "Payment Settings" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-620359 | QANOV-620361 |
          | o2de    | QANOV-620360 | QANOV-620362 |

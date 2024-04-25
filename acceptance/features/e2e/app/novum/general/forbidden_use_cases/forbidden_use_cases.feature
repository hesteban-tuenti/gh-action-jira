# -*- coding: utf-8 -*-
@jira.QANOV-242360
Feature: Forbidden Use Cases


  @jira.<jira_id> @<product> @android @ios @jira.cv.14.10 @manual @mobile @regression
  @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A user with the CUSTOMER_APP_CHANNEL forbidden use case cannot enter the app
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has the "CUSTOMER_APP_CHANNEL" forbidden use case
      And terminates the app
      And launches the app
      And user is logged out
      And user is in the "Splash Screen" page
     When user is logged in
     Then the "Rooted Popup" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Die App kann für diesen Vertrag derzeit nicht genutzt werden. Bitte wende dich an den Kundenservice." text is displayed
      And the "popup.accept" button with the "(Fortfahren|FORTFAHREN)" format is displayed

    @raitt_drop1
    Examples:
          | product | parent_test_plan | jira_id      |
          | blaude  |                  | QANOV-242330 |

    Examples:
          | product | parent_test_plan | jira_id      |
          | o2de    | QANOV-437471     | QANOV-242331 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the ACCOUNT_BOOK_PACK forbidden use case cannot book any additional pack
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has any "<products>" product
      And user has "any" bundles available to purchase in "any" category
      And user has the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Smart actions" module configured in CMS for "Account" page
      And the "Smart actions" module configured in CMS for "Account" page has the "Bundle management" buttons
      And user has the "Action Row;Categories list" modules configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "manage_bundle_button" button
      And the "Bundle Management" page is displayed
      And clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the elegible bundle to purchase
      And the "Bundle Purchase Details" page is displayed
     Then the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Preis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_details.title" textfield with "Details" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "continue_button" button is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line |                  | QANOV-242332 |

    Examples:
          | product | cv   | products                    | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;dsl;cable;fiber | QANOV-437471     | QANOV-242333 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the ACCOUNT_DELETE_PACK forbidden use case cannot delete any already booked pack
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has any "<products>" product
      And user has a "recurrent" bundle in "active" status
      And user has the "ACCOUNT_DELETE_PACK" forbidden use case
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user has the matching subscription selected in the account
      And user is in the "My Bundles" page
     When clicks on the "active-recurrent" bundle in the "my_active_removed_bundles_list" list
      And the "My Bundle Details" page is displayed
     Then the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Preis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_status.label" textfield with "Status" text is displayed
      And the "pack_status.value" textfield with "Aktiv" text is displayed
      And the "pack_renewaldate.label" textfield with "Verlängerungsdatum" text is displayed
      And the "pack_renewaldate.sublabel" textfield with "One-off payment" text is displayed
      And the "pack_renewaldate.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan.|Feb.|März|Apr.|Mai|Jun.|Jul.|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "pack_details.title" textfield with "Details" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "remove_pack_button" button is not displayed

    Examples:
          | product | cv   | products                    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                 |                  | QANOV-242334 |
          | o2de    | 14.2 | mobile_line;dsl;cable;fiber | QANOV-437471     | QANOV-242361 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario Outline: A user with the <fuc> forbidden use case cannot add any device/SIM for any of their lines
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has "multisim" service in "activated" status
      And user has a SIM in "active" status
      And user has the "<fuc>" forbidden use case
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user has the matching subscription selected in the account
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_details" module is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint with "Ersatz SIM-Karte" text is displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint with "SIM-Karte sperren" text is displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint with "TBD" text is displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed

    Examples:
          | fuc                               | jira_id      |
          | ACCOUNT_ADD_DEVICE                | QANOV-242362 |
          | ORDER_ADDITIONAL_SIM              | QANOV-242363 |
          | SUBSCRIPTION_ORDER_ADDITIONAL_SIM | QANOV-242364 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the ACCOUNT_SHOW_DATA forbidden use case cannot access to "Payment settings" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has the "ACCOUNT_SHOW_DATA" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     Then the "payment_settings_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv    | parent_test_plan | jira_id      |
          | blaude  | 13.10 |                  | QANOV-242365 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242367 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with the ACCOUNT_SHOW_DATA forbidden use case cannot access to the billing settings
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    NOTE: Temporaly, a "Download EVN" entrypoint will be always displayed (regardless of service status) pointing to a OB
    webview. In the future, it will be replaced by a 'Download EVN' card in the bills summary.
    Given user has a "postpay" account type
      And user has bills
      And user has the "ACCOUNT_SHOW_DATA" forbidden use case
      And user has the "Bills settings" module configured in CMS for "Bills" page
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bills_settings.title_textfield" textfield is not displayed
      And the "download_evn_entrypoint" entrypoint is not displayed
      And the "bank_account_entrypoint" entrypoint is not displayed
      And the "digital_bill_entrypoint" entrypoint is not displayed
      And the "billing_address_entrypoint" entrypoint is not displayed
      And the "evn_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-291291 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-291292 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the CUSTOMER_SHOW_DATA forbidden use case cannot access to "Contact details" screens
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has the "CUSTOMER_SHOW_DATA" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user is in the "Profile" page
     When clicks on the "personal_data_entrypoint" entrypoint
      And the "Personal Data" page is displayed
     Then the "change_contact_details_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-242370 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242372 |

  @jira.QANOV-242373 @android @automatic @blaude @ios @jira.cv.13.9 @mobile @qa @sanity @raitt_drop1
  Scenario: A BOX7 prepay blaude user with bank account saved and with the ACCOUNT_TOP_UP_ON_DEMAND forbidden use case cannot top-up manually
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    QA environment: prepay10
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     Then the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Guthabenkarte & Code" text is displayed
      And the "topup_options.voucher_description" textfield with "Aufladecode eingeben" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint is not displayed
      And the "topup_settings.title" textfield is not displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint is not displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint is not displayed

  @jira.QANOV-242374 @android @ios @jira.cv.14.2 @manual @mobile @o2de @sanity
  Scenario: A prepay o2de user with bank account saved and with the ACCOUNT_TOP_UP_ON_DEMAND forbidden use case cannot top-up manually
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    QA environment: prepay10
    Given user has a "prepay" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     Then the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Guthabenkarte & Code" text is displayed
      And the "topup_options.voucher_description" textfield with "Aufladecode eingeben" text is displayed
      And the "topup_options.third_party_entrypoint" entrypoint with "Weitere Auflademöglichkeiten" text is displayed
      And the "topup_options.third_party_description" textfield with "Paypal oder Kreditkarten" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint is not displayed
      And the "topup_settings.title" textfield is not displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint is not displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint is not displayed

  @jira.QANOV-284830 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression @raitt_drop1
  Scenario: A BOX7 prepay blaude user without bank account and with the ACCOUNT_TOP_UP_ON_DEMAND forbidden use case can add the bank account
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    An "Add bank account" entrypoint will be displayed, if no other FUC blocks this use case.
    QA environment: prepay10
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user does not have bank account
      And user has the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     Then the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Mit Coupon aufladen" text is displayed
      And the "topup_options.voucher_description" textfield with "Code einlösen" text is displayed
      And the "topup_options.bank_account_tag" textfield with "Desaktiviert" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint with "Einmalige Schnellaufladung" text is displayed
      And the "topup_options.bank_account_description" textfield with "Bankkonto hinzufügen" text is displayed
      And the "topup_settings.title" textfield is not displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint is not displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint is not displayed

  @jira.QANOV-284831 @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-3002 @manual @mobile @o2de @regression
  Scenario: A prepay o2de user without bank account and with the ACCOUNT_TOP_UP_ON_DEMAND forbidden use case can add the bank account
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    An "Add bank account" entrypoint will be displayed, if no other FUC blocks this use case.
    QA environment: prepay10
    Given user has a "prepay" account type
      And user does not have bank account
      And user has the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     Then the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Mit Coupon aufladen" text is displayed
      And the "topup_options.voucher_description" textfield with "Code einlösen" text is displayed
      And the "topup_options.third_party_entrypoint" entrypoint with "Bei Drittanbietern aufladen" text is displayed
      And the "topup_options.third_party_description" textfield with "Paypal oder Kreditkarten" text is displayed
      And the "topup_options.bank_account_tag" textfield with "Desaktiviert" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint with "Einmalige Schnellaufladung" text is displayed
      And the "topup_options.bank_account_description" textfield with "Bankkonto hinzufügen" text is displayed
      And the "topup_settings.title" textfield is not displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint is not displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint is not displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user without bank account and with the ACCOUNT_REGISTER_FOR_DIRECT_DEBIT forbidden use case cannot register a bank account from the "Topup" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user does not have bank account
      And user has the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     Then the "topup_options" module is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Mit Coupon aufladen" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint is not displayed
      And the "topup_settings.title" textfield is not displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint is not displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-242375 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242376 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.O2DE-2114 @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user with bank account saved and with the ACCOUNT_REGISTER_FOR_DIRECT_DEBIT forbidden use case can topup with bank account from the "Topup" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     Then the "topup_options" module is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Mit Coupon aufladen" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint with "Einmalige Schnellladung" text is displayed
      And the "topup_options.bank_account_description" textfield with the "^[A-Z]{2}(\d\d)?[\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "topup_settings.title" textfield is displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint is displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint is displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-284832 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-284833 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A BOX7 user wihout bank account and with the ACCOUNT_REGISTER_FOR_DIRECT_DEBIT forbidden use case cannot register bank account from the "Payment settings" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user does not have bank account
      And user has the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user has the matching subscription selected in the account
      And user is in the "Payment Settings" page
     Then the "bank_account_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-242377 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242378 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user wihout bank account and with the ACCOUNT_REGISTER_FOR_DIRECT_DEBIT forbidden use case cannot register bank account from the "Bills" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user does not have bank account
      And user has the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Bills settings" module configured in CMS for "Bills" page
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bank_account_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | jira_id      |
          | blaude  | 13.9 | mobile_line | QANOV-359859 |

    Examples:
          | product | cv   | products                     | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-359860 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the ACCOUNT_UPDATE_BANK_ACCOUNT forbidden use case cannot update the bank account
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_UPDATE_BANK_ACCOUNT" forbidden use case
      And user has the "Bank Account" module configured in CMS for "Bank Account" page
      And user has the matching subscription selected in the account
      And user is in the "Bank Account" page
     Then the "title" textfield with "Bankverbindung" text is displayed
      And the "description" textfield with "Aktuell Kannst du hier die Bankverbindung nicht ändern. Bei Fragen wende dich an die Kundenbetreuung." text is displayed
      And the "account_holder_value" textfield is displayed
      And the "account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "account_holder_link" link is not displayed
      And the "iban_value" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "iban_label" textfield with "IBAN" text is displayed
      And the "bic_value" textfield is displayed
      And the "bic_label" textfield with "BIC" text is displayed
      And the "bank_name_value" textfield is displayed
      And the "bank_name_label" textfield with "Bankname" text is displayed
      And the "foreign_bank_account_link" link is not displayed
      And the "about_bank_account_title" textfield with "INFORMATIONEN ZUR DATENVERARBEITUNG" text is displayed
      And the "about_bank_account_description" textfield with "Ich/Wir ermächtigen Telefónica Germany GmbH & Co. OHG Zahlungen von meinem/unseren Konto mittels Lastschrift einzuziehen. Zugleich weise ichh/wir meinen/unseren Zahlungsdienstleister an, die von der Telefónica Germany GmbH & Co. OHG auf mein/unser Konto gezogenen Lastschriften einzulösen (SEPA-Mandat). Die Änderung muss mind. 7 Tage vor Fälligkeit der nächsten Rechhnung durchgeführt werden." text is displayed
      And the "data declaration_textfield" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data declaration_link" link with "Datenschutzerklärung" text is displayed
      And the "edit_bank_account_button" button is not displayed
      And the "ok_button" button with "Zurück zu Zahlungseinstellungen" text is displayed

    @raitt_drop1
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-242379 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242380 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the CUSTOMER_UPDATE_DATA forbidden use case cannot edit the contact email
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "verified email" stored in the contact details
      And user has the "CUSTOMER_UPDATE_DATA" forbidden use case
      And user has the "Email Contact" module configured in CMS for "Email Contact" page
      And user is in the "Email Contact" page
     Then the "title" textfield with "Kontakt-E-Mail" text is displayed
      And the "description1" textfield with "Auf diese E-Mail Adresse erhältst du Informationen zu deinem Vertrag." text is displayed
      And the "description2" textfield with "Bitte überprüfe und bestätige deine E-Mail-Adresse. Du erhältst eine E-Mail mit einem Bestätigungs-Link." text is displayed
      And the "email_inputtext" inputtext is not displayed
      And the "email_value" textfield is displayed
      And the "email_title" textfield with "E-Mail-Adresse" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "confirm_button" button is not displayed
      And the "ok_button" button with "Ok" text is displayed

    @raitt_drop1
    Examples:
          | product | cv    | parent_test_plan | jira_id      |
          | blaude  | 13.10 |                  | QANOV-242382 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242384 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the CUSTOMER_UPDATE_DATA forbidden use case cannot edit the contact number
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "phone number" stored in the contact details
      And user has the "CUSTOMER_UPDATE_DATA" forbidden use case
      And user has the "Phone Number Contact" module configured in CMS for "Phone Number Contact" page
      And user is in the "Phone Number Contact" page
     Then the "title" textfield with "Kontaktrufnummer" text is displayed
      And the "description" textfield with "Verwende hier bitte deine Kontaktrufnummer für den Empfang wichtiger Informationen per SMS." text is displayed
      And the "phone_number_inputtext" inputtext is not displayed
      And the "phone_number_example" textfield is not displayed
      And the "phone_number_value" textfield is displayed
      And the "phone_number_title" textfield with "Telefonnummer" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_button" button is not displayed
      And the "ok_button" button with "Ok" text is displayed

    @raitt_drop1
    Examples:
          | product | cv    | parent_test_plan | jira_id      |
          | blaude  | 13.10 |                  | QANOV-242386 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242388 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.OBO2DE-429 @manual @mobile @regression
  @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the CUSTOMER_UPDATE_DATA forbidden use case cannot edit the personal name
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has the "CUSTOMER_UPDATE_DATA" forbidden use case
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "personal_name_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv    | parent_test_plan | jira_id      |
          | blaude  | 13.10 |                  | QANOV-242394 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242396 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay  user with the CUSTOMER_UPDATE_DATA forbidden use case cannot edit the line number
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "CUSTOMER_UPDATE_DATA" forbidden use case
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "line_number_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-242418 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242420 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.OBO2DE-275 @manual @mobile @regression
  @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the ACCOUNT_UPDATE_DATA forbidden use case cannot edit the bank account
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_UPDATE_DATA" forbidden use case
      And user has the "Bank Account" module configured in CMS for "Bank Account" page
      And user has the matching subscription selected in the account
      And user is in the "Bank Account" page
     Then the "title" textfield with "Bankverbindung bearbeiten" text is displayed
      And the "description" textfield with "Als Kontoinhaber kannst du dein Bankkonto hier bearbeiten." text is displayed
      And the "account_holder_value" textfield is displayed
      And the "account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "account_holder_link" link is not displayed
      And the "iban_value" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "iban_label" textfield with "IBAN" text is displayed
      And the "bic_value" textfield is displayed
      And the "bic_label" textfield with "BIC" text is displayed
      And the "bank_name_value" textfield is displayed
      And the "bank_name_label" textfield with "Bankname" text is displayed
      And the "foreign_bank_account_link" link is not displayed
      And the "about_bank_account_title" textfield with "INFORMATIONEN ZUR DATENVERARBEITUNG" text is displayed
      And the "about_bank_account_description" textfield with "Ich/Wir ermächtigen Telefónica Germany GmbH & Co. OHG Zahlungen von meinem/unseren Konto mittels Lastschrift einzuziehen. Zugleich weise ichh/wir meinen/unseren Zahlungsdienstleister an, die von der Telefónica Germany GmbH & Co. OHG auf mein/unser Konto gezogenen Lastschriften einzulösen (SEPA-Mandat). Die Änderung muss mind. 7 Tage vor Fälligkeit der nächsten Rechhnung durchgeführt werden." text is displayed
      And the "data declaration_textfield" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data declaration_link" link with "Datenschutzerklärung" text is displayed
      And the "edit_bank_account_button" button is not displayed
      And the "ok_button" button with "Okay" text is displayed

    @raitt_drop1
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-242397 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242399 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the ACCOUNT_UPDATE_DATA forbidden use case cannot edit the digital invoice email
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has "digital_bill" service in "activated" status
      And user has the "ACCOUNT_UPDATE_DATA" forbidden use case
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user has the matching subscription selected in the account
      And user is in the "Digital Bill" page
     Then the "title" textfield with "E-Rechnungs-E-Mail bearbeiten" text is displayed
      And the "description" textfield with "Du erhältst deine Rechnung monatlich per E-Mail." text is displayed
      And the "email_inputtext" inputtext is not displayed
      And the "email_example" textfield is not displayed
      And the "email_value" textfield is displayed
      And the "email_title" textfield with "E-Mail-Adresse" text is displayed
      And the "email_info.description" textfield with "Zusätzlich zur E-Mail können wir dich auch per SMS an Ihre neue Rechnung erinnern." text is displayed
      And the "billing_sms_notifications_entrypoint" entrypoint with "Rechnungs-Benachrichtigung per SMS" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "change_digital_bill_email_button" button is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | parent_test_plan | jira_id      |
          | blaude  | 14.1 | mobile_line |                  | QANOV-242401 |

    Examples:
          | product | cv   | products                     | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-437471     | QANOV-242403 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the ACCOUNT_UPDATE_DATA forbidden use case cannot edit the physical billing address
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "ACCOUNT_UPDATE_DATA" forbidden use case
      And user has the "Billing Address" module configured in CMS for "Billing Address" page
      And user has the matching subscription selected in the account
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
     Then the "address_info.title" textfield with "INFOS FUR RECHNUNGSADRESSE" text is displayed
      And the "address_info.description" textfield with "Dies ist die Adresse, die in Zukunft in der App hinterlegt sein wird. Diese kann jederzeit in deinem Profil bearbeitet werden." text is displayed
      And the "zip_code_inputtext" inputtext is not displayed
      And the "zip_code_value" textfield is displayed
      And the "zip_code_title" textfield with "Postleitzahl" text is displayed
      And the "city_inputtext" inputtext is not displayed
      And the "city_value" textfield is displayed
      And the "city_title" textfield with "Ort" text is displayed
      And the "street_name_inputtext" inputtext is not displayed
      And the "street_name_value" textfield is displayed
      And the "street_name_title" textfield with "Straße" text is displayed
      And the "street_number_inputtext" inputtext is not displayed
      And the "street_number_title" textfield with "Hausnummer" text is displayed
      And the "additional_info_inputtext" inputtext is not displayed
      And the "additional_info_title" textfield with "Adresszusatz" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_billing_address_button" button is not displayed

    @raitt_drop1
    Examples:
          | product | cv    | products    | parent_test_plan | jira_id      |
          | blaude  | 13.10 | mobile_line |                  | QANOV-242405 |

    Examples:
          | product | cv   | products                     | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-437471     | QANOV-242407 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the ACCOUNT_UPDATE_DATA forbidden use case cannot edit the mailbox billing address
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has "billing_address" service in "activated" status
      And user has a "mailbox" billing address
      And user has the "ACCOUNT_UPDATE_DATA" forbidden use case
      And user has the "Billing Address" module configured in CMS for "Billing Address" page
      And user has the matching subscription selected in the account
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "address_info.title" textfield with "INFOS FUR RECHNUNGSADRESSE" text is displayed
      And the "address_info.description" textfield with "Dies ist die Adresse, die in Zukunft in der App hinterlegt sein wird. Diese kann jederzeit in deinem Profil bearbeitet werden." text is displayed
      And the "pobox_inputtext" inputtext is not displayed
      And the "pobox_value" textfield is displayed
      And the "pobox_title" textfield with "Postfach" text is displayed
      And the "zip_code_inputtext" inputtext is not displayed
      And the "zip_code_value" textfield is displayed
      And the "zip_code_title" textfield with "Postleitzahl" text is displayed
      And the "city_inputtext" inputtext is not displayed
      And the "city_value" textfield is displayed
      And the "city_title" textfield with "Ort" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_billing_address_button" button is not displayed

    @raitt_drop1
    Examples:
          | product | cv    | products    | parent_test_plan | jira_id      |
          | blaude  | 13.10 | mobile_line |                  | QANOV-242409 |

    Examples:
          | product | cv   | products                     | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-437471     | QANOV-242411 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the ACCOUNT_UPDATE_DATA forbidden use case cannot edit the shipping address
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "shipping address" stored in the contact details
      And user has the "ACCOUNT_UPDATE_DATA" forbidden use case
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     Then the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du hier eine deutsche Adresse hinterlegen" text is displayed
      And the "account_holder_value" textfield is displayed
      And the "account_holder_label" textfield with "Vertragsinhaber" text is displayed
      And the "account_holder_link" link is not displayed
      And the "zip_code_inputtext" inputtext is not displayed
      And the "zip_code_value" textfield is displayed
      And the "zip_code_title" textfield with "Postleitzahl" text is displayed
      And the "city_inputtext" inputtext is not displayed
      And the "city_value" textfield is displayed
      And the "city_title" textfield with "Ort" text is displayed
      And the "street_name_inputtext" inputtext is not displayed
      And the "street_name_value" textfield is displayed
      And the "street_name_title" textfield with "Straße" text is displayed
      And the "street_number_inputtext" inputtext is not displayed
      And the "street_number_title" textfield with "Hausnummer" text is displayed
      And the "address_info.title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info.description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button is not displayed
      And the "ok_button" button with "Okay" text is displayed

    @raitt_drop1
    Examples:
          | product | cv    | parent_test_plan | jira_id      |
          | blaude  | 13.10 |                  | QANOV-242390 |

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242392 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A BOX7 user with the ACCOUNT_UPDATE_DATA forbidden use case cannot edit the phone payments
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    This screen will be displayed in "only read" mode. Only the services selected by the user will be displayed in the list.
    Given user has a "box7" account type
      And user has a "mobile_line" product
      And user has the "ACCOUNT_UPDATE_DATA" forbidden use case
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Manage Phone Payments" page
     Then the "title" textfield with "Drittanbieterdienste" text is displayed
      And the "description1" textfield with "Diese Einstellung gilt für alle SIM-Karten mit der Rufnummer des ausgewählten Vertrags." text is displayed
      And the "description2" textfield with "Wähle aus, welche Dienste über die von dir ausgewählte Rufnummer bezahlt werden sollen." text is displayed
      And the "services_list" list is displayed
      And each element in the "services_list" list has the "service_name" field
      And each element in the "services_list" list has the "service_description" field
      And the "save_changes_button" button is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-242413 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242415 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.3 @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user with the ACCOUNT_UPDATE_RECHARGE_OPTIONS forbidden use case cannot edit the automatic topups
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_UPDATE_RECHARGE_OPTIONS" forbidden use case
      And user has the "Automatic Topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     Then the "automatic_topup_title" textfield with "Automatische Aufladung" text is displayed
      And the "automatic_topup_description" textfield is not displayed
      And the "balance_low_topup.status_tag" textfield with the "(Nicht aktiv|Aktiv)" format is displayed
      And the "balance_low_topup.title" textfield with "Aufladung bei geringem Guthaben" text is displayed
      And the "balance_low_topup.description" textfield with "Wähle aus, bei welchem Betrag dein Guthaben aufgeladen werden soll." text is displayed
      And the "balance_low_topup.check" checkbox is not displayed
      And the "balance_low_topup.minimum_balance_selector" selector is not displayed
      And the "balance_low_topup.minimum_balance_value" textfield with the "(\d+,\d{2} €|Amount not selected)" format is displayed
      And the "balance_low_topup.minimum_balance_label" textfield with "Guthaben geringer als" text is displayed
      And the "balance_low_topup.topup_amount_title" textfield with "Bei erreichen des oben ausgewählten Betrages folgenden Betrag aufladen:" text is displayed
      And the "balance_low_topup.topup_amount_selector" selector is not displayed
      And the "balance_low_topup.topup_amount_value" textfield with the "(\d+,\d{2} €|Amount not selected)" format is displayed
      And the "balance_low_topup.topup_amount_label" textfield with "Aufladebetrag" text is displayed
      And the "same_date_topup.status_tag" textfield with the "(Nicht aktiv|Aktiv)" format is displayed
      And the "same_date_topup.title" textfield with "Monatliche Aufladung" text is displayed
      And the "same_date_topup.description" textfield with "Wähle aus, an welchem Tag und Monat dein Guthaben aufgeladen werden soll." text is displayed
      And the "same_date_topup.check" checkbox is not displayed
      And the "same_date_topup.frequency_selector" selector is not displayed
      And the "same_date_topup.frequency_value" textfield with the "(Jeweils am \d+. des Monats|Amount not selected)" format is displayed
      And the "same_date_topup.frequency_label" textfield with "Aufladung" text is displayed
      And the "same_date_topup.topup_amount_title" textfield with "Aufladebetrag" text is displayed
      And the "same_date_topup.topup_amount_selector" selector is not displayed
      And the "same_date_topup.topup_amount_value" textfield with the "(\d+,\d{2} €|Amount not selected)" format is displayed
      And the "same_date_topup.topup_amount_label" textfield with "Aufladebetrag" text is displayed
      And the "pay_with_bank_account_when_insufficient_balance.status_tag" textfield with the "(Nicht aktiv|Aktiv)" format is displayed
      And the "pay_with_bank_account_when_insufficient_balance.title" textfield with "Optionsgebühren bei nicht ausreichendem Guthaben" text is displayed
      And the "pay_with_bank_account_when_insufficient_balance.description" textfield with "Gebüren für Optionen und Flatrates sollen von meinem Bankkonto abgebucht werden, wenn das Prepaid-Guthaben nicht ausreicht." text is displayed
      And the "pay_with_bank_account_when_insufficient_balance.check" checkbox is not displayed
      And the "automatic_topup_save_button" button is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-242421 |
          | o2de    | QANOV-242422 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.3 @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user with the ACCOUNT_UPDATE_RECHARGE_OPTIONS forbidden use case cannot edit the SMS topup
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    If the topup with sms is activated, an additional "sms_topup_amount_title" textfield will be displayed with the text "Aufladebetrag".
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "bank_account" service in "activated" status
      And user has the "ACCOUNT_UPDATE_RECHARGE_OPTIONS" forbidden use case
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user is in the "SMS topup" page
     Then the "sms_topup_title" textfield with "Aufladung über SMS" text is displayed
      And the "sms_topup_description" textfield is not displayed
      And the "sms_topup_switch_status" textfield with the "(Nicht aktiv|Aktiv)" format is displayed
      And the "sms_topup_switch_name" textfield with "Aufladung über SMS" text is displayed
      And the "sms_topup_switch" switch is not displayed
      And the "sms_topup_switch_description" textfield is not displayed
      And the "sms_topup_amount_selector" selector is not displayed
      And the "sms_topup_amount_value" textfield with the "(\d+,\d{2} €|Aufladebetrag nicht ausgewählt)" format is displayed
      And the "sms_topup_save_button" button is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-291293 |
          | o2de    | QANOV-291294 |

  @jira.<jira_id> @android @ios @jira.cv.14.9 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with the <fuc> forbidden use case cannot request the suspension of his contract from "Profile" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    The "my_contracts.decommission_contract_entrypoint" entrypoint cannot be hidden because it depends on a Third party call.
    A "No Product Available" screen is displayed as the action cannot be applied to any product.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has the "<fuc>" forbidden use case
      And user has the "My contracts" module configured in CMS for "My contracts" page
      And user is in the "My contracts" page
     Then the "No Product Available" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produktliste" text is displayed
      And the "subtitle" textfield with "Kein Produkt für diesen Vorgang vorhanden" text is displayed
      And the "button" button with "Zu meinem Vertrag" text is displayed

    Examples:
          | fuc                            | jira_id      |
          | ACCOUNT_UPDATE_SUSPENSION      | QANOV-242423 |
          | SUBSCRIPTION_UPDATE_SUSPENSION | QANOV-242424 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario Outline: A BOX7 prepay user with the CUSTOMER_SHOW_BALANCE forbidden use case cannot see the balance module in the dashboard
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has the "Balance" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "balance" module is not displayed
      And the "balance_movements" module is displayed

    @raitt_drop1
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-312672 |

    Examples:
          | product | jira_id      |
          | o2de    | QANOV-312673 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A multiproduct user with the SUBSCRIPTION_CALLBACK_REQUEST_SHOW forbidden use case for not all subscriptions cannot set a callback with a support agent from the "Call me back" flow
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "several" products
      And user has the "SUBSCRIPTION_CALLBACK_REQUEST_SHOW" forbidden use case for not all subscriptions
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Call Me Back Info" module configured in CMS for "Call Me Back Info" page
      And user has the "Call Me Back Choose Product" module configured in CMS for "Call Me Back Choose Product" page
      And user is in the "Support" page
     When clicks on the "contact.call_me_back" entrypoint
      And the "Call Me Back Info" page is displayed
      And clicks on the "get_appointment_button" button
      And the "Call Me Back Choose Product" page is displayed
     Then the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Choose one product" text is displayed
      And the "products_list" list is displayed
      And only the products without the "SUBSCRIPTION_CALLBACK_REQUEST_SHOW" forbidden use case are displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 14.0 |                  | QANOV-242427 |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242428 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A multiproduct user with the SUBSCRIPTION_CALLBACK_REQUEST_SHOW forbidden use case for not all subscriptions cannot see the "Call me back" option in the "All contact channels" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has "several" products
      And user has a reason with "call_me_back" channels available
      And user has the "SUBSCRIPTION_CALLBACK_REQUEST_SHOW" forbidden use case for not all subscriptions
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user is in the "Support" page
     When clicks on the "contact.all_contact_channels" entrypoint
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list that has the SUBSCRIPTION_CALLBACK_REQUEST_SHOW forbidden use case
      And the "Contact Reasons" page is displayed
      And clicks on any element in the "reasons_list" list
      And the "All Contact Channels" page is displayed
     Then the "header.title" textfield with "[CONTEXT:previous_reason_selected]" text is displayed
      And the "header.description" textfield with "These are the options available for this topic" text is displayed
      And the "options_list" list is displayed
      And the "call_me_back" module is not displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 14.0 |                  | QANOV-242429 |
          | o2de    | 14.2 | QANOV-437471     | QANOV-242430 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile @regression
  @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the SUBSCRIPTION_CALLBACK_REQUEST_SHOW forbidden use case for all subscriptions cannot request a new callback
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "SUBSCRIPTION_CALLBACK_REQUEST_SHOW" forbidden use case for all subscriptions
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user is in the "Support" page
     When clicks on the "contact.call_me_back" entrypoint
     Then the "Access Denied" page is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Zugriff nicht möglich" text is displayed
      And the "description" textfield with "Dieser Teil der App ist aktuell nicht verfügbar. Bitte kontaktiere unseren Kundenservice falls du hierzu informationen brauchst." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | OBO2DE-249 |                  | QANOV-242431 |

    Examples:
          | product | cv   | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 |         | QANOV-437471     | QANOV-242432 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile @regression
  @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the SUBSCRIPTION_CALLBACK_REQUEST_SHOW forbidden use case for all subscriptions cannot see the "Call me back" option in the "All contact channels" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a reason with "call_me_back" channels available
      And user has the "SUBSCRIPTION_CALLBACK_REQUEST_SHOW" forbidden use case for all subscriptions
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user is in the "All Contact Channels" page
     Then the "header.title" textfield with "[CONTEXT:previous_reason_selected]" text is displayed
      And the "header.description" textfield with "Folgende Kontaktmöglichkeiten stehen dir zur Verfügung" text is displayed
      And the "options_list" list is displayed
      And the "call_me_back" module is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | detects | parent_test_plan | jira_id      |
          | blaude  | 14.0 |         |                  | QANOV-242433 |

    Examples:
          | product | cv   | detects   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | O2DE-2879 | QANOV-437471     | QANOV-242434 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A BOX7 user with the SUBSCRIPTION_CONSENTS forbidden use case cannot access the "Consent Management" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has the "SUBSCRIPTION_CONSENTS" forbidden use case
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
      And user is in the "Security And Privacy" page
     Then the "security_and_privacy.consent_management_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | parent_test_plan | jira_id      |
          | blaude  |                  | QANOV-242435 |

    Examples:
          | product | parent_test_plan | jira_id      |
          | o2de    | QANOV-437471     | QANOV-242436 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the SUBSCRIPTION_MAILBOX_PIN forbidden use case cannot edit a PIN for their mailbox
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has the "SUBSCRIPTION_MAILBOX_PIN" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Mobile Dashboard" list to render
      And user has the matching subscription selected in the account
      And user is in the "Services" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
     Then the "services.mailbox_configuration_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line |                  | QANOV-242437 |

    Examples:
          | product | cv   | products                        | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;home_spot;data_spot | QANOV-437471     | QANOV-242438 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with the SUBSCRIPTION_PHONE_NUMBER_OUT_PORTING forbidden use case cannot port-out a number
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "SUBSCRIPTION_PHONE_NUMBER_OUT_PORTING" forbidden use case
      And user has not the "SUBSCRIPTION_PHONE_NUMBER_PORTING" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Mobile Dashboard" list to render
      And user has the matching subscription selected in the account
      And user is in the "Services" page
     When clicks on the "services.porting_entrypoint" entrypoint
      And the "Porting Choose Type" page is displayed
     Then the "title" textfield with "Bring your phone number with you" text is displayed
      And the "port_in_option.name" textfield with "To Blau" text is displayed
      And the "port_in_option.radiobutton" button is displayed
      And the "port_out_option.name" textfield is not displayed
      And the "port_out_option.radiobutton" button is not displayed
      And the "port_in.title" textfield with "TO BLAU" text is displayed
      And the "port_in.description" textfield with "Do you want to take your phone number from another carrier to Blau?" text is displayed
      And the "port_out.title" textfield is not displayed
      And the "port_out.description" textfield is not displayed
      And the "continue_button" button with "Weiter" text is displayed

    @raitt_drop1
    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-242439 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242440 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with the SUBSCRIPTION_PHONE_NUMBER_PORTING forbidden use case cannot port-in a number
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "SUBSCRIPTION_PHONE_NUMBER_PORTING" forbidden use case
      And user has not the "SUBSCRIPTION_PHONE_NUMBER_OUT_PORTING" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Mobile Dashboard" list to render
      And user has the matching subscription selected in the account
      And user is in the "Services" page
     When clicks on the "services.porting_entrypoint" entrypoint
      And the "Porting Choose Type" page is displayed
     Then the "title" textfield with "Bring your phone number with you" text is displayed
      And the "port_in_option.name" textfield is not displayed
      And the "port_in_option.radiobutton" button is not displayed
      And the "port_out_option.name" textfield with "To another carrier" text is displayed
      And the "port_out_option.radiobutton" button is displayed
      And the "port_in.title" textfield is not displayed
      And the "port_in.description" textfield is not displayed
      And the "port_out.title" textfield with "TO ANOTHER CARRIER" text is displayed
      And the "port_out.description" textfield with "Here you can release your phone number for a change of carrier from a current contract (porting declaration)" text is displayed
      And the "continue_button" button with "Weiter" text is displayed

    @raitt_drop1
    Examples:
          | product | cv    | jira_id      |
          | blaude  | 13.10 | QANOV-242441 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242442 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with the SUBSCRIPTION_PHONE_NUMBER_PORTING and SUBSCRIPTION_PHONE_NUMBER_OUT_PORTING forbidden use cases cannot port-in or port-out a number
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "SUBSCRIPTION_PHONE_NUMBER_PORTING" forbidden use case
      And user has the "SUBSCRIPTION_PHONE_NUMBER_OUT_PORTING" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Mobile Dashboard" list to render
      And user has the matching subscription selected in the account
      And user is in the "Services" page
     Then the "Access Denied" page is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Zugriff nicht möglich" text is displayed
      And the "description" textfield with "Dieser Teil der App ist aktuell nicht verfügbar. Bitte kontaktiere unseren Kundenservice falls du hierzu informationen brauchst." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-242443 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242444 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the SUBSCRIPTION_RESERVE_CANCELLATION forbidden use case cannot request the cancellation of his contract from "My contracts" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has the "SUBSCRIPTION_RESERVE_CANCELLATION" forbidden use case
      And user has the "My contracts" module configured in CMS for "My contracts" page
      And user is in the "My contracts" page
     When clicks on the "my_contracts.cancel_contract_entrypoint" entrypoint
     Then the "Access Denied" page is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Zugriff nicht möglich" text is displayed
      And the "description" textfield with "Dieser Teil der App ist aktuell nicht verfügbar. Bitte kontaktiere unseren Kundenservice falls du hierzu informationen brauchst." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line |                  | QANOV-242445 |

    Examples:
          | product | cv   | products                     | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-437471     | QANOV-242446 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile @regression
  Scenario Outline: A postpay user with the SUBSCRIPTION_ROAMING forbidden use case cannot consult roaming prices from "My Tariff" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user has the matching subscription selected in the account
      And user is in the "My Tariff" page
     Then the "price_list.zones_price_list_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | detects   | jira_id      |
          | blaude  | 13.9 | O2DE-2700 | QANOV-242449 |

    Examples:
          | product | cv   | detects | jira_id      |
          | o2de    | 14.2 |         | QANOV-242450 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with the SUBSCRIPTION_ROAMING forbidden use case cannot consult roaming prices from "Extra International Data Usage" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has "international_data" allowances in the "mobile_line" product
      And user has the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the "International extra data usage" module configured in CMS for "Extra International Data Usage" page
      And user has the matching subscription selected in the account
      And user is in the "International extra data usage" page
     Then the "zones_price_list_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-242451 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242452 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with the SUBSCRIPTION_THIRD_PARTY_SERVICES forbidden use case cannot see their third party payments
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has the "SUBSCRIPTION_THIRD_PARTY_SERVICES" forbidden use case
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bills_services.third_party_service_charges_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | jira_id      |
          | blaude  | 13.9 | mobile_line | QANOV-242453 |

    Examples:
          | product | cv   | products                     | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-242454 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A BOX7 user with the SUBSCRIPTION_THIRD_PARTY_SERVICES_SETTINGS forbidden use case cannot manage third party configurations
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "box7" account type
      And user has a "mobile_line" product
      And user has the "SUBSCRIPTION_THIRD_PARTY_SERVICES_SETTINGS" forbidden use case
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "manage_phone_payments_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-242455 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-242456 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @jira.link.parent_test_plan.<parent_test_plan>
  Scenario Outline: A postpay user with the SUBSCRIPTION_VERIFICATION_CHANGE_NAME forbidden use case cannot access to "Personal Name" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "<products>" product
      And user has the "SUBSCRIPTION_VERIFICATION_CHANGE_NAME" forbidden use case
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "personal_name_entrypoint" entrypoint is not displayed

    @raitt_drop1
    Examples:
          | product | cv   | products    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line |                  | QANOV-242457 |

    Examples:
          | product | cv   | products                     | parent_test_plan | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-437471     | QANOV-242458 |

  @jira.QANOV-242459 @android @ios @jira.cv.Future @manual @mobile @o2de @regression @jira.link.parent_test_plan.QANOV-437471
  Scenario: A postpay user with the SUBSCRIPTION_VERIFICATION_SOHO forbidden use case cannot access to "Self Employed Verification" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has the "SUBSCRIPTION_VERIFICATION_SOHO" forbidden use case
      And user has the "My contracts" module configured in CMS for "My contracts" page
      And user is in the "My contracts" page
     Then the "my_contracts.self_employed_verification_entrypoint" entrypoint is not displayed

  @jira.QANOV-242460 @android @ios @jira.cv.Future @manual @mobile @o2de @regression @jira.link.parent_test_plan.QANOV-437471
  Scenario: A user with the SUBSCRIPTION_VERIFICATION_YOUNG_PEOPLE forbidden use case cannot access to "Young Age Verification" screen
    Forbidden Use Cases (FUC) can be at "customer", "account" or "subscription" level. You can look at the prefix of the
    FUC name to see the level.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has the "SUBSCRIPTION_VERIFICATION_YOUNG_PEOPLE" forbidden use case
      And user has the "My contracts" module configured in CMS for "My contracts" page
      And user is in the "My contracts" page
     Then the "my_contracts.young_age_verification_entrypoint" entrypoint is not displayed

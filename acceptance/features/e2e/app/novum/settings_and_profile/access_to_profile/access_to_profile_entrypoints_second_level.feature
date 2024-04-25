# -*- coding: utf-8 -*-
@jira.QANOV-126426
Feature: Access to Profile Entrypoints Second Level

  Actions Before each Scenario:
    Given user is in the "Profile" page

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-47205 @mobile @sanity
  Scenario Outline: A <product> user with <account_type> account type can access to the Security&Privacy screen
    other_affected_versions="2021-07"
    Given user has a "<account_type>" account type
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "security_and_privacy_list" list with "<entrypoint_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | cv   | account_type   | product | entrypoint_list                                                                                                                                                           | parent_test_plan | jira_id     |
          | 10.3 | legacy postpay | o2uk    | PIN/Biometric;Change security question;Manage access to 18+ websites;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences | QANOV-24141      | QANOV-26144 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.11 @manual @mobile @sanity @vivobr @old_app
  Scenario Outline: A vivo user logged in by <login_type> can access to the Security&Privacy screen
    Given user has logged by "<login_type>"
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "security_and_privacy_list" list with "<entrypoint_list>" entrypoints is displayed
      And the "pin_subtitle" textfield with "Proteja a sua privacidade" text is displayed
      And the "session_management_subtitle" textfield with "Gerencia os dispositivos com acesso" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | login_type | entrypoint_list                                                    | ber | jira_id      |
          | usr/pwd    | Acesso biométrico e PIN;Acceso a sua conta;Alterar senha de acesso | ber | QANOV-522973 |
          | otp        | Acesso biométrico e PIN;Acceso a sua conta                         |     | QANOV-522974 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @sanity @vivobr
  Scenario Outline: A vivo user logged in by <login_type> can access to the Security&Privacy screen
    Given user has logged by "<login_type>"
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "title" textfield with "Segurança e privacidade" text is displayed
      And the "header_subtitle" textfield with "Voce pode personalizar tudo por aqui" text is displayed
      And the "security_and_privacy_list" list with "<entrypoint_list>" entrypoints is displayed
      And the "pin_subtitle" textfield with "Proteja a sua privacidade" text is displayed
      And the "session_management_subtitle" textfield with "Gerencia os dispositivos com acesso" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @ber
    Examples:
          | login_type | entrypoint_list                                                    | jira_id      |
          | usr/pwd    | Acesso biométrico e PIN;Acceso a sua conta;Alterar senha de acesso | QANOV-453416 |

    Examples:
          | login_type | entrypoint_list                            | jira_id      |
          | otp        | Acesso biométrico e PIN;Acceso a sua conta | QANOV-453417 |

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @har @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-47205 @mobile @o2uk
  Scenario Outline: A o2uk user with <account_type> account type and not having a legacy postpay line can access to the Security&Privacy screen
    other_affected_versions="2021-07, 2022-23"
    Given user has a "<account_type>" account type
      And user does not have a "legacy postpay" account type
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "security_and_privacy_list" list with "PIN/Biometric;Change security question;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | cv   | account_type  | parent_test_plan                                 | ber | test_priority | jira_id     |
          | 10.3 | legacy prepay | QANOV-24141                                      |     | smoke         | QANOV-6196  |
          | 12.4 | AO2 postpay   | QANOV-24140                                      | ber | sanity        | QANOV-47864 |
          | 12.0 | device        | QANOV-35253:QANOV-24141:QANOV-77438:QANOV-178803 |     | smoke         | QANOV-37525 |

  @jira.<jira_id> @android @har @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-47205 @manual @mobile @o2uk @regression
  Scenario Outline: A o2uk user with <account_type> account type and a legacy postpay line can access to the Security&Privacy screen
    other_affected_versions="2021-07, 2022-23"
    Given user has the "legacy postpay;<account_type>" account types
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
     Then the "security_and_privacy_list" list with "PIN/Biometric;Change security question;Manage access to 18+ websites;Session management;Terms and conditions;Delete account;Forgotten sign in details;Network preferences" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | cv   | account_type  | parent_test_plan                                 | jira_id      |
          | 10.3 | legacy prepay | QANOV-24141                                      | QANOV-189491 |
          | 12.4 | AO2 postpay   | QANOV-24140                                      | QANOV-189492 |
          | 12.0 | device        | QANOV-35253:QANOV-24141:QANOV-77438:QANOV-178803 | QANOV-189493 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @smoke @har
  Scenario Outline: A BOX7 user can access to the "Personal data" screen
    Given user has a "box7" account type
# TODO(lsl): to implement when this info is available
# https://jira.tid.es/browse/NOV-242537
# And user has not PKK availability
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
     When clicks on the "personal_data_entrypoint" entrypoint
     Then the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed
      And the "personal_data_list" list with "[LANG:profile.dashboard.personal_data.change_contact_details];[LANG:profile.dashboard.personal_data.change_login_credentials]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | detects    | parent_test_plan          | jira_id      |
          | blaude  | 13.9 | OBO2DE-726 | QANOV-402198:QANOV-558162 | QANOV-217322 |

    Examples:
          | product | cv   | detects | parent_test_plan          | jira_id      |
          | o2de    | 14.2 |         | QANOV-437471:QANOV-558162 | QANOV-217323 |

  @jira.<jira_id> @<product> @android @manual @ber @ios @jira.cv.Future @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @sanity @e2e @har
  Scenario Outline: A BOX7 user can access to the "Personal data" screen
    Given user has a "box7" account type
      And user has PKK availability
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
     When clicks on the "personal_data_entrypoint" entrypoint
     Then the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed
      And the "personal_data_list" list with "[LANG:profile.dashboard.personal_data.change_contact_details];[LANG:profile.dashboard.personal_data.change_login_credentials];[LANG:profile.dashboard.personal_data.display_pkk]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | parent_test_plan          | jira_id      |
          | blaude  | QANOV-402198:QANOV-558162 | QANOV-596238 |
          | o2de    | QANOV-437471:QANOV-558162 | QANOV-596239 |

  @jira.QANOV-416190 @android @ber @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @raitt_drop1 @sanity @har
  Scenario: A RAITT user can access to the "Personal data" screen
    In the future, the display_pkk entrypoint will be also available for RAITT users.
    Given user has a "raitt" account type
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
     When clicks on the "personal_data_entrypoint" entrypoint
     Then the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed
      And the "personal_data_list" list with "[LANG:profile.dashboard.personal_data.change_contact_details];[LANG:profile.dashboard.personal_data.change_password]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.detects.O2DE-3153 @smoke @har
  Scenario Outline: A postpay user with a <user_product> can access to the "Change contact details" screen from the "Personal data" screen
    Shipping address should be displayed in full
    Given user has a "postpay" account type
      And user has a "<user_product>" product in "active" status
      And user has not the "CUSTOMER_UPDATE_DATA" forbidden use case
      And user has not the "SUBSCRIPTION_VERIFICATION_CHANGE_NAME" forbidden use case
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint.name" entrypoint with "E-Mail" text is displayed
      And the "contact_number_entrypoint.name" entrypoint with "Kontaktrufnummer" text is displayed
      And the "shipping_address_entrypoint.name" entrypoint with "Adresse" text is displayed
      And the "personal_name_entrypoint.name" entrypoint with "Namen ändern" text is displayed
      And the "line_number_entrypoint.name" entrypoint with "Rufnummerntausch" text is displayed
      And the "hotline_pin_entrypoint.name" entrypoint with "Persönliche Kundenkennzahl" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed

    @automatic @live @mobile @next @raitt_drop1
    Examples:
          | product | cv   | user_product | jira_id      |
          | blaude  | 13.9 | mobile_line  | QANOV-217759 |

    @automatic @live @mobile @next
    Examples:
          | product | cv   | user_product | jira_id      |
          | o2de    | 14.2 | mobile_line  | QANOV-217760 |

    @manual
    Examples:
          | product | cv    | user_product     | jira_id      |
          | o2de    | 14.11 | internet_at_home | QANOV-310943 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @manual @mobile @smoke @har
  Scenario Outline: A postpay user with just MyHandy products can access to the "Change contact details" screen from the "Personal data" screen
    Shipping address should be displayed in full
    Given user has a "my_handy" product in "active" status
      And user does not have "mobile_line" product
      And user does not have "internet_at_home" product
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint.name" entrypoint with "E-Mail" text is displayed
      And the "contact_number_entrypoint.name" entrypoint with "Kontaktrufnummer" text is displayed
      And the "shipping_address_entrypoint.name" entrypoint with "Adresse" text is displayed
      And the "hotline_pin_entrypoint.name" entrypoint with "Persönliche Kundenkennzahl" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-283595 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-283596 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.detects.O2DE-2082 @manual @mobile @smoke @har
  Scenario Outline: A prepay user can access to the "Change contact details" screen from the "Personal data" screen
    Shipping address should be displayed in full
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint.name" entrypoint with "E-Mail" text is displayed
      And the "contact_number_entrypoint.name" entrypoint with "Kontaktrufnummer" text is displayed
      And the "shipping_address_entrypoint.name" entrypoint with "Adresse" text is displayed
      And the "hotline_pin_entrypoint.name" entrypoint with "Persönliche Kundenkennzahl" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-283597 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-283598 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.7 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A user with just one product can access to the Pin for hotline entrypoint
    Given user has "1" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Change Contact Details" page
     When clicks on the "hotline_pin_entrypoint" entrypoint
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | header    | parent_test_plan | jira_id      |
          | blaude  | Mein Blau |                  | QANOV-410596 |
          | o2de    | Mein o2   | QANOV-437471     | QANOV-410597 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.7 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A user with several products can access to Disambiguation page after tapping on the hotline pin entrypoint
    Given user has "several" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Change Contact Details" page
     When clicks on the "hotline_pin_entrypoint" entrypoint
     Then the "Choose Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "product_icon" field
      And each element in the "products_list" list has the "name" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | parent_test_plan | jira_id      |
          | blaude  |                  | QANOV-410598 |
          | o2de    | QANOV-437471     | QANOV-410599 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.7 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A user with several products can access to the Pin for hotline entrypoint
    Given user has "several" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Change Contact Details" page
     When clicks on the "hotline_pin_entrypoint" entrypoint
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Choose Product" page is displayed

    Examples:
          | product | header    | parent_test_plan | jira_id      |
          | blaude  | Mein Blau |                  | QANOV-410600 |
          | o2de    | Mein o2   | QANOV-437471     | QANOV-410601 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.detects.O2DE-3077
  @jira.link.detects.OBO2DE-116 @jira.link.detects.OBO2DE-134 @live @mobile @next @sanity @har
  Scenario Outline: A prepay user with an active mobile line can access to the "Payment settings" screen
    If the bank account entrypoint is not displayed, it can be because the user has the forbidden use case
    ACCOUNT_REGISTER_FOR_DIRECT_DEBIT and has not a bank account saved.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "bank_account" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Deine Zahlungseinstellungen" text is displayed
      And the "description" textfield with "Hier kannst du deine Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And each element in the "payment_settings_list" list has the "title" field with "[LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.manage_phone_payments]" texts
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-217324 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-217325 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @live @mobile @next @sanity @har
  Scenario Outline: A postpay user with mobile line product/s and without MyHandy product can access to the "Payment settings" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user does not have "my_handy" product
      And user has not the "ACCOUNT_UPDATE_BANK_ACCOUNT" forbidden use case
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Deine Zahlungseinstellungen" text is displayed
      And the "description" textfield with "Hier kannst du deine Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And each element in the "payment_settings_list" list has the "title" field with "[LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments]" texts
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-217326 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-217337 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @smoke @har
  Scenario Outline: A postpay user with only <user_product> product/s can access to the "Payment settings" screen
    Given user has a "postpay" account type
      And user has any "<user_product>" product in "active" status
      And user does not have the "mobile_line;my_handy" products
      And user has not the "ACCOUNT_UPDATE_BANK_ACCOUNT" forbidden use case
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Deine Zahlungseinstellungen" text is displayed
      And the "description" textfield with "Hier kannst du deine Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "<payment_settings_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | user_product        | payment_settings_list                                                                                                                                                                                                                   | jira_id      |
          | dsl;cable;fiber     | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address]                                                                 | QANOV-217338 |
          | home_spot;data_spot | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments] | QANOV-576654 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: A postpay user with Telco product/s and MyHandy product/s can access to the "Distributive Payment Settings" screen
    Telco products: mobile line, internet@home.
    Given user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Distributive Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wähle ein Produkt" text is displayed
      And the "description" textfield with "Du hast möglicherweise unterschiedliche Bankverbindungen für deine Produkte hinterlegt." text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "title" field
      And each element in the "products_list" list has the "label" field
      And each element in the "products_list" list has the "chevron_icon" field
      And the "0" index in the "products_list" list has the "title" field with "Telco-Produkte" text
      And the "0" index in the "products_list" list has the "label" field with "Weitere Einstellungen anzeigen" text
      And all my handy products from the user are displayed in "products_list" list
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | postpay_products             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | mobile_line                  |                  | QANOV-217339 |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-437471     | QANOV-217340 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line product/s and MyHandy product/s can access to the "Payment Settings" screen for Telco product/s
    Telco products: mobile line, internet@home.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "my_handy" product in "active" status
      And user has not the "ACCOUNT_UPDATE_BANK_ACCOUNT" forbidden use case
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier kannst du deine Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "[LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Distributive Payment Settings" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217339 | QANOV-217341 |
          | o2de    | 14.2 | QANOV-217340 | QANOV-217342 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-217340
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with <user_product> and MyHandy product/s but without mobile line product can access to the "Payment Settings" screen for Telco product/s
    Telco products: mobile line, internet@home.
    Given user has a "postpay" account type
      And user has any "<user_product>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user does not have the "mobile_line" products
      And user has not the "ACCOUNT_UPDATE_BANK_ACCOUNT" forbidden use case
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Deine Zahlungseintellungen" text is displayed
      And the "description" textfield with "Hier kannst du deine Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "<payment_settings_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Distributive Payment Settings" page is displayed

    Examples:
          | user_product        | payment_settings_list                                                                                                                                                                                                                   | jira_id      |
          | dsl;cable;fiber     | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address]                                                                 | QANOV-217343 |
          | home_spot;data_spot | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments] | QANOV-576655 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @live @mobile @next @sanity @har
  Scenario Outline: A postpay user with an active mobile line can access to the "My contracts" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "My contracts" module configured in CMS for "My contracts" page
     When clicks on the "my_contracts_entrypoint" entrypoint
     Then the "My Contracts" page is displayed
      And the "Verträge" header is displayed
      And the "my_contracts_list" list with "<contracts_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @raitt_drop1
    Examples:
          | product | cv   | contracts_list                                                                                                                                                                | jira_id      |
          | blaude  | 13.9 | [LANG:profile.dashboard.my_contracts.change_contract_alias];[LANG:profile.dashboard.my_contracts.change_contract_owner];[LANG:profile.dashboard.my_contracts.cancel_contract] | QANOV-217356 |

    Examples:
          | product | cv   | contracts_list                                                                                                                                                                                                                                                                                                                                                          | jira_id      |
          | o2de    | 14.2 | [LANG:profile.dashboard.my_contracts.change_contract_alias];[LANG:profile.dashboard.my_contracts.change_contract_owner];[LANG:profile.dashboard.my_contracts.self_employed_verification];[LANG:profile.dashboard.my_contracts.young_age_verification];[LANG:profile.dashboard.my_contracts.decommission_contract];[LANG:profile.dashboard.my_contracts.cancel_contract] | QANOV-312322 |

  @jira.QANOV-376011 @android @ber @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @sanity @har
  Scenario: A postpay user with a internet@home product and without mobile lines can access to the "My contracts" screen
    Given user has a "postpay" account type
      And user has a "internet_at_home" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "My contracts" module configured in CMS for "My contracts" page
     When clicks on the "my_contracts_entrypoint" entrypoint
     Then the "My Contracts" page is displayed
      And the "Verträge" header is displayed
      And the "my_contracts_list" list with "[LANG:profile.dashboard.my_contracts.change_contract_alias];[LANG:profile.dashboard.my_contracts.change_contract_owner];[LANG:profile.dashboard.my_contracts.self_employed_verification];[LANG:profile.dashboard.my_contracts.young_age_verification];[LANG:profile.dashboard.my_contracts.cancel_contract]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.LOC-1033
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A user can access to "Notifications" screen
    Given user has the "Notifications" module configured in CMS for "Notifications" page
     When clicks on the "notifications_entrypoint" entrypoint
     Then the "Notifications" page is displayed
      And the "Benachrichtigungen" header is displayed
      And the "notifications_list" list with "[LANG:profile.dashboard.notifications.app_notifications]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv     | parent_test_plan | jira_id      |
          | blaude  | Future |                  | QANOV-296679 |
          | o2de    | Future | QANOV-437471     | QANOV-296681 |

  @jira.<jira_id> @<product> @automatic @ber @ios @jira.cv.<cv> @jira.dv.Future
  @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @sanity @har
  Scenario Outline: User with any active product can access to the "Security & Privacy" screen for iOS devices
    Given user has a "any" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed
      And the "[LANG:profile.dashboard.configuration.security_and_privacy]" header is displayed
      And the "security_and_privacy_list" list with "[LANG:profile.security_and_privacy.biometric_pin_access.page_header];[LANG:profile.security_and_privacy.consent_management_data_processing]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-217358 |
          | o2de    | 14.2 | QANOV-437471     | QANOV-217359 |

  @jira.<jira_id> @<product> @ber @ios @jira.cv.Future @manual @mobile @sanity @har
  Scenario Outline: User with any active product can access to the "Security & Privacy" screen for iOS devices
    Given user has a "any" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed
      And the "[LANG:profile.dashboard.configuration.security_and_privacy]" header is displayed
      And the "security_and_privacy_list" list with "[LANG:profile.security_and_privacy.biometric_pin_access.page_header];[LANG:profile.security_and_privacy.consent_management_data_processing];[LANG:profile.security_and_privacy.transparency_center]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558910 |
          | o2de    | QANOV-558911 |

  @jira.<jira_id> @<product> @android @ber @jira.cv.14.9 @jira.dv.Future @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @sanity @har
  Scenario Outline: User with any active product can access to the "Security & Privacy" screen for android devices
    Given the app version is "higher" than "14.8"
      And user has a "any" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed
      And the "[LANG:profile.dashboard.configuration.security_and_privacy]" header is displayed
      And the "security_and_privacy_list" list with "[LANG:profile.security_and_privacy.biometric_pin_access.page_header];[LANG:profile.security_and_privacy.screenshots_and_video_recordings];[LANG:profile.security_and_privacy.consent_management_data_processing]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @automatic @live @next
    Examples:
          | product | parent_test_plan | jira_id      |
          | blaude  |                  | QANOV-518119 |

    @manual
    Examples:
          | product | parent_test_plan | jira_id      |
          | o2de    | QANOV-437471     | QANOV-452271 |

  @jira.<jira_id> @<product> @android @ber @jira.cv.Future @manual @mobile @sanity @har
  Scenario Outline: User with any active product can access to the "Security & Privacy" screen for android devices
    Given user has a "any" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed
      And the "[LANG:profile.dashboard.configuration.security_and_privacy]" header is displayed
      And the "security_and_privacy_list" list with "[LANG:profile.security_and_privacy.biometric_pin_access.page_header];[LANG:profile.security_and_privacy.screenshots_and_video_recordings];[LANG:profile.security_and_privacy.consent_management_data_processing];[LANG:profile.security_and_privacy.transparency_center]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558912 |
          | o2de    | QANOV-558913 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A <account_type> user with just one product can access to the "Legal Documents" screen: list of legal documents is displayed
    Given user has a "<account_type>" account type
      And user has "1" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
     When clicks on the "legal_documents_entrypoint" entrypoint
     Then the "Legal Documents" page is displayed
      And the "Rechtliche Dokumente" header is displayed
      And the "legal_documents_list" list with "<legal_documents_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | account_type | cv   | legal_documents_list                                                                                                                                                                                                                                                                                                                                                              | detects                        | parent_test_plan | jira_id      |
          | blaude  | postpay      | 13.9 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions]                                                            | LOC-1032:OBO2DE-135:OBO2DE-729 |                  | QANOV-217360 |
          | blaude  | prepay       | 13.9 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions];[LANG:profile.dashboard.legal_documents.terms_of_contract] | LOC-1032:OBO2DE-135:OBO2DE-729 |                  | QANOV-318883 |
          | o2de    | postpay      | 14.2 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions]                                                            |                                | QANOV-437471     | QANOV-217361 |
          | o2de    | prepay       | 14.2 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions];[LANG:profile.dashboard.legal_documents.terms_of_contract] |                                |                  | QANOV-318884 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: User with several products can access to the "Legal Documents" screen: a disambiguation screen is displayed
    Given user has "several" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
     When clicks on the "legal_documents_entrypoint" entrypoint
     Then the "Choose Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "product_icon" field
      And each element in the "products_list" list has the "name" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-310978 |
          | o2de    | 14.2 | QANOV-437471     | QANOV-310982 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A <account_type> user with several products selects a product to access to the "Legal Documents" screen: list of legal documents is displayed
    Given user has a "<account_type>" account type
      And user has "several" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
     When clicks on the "legal_documents_entrypoint" entrypoint
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Legal Documents" page is displayed
      And the "Rechtliche Dokumente" header is displayed
      And the "legal_documents_list" list with "<legal_documents_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Choose Product" page is displayed

    Examples:
          | product | account_type | cv   | legal_documents_list                                                                                                                                                                                                                                                                                                                                                              | depends_on   | parent_test_plan | jira_id      |
          | blaude  | postpay      | 13.9 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions]                                                            | QANOV-310978 |                  | QANOV-310986 |
          | blaude  | prepay       | 13.9 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions];[LANG:profile.dashboard.legal_documents.terms_of_contract] | QANOV-310978 |                  | QANOV-318885 |
          | o2de    | postpay      | 14.2 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions]                                                            | QANOV-310982 | QANOV-437471     | QANOV-310989 |
          | o2de    | prepay       | 14.2 | [LANG:profile.dashboard.legal_documents.terms_and_conditions];[LANG:profile.dashboard.legal_documents.price_lists];[LANG:profile.dashboard.legal_documents.declaration_of_revocation];[LANG:profile.dashboard.legal_documents.product_information_sheet];[LANG:profile.dashboard.legal_documents.service_descriptions];[LANG:profile.dashboard.legal_documents.terms_of_contract] | QANOV-310982 |                  | QANOV-318886 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @smoke
  Scenario Outline: A postpay user with a mobile line can access to the "Change contact details" screen from the "Personal data" screen when all the products are cancelled
    Shipping address should be displayed in full
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has all products in "cancelled" status
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint" entrypoint is not displayed
      And the "contact_number_entrypoint" entrypoint is not displayed
      And the "shipping_address_entrypoint" entrypoint is not displayed
      And the "personal_name_entrypoint" entrypoint is not displayed
      And the "line_number_entrypoint" entrypoint is not displayed
      And the "contact_email_textfield" textfield with "E-Mail" text is displayed
      And the "contact_number_textfield" textfield with "Kontaktrufnummer" text is displayed
      And the "shipping_address_textfield" textfield with "Adresse" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed
      And the "Persönliche Daten" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-308019 |
          | o2de    | 14.2 | QANOV-308020 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @regression
  Scenario Outline: A postpay user with just MyHandy product/s can access to the "Change contact details" screen from the "Personal data" screen when all the products are cancelled
    Shipping address should be displayed in full
    Given user has a "my_handy" product
      And user does not have "mobile_line" product
      And user does not have "internet_at_home" product
      And user has all products in "cancelled" status
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint" entrypoint is not displayed
      And the "contact_number_entrypoint" entrypoint is not displayed
      And the "shipping_address_entrypoint" entrypoint is not displayed
      And the "contact_email_textfield" textfield with "E-Mail" text is displayed
      And the "contact_number_textfield" textfield with "Kontaktrufnummer" text is displayed
      And the "shipping_address_textfield" textfield with "Adresse" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed
      And the "Persönliche Daten" header is displayed

    Examples:
          | product | cv   | user_products             | jira_id      |
          | blaude  | 14.1 | my_handy                  | QANOV-308021 |
          | o2de    | 14.2 | my_handy;internet_at_home | QANOV-308022 |

  @jira.QANOV-310991 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with a internet@home product but without mobile line product can access to the "Change contact details" screen from the "Personal data" screen when all the products are cancelled
    Shipping address should be displayed in full
    Given user has a "internet_at_home" product
      And user does not have "mobile_line" product
      And user has all products in "cancelled" status
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint" entrypoint is not displayed
      And the "contact_number_entrypoint" entrypoint is not displayed
      And the "shipping_address_entrypoint" entrypoint is not displayed
      And the "personal_name_entrypoint" entrypoint is not displayed
      And the "contact_email_textfield" textfield with "E-Mail" text is displayed
      And the "contact_number_textfield" textfield with "Kontaktrufnummer" text is displayed
      And the "shipping_address_textfield" textfield with "Adresse" text is displayed
      And the "personal_name_textfield" textfield is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed
      And the "Persönliche Daten" header is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.O2DE-2082
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: A prepay user can access to the "Change contact details" screen from the "Personal data" screen when all the products are cancelled
    Shipping address should be displayed in full
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Personal Data" page
     When clicks on the "change_contact_details_entrypoint" entrypoint
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed
      And the "contact_email_entrypoint" entrypoint is not displayed
      And the "contact_number_entrypoint" entrypoint is not displayed
      And the "shipping_address_entrypoint" entrypoint is not displayed
      And the "contact_email_textfield" textfield with "E-Mail" text is displayed
      And the "contact_number_textfield" textfield with "Kontaktrufnummer" text is displayed
      And the "shipping_address_textfield" textfield with "Adresse" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Meine Daten" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-308023 |
          | o2de    | 14.2 | QANOV-308024 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @regression
  Scenario Outline: A prepay user with bank account in "activated" status and the mobile line product in "cancelled" status can access to the "Payment settings" screen
    For prepay to check the bank account status, see Bank Account Management API:
    - status = activated: bank account activated
    - status = pending: bank account in pending status
    To check if the user does not have bank account, see Bank Account Management API.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier können Sie Ihre Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "[LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.manage_phone_payments]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-308025 |
          | o2de    | 14.2 | QANOV-308027 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @regression
  Scenario Outline: A prepay user without bank account and the mobile line product in "cancelled" status can access to the "Payment settings" screen
    For prepay to check the bank account status, see Bank Account Management API:
    - status = activated: bank account activated
    - status = pending: bank account in pending status
    To check if the user does not have bank account, see Bank Account Management API.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier können Sie Ihre Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "[LANG:profile.dashboard.payment_settings.manage_phone_payments]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-308026 |
          | o2de    | 14.2 | QANOV-308028 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @regression
  Scenario Outline: A postpay user with bank account, digital bill and billing address in activated status and with mobile line product/s and without MyHandy product can access to the "Payment settings" screen when all products are cancelled
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have the "my_handy" products
      And user has all products in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has "billing_address" service in "activated" status
      And user has "digital_bill" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier können Sie Ihre Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "[LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-308029 |
          | o2de    | 14.2 | QANOV-308030 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with bank account, digital bill and billing address in activated status and with only <user_product> product/s can access to the "Payment settings" screen when all products are cancelled
    Given user has a "postpay" account type
      And user has any "<user_product>" product
      And user does not have the "mobile_line;my_handy" products
      And user has all products in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has "billing_address" service in "activated" status
      And user has "digital_bill" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier können Sie Ihre Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "<payment_settings_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | user_product        | payment_settings_list                                                                                                                                                                                                                   | jira_id      |
          | dsl;cable;fiber     | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address]                                                                 | QANOV-308031 |
          | home_spot;data_spot | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments] | QANOV-576656 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A postpay user with bank account, digital bill and billing address in activated status and with Telco product/s and MyHandy product/s can access to the "Distributive Payment Settings" screen when all products are cancelled
    Telco products: mobile line, internet@home.
    Given user has a "postpay" account type
      And user has any "<postpay_products>" product
      And user has a "my_handy" product
      And user has all products in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has "billing_address" service in "activated" status
      And user has "digital_bill" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
     Then the "Distributive Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wähle ein Produkt" text is displayed
      And the "description" textfield with "Du hast möglicherweise unterschiedliche Bankverbindungen für deine Produkte hinterlegt." text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "title" field
      And each element in the "products_list" list has the "label" field
      And each element in the "products_list" list has the "chevron_icon" field
      And the "0" index in the "products_list" list has the "title" field with "Telco-Produkte" text
      And the "0" index in the "products_list" list has the "label" field with "Weitere Einstellungen anzeigen" text
      And all my handy products from the user are displayed in "products_list" list
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | postpay_products             | parent_test_plan          | jira_id      |
          | blaude  | 14.1 | mobile_line                  | QANOV-306250              | QANOV-308032 |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-306250:QANOV-437471 | QANOV-308033 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: A postpay user with bank account, digital bill and billing address in activated status and with mobile line product/s and MyHandy product/s can access to the "Payment Settings" screen for Telco product/s when all products are cancelled
    Telco products: mobile line, internet@home.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a "my_handy" product
      And user has all products in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has "billing_address" service in "activated" status
      And user has "digital_bill" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier können Sie Ihre Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "[LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Distributive Payment Settings" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.1 | QANOV-308032 | QANOV-308034 |
          | o2de    | 14.2 | QANOV-308033 | QANOV-308035 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-308033
  @jira.link.parent_test_plan.QANOV-306250 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with bank account, digital bill and billing address in activated status and with <user_product> and MyHandy product/s but without mobile line product can access to the "Payment Settings" screen for Telco product/s when all products are cancelled
    Telco products: mobile line, internet@home.
    Given user has a "postpay" account type
      And user has any "<user_product>" product
      And user has a "my_handy" product
      And user does not have the "mobile_line" products
      And user has all products in "cancelled" status
      And user has "bank_account" service in "activated" status
      And user has "billing_address" service in "activated" status
      And user has "digital_bill" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
     Then the "Payment Settings" page is displayed
      And the "Zahlungseinstellungen" header is displayed
      And the "title" textfield with "Wählen Sie ein Produkt" text is displayed
      And the "description" textfield with "Hier können Sie Ihre Zahlungs- und Rechnungseinstellungen bearbeiten." text is displayed
      And the "payment_settings_list" list with "<payment_settings_list>" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Distributive Payment Settings" page is displayed

    Examples:
          | user_product        | payment_settings_list                                                                                                                                                                                                                   | jira_id      |
          | dsl;cable;fiber     | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address]                                                                 | QANOV-308036 |
          | home_spot;data_spot | [LANG:profile.dashboard.payment_settings.bank_account];[LANG:profile.dashboard.payment_settings.digital_bill];[LANG:profile.dashboard.payment_settings.billing_address];[LANG:profile.dashboard.payment_settings.manage_phone_payments] | QANOV-576657 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @regression
  Scenario Outline: A postpay user with <service> in deactivated status cannot access to the "<screen>" screen when all products are cancelled
    Given user has a "postpay" account type
      And user has all products in "cancelled" status
      And user has "<service>" service in "deactivated" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "<service>_entrypoint" entrypoint is not displayed

    Examples:
          | product | cv   | service         | screen          | parent_test_plan | jira_id      |
          | blaude  | 14.1 | digital_bill    | Digital Bill    |                  | QANOV-308038 |
          | blaude  | 14.1 | billing_address | Billing Address |                  | QANOV-308039 |
          | o2de    | 14.2 | digital_bill    | Digital Bill    | QANOV-437471     | QANOV-308041 |
          | o2de    | 14.2 | billing_address | Billing Address | QANOV-437471     | QANOV-308042 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @regression
  Scenario Outline: A postpay user without bank account cannot access to the "Bank Account" screen when all products are cancelled
    Given user has a "postpay" account type
      And user has all products in "cancelled" status
      And user does not have bank account
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "<service>_entrypoint" entrypoint is not displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 14.1 |                  | QANOV-308037 |
          | o2de    | 14.2 | QANOV-437471     | QANOV-308040 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: User with only cancelled products can access to the "Security & Privacy" screen
    Given user has all products in "cancelled" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed
      And the "[LANG:profile.dashboard.configuration.security_and_privacy]" header is displayed
      And the "security_and_privacy_list" list with "[LANG:profile.security_and_privacy.biometric_pin_access.page_header]" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | detects    | jira_id      |
          | blaude  | 14.1 | OBO2DE-720 | QANOV-308043 |
          | o2de    | 14.2 |            | QANOV-308044 |

  @jira.QANOV-410668 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user can access to the "Personal data" screen
     When clicks on the "personal_data" entrypoint
     Then the "Personal Data" page is displayed
      And the "Datos personales" header is displayed
      And the "contact_data_title" textfield with "DATOS DE CONTACTO" text is displayed
      And the "personal_data_list" list with "[LANG:profile.dashboard.personal_data.phone_number];[LANG:profile.dashboard.personal_data.email_address]" entrypoints is displayed
      And the "bank_data_title" textfield with "DATOS BANCARIOS" text is displayed
      And the "bank_account" entrypoint with "Cuenta bancaria" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-410669 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user with personal data completed can access to the "Personal data" screen: Personal data will be displayed
    Given user has completed the personal data
     When clicks on the "personal_data" entrypoint
     Then the "Personal Data" page is displayed
      And the "phone_number_data" textfield with the "\d{3} \d{3} \d{3}" format is displayed
      And the "email_address_data" textfield with the ".+@\w+.\w+" format is displayed
      And the "bank_account_data" textfield with the "XXXXXXXXXXXXXXXXX\d{4}" format is displayed

  @jira.QANOV-410670 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user without personal data completed can access to the "Personal data" screen: No personal data is displayed
    Users always have a bank account, so that will be displayed
    Given user has not completed the personal data
     When clicks on the "personal_data" entrypoint
     Then the "Personal Data" page is displayed
      And the "phone_number_data" textfield is not displayed
      And the "email_address_data" textfield is not displayed

  @jira.QANOV-491884 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user has not verified the contacts methods: An alert is displayed in the Personal Data page
    Given user has not verified the personal data
     When clicks on the "personal_data" entrypoint
     Then the "Personal Data" page is displayed
      And the "verify_alert" alert is displayed
      And the "verify_alert.icon" icon is displayed
      And the "verify_alert.title" textfield is displayed
      And the "verify_alert.message" textfield is displayed
      And the "verify_alert.link" link is displayed

  @jira.QANOV-491884 @android @ios @jira.cv.Future @manual @mobile @o2es @regression @e2e
  Scenario: A user verified the contacts methods: alert is not displayed in the Personal Data page
    Given user has verified the personal data
     When clicks on the "personal_data" entrypoint
     Then the "Personal Data" page is displayed
      And the "verify_alert" alert is not displayed

  @jira.QANOV-491885 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An admin user clicks on the alert to verify contact methods from Personal Data screen: OB webview is displayed
    Given user has not verified the personal data
      And user has a "admin" role
     When clicks on the "personal_data" entrypoint
      And the "Personal Data" page is displayed
      And clicks on the "alert.link" link
     Then the browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed

  @jira.QANOV-491886 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An admin light user clicks on the alert to verify contact methods: Login escalation screen is displayed
    Given user has not verified the personal data
      And user has a "admin-light" role
     When clicks on the "personal_data" entrypoint
      And the "Personal Data" page is displayed
      And clicks on the "alert.link" link
     Then the "O2es Escalation Login" page is displayed

  @jira.QANOV-556367 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: A moves user can access to the 'Términos y condiciones' page from profile tab
     When clicks on the "terms_and_conditions_entrypoint" entrypoint
     Then the "Terms And Conditions" page is displayed
      And the "Movistar" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-556368 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @sanity @ber
  Scenario: A moves admin user can access to the 'Gestión de tu privacidad' page from profile tab
    Given user has a "admin" role
     When clicks on the "privacy_management_entrypoint" entrypoint
     Then the "Privacy Preferences" page is displayed
      And the "Gestiona tu privacidad" header is displayed
      And the "privacy_management_list" list with "Preferencias de privacidad Movistar;Preferencias de privacidad Aplicaciones;Consulta y descarga de datos" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-556369 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @sanity
  Scenario: A moves admin-light user can access to the 'Gestión de tu privacidad' page from profile tab
    Given user has a "admin" role
     When clicks on the "privacy_management_entrypoint" entrypoint
      And the "Privacy Preferences" page is displayed
      And the "privacy_management_list" list with "Preferencias de privacidad Movistar;Preferencias de privacidad Aplicaciones" entrypoints is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

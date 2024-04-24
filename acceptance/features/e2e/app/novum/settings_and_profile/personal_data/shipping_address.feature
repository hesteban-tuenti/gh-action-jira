# -*- coding: utf-8 -*-
@jira.QANOV-223309
Feature: Shipping Address

  Actions Before the Feature:
    Given user has a "any" product in "active" status
      And user has not the "ACCOUNT_UPDATE_DATA" forbidden use case


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A user can see the "shipping address" entrypoint in the "Change Contact Details" screen
    The shipping address is always filled-in. If the user hasn't previously set one, the contract address data will be
    included.
    BOX7 only allow german addresses.
    RAITT will allow non-German addresses, so we will display the ZIP code and the country name.
    Given user has a "shipping address" stored in the contact details
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "shipping_address_entrypoint" entrypoint with "Adresse" text is displayed
      And the "shipping_address_zip_code" textfield is displayed
      And the "shipping_address_country" textfield is displayed

    @raitt_drop2
    Examples:
          | product | cv   | depends_on                             | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217759:QANOV-283595:QANOV-283597 | QANOV-402198     | QANOV-223312 |

    Examples:
          | product | cv   | depends_on                                          | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-217760:QANOV-283596:QANOV-310943:QANOV-283598 |                  | QANOV-223313 |

  @jira.<jira_id> @<product> @android @ber @har @ios @jira.cv.<cv> @jira.dv.Future @jira.link.depends_on.<depends_on>
  @jira.link.detects.O2DE-1497 @jira.link.detects.OBO2DE-165 @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @sanity
  Scenario Outline: A BOX7 user can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    Given user has a "box7" account type
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is not empty
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is not empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is not empty
      And the "additional_info_inputtext" inputtext is displayed
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    @automatic @live @next @raitt_drop2
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-223312 | QANOV-402198     | QANOV-223316 |

    @jira.link.detects.O2DE-3457 @manual
    Examples:
          | product | cv   | depends_on   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-223313 | QANOV-437471     | QANOV-223317 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual 
  @mobile @sanity @har
  Scenario Outline: A BOX7 user with a German address can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    Given user has a "box7" account type
      And user has a "shipping address" stored in the contact details
      And user has a german shipping address
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "additional_info_inputtext" inputtext is displayed
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is not empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is not empty
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is not empty
      And the "country_inputtext_placeholder" placeholder with "Country" text is displayed
      And the "country_inputtext" inputtext is not empty
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-223312 | QANOV-607188 |
          | o2de    | Future | QANOV-223313 | QANOV-607189 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile
  @regression @har
  Scenario Outline: A BOX7 user with a non German address can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    If a user has a non-German address when accessing this screen, all the fields will be empty except the country,
    which will have Germany as default and not editable. The user can fill them with a German address and edit their previous one.
    Note: the user can only have one registered shipping address at a time. International addresses can be displayed but
    not set in the app (they need approval, so the user needs to contact the OB directly).
    Given user has a "box7" account type
      And user has a "shipping address" stored in the contact details
      And user has a non german shipping address
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "additional_info_inputtext" inputtext is displayed
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is empty
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is empty
      And the "country_inputtext_placeholder" placeholder with "Country" text is displayed
      And the "country_inputtext" inputtext is not empty
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-223312 | QANOV-607190 |
          | o2de    | Future | QANOV-223313 | QANOV-607191 |

  @jira.QANOV-420252 @android @blaude @ios @jira.cv.14.10 @jira.dv.Future @jira.link.depends_on.QANOV-223312
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop2 @regression
  Scenario: A RAITT user with a german shipping address can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    RAITT will allow non-German addresses.
    If a user has a non-German address when accessing this screen, all the fields will be empty. The user can fill them
    with a German address and edit their previous one.
    Note: the user can only have one registered shipping address at a time. International addresses can be displayed but
    not set in the app (they need approval, so the user needs to contact the OB directly).
    Given user has a "raitt" account type
      And user has a "shipping address" stored in the contact details
      And user has a german shipping address
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is not empty
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is not empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is not empty
      And the "additional_info_inputtext" inputtext is displayed
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

  @jira.QANOV-607192 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-223312 @manual @mobile @raitt_drop2
  @regression
  Scenario: A RAITT user with a german shipping address can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    If a user has a non-German address when accessing this screen, all the fields will be empty except the country,
    which will have Germany as default and not editable. The user can fill them with a German address and edit their previous one.
    Note: the user can only have one registered shipping address at a time. International addresses can be displayed but
    not set in the app (they need approval, so the user needs to contact the OB directly).
    Given user has a "raitt" account type
      And user has a "shipping address" stored in the contact details
      And user has a german shipping address
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "additional_info_inputtext" inputtext is displayed
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is not empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is not empty
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is not empty
      And the "country_inputtext_placeholder" placeholder with "Country" text is displayed
      And the "country_inputtext" inputtext is not empty
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

  @jira.QANOV-420253 @android @blaude @ios @jira.cv.14.10 @jira.dv.Future @jira.link.depends_on.QANOV-223312
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop2 @regression
  Scenario: A RAITT user with a non-german shipping address can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    RAITT will allow non-German addresses.
    If a user has a non-German address when accessing this screen, all the fields will be empty. The user can fill them
    with a German address and edit their previous one.
    Note: the user can only have one registered shipping address at a time. International addresses can be displayed but
    not set in the app (they need approval, so the user needs to contact the OB directly).
    Given user has a "raitt" account type
      And user has a "shipping address" stored in the contact details
      And user has a non german shipping address
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is empty
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is empty
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "additional_info_inputtext" inputtext is empty
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

  @jira.QANOV-607193 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-223312 @manual @mobile @raitt_drop2
  @regression
  Scenario: A RAITT user with a non-german shipping address can access to change the shipping address from the "Change Contact Details" screen
    Two optional fields can be displayed if returned by API: name, company name.
    If a user has a non-German address when accessing this screen, all the fields will be empty except the country,
    which will have Germany as default and not editable. The user can fill them with a German address and edit their previous one.
    Note: the user can only have one registered shipping address at a time. International addresses can be displayed but
    not set in the app (they need approval, so the user needs to contact the OB directly).
    Given user has a "raitt" account type
      And user has a "shipping address" stored in the contact details
      And user has a non german shipping address
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Contact Details" page
     When clicks on the "shipping_address_entrypoint.chevron" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Adresse bearbeiten" text is displayed
      And the "description" textfield with "Im Onlineservice kannst du nur eine deutsche Adresse hinterlegen." text is displayed
      And the "additional_info_inputtext" inputtext is displayed
      And the "additional_info_inputtext_placeholder" textfield that contains the "Adresszusatz" text is displayed
      And the "street_name_inputtext_placeholder" placeholder with "Straße" text is displayed
      And the "street_name_inputtext" inputtext is not empty
      And the "street_number_inputtext_placeholder" placeholder with "Hausnummer" text is displayed
      And the "street_number_inputtext" inputtext is not empty
      And the "zip_code_inputtext_placeholder" placeholder with "Postleitzahl" text is displayed
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext_placeholder" placeholder with "Ort" text is displayed
      And the "city_inputtext" inputtext is not empty
      And the "country_inputtext_placeholder" placeholder with "Country" text is displayed
      And the "country_inputtext" inputtext is not empty
      And the "address_info_title" textfield with "WEITERE INFORMATIONEN" text is displayed
      And the "address_info_description" textfield with "Du kannst deine Lieferadresse jederzeit in deinem Profil erneut ändern." text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_shipping_address_button" button with "Adresse ändern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can see the optional "<optional_field>" field inserted in the "Shipping Address" screen
    Given user has the "<optional_field>" field filled in the shipping address
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     Then the "<optional_field>_value" textfield is displayed
      And the "<optional_field>_label" textfield with "<label>" text is displayed

    Examples:
          | product | cv    | optional_field | label        | depends_on                             | jira_id      |
          | blaude  | 13.10 | name           | Name         | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-290361 |
          | blaude  | 13.10 | company_name   | Company name | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-290362 |
          | o2de    | 14.2  | name           | Name         | QANOV-223317                           | QANOV-290363 |
          | o2de    | 14.2  | company_name   | Company name | QANOV-223317                           | QANOV-290364 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can access to the data protection info from the "Shipping Address" screen
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | cv   | header               | depends_on                             | jira_id      |
          | blaude  | 13.9 | Datenschutz bei Blau | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223318 |
          | o2de    | 14.2 | Datenschutz          | QANOV-223317                           | QANOV-223319 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can tap on back button after filling any field on <client> device
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     When fills the "zip_code_inputtext" inputtext with the "0" text
      And clicks on the <button> button
     Then the "Shipping Address Cancellation" popup is displayed
      And the "title" textfield with "Hinweis" text is displayed
      And the "body" textfield with "Beim Verlassen dieser Ansicht gehen Ihre Eingaben verloren" text is displayed
      And the "continue_button" button with "<continue_button>" text is displayed
      And the "cancel_button" button with "<cancel_button>" text is displayed

    Examples:
          | product | cv   | client  | button                           | continue_button | cancel_button | depends_on                             | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223334 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223336 |
          | o2de    | 14.2 | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-223317                           | QANOV-223338 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-223317                           | QANOV-223340 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User decides to continue with the shipping address flow after seeing the Shipping Address Cancellation popup
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address Cancellation" popup
     When clicks on the "continue_button" button
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-223334:QANOV-223336 | QANOV-223342 |
          | o2de    | 14.2 | QANOV-223338:QANOV-223340 | QANOV-223343 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User decides to cancel the shipping address flow after seeing the Shipping Address Cancellation popup
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address Cancellation" popup
     When clicks on the "cancel_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-223334:QANOV-223336 | QANOV-223344 |
          | o2de    | 14.2 | QANOV-223338:QANOV-223340 | QANOV-223345 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cannot save the shipping address without filling all the mandatory fields
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     When clears the "zip_code_inputtext" inputtext
      And clears the "city_inputtext" inputtext
      And clears the "street_name_inputtext" inputtext
      And clears the "street_number_inputtext" inputtext
      And clicks on the "save_shipping_address_button" button
     Then the "zip_code_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "city_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "street_name_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "street_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223346 |
          | o2de    | 14.2 | QANOV-223317                           | QANOV-223347 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cannot save the shipping address without inserting a 5-digit postcode
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     When fills the "zip_code_inputtext" inputtext with the "1055" text
     Then the "zip_code_error_textfield" textfield with "Postleitzahl muss fünf Ziffern haben." text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-338328 |
          | o2de    | 14.2 | QANOV-223317                           | QANOV-338329 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cannot save the shipping address without making any change in the address
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     When clicks on the "save_shipping_address_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen" text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223350 |
          | o2de    | 14.2 | QANOV-223317                           | QANOV-223352 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cannot save the shipping address if the address is invalid and there aren't other address options
    The "Shipping Address Not Found" screen is only displayed if the address inserted is not valid but there are other
    address options. If there aren't other options, an empty case is displayed.
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user has the "Shipping address Empty Case" module configured in CMS for "Shipping address Empty Case" page
      And user is in the "Shipping Address" page
     When fills the "zip_code_inputtext" inputtext with the "TBD" text
      And fills the "city_inputtext" inputtext with the "TBD" text
      And fills the "street_name_inputtext" inputtext with the "TBD" text
      And fills the "street_number_inputtext" inputtext with the "TBD" text
      And fills the "additional_info_inputtext" inputtext with the "TBD" text
      And clicks on the "save_shipping_address_button" entrypoint
     Then the "Shipping address Empty Case" page is displayed
      And the "empty_case_icon" icon is displayed
      And the "empty_case_title" textfield with "Your address was not found" text is displayed
      And the "empty_case_description" textfield with "Check the address you enter before and be sure it is correct" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223354 |
          | o2de    | 14.2 | QANOV-223317                           | QANOV-223355 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: User can access to the "Shipping Address Not Found" screen when the address is invalid but there are other address options
    The "Shipping Address Not Found" screen is only displayed if the address inserted is not valid but there are other
    address options. In this case, a list of possible addresses is displayed. If the address inserted is valid, then
    the user will be redirected to the corresponding Feedback screen.
    Note: for RAITT users, international addresses can be displayed, but not set in the app (they need approval, so the
    user needs to contact the OB directly).
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user has the "Shipping address not found" module configured in CMS for "Shipping Address Not Found" page
      And user is in the "Shipping Address" page
     When fills the "zip_code_inputtext" inputtext with the "10557" text
      And fills the "city_inputtext" inputtext with the "Berlin" text
      And fills the "street_name_inputtext" inputtext with the "Europapl" text
      And fills the "street_number_inputtext" inputtext with the "1" text
      And fills the "additional_info_inputtext" inputtext with the "D" text
      And clicks on the "save_shipping_address_button" entrypoint
     Then the "Shipping Address Not Found" page is displayed
      And the "Adresse" header is displayed
      And the "title" textfield with "Wir konnten Ihre Adresse nicht finden" text is displayed
      And the "description" textfield with "Wählen Sie eine Adresse aus" text is displayed
      And the "address_list" list is displayed
      And each element in the "address_list" list has the "address" field
      And each element in the "address_list" list has the "postalcode_and_city" field
      And each element in the "address_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 13.9 | QANOV-223316:QANOV-420252:QANOV-420253 | QANOV-223356 |
          | o2de    | 14.2 | QANOV-223317                           | QANOV-223357 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can go to the previous screen from the "Shipping Address Not Found" screen
    Given user has the "Shipping address not found" module configured in CMS for "Shipping Address Not Found" page
      And user is in the "Shipping Address Not Found" page
     When clicks on the <button> button
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed

    Examples:
          | product | cv   | client  | button                           | depends_on   | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | QANOV-223356 | QANOV-223358 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | QANOV-223356 | QANOV-223359 |
          | o2de    | 14.2 | android | native "back"                    | QANOV-223357 | QANOV-223360 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | QANOV-223357 | QANOV-223361 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User selects an address in the "Shipping Address Not Found" screen
    Given user has the "Shipping address not found" module configured in CMS for "Shipping Address Not Found" page
      And user is in the "Shipping Address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed
      And the form fields are filled with the address selected

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-223356 | QANOV-223362 |
          | o2de    | 14.2 | QANOV-223357 | QANOV-223363 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User wants to change the shipping address after passing through the "Shipping address Not Found" screen: a confirmation popup is displayed
    Given user has the "Shipping address not found" module configured in CMS for "Shipping Address Not Found" page
      And user is in the "Shipping Address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" entrypoint
      And the "Shipping Address" page is displayed
      And clicks on the "save_shipping_address_button" button
     Then the "Change Shipping Address Confirmation" popup is displayed
      And the "title" textfield with "Sie sind dabei, Ihre Adresse zu ändern" text is displayed
      And the "body" textfield with "Kannst du im Profilbereich wieder ändern" text is displayed
      And the "continue_button" button with "OK" text is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-223356 | QANOV-223370 |
          | o2de    | 14.2 | QANOV-223357 | QANOV-223371 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User wants to change the shipping address without passing through the "Shipping address Not Found" screen: a confirmation popup is displayed
    Note: for RAITT users, international addresses can be displayed, but not set in the app (they need approval, so the
    user needs to contact the OB directly).
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Shipping Address" page
     When fills the "zip_code_inputtext" inputtext with the "TBD" text
      And fills the "city_inputtext" inputtext with the "TBD" text
      And fills the "street_name_inputtext" inputtext with the "TBD" text
      And fills the "street_number_inputtext" inputtext with the "TBD" text
      And fills the "additional_info_inputtext" inputtext with the "TBD" text
      And clicks on the "save_shipping_address_button" button
     Then the "Change Shipping Address Confirmation" popup is displayed
      And the "title" textfield with "Sie sind dabei, Ihre Adresse zu ändern" text is displayed
      And the "body" textfield with "Kannst du im Profilbereich wieder ändern" text is displayed
      And the "continue_button" button with "OK" text is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-223356 | QANOV-223372 |
          | o2de    | 14.2 | QANOV-223357 | QANOV-223373 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User cancels to change the shipping address
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Shipping Address Confirmation" popup
     When clicks on the "cancel_button" button
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-223370:QANOV-223372 | QANOV-223376 |
          | o2de    | 14.2 | QANOV-223371:QANOV-223373 | QANOV-223377 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: User confirms to change the shipping address: shipping address changed successfully
    NOTE: if the shipping address change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user has the "Shipping Address Success Feedback" module configured in CMS for "Shipping Address Success Feedback" page
      And user is in the "Shipping Address" page
      And fills the "street_number_inputtext" inputtext with the a valid street number
      And clicks on the "save_shipping_address_button" button
      And the "Change Shipping Address Confirmation Popup" popup is displayed
     When clicks on the "popup.accept" button
     Then the "Shipping Address Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Adresse wurde erfolgreich geändert." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    @automatic @live @next @raitt_drop2
    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-223370:QANOV-223372 |                  | QANOV-223378 |

    @manual
    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-223371:QANOV-223373 | QANOV-437471     | QANOV-223380 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User who is in the "Shipping Address Success Feedback" screen can tap on the "<button_name>" button
    Given user has the "Shipping Address Success Feedback" module configured in CMS for "Shipping Address Success Feedback" page
      And user is in the "Shipping Address Success Feedback" popup
     When clicks on the "<button_id>" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | button_name             | button_id                       | depends_on   | jira_id      |
          | blaude  | 13.9 | Back to contact details | back_to_contact_details_button  | QANOV-223378 | QANOV-223382 |
          | blaude  | 13.9 | Close                   | navigation_top_bar.close_button | QANOV-223378 | QANOV-223383 |
          | o2de    | 14.2 | Back to contact details | back_to_contact_details_button  | QANOV-223380 | QANOV-223384 |
          | o2de    | 14.2 | Close                   | navigation_top_bar.close_button | QANOV-223380 | QANOV-223386 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: User changes the shipping address but the confirmation takes too long: an informative screen is displayed
    Given user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user has the "Shipping Address Informative Feedback" module configured in CMS for "Shipping Address Informative Feedback" page
      And user is in the "Shipping Address" page
      And fills the "street_number_inputtext" inputtext with the a valid street number
      And clicks on the "save_shipping_address_button" button
      And the "Change Shipping Address Confirmation Popup" popup is displayed
     When clicks on the "popup.accept" button
      And the shipping address change takes too long
     Then the "Shipping Address Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-223370:QANOV-223372 | QANOV-620363 |
          | o2de    | 14.2 | QANOV-223371:QANOV-223373 | QANOV-620364 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A user can go back to "Change Contact Details" screen from the "Shipping Address Informative Feedback" screen
    Given user has the "Shipping Address Informative Feedback" module configured in CMS for "Shipping Address Informative Feedback" page
      And user is in the "Shipping Address Informative Feedback" page
     When clicks on the "back_to_contact_details_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-620363 | QANOV-620365 |
          | o2de    | QANOV-620364 | QANOV-620366 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User tries to change the shipping address but an error happens (first 3 attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to change a shipping
    address without success. The fourth attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has tried to save a shipping address "<3" times without success
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Shipping Address Confirmation" popup
     When clicks on the "continue_button" button
      And there is an error saving the shipping address
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-223370:QANOV-223372 | QANOV-223392 |
          | o2de    | 14.2 | QANOV-223371:QANOV-223373 | QANOV-223393 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can close the error warning after trying to change the shipping address without success
    Given user has tried to save a shipping address "<3" times without success
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user is in the "Change Shipping Address Confirmation" popup
     When clicks on the "continue_button" button
      And there is an error changing the shipping address
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Shipping Address" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-223392 | QANOV-223398 |
          | o2de    | 14.2 | QANOV-223393 | QANOV-223399 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User tries to change the shipping address but an error happens (fourth attempt)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to change a shipping
    address without success. The fourth attempt will redirect to a full screen error feedback.
    Given user has tried to save a shipping address "3" times without success
      And user has the "Shipping Address" module configured in CMS for "Shipping Address" page
      And user has the "Shipping Address Error Feedback" module configured in CMS for "Shipping Address Error Feedback" page
      And user is in the "Change Shipping Address Confirmation" popup
     When clicks on the "continue_button" button
      And there is an error saving the shipping address
     Then the "Shipping Address Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send your request" text is displayed
      And the "error_message" textfield with "Please try again later" text is displayed
      And the "back_to_contact details_button" button with "Zurück zu meinen Daten" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-223370:QANOV-223372 | QANOV-223404 |
          | o2de    | 14.2 | QANOV-223371:QANOV-223373 | QANOV-223405 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can go back to contact details from the "Shipping Address Error Feedback" screen
    Given user has the "Shipping Address Error Feedback" module configured in CMS for "Shipping Address Error Feedback" page
      And user is in the "Shipping Address Error Feedback" popup
     When clicks on the "back_to_contact_details_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-223404 | QANOV-223406 |
          | o2de    | 14.2 | QANOV-223405 | QANOV-223408 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User can go to previous screen from the "Shipping Address Error Feedback" screen on <client> devices
    Given user has the "Shipping Address Error Feedback" module configured in CMS for "Shipping Address Error Feedback" page
      And user is in the "Shipping Address Error Feedback" popup
     When clicks on the <button> button
     Then the "Shipping Address" page is displayed
      And the "Adresse" header is displayed

    Examples:
          | product | cv   | client  | button                           | depends_on   | jira_id      |
          | blaude  | 13.9 | android | native "back"                    | QANOV-223404 | QANOV-223410 |
          | blaude  | 13.9 | ios     | "navigation_top_bar.back_button" | QANOV-223404 | QANOV-223411 |
          | o2de    | 14.2 | android | native "back"                    | QANOV-223405 | QANOV-223412 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | QANOV-223405 | QANOV-223413 |

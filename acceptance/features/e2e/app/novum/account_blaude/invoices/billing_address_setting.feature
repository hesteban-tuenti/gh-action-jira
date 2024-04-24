# -*- coding: utf-8 -*-
@jira.QANOV-204591
Feature: Billing Address setting

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page


  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204367 @jira.link.detects.O2DE-1451
  @mobile @regression @raitt_drop2
  Scenario Outline: Postpay user can see the "billing address" setting in the Bills screen when it's deactivated
    Given user has "billing_address" service in "deactivated" status
      And user is in the "Bills" page
     Then the "billing_address_entrypoint.title" textfield with "Rechnungsadresse" text is displayed
      And the ""billing_address_entrypoint.subtitle" textfield is not displayed
      And the "billing_address_entrypoint.tag" textfield is not displayed

    @automatic @android @webapp @qa
    Examples:
          | jira_id      |
          | QANOV-204592 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-493666 |

  @jira.<jira_id> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204367
  @jira.link.detects.OBO2DE-212 @jira<jira_id>. @live @mobile @next @qa @regression @raitt_drop2
  Scenario Outline: Postpay user can see the "billing address" setting in the Bills screen when it's activated
    If the billing address setting is active, the postal code value will be displayed under the entrypoint.
    Given user has "billing_address" service in "activated" status
      And user is in the "Bills" page
     When waits until the "billing_address_entrypoint" element is visible
     Then the "billing_address_entrypoint.title" textfield with "Rechnungsadresse" text is displayed
      And the "billing_address_entrypoint.subtitle" textfield is displayed
      And the "billing_address_entrypoint.tag" textfield is not displayed

    @automatic @android @webapp
    Examples:
          | jira_id      |
          | QANOV-342368 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342369 |

  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1497
  @jira.link.detects.OBO2DE-104 @mobile @smoke @raitt_drop2
  Scenario Outline: Postpay user can access to <user_action> from the settings section in the Bills screen
    Two optional fields can be displayed if returned by API: name, company name.
    The selected tab will be the one that is filled in.
    Given user has "billing_address" service in "<billing_address_status>" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Bills" page
     When clicks on the "billing_address_entrypoint" entrypoint
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed
      And the "title" textfield with "<title>" text is displayed
      And the "description" textfield with "<description>" text is displayed
      And the "physical_address_tab" tab with "Anschrift" text is displayed
      And the "mailbox_tab" tab with "Postfach" text is displayed
      And the "address_info.title" textfield with "INFOS ZUR RECHNUNGSADRESSE" text is displayed
      And the "address_info.description" textfield with "Dies ist die Adresse, die in Zukunft in der App hinterlegt sein wird. Diese kann jederzeit in deinem Profil bearbeitet werden." text is displayed
      And the "address_info.data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "address_info.data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_billing_address_button" button with "<button_text>" text is displayed

    @android @automatic @qa @webapp
    Examples:
          | user_action             | billing_address_status | title                       | description                                                                            | button_text                | depends_on   | jira_id      |
          | add the billing address | deactivated            | Rechnungsadresse hinzufügen | Du hast die Möglichkeit, eine Adresse in Deutschland oder ein Postfach zu hinterlegen. | Rechnungsadresse speichern | QANOV-204592 | QANOV-204594 |

    @android @automatic @ber @live @next @qa @webapp
    Examples:
          | user_action              | billing_address_status | title                       | description                                                                              | button_text             | depends_on   | jira_id      |
          | edit the billing address | activated              | Rechnungsadresse bearbeiten | Änderungen an deiner Adresse oder deinem hinterlegten Postfach kannst du hier vornehmen. | Rechnungsadresse ändern | QANOV-204593 | QANOV-204595 |

    @ios @manual
    Examples:
          | user_action              | billing_address_status | title                       | description                                                                              | button_text                | depends_on   | jira_id      |
          | add the billing address  | deactivated            | Rechnungsadresse hinzufügen | Du hast die Möglichkeit, eine Adresse in Deutschland oder ein Postfach zu hinterlegen.   | Rechnungsadresse speichern | QANOV-204592 | QANOV-342370 |
          | edit the billing address | activated              | Rechnungsadresse bearbeiten | Änderungen an deiner Adresse oder deinem hinterlegten Postfach kannst du hier vornehmen. | Rechnungsadresse ändern    | QANOV-204593 | QANOV-342371 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-204594
  @jira.link.depends_on.QANOV-204595 @manual @mobile @regression
  Scenario Outline: User can see the optional "<optional_field>" field inserted in the "Billing Address" screen
    Given user has the "<optional_field>" field filled in the billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     Then the "<optional_field>_value" textfield is displayed
      And the "<optional_field>_label" textfield with "<label>" text is displayed

    Examples:
          | optional_field | label | jira_id      |
          | name           | Name  | QANOV-290370 |
          | company_name   | Firma | QANOV-290371 |

  @jira.QANOV-204602 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594
  @jira.link.depends_on.QANOV-204595 @manual @mobile @regression
  Scenario: Postpay user can access to the data protection info from the "Billing Address" screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz bei Blau" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Billing Address" page is displayed

  @jira.<jira_id> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204594
  @jira.link.depends_on.QANOV-204595 @live @mobile @next @sanity @raitt_drop2
  Scenario Outline: Postpay user can see the content of "Physical address" tab in Billing Address screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
     Then the "physical_address_tab" tab is selected
      And the "zip_code_physical" inputtext is displayed
      And the "zip_code_physical.placeholder" textfield with "Postleitzahl" text is displayed
      And the "city_physical" inputtext is displayed
      And the "city_physical.placeholder" textfield with "Ort" text is displayed
      And the "street_name" inputtext is displayed
      And the "street_name.placeholder" textfield with "Straße" text is displayed
      And the "street_number" inputtext is displayed
      And the "street_number.placeholder" textfield with "Hausnummer" text is displayed
      And the "additional_info" inputtext is displayed
      And the "additional_info.placeholder" textfield that contains the "Adresszusatz" text is displayed

    @automatic @qa @ber @android @webapp
    Examples:
          | jira_id      |
          | QANOV-204596 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342372 |

  @jira.<jira_id> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204594
  @jira.link.depends_on.QANOV-204595 @live @mobile @next @qa @sanity @raitt_drop2
  Scenario Outline: Postpay user can see the content of "Mailbox" tab in Billing Address screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "mailbox_tab" tab is selected
      And the "pobox" inputtext is displayed
      And the "pobox.placeholder" textfield with "Postfach" text is displayed
      And the "zip_code_mailbox" inputtext is displayed
      And the "zip_code_mailbox.placeholder" textfield with "Postleitzahl" text is displayed
      And the "city_mailbox" inputtext is displayed
      And the "city_mailbox.placeholder" textfield with "Ort" text is displayed

    @automatic @qa @ber @android @webapp
    Examples:
          | jira_id      |
          | QANOV-204597 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342373 |

  @jira.QANOV-204598 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594 @manual @mobile @regression
  Scenario: Postpay user with billing address deactivated can see all the fields empty in the "Physical address" tab
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
     Then the "physical_address_tab" tab is selected
      And the "zip_code_inputtext" inputtext is empty
      And the "city_inputtext" inputtext is empty
      And the "street_name_inputtext" inputtext is empty
      And the "street_number_inputtext" inputtext is empty
      And the "additional_info_inputtext" inputtext is empty
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204599 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594 @manual @mobile @regression
  Scenario: Postpay user with billing address deactivated can see all the fields empty in the "Mailbox" tab
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "mailbox_tab" tab is selected
      And the "pobox" inputtext is empty
      And the "zip_code_mailbox" inputtext is empty
      And the "city_mailbox" inputtext is empty
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.<jira_id> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204595 @live @mobile
  @next @qa @regression
  Scenario Outline: Postpay user with billing address activated can see all the mandatory fields filled in the "Physical address" tab
    The "additional address information" field is optional.
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
     Then the "physical_address_tab" tab is selected
      And the "zip_code_physical" inputtext is not empty
      And the "city_physical" inputtext is not empty
      And the "street_name" inputtext is not empty
      And the "street_number" inputtext is not empty

    @automatic @android @webapp
    Examples:
          | jira_id      |
          | QANOV-204600 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342374 |

  @jira.<jira_id> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204595 @live @mobile
  @next @qa @regression
  Scenario Outline: Postpay user with billing address activated can see all the mandatory fields filled in the "Mailbox" tab
    The "additional address information" field is optional.
    Given user has "billing_address" service in "activated" status
      And user has a "mailbox" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "mailbox_tab" tab is selected
      And the "pobox" inputtext is not empty
      And the "zip_code_mailbox" inputtext is not empty
      And the "city_mailbox" inputtext is not empty

    @automatic @android @webapp
    Examples:
          | jira_id      |
          | QANOV-204601 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342375 |

  @jira.<jira_id> @<client> @<execution> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.<depends_on> @live @mobile
  @next @qa @regression
  Scenario Outline: Postpay user can tap on back button after filling any field from the "<address_tab>" tab on <client> device
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "<address_tab>_tab" tab
      And fills the "<input_text>" inputtext with the "0" text
      And clicks on the <button> button
     Then the "Billing Address Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | execution | address_tab      | button        | input_text        | cancel_button | continue_button | depends_on   | jira_id      |
          | android | automatic | physical_address | native "back" | zip_code_physical | ABBRECHEN     | VERLASSEN       | QANOV-204596 | QANOV-204604 |
          | android | automatic | mailbox          | native "back" | pobox             | ABBRECHEN     | VERLASSEN       | QANOV-204597 | QANOV-204605 |

    Examples:
          | client | execution | address_tab      | button                           | input_text        | cancel_button | continue_button | depends_on   | jira_id      |
          | ios    | manual    | physical_address | "navigation_top_bar.back_button" | zip_code_physical | Abbrechen     | Verlassen       | QANOV-204596 | QANOV-214309 |
          | ios    | manual    | mailbox          | "navigation_top_bar.back_button" | pobox             | Abbrechen     | Verlassen       | QANOV-204597 | QANOV-214310 |

  @jira.<jira_id> @<client> @<execution> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204604
  @jira.link.depends_on.QANOV-204605 @jira.link.depends_on.QANOV-214309 @jira.link.depends_on.QANOV-214310 @live @mobile
  @next @qa @regression
  Scenario Outline: Postpay user decides to <action> the billing address flow after seeing the Billing Address Cancellation popup
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And fills the "zip_code_physical" inputtext with the "0" text
      And clicks on the <back_button> button
      And the "Billing Address Cancellation" popup is displayed
      And clicks on the "popup.<popup_button>" button
     Then the "<destination_page>" page is displayed
      And the "<destination_header>" header is displayed

    Examples:
          | client  | execution | back_button   | action        | popup_button | destination_page | destination_header | jira_id      |
          | android | automatic | native "back" | continue with | cancel       | Billing Address  | Rechnungsadresse   | QANOV-204606 |
          | android | automatic | native "back" | cancel        | accept       | Bills            | Rechnungen         | QANOV-204607 |

    Examples:
          | client | execution | back_button                      | action        | popup_button | destination_page | destination_header | jira_id      |
          | ios    | manual    | "navigation_top_bar.back_button" | continue with | cancel       | Billing Address  | Rechnungsadresse   | QANOV-342376 |
          | ios    | manual    | "navigation_top_bar.back_button" | cancel        | accept       | Bills            | Rechnungen         | QANOV-342377 |

  @jira.QANOV-204610 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204596 @manual @mobile @regression
  Scenario: Postpay user cannot save the "physical" billing address without filling all the mandatory fields
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And clears the "zip_code_physical" inputtext
      And clears the "city_physical" inputtext
      And clears the "street_name" inputtext
      And clears the "street_number" inputtext
      And clears the "additional_info" inputtext
      And clicks on the "save_billing_address_button" button
     Then the "zip_code_physical_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "city_physical_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "street_name_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "street_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-204611 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204597 @manual @mobile @regression
  Scenario: Postpay user cannot save the "mailbox" billing address without filling all the mandatory fields
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And clears the "pobox" inputtext
      And clears the "zip_code_mailbox" inputtext
      And clears the "city_mailbox" inputtext
      And clicks on the "save_billing_address_button" button
     Then the "pobox_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "zip_code_mailbox_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "city_mailbox_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204595 @mobile @regression
  Scenario Outline: Postpay user cannot change the "<address_type>" billing address without making any change in the address
    Given user has "billing_address" service in "activated" status
      And user has a "<address_type>" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "<address_tab>_tab" tab
      And clicks on the "save_billing_address_button" button
     Then the "error_warning_text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

    @android @automatic @live @next @qa @webapp
    Examples:
          | address_type | address_tab      | jira_id      |
          | physical     | physical_address | QANOV-204619 |
          | mailbox      | mailbox          | QANOV-204620 |

    @ios @manual
    Examples:
          | address_type | address_tab      | jira_id      |
          | physical     | physical_address | QANOV-342378 |
          | mailbox      | mailbox          | QANOV-342379 |

  @jira.QANOV-204608 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204596 @manual @mobile @regression
  Scenario: User cannot save the physical billing address if the address is invalid and there aren't other address options
    The "Billing Address Not Found" screen is only displayed if the address inserted is not valid but there are other
    address options. If there aren't other options, an empty case is displayed.
    Given user has the "Billing Address" module configured in CMS for "Billing Address" page
      And user has the "Billing address Empty Case" module configured in CMS for "Billing address Empty Case" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And fills the "zip_code_physical" inputtext with the "TBD" text
      And fills the "city_physical" inputtext with the "TBD" text
      And fills the "street_name_" inputtext with the "TBD" text
      And fills the "street_number" inputtext with the "TBD" text
      And fills the "additional_info_inputtext" inputtext with the "TBD" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing address Empty Case" page is displayed
      And the "empty_case_icon" icon is displayed
      And the "empty_case_title" textfield with "Wir konnten deine Adresse nicht finden" text is displayed
      And the "empty_case_description" textfield with "Bitte überprüfe, ob deine Angaben stimmen." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed
      And the "Rechnungen" header is displayed

  @jira.QANOV-204621 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594 @manual @mobile @smoke
  Scenario: Postpay user can access to the "Billing Address Not Found" screen from the "Physical address" tab
    The "Billing Address Not Found" screen is only displayed if the address inserted is not found, then a list of
    possible addresses is displayed. If the address inserted is found, the user will be redirected to the corresponding
    Feedback screen.
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And fills the "zip_code_inputtext" inputtext with the "10557" text
      And fills the "city_inputtext" inputtext with the "Berlin" text
      And fills the "street_name_inputtext" inputtext with the "Europaplatz" text
      And fills the "street_number_inputtext" inputtext with the "1" text
      And fills the "additional_info_inputtext" inputtext with the "D" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Not Found" page is displayed
      And the "Rechnungsadresse" header is displayed
      And the "title" textfield with "Wir konnten deine Adresse nicht finden." text is displayed
      And the "description" textfield with "Wähle eine Adresse aus:" text is displayed
      And the "address_list" list is displayed
      And each element in the "address_list" list has the "address" field
      And each element in the "address_list" list has the "postalcode_and_city" field
      And each element in the "address_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204623 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @manual @mobile @regression
  Scenario: Postpay user can go to the previous screen from the "Billing Address Not Found" screen
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address Not Found" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Billing Address" page is displayed
      And the "physical_address_tab" tab is selected

  @jira.QANOV-204624 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @manual @mobile @regression
  Scenario: Postpay user selects a physical address in the "Billing Address Not Found" screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed
      And the form fields are filled with the address selected

  @jira.QANOV-204625 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @manual @mobile @smoke
  @raitt_drop2
  Scenario: Postpay user can add the "physical" billing address successfully after passing through the "Billing address Not Found" screen
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user has the "Billing Address Success Feedback" module configured in CMS for "Billing Address Success Feedback" page
      And user is in the "Billing address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
      And the "Billing Address" page is displayed
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Adresse wurde erfolgreich geändert." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-204626 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @manual @mobile @regression
  Scenario: Postpay user can add the "physical" billing address successfully without passing through the "Billing address Not Found" screen
    In order to not seeing the "Billing address Not Found" page, the address inserted has to be found by the OB system.
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user has the "Billing Address Success Feedback" module configured in CMS for "Billing Address Success Feedback" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And fills the "zip_code_inputtext" inputtext with the "TBD" text
      And fills the "city_inputtext" inputtext with the "TBD" text
      And fills the "street_name_inputtext" inputtext with the "TBD" text
      And fills the "street_number_inputtext" inputtext with the "TBD" text
      And fills the "additional_info_inputtext" inputtext with the "TBD" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Adresse wurde erfolgreich geändert." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-204627 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594 @manual @mobile @smoke
  @raitt_drop2
  Scenario: Postpay user can add the "mailbox" billing address successfully
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And fills the "pobox_inputtext" inputtext with the "Lichtensteinallee 1" text
      And fills the "zip_code_inputtext" inputtext with the "10557" text
      And fills the "city_inputtext" inputtext with the "Berlin" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Adresse wurde erfolgreich geändert." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-204628 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @jira.link.detects.OBO2DE-220
  @manual @mobile @regression
  Scenario: Postpay user decides to change the "physical" billing address after passing through the "Billing address Not Found" screen: a confirmation popup is displayed
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
      And the "Billing Address" page is displayed
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Change Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Deine Rechnungsadresse kannst du nachträglich erneut bearbeiten." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204595
  @jira.link.detects.OBO2DE-220 @mobile @qa @regression
  Scenario Outline: Postpay user decides to change the "physical" billing address without passing through the "Billing address Not Found" screen: a confirmation popup is displayed
    In order to not seeing the "Billing address Not Found" page, the address inserted has to be found by the OB system.
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And clears the "zip_code_physical" inputtext
      And clears the "city_physical" inputtext
      And clears the "street_name" inputtext
      And clears the "street_number" inputtext
      And clears the "additional_info" inputtext
      And fills the "zip_code_physical" inputtext with the "80992" text
      And fills the "city_physical" inputtext with the "München" text
      And fills the "street_name" inputtext with the "Georg-Brauchle-Ring" text
      And fills the "street_number" inputtext with the "55" text
      And fills the "additional_info" inputtext with the "Additional info for testing purposes" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Change Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Deine Rechnungsadresse kannst du nachträglich erneut bearbeiten." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    @automatic @android
    Examples:
          | jira_id      |
          | QANOV-204629 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342380 |

  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204595 @mobile @qa @regression
  Scenario Outline: Postpay user decides to change the "mailbox" billing address: a confirmation popup is displayed
    Given user has "billing_address" service in "activated" status
      And user has a "mailbox" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And clears the "pobox" inputtext
      And clears the "zip_code_mailbox" inputtext
      And clears the "city_mailbox" inputtext
      And fills the "pobox" inputtext with the "Lichtensteinallee 2" text
      And fills the "zip_code_mailbox" inputtext with the "10558" text
      And fills the "city_mailbox" inputtext with the "Munich" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing Address Change Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Deine Rechnungsadresse kannst du nachträglich erneut bearbeiten." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    @automatic @android
    Examples:
          | jira_id      |
          | QANOV-204630 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342381 |

  @jira.<jira_id> @blaude @cert3 @jira.cv.13.9 @jira.link.depends_on.QANOV-204628
  @jira.link.depends_on.QANOV-204630 @live @mobile @next @qa @regression
  Scenario Outline: Postpay user cancels to change the billing address
    Given user has "billing_address" service in "activated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
      And clicks on the "physical_address_tab" tab
      And clears the "city_physical" inputtext
      And fills the "city_physical" inputtext with the "Madrid" text
      And clicks on the "save_billing_address_button" button
      And user is in the "Billing Address Change Confirmation" popup
     When clicks on the "popup.cancel" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed

    @automatic @android
    Examples:
          | jira_id      |
          | QANOV-204631 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342382 |

  @jira.<jira_id> @<ber> @<client> @<execution> @blaude @jira.cv.13.9 @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @mobile @qa @smoke @raitt_drop2
  Scenario Outline: Postpay user confirms to change the <address_type> billing address: billing address changed successfully
    Given user has "billing_address" service in "activated" status
      And user has a "<address_type>" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
      And clicks on the "<address_tab>_tab" tab
      And fills the "<input_text>" inputtext with the "00000" text
      And clicks on the "save_billing_address_button" button
      And user is in the "Billing Address Change Confirmation" popup
     When clicks on the "popup.accept" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Deine Adresse wurde erfolgreich geändert." text is displayed
      And the "main_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

    Examples:
          | client  | execution | ber | address_type | address_tab      | depends_on   | detects | input_text        | jira_id      |
          | android | automatic | ber | physical     | physical_address | QANOV-204628 |         | zip_code_physical | QANOV-204632 |

    Examples:
          | client | execution | ber | address_type | address_tab | depends_on   | detects    | input_text | jira_id      |
          | ios    | manual    |     | mailbox      | mailbox     | QANOV-204630 | OBO2DE-223 | pobox      | QANOV-204633 |

  @jira.<jira_id> @<client> @<execution> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204625
  @jira.link.depends_on.QANOV-204627 @jira.link.depends_on.QANOV-204632 @jira.link.depends_on.QANOV-204633 @mobile @qa
  @regression
  Scenario Outline: A postpay user who is in the "Billing Address Success Feedback" screen can go back to the Bills screen
    User can arrive to this Success Feedback screen by adding or changing the billing address.
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
      And fills the "zip_code_physical" inputtext with the "00000" text
      And clicks on the "save_billing_address_button" button
      And user is in the "Billing Address Change Confirmation" popup
      And clicks on the "popup.accept" button
      And the "Feedback" page is displayed
     When clicks on the "main_button" button
     Then the "Bills" page is displayed

    @automatic @android
    Examples:
          | jira_id      |
          | QANOV-204634 |

    @manual @ios
    Examples:
          | jira_id      |
          | QANOV-342383 |

  @jira.QANOV-204636 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @jira.link.detects.OBO2DE-232
  @manual @mobile @regression
  Scenario: Postpay user tries to add a "physical" billing address but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to add a billing
    address without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "billing_address" service in "deactivated" status
      And user has tried to add a billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
      And the "Billing Address" page is displayed
      And clicks on the "save_billing_address_button" button
      And there is an error adding the billing address
     Then the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204637 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594 @jira.link.detects.OBO2DE-232
  @manual @mobile @regression
  Scenario: Postpay user tries to add a "mailbox" billing address but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to add a billing
    address without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "billing_address" service in "deactivated" status
      And user has tried to add a billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And fills the "pobox_inputtext" inputtext with the "Lichtensteinallee 1" text
      And fills the "zip_code_inputtext" inputtext with the "10557" text
      And fills the "city_inputtext" inputtext with the "Berlin" text
      And clicks on the "save_billing_address_button" button
      And there is an error adding the billing address
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204638 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204628
  @jira.link.depends_on.QANOV-204630 @jira.link.detects.OBO2DE-232 @manual @mobile @regression
  Scenario: Postpay user tries to change the billing address but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the billing
    address without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "billing_address" service in "activated" status
      And user has tried to change the billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address Change Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204639 @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204636 @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to add a "physical" billing address without success
    Given user has "billing_address" service in "deactivated" status
      And user has tried to add a billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" entrypoint
      And the "Billing Address" page is displayed
      And clicks on the "save_billing_address_button" button
      And there is an error adding the billing address
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Billing Address" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204640 @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204637 @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to add a "mailbox" billing address without success
    Given user has "billing_address" service in "deactivated" status
      And user has tried to add a billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And fills the "pobox_inputtext" inputtext with the "Lichtensteinallee 1" text
      And fills the "zip_code_inputtext" inputtext with the "10557" text
      And fills the "city_inputtext" inputtext with the "Berlin" text
      And clicks on the "save_billing_address_button" button
      And there is an error adding the billing address
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Billing Address" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204641 @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204638 @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to change the billing address without success
    Given user has "billing_address" service in "activated" status
      And user has tried to change the billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address Change Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Billing Address" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204642 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204621 @manual @mobile @regression
  Scenario: Postpay user tries to add a "physical" billing address but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to add a billing
    address without success. The second attempt will redirect to a full screen error feedback.
    Given user has "billing_address" service in "deactivated" status
      And user has tried to add a billing address "1" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
      And the "Billing Address" page is displayed
      And clicks on the "save_billing_address_button" button
      And there is an error adding the billing address
     Then the "Billing Address Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Adresse konnte nicht geändert werden" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut" text is displayed
      And the "close_feeback_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-204643 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204594 @manual @mobile @regression
  Scenario: Postpay user tries to add a "mailbox" billing address but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to add a billing
    address without success. The second attempt will redirect to a full screen error feedback.
    Given user has "billing_address" service in "deactivated" status
      And user has tried to add a billing address "1" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And fills the "pobox_inputtext" inputtext with the "Lichtensteinallee 1" text
      And fills the "zip_code_inputtext" inputtext with the "10557" text
      And fills the "city_inputtext" inputtext with the "Berlin" text
      And clicks on the "save_billing_address_button" button
      And there is an error adding the billing address
     Then the "Billing Address Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Adresse konnte nicht geändert werden" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut" text is displayed
      And the "close_feeback_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-204644 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204628
  @jira.link.depends_on.QANOV-204630 @manual @mobile @regression
  Scenario: Postpay user tries to change the billing address but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the billing
    address without success. The second attempt will redirect to a full screen error feedback.
    Given user has "billing_address" service in "activated" status
      And user has tried to change the billing address "1" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing Address Change Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
     Then the "Billing Address Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Adresse konnte nicht geändert werden" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut" text is displayed
      And the "close_feeback_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204642
  @jira.link.depends_on.QANOV-204643 @jira.link.depends_on.QANOV-204644 @manual @mobile @regression
  Scenario Outline: A postpay user who is in the "Billing Address Error Feedback" screen can tap on the "<button_name>" button
    User can arrive to this Error Feedback screen by adding or changing the billing address.
    Given user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing Address Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

    Examples:
          | button_name          | button_id                       | jira_id      |
          | Close Error Feedback | close_feeback_button            | QANOV-204645 |
          | Close                | navigation_top_bar.close_button | QANOV-204646 |

  @jira.QANOV-204647 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204642 @jira.link.depends_on.QANOV-204643
  @jira.link.depends_on.QANOV-204644 @manual @mobile @regression
  Scenario: A postpay user can go to previous screen from the "Billing Address Error Feedback" screen on iOS devices
    User can arrive to this Error Feedback screen by adding or changing the billing address.
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing Address Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed

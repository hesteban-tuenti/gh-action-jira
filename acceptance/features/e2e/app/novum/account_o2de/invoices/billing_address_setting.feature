# -*- coding: utf-8 -*-
@jira.QANOV-204534
Feature: Billing Address setting

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page


  @jira.QANOV-204535 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126 @jira.link.detects.O2DE-1451 @manual
  @mobile @o2de @regression
  Scenario: Postpay user can see the "billing address" setting in the Bills screen when it's deactivated
    Given user has "billing_address" service in "deactivated" status
      And user is in the "Bills" page
     Then the "billing_address_entrypoint" entrypoint with "Rechnungsadresse" text is displayed
      And the "bills_settings.billing_address_postalcode" textfield is not displayed
      And the "bills_settings.billing_address_tag" textfield is not displayed

  @jira.QANOV-204536 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126 @manual @mobile @o2de @regression
  Scenario: Postpay user can see the "billing address" setting in the Bills screen when it's activated
    If the billing address setting is active, the postal code value will be displayed under the entrypoint.
    Given user has "billing_address" service in "activated" status
      And user is in the "Bills" page
     Then the "billing_address_entrypoint" entrypoint with "Rechnungsadresse" text is displayed
      And the "bills_settings.billing_address_postalcode" textfield is displayed
      And the "bills_settings.billing_address_tag" textfield is not displayed

  @jira.<jira_id> @android @<ber> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1497
  @manual @mobile @o2de @smoke @jira.link.parent_test_plan.QANOV-437471
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
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_billing_address_button" button with "<button_text>" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

    Examples:
          | user_action              | billing_address_status | title                       | description                                                                              | button_text                | ber | depends_on   | jira_id      |
          | add the billing address  | deactivated            | Rechnungsadresse hinzufügen | Du hast die Möglichkeit, eine Adresse in Deutschland odere ein Postfach zu hinterlegen.  | Rechnungsadresse speichern |     | QANOV-204535 | QANOV-204537 |
          | edit the billing address | activated              | Rechnungsadresse bearbeiten | Änderungen an deiner Adresse oder deinem hinterlegten Postfach kannst du hier vornehmen. | Rechnungsadresse ändern    | ber | QANOV-204536 | QANOV-204538 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @jira.link.depends_on.QANOV-204538
  @manual @mobile @o2de @regression
  Scenario Outline: User can see the optional "<optional_field>" field inserted in the "Billing Address" screen
    Given user has the "<optional_field>" field filled in the billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     Then the "<optional_field>_value" textfield is displayed
      And the "<optional_field>_label" textfield with "<label>" text is displayed

    Examples:
          | optional_field | label | jira_id      |
          | name           | Name  | QANOV-290373 |
          | company_name   | Firma | QANOV-290374 |

  @jira.QANOV-204545 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @jira.link.depends_on.QANOV-204538
  @manual @mobile @o2de @regression
  Scenario: Postpay user can access to the data protection info from the "Billing Address" screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Billing Address" page is displayed

  @jira.QANOV-204539 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537
  @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @sanity @jira.link.parent_test_plan.QANOV-437471
  Scenario: Postpay user can see the content of "Physical address" tab in Billing Address screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
     Then the "physical_address_tab" tab is selected
      And the "zip_code_physical.inputtext" inputtext is displayed
      And the "zip_code_physical.placeholder" textfield with "Postleitzahl" text is displayed
      And the "city_physical.inputtext" inputtext is displayed
      And the "city_physical.placeholder" textfield with "Ort" text is displayed
      And the "street_name.inputtext" inputtext is displayed
      And the "street_name.placeholder" textfield with "Straße" text is displayed
      And the "street_number.inputtext" inputtext is displayed
      And the "street_number.placeholder" textfield with "Hausnummer" text is displayed
      And the "additional_info.inputtext" inputtext is displayed
      And the "additional_info.placeholder" textfield that contains the "Adresszusatz" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204540 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537
  @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @sanity @jira.link.parent_test_plan.QANOV-437471
  Scenario: Postpay user can see the content of "Mailbox" tab in Billing Address screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "mailbox_tab" tab is selected
      And the "pobox.inputtext" inputtext is displayed
      And the "pobox.placeholder" textfield with "Postfach" text is displayed
      And the "zip_code_mailbox.inputtext" inputtext is displayed
      And the "zip_code_mailbox.placeholder" textfield with "Postleitzahl" text is displayed
      And the "city_mailbox.inputtext" inputtext is displayed
      And the "city_mailbox.placeholder" textfield with "Ort" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204541 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @manual @mobile @o2de @regression
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
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204542 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @manual @mobile @o2de @regression
  Scenario: Postpay user with billing address deactivated can see all the fields empty in the "Mailbox" tab
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "mailbox_tab" tab is selected
      And the "pobox_inputtext" inputtext is empty
      And the "zip_code_inputtext" inputtext is empty
      And the "city_inputtext" inputtext is empty
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204543 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @regression
  Scenario: Postpay user with billing address activated can see all the mandatory fields filled in the "Physical address" tab
    The "additional address information" field is optional.
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
     Then the "physical_address_tab" tab is selected
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext" inputtext is not empty
      And the "street_name_inputtext" inputtext is not empty
      And the "street_number_inputtext" inputtext is not empty
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204544 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @regression
  Scenario: Postpay user with billing address activated can see all the mandatory fields filled in the "Mailbox" tab
    The "additional address information" field is optional.
    Given user has "billing_address" service in "activated" status
      And user has a "mailbox" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
     Then the "mailbox_tab" tab is selected
      And the "pobox_inputtext" inputtext is not empty
      And the "zip_code_inputtext" inputtext is not empty
      And the "city_inputtext" inputtext is not empty
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can tap on back button after filling any field from the "<address_tab>" tab on <client> device
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "<address_tab>_tab" tab
      And fills the "zip_code_inputtext" inputtext with the "0" text
      And clicks on the <button> button
     Then the "Billing Address Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren" text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | address_tab      | button                           | continue_button | cancel_button | depends_on   | jira_id      |
          | android | physical_address | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-204539 | QANOV-204547 |
          | android | mailbox          | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-204540 | QANOV-204548 |
          | ios     | physical_address | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-204539 | QANOV-214315 |
          | ios     | mailbox          | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-204540 | QANOV-214316 |

  @jira.QANOV-204549 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204547 @jira.link.depends_on.QANOV-204548
  @jira.link.depends_on.QANOV-214315 @jira.link.depends_on.QANOV-214316 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to continue with the billing address flow after seeing the Billing Address Cancellation popup
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed

  @jira.QANOV-204550 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204547 @jira.link.depends_on.QANOV-204548
  @jira.link.depends_on.QANOV-214315 @jira.link.depends_on.QANOV-214316 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to cancel the billing address flow after seeing the Billing Address Cancellation popup
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

  @jira.QANOV-204553 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204539 @manual @mobile @o2de @regression
  Scenario: Postpay user cannot save the "physical" billing address without filling all the mandatory fields
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And clears the "zip_code_inputtext" inputtext
      And clears the "city_inputtext" inputtext
      And clears the "street_name_inputtext" inputtext
      And clears the "street_number_inputtext" inputtext
      And clears the "additional_info_inputtext" inputtext
      And clicks on the "save_billing_address_button" button
     Then the "zip_code_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "city_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "street_name_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "street_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-204554 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204540 @manual @mobile @o2de @regression
  Scenario: Postpay user cannot save the "mailbox" billing address without filling all the mandatory fields
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And clears the "pobox_inputtext" inputtext
      And clears the "zip_code_inputtext" inputtext
      And clears the "city_inputtext" inputtext
      And clicks on the "save_billing_address_button" button
     Then the "pobox_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "zip_code_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "city_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user cannot change the "<address_type>" billing address without making any change in the address
    Given user has "billing_address" service in "activated" status
      And user has a "<address_type>" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "<address_tab>_tab" tab
      And clicks on the "save_billing_address_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

    Examples:
          | address_type | address_tab      | jira_id      |
          | physical     | physical_address | QANOV-204562 |
          | mailbox      | mailbox          | QANOV-204563 |

  @jira.QANOV-204551 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204539 @manual @mobile @o2de @regression
  Scenario: User cannot save the physical billing address if the address is invalid and there aren't other address options
    The "Billing Address Not Found" screen is only displayed if the address inserted is not valid but there are other
    address options. If there aren't other options, an empty case is displayed.
    Given user has the "Billing Address" module configured in CMS for "Billing Address" page
      And user has the "Billing address Empty Case" module configured in CMS for "Billing address Empty Case" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And fills the "zip_code_inputtext" inputtext with the "TBD" text
      And fills the "city_inputtext" inputtext with the "TBD" text
      And fills the "street_name_inputtext" inputtext with the "TBD" text
      And fills the "street_number_inputtext" inputtext with the "TBD" text
      And fills the "additional_info_inputtext" inputtext with the "TBD" text
      And clicks on the "save_billing_address_button" button
     Then the "Billing address Empty Case" page is displayed
      And the "empty_case_icon" icon is displayed
      And the "empty_case_title" textfield with "Wir konnten deine Adresse nicht finden" text is displayed
      And the "empty_case_description" textfield with "Bitte überprüfe, ob deine Angaben stimmen." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed
      And the "Rechnungen" header is displayed

  @jira.QANOV-204564 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @manual @mobile @o2de @smoke
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

  @jira.QANOV-204566 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @regression
  Scenario: Postpay user can go to the previous screen from the "Billing Address Not Found" screen
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address Not Found" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Billing Address" page is displayed
      And the "physical_address_tab" tab is selected

  @jira.QANOV-204567 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @regression
  Scenario: Postpay user selects a physical address in the "Billing Address Not Found" screen
    Given user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address Not Found" page
     When clicks on any element in the "address_list" list
      And clicks on the "continue_button" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed
      And the form fields are filled with the address selected

  @jira.QANOV-204568 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @smoke
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

  @jira.QANOV-204569 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @regression
  @jira.link.parent_test_plan.QANOV-437471
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

  @jira.QANOV-204570 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @manual @mobile @o2de @smoke
  @jira.link.parent_test_plan.QANOV-437471
  Scenario: Postpay user can add the "mailbox" billing address successfully
    Given user has "billing_address" service in "deactivated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing Address Success Feedback" module configured in CMS for "Billing Address Success Feedback" page
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

  @jira.QANOV-204571 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @regression
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
     Then the "Change Billing Address Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Deine Rechnungsadresse kannst du nachträglich erneut bearbeiten." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-204572 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to change the "physical" billing address without passing through the "Billing address Not Found" screen: a confirmation popup is displayed
    In order to not seeing the "Billing address Not Found" page, the address inserted has to be found by the OB system.
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing address not found" module configured in CMS for "Billing Address Not Found" page
      And user is in the "Billing Address" page
     When clicks on the "physical_address_tab" tab
      And clears the "zip_code_inputtext" inputtext
      And clears the "city_inputtext" inputtext
      And clears the "street_name_inputtext" inputtext
      And clears the "street_number_inputtext" inputtext
      And clears the "additional_info_inputtext" inputtext
      And fills the "zip_code_inputtext" inputtext with the "80992" text
      And fills the "city_inputtext" inputtext with the "München" text
      And fills the "street_name_inputtext" inputtext with the "Schegastr." text
      And fills the "street_number_inputtext" inputtext with the "22-23" text
      And fills the "additional_info_inputtext" inputtext with the "A" text
      And clicks on the "save_billing_address_button" button
     Then the "Change Billing Address Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Deine Rechnungsadresse kannst du nachträglich erneut bearbeiten." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-204573 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204538 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to change the "mailbox" billing address: a confirmation popup is displayed
    Given user has "billing_address" service in "activated" status
      And user has a "mailbox" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Billing Address" page
     When clicks on the "mailbox_tab" tab
      And clears the "pobox_inputtext" inputtext
      And clears the "zip_code_inputtext" inputtext
      And clears the "city_inputtext" inputtext
      And fills the "pobox_inputtext" inputtext with the "Lichtensteinallee 2" text
      And fills the "zip_code_inputtext" inputtext with the "10558" text
      And fills the "city_inputtext" inputtext with the "Munich" text
      And clicks on the "save_billing_address_button" button
     Then the "Change Billing Address Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Deine Rechnungsadresse kannst du nachträglich erneut bearbeiten." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-204574 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204571 @jira.link.depends_on.QANOV-204573
  @manual @mobile @o2de @regression
  Scenario: Postpay user cancels to change the billing address
    Given user has "billing_address" service in "activated" status
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.cancel" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  @jira.link.parent_test_plan.QANOV-437471
  Scenario Outline: Postpay user confirms to change the <address_type> billing address: billing address changed successfully
    Given user has "billing_address" service in "activated" status
      And user has a "<address_type>" billing address
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing Address Success Feedback" module configured in CMS for "Billing Address Success Feedback" page
      And user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.accept" button
     Then the "Billing Address Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Adresse wurde erfolgreich geändert." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

    Examples:
          | address_type | depends_on                | ber | jira_id      |
          | physical     | QANOV-204571:QANOV-204572 | ber | QANOV-204575 |
          | mailbox      | QANOV-204573              |     | QANOV-204576 |

  @jira.QANOV-204577 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204568 @jira.link.depends_on.QANOV-204570
  @jira.link.depends_on.QANOV-204575 @jira.link.depends_on.QANOV-204576 @manual @mobile @o2de @regression
  Scenario: A postpay user who is in the "Billing Address Success Feedback" screen can go back to the Bills screen
    User can arrive to this Success Feedback screen by adding or changing the billing address.
    Given user has the "Billing Address Success Feedback" module configured in CMS for "Billing Address Success Feedback" page
      And user is in the "Billing Address Success Feedback" page
     When clicks on the "exit_button" button
     Then the "Bills" page is displayed

  @jira.QANOV-204579 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @regression
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
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204580 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @manual @mobile @o2de @regression
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

  @jira.QANOV-204581 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204571 @jira.link.depends_on.QANOV-204573
  @manual @mobile @o2de @regression
  Scenario: Postpay user tries to change the billing address but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the billing
    address without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "billing_address" service in "activated" status
      And user has tried to change the billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204582 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-204579 @manual @mobile @o2de @regression
  Scenario: Postpay user can close the error warning after trying to add a "physical" billing address without success
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
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Billing Address" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204583 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-204580 @manual @mobile @o2de @regression
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

  @jira.QANOV-204584 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-204581 @manual @mobile @o2de @regression
  Scenario: Postpay user can close the error warning after trying to change the billing address without success
    Given user has "billing_address" service in "activated" status
      And user has tried to change the billing address "0" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Billing Address" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204585 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204564 @manual @mobile @o2de @regression
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

  @jira.QANOV-204586 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204537 @manual @mobile @o2de @regression
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

  @jira.QANOV-204587 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204571 @jira.link.depends_on.QANOV-204573
  @manual @mobile @o2de @regression
  Scenario: Postpay user tries to change the billing address but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the billing
    address without success. The second attempt will redirect to a full screen error feedback.
    Given user has "billing_address" service in "activated" status
      And user has tried to change the billing address "1" times without success
      And user has the "Billing address" module configured in CMS for "Billing Address" page
      And user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
     Then the "Billing Address Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Adresse konnte nicht geändert werden" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut" text is displayed
      And the "close_feeback_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204585 @jira.link.depends_on.QANOV-204586
  @jira.link.depends_on.QANOV-204587 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who is in the "Billing Address Error Feedback" screen can tap on the "<button_name>" button
    User can arrive to this Error Feedback screen by adding or changing the billing address.
    Given user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing Address Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed

    Examples:
          | button_name          | button_id                       | jira_id      |
          | Close Error Feedback | close_feedback_button           | QANOV-204588 |
          | Close                | navigation_top_bar.close_button | QANOV-204589 |

  @jira.QANOV-204590 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204585 @jira.link.depends_on.QANOV-204586
  @jira.link.depends_on.QANOV-204587 @manual @mobile @o2de @regression
  Scenario: A postpay user can go to previous screen from the "Billing Address Error Feedback" screen on iOS devices
    User can arrive to this Error Feedback screen by adding or changing the billing address.
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Billing Address Error Feedback" module configured in CMS for "Billing Address Error Feedback" page
      And user is in the "Billing Address Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-218356
Feature: Billing address

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1451
  @manual @mobile @regression
  Scenario Outline: User without billing address saved can see the "billing address" entrypoint in the "Payment Settings" screen
    Given user has any "<postpay_products>" product in "active" status
      And user has "billing_address" service in "deactivated" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "billing_address_entrypoint" entrypoint with "Rechnungsadresse" text is displayed
      And the "billing_address_description" textfield is not displayed
      And the "billing_address_tag" textfield with "Nicht hinterlegt" text is displayed

    @raitt_drop2
    Examples:
          | product | cv   | postpay_products          | depends_on                                          | jira_id      |
          | blaude  | 13.9 | mobile_line               | QANOV-217326:QANOV-217341                           | QANOV-217352 |

    Examples:
          | product | cv   | postpay_products             | depends_on                                          | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 | QANOV-217353 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User with billing address saved can see the "billing address" entrypoint in the "Payment Settings" screen
    Given user has any "<postpay_products>" product
      And user has "billing_address" service in "activated" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "billing_address_entrypoint" entrypoint with "Rechnungsadresse" text is displayed
      And the "billing_address_description" textfield is displayed
      And the "billing_address_tag" textfield is not displayed

    @raitt_drop2
    Examples:
          | product | cv   | postpay_products          | depends_on                                          | jira_id      |
          | blaude  | 13.9 | mobile_line               | QANOV-217326:QANOV-217341                           | QANOV-217354 |

    Examples:
          | product | cv   | postpay_products             | depends_on                                          | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 | QANOV-217355 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A postpay user with Telco product/s and My Handy product/s can access to the "Billing Address" screen for Telco products from the Profile screen
    Telco products: mobile line, internet@home.
    The flow to add/edit the Billing Address will be defined in the "account_XXXX/invoices" folder.
    Given user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
      And the "Payment Settings" page is displayed
      And clicks on the "billing_address_entrypoint" entrypoint
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-218357 |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-218358 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A postpay user with only Telco product/s can access to the "Billing Address" screen from Profile screen
    The flow to add/edit the Billing Address will be defined in the "account_XXXX/invoices" folder.
    Given user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user does not have the "my_handy" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Payment Settings" page is displayed
      And clicks on the "billing_address_entrypoint" entrypoint
     Then the "Billing Address" page is displayed
      And the "Rechnungsadresse" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-218359 |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-218360 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: Postpay user with all products cancelled cannot change the physical billing address from Profile screen
    This screen will be displayed in "only read" mode.
    Given user has "billing_address" service in "activated" status
      And user has a "physical" billing address
      And user has all products in "cancelled" status
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user has the "Billing Address" module configured in CMS for "Billing Address" page
      And user is in the "Payment Settings" page
     When clicks on the "billing_address_entrypoint" entrypoint
      And the "Billing Address" page is displayed
      And clicks on the "physical_address_tab" tab
     Then the "address_info.title" textfield with "Rechnungsadresse" text is displayed
      And the "address_info.description" textfield with "Für dieses Konto würde Mein O2 ab jetzt diese Adresse verwenden. Du kannst das in deinem Profil wieder ändern" text is displayed
      And the "zip_code_inputtext" inputtext is not displayed
      And the "zip_code_value" textfield is displayed
      And the "zip_code_title" textfield with "Postleitzahl" text is displayed
      And the "city_inputtext" inputtext is not displayed
      And the "city_value" textfield is displayed
      And the "city_title" textfield with "Ort" text is displayed
      And the "street_name_inputtext" inputtext is not displayed
      And the "street_name_value" textfield is displayed
      And the "street_name_title" textfield with "Street name" text is displayed
      And the "street_number_inputtext" inputtext is not displayed
      And the "street_number_title" textfield with "Street number" text is displayed
      And the "additional_info_inputtext" inputtext is not displayed
      And the "additional_info_title" textfield with "Adresszusatz" text is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "save_billing_address_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | blaude  | 14.1 | QANOV-306250              | QANOV-308047 |
          | o2de    | 14.2 | QANOV-306250:QANOV-437471 | QANOV-308048 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: Postpay user with all products cancelled cannot change the mailbox billing address from Profile screen
    This screen will be displayed in "only read" mode.
    Given user has "billing_address" service in "activated" status
      And user has a "mailbox" billing address
      And user has all products in "cancelled" status
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user has the "Billing Address" module configured in CMS for "Billing Address" page
      And user is in the "Payment Settings" page
     When clicks on the "billing_address_entrypoint" entrypoint
      And the "Billing Address" page is displayed
      And clicks on the "mailbox_tab" tab
     Then the "address_info.title" textfield with "Rechnungsadresse" text is displayed
      And the "address_info.description" textfield with "Für dieses Konto würde Mein O2 ab jetzt diese Adresse verwenden. Du kannst das in deinem Profil wieder ändern" text is displayed
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
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | blaude  | 14.1 | QANOV-306250              | QANOV-308049 |
          | o2de    | 14.2 | QANOV-306250:QANOV-437471 | QANOV-308050 |

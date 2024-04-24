# -*- coding: utf-8 -*-
@jira.QANOV-204524
Feature: Bank Account setting

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has bills
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page


  @jira.QANOV-204525 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126 @manual @mobile @o2de @regression
  Scenario: Postpay user can see the "bank account" setting in the Bills screen when does not have bank account
    For postpay, to check the bank account status, see Invoice Payment Management API.
     - user with bank account in ACTIVE status:
        "payment_method": "direct_debit",
        "status": "configured"
    - user with bank account in PENDING status:
        "payment_method": "direct_debit",
        "status": "pending"
     - user without bank account: "payment_method": "none"
    Given user does not have bank account
      And user is in the "Bills" page
     Then the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "bills_settings.bank_account_description" textfield is not displayed
      And the "bills_settings.bank_account_tag" textfield with "Deaktiviert" text is displayed

  @jira.QANOV-204526 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126 @manual @mobile @o2de @regression
  Scenario: Postpay user can see the "bank account" setting in the Bills screen when it's activated
    If the bank account setting is active, the bank account value will be displayed under the entrypoint.
    For postpay, to check the bank account status, see Invoice Payment Management API.
     - user with bank account in ACTIVE status:
        "payment_method": "direct_debit",
        "status": "configured"
    - user with bank account in PENDING status:
        "payment_method": "direct_debit",
        "status": "pending"
     - user without bank account: "payment_method": "none"
    Given user has "bank_account" service in "activated" status
      And user is in the "Bills" page
     Then the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "bills_settings.bank_account_description" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "bills_settings.bank_account_tag" textfield is not displayed

  @jira.QANOV-532926 @android @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-200126 @manual @mobile @o2de @regression
  Scenario: Postpay user can see the "bank account" setting in the Bills screen when it's pending
    The chevron icon is not displayed because the users won't be able to access the "Bank Account" screen when it is in
    pending status.
    For postpay, to check the bank account status, see Invoice Payment Management API.
     - user with bank account in ACTIVE status:
        "payment_method": "direct_debit",
        "status": "configured"
    - user with bank account in PENDING status:
        "payment_method": "direct_debit",
        "status": "pending"
     - user without bank account: "payment_method": "none"
    Given user has "bank_account" service in "pending" status
      And user is in the "Bills" page
     Then the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "bills_settings.bank_account_description" textfield with the "^[A-Z]{2}\d{2} [\*\ ]+\*[\d\ ]{5}$" format is displayed
      And the "bills_settings.bank_account_tag" textfield with "Kurzfristige Sperre nach Erstnutzung" text is displayed
      And the "bills_settings.bank_account_chevron" icon is not displayed

  @jira.QANOV-204527 @smoke @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204525 @manual @mobile
  @o2de
  Scenario: Postpay user can access to add the bank account from the settings section in the Bills screen when does not have bank account
    The flow to add/edit a bank account will be defined in the "settings_and_profile/payment_settings" folder.
    For postpay, to check the bank account status, see Invoice Payment Management API.
     - user with bank account in ACTIVE status:
        "payment_method": "direct_debit",
        "status": "configured"
    - user with bank account in PENDING status:
        "payment_method": "direct_debit",
        "status": "pending"
     - user without bank account: "payment_method": "none"
    Given user does not have bank account
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     When clicks on the "bank_account_entrypoint" entrypoint
     Then the "Bank Account Edition" page is displayed
      And the "Bankverbindung" header is displayed
      And the "title" textfield with "Bankverbindung einrichten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204528 @sanity @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-204526 @manual @mobile
  @o2de
  Scenario: Postpay user can access to edit the bank account from the settings section in the Bills screen when it's activated
    The flow to add/edit a bank account will be defined in the "settings_and_profile/payment_settings" folder.
    For postpay, to check the bank account status, see Invoice Payment Management API.
     - user with bank account in ACTIVE status:
        "payment_method": "direct_debit",
        "status": "configured"
    - user with bank account in PENDING status:
        "payment_method": "direct_debit",
        "status": "pending"
     - user without bank account: "payment_method": "none"
    Given user has "bank_account" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     When clicks on the "bank_account_entrypoint" entrypoint
     Then the "Bank Account" page is displayed
      And the "Bankverbindung" header is displayed
      And the "title" textfield with "Bankverbindung bearbeiten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

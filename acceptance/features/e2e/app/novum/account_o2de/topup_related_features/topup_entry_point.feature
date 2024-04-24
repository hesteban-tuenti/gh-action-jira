# -*- coding: utf-8 -*-
@jira.QANOV-47880
Feature: Topup entry point

  Actions Before each Scenario:
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has the "Balance" module configured in CMS for "Account" page
      And user has the "Topup Method" module configured in CMS for "Topup" page


  @jira.QANOV-184194 @regression @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47873
  @jira.link.depends_on.QANOV-47874 @manual @mobile @o2de
  Scenario: Prepay user with bank account pending can access to the Topup screen from the balance module
    User has several top up options:
    - Top-up with a voucher
    - One-time quick charge (bank account)
    - Top-up with third party providers (paypal, credit card)
    For users without the bank account registered, no settings section will be displayed.
    User to test: 015731700857 / #brt1234
    For prepay to check the bank account status, see Bank Account Management API:
     - status = activated: bank account activated
     - status = pending: bank account in pending status
    To check if the user does not have bank account, see Bank Account Management API.
    Given user has "bank_account" service in "pending" status
      And user is in the "Account" page
     When clicks on the "balance.topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed
      And the "balance.title" textfield with "Aktuelles Guthaben" text is displayed
      And the "balance.amount" textfield with the "\d+,\d\d €" format is displayed
      And the "balance.expiration_date" textfield is displayed
      And the "topup_options" module is displayed
      And the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Guthabenkarte & Code" text is displayed
      And the "topup_options.voucher_description" textfield with "Aufladecode eingeben" text is displayed
      And the "topup_options.third_party_entrypoint" entrypoint with "Weitere Auflademöglichkeiten" text is displayed
      And the "topup_options.third_party_description" textfield with "Paypal oder Kreditkarte" text is displayed
      And the "topup_options.bank_account_tag" textfield with "Bankverbindung nicht hinterlegt" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint with "Einmalige Schnellaufladung" text is displayed
      And the "topup_options.bank_account_description" textfield with "Hinterlege deine Bankverbindung" text is displayed
      And the "topup_settings" module is not displayed
      And the "bank_activation" module is displayed
      And the "bank_activation.title" textfield with "BANKVERBINDUNG EINRICHTEN" text is displayed
      And the "bank_activation.description" textfield with "Gunthaben aufladen leicht gemacht. Laden dein Guthaben bequem per Bankeinzung auf. Hinterlege hierfür einfach deine Bankverbindung." text is displayed
      And clicks on the "top_navigation_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-47881 @smoke @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47873
  @jira.link.depends_on.QANOV-47874 @manual @mobile @o2de
  Scenario: Prepay user without bank account can access to the Topup screen from the balance module
    User has several top up options:
    - Top-up with a voucher
    - One-time quick charge (bank account)
    - Top-up with third party providers (paypal, credit card)
    For users without the bank account registered, no settings section will be displayed.
    User to test: 015731700857 / #brt1234
    For prepay to check the bank account status, see Bank Account Management API:
     - status = activated: bank account activated
     - status = pending: bank account in pending status
    To check if the user does not have bank account, see Bank Account Management API.
    Given user does not have bank account
      And user is in the "Account" page
     When clicks on the "balance.topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed
      And the "balance.title" textfield with "Aktuelles Guthaben" text is displayed
      And the "balance.amount" textfield with the "\d+,\d\d €" format is displayed
      And the "balance.expiration_date" textfield is displayed
      And the "topup_options" module is displayed
      And the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Guthabenkarte & Code" text is displayed
      And the "topup_options.voucher_description" textfield with "Aufladecode eingeben" text is displayed
      And the "topup_options.third_party_entrypoint" entrypoint with "Weitere Auflademöglichkeiten" text is displayed
      And the "topup_options.third_party_description" textfield with "Paypal oder Kreditkarte" text is displayed
      And the "topup_options.bank_account_tag" textfield with "Bankverbindung nicht hinterlegt" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint with "Einmalige Schnellaufladung" text is displayed
      And the "topup_options.bank_account_description" textfield with "Hinterlege deine Bankverbindung" text is displayed
      And the "topup_settings" module is not displayed
      And the "bank_activation" module is displayed
      And the "bank_activation.title" textfield with "BANKVERBINDUNG EINRICHTEN" text is displayed
      And the "bank_activation.description" textfield with "Gunthaben aufladen leicht gemacht. Laden dein Guthaben bequem per Bankeinzung auf. Hinterlege hierfür einfach deine Bankverbindung." text is displayed
      And clicks on the "top_navigation_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-47882 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47873 @jira.link.depends_on.QANOV-47874
  @manual @mobile @o2de @sanity
  Scenario: Prepay user with bank account activated can access to the Topup screen from the balance module
    User has several top up options:
    - Top-up with a voucher
    - One-time charge (bank account)
    - Top-up with third party providers (paypal, credit card)
    If a bank account is registered, the user will see 2 additional entrypoints:
    - Top-up with SMS settings
    - Manage automatic top-up
    For prepay to check the bank account status, see Bank Account Management API:
     - status = activated: bank account activated
     - status = pending: bank account in pending status
    To check if the user does not have bank account, see Bank Account Management API.
    Given user has "bank_account" service in "activated" status
      And user is in the "Account" page
     When clicks on the "balance.topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed
      And the "balance.title" textfield with "Aktuelles Guthaben" text is displayed
      And the "balance.expiration_date" textfield is displayed
      And the "balance.amount" textfield with the "(-)?\d+,\d\d €" format is displayed
      And the "topup_options" module is displayed
      And the "topup_options.title_textfield" textfield with "WÄHLEN EINE AUFLADEMÖGLICHKEIT" text is displayed
      And the "topup_options.voucher_entrypoint" entrypoint with "Guthabenkarte & Code" text is displayed
      And the "topup_options.voucher_description" textfield with "Aufladecode eingeben" text is displayed
      And the "topup_options.third_party_entrypoint" entrypoint with "Weitere Auflademöglichkeiten" text is displayed
      And the "topup_options.third_party_description" textfield with "Paypal oder Kreditkarten" text is displayed
      And the "topup_options.bank_account_entrypoint" entrypoint with "Einmalige Schnellaufladung" text is displayed
      And the "topup_options.bank_account_description" textfield with the "^[A-Z]{2}[*]+[0-9]{4}$" format is displayed
      And the "topup_settings" module is displayed
      And the "topup_settings.title" textfield with "EINSTELLUNGEN" text is displayed
      And the "topup_settings.sms_topup_entrypoint" entrypoint with "Aufladung über SMS" text is displayed
      And the "topup_settings.sms_topup_description" textfield with "Sende eine SMS an die Kurzwahl "5667"" text is displayed
      And the "topup_settings.automatic_topup_entrypoint" entrypoint with "Automatische Aufladung" text is displayed
      And the "topup_settings.automatic_topup_description" textfield with "Automatische Aufladung bei geringem Guthaben" text is displayed
      And the "bank_activation" module is not displayed
      And clicks on the "top_navigation_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-326073 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-184194 @jira.link.depends_on.QANOV-47881
  @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @regression
  Scenario: Prepay user with balance not expired can see the expiration date in the Topup screen
    Given user has the balance not expired
      And user is in the "Topup" page
     Then the "balance.expiration_date" textfield with the "Gültig bis (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed

  @jira.QANOV-326074 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-184194 @jira.link.depends_on.QANOV-47881
  @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @regression
  Scenario: Prepay user with balance expired can see the expiration date in the Topup screen
    Given user has the balance expired
      And user is in the "Topup" page
     Then the "balance.expiration_date" textfield with the "lief am (0?[1-9]|[12][0-9]|3[01]). (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4} aus." format is displayed

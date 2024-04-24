# -*- coding: utf-8 -*-
@jira.QANOV-192951
Feature: Topup with bank account

  Actions Before each Scenario:
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case


  @jira.QANOV-192952 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47881 @manual @mobile @o2de @regression
  Scenario: Prepay user without bank account can access to the "Bank Account Edition" screen to add a bank account
    For prepay to check the bank account status, see Bank Account Management API:
    - status = activated: bank account activated
    - status = pending: bank account in pending status
    To check if the user does not have bank account, see Bank Account Management API.
    Given user does not have bank account
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     When clicks on the "topup_options.bank_account_entrypoint" entrypoint
     Then the "Bank Account Edition" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192953 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-184194 @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account in pending activation cannot access to the "Bank Account" screen to add a bank account
    Given user has "bank_account" service in "pending" status
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user has the "Bank Account Activation Info Feedback" module configured in CMS for "Bank Account Activation Info Feedback" page
      And user is in the "Topup" page
     When clicks on the "topup_options.bank_account_entrypoint" entrypoint
     Then the "Bank Account Activation Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "TBD" text is displayed
      And the "info_message" textfield with "TBD" text is displayed
      And the "back_to_payment_settings_button" button with "TBD" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-192954 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @sanity
  Scenario: Prepay user with bank account activated can access to topup with bank account (one-time charge)
    A list of amount options will be displayed (options provided by API). This list will be ordered with the greater
    number first (descendant order).
    Given user has "bank_account" service in "activated" status
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user has the "Choose amount" module configured in CMS for "One-time Quick Charge Choose Amount" page
      And user is in the "Topup" page
     When clicks on the "topup_options.bank_account_entrypoint" entrypoint
     Then the "One-time Quick Charge Choose Amount" page is displayed
      And the "Schnellaufladung" header is displayed
      And the "topup_choose_amount_title" textfield with "Einmalige Schnellaufladung" text is displayed
      And the "topup_choose_amount_description" textfield with "Aufladebetrag auswählen:" text is displayed
      And the "topup_choose_amount_list" list is displayed
      And the elements in the "topup_choose_amount_list" list are ordered by amount descendant
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192955 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192954 @manual @mobile @o2de @smoke
  Scenario: Prepay user with bank account activated can select an amount to topup with bank account (one-time charge)
    Given user has "bank_account" service in "activated" status
      And user has the "Topup Choose amount" module configured in CMS for "One-time Quick Charge Choose Amount" page
      And user has the "Topup Summary" module configured in CMS for "One-time Quick Charge Summary" page
      And user is in the "One-time Quick Charge Choose Amount" page
     When clicks on any element in the "topup_choose_amount_list" list
     Then the "One-time Quick Charge Summary" page is displayed
      And the "Schnellaufladung" header is displayed
      And the "topup_summary.title" textfield with "Deine Bestellung" text is displayed
      And the "topup_summary.mobile_number_label" textfield with "Rufnummer" text is displayed
      And the "topup_summary.mobile_number_value" textfield with the "\d+" format is displayed
      And the "topup_summary.bank_account_label" textfield with "Bankverbindung" text is displayed
      And the "topup_summary.bank_account_value" textfield with the "^[A-Z]{2}[*]+[0-9]{4}$" format is displayed
      And the "topup_summary.topup_amount_label" textfield with "Aufladebetrag" text is displayed
      And the "topup_summary.topup_amount_value" textfield with the "\d+,\d\d €" format is displayed
      And the "topup_summary.topup_amount_value" textfield contains the value selected in "topup_choose_amount_list"
      And the "topup_summary.pay_with_bank_account_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192956 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192955 @manual @mobile @o2de @regression
  Scenario: Prepay user can go to the previous screen from the "One-time Quick Charge Summary" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has "bank_account" service in "activated" status
      And user has the "Topup Summary" module configured in CMS for "One-time Quick Charge Summary" page
      And user is in the "One-time Quick Charge Summary" page
     When clicks on the "top_navigation_bar.back_button" button
     Then the "One-time Quick Charge Choose Amount" page is displayed

  @jira.QANOV-192957 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192955 @manual @mobile @o2de @smoke
  Scenario: Prepay user completes the topup with bank account: topup finished successfully
    NOTE: if the topup with bank account takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has "bank_account" service in "activated" status
      And user has the "Topup Summary" module configured in CMS for "One-time Quick Charge Summary" page
      And user has the "Topup One-time Quick Charge Success Feedback" module configured in CMS for "Topup One-time Quick Charge Success Feedback" page
      And user is in the "One-time Quick Charge Summary" page
     When clicks on the "topup_summary.pay_with_bank_account_button" button
     Then the "Topup One-time Quick Charge Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Guthaben wurde aufgeladen." text is displayed
      And the "success_message" textfield with "Du hast \d+,\d\d € aufgeladen." text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192958 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192957 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "Topup One-time Quick Charge Success Feedback" screen can tap on the "Back to topup" button
    Given user has "bank_account" service in "activated" status
      And user has the "Topup One-time Quick Charge Success Feedback" module configured in CMS for "Topup One-time Quick Charge Success Feedback" page
      And user is in the "Topup One-time Quick Charge Success Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-620355 @android @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-192955 @manual @mobile @o2de @regression
  Scenario: Prepay user completes the topup with bank account but the confirmation takes too long: an informative screen is displayed
    NOTE: Blau RAITT users have a limit of 200€ balance, so if you try to topup above this limit you will receive an error.
    Given user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has the "Topup Summary" module configured in CMS for "One-time Quick Charge Summary" page
      And user has the "Topup One-time Quick Charge Success Feedback" module configured in CMS for "Topup One-time Quick Charge Success Feedback" page
      And user is in the "One Time Quick Charge Choose Amount" page
     When clicks on any element in the "topup_choose_amount.list" list
      And the "One Time Quick Charge Summary" page is displayed
      And clicks on the "pay_button" button
      And the topup with bank account takes too long
     Then the "Topup With Bank Account Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "main_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-620356 @android @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-620355 @manual @mobile @o2de @regression
  Scenario: A prepay user can go back to "Topup" screen from the "Topup With Bank Account Informative Feedback" screen
    Given user has the "Topup With Bank Account Informative Feedback" module configured in CMS for "Topup With Bank Account Informative Feedback" page
      And user is in the "Topup With Bank Account Informative Feedback" page
     When clicks on the "main_button" button
     Then the "Topup" page is displayed

  @jira.QANOV-192960 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192955 @manual @mobile @o2de @regression
  Scenario: Prepay user completes the topup with bank account but an error happens: topup finished unsuccessfully
    Given user has "bank_account" service in "activated" status
      And user has the "Topup Summary" module configured in CMS for "One-time Quick Charge Summary" page
      And user has the "Topup One-time Quick Charge Error Feedback" module configured in CMS for "Topup One-time Quick Charge Error Feedback" page
      And user is in the "One-time Quick Charge Summary" page
     When clicks on the "topup_summary.pay_with_bank_account_button" button
      And there is an error with the topup
     Then the "Topup One-time Quick Charge Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "TBD" text is displayed
      And the "error_message" textfield with "TBD" text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192961 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192960 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "Topup One-time Quick Charge Error Feedback" screen can tap on the "Back to topup" button
    Given user has "bank_account" service in "activated" status
      And user has the "Topup One-time Quick Charge Error Feedback" module configured in CMS for "Topup One-time Quick Charge Error Feedback" page
      And user is in the "Topup One-time Quick Charge Error Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-192963 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192960 @manual @mobile @o2de @regression
  Scenario: A prepay user can go to previous screen from the "Topup One-time Quick Charge Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has "bank_account" service in "activated" status
      And user has the "Topup One-time Quick Charge Error Feedback" module configured in CMS for "Topup One-time Quick Charge Error Feedback" page
      And user is in the "Topup One-time Quick Charge Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "One-time Quick Charge Summary" page is displayed
      And the "Einmalige Schnellaufladung" header is displayed

  @jira.QANOV-192964 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @smoke
  Scenario: Prepay user with bank account activated and "SMS topup" deactivated can access to set up topup with SMS
    Given user has "bank_account" service in "activated" status
      And user has "sms_topup" service in "deactivated" status
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user is in the "Topup" page
     When clicks on the "topup_settings.sms_topup_entrypoint" entrypoint
     Then the "SMS Topup" page is displayed
      And the "Aufladung über SMS" header is displayed
      And the "sms_topup_title" textfield with "Aufladung über SMS" text is displayed
      And the "sms_topup_description" textfield with "Hier kannst du die Einstellungen für die Aufladung per SMS vornehmen. Um die Einstellungen zu speichern, bestätige bitte durch Tippen auf “Jetzt ändern”." text is displayed
      And the "sms_topup_switch_name" textfield with "Aufladung über SMS" text is displayed
      And the "sms_topup_switch" switch is displayed
      And the "sms_topup_switch" switch is disabled
      And the "sms_topup_switch_description" textfield with "Um dein guthaben über SMS aufzuladen, sende eine SMS mit dem Inhalt "Aufladen" an die Kurzwahl "5667"" text is displayed
      And the "sms_topup_amount_title" textfield is not displayed
      And the "sms_topup_amount_selector" selector is not displayed
      And the "sms_topup_save_button" button with "Jeztz ändern" text is displayed
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192965 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @smoke
  Scenario: Prepay user with bank account activated and "SMS topup" activated can access to set up topup with SMS
    The list of amounts displayed in "sms_topup_amount_selector" will be ordered with the greater number on top
    (descendant order).
    Given user has "bank_account" service in "activated" status
      And user has "sms_topup" service in "activated" status
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user is in the "Topup" page
     When clicks on the "topup_settings.sms_topup_entrypoint" entrypoint
     Then the "SMS Topup" page is displayed
      And the "Aufladung über SMS" header is displayed
      And the "sms_topup_title" textfield with "Aufladung über SMS" text is displayed
      And the "sms_topup_description" textfield with "Hier kannst du die Einstellungen für die Aufladung per SMS vornehmen. Um die Einstellungen zu speichern, bestätige bitte durch Tippen auf “Jetzt ändern”." text is displayed
      And the "sms_topup_switch_name" textfield with "Aufladung über SMS" text is displayed
      And the "sms_topup_switch" switch is displayed
      And the "sms_topup_switch" switch is enabled
      And the "sms_topup_switch_description" textfield with "Um dein guthaben über SMS aufzuladen, sende eine SMS mit dem Inhalt "Aufladen" an die Kurzwahl "5667"" text is displayed
      And the "sms_topup_amount_title" textfield with "Aufladebetrag" text is displayed
      And the "sms_topup_amount_selector" selector is displayed
      And the "sms_topup_amount_selector.label" textfield with "Wähle den gewünschten Aufladebetrag" text is displayed
      And the options in"sms_topup_amount_selector" selector are sorted in "descendant" order
      And the "sms_topup_save_button" button with "Jetzt ändern" text is displayed
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192966 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192964 @jira.link.depends_on.QANOV-192965
  @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated cannot save the SMS topup setting without making changes
    Given user has "bank_account" service in "activated" status
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user is in the "SMS Topup" page
     When clicks on the "sms_topup_save_button" button
     Then the "no_changes_warning" warning is displayed
      And the "no_changes_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.QANOV-192967 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192964 @jira.link.depends_on.QANOV-192965
  @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated tries to save the SMS topup setting but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to save the SMS
    topup setting without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "bank_account" service in "activated" status
      And user has tried to save the SMS topup setting "0" times without success
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user is in the "SMS Topup" page
     When clicks on the "sms_topup_switch" switch
      And clicks on the "sms_topup_save_button" button
      And there is an error saving the SMS topup setting
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-192968 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-192967 @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated can close the error warning after trying to save the SMS topup without success
    Given user has "bank_account" service in "activated" status
      And user has tried to save the SMS topup setting "0" times without success
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user is in the "SMS Topup" page
     When clicks on the "sms_topup_switch" switch
      And clicks on the "sms_topup_save_button" button
      And there is an error saving the SMS topup setting
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "SMS Topup" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-192969 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192964 @jira.link.depends_on.QANOV-192965
  @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated tries to save the SMS topup setting but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to save the SMS
    topup setting without success. The second attempt will redirect to a full screen error feedback.
    Given user has "bank_account" service in "activated" status
      And user has tried to save the SMS topup setting "1" times without success
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user has the "SMS Topup Save Error Feedback" module configured in CMS for "SMS Topup Save Error Feedback" page
      And user is in the "SMS Topup" page
     When clicks on the "sms_topup_switch" switch
      And clicks on the "sms_topup_save_button" button
      And there is an error saving the SMS topup setting
     Then the "SMS Topup Save Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Änderungen konnten nicht gespeichert werden." text is displayed
      And the "error_message" textfield with "Deine Daten konnten nicht aktualisiert werden. Bitte versuche es später erneut." text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192970 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192969 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "SMS Topup Save Error Feedback" screen can tap on the "Back to topup" button
    Given user has "bank_account" service in "activated" status
      And user has the "SMS Topup Save Error Feedback" module configured in CMS for "SMS Topup Save Error Feedback" page
      And user is in the "SMS Topup Save Error Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-192972 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192969 @manual @mobile @o2de @regression
  Scenario: A prepay user can go to previous screen from the "SMS Topup Save Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has "bank_account" service in "activated" status
      And user has the "SMS Topup Save Error Feedback" module configured in CMS for "SMS Topup Save Error Feedback" page
      And user is in the "SMS Topup Save Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "SMS Topup" page is displayed
      And the "Einstellungen bearbeiten" header is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @o2de
  Scenario Outline: Prepay user with bank account activated can <user_action> the SMS topup setting successfully
    After clicking in the "sms_topup_save_button", the text of this button will be replaced with "Wird bestätigt" until the
    Success Feedback screen is displayed.
    Given user has "bank_account" service in "activated" status
      And user has "sms_topup" service in "<sms_topup_status>" status
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user has the "SMS Topup Save Success Feedback" module configured in CMS for "SMS Topup Save Success Feedback" page
      And user is in the "SMS Topup" page
     When clicks on the "sms_topup_switch" switch
      And clicks on the "sms_topup_save_button" button
     Then the "SMS Topup Save Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Du hast deine Einstellungen für die Aufladung per SMS geändert." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

    Examples:
          | user_action | sms_topup_status | test_priority | ber | depends_on   | jira_id      |
          | enable      | deactivated      | smoke         | ber | QANOV-192964 | QANOV-192973 |
          | disable     | activated        | regression    |     | QANOV-192965 | QANOV-192974 |

  @jira.QANOV-192975 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192965 @manual @mobile @o2de @smoke
  Scenario: Prepay user with bank account activated can change the amount of the SMS topup setting successfully
    After clicking in the "sms_topup_save_button", the text of this button will be replaced with "Wird bestätigt" until the
    Success Feedback screen is displayed.
    Given user has "bank_account" service in "activated" status
      And user has "sms_topup" service in "activated" status
      And user has the "SMS topup" module configured in CMS for "SMS Topup" page
      And user has the "SMS Topup Save Success Feedback" module configured in CMS for "SMS Topup Save Success Feedback" page
      And user is in the "SMS Topup" page
     When clicks on the "sms_topup_amount_selector" selector
      And clicks on a different amount in the "sms_topup_amount_selector" selector
      And clicks on the "sms_topup_save_button" button
     Then the "SMS Topup Save Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Du hast deine Einstellungen für die Aufladung per SMS geändert." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192976 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192973 @jira.link.depends_on.QANOV-192974
  @jira.link.depends_on.QANOV-192975 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "SMS Topup Save Success Feedback" screen can tap on the "Back to topup" button
    Given user has "bank_account" service in "activated" status
      And user has the "SMS Topup Save Success Feedback" module configured in CMS for "SMS Topup Save Success Feedback" page
      And user is in the "SMS Topup Save Success Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de
  Scenario Outline: Prepay user with bank account activated can access to set up automatic topup when all options are <topup_option_status>
    The options include:
    - Top up automatically when the balance is lower than a certain amount
    - Top up automatically any day of the month
    - bank account charge when insufficient balance
    The automatic top up is always charged to the user's bank account. Therefore, these settings are only
    displayed when the bank account has been set.
    The list of amounts displayed in the amount selectors will be ordered with the greater number on top
    (descendant order). For dates, the 1st day will be displayed on top (ascendant order).
    The content of the selectors is provided by API.
    Given user has "bank_account" service in "activated" status
      And user has "automatic_topup_when_balance_low" service in "<topup_option_status>" status
      And user has "automatic_topup_on_same_date" service in "<topup_option_status>" status
      And user has "pay_with_bank_account_when_insufficient_balance" service in "<topup_option_status>" status
      And user has the "Topup Method" module configured in CMS for "Topup" page
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Topup" page
     When clicks on the "topup_settings.automatic_topup_entrypoint" entrypoint
     Then the "Automatic Topup" page is displayed
      And the "Automatische Aufladung" header is displayed
      And the "automatic_topup_title" textfield with "Automatische Aufladung" text is displayed
      And the "automatic_topup_description" textfield with "Hier kannst du die Einstellungen für die Automatische Aufladung ändern." text is displayed
      And the "balance_low_topup.title" textfield with "Aufladung bei geringem Guthaben" text is displayed
      And the "balance_low_topup.description" textfield with "Wähle aus, bei welchem Betrag dein Guthaben aufgeladen werden soll." text is displayed
      And the "balance_low_topup.check" checkbox is displayed
      And the "balance_low_topup.check" checkbox is <field_status>
      And the "balance_low_topup.minimum_balance_selector" selector is displayed
      And the options in "balance_low_topup.minimum_balance_selector" selector are sorted in "descendant" order
      And the "balance_low_topup.minimum_balance_selector" selector is <field_status>
      And the "balance_low_topup.minimum_balance_selector.label" textfield with "Guthaben geringer als" text is displayed
      And the "balance_low_topup.topup_amount_title" textfield with "Bei erreichen des oben ausgewählten Betrages folgenden Betrag aufladen:" text is displayed
      And the "balance_low_topup.topup_amount_selector" selector is displayed
      And the options in "balance_low_topup.topup_amount_selector" selector are sorted in "descendant" order
      And the "balance_low_topup.topup_amount_selector" selector is <field_status>
      And the "balance_low_topup.topup_amount_selector.label" textfield with "Aufladebetrag" text is displayed
      And the "same_date_topup.title" textfield with "Monatliche Aufladung" text is displayed
      And the "same_date_topup.description" textfield with "Wähle aus, an welchem Tag und Monat dein Guthaben aufgeladen werden soll." text is displayed
      And the "same_date_topup.check" checkbox is displayed
      And the "same_date_topup.check" checkbox is <field_status>
      And the "same_date_topup.frequency_selector" selector is displayed
      And the options in "same_date_topup.frequency_selector" selector are sorted in "ascendant" order
      And the "same_date_topup.frequency_selector" selector is <field_status>
      And the "same_date_topup.frequency_selector.label" textfield with "Aufladung" text is displayed
      And the "same_date_topup.topup_amount_title" textfield with "Aufladebetrag" text is displayed
      And the "same_date_topup.topup_amount_selector" selector is displayed
      And the options in "same_date_topup.topup_amount_selector" selector are sorted in "descendant" order
      And the "same_date_topup.topup_amount_selector" selector is <field_status>
      And the "same_date_topup.topup_amount_selector.label" textfield with "Aufladebetrag" text is displayed
      And the "pay_with_bank_account_when_insufficient_balance.title" textfield with "Optionsgebühren bei nicht ausreichendem Guthaben" text is displayed
      And the "pay_with_bank_account_when_insufficient_balance.description" textfield with "Gebüren für Optionen und Flatrates sollen von meinem Bankkonto abgebucht werden, wenn das Prepaid-Guthaben nicht ausreicht." text is displayed
      And the "pay_with_bank_account_when_insufficient_balance.check" checkbox is displayed
      And the "pay_with_bank_account_when_insufficient_balance.check" checkbox is <field_status>
      And the "automatic_topup_save_button" button with "Jetzt ändern" text is displayed
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed

    Examples:
          | topup_option_status | field_status | test_priority | jira_id      |
          | deactivated         | disabled     | sanity        | QANOV-192977 |
          | activated           | enabled      | regression    | QANOV-192978 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Prepay user with bank account activated taps on the <topup_status> "Topup when balance is low" option: the corresponding configuration options are <configurations_status>
    The automatic top up is an option that allows customers to:
    - Top up automatically when the balance is lower than a certain amount
    - Top up automatically any day of the month
    - bank account charge when insufficient balance
    The automatic top up is always charged to the user's bank account. Therefore, these settings are only
    displayed when the bank account has been set.
    The list of amounts displayed in the amount selectors will be ordered with the greater number on top
    (descendant order). For dates, the 1st day will be displayed on top (ascendant order).
    The content of the selectors is provided by API.
    Given user has "bank_account" service in "activated" status
      And user has "automatic_topup_when_balance_low" service in "<topup_status>" status
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     When clicks on the "balance_low_topup.check" checkbox
     Then the "balance_low_topup.check" checkbox is <configurations_status>
      And the "balance_low_topup.minimum_balance_selector" selector is <configurations_status>
      And the "balance_low_topup.topup_amount_selector" selector is <configurations_status>

    Examples:
          | topup_status | configurations_status | depends_on   | jira_id      |
          | deactivated  | enabled               | QANOV-192977 | QANOV-192979 |
          | activated    | disabled              | QANOV-192978 | QANOV-192980 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Prepay user with bank account activated taps on the <topup_status> "Topup automatically any day of the month" option: the corresponding configuration options are <configurations_status>
    The automatic top up is an option that allows customers to:
    - Top up automatically when the balance is lower than a certain amount
    - Top up automatically any day of the month
    - bank account charge when insufficient balance
    The automatic top up is always charged to the user's bank account. Therefore, these settings are only
    displayed when the bank account has been set.
    The list of amounts displayed in the amount selectors will be ordered with the greater number on top
    (descendant order). For dates, the 1st day will be displayed on top (ascendant order).
    The content of the selectors is provided by API.
    Given user has "bank_account" service in "activated" status
      And user has "automatic_topup_on_same_date" service in "<topup_status>" status
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     When clicks on the "same_date_topup.check" checkbox
     Then the "same_date_topup.check" checkbox is <configurations_status>
      And the "same_date_topup.frequency_selector" selector is <configurations_status>
      And the "same_date_topup.topup_amount_selector" selector is <configurations_status>

    Examples:
          | topup_status | configurations_status | depends_on   | jira_id      |
          | deactivated  | enabled               | QANOV-192977 | QANOV-192981 |
          | activated    | disabled              | QANOV-192978 | QANOV-192982 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: Prepay user with bank account activated completes the <topup_action> of the "Topup when balance is low" option successfully
    The automatic top up is an option that allows customers to:
    - Top up automatically when the balance is lower than a certain amount
    - Top up automatically any day of the month
    - bank account charge when insufficient balance
    The automatic top up is always charged to the user's bank account. Therefore, these settings are only
    displayed when the bank account has been set.
    The list of amounts displayed in the amount selectors will be ordered with the greater number on top
    (descendant order). For dates, the 1st day will be displayed on top (ascendant order).
    The content of the selectors is provided by API.
    Given user has "bank_account" service in "activated" status
      And user has "automatic_topup_when_balance_low" service in "<topup_status>" status
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user has the "Automatic Topup Save Success Feedback" module configured in CMS for "Automatic Topup Save Success Feedback" page
      And user is in the "Automatic Topup" page
     When clicks on the "balance_low_topup.check" checkbox
      And clicks on the "automatic_topup_save_button" button
     Then the "Automatic Topup Save Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Du hast deine Einstellungen für die automatische Aufladung geändert." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert" text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

    Examples:
          | topup_action | topup_status | ber | depends_on   | jira_id      |
          | activaton    | deactivated  | ber | QANOV-192977 | QANOV-192983 |
          | deactivation | activated    |     | QANOV-192978 | QANOV-192984 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: Prepay user with bank account activated completes the <topup_action> of the "Topup automatically any day of the month" option successfully
    The automatic top up is an option that allows customers to:
    - Top up automatically when the balance is lower than a certain amount
    - Top up automatically any day of the month
    - bank account charge when insufficient balance
    The automatic top up is always charged to the user's bank account. Therefore, these settings are only
    displayed when the bank account has been set.
    The list of amounts displayed in the amount selectors will be ordered with the greater number on top
    (descendant order). For dates, the 1st day will be displayed on top (ascendant order).
    The content of the selectors is provided by API.
    Given user has "bank_account" service in "activated" status
      And user has "automatic_topup_on_same_date" service in "<topup_status>" status
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     When clicks on the "same_date_topup.check" checkbox
      And clicks on the "automatic_topup_save_button" button
     Then the "Automatic Topup Save Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Du hast deine Einstellungen für die automatische Aufladung geändert." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert" text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

    Examples:
          | topup_action | topup_status | depends_on   | jira_id      |
          | activaton    | deactivated  | QANOV-192977 | QANOV-192985 |
          | deactivation | activated    | QANOV-192978 | QANOV-192986 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: Prepay user with bank account activated completes the <topup_action> of the "bank account charge when insufficient balance" option successfully
    The automatic top up is an option that allows customers to:
    - Top up automatically when the balance is lower than a certain amount
    - Top up automatically any day of the month
    - bank account charge when insufficient balance
    The automatic top up is always charged to the user's bank account. Therefore, these settings are only
    displayed when the bank account has been set.
    The list of amounts displayed in the amount selectors will be ordered with the greater number on top
    (descendant order). For dates, the 1st day will be displayed on top (ascendant order).
    The content of the selectors is provided by API.
    Given user has "bank_account" service in "activated" status
      And user has "pay_with_bank_account_when_insufficient_balance" service in "<topup_status>" status
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     When clicks on the "pay_with_bank_account_when_insufficient_balance.check" checkbox
      And clicks on the "automatic_topup_save_button" button
     Then the "Automatic Topup Save Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Du hast deine Einstellungen für die automatische Aufladung geändert." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert" text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

    Examples:
          | topup_action | topup_status | depends_on   | jira_id      |
          | activaton    | deactivated  | QANOV-192977 | QANOV-192987 |
          | deactivation | activated    | QANOV-192978 | QANOV-192988 |

  @jira.QANOV-192989 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192983 @jira.link.depends_on.QANOV-192984
  @jira.link.depends_on.QANOV-192985 @jira.link.depends_on.QANOV-192986 @jira.link.depends_on.QANOV-192987
  @jira.link.depends_on.QANOV-192988 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "Automatic Topup Save Success Feedback" screen can tap on the "Back to topup" button
    Given user has "bank_account" service in "activated" status
      And user has the "Automatic Topup Save Success Feedback" module configured in CMS for "Automatic Topup Save Success Feedback" page
      And user is in the "Automatic Topup Save Success Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-192991 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192977
  @jira.link.depends_on.QANOV-192978 @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated tries to save the Automatic topup setting but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to save the Automatic
    topup setting without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "bank_account" service in "activated" status
      And user has tried to save the Automatic topup setting "0" times without success
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     When clicks on the "any" checkbox
      And clicks on the "automatic_topup_save_button" button
      And there is an error saving the Automatic topup setting
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-192992 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-192991 @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated can close the error warning after trying to save the Automatic topup without success
    Given user has "bank_account" service in "activated" status
      And user has tried to save the Automatic topup setting "0" times without success
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user is in the "Automatic Topup" page
     When clicks on the "any" checkbox
      And clicks on the "automatic_topup_save_button" button
      And there is an error saving the Automatic topup setting
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Automatic Topup" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-192993 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192977
  @jira.link.depends_on.QANOV-192978 @manual @mobile @o2de @regression
  Scenario: Prepay user with bank account activated tries to save the Automatic topup setting but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to save the Automatic
    topup setting without success. The second attempt will redirect to a full screen error feedback.
    Given user has "bank_account" service in "activated" status
      And user has tried to save the Automatic topup setting "1" times without success
      And user has the "Automatic topup" module configured in CMS for "Automatic Topup" page
      And user has the "Automatic Topup Save Error Feedback" module configured in CMS for "Automatic Topup Save Error Feedback" page
      And user is in the "Automatic Topup" page
     When clicks on the "any" checkbox
      And clicks on the "automatic_topup_save_button" button
      And there is an error saving the Automatic topup setting
     Then the "Automatic Topup Save Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Änderungen konnten nicht gespeichert werden." text is displayed
      And the "error_message" textfield with "Deine Daten konnten nicht aktualisiert werden. Bitte versuche es später erneut." text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-192994 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192993 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "Automatic Topup Save Error Feedback" screen can tap on the "Back to topup" button
    Given user has "bank_account" service in "activated" status
      And user has the "Automatic Topup Save Error Feedback" module configured in CMS for "Automatic Topup Save Error Feedback" page
      And user is in the "Automatic Topup Save Error Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-192996 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-192993 @manual @mobile @o2de @regression
  Scenario: A prepay user can go to previous screen from the "Automatic Topup Save Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has "bank_account" service in "activated" status
      And user has the "Automatic Topup Save Error Feedback" module configured in CMS for "Automatic Topup Save Error Feedback" page
      And user is in the "Automatic Topup Save Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Automatic Topup" page is displayed
      And the "Automatische Aufladung" header is displayed

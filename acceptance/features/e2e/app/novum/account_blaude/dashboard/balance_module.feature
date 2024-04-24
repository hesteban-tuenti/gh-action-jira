# -*- coding: utf-8 -*-
@jira.QANOV-171435
Feature: Balance module

  Actions Before each Scenario:
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user is in the "Account" page


  @jira.QANOV-171437 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312
  @jira.link.detects.O2DE-1837 @jira.link.detects.OBO2DE-82 @jira.link.parent_test_plan.QANOV-402198 @live @mobile @next
  @raitt_drop1 @sanity @webapp
  Scenario: Prepay user with balance not expired in the general wallet and without promotional wallet can see the balance module in the account dashboard
    If in the general wallet the allowance is active and there is no promotional wallet (or 0€), the general wallet
    balance will be displayed. The Expiration date will be the general wallet expiration.
    qauser: prepay01
    Given user has the balance not expired
      And user does not have promotional wallet
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has the "balance" module configured in CMS for "dashboard" page
     Then the "balance" module is displayed
      And the "balance.title" textfield with "Aktuelles Guthaben" text is displayed
      And the "balance.expiration_date" textfield with the "Gültig bis (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "balance.amount" textfield with the "\d+,\d\d €" format is displayed
      And the "balance.button_primary" button with "Guthaben aufladen" text is displayed

  @jira.QANOV-287274 @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312
  @jira.link.parent_test_plan.QANOV-402198 @mobile @qa @raitt_drop1 @regression @webapp
  Scenario: Prepay user with balance not expired in the general wallet and with a promotional wallet can see the balance module in the account dashboard
    If in the general wallet the allowance is active and there is active promotional wallet, the sum of both
    balances will be displayed. The Expiration date will be the "shorter" one.
    NOTE: the expiration date only exists for BOX7, the balance never expires with RAITT. Then, this scenario only applies
    to BOX7 users.
    qauser: prepay06
    Given user has the balance not expired
      And user has promotional wallet
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has the "balance" module configured in CMS for "dashboard" page
     Then the "balance" module is displayed
      And the "balance.title" textfield with "Aktuelles Guthaben" text is displayed
      And the "balance.expiration_date" textfield with the "Gültig bis (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "balance.amount" textfield with the "\d+,\d\d €" format is displayed
      And the "balance.button_primary" button with "Guthaben aufladen" text is displayed

  @jira.QANOV-171438 @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312
  @jira.link.detects.OBO2DE-82 @jira.link.parent_test_plan.QANOV-402198 @mobile @qa @raitt_drop1 @regression @webapp
  Scenario: Prepay user with balance expired can see the balance module in the account dashboard
    If in the general wallet the allowance is expired and there is no promotional wallet (or 0€), the expired allowance
    will be displayed. The Expiration date will be the general wallet expiration.
    If in the general wallet the allowance is expired, there can't be promotional wallet so we will display the expired
    one. The Expiration date will be the general wallet expiration.
    qauser: prepay04
    Given user has the balance expired
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has the "balance" module configured in CMS for "dashboard" page
     Then the "balance" module is displayed
      And the "balance.tag" textfield with "Aufladung erforderlich" text is displayed
      And the "balance.title" textfield with "Aktuelles Guthaben" text is displayed
      And the "balance.expiration_date" textfield with the "Lief am (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4} ab" format is displayed
      And the "balance.amount" textfield with the "\d+,\d\d €" format is displayed
      And the "balance.button_primary" button with "Guthaben aufladen" text is displayed

  @jira.<jira_id> @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171437
  @jira.link.depends_on.QANOV-171438 @jira.link.detects.<detects> @live @mobile @next @qa @raitt_drop1 @regression @webapp
  Scenario Outline: Prepay user with balance <amount> can see the balance amount in <color> color
    Given user has a "<amount>" balance
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has the "balance" module configured in CMS for "dashboard" page
     Then the "balance.amount" textfield is displayed in "<color>" color

    Examples:
          | amount | color | detects       | jira_id      |
          | 0      | red   | ACCOUNT-19335 | QANOV-171436 |
          | >0     | black |               | QANOV-259999 |

  @jira.QANOV-183128 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312 @live
  @mobile @next @qa @raitt_drop1 @smoke @webapp
  Scenario: Prepay user can see the "latest payments" module in the account dashboard
    Given user has the "simple-action-row" module configured in CMS for "dashboard" page
     Then the "balance_movements" module is displayed
      And the "balance_movements.title" textfield is displayed
      And the "balance_movements.chevron" icon is displayed

  @jira.QANOV-171439 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312 @manual @mobile @raitt_drop2
  @smoke
  Scenario: Prepay user without payments can access to the "Prepay Payments" screen from the account dashboard
    User can see the payments (both with balance and bank account) corresponding to the last 3 months.
    Given user has no movements in the last "3" months
      And user has the "simple-action-row" modules configured in CMS for "dashboard" page
     When clicks on the "balance.prepay_payments_link" link
     Then the "Prepay Payments" page is displayed
      And the "Prepaid-Zahlungen" header is displayed
      And the "payments.events_list" list is not displayed
      And the "payments.empty_case_icon" icon is displayed
      And the "payments.empty_case_title" textfield with "Aktuell liegen keine Aufladungen & Abbuchungen vor" text is displayed
      And the "payments.empty_case_subtitle" textfield with "Es kann einige Minuten dauern, bis deine Änderungen hier angezeigt werden. Bitte schau später nochmal vorbei." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-171440 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312
  @jira.link.detects.LOC-1201 @jira.link.detects.O2DE-2045 @live @mobile @next @raitt_drop2 @sanity
  Scenario: Prepay user with payments can access to the "Prepay Payments" screen from the account dashboard
    User can see the payments (both with balance and bank account) corresponding to the last 3 months.
    Types of transactions to show:
    - Top up
    - Bundle purchases
    - Tariff change
    - Tariff renewal
    - Events out of tariff that generate extra costs (min, data, third party services, SIM swap, MSISDN change, etc. )
    NOTE: not all the movements have a "type" field
    Given user has movements
      And user has any of the "simple-action-row" modules configured in CMS for "dashboard" page
     When clicks on the "balance_movements.chevron" icon
     Then the "Prepay Payments" page is displayed
      And the "Meine Zahlungen" header is displayed
      And the "payments_list" list is displayed
      And each element in the "payments_list" list has the "date" textfield with the "\d{2}.\d{2}.\d{4}" format
      And each element in the "payments_list" list has the "payments_by_date_list" field
      And each element in the "payments_by_date_list" list has the "icon" field
      And each element in the "payments_by_date_list" list has the "name" field
      And each element in the "payments_by_date_list" list has the "time" textfield with the "\d\d:\d\d" format
      And each element in the "payments_by_date_list" list has the "type" field
      And each element in the "payments_by_date_list" list has the "amount" textfield with the "(-)?\d+,\d\d €" format
      And all movements are from the last "3" months in the "payments_list" list
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171440 @jira.link.detects.LOC-1168
  @manual @mobile @raitt_drop2 @regression
  Scenario Outline: Prepay user can see the details of a "<payment_type>" payment in the "Prepay Payments" screen
    NOTE: not all the movements have a "type" field
    Given user has "<payment_type>" movements
      And user has any of the "simple-action-row" modules configured in CMS for "dashboard" page
     When clicks on the "balance_movements" module
      And the "Prepay Payments" page is displayed
     Then the "<payment_type>" element in the "payments_by_date_list" list within the "payments_list" list has the "<payment_type>_icon" field
      And the "<payment_type>" element in the "payments_by_date_list" list within the "payments_list" list has the "name" field
      And the "<payment_type>" element in the "payments_by_date_list" list within the "payments_list" list has the "time" field
      And the "<payment_type>" element in the "payments_by_date_list" list within the "payments_list" list has the "type" textfield with "<element_type_text>" text
      And the "<payment_type>" element in the "payments_by_date_list" list within the "payments_list" list has the "amount" textfield with the "(-)?\d+,\d\d €" format
      And the "<payment_type>" element in the "payments_by_date_list" list within the "payments_list" list has the "amount" textfield with "<amount_color>" color

    Examples:
          | payment_type            | element_type_text | amount_color | jira_id      |
          | top_up                  | Aufladung         | black        | QANOV-171441 |
          | bundle_purchase         | Optionen gebucht  | red          | QANOV-171442 |
          | tariff_change           | Tarifwechsel      | red          | QANOV-171443 |
          | tariff_renewal          | Tarifbuchung      | red          | QANOV-171444 |
          | data_event_with_cost    | Daten             | red          | QANOV-171445 |
          | voice_event_with_cost   | Anruf             | red          | QANOV-171446 |
          | message_event_with_cost | Nachrichten       | red          | QANOV-171447 |
          | third_party_payment     | Drittanbieter     | red          | QANOV-171448 |
          | payment                 | Zahlungen         | red          | QANOV-171449 |

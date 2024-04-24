# -*- coding: utf-8 -*-
@jira.QANOV-44686
Feature: Plan details


  @jira.<jira_id> @android @automatic @ber @ios @jira.cv.14.2 @jira.link.detects.O2DE-1947 @jira.link.detects.O2DE-3089
  @live @mobile @next @o2de @sanity @webapp
  Scenario Outline: A <account_type> user can see the "Tariff Card" module of a mobile line product
    The msisdn of the user is shown prefixed with the trunk code (0) and can have two or more digits. No international
    prefix is displayed (0049).
    A button could be displayed:
    - Postpay mobile: "Change" tariff (if the active tariff hasnot a cancellation requested and has the earliest possible
    extension date in the future), "Extend contract" (if the active tariff hasnot a cancellation requested and has the
    earliest possible extension date in the past), "Change tariff and stay in Blau" (if the active tariff has a cancellation
    requested and has the earliest possible extension date in the future), "Extend contract and stay in Blau" (if the active
    tariff has a cancellation requested and has the earliest possible extension date in the past).
    - Prepay: "Change tariff" (if the tariff is active)
    NOTE: in MeinO2, prepay users only have a tariff that it is free, so a prepay user can never have a tariff in
    pending activation status (the topup button will never be displayed in this module).
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "tariff_card" module is displayed
      And the "tariff_card.module_title" textfield is displayed
      And the "tariff_card.description" textfield with the "0\d{2,}" format is displayed
      And the "tariff_card.link" link with "Details ansehen" text is displayed

    Examples:
          | account_type | jira_id     |
          | prepay       | QANOV-44687 |
          | postpay      | QANOV-44688 |

  @jira.QANOV-44689 @android @automatic @ber @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @live @mobile
  @next @o2de @smoke @webapp
  Scenario: A postpay user can see the "Tariff Card" module of a internet@home product
    No button is displayed to change the tariff, as internet@home products cannot change the tariff.
    The title inside the card will display the plan name.
    The description inside the card will display the installation address.
    If the internet@home product has a landline, the phone number will be displayed under the plan name.
    Given user has a "postpay" account type
      And user has a "internet_at_home" product
      And user has the matching subscription selected in the account
      And user has the "tariff-summary" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "tariff_card" module is displayed
      And the "tariff_card.module_title" textfield with "MEIN TARIF" text is displayed
      And the "tariff_card.title" textfield is displayed
      And the "tariff_card.description" textfield is displayed
      And the "tariff_card.link" button with "Details anzeigen" text is displayed

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44688 @manual @mobile @o2de
  Scenario Outline: A postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can see the "<change_tariff_label>" button in the "Tariff Card" module
    The "change_tariff_button" button can have different texts:
    - Change my tariff: for user who has not requested a contract cancellation and has the earliest possible extension date in the future.
    - Extend contract: for user who has not requested a contract cancellation and has the earliest possible extension date in the past
    - Change tariff and stay in Blau: for user who has requested a contract cancellation and has the earliest possible extension date in the future
    - Extend contract and stay in Blau: for user who has requested a contract cancellation and has the earliest possible extension date in the past
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user <has_hasnot> a contract cancellation requested for a "mobile_line" product
      And user has a "mobile_line" tariff with the earliest possible extension date in the "<time>"
      And user has the matching subscription selected in the account
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "tariff_card.change_tariff_button" button with "<change_tariff_label>" text is displayed
      And the "tariff_card.topup_button" button is not displayed

    Examples:
          | has_hasnot | time   | change_tariff_label            | priority   | jira_id      |
          | has not    | future | Vertrag optimieren             | smoke      | QANOV-203592 |
          | has not    | past   | Extend contract                | regression | QANOV-307994 |
          | has        | future | Change tariff and stay in O2   | regression | QANOV-307995 |
          | has        | past   | Extend contract and stay in O2 | regression | QANOV-307996 |

  @jira.QANOV-307998 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44688
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: A postpay user with a mobile line tariff in "cancelled" status cannot see a button in the "Tariff Card" module
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "tariff_card.change_tariff_button" button is not displayed
      And the "tariff_card.topup_button" button is not displayed

  @jira.QANOV-203596 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44687 @manual @mobile @o2de @regression
  Scenario: A prepay user with a tariff in "active" status cannot see the change tariff button in the "Tariff Card" module
    No "Tarif wechseln" button will be displayed for prepay users.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a changeable tariff
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "tariff_card.change_tariff_button" button is not displayed
      And the "tariff_card.topup_button" button is not displayed

  @jira.QANOV-195743 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44687
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: A prepay user with a tariff in "cancelled" status cannot see the change tariff button in "Tariff Card" module
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "tariff_card.change_tariff_button" button is not displayed
      And the "tariff_card.topup_button" button is not displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44688
  @jira.link.detects.O2DE-1912 @jira.link.detects.O2DE-1948 @jira.link.detects.O2DE-3891 @mobile @o2de
  Scenario Outline: A postpay user with a <status> mobile line product can access to the "My Tariff" screen
    The description rows should not be tappable.
    Other relevant information for the user tariff could be included in the tariff details (provided by API).
    If the user has extra payments or discounts, a "MY PAYMENTS" section will be displayed under  "MY TARIFF DETAILS"
    section.
    If the user has a tariff under the 24 months period, then the "contract end date" and "latest cancellation date" fields
    will be displayed.
    If the user has a tariff under the 24 months period, then the "cancellation notice period" field will have the text
    "1 Monat zum Ende Mindestvertragslaufzeit". If the user has a tariff after the 24 months period, then the "cancellation
    notice period" field will have the text "1 Monat".
    The "change_tariff_button" button can have different texts:
    - Change my tariff: for user who has not requested a contract cancellation and has the earliest possible extension date in the future
    - Extend contract: for user who has not requested a contract cancellation and has the earliest possible extension date in the past
    - Change tariff and stay in Blau: for user who has requested a contract cancellation and has the earliest possible extension date in the future
    - Extend contract and stay in Blau: for user who has requested a contract cancellation and has the earliest possible extension date in the past
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "<status>" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user has the "Tariff Header;Tariff Breakdown;Upgrade Card" modules configured in CMS for "My Tariff" page
      And user is in the "Account" page
     When clicks on the "tariff_card.link" link
     Then the "My Tariff" page is displayed
      And the "Tarifdetails" header is displayed
      And the "tariff_header.tariff_name_label" textfield with "Mein Tarif" text is displayed
      And the "tariff_header.tariff_name_value" textfield is displayed
      And the "tariff_header.monthly_payment_label" textfield with "<monthly_payment_label>" text is displayed
      And the "tariff_header.monthly_payment_value" textfield with the "\d+,\d\d\s€" format is displayed
      And the "tariff_header.change_tariff_button" button is displayed
      And the "tariff_details.title" textfield with "TARIFDETAILS" text is displayed
      And the "tariff_details.available_data_label" textfield with "Verfügbares Datenvolumen" text is displayed
      And the "tariff_details.available_data_value" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "tariff_details.contract_status_label" textfield with "Vertragsstatus" text is displayed
      And the "tariff_details.contract_status_value" textfield with the "ungekündigt" format is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.billing_cycle_end_date_label" textfield with "Rechnungsmonatsende" text is displayed
      And the "tariff_details.billing_cycle_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.notice_period_label" textfield with "Kündigungsfrist" text is displayed
      And the "tariff_details.notice_period_value" textfield with the "1 Monat( zum Ende Mindestvertragslaufzeit)?" format is displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "sim_cards.title" textfield with "DEINE SIM-KARTEN" text is displayed
      And the "sim_cards.list" list is displayed
      And each element in the "sim_cards.list" list has the "sim_card_alias" field
      And each element in the "sim_cards.list" list has the "sim_card_iccid" field
      And each element in the "sim_cards.list" list has the "sim_card_recurrent_price" textfield with the "(Kostenlos|\d+,\d\d\s€)" format
      And each element in the "sim_cards.list" list has the "sim_card_type" textfield with the "(Multicard|Data card)" format
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.current_tariff_price_list_entrypoint" entrypoint with "Preislisten" text is displayed
      And the "price_list.zones_price_list_entrypoint" entrypoint with "Preise im Ausland" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And the "upgrade_card" module is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

    @automatic @live @next @webapp
    Examples:
          | status | monthly_payment_label | test_priority | ber | jira_id     |
          | active | Monatliche Zahlung    | sanity        | ber | QANOV-44691 |

    @manual
    Examples:
          | status             | monthly_payment_label  | test_priority | ber | jira_id      |
          | pending_activation | Aktivierung ausstehend | regression    |     | QANOV-283554 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-44688 @jira.link.parent_test_plan.QANOV-306250
  @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with a <status> mobile line product can access to the "My Tariff" screen
    The description rows should not be tappable.
    Other relevant information for the user tariff could be included in the tariff details (provided by API).
    If the user has extra payments or discounts, a "MY PAYMENTS" section will be displayed under  "MY TARIFF DETAILS"
    section.
    The contract status "gekündigt zum \d{2}.\d{2}.\d{4}" will be displayed for tariffs in this status:
    - cancelled status: status=confirmed in the Contract-Cancellation API
    - cancellation in progress (requested) status: status=requested in the Contract-Cancellation API
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "<status>" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user has the "Tariff Header;Tariff Breakdown;Upgrade Card" modules configured in CMS for "My Tariff" page
      And user is in the "Account" page
     When clicks on the "tariff_card.link" link
     Then the "My Tariff" page is displayed
      And the "Tarifdetails" header is displayed
      And the "tariff_header.tariff_name_label" textfield with "Mein Tarif" text is displayed
      And the "tariff_header.tariff_name_value" textfield is displayed
      And the "tariff_header.change_tariff_button" button is not displayed
      And the "tariff_details.title" textfield with "TARIFDETAILS" text is displayed
      And the "tariff_details.contract_status_label" textfield with "Vertragsstatus" text is displayed
      And the "tariff_details.contract_status_value" textfield with the "gekündigt zum \d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.current_tariff_price_list_entrypoint" entrypoint with "Preislisten" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And the "upgrade_card" module is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | cv   | status                   | jira_id      |
          | 14.2 | cancelled                | QANOV-307999 |
          | 24.1 | cancellation_in_progress | QANOV-553170 |

  @jira.<jira_id> @<ber> @<test_priority> @TBD @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-44689
  @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan> @mobile @o2de
  Scenario Outline: A postpay user with a <status> internet@home product can access to the "My Tariff" screen
    The description rows should not be tappable.
    Other relevant information for the user tariff could be included in the tariff details (provided by API).
    If the user has SIM cards, a "YOUR SIM CARDS" section will be displayed under "MY TARIFF DETAILS"
    section.
    If the user has extra payments or discounts, a "MY PAYMENTS" section will be displayed under "MY TARIFF DETAILS"
    section (if no "YOUR SIM CARDS" section is displayed) or under "YOUR SIM CARDS".
    If the user has SIM cards, a "YOUR SIM CARDS" section will be displayed.
    If the user has a tariff under the 24 months period, then the "contract end date" and "latest cancellation date" fields
    will be displayed.
    If the user has a tariff under the 24 months period, then the "cancellation notice period" field will have the text
    "1 Monat zum Ende Mindestvertragslaufzeit". If the user has a tariff after the 24 months period, then the "cancellation
    notice period" field will have the text "1 Monat".
    Billing cycle end date (Rechungsmonatsende) cannot be provided, so it is removed from the PRD.
    For user with several landlines, all of them will be displayed in the "landline" field.
    Given user has a "postpay" account type
      And user has a "internet_at_home" product in "<status>" status
      And user has the matching subscription selected in the account
      And user has the "tariff-summary" module configured in CMS for "dashboard" page
      And user has the "Tariff Header;Tariff Breakdown;Upgrade Card" modules configured in CMS for "My Tariff" page
      And user is in the "Account" page
     When clicks on the "tariff_card.link" link
     Then the "My Tariff" page is displayed
      And the "Tarifdetails" header is displayed
      And the "tariff_header.tariff_name_label" textfield with "Mein Tarif" text is displayed
      And the "tariff_header.tariff_name_value" textfield is displayed
      And the "tariff_header.monthly_payment_label" textfield with "<monthly_payment_label>" text is displayed
      And the "tariff_header.monthly_payment_value" textfield with the "\d+,\d\d €" format is displayed
      And the "tariff_header.change_tariff_button" button is not displayed
      And the "tariff_details.title" textfield with "TARIFDETAILS" text is displayed
      And the "tariff_details.contract_status_label" textfield with "Vertragsstatus" text is displayed
      And the "tariff_details.contract_status_value" textfield with "ungekündigt" text is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.notice_period_label" textfield with "Kündigungsfrist" text is displayed
      And the "tariff_details.notice_period_value" textfield with the "1 Monat( zum Ende Mindestvertragslaufzeit)?" format is displayed
      And the "tariff_details.installation_address_label" textfield with "Nutzungsadresse" text is displayed
      And the "tariff_details.installation_address_value" textfield is displayed
      And the "tariff_details.landline_label" textfield with "Festnetz(e)" text is displayed
      And the "tariff_details.landline_value" textfield is displayed
      And the "tariff_details.technology_label" textfield with "Technologie" text is displayed
      And the "tariff_details.technology_value" textfield with the "(DSL|Kable|Fiber|HomeSpot|DataSpot)" format is displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And the "upgrade_card" module is not displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

    @automatic @live @next @webapp
    Examples:
          | status             | monthly_payment_label  | test_priority | ber | detects             | parent_test_plan | jira_id      |
          | active             | Monatliche Zahlung     | smoke         | ber | O2DE-2951:O2DE-3056 | QANOV-437471     | QANOV-44695  |

    @manual
    Examples:
          | status             | monthly_payment_label  | test_priority | ber | detects             | parent_test_plan | jira_id      |
          | pending_activation | Aktivierung ausstehend | regression    |     |                     | QANOV-437471     | QANOV-283555 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-44689
  @jira.link.parent_test_plan.QANOV-306250 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with a <status> internet@home product can access to the "My Tariff" screen
    The description rows should not be tappable.
    Other relevant information for the user tariff could be included in the tariff details (provided by API).
    If the user has SIM cards, a "YOUR SIM CARDS" section will be displayed under "MY TARIFF DETAILS"
    section.
    If the user has extra payments or discounts, a "MY PAYMENTS" section will be displayed under "MY TARIFF DETAILS"
    section (if no "YOUR SIM CARDS" section is displayed) or under "YOUR SIM CARDS".
    If the user has SIM cards, a "YOUR SIM CARDS" section will be displayed.
    If the user has a tariff under the 24 months period, then the "contract end date" and "latest cancellation date" fields
    will be displayed.
    If the user has a tariff under the 24 months period, then the "cancellation notice period" field will have the text
    "1 Monat zum Ende Mindestvertragslaufzeit". If the user has a tariff after the 24 months period, then the "cancellation
    notice period" field will have the text "1 Monat".
    The contract status "gekündigt zum \d{2}.\d{2}.\d{4}" will be displayed for tariffs in this status:
    - cancelled status: status=confirmed in the Contract-Cancellation API
    - cancellation in progress (requested) status: status=requested in the Contract-Cancellation API
    Given user has a "postpay" account type
      And user has a "internet_at_home" product in "<status>" status
      And user has the matching subscription selected in the account
      And user has the "tariff-summary" module configured in CMS for "dashboard" page
      And user has the "Tariff Header;Tariff Breakdown;Upgrade Card" modules configured in CMS for "My Tariff" page
      And user is in the "Account" page
     When clicks on the "tariff_card.link" link
     Then the "My Tariff" page is displayed
      And the "Tarifdetails" header is displayed
      And the "tariff_header.tariff_name_label" textfield with "Mein Tarif" text is displayed
      And the "tariff_header.tariff_name_value" textfield is displayed
      And the "tariff_header.monthly_payment_label" textfield with "Monatliche Zahlung" text is displayed
      And the "tariff_header.monthly_payment_value" textfield with the "\d+,\d\d\ €" format is displayed
      And the "tariff_header.change_tariff_button" button is not displayed
      And the "tariff_header.status" textfield with "Gekündigt" text is displayed
      And the "tariff_details.title" textfield with "TARIFDETAILS" text is displayed
      And the "tariff_details.contract_status_label" textfield with "Vertragsstatus" text is displayed
      And the "tariff_details.contract_status_value" textfield with "gekündigt zum \d{2}.\d{2}.\d{4}" text is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And the "upgrade_card" module is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | cv    | status                   | jira_id      |
          | 14.11 | cancelled                | QANOV-308000 |
          | 24.1  | cancellation_in_progress | QANOV-553173 |

  @jira.QANOV-400698 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-44691
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff under the 24 months period can see additional fields in the My Tariff screen
    To detect subscription in the first 24 months period: for a contract that is NOT cancelled, if the "Spätester Kündigungstermin"
    field is in the future we are within the minimum contractual term (first 24 months period). If the "Spätester Kündigungstermin"
    field = Today it is a contract in monthly autorenewal mode.
    User: 017623416656 / #brt12345678
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has a tariff under the 24 months period
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_details.contract_end_date_label" textfield with "Ende Mindestvertragslaufzeit" text is displayed
      And the "tariff_details.contract_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.latest_cancel_date_label" textfield with "Spätester Kündigungstermin" text is displayed
      And the "tariff_details.latest_cancel_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.notice_period_label" textfield with "Kündingungfrist" text is displayed
      And the "tariff_details.notice_period_value" textfield with "1 Monat zum Ende Mindestvertragslaufzeit" text is displayed

  @jira.QANOV-400699 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-44691
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff after the 24 months period (taiff renewed each month) cannot see some fields in the My Tariff screen
    To detect subscription in the first 24 months period: for a contract that is NOT cancelled, if the "Spätester Kündigungstermin"
    field is in the future we are within the minimum contractual term (first 24 months period). If the "Spätester Kündigungstermin"
    field = Today it is a contract in monthly autorenewal mode.
    User: 015781806551 / #brt1234
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has a tariff after the 24 months period
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_details.contract_end_date_label" textfield is not displayed
      And the "tariff_details.contract_end_date_value" textfield is not displayed
      And the "tariff_details.latest_cancel_date_label" textfield is not displayed
      And the "tariff_details.latest_cancel_date_value" textfield is not displayed
      And the "tariff_details.notice_period_label" textfield with "Kündingungfrist" text is displayed
      And the "tariff_details.notice_period_value" textfield with "1 Monat" text is displayed

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44691 @manual @mobile @o2de
  Scenario Outline: A postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can see the "<change_tariff_label>" button in the "My Tariff" screen
    The "change_tariff_button" button can have different texts:
    - Change my tariff: for user who has not requested a contract cancellation and has the earliest possible extension date in the future
    - Extend contract: for user who has not requested a contract cancellation and has the earliest possible extension date in the past
    - Change tariff and stay in Blau: for user who has requested a contract cancellation and has the earliest possible extension date in the future
    - Extend contract and stay in Blau: for user who has requested a contract cancellation and has the earliest possible extension date in the past
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user <has_hasnot> a contract cancellation requested for a "mobile_line" product
      And user has a "mobile_line" tariff with the earliest possible extension date in the "<time>"
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.change_tariff_button" button with "<change_tariff_label>" text is displayed

    Examples:
          | has_hasnot | time   | change_tariff_label            | priority   | jira_id      |
          | has not    | future | Vertrag optimieren             | smoke      | QANOV-203597 |
          | has not    | past   | Extend contract                | regression | QANOV-44701  |
          | has        | future | Change tariff and stay in O2   | regression | QANOV-44703  |
          | has        | past   | Extend contract and stay in O2 | regression | QANOV-260058 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44691 @manual @mobile @o2de
  Scenario Outline: A postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can see the Upgrade module in the "My Tariff" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user <has_hasnot> a contract cancellation requested for a "mobile_line" product
      And user has a "mobile_line" tariff with the earliest possible extension date in the "<time>"
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "upgrade_card" module is displayed
      And the "upgrade_card.title" textfield with "<title>" text is displayed
      And the "upgrade_card.description" textfield with "<description>" text is displayed
      And the "upgrade_card.button" button with "<button>" text is displayed

    Examples:
          | has_hasnot | time   | title                   | description                                                              | button              | priority   | jira_id      |
          | has not    | future | Explore other tariffs   | You needs have changed? Discover other possible tariffs                  | Vertrag optimieren  | smoke      | QANOV-260059 |
          | has not    | past   | Renew your contract     | You can now extend your contract with the same conditions you have today | Extend contract     | regression | QANOV-260060 |
          | has        | future | Explore other tariffs   | Before you leave, why not explore some of the new tarrifs                | Change & stay in O2 | regression | QANOV-260061 |
          | has        | past   | Renew with a new tariff | You can stay in O2 and choose a new tariff for your product              | Extend & change     | regression | QANOV-260062 |

  @jira.QANOV-203766 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44691 @manual @mobile @o2de @regression
  Scenario: A postpay user with a mobile line product can upgrade the tariff clicking the upgrade card of "My Tariff" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product not in "cancelled" status
      And user has the matching subscription selected in the account
      And user has the "Upgrade Card" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "upgrade_card.button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Tariff" page is displayed

  @jira.QANOV-195745 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44687 @live @mobile @next
  @o2de @sanity @webapp
  Scenario: A prepay user can access to the "My Tariff" screen from the "Tariff Card" module of the Account dashboard
    The description rows should not be tappable.
    Other relevant information for the user tariff could be included in the tariff details (provided by API).
    Optional fields:
    - "Change tariff" button in the header: only if the user has an active tariff that can be changeable --> for
    MeinO2 launch, no "Tarif wechseln" button will be displayed for prepay users.
    - "Monthly payment" info in the header: only if the user has a paid monthly tariff
    - "Pending to activate" reminder in the header: only if the user tariff is in grace period
    - "Top up to activate" button in the header: only if user tariff is in grace period
    If the user has extra payments or discounts, a "MY PAYMENTS" section will be displayed under  "MY TARIFF DETAILS"
    section.
    Given user has a "prepay" account type
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user has the "Tariff Header;Tariff Breakdown" modules configured in CMS for "My Tariff" page
      And user is in the "Account" page
     When clicks on the "tariff_card.link" link
     Then the "My Tariff" page is displayed
      And the "Tarifdetails" header is displayed
      And the "tariff_header.tariff_name_label" textfield with "Mein Tarif" text is displayed
      And the "tariff_header.tariff_name_value" textfield is displayed
      And the "tariff_details.title" textfield with "TARIFDETAILS" text is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.current_tariff_price_list_entrypoint" entrypoint with "Preislisten" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-195746 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195745 @manual @mobile @o2de @smoke
  Scenario: A prepay user with a tariff in "active" status cannot see the "Change tariff" button in "My Tariff" screen
    No "Tarif wechseln" button will be displayed for prepay users.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a changeable tariff
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.change_tariff_button" button is not displayed

  @jira.QANOV-195748 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195745 @manual @mobile @o2de @regression
  Scenario: A prepay user with a paid monthly tariff in active status can see the "Monthly payment" amount in "My Tariff" screen
    There are some prepay users who cannot change the tariff by some business rules (for these users, the product-offers
    API will not return any offer with category.id='tariff'). These users will not see the 'offered_tariffs_list' list.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "paid monthly" tariff
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.monthly_payment_label" textfield with "Monatliche Zahlung" text is displayed
      And the "tariff_header.monthly_payment_value" textfield with the "\d+,\d\d €" format is displayed

  @jira.QANOV-195747 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195745
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: A prepay user with a tariff in "cancelled" status cannot see the "Change tariff" button in "My Tariff" screen
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.change_tariff_button" button is not displayed

  @jira.QANOV-452265 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-283555 @jira.link.depends_on.QANOV-308000
  @jira.link.depends_on.QANOV-44695 @manual @mobile @o2de @regression
  Scenario: A dsl/cable/fiber user cannot see the "Your SIM cards" section in the "My Tariff" screen
    Given user has any "dsl;cable;fiber" product
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "sim_cards.title" textfield is not displayed
      And the "sim_cards.list" list is not displayed

  @jira.QANOV-452266 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-283555 @jira.link.depends_on.QANOV-308000
  @jira.link.depends_on.QANOV-44695 @manual @mobile @o2de @regression
  Scenario: A HomeSpot/DataSpot user can see the "Your SIM cards" section in the "My Tariff" screen
    Given user has any "home_spot;data_spot" product
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "sim_cards.title" textfield with "DEINE SIM-KARTEN" text is displayed
      And the "sim_cards.list" list is displayed
      And each element in the "sim_cards.list" list has the "sim_card_alias" field
      And each element in the "sim_cards.list" list has the "sim_card_iccid" field
      And each element in the "sim_cards.list" list has the "sim_card_recurrent_price" textfield with the "(Kostenlos|\d+,\d\d\s€)" format
      And each element in the "sim_cards.list" list has the "sim_card_type" textfield with the "(Multicard|Data card)" format

  @jira.QANOV-272256 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195745 @jira.link.depends_on.QANOV-44691
  @jira.link.depends_on.QANOV-44695 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A user without extra payments neither discounts cannot see the "My Payments" section in the "My Tariff" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has any "mobile_line;internet_at_home" tariff with "0" extra payments
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "payments.title" textfield is not displayed
      And the "payments.list" list is not displayed

  @jira.QANOV-272257 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44691 @jira.link.depends_on.QANOV-44695
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A user with extra payments or/and discounts can see the "My Payments" section in the "My Tariff" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has any "mobile_line;internet_at_home" tariff with ">0" extra payments
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "payments.title" textfield with "MONATLICHE ZAHLUNGEN" text is displayed
      And the "payments.list" list is displayed
      And each element in the "payments.list" list has the "product_name" field
      And each element in the "payments.list" list has the "price_description" field
      And each element in the "payments.list" list has the "amount" textfield with the "\d+,\d\d €" format

  @jira.QANOV-272258 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44691 @jira.link.depends_on.QANOV-44695
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A user with discounts can see a Discount tag and description in the "My Payments" section
    Given user has any "mobile_line;internet_at_home" product
      And user has any "mobile_line;internet_at_home" tariff with discounts
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then any element in the "payments.list" list has the "discount_tag" textfield with the "Rabatt" text
      And the "discounts_description" textfield with "*Die hier ausgewiesenen Rabatte werden auf Ihrer Rechnung mit den oben angegebenen Kosten verrechnet." text is displayed

  @jira.QANOV-203601 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195745 @jira.link.depends_on.QANOV-44691
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user with mobile line or internet@home product can open the "Tariffs Archive" webview from "My Tariff" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "price_list.tariff_archive_entrypoint" entrypoint
     Then the internal webview is displayed
      And the header that contains the "o2 Tarifarchiv" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed

  @jira.<jira_id> @android @jira.cv.14.2 @jira.link.depends_on.QANOV-195745 @jira.link.depends_on.QANOV-44691
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: A user with mobile line or internet@home product can open the "<document>" document from "My Tariff" screen for android devices
    Given user has any "mobile_line;internet_at_home" product
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "<entrypoint>" entrypoint
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

    Examples:
          | document         | entrypoint                                      | jira_id      |
          | Product Info     | tariff_details.product_info_entrypoint          | QANOV-195753 |
          | My Tariff Prices | price_list.current_tariff_price_list_entrypoint | QANOV-203600 |

  @jira.<jira_id> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195745 @jira.link.depends_on.QANOV-44691
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: A user with mobile line or internet@home product can open the "<document>" document from "My Tariff" screen for iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "<entrypoint>" entrypoint
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | document         | entrypoint                                      | jira_id      |
          | Product Info     | tariff_details.product_info_entrypoint          | QANOV-311494 |
          | My Tariff Prices | price_list.current_tariff_price_list_entrypoint | QANOV-311495 |

  @jira.QANOV-203768 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44691 @jira.link.detects.O2DE-2700 @manual
  @mobile @o2de @sanity
  Scenario: A postpay user can access to the "Zone price list select country" screen from the "My Tariff" screen
    This flow will allow the user to see the roaming prices associated to his/her tariff.
    The user can see a list of countries provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "My Tariff" page
     When clicks on the "price_list.zones_price_list_entrypoint" entrypoint
     Then the "Zone Price List Select Country" page is displayed
      And the "Preise im Ausland" header is displayed
      And the "title" textfield with "Land wählen" text is displayed
      And the "message" textfield with "Wähle aus der Liste das Land, aus dem du die Nutzung vornehmen möchtest:" text is displayed
      And the "country_search_inputtext" inputtext is displayed
      And the "country_search_placeholder" placeholder with "Land eingeben" text is displayed
      And the "country_search_icon" icon is displayed
      And the "countries.title" textfield with "LÄNDERLISTE" text is displayed
      And the "countries.list" list is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-203769 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203768 @manual @mobile @o2de @regression
  Scenario: A postpay user can search a country using just some characters
    All country options are provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "Zone Price List Select Country" page
     When fills the "country_search_inputtext" inputtext with the "Ar" text
     Then the "countries.list" list is displayed
      And each element in the "countries.list" list has the "name" textfield with the ".*Ar.*" format
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-203770 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203768 @manual @mobile @o2de @regression
  Scenario: A postpay user can search a country using the full name
    All country options are provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "Zone Price List Select Country" page
     When fills the "country_search_inputtext" inputtext with the "Argentinien" text
     Then the "countries.list" list is displayed
      And the "countries.list" list has "1" elements
      And the "0" index in the "countries.list" list has the "country_name" field with "Argentinien" text
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-259087 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203768 @manual @mobile @o2de @regression
  Scenario: A postpay user can remove the country inserted in the search field
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "Zone Price List Select Country" page
     When fills the "country_search_inputtext" inputtext with the "Argentinien" text
      And clicks on the "country_search_clear_icon" icon
     Then the "country_search_inputtext" inputtext is empty
      And the "country_search_clear_icon" icon is not displayed
      And the "countries.list" list is displayed
      And the "countries.list" list has ">1" elements
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-259088 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203768 @manual @mobile @o2de @regression
  Scenario: A postpay user cannot access to the "Zone price list country details" screen without selecting a country
    All country options are provided by API.
    All information regarding the roaming prices are provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "Zone Price List Select Country" page
     When clicks on the "continue_button" button
     Then the "country_search_error" textfield with "Land wählen, um fortzufahren." text is displayed

  @jira.QANOV-203771 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203769
  @jira.link.depends_on.QANOV-203770 @live @mobile @next @o2de @smoke @webapp
  Scenario: A postpay user with an active tariff can access to the "Zone price list country details" screen after selecting a country
    All country options are provided by API.
    The name of the tab is provided by API.
    All information regarding the roaming prices are provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Account" page
     When clicks on the "tariff_card.link" link
      And the "My Tariff" page is displayed
      And clicks on the "price_list.zones_price_list_entrypoint" entrypoint
      And the "Zone Price List Select Country" page is displayed
      And fills the "country_search_inputtext" inputtext with the "Ar" text
      And clicks on any element in the "countries.list" list
      And clicks on the "continue_button" button
     Then the "Zone Price List Country Details" page is displayed
      And the "Preise im Ausland" header is displayed
      And the "title" textfield with "DEIN GEWÄHLTES LAND" text is displayed
      And the "selected_country" module is displayed
      And the "selected_country.name" textfield is displayed
      And the "selected_country.zone" textfield is displayed
      And the "selected_country.chevron" icon is displayed
      And the "conditions.tab" tab is displayed
      And the "conditions.message" textfield with "Nachfolgende Konditionen gelten in dem ausgewählten Land und von dort nach Deutschland." text is displayed
      And the "conditions.list" list is displayed
      And each element in the "conditions.list" list has the "check_icon" field
      And each element in the "conditions.list" list has the "detail" field
      And the "manage_my_packs_entrypoint" entrypoint with "Optionen verwalten" text is displayed
      And the "footer_message" textfield with "Wir wünschen dir eine gute Reise. Weitere Preisinformationen entnimmst du bitte der Preisliste. Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed

  @jira.QANOV-604897 @android @automatic @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203771 @live @mobile @next @o2de
  @regression
  Scenario: A postpay user with an active tariff can access to the account dashboard from the "Zone price list country details" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Zone Price List Country Details" page
     When clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-203772 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203771 @manual @mobile @o2de @regression
  Scenario: A postpay user can go back to the "Zone Price List Select Country" screen from the "Zone price list country details" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Zone Price List Country Details" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Zone Price List Select Country" page is displayed
      And the "Preise im Ausland" header is displayed

  @jira.QANOV-203773 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203771 @manual @mobile @o2de @regression
  Scenario: A postpay user can select another country from the "Zone price list country details" screen
    All country options are provided by API.
    The name of the tab is provided by API.
    All information regarding the roaming prices are provided by the API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Zone Price List Country Details" page
     When clicks on the "selected_country.chevron" icon
      And the "Zone Price List Select Country" page is displayed

  @jira.QANOV-267376 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203771 @jira.link.depends_on.QANOV-203773
  @manual @mobile @o2de @regression
  Scenario: A postpay user who selected a country with two different details zones can see the details divided by zones in the "Zone price list country details" screen
    All information regarding the roaming prices are provided by the API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And there is a country with two different details zones
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Zone Price List Select Country" page
     When fills the "country_search_inputtext" inputtext with the "[CONTEXT:country_with_two_zones]" text
      And clicks on any element in the "countries.list" list
      And clicks on the "continue_button" button
      And the "Zone Price List Country Details" page is displayed
     Then the "conditions.details" textfield is displayed
      And the "conditions.details.subtitle_zone1" textfield that contains the "Konditionen in Weltzone" text is displayed
      And the "conditions.details.description_zone1" textfield is displayed
      And the "conditions.details.subtitle_zone2" textfield that contains the "Konditionen in Weltzone" text is displayed
      And the "conditions.details.description_zone2" textfield is displayed

  @jira.QANOV-259089 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203771 @jira.link.depends_on.QANOV-203773
  @manual @mobile @o2de @regression
  Scenario: A postpay user can access to the "Bundle Management" screen from the "Zone price list country details" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Zone Price List Country Details" page
     When clicks on the "manage_my_packs_entrypoint" entrypoint
     Then the "Bundle Management" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Zone Price List Country Details" page is displayed

  @jira.QANOV-308001 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203769 @jira.link.depends_on.QANOV-203770
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: A postpay user with a cancelled tariff can access to the "Zone price list country details" screen after selecting a country
    All country options are provided by API.
    The name of the tab is provided by API.
    All information regarding the roaming prices are provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user has the "Zone Price List Country Details" module configured in CMS for "Zone Price List Country Details" page
      And user is in the "Zone Price List Select Country" page
     When fills the "country_search_inputtext" inputtext with the "Ar" text
      And clicks on any element in the "countries.list" list
      And clicks on the "continue_button" button
     Then the "Zone Price List Country Details" page is displayed
      And the "Preise im Ausland" header is displayed
      And the "title" textfield with "IHR GEWÄHLTES LAND" text is displayed
      And the "selected_country" module is displayed
      And the "selected_country.name" textfield is displayed
      And the "selected_country.zone" textfield is displayed
      And the "selected_country.chevron" icon is displayed
      And the "conditions.tab" tab is displayed
      And the "conditions.message" textfield with "Nachfolgende Konditionen gelten in dem ausgewählten Land und von dort nach Deutschland." text is displayed
      And the "conditions.details" textfield is displayed
      And the "manage_my_packs_entrypoint" entrypoint is not displayed
      And the "footer_message" textfield with "Wir wünschen Ihnen eine gute Reise. Weitere Preisinformationen entnehmen Sie bitte der Preisliste. Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-189953
Feature: Plan details


  @jira.<jira_id> @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.LOC-1191
  @jira.link.detects.O2DE-1947 @jira.link.detects.O2DE-3039 @jira.link.detects.OBO2DE-196 @jira.link.detects.OBO2DE-81
  @live @mobile @next @raitt_drop1 @sanity @webapp
  Scenario Outline: A <account_type> user can see the "Tariff Card" module of a mobile line product
    The msisdn of the user is shown prefixed with the trunk code (0) and can have two or more digits. No international
    prefix is displayed (0049).
    A button could be displayed:
    - Postpay mobile: "Change" tariff (if the active tariff hasnot a cancellation requested and has the earliest possible
    extension date in the future), "Extend contract" (if the active tariff hasnot a cancellation requested and has the
    earliest possible extension date in the past), "Change tariff and stay in Blau" (if the active tariff has a cancellation
    requested and has the earliest possible extension date in the future), "Extend contract and stay in Blau" (if the active
    tariff has a cancellation requested and has the earliest possible extension date in the past).
    - Prepay: "Change tariff" (if the tariff is active), "Topup" (if the tariff is in pending activation status)
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
          | account_type | jira_id      |
          | prepay       | QANOV-203574 |
          | postpay      | QANOV-203575 |

  @jira.<jira_id> @<priority> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203575
  @jira.link.detects.O2DE-2031 @mobile @webapp
  Scenario Outline: A postpay user who <has_hasnot> requested a cancellation for his/her mobile line tariff and has the earliest possible extension date in the <time> can see the "<change_tariff_label>" button in the "Tariff Card" module
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
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "tariff_card.button_primary" button with "<change_tariff_label>" text is displayed

    @automatic @qa @raitt_drop1
    Examples:
          | has_hasnot | time   | change_tariff_label | priority | jira_id      |
          | has not    | future | Vertrag optimieren  | smoke    | QANOV-203577 |

    @manual
    Examples:
          | has_hasnot | time   | change_tariff_label              | priority   | jira_id      |
          | has not    | past   | Extend contract                  | regression | QANOV-307975 |
          | has        | future | Change tariff and stay in Blau   | regression | QANOV-307976 |
          | has        | past   | Extend contract and stay in Blau | regression | QANOV-307977 |

  @jira.QANOV-189954 @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203574 @live @mobile @next
  @raitt_drop1 @smoke @webapp
  Scenario: A prepay user with a tariff in "active" status can see the change tariff button in the "Tariff Card" module
    There are some prepay users who cannot change the tariff by some business rules (for these users, the product-offers
    API will not return any offer with category.id='tariff'). These users will not see the 'offered_tariffs_list' list.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a changeable tariff
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "tariff_card.button_primary" button with "Tarif wechseln" text is displayed

  @jira.QANOV-189956 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203574 @manual @mobile @raitt_drop1
  @smoke
  Scenario: A prepay user with a tariff in "pending activation" status (grace period) can see the topup button in "Tariff Card" module
    The msisdn of the user is shown prefixed with the trunk code (0) and can have two or more digits
    - The "change_tariff_button" button is not displayed
    - The "topup_button" button is displayed
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "pending_activation" status
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "tariff_card.button_primary" button is not displayed

  @jira.QANOV-189963 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189956 @manual @mobile @raitt_drop1
  @regression
  Scenario: A prepay user with a tariff in grace period can access to the "Topup" screen from "Account" screen
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "pending_activation" status
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" button
     Then the "Topup" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario Outline: A <account_type> user with a mobile line tariff in "cancelled" status cannot see the change tariff button in "Tariff Card" module
    Given user has a "<account_type>" account type
      And user has any "mobile_line" product in "cancelled" status
      And user has the "agreement-details" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "tariff_card.button_primary" button is not displayed

    @raitt_drop1
    Examples:
          | account_type | depends_on   | jira_id      |
          | prepay       | QANOV-203574 | QANOV-189955 |

    Examples:
          | account_type | depends_on   | jira_id      |
          | postpay      | QANOV-203575 | QANOV-307978 |

  @jira.<jira_id> @<ber> @<execution_mode> @<test_priority> @android @blaude @cert3 @ios @jira.cv.13.9
  @jira.link.depends_on.QANOV-203575 @jira.link.detects.O2DE-1811 @jira.link.detects.O2DE-1835
  @jira.link.detects.O2DE-1836 @jira.link.detects.O2DE-1912 @jira.link.detects.O2DE-1948 @jira.link.detects.OBO2DE-119
  @jira.link.detects.OBO2DE-128 @jira.link.detects.OBO2DE-194 @live @mobile @next
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
      And the "tariff_details.contract_status_value" textfield with "ungekündigt" text is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.billing_cycle_end_date_label" textfield with "Rechnungsmonatsende" text is displayed
      And the "tariff_details.billing_cycle_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.notice_period_label" textfield with "Kündigungsfrist" text is displayed
      And the "tariff_details.notice_period_value" textfield with the "1 Monat( zum Ende Mindestvertragslaufzeit)?" format is displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.current_tariff_price_list_entrypoint" entrypoint with "Preislisten" text is displayed
      And the "price_list.zones_price_list_entrypoint" entrypoint with "Preise im Ausland" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And the "upgrade_card" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    @raitt_drop1
    Examples:
          | status | monthly_payment_label | test_priority | execution_mode | ber | jira_id      |
          | active | Monatliche Zahlung    | sanity        | automatic      | ber | QANOV-203579 |

    Examples:
          | status             | monthly_payment_label  | test_priority | execution_mode | ber | jira_id      |
          | pending_activation | Aktivierung ausstehend | regression    | manual         |     | QANOV-283441 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-203575 @jira.link.detects.OBO2DE-713
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
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
      And the "tariff_header.monthly_payment_label" textfield with "Monatliche Zahlung" text is displayed
      And the "tariff_header.monthly_payment_value" textfield with the "\d+,\d\d\s€" format is displayed
      And the "tariff_header.change_tariff_button" button is not displayed
      And the "tariff_details.title" textfield with "TARIFDETAILS" text is displayed
      And the "tariff_details.available_data_label" textfield with "Verfügbares Datenvolumen" text is displayed
      And the "tariff_details.available_data_value" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "tariff_details.contract_status_label" textfield with "Vertragsstatus" text is displayed
      And the "tariff_details.contract_status_value" textfield with the "gekündigt zum \d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "tariff_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.contract_end_date_label" textfield is not displayed
      And the "tariff_details.contract_end_date_value" textfield is not displayed
      And the "tariff_details.billing_cycle_end_date_label" textfield with "Rechungsmonatsende" text is displayed
      And the "tariff_details.billing_cycle_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "tariff_details.latest_cancel_date_label" textfield is not displayed
      And the "tariff_details.latest_cancel_date_value" textfield is not displayed
      And the "tariff_details.product_info_entrypoint" entrypoint with "Widerrufserklärung" text is displayed
      And the "price_list.title" textfield with "PREISLISTE" text is displayed
      And the "price_list.current_tariff_price_list_entrypoint" entrypoint with "Preislisten" text is displayed
      And the "price_list.zones_price_list_entrypoint" entrypoint with "Preise im Ausland" text is displayed
      And the "price_list.tariff_archive_entrypoint" entrypoint with "Tarifarchiv" text is displayed
      And the "upgrade_card" module is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | cv   | status                   | jira_id      |
          | 14.1 | cancelled                | QANOV-307979 |
          | 24.1 | cancellation_in_progress | QANOV-553082 |

  @jira.QANOV-400696 @android @blaude @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-203579 @manual @mobile @raitt_drop1
  @regression
  Scenario: A postpay user with a tariff under the 24 months period can see additional fields in the My Tariff screen
    To detect subscription in the first 24 months period: for a contract that is NOT cancelled, if the "Spätester Kündigungstermin"
    field is in the future we are within the minimum contractual term (first 24 months period). If the "Spätester Kündigungstermin"
    field = Today it is a contract in monthly autorenewal mode.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
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

  @jira.QANOV-400697 @android @blaude @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-203579 @manual @mobile @regression
  Scenario: A postpay user with a tariff after the 24 months period (taiff renewed each month) cannot see some fields in the My Tariff screen
    To detect subscription in the first 24 months period: for a contract that is NOT cancelled, if the "Spätester Kündigungstermin"
    field is in the future we are within the minimum contractual term (first 24 months period). If the "Spätester Kündigungstermin"
    field = Today it is a contract in monthly autorenewal mode.
    User: 015783485624 / bigmaria
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
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

  @jira.<jira_id> @<priority> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203579
  @jira.link.detects.OBO2DE-128 @manual @mobile
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
          | has_hasnot | time   | change_tariff_label              | priority   | jira_id      |
          | has not    | future | Vertrag optimieren               | smoke      | QANOV-203581 |
          | has not    | past   | Extend contract                  | regression | QANOV-203582 |
          | has        | future | Change tariff and stay in Blau   | regression | QANOV-203583 |
          | has        | past   | Extend contract and stay in Blau | regression | QANOV-260052 |

  @jira.<jira_id> @<priority> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203579
  @jira.link.detects.O2DE-1836 @manual @mobile
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
          | has_hasnot | time   | title                   | description                                                              | button                | priority   | jira_id      |
          | has not    | future | Explore other tariffs   | You needs have changed? Discover other possible tariffs                  | Vertrag optimieren    | smoke      | QANOV-260053 |
          | has not    | past   | Renew your contract     | You can now extend your contract with the same conditions you have today | Extend contract       | regression | QANOV-260054 |
          | has        | future | Explore other tariffs   | Before you leave, why not explore some of the new tarrifs                | Change & stay in Blau | regression | QANOV-260055 |
          | has        | past   | Renew with a new tariff | You can stay in Blau and choose a new tariff for your product            | Extend & change       | regression | QANOV-260056 |

  @jira.QANOV-203783 @TBD @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203579 @manual @mobile @smoke
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

  @jira.QANOV-189957 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203574
  @jira.link.detects.OBO2DE-119 @jira.link.detects.OBO2DE-194 @live @mobile @next @raitt_drop1 @sanity
  Scenario: A prepay user can access to the "My Tariff" screen from the "Tariff Card" module of the Account dashboard
    The description rows should not be tappable.
    Other relevant dates for the user tariff could be included in the tariff details (provided by API).
    Optional fields:
    - "Change tariff" button in the header: only if the user has an active tariff that can be changeable
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
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-420453 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-189957
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @regression
  Scenario: A RAITT prepay user can see the the tariff end cycle date in "My Tariff" screen if available
    Given user has a "prepay" account type
      And user has a "raitt" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff with the end cycle date available
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_details.tariff_cycle_end_date_label" textfield with "Tariff cycle end date" text is displayed
      And the "tariff_details.tariff_cycle_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed

  @jira.QANOV-189958 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189957 @jira.link.detects.O2DE-2325
  @jira.link.detects.OBO2DE-128 @manual @mobile @raitt_drop1 @smoke
  Scenario: A prepay user with a tariff in "active" status can see the change tariff button in "My Tariff" screen
    There are some prepay users who cannot change the tariff by some business rules (for these users, the product-offers
    API will not return any offer with category.id='tariff'). These users will not see the 'offered_tariffs_list' list.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a changeable tariff
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.change_tariff_button" button with "Tarif wechseln" text is displayed

  @jira.QANOV-189960 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189957 @manual @mobile @raitt_drop1
  @regression
  Scenario: A prepay user with a paid monthly tariff in active status can see the "Monthly payment" amount in "My Tariff" screen
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "paid monthly" tariff
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.monthly_payment_label" textfield with "Monatliche Zahlung" text is displayed
      And the "tariff_header.monthly_payment_value" textfield with the "\d+,\d\d €" format is displayed

  @jira.QANOV-189961 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189957 @manual @mobile @raitt_drop1
  @regression
  Scenario: A prepay user with a tariff in grace period can see "Pending to activate" warning and the "Top up" button in "My Tariff" screen
    - "Change tariff" button is not displayed
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "pending_activation" status
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.activation_pending_label" textfield with "Aktivierung ausstehend" text is displayed
      And the "tariff_header.activation_pending_value" textfield with the "\d+,\d\d €" format is displayed
      And the "tariff_header.topup_button" button with "Zum Aktivieren aufladen" text is displayed
      And the "tariff_header.change_tariff_button" button is not displayed

  @jira.QANOV-189962 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189957 @manual @mobile @raitt_drop1
  @smoke
  Scenario: A prepay user with a tariff in grace period can access to the "Topup" screen from "My Tariff" screen
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "pending_activation" status
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "tariff_header.topup_button" button
     Then the "Topup" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed

  @jira.QANOV-189959 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-189957
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @raitt_drop1 @regression
  Scenario: A prepay user with a tariff in "cancelled" status cannot see the change tariff button in "My Tariff" screen
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "tariff_header.change_tariff_button" button is not displayed

  @jira.QANOV-272253 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203579 @manual @mobile @regression
  Scenario: A user without extra payments neither discounts cannot see the "My Payments" section in the "My Tariff" screen
    Given user has a "mobile_line" product
      And user has a "mobile_line" tariff with "0" extra payments
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "payments.title" textfield is not displayed
      And the "payments.list" list is not displayed

  @jira.QANOV-272254 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203579 @jira.link.detects.OBO2DE-194
  @manual @mobile @raitt_drop1 @smoke
  Scenario: A user with extra payments or/and discounts can see the "My Payments" section in the "My Tariff" screen
    Given user has a "mobile_line" product
      And user has a "mobile_line" tariff with ">0" extra payments
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then the "payments.title" textfield with "MONATLICHE ZAHLUNGEN" text is displayed
      And the "payments.list" list is displayed
      And each element in the "payments.list" list has the "product_name" field
      And each element in the "payments.list" list has the "price_description" field
      And each element in the "payments.list" list has the "amount" textfield with the "\d+,\d\d €" format

  @jira.QANOV-272255 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203579 @jira.link.detects.OBO2DE-194
  @manual @mobile @raitt_drop1 @regression
  Scenario: A user with discounts can see a Discount tag and description in the "My Payments" section
    Given user has a "mobile_line" product
      And user has a "mobile_line" tariff with discounts
      And user has the matching subscription selected in the account
      And user has the "Tariff Header" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     Then any element in the "payments.list" list has the "discount_tag" textfield with the "Rabatt" text
      And the "discounts_description" textfield with "*Die hier ausgewiesenen Rabatte werden auf deiner Rechnung mit den oben angegebenen Kosten verrechnet." text is displayed

  @jira.QANOV-189966 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189957
  @jira.link.depends_on.QANOV-203579 @manual @mobile @raitt_drop1 @smoke
  Scenario: A user with mobile line product can open the "Tariffs Archive" webview from "My Tariff" screen
    Given user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Tariff Breakdown" module configured in CMS for "My Tariff" page
      And user is in the "My Tariff" page
     When clicks on the "price_list.tariff_archive_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Archivierte Produktinformationsblätter auf einen Blick" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed

  @jira.<jira_id> @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-189957 @jira.link.depends_on.QANOV-203579
  @manual @mobile @raitt_drop1 @smoke
  Scenario Outline: A user with mobile line product can open the "<document>" document from "My Tariff" screen for android devices
    Given user has a "mobile_line" product
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
          | Product Info     | tariff_details.product_info_entrypoint          | QANOV-189964 |
          | My Tariff Prices | price_list.current_tariff_price_list_entrypoint | QANOV-189965 |

  @jira.<jira_id> @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189957 @jira.link.depends_on.QANOV-203579 @manual
  @mobile @raitt_drop1 @smoke
  Scenario Outline: A user with mobile line product can open the "<document>" document from "My Tariff" screen for iOS devices
    Given user has a "mobile_line" product
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
          | Product Info     | tariff_details.product_info_entrypoint          | QANOV-470519 |
          | My Tariff Prices | price_list.current_tariff_price_list_entrypoint | QANOV-311492 |

  @jira.QANOV-203785 @android @automatic @blaude @cert3 @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203579 @live
  @mobile @next @raitt_drop3 @sanity
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

  @jira.QANOV-203786 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203785 @jira.link.detects.O2DE-2162
  @manual @mobile @regression
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

  @jira.QANOV-203787 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203785 @manual @mobile @regression
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

  @jira.QANOV-259084 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203785 @manual @mobile @regression
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

  @jira.QANOV-259085 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203785 @jira.link.detects.O2DE-2188
  @manual @mobile @regression
  Scenario: A postpay user cannot access to the "Zone price list country details" screen without selecting a country
    All country options are provided by API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "Zone Price List Select Country" page
     When clicks on the "continue_button" button
     Then the "country_search_error" textfield with "Land wählen, um fortzufahren." text is displayed

  @jira.QANOV-203788 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203786
  @jira.link.depends_on.QANOV-203787 @jira.link.detects.O2DE-2185 @jira.link.detects.O2DE-2249 @live @mobile @next
  @raitt_drop3 @smoke
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
      And user is in the "My Tariff" page
      And user is in the "Zone Price List Select Country" page
     When fills the "country_search_inputtext" inputtext with the "Ar" text
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
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Tariff" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-203789 @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203788 @manual @mobile @regression
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

  @jira.QANOV-203790 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203788 @jira.link.detects.O2DE-2185
  @manual @mobile @regression
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

  @jira.QANOV-267375 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203788
  @jira.link.depends_on.QANOV-203790 @jira.link.detects.O2DE-2248 @manual @mobile @regression
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

  @jira.QANOV-259086 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-203788
  @jira.link.depends_on.QANOV-203790 @jira.link.detects.O2DE-2186 @manual @mobile @regression
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

  @jira.QANOV-307980 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-203786
  @jira.link.depends_on.QANOV-203787 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
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

# -*- coding: utf-8 -*-
@jira.QANOV-257425
Feature: Header module

  Actions Before each Scenario:
    Given user has the "header-cards-cms" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @android @automatic @blaude @ios @jira.cv.14.0 @live @mobile @next @qa @smoke
  Scenario Outline: A user who is in the Start tab can see a welcome message according to the hour
    Given device time is between "<time_min>" and "<time_max>" hours
     When terminates the app
      And launches the app
      And initiate the app
      And user is in the "Start" page
     Then the header that contains the "<message>" text is displayed
      And the header contains the user first name

    Examples:
          | time_min | time_max | message      | ber | jira_id      |
          | 6:00     | 12:59    | Guten Morgen | ber | QANOV-257426 |
          | 13:00    | 20:59    | Guten Tag    |     | QANOV-257427 |
          | 21:00    | 5:59     | Guten Abend  |     | QANOV-257428 |

  @jira.QANOV-257433 @android @blaude @ios @jira.cv.14.0 @manual @mobile @raitt_drop3 @smoke
  Scenario: A postpay user with an available invoice for a mobile line will see the "available invoice" card in the header of the start tab
    The card will disappear after 10 days after the billing cycle started.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-257434 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257433 @manual @mobile @regression
  Scenario: A postpay user with a mobile line has been 10 days without tapping on the "See invoice" button of the "invoice available" card: the "invoice available" card will disappear from the start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the last invoice available
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When the user is "10" days without tapping on the "see_bill" button from the "invoice_available" card
     Then the "header.title" textfield does not contains the "[LANG:start.header.bill_available.bill_available_root]" text

  @jira.QANOV-257435 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257433 @jira.link.detects.OBO2DE-447
  @manual @mobile @regression
  Scenario: A postpay user with an available invoice for a mobile line taps on the header card button: the Bill details screen will be displayed
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bills" page is displayed

  @jira.QANOV-257436 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257435 @manual @mobile @regression
  Scenario: A postpay user with a mobile line who returns after tapping on See invoice button will see the "invoice available" card for 5 more days
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Bills" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header.title" textfield does not contains the "[LANG:start.header.bill_available.bill_available_root]" text
      And the "header.title" textfield with the "Remember to check the detail of your last invoice issued \d+ days ago" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-257437 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257435 @manual @mobile @regression
  Scenario: A postpay user with a mobile line who tapped on "See invoice" button won't see the "invoice available" card after 5 days
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the last invoice available
      And user accessed to the "invoice_available" card "<5" days ago
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When "5" days have passed since user accessed to the "invoice_available" card
     Then the "header.title" textfield does not contains the "Remember to check the detail of your last invoice issued" text

  @jira.QANOV-257438 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A postpay user with a mobile line will see a new "available invoice" card in the header of the start tab when a new billing cycle starts
    The "invoice available" card will appear again when the new invoice for this cycle is generated.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When a new billing cycle starts
     Then the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-257439 @android @blaude @ios @jira.cv.14.0 @manual @mobile @raitt_drop3 @regression
  Scenario: A postpay user without bank account can see the bank account card in the start tab header
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have bank account
      And user has the "direct-debit-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.bank_account.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bank_account.button]" text is displayed

  @jira.QANOV-257440 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257439 @manual @mobile @regression
  Scenario: A postpay user without bank account can access to activate the bank account from the start tab header
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have bank account
      And user has the "direct-debit-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bank Account Edition" page is displayed

  @jira.QANOV-257441 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257439 @manual @mobile @regression
  Scenario: A postpay user who activates the bank account won't see the "bank account" card from the start tab header
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have bank account
      And user has the "direct-debit-header" start tab header configured in CMS
     When activates the bank account
      And user is in the "Start" page
     Then the "header.title" textfield does not contains the "[LANG:start.header.bank_account.title]" text

  @jira.QANOV-257445 @android @blaude @ios @jira.cv.14.0 @jira.link.detects.LOC-1052 @manual @mobile @raitt_drop3
  @regression
  Scenario: A user with only one product can see the "consumption" card when has consumed >= 80% of data allowance
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed ">=80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.data_consumption.high_data_consumption_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-257446 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257445 @manual @mobile @regression
  Scenario: A user with only one product can access to "Data Bundles" screen from start tab header when has consumed >= 80% of data allowance
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed ">=80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-257447 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user with several products can see the "consumption" card when has consumed >= 80% of data allowance for one product
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed ">=80%" of the data
      And user has just one product which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für \d+ ist bereits zu über 80% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-257448 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257447 @jira.link.detects.OBO2DE-450
  @manual @mobile @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed >= 80% of data allowance for one product
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed ">=80%" of the data
      And user has just one product which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed for the product with consumption ">=80%" of data allowance
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-257449 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user with several products can see the "consumption" card when has consumed >= 80% of data allowance for several products
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed ">=80%" of the data
      And user has several products which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für mehrere Verträge ist bereits zu über 80% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-257450 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257449 @manual @mobile @regression
  Scenario: A user with several products can access to Select Product screen from start tab header when has consumed >= 80% of data allowance for several products
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed ">=80%" of the data
      And user has several products which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Select Product" page is displayed

  @jira.QANOV-257451 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257450 @manual @mobile @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed >= 80% of data allowance for several products
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed ">=80%" of the data
      And user has several products which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Select Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Category Bundles" page is displayed for the selected product
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-257452 @android @blaude @ios @jira.cv.14.0 @jira.link.detects.LOC-1053 @manual @mobile @raitt_drop3
  @regression
  Scenario: A user with just one product can see the "consumption" card when has consumed the 100% of data allowance
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed "100%" of the "data" allowance in the "any" product
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-257453 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257452 @manual @mobile @regression
  Scenario: A user with just one product can access to "Data Bundles" screen from start tab header when has consumed the 100% of data allowance
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed "100%" of the "data" allowance in the "any" product
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-257454 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user with several products can see the "consumption" card has consumed the 100% of data allowance for one product
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für \d+ ist zu 100% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-257455 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257454 @manual @mobile @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed the 100% of data allowance for one product
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed for the product with consumption "100%" of data allowance
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-257456 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user with several products can see the "consumption" card when has consumed the 100% of data allowance for several products
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für mehrere Verträge ist zu 100% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-257457 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257456 @manual @mobile @regression
  Scenario: A user with several products can access to Select Product screen from start tab header when has consumed the 100% of data allowance for several products
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Select Product" page is displayed

  @jira.QANOV-257458 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257457 @jira.link.detects.OBO2DE-451
  @manual @mobile @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed the 100% of data allowance for several products
    other_affected_versions="2023-34"
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Select Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Category Bundles" page is displayed for the selected product
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-257459 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A monoproduct postpay user whose contract is about to expire will see the "extend contract" card in the header of the start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.contract_expiration.single_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.contract_expiration.button]" text is displayed

  @jira.QANOV-367785 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A multiproduct postpay user whose contract is about to expire will see the "extend contract" card in the header of the start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.contract_expiration.multiple_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.contract_expiration.button]" text is displayed

  @jira.QANOV-257460 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257459 @jira.link.detects.OBO2DE-452
  @manual @mobile @regression
  Scenario: A postpay user whose contract is about to expire can access to extend the contract from the start tab header
    The card will be displayed until the user renews or cancel the contract.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Verlängerungsangebote" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257459 @manual @mobile @regression
  Scenario Outline: A postpay user whose contract is about to expire won't see the "extend contract" header card after the contract is <action>
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When the contract is <action>
     Then the "header.title" textfield does not contains the "[LANG:start.header.contract_expiration.root]" text

    Examples:
          | action    | jira_id      |
          | renewed   | QANOV-257461 |
          | cancelled | QANOV-257462 |

  @jira.QANOV-257463 @android @blaude @ios @jira.cv.14.2 @manual @mobile @raitt_drop3 @smoke
  Scenario: A postpay user with only a MyHandy product and the next rate in less than 3 days will see the "next rate" card in the header of the start tab
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "1" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.payment_issued.single_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.payment_issued.button]" text is displayed

  @jira.QANOV-257464 @android @blaude @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-257463 @manual @mobile @regression
  Scenario: A postpay user with only a MyHandy product and the next rate in less than 3 days can access to the "My Handy Details" screen from the start tab header
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "1" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "My Handy Details" page is displayed

  @jira.QANOV-324654 @android @blaude @ios @jira.cv.14.2 @manual @mobile @regression
  Scenario: A postpay user with several MyHandy products and the next rate in less than 3 days will see the "next rate" card in the header of the start tab
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "several" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.payment_issued.multiple_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.payment_issued.button]" text is displayed

  @jira.QANOV-324656 @android @blaude @ios @jira.cv.14.2 @manual @mobile @regression
  Scenario: A postpay user with several MyHandy products and the next rate in less than 3 days can access to the "My Handy Details" screen from the start tab header
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "several" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "My Handy Details" page is displayed for the corresponding product

  @jira.QANOV-257465 @android @blaude @ios @jira.cv.14.0 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user with a tariff in grace period will see the "tariff in pending activation" card in the header of the start tab
    Given user has a "prepay" account type
      And user has a "any" tariff in "pending_activation" status
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.tariff_pending_activation.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.tariff_pending_activation.button]" text is displayed

  @jira.QANOV-257466 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257465 @manual @mobile @regression
  Scenario: A prepay user with a tariff in grace period can access to Topup screen from the start tab header
    Given user has a "prepay" account type
      And user has a "any" tariff in "pending_activation" status
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A prepay user with <num_bundles> bundles in grace period will see the "bundle in pending activation" card in the header of the start tab
    Given user has a "prepay" account type
      And user has "<num_bundles>" bundles in "pending_activation" status
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "<title>" text is displayed
      And the "header.button" textfield with "[LANG:start.header.bundle_pending_activation.button]" text is displayed

    @raitt_drop3
    Examples:
          | num_bundles | title                                                      | jira_id      |
          | 1           | [LANG:start.header.bundle_pending_activation.single_title] | QANOV-257467 |

    Examples:
          | num_bundles | title                                                        | jira_id      |
          | several     | [LANG:start.header.bundle_pending_activation.multiple_title] | QANOV-257468 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with <num_bundles> bundles in grace period can access to Topup screen from the start tab header
    Given user has a "prepay" account type
      And user has "<num_bundles>" bundles in "pending_activation" status
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

    Examples:
          | num_bundles | depends_on   | jira_id      |
          | 1           | QANOV-257467 | QANOV-257469 |
          | several     | QANOV-257468 | QANOV-257470 |

  @jira.QANOV-452272 @android @blaude @ios @jira.cv.14.9 @manual @mobile @regression
  Scenario: A BOX7 prepay user with balance near expiration will see the "balance almost expired" card in the header of the start tab
    This header will disappear when the balance is expired or when a new topup is done.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has the balance with expiration in "<=60" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_almost_expired.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_almost_expired.button]" text is displayed

  @jira.QANOV-452274 @android @blaude @ios @jira.cv.14.9 @jira.link.depends_on.QANOV-452272 @manual @mobile @regression
  Scenario: A BOX7 prepay user with balance near expiration can access to Topup screen from the start tab header
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has the balance with expiration in "<=60" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-257471 @android @blaude @ios @jira.cv.14.0 @jira.link.detects.OBO2DE-459 @manual @mobile @raitt_drop3
  @regression
  Scenario: A BOX7 prepay user with balance expired will see the "balance expired" card in the header of the start tab
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has the balance expired
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_expired.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_expired.button]" text is displayed

  @jira.QANOV-257472 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257471 @manual @mobile @regression
  Scenario: A BOX7 prepay user with balance expired can access to Topup screen from the start tab header
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has the balance expired
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-324657 @android @blaude @ios @jira.cv.14.2 @manual @mobile @raitt_drop3 @smoke
  Scenario: A prepay user without balance will see the "no balance" card in the header of the start tab
    This card is no dismissible. It will disappear when the balance is 0€.
    Given user has a "prepay" account type
      And user has a "0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_zero.single_title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_zero.button]" text is displayed

  @jira.QANOV-324658 @android @blaude @ios @jira.cv.14.2 @manual @mobile @smoke
  Scenario: A prepay user without balance can access to Topup screen from the start tab header
    This card is no dismissible. It will disappear when the balance is 0€.
    Given user has a "prepay" account type
      And user has a "0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-392765 @android @blaude @ios @jira.cv.14.8 @manual @mobile @raitt_drop3 @smoke
  Scenario: A prepay user with low balance will see the "low balance" card in the header of the start tab
    It is considered low balance when the balance "< 5" €.
    Given user has a "prepay" account type
      And user has a "<5" balance
      And user has a ">0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_low.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_low.button]" text is displayed

  @jira.QANOV-392766 @android @blaude @ios @jira.cv.14.8 @manual @mobile @smoke
  Scenario: A prepay user with low balance can access to Topup screen from the start tab header
    It is considered low balance when the balance "< 5" €.
    Given user has a "prepay" account type
      And user has a "<5" balance
      And user has a ">0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-285217 @android @blaude @ios @jira.cv.14.1 @jira.link.detects.OBO2DE-719
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @raitt_drop3 @regression
  Scenario: A monoline user with a cancelled contract will see the "cancelled contract" card in the header of the start tab
    Given user has a "mobile_line" product in "cancelled" status
      And user has "1" mobile lines
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.cancelled_contract.single_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.cancelled_contract.button]" text is displayed

  @jira.QANOV-342577 @android @blaude @ios @jira.cv.14.1 @jira.link.detects.OBO2DE-719
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario: A multiline user with a cancelled contract will see the "cancelled contract" card in the header of the start tab
    Given user has a "mobile_line" product in "cancelled" status
      And user has "several" mobile lines
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.cancelled_contract.multiple_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.cancelled_contract.button]" text is displayed

  @jira.QANOV-285218 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-285217
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario: A monoline user with a cancelled contract can access to "Get new contract" screen from the start tab header
    Given user has a "mobile_line" product in "cancelled" status
      And user has "1" mobile lines
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Mobilfunkanbieter: So günstig geht mobil | Blau entdecken" header is displayed

  @jira.QANOV-342578 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-342577
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
  Scenario: A multiline user with a cancelled contract can access to "Get new contract" screen from the start tab header
    Given user has a "mobile_line" product in "cancelled" status
      And user has "several" mobile lines
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Mobilfunkanbieter: So günstig geht mobil | Blau entdecken" header is displayed

  @jira.QANOV-452275 @android @blaude @ios @jira.cv.14.10 @manual @mobile @regression
  Scenario: A postpay user with any overdue invoice will see the "overdue invoice" card in the header of the start tab
    There will be only one header no matter if there are one or more invoices to pay.
    The card will disappear when the user doesn't have an overdue invoice.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a month with "overdue" bill
      And user has the "late-invoices" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.overdue.bill_overdue_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.bill_overdue_button]" text is displayed

  @jira.QANOV-452276 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-452275 @manual @mobile @regression
  Scenario: A postpay user with any overdue invoice can access to the Bills screen
    There will be only one header no matter if there are one or more invoices to pay.
    The card will disappear when the user doesn't have an overdue invoice.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a month with "overdue" bill
      And user has the "late-invoices" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bills" page is displayed

  @jira.QANOV-595153 @android @blaude @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile
  @smoke
  Scenario: A postpay user with with a bill higher than last month will see the "high bill" card in the header of the start tab if the high bill flag is active
    The card will be displayed if the bill is at least 1€ higher than the previous month.
    The card will disappear after 15 days.
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.high_bill.high_bill_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.high_bill.high_bill_button]" text is displayed

  @jira.QANOV-595154 @android @blaude @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-595153
  @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @regression
  Scenario: A postpay user with with a bill higher than last month taps on the header card button: the OB webview will be displayed
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Mehrkosten" header is displayed

  @jira.QANOV-600347 @android @blaude @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile
  @regression
  Scenario: A postpay user with with a bill higher than last month cannot see the "high bill" card in the header of the start tab if the high bill flag is deactivated
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has a bill higher than last month
      And the high bill flag is inactive in the explore personalization api
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.high_bill.high_bill_text]" format is not displayed
      And the "header.button" textfield with "[LANG:start.header.high_bill.high_bill_button]" text is not displayed

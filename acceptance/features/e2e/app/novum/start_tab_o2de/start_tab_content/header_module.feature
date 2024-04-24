# -*- coding: utf-8 -*-
@jira.QANOV-312455
Feature: Header module

  Actions Before each Scenario:
    Given user has the "header-cards-cms" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @smoke
  Scenario Outline: A user who is in the Start tab can see a welcome message according to the hour
    Given user is in the "Start" page
      And device time is between "<time_min>" and "<time_max>" hours
     Then the header that contains the "<message>" text is displayed
      And the header contains the user first name

    Examples:
          | time_min | time_max | message      | ber | parent_test_plan | jira_id      |
          | 6:00     | 12:59    | Guten Morgen | ber | QANOV-437471     | QANOV-312456 |
          | 13:00    | 20:59    | Guten Tag    |     |                  | QANOV-312457 |
          | 21:00    | 5:59     | Guten Abend  |     |                  | QANOV-312458 |

  @jira.QANOV-312463 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user with an available invoice for a mobile line or internet@home will see the "available invoice" card in the header of the start tab
    The card will disappear after 10 days after the billing cycle started.
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-312464 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312463
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with a mobile line or internet@home has been 10 days without tapping on the "See invoice" button of the "invoice available" card: the "invoice available" card will disappear from the start tab
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has the last invoice available
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When the user is "10" days without tapping on the "see_bill" button from the "invoice_available" card
     Then the "header.title" textfield does not contains the "[LANG:start.header.bill_available.bill_available_root]" text

  @jira.QANOV-312465 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312463
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with an available invoice for a mobile line or internet@home taps on the header card button: the Bill details screen will be displayed
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bills" page is displayed

  @jira.QANOV-312466 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312463
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with a mobile line or internet@home who returns after tapping on See invoice button will see the "invoice available" card for 5 more days
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
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

  @jira.QANOV-312467 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312463
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with a mobile line or internet@home who tapped on "See invoice" button won't see the "invoice available" card after 5 days
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has the last invoice available
      And user accessed to the "invoice_available" card "<5" days ago
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When "5" days have passed since user accessed to the "invoice_available" card
     Then the "header.title" textfield does not contains the "Remember to check the detail of your last invoice issued" text

  @jira.QANOV-312468 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A postpay user with a mobile line or internet@home will see a new "available invoice" card in the header of the start tab when a new billing cycle starts
    The "invoice available" card will appear again when the new invoice for this cycle is generated.
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When a new billing cycle starts
     Then the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-312469 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A postpay user without bank account can see the "direct debit" card in the start tab header
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have bank account
      And user has the "direct-debit-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.bank_account.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bank_account.button]" text is displayed

  @jira.QANOV-312470 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312469 @manual @mobile @o2de @regression
  Scenario: A postpay user without bank account can access to activate the direct debit from the start tab header
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have bank account
      And user has the "direct-debit-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bank Account Edition" page is displayed

  @jira.QANOV-312471 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312469 @manual @mobile @o2de @regression
  Scenario: A postpay user who activates the bank account won't see the "bank account" card from the start tab header
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user does not have bank account
      And user has the "direct-debit-header" start tab header configured in CMS
     When activates the direct debit
      And user is in the "Start" page
     Then the "header.title" textfield does not contains the "[LANG:start.header.bank_account.title]" text

  @jira.QANOV-312475 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with only one product can see the "consumption" card when has consumed >= 80% of data allowance
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed ">=80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.data_consumption.high_data_consumption_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-312476 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312475 @manual @mobile @o2de @regression
  Scenario: A user with only one product can access to "Data Bundles" screen from start tab header when has consumed >= 80% of data allowance
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed ">=80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-312477 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with several products can see the "consumption" card when has consumed >= 80% of data allowance for one product
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed ">=80%" of the data
      And user has just one product which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für \d+ ist bereits zu über 80% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-312479 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312477 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed >= 80% of data allowance for one product
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed ">=80%" of the data
      And user has just one product which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed for the product with consumption ">=80%" of data allowance
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-312480 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with several products can see the "consumption" card when has consumed >= 80% of data allowance for several products
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed ">=80%" of the data
      And user has several products which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für mehrere Verträge ist bereits zu über 80% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-312481 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312480 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to Select Product screen from start tab header when has consumed >= 80% of data allowance for several products
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed ">=80%" of the data
      And user has several products which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Select Product" page is displayed

  @jira.QANOV-312482 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312481 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed >= 80% of data allowance for several products
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

  @jira.QANOV-312483 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with just one product can see the "consumption" card when has consumed the 100% of data allowance
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed "100%" of the "data" allowance in the "any" product
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-312484 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312483 @manual @mobile @o2de @regression
  Scenario: A user with just one product can access to "Data Bundles" screen from start tab header when has consumed the 100% of data allowance
    Given user has a "mobile_line" product
      And user has "1" products
      And user has consumed "100%" of the "data" allowance in the "any" product
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-312485 @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with several products can see the "consumption" card has consumed the 100% of data allowance for one product
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für \d+ ist zu 100% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-312487 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312485 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed the 100% of data allowance for one product
    Given user has a "mobile_line" product
      And user has "several" products
      And user has just one product which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Category Bundles" page is displayed for the product with consumption "100%" of data allowance
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-312488 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user with several products can see the "consumption" card when has consumed the 100% of data allowance for several products
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "dein inklusives Datenvolumen für mehrere Verträge ist zu 100% aufgebraucht." format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-312489 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312488 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to Select Product screen from start tab header when has consumed the 100% of data allowance for several products
    Given user has a "mobile_line" product
      And user has "several" products
      And user has several products which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Select Product" page is displayed

  @jira.QANOV-312490 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312489 @manual @mobile @o2de @regression
  Scenario: A user with several products can access to "Data Bundles" screen from start tab header when has consumed the 100% of data allowance for several products
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

  @jira.QANOV-312491 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A monoproduct postpay user whose contract is about to expire will see the "extend contract" card in the header of the start tab
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has "1" products
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.contract_expiration.single_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.contract_expiration.button]" text is displayed

  @jira.QANOV-367786 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A multiproduct postpay user whose contract is about to expire will see the "extend contract" card in the header of the start tab
    Given user has a "postpay" account type
      And user has "several" mobile lines or internet_at_home products
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.contract_expiration.multiple_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.contract_expiration.button]" text is displayed

  @jira.QANOV-312492 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312491
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user whose contract is about to expire can access to extend the contract from the start tab header
    The card will be displayed until the user renews or cancel the contract.
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Verlängerungsangebote" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312491
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user whose contract is about to expire won't see the "extend contract" header card after the contract is <action>
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has a contract with expiry date "<=3months"
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When the contract is <action>
     Then the "header.title" textfield does not contains the "[LANG:start.header.contract_expiration.root]" text

    Examples:
          | action    | jira_id      |
          | renewed   | QANOV-312493 |
          | cancelled | QANOV-312494 |

  @jira.QANOV-312495 @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A postpay user with only a MyHandy product and the next rate in less than 3 days will see the "next rate" card in the header of the start tab
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "1" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.payment_issued.single_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.payment_issued.button]" text is displayed

  @jira.QANOV-312496 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312495 @manual @mobile @o2de @regression
  Scenario: A postpay user with only a MyHandy product and the next rate in less than 3 days can access to the "My Handy Details" screen from the start tab header
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "1" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "My Handy Details" page is displayed

  @jira.QANOV-324667 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A postpay user with several MyHandy products and the next rate in less than 3 days will see the "next rate" card in the header of the start tab
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "several" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.payment_issued.multiple_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.payment_issued.button]" text is displayed

  @jira.QANOV-324668 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A postpay user with several MyHandy products and the next rate in less than 3 days can access to the "My Handy Details" screen from the start tab header
    Header will be dismissed when clicking on the CTA or when the withdraw time has passed.
    Given user has a "postpay" account type
      And user has "several" my_handy
      And the next rate is in "<=3" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "My Handy Details" page is displayed for the corresponding product

  @jira.<jira_id> @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario Outline: A prepay user with <num_bundles> bundles in grace period will see the "bundle in pending activation" card in the header of the start tab
    Given user has a "prepay" account type
      And user has "<num_bundles>" bundles in "pending_activation" status
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "<title>" text is displayed
      And the "header.button" textfield with "[LANG:start.header.bundle_pending_activation.button]" text is displayed

    Examples:
          | num_bundles | title                                                        | jira_id      |
          | 1           | [LANG:start.header.bundle_pending_activation.single_title]   | QANOV-312499 |
          | several     | [LANG:start.header.bundle_pending_activation.multiple_title] | QANOV-312500 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A prepay user with <num_bundles> bundles in grace period can access to Topup screen from the start tab header
    Given user has a "prepay" account type
      And user has "<num_bundles>" bundles in "pending_activation" status
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

    Examples:
          | num_bundles | depends_on   | jira_id      |
          | 1           | QANOV-312499 | QANOV-312501 |
          | several     | QANOV-312500 | QANOV-312502 |

  @jira.QANOV-452277 @android @ios @jira.cv.14.9 @manual @mobile @o2de @regression
  Scenario: A prepay user with balance near expiration will see the "balance almost expired" card in the header of the start tab
    This header will disappear when the balance is expired or when a new topup is done.
    User: 017677162801 / #NQT#tlfncD3
    Given user has a "prepay" account type
      And user has the balance with expiration in "<=60" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_almost_expired.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_almost_expired.button]" text is displayed

  @jira.QANOV-452278 @android @ios @jira.cv.14.9 @jira.link.depends_on.QANOV-452277 @manual @mobile @o2de @regression
  Scenario: A prepay user with balance near expiration can access to Topup screen from the start tab header
    User: 017677162801 / #NQT#tlfncD3
    Given user has a "prepay" account type
      And user has the balance with expiration in "<=60" days
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-312503 @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A prepay user with balance expired will see the "balance expired" card in the header of the start tab
    Given user has a "prepay" account type
      And user has the balance expired
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_expired.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_expired.button]" text is displayed

  @jira.QANOV-312504 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312503 @jira.link.detects.OBO2DE-885
  @manual @mobile @o2de @regression
  Scenario: A prepay user with balance expired can access to Topup screen from the start tab header
    Given user has a "prepay" account type
      And user has the balance expired
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-324670 @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-2938 @jira.link.detects.O2DE-3445 @manual @mobile
  @o2de @smoke
  Scenario: A prepay user without balance will see the "no balance" card in the header of the start tab
    This card is no dismissible. It will disappear when the balance is 0€.
    Given user has a "prepay" account type
      And user has a "0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_zero.single_title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_zero.button]" text is displayed

  @jira.QANOV-324671 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A prepay user without balance can access to Topup screen from the start tab header
    This card is no dismissible. It will disappear when the balance is 0€.
    Given user has a "prepay" account type
      And user has a "0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-392767 @android @ios @jira.cv.14.6 @manual @mobile @o2de @smoke
  Scenario: A prepay user with low balance will see the "low balance" card in the header of the start tab
    It is considered low balance when the balance "< 5" €.
    Given user has a "prepay" account type
      And user has a "<5" balance
      And user has a ">0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.balance_low.title]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.balance_low.button]" text is displayed

  @jira.QANOV-392768 @android @ios @jira.cv.14.6 @manual @mobile @o2de @smoke
  Scenario: A prepay user with low balance can access to Topup screen from the start tab header
    It is considered low balance when the balance "< 5" €.
    Given user has a "prepay" account type
      And user has a "<5" balance
      And user has a ">0" balance
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Topup" page is displayed

  @jira.QANOV-312505 @TBD @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de
  @regression
  Scenario: A monoline user with a cancelled contract will see the "cancelled contract" card in the header of the start tab
    Given user has a "mobile_line" product in "cancelled" status
      And user has "1" mobile lines
      And user has the "contract-deactivated" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.cancelled_contract.single_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.cancelled_contract.button]" text is displayed

  @jira.QANOV-342579 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de
  @regression
  Scenario: A multiline user with a cancelled contract will see the "cancelled contract" card in the header of the start tab
    Given user has a "mobile_line" product in "cancelled" status
      And user has "several" mobile lines
      And user has the "contract-deactivated" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.cancelled_contract.multiple_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.cancelled_contract.button]" text is displayed

  @jira.QANOV-312506 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312505
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: A monoline user with a cancelled contract can access to "Get new contract" screen from the start tab header
    Given user has a "mobile_line" product in "cancelled" status
      And user has "1" mobile lines
      And user has the "contract-deactivated" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | o2" header is displayed

  @jira.QANOV-342580 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-342579
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: A multiline user with a cancelled contract can access to "Get new contract" screen from the start tab header
    Given user has a "mobile_line" product in "cancelled" status
      And user has "several" mobile lines
      And user has the "contract-deactivated" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-452279 @android @ios @jira.cv.14.10 @manual @mobile @o2de @regression
  Scenario: A new user (less than 3 months old) will see the "new customer" card in the header of the start tab
    The card will be displayed for new customers/contracts, when the contract is less than 3 months old since line
    activation date. Everytime the user gets a new contract (activates a new line), the header will be displayed. If
    there are more than 1 contract new, only one header will be displayed since it is generic and not specific for a
    line.
    The card will disappear when the customer is 3 months old.
    Given user has a new contract
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.new_customer.new_customer_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.new_customer.new_customer_button]" text is displayed

  @jira.QANOV-452280 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-452279 @manual @mobile @o2de @regression
  Scenario: A new user (less than 3 months old) can access to the Priority Offers webview from the start tab header
    The card will be displayed for new customers/contracts, when the contract is less than 3 months old since line
    activation date. Everytime the user gets a new contract (activates a new line), the header will be displayed. If
    there are more than 1 contract new, only one header will be displayed since it is generic and not specific for a
    line.
    The card will disappear when the customer is 3 months old.
    Given user has a new contract
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-452281 @android @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A postpay user with any overdue invoice will see the "overdue invoice" card in the header of the start tab
    There will be only one header no matter if there are one or more invoices to pay.
    The card will disappear when the user doesn't have an overdue invoice.
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has a month with "overdue" bill
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.overdue.bill_overdue_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.bill_overdue_button]" text is displayed

  @jira.QANOV-452282 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-452281
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: A postpay user with any overdue invoice can access to the Bills screen
    There will be only one header no matter if there are one or more invoices to pay.
    The card will disappear when the user doesn't have an overdue invoice.
    Given user has a "postpay" account type
      And user has a "mobile_line;internet_at_home" product in "active" status
      And user has a month with "overdue" bill
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bills" page is displayed

  @jira.QANOV-574935 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de
  @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G but with a SIM that does not support it will see the "5g eligible tariff" card in the header of the start tab
    Duration of the card: tbd.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.eligible_5g.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.eligible_5g.button_primary]" text is displayed
      And the "header.button2" textfield with "[LANG:start.header.eligible_5g.button_secondary]" text is displayed

  @jira.QANOV-574936 @TBD @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-574935
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G but with a SIM that does not support it can access to "Swap SIM" screen from the Start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Swap SIM Choose Type" page is displayed
      And the "Ersatz SIM-Karte" header is displayed

  @jira.QANOV-574937 @TBD @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-574935
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G but with a SIM that does not support it can access to "What is 5G SA" webview from the Start tab
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button2" button
     Then the internal webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-595161 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de
  @smoke
  Scenario: A postpay user with with a bill higher than last month will see the "high bill" card in the header of the start tab if the high bill flag is active
    The card will be displayed if the bill is at least 1€ higher than the previous month.
    The card will disappear after 15 days.
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.high_bill.high_bill_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.high_bill.high_bill_button]" text is displayed

  @jira.QANOV-595162 @android @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-595161
  @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de @regression
  Scenario: A postpay user with with a bill higher than last month taps on the header card button: the OB webview will be displayed
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Mehrkosten" header is displayed

  @jira.QANOV-600348 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de
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

  @jira.QANOV-620367 @android @e2e @ios @jira.cv.24.3 @manual @mobile @o2de @regression
  Scenario: Monoproduct postpay user with an unlimited tariff with "fair use policy" (FUP) will see the "consumption" card in the header of the start tab when consumed the 100% of EU data allowance
    This header will disappear when the EU data consumed <100%.
    Given user has a "postpay" account type
      And user has "1" products
      And the "inland_eu_data" allowance is unlimited in the "mobile_line" product
      And user has a tariff with fair use policy
      And user has consumed "100%" of the "eu_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.eu_consumption.monoproduct_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.eu_consumption.button]" text is displayed

  @jira.QANOV-620368 @android @e2e @ios @jira.cv.24.3 @manual @mobile @o2de @regression
  Scenario: Multiproduct postpay user with an unlimited tariff with "fair use policy" (FUP) will see the "consumption" card in the header of the start tab when consumed the 100% of several EU data allowances
    This header will disappear when the EU data consumed <100%.
    Given user has a "postpay" account type
      And user has "several" products
      And the "inland_eu_data" allowance is unlimited in the "mobile_line" product
      And user has a tariff with fair use policy
      And user has several products which has consumed "100%" of the EU data
      And user has the matching subscription selected in the account
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.eu_consumption.multiproduct_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.eu_consumption.button]" text is displayed

  @jira.QANOV-620369 @android @e2e @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-620367
  @jira.link.depends_on.QANOV-620368 @manual @mobile @o2de @regression
  Scenario: Postpay user with an unlimited tariff with "fair use policy" (FUP) can access to the "Fair Use Policy" OB webview from start tab header when has consumed the 100% of EU data allowance
    This header will disappear when the EU data consumed <100%.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is unlimited in the "mobile_line" product
      And user has a tariff with fair use policy
      And user has consumed "100%" of the "eu_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "EU-Roaming-Verordnung: Alle Infos bei o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

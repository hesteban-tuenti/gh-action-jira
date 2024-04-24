# -*- coding: utf-8 -*-
@jira.QANOV-127145
Feature: Invoice Details


  @jira.QANOV-5685 @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-101726 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with latest airtime bill amount 0 can access to the Latest airtime bill
    Given user has a "postpay" account type
      And user has the latest airtime bill with "0" charges
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "last" month in the bills graph
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "total_cost" textfield with "£0.00" text is displayed

  @jira.QANOV-6214 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-100895 @jira.link.relates_to.NOV-100915 @live @mobile
  @next @o2uk @regression
  Scenario: A legacy user with the latest airtime bill available can pay his/her billing account
    commented_tags="@depends_on.NOV-100927"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "header.make_a_payment" button
      And waits "10" seconds
     Then the internal webview is displayed
      And the "O2 | My Bills" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-6215 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-100895
  @jira.link.relates_to.NOV-100915 @manual @mobile @o2uk @regression
  Scenario: An AO2 user with the latest airtime bill available can pay his/her billing account
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "make_a_payment" button
     Then the internal webview is displayed
      And the "Make a payment | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-6219 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.detects.O2UK-3408 @qa
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100927 @live @mobile @next @o2uk @sanity @webapp
  Scenario: A legacy user with a single line in bill can see the details of the latest airtime bill from Bills screen
    internal_checkpoint="Optional sections:
    *CREDIT FOR YOU
    - Credit for recycled device
    - Change in value of recycled device
    - Order charges
    *ADJUSTMENTS:
    - Adjustments
    *DISCOUNTS
    - Discounts
    If the bill is in Overdue status, the 'balance_due' field will be displayed in the header.
    If the user has Late payment fee, a 'Late payment fee' row will be displayed in the 'extra_charges_list'."
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     When clicks on the "latest_invoice.link" link
      And the "Bills" page is displayed
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "Bill" header is displayed
      And the "header.bill_text_status" textfield is displayed
      And the "header.billing_date" textfield with the "Billing date: \d{2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "header.make_a_payment" button is displayed
      And the "header.change_tariff" button is displayed
      And the "tariff_charge_label" textfield with "Airtime charge" text is displayed
      And waits until the "tariff_charge_cost" element is visible
      And the "tariff_charge_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "monthly_extras_label" textfield with "Monthly extras" text is displayed
      And the "monthly_extras_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "extra_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "extra_charges_list" list contains the "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you’ve bought" textfields displayed in the "title" field
      And each element in the "extra_charges_list" list has the "cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format
      And the "total_before_vat_text" textfield with "Total before VAT" text is displayed
      And the "total_before_vat_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "vat_text" textfield with "VAT" text is displayed
      And the "vat_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-66061 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @mobile @o2uk @qa
  @sanity @webapp
  Scenario: An AO2 user can see the details of the latest airtime bill from Bills screen
    Optional sections to be displayed only if they have charges:
    *Airtime charge
    *Monthly extras
    *Termination fee
    *Late payment fee (this concept can be a general concept or specific of the line)
    *Account charges
    *Adjustments
    *Device plan
    Every item listed has to include a chevron except: Device plan. Concepts with value 0
    If the bill is in Overdue status, the 'balance_due' field will be displayed in the header.
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     When clicks on the "latest_invoice.link" link
      And the "Bills" page is displayed
      And clicks on "last" month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "Bill" header is displayed
      And the "header.billing_date" textfield with the "Billing date: \d{2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "header.make_a_payment" button is displayed
      And the "header.change_tariff" button is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-6221 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100896 @mobile @o2uk @smoke @webapp
  Scenario: A multi-msisdn legacy user with multiple lines in bill accesses latest airtime bill
    internal_checkpoint="To test this case, check the O2 MW response
    /\{msisdn}/postpay/bill/profile The users with two billing accounts will have more than one MSISDN in the
    field 'msisdn_billdetails_list'.
    The field will be like the following:
    {code:java}
    'msisdn_billdetails_list':
    [
    {
    'msisdn': '447521118654',
    'billtotal_without_VAT': '\u00a31647.11'
    },
    {
    'msisdn': '447568418032',
    'billtotal_without_VAT': '\u00a3208.92'
    }
    ],
    {code}
    Optional sections:
    *CREDIT FOR YOU
    - Credit for recycled device
    - Change in value of recycled device
    - Order charges
    *ADJUSTMENTS:
    - Adjustments
    *DISCOUNTS
    - Discounts
    If the bill is in Overdue status, the 'balance_due' field will be displayed in the header."
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has "several" mobile lines
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "last" month in the bills graph
      And clicks on the "bill.see_bill_details_link" entrypoint
     Then the "Latest Airtime Bill" page is displayed
      And the "Bill" header is displayed
      And the "header.bill_text_status" textfield is displayed
      And the "header.billing_date" textfield with the "Billing date: \d{2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "header.make_a_payment" button is displayed
      And the "header.change_tariff" button is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And each element in the "multimsisdn_entrypoints" list has the "title" field
      And each element in the "multimsisdn_entrypoints" list has the "cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format
      And each element in the "multimsisdn_entrypoints" list has the "chevron" field
      And the "tariff_charge_label" textfield is not displayed
      And the "monthly_extras_label" textfield is not displayed
      And the "extra_charges_title" textfield is not displayed
      And the "total_before_vat_text" textfield with "Total before VAT" text is displayed
      And the "total_before_vat_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "vat_text" textfield with "VAT" text is displayed
      And the "vat_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed

  @jira.QANOV-66037 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-100896 @mobile @o2uk @qa @smoke @webapp
  Scenario: An AO2 user with multiple lines in bill accesses latest airtime bill
    Some sections will not be always displayed unless they contain items with cost != 0:
    *Account charges (with section title 'ACCOUNT CHARGES')
    *Adjustments (with section title 'ADJUSTMENTS')
    *Payment plan
    All items in lists should include a chevron except Payment plan.
    If the bill is in Overdue status, the 'balance_due' field will be displayed in the header.
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "last" month in the bills graph
      And clicks on the "bill.see_bill_details_link" entrypoint
     Then the "Latest Airtime Bill" page is displayed
      And the "Bill" header is displayed
      And the "header.billing_date" textfield with the "Billing date: \d{2} \w{3} '\d{2}" format is displayed
      And the "header.make_a_payment" button is displayed
      And the "header.change_tariff" button is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And each element in the "multimsisdn_entrypoints" list has the "title" field
      And each element in the "multimsisdn_entrypoints" list has the "cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format
      And each element in the "multimsisdn_entrypoints" list has the "chevron" field
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "£(\d+,\d{3}|\d+).\d\d" format is displayed
      And the "vat_status" textfield with "VAT included" text is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed

  @jira.<jira_id> @<automation> @<ber> @<execution_mode> @<impeded_label> @android @cert0 @cert1 @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-39378 @mobile @o2uk @smoke @<webapp>
  Scenario Outline: A <account_type> user with multiple lines in the bill can access to the charge details of a concrete line
    internal_checkpoint="CERT2: 447000000009@gmail.com
    CERT0: inl_may8842@o2.com --> invalid user, without bills (07521130461), novumo2ask@gmail.com (07731515519), in00322v_432556@o2.com"
    other_affected_versions="2021-08"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "last" month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on any element in the "multimsisdn_entrypoints" list
     Then the "Bill Concepts" page is displayed
      And the "tariff_charge_label" textfield with "Airtime charge" text is displayed
      And the "tariff_charge_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "monthly_extras_label" textfield with "Monthly extras" text is displayed
      And the "monthly_extras_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "extra_charges_list" list contains the "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you’ve bought" textfields displayed in the "title" field
      And each element in the "extra_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the "vat_status" textfield with "VAT not included" text is displayed

    Examples:
          | account_type | ber | execution_mode | impeded_label | automation              | jira_id    | webapp |
          | legacy PAYM  | ber | automatic      |               |                         | QANOV-6222 | webapp |
          | legacy MBB   |     | manual         | impeded_mock  | automation.pending_mock | QANOV-6223 |        |

  @jira.QANOV-66038 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-39378 @mobile @o2uk @qa @smoke @webapp
  Scenario: An AO2 postpay user with multiple lines in the bill can access to the charge details of a concrete line
    NOTES:
    *Entrypoints that might be displayed out of the 'Airtime charges' section (only displayed when charges != 0:
    Airtime charge, Monthly extras, Termination fee, Late payment fee(inside airtime charges section), Charges and adjustments, Device plan, Discounts.
    *All items in this screen should have a chevron except for Charges when abroad and Late payment fee, that are never accessible
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "0" element in the "multimsisdn_entrypoints" list
     Then the "Bill Concepts" page is displayed
      And the "vat_status" textfield with "VAT included" text is displayed

  @jira.QANOV-6224 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.detects.O2UK-3485 @qa
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100926 @live @mobile @next @o2uk @regression @webapp
  Scenario: A legacy user with one line in the bill can see the details of a past bill
    internal_checkpoint="CERT0: set532@test.com
    Optional sections:
    *CREDIT FOR YOU
    - Credit for recycled device
    - Change in value of recycled device
    - Order charges
    *ADJUSTMENTS:
    - Adjustments
    *DISCOUNTS
    - Discounts"
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has bills for "several" months
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on another month with bills in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "tariff_charge_label" textfield with "Airtime charge" text is displayed
      And the "tariff_charge_cost" textfield with the "-?£\d+.\d\d" format is displayed
      And the "monthly_extras_label" textfield with "Monthly extras" text is displayed
      And the "monthly_extras_cost" textfield with the "-?£\d+.\d\d" format is displayed
      And the "extra_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "extra_charges_list" list contains the "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you’ve bought" textfields displayed in the "title" field
      And each element in the "extra_charges_list" list has the "cost" textfield with the "-?£\d+.\d\d" format
      And the "total_before_vat_text" textfield with "Total before VAT" text is displayed
      And the "total_before_vat_cost" textfield with the "-?£\d+.\d\d" format is displayed
      And the "vat_text" textfield with "VAT" text is displayed
      And the "vat_cost" textfield with the "-?£\d+.\d\d" format is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "-?£\d+.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+.\d\d" format is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-66065 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @mobile @o2uk @qa
  @regression @webapp
  Scenario: An AO2 user with one line in the bill can see the details of a past bill
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has bills for "several" months
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on a different month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And waits until the "total_text" element is visible
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "vat_status" textfield with "VAT included" text is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-6225 @android @ios @jira.cv.11.1 @jira.link.detects.O2UK-3485 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100926 @manual @mobile @o2uk @regression
  Scenario: A legacy user with a bill for multiple lines can see the details of a past bill
    internal_checkpoint="
    Optional sections:
    *CREDIT FOR YOU
    - Credit for recycled device
    - Change in value of recycled device
    - Order charges
    *ADJUSTMENTS:
    - Adjustments
    *DISCOUNTS
    - Discounts"
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And clicks on a different month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And each element in the "multimsisdn_entrypoints" list has the "title" field
      And each element in the "multimsisdn_entrypoints" list has the "cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format
      And each element in the "multimsisdn_entrypoints" list has the "chevron" field
      And the "tariff_charge_label" textfield is not displayed
      And the "monthly_extras_label" textfield is not displayed
      And the "extra_charges_list" list is not displayed
      And the "total_before_vat_text" textfield with "Total before VAT" text is displayed
      And the "total_before_vat_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "vat_text" textfield with "VAT" text is displayed
      And the "vat_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-66066 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk
  @regression @qa @cert0 @cert1 @webapp
  Scenario: An AO2 user with a bill for multiple lines can see the details of a past bill
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has bills for "several" months
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And clicks on another month with bills in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And each element in the "multimsisdn_entrypoints" list has the "title" field
      And each element in the "multimsisdn_entrypoints" list has the "cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format
      And each element in the "multimsisdn_entrypoints" list has the "chevron" field
      And the "tariff_charge_label" textfield is not displayed
      And the "monthly_extras_label" textfield is not displayed
      And the "extra_charges_list" list is not displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "vat_status" textfield with "VAT included" text is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-6233 @android @automatic @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100874 @mobile @o2uk @qa @regression @webapp
  Scenario: A legacy postpay user with companion devices can see the latest airtime bill details from the bills screen of the lead line
    internal_checkpoint="the name shown for the lines of the companion devices will be extracted
    from the /verify request and correspond to the friendly_name field or connection_label field
    (in that order of precedence)
    CERT0 user: snow79992211@stf.ref.o2.co.uk
    Optional sections:
    *CREDIT FOR YOU
    - Credit for recycled device
    - Change in value of recycled device
    - Order charges
    *ADJUSTMENTS:
    - Adjustments
    *DISCOUNTS
    - Discounts
    If the bill is in Overdue status, the 'balance_due' field will be displayed in the header."
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type with companion line associated
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "Bill" header is displayed
      And the "header.bill_text_status" textfield is displayed
      And the "header.billing_date" textfield with the "Billing date: \d{2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "header.make_a_payment" button is displayed
      And the "header.change_tariff" button is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And the lead msisdn entrypoint is displayed
      And the companion name entrypoint is displayed
      And the "tariff_charge_label" textfield is not displayed
      And the "monthly_extras_label" textfield is not displayed
      And the "extra_charges_title" textfield is not displayed
      And the "total_before_vat_text" textfield with "Total before VAT" text is displayed
      And the "total_before_vat_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "vat_text" textfield with "VAT" text is displayed
      And the "vat_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed

  @jira.QANOV-66067 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-100874
  @automatic @mobile @o2uk @regression @qa @cert0 @cert1 @webapp
  Scenario: An AO2 postpay user with companion devices can see the latest airtime bill details from the bills screen of the lead line
    the friendly name of the companion device is not dependant of the contact name in case it's saved as a contact. It can only be changed through the web.
    Entrypoints/sections that might be displayed if they have != 0 charges:
    *Account charges
    *Adjustments
    *Payment plan (won't have a chevron)
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type with companion line associated
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "Bill" header is displayed
      And the "header.billing_date" textfield with the "Billing date: \d{2} (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "header.make_a_payment" button is displayed
      And the "header.change_tariff" button is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And the lead msisdn entrypoint is displayed
      And the companion name entrypoint is displayed
      And the "extra_charges_list" list is not displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "vat_status" textfield with "VAT included" text is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100886 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user who did reach the payment due date without paying can see a specific badge/tag in the billing details
    internal_checkpoint="CERT0:
    - PAYM: aaa.b@c.om, in01808o_175099@o2.com, inl_may8842@o2.com(447521116559) --> invalid user, without bills
    - MBB: test30689357@stf.ref.o2.co.uk, novumo2ask@gmail.com
    https://app.zeplin.io/project/5a2bcf19ab11dec6c2ba05b6/screen/5beae42c08d1323cf3fc0c78. Some further explanations
    from Eduardo: When a bill is produced there a user has 14 days to pay it, e.g my bill gets produced on the 16th
    of each month, but I don't have to pay it until 30th of each month, those 14 days are treated as Neutral
    (provided I haven't paid the bill early) after the 30th there is a further 7 days which the status is GRACE if I
    still haven't paid after those 7 days and I still haven't paid the status changes to LATE. Grace and Late are the
    LPF triggers, however there is a slight exception that if the unpaid amount is less that a certain threshold
    £5, then LPF does not apply and therefore Grace/Late do not apply. In this case UNPAID would be the status."
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill in "<bill_state>" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "bill_text_status" textfield with "OVERDUE" text is displayed

    @netcracker
    Examples:
          | bill_state | jira_id    |
          | grace      | QANOV-6245 |
          | late       | QANOV-6246 |

    @automation.pending_mock @impeded_mock @jira.link.parent_test_plan.QANOV-24141
    Examples:
          | bill_state | jira_id    |
          | unpaid     | QANOV-6247 |

  @jira.QANOV-6252 @android @automatic @ber @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100875 @mobile @o2uk @qa @regression @webapp
  Scenario: A legacy postpay user with companion device can see the latest airtime bill details from the Bills screen of the companion device
    internal_checkpoint="the name shown for the lines of the companion devices will be
    extracted from the /verify request and correspond to the friendly_name field or
    connection_label field (in that order of precedence)
    CERT0: snow79992211@stf.ref.o2.co.uk
    Optional sections:
    *CREDIT FOR YOU
    - Credit for recycled device
    - Change in value of recycled device
    - Order charges
    *ADJUSTMENTS:
    - Adjustments
    *DISCOUNTS
    - Discounts"
    other_affected_versions="2021-08"
    Given user has a "legacy companion" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the lead msisdn entrypoint is displayed
      And the companion name entrypoint is displayed
      And the "tariff_charge_label" textfield is not displayed
      And the "monthly_extras_label" textfield is not displayed
      And the "extra_charges_title" textfield is not displayed
      And the "total_before_vat_text" textfield with "Total before VAT" text is displayed
      And the "total_before_vat_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "vat_text" textfield with "VAT" text is displayed
      And the "vat_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed

  @jira.QANOV-66075 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-100875 @mobile @o2uk @qa @regression @cert0 @cert1 @webapp
  Scenario: An AO2 postpay user with companion device can see the latest airtime bill details from the Bills screen of the companion device
    The friendly name of the companion device is not dependant of the contact name in case it's saved as a contact. It can only be changed through the web.
    Entrypoints/sections that might be displayed if they have != 0 charges:
    *Account charges
    *Adjustments
    *Payment plan (won't have a chevron)
    other_affected_version="2022-09"
    Given user has a "AO2 companion" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "lines_title" textfield with "LINES OF YOUR CONTRACT" text is displayed
      And the "multimsisdn_entrypoints" list is displayed
      And the lead msisdn entrypoint is displayed
      And the companion name entrypoint is displayed
      And the "extra_charges_list" list is not displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "£\d+.\d\d" format is displayed
      And the "vat_status" textfield with "VAT included" text is displayed
      And the "how_your_bill_is_broken_down" link with "How your bill is broken down" text is displayed
      And the "what_is_balance_due" link with "What is balance due?" text is displayed

  @jira.QANOV-6253 @android @ios @jira.cv.11.1 @jira.link.detects.O2UK-4184 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100873 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay user with companion device can see the specific charges of the companion device in the latest airtime bill
    internal_checkpoint="the name shown for the lines of the companion devices will be
    extracted from the /verify request and correspond to the friendly_name field or
    connection_label field (in that order of precedence)
    Other fields other than Airtime charge, Data and Charges when abroad might be displayed if they come from API, but
    it would be a test data defect since it's not expected to happen in live.
    CERT0: snow79992211@stf.ref.o2.co.uk (2021/07/08)"
    other_affected_versions="2021-08"
    Given user has a "legacy companion" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "companion_friendly_name_entry" link
     Then the "Bill Concepts" page is displayed
      And the companion friendly name is displayed in the header
      And the "tariff_charge.title" textfield with "Airtime charge" text is displayed
      And the "tariff_charge.cost" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "extra_charges_list" list with "Data;Charges when abroad" entrypoints is displayed
      And each element in the "extra_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the "vat_status" textfield with "VAT not included" text is displayed

  @jira.QANOV-66076 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-100873
  @manual @mobile @o2uk @regression
  Scenario: An AO2 postpay user with companion device can see the specific charges of the companion device in the latest airtime bill
    NOTES:
    *Entrypoints that might be displayed out of the 'Airtime charges' section (only displayed when charges != 0:
    Airtime charge, Monthly extras, Termination fee, Late payment fee(inside airtime charges section), Charges and adjustments, Device plan, Discounts.
    *All items in this screen should have a chevron except for Charges when abroad and Late payment fee, that are never accessible
    other_affected_version="2022-09"
    Given user has a "AO2 companion" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "companion_friendly_name_entry" link
     Then the "Bill Concepts" page is displayed
      And the companion friendly name is displayed in the header
      And the "vat_status" textfield with "VAT included" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-24141 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user can see the <billing_section> section in their bill when it has events
    other_affected_versions="2021-08"
    internal_checkpoint="Each section can have the following items:
    ADJUSTMENTS - Adjustments
    DISCOUNTS - Discounts
    CREDIT FOR YOU - Credit for recycle device;Change in value of recycled device;Order charges"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has events in the <billing_section> bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     Then the "<billing_section>_title" textfield with "<section_title>" text is displayed
      And the "<billing_section>_list" list is displayed
      And each element in the "<billing_section>_list" list has the "cost" textfield with the "£\d+.\d\d" format

    Examples:
          | billing_section | section_title  | jira_id     |
          | adjustments     | ADJUSTMENTS    | QANOV-59958 |
          | discounts       | DISCOUNTS      | QANOV-59959 |
          | credit_for_you  | CREDIT FOR YOU | QANOV-59960 |

  @jira.QANOV-6339 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-101004
  @manual @mobile @o2uk @regression
  Scenario: A multimsisdn legacy user can see late payment fee of previous period in current bill details
    internal_checkpoint="The Late Payment Fee will be shown in the bill when the O2 MW response of
    /{msisdn}/postpay/bill/profile?billnumber={bill-number} for the latest airtime bill contains a Late Payment Fee.
    You can check the charge in the bill profile:
    {code:java}
    'latePaymentChargeDetailsList': [
    {
    'applied_date': '14.09.2018',
    'billNumber': '2000094094-0004',
    'charge": '\u00a33.50',
    'productName': 'Late Payment Fee'
    }
    ]{code}
    You can find the bill-number with /{msisdn}/postpay/bill/previousbills
    CERT0: in00322v_432556@o2.com
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill with "several" mobile lines
      And incurred in late payment fee in the previous bill
      And user has the latest airtime bill in "paid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     Then the "late_payment_fee_title" textfield with "LATE PAYMENT FEE" text is displayed
      And the "late_payment_fee_label" textfield with "Late payment fee" text is displayed
      And the "late_payment_fee_value" textfield with the "£\d+.\d\d" format is displayed

  @jira.QANOV-59961 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-24141 @manual @mobile @o2uk @regression
  Scenario: A single msisdn legacy user can see the late payment fee of previous period in current bill details
    PAYM (CERT0): inl_may8842@o2.com (07521 109498) --> invalid user, without bills
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill with "1" mobile lines
      And incurred in late payment fee in the previous bill
      And user has the latest airtime bill in "paid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     Then the "extra_charges.list" list with "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you´ve bought;Late payment fee" entrypoints is displayed

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-91712 @manual @mobile @o2uk @smoke
  Scenario Outline: A legacy postpay user can see the latest airtime bill details corresponding to the lead msisdn
    CERT0:
    - user with companion device and bill with only a mobile line: snow79992211@stf.ref.o2.co.uk
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type with companion line associated
      And user has "<mobile_lines>" mobile lines
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "lead_msisdn_entry" entrypoint
     Then the "Bill Concepts" page is displayed
      And the "tariff_charge.title" textfield with "Airtime charge" text is displayed
      And the "tariff_charge.cost" textfield with the "£\d+.\d\d" format is displayed
      And the "monthly_extras.title" textfield with "Monthly extras" text is displayed
      And the "monthly_extras.cost" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges_title" textfield with "EXTRA CHARGES" text is displayed
      And the "extra_charges_list" list contains the "Minutes;Messages;Data;Charges when abroad;Premium & information services;Things you’ve bought" textfields displayed in the "title" field
      And each element in the "extra_charges_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And the "vat_status" textfield with "VAT not included" text is displayed

    Examples:
          | mobile_lines | automation              | impeded_label | jira_id    |
          | 1            |                         |               | QANOV-6340 |
          | several      | automation.pending_mock | impeded_mock  | QANOV-6341 |

  @jira.QANOV-66077 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-91712
  @manual @mobile @o2uk @regression
  Scenario: An AO2 postpay user can see the latest airtime bill details corresponding to the lead msisdn
    NOTES:
    *Entrypoints that might be displayed out of the 'Airtime charges' section (only displayed when charges != 0:
    Airtime charge, Monthly extras, Termination fee, Late payment fee(inside airtime charges section), Charges and adjustments, Device plan, Discounts.
    *All items in this screen should have a chevron except for Charges when abroad and Late payment fee, that are never accessible
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type with companion line associated
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "lead_msisdn_entry" entrypoint
     Then the "Bill Concepts" page is displayed
      And the companion lead line is displayed in the header
      And the "vat_status" textfield with "VAT included" text is displayed

  @jira.QANOV-6357 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208
  @jira.link.depends_on.QANOV-6209 @jira.link.depends_on.QANOV-6218 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-162915 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user won't see any tag bill in the Bills screen when the bill payment status is unknown
    internal_checkpoint="To check the bill you can view the request '/{msisdn}/postpay/bill/profile?billnumber={billNumber}' and the
    billNumber can be seen in the /previous/bills request"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has latest airtime bill in "unknown" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "bill_text_status" textfield is not displayed
      And the "billing_date" textfield with "Billing date: dd month yy" format is displayed
      And the "payment_date" textfield is not displayed
      And the "balance_due" textfield is not displayed

  @jira.QANOV-6362 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100897
  @manual @mobile @o2uk @regression
  Scenario: A Multi-msisdn legacy user with one billing account accesses latest airtime bill
    internal_checkpoint="To test this case, check the O2 MW response /\{msisdn}/postpay/bill/profile
    The users with one billing account will have just one MSISDN in the field 'msisdn_billdetails_list'.
    The field will be like the following:
    {code:java}
    'msisdn_billdetails_list': [
    {
    'msisdn': '447521118654',
    'billtotal_without_VAT': '\u00a31647.11'
    }
    ],
    {code}"
    other_affected_versions="2021-08"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has "several" mobile lines
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "bill.see_bill_details_link" entrypoint
     Then the "Latest Airtime Bill" page is displayed
      And the "multimsisdns_entrypoints" textfields are not displayed
      And the "tariff_charge.title" textfield is displayed
      And the "monthly_extras.title" textfield is displayed
      And the "extra_charges_list" list is displayed

  @jira.QANOV-6366 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100885 @manual @mobile @o2uk @regression
  Scenario: A postpay user who has the latest bill in status Unknown can not see any badge/tag in the billing details view
    internal_checkpoint="To test this TC you should check the O2 Middleware response of '/{msisdn}/postpay/bill/profile' "
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has latest airtime bill in "unknown" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "bill_text_status" textfield is not displayed
      And the "billing_date" textfield is not displayed
      And the "balance_due" textfield is not displayed

  @jira.QANOV-6368 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100887
  @manual @mobile @o2uk @regression
  Scenario: An legacy postpay user who paid the last bill can see the bill status
    internal_checkpoint="CERT1: rbmuatlokesh_donotusee2113@stf.ref.o2.co.uk"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill in "paid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
      And waits until the "bill.see_bill_details_link" element is visible
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "bill_text_status" textfield with "PAID" text is displayed

  @jira.QANOV-167676 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk
  @regression @qa @webapp
  Scenario: An AO2 postpay user who paid the last bill can see the Balance due
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill in "paid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "last" month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "header.balance_due" textfield with "Balance due" text is displayed
      And the "header.bill_amount" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed

  @jira.QANOV-6375 @android @ios @jira.cv.9.15 @jira.link.relates_to.NOV-9073 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user can see a description about what is the balance due
    internal_checkpoint="
    can be tested in CERT1 with 07521130461
    CERT2: 121111112@gmail.com"
    Given user has a "postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "what_is_balance_due" link
     Then the "Balance Information" page is displayed
      And the "Balance Information" header is displayed
      And the "balance_due_information" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-6374 @android @jira.cv.11.3 @jira.link.relates_to.NOV-148010 @manual @mobile @o2uk @regression
  Scenario: A postpay user can call from the Balance Information screen
    internal_checkpoint="CERT1: 07521130461"
    Given user has a "postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "what_is_balance_due" link
      And the "Balance Information" page is displayed
      And clicks on the "contact_us" button
     Then the "dialer" app is displayed
      And the "2202" phone number is inserted on the dialer
      And clicks on the native "back" button
      And the "Balance Information" page is displayed

  @jira.QANOV-6384 @android @ios @jira.cv.9.14 @jira.link.parent_test_plan.QANOV-97827 @jira.link.relates_to.NOV-17567
  @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can see the information about how the bill is broken down
    internal_checkpoint="
    CERT0: inl_may8842@o2.com (07521130461) --> invalid user, without bills
    CERT0: inavl0ww_878541@o2.com"
    Given user has a "postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "how_your_bill_is_broken_down" link
     Then the "How Your Bill Is Broken Down" page is displayed
      And the "How your bill is broken down" header is displayed
      And the "how_your_bill_is_broken_down_text" textfield is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @automatic @mobile @o2uk
  @smoke @qa @webapp
  Scenario Outline: An AO2 user with 1 lines in the bill and with charges in the <element_title> item can see the element listed in the Latest Airtime Bill page
    User (CERT0): ncqae2etest+78199126@gmail.com
    Given user has any "<account_types>" account types
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has charges in the "<charged_element>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page 
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And waits until the "airtime_charges_title" element is visible
      And the "airtime_charges_title" textfield with "AIRTIME CHARGES" text is displayed
      And any element in the "extra_charges_list" list has the "title" textfield with the "<element_title>" text

    Examples:
          | account_types    | charged_element                  | element_title                  | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM;AO2 MBB | minutes                          | Minutes                        | QANOV-77438      | 13.0 | QANOV-167677 |
          | AO2 PAYM;AO2 MBB | messages                         | Messages                       | QANOV-77438      | 13.0 | QANOV-167678 |
          | AO2 PAYM;AO2 MBB | premium_and_information_services | Premium & information services | QANOV-77438      | 13.0 | QANOV-167679 |
          | AO2 PAYM;AO2 MBB | things_you_have_bought           | Things you’ve bought           | QANOV-77438      | 13.0 | QANOV-167680 |
          | AO2 postpay      | data                             | Data                           | QANOV-77438      | 13.0 | QANOV-167681 |
          | AO2 postpay      | charges_when_abroad              | Charges when abroad            | QANOV-77438      | 13.0 | QANOV-167682 |
          | AO2 postpay      | other_charges                    | Other charges and adjustments  | QANOV-132515     | 13.6 | QANOV-225472 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @automatic @mobile @o2uk
  @smoke @qa @webapp
  Scenario Outline: An AO2 user with several lines in the bill and with charges in the <element_title> item can see the element listed in the Latest Airtime Bill page
    User (CERT0): ncqae2etest+78199126@gmail.com
    Given user has any "<account_types>" account types
      And user has the latest airtime bill with "several" mobile lines
      And user has charges in the "<charged_element>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the eligible msisdn entrypoint in bill
     Then the "Bill Concepts" page is displayed
      And waits until the "airtime_charges_title" element is visible
      And the "airtime_charges_title" textfield with "AIRTIME CHARGES" text is displayed
      And any element in the "extra_charges_list" list has the "title" textfield with the "<element_title>" text

    Examples:
          | account_types    | charged_element                  | element_title                  | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM;AO2 MBB | minutes                          | Minutes                        | QANOV-77438      | 13.0 | QANOV-167683 |
          | AO2 PAYM;AO2 MBB | messages                         | Messages                       | QANOV-77438      | 13.0 | QANOV-167684 |
          | AO2 PAYM;AO2 MBB | premium_and_information_services | Premium & information services | QANOV-77438      | 13.0 | QANOV-167685 |
          | AO2 PAYM;AO2 MBB | things_you_have_bought           | Things you’ve bought           | QANOV-77438      | 13.0 | QANOV-167686 |
          | AO2 postpay      | data                             | Data                           | QANOV-77438      | 13.0 | QANOV-167687 |
          | AO2 postpay      | charges_when_abroad              | Charges when abroad            | QANOV-77438      | 13.0 | QANOV-167688 |
          | AO2 postpay      | other_charges                    | Other charges and adjustments  | QANOV-132515     | 13.6 | QANOV-225473 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk
  @regression @qa @webapp
  Scenario Outline: An <account_type> user with one line associated to their bill can't access to the bill <no_charges_element> element when it has no cost
    other_affected_version="2022-09"
    Given user has any "<account_type>" account types
      And user has the latest airtime bill with "1" mobile lines
      And user has events "without" charges in the "<no_charges_element>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the element in the "extra_charges_list" list with text "<charges_title>" in the "title" textfield does not have the "chevron" field

    Examples:
          | account_type     | no_charges_element               | charges_title                  | ber | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM         | minutes                          | Minutes                        | ber | QANOV-77438      | 13.0 | QANOV-6387   |
          | AO2 PAYM;AO2 MBB | messages                         | Messages                       |     | QANOV-77438      | 13.0 | QANOV-6388   |
          | AO2 PAYM;AO2 MBB | premium_and_information_services | Premium & information services | ber | QANOV-77438      | 13.0 | QANOV-6390   |
          | AO2 PAYM;AO2 MBB | things_you_have_bought           | Things you’ve bought           |     | QANOV-77438      | 13.0 | QANOV-6391   |
          | AO2 postpay      | data                             | Data                           |     | QANOV-77438      | 13.0 | QANOV-6389   |
          | AO2 postpay      | charges_when_abroad              | Charges when abroad            |     | QANOV-77438      | 13.0 | QANOV-167689 |
          | AO2 postpay      | other_charges                    | Other charges and adjustments  |     | QANOV-132515     | 13.6 | QANOV-225474 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @automatic @mobile @o2uk @impeded_env
  Scenario Outline: An <account_type> user with one line associated to their bill can access to the bill <charged_element> element with cost
    other_affected_version="2022-09"
    Given user has any "<account_type>" account types
      And user has the latest airtime bill with "1" mobile lines
      And user has events "with" charges in the "<charged_element>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "<charged_element>_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Bill" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Latest Airtime Bill" page is displayed

    Examples:
          | account_type     | charged_element                  | ber | test_priority | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM         | minutes                          |     | smoke         | QANOV-77438      | 13.0 | QANOV-6397   |
          | AO2 PAYM;AO2 MBB | messages                         | ber | smoke         | QANOV-77438      | 13.0 | QANOV-6398   |
          | AO2 PAYM;AO2 MBB | premium_and_information_services |     | regression    | QANOV-77438      | 13.0 | QANOV-6400   |
          | AO2 PAYM;AO2 MBB | things_you_have_bought           |     | regression    | QANOV-77438      | 13.0 | QANOV-6401   |
          | AO2 postpay      | data                             | ber | regression    | QANOV-77438      | 13.0 | QANOV-6399   |
          | AO2 postpay      | charges_when_abroad              | ber | regression    | QANOV-77438      | 13.0 | QANOV-167690 |
          | AO2 postpay      | other_charges                    |     | regression    | QANOV-132515     | 13.6 | QANOV-225475 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @automatic @mobile @o2uk
  @regression @impeded_env
  Scenario Outline: An <account_type> user with several lines associated to their bill can access to the bill <charged_element> element with cost
    other_affected_version="2022-09"
    Given user has any "<account_type>" account types
      And user has the latest airtime bill with "several" mobile lines
      And user has events "with" charges in the "<charged_element>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the eligible msisdn entrypoint in bill
      And the "Bill Concepts" page is displayed
      And clicks on the "<charged_element>_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Bill" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Concepts" page is displayed

    Examples:
          | account_type     | charged_element                  | ber | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM         | minutes                          |     | QANOV-77438      | 13.0 | QANOV-6407   |
          | AO2 PAYM;AO2 MBB | messages                         | ber | QANOV-77438      | 13.0 | QANOV-6408   |
          | AO2 PAYM;AO2 MBB | premium_and_information_services |     | QANOV-77438      | 13.0 | QANOV-6410   |
          | AO2 PAYM;AO2 MBB | things_you_have_bought           |     | QANOV-77438      | 13.0 | QANOV-6411   |
          | AO2 postpay      | data                             | ber | QANOV-77438      | 13.0 | QANOV-6409   |
          | AO2 postpay      | charges_when_abroad              |     | QANOV-77438      | 13.0 | QANOV-167691 |
          | AO2 postpay      | other_charges                    |     | QANOV-132515     | 13.6 | QANOV-225476 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk @regression
  @impeded_env
  Scenario Outline: An <account_type> user with one line associated to their bill can access to the bill <no_charges_element> element when it has no cost
    other_affected_version="2022-09"
    Given user has any "<account_type>" account types
      And user has the latest airtime bill with "1" mobile lines
      And user has events "without" charges in the "<no_charges_element>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "<charged_element>_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Bill" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Latest Airtime Bill" page is displayed

    Examples:
          | account_type     | no_charges_element               | parent_test_plan | cv   | jira_id      |
          | AO2 PAYM         | minutes                          | QANOV-77438      | 13.0 | QANOV-250537 |
          | AO2 PAYM;AO2 MBB | messages                         | QANOV-77438      | 13.0 | QANOV-250538 |
          | AO2 PAYM;AO2 MBB | premium_and_information_services | QANOV-77438      | 13.0 | QANOV-250539 |
          | AO2 PAYM;AO2 MBB | things_you_have_bought           | QANOV-77438      | 13.0 | QANOV-250540 |
          | AO2 postpay      | data                             | QANOV-77438      | 13.0 | QANOV-250544 |
          | AO2 postpay      | charges_when_abroad              | QANOV-77438      | 13.0 | QANOV-6420   |
          | AO2 postpay      | other_charges                    | QANOV-132515     | 13.6 | QANOV-250545 |

  @jira.<jira_id> @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @<automation> @mobile @o2uk
  @regression @qa @<webapp>
  Scenario Outline: An AO2 user with several lines associated to their bill can see the <bill_section> in their bill
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill with "several" mobile lines
      And user has charges in the "<bill_section>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the eligible msisdn entrypoint in bill
     Then the "Bill Concepts" page is displayed
      And waits until the "<bill_element>" element is visible
      And the "<bill_element>" textfield with "<bill_section_textfield>" text is displayed

    Examples:
          | bill_section        | bill_element              | bill_section_textfield  | jira_id     | automation | webapp |
          | tariff_charge       | tariff_charge_label       | Airtime charge          | QANOV-66190 | automatic  | webapp |
          | monthly_extras      | monthly_extras_label      | Monthly extras          | QANOV-66191 | automatic  | webapp |
          | charges_adjustments | charges_adjustments_title | Charges and adjustments | QANOV-66193 | manual     |        |
          | device_plan         | device_plan_title         | Device plan             | QANOV-66194 | automatic  | webapp |
          | discounts           | discounts_title           | Discounts               | QANOV-66195 | automatic  | webapp |

  @jira.<jira_id> @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user with <num_lines> lines associated to their bill can access the <bill_section> in their bill
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has events "with" charges in the "<bill_section>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "any" element in the "<bill_section>" list
     Then the internal webview is displayed
      And the "Bill" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | num_lines | bill_section    | jira_id     |
          | 1         | tariff_charge   | QANOV-66196 |
          | 1         | monthly_extras  | QANOV-66197 |
          | 1         | termination_fee | QANOV-66198 |
          | 1         | device_plan     | QANOV-66199 |
          | 1         | discounts       | QANOV-66200 |
          | any       | account_charges | QANOV-66201 |
          | any       | adjustments     | QANOV-66202 |

  @jira.<jira_id> @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user with several lines associated to their bill can access the <bill_section> in their bill
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill with "several" mobile lines
      And user has events "with" charges in the "<bill_section>" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the eligible msisdn entrypoint in bill
      And the "Bill Concepts" page is displayed
      And clicks on the "any" element in the "<bill_section>" list
     Then the internal webview is displayed
      And the "Bill" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | bill_section        | jira_id     |
          | tariff_charge       | QANOV-66203 |
          | monthly_extras      | QANOV-66204 |
          | charges_adjustments | QANOV-66206 |
          | device_plan         | QANOV-66207 |
          | discounts           | QANOV-66208 |

  @jira.QANOV-204920 @android @cv.13.2 @ios @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario: An AO2 user without payment plan can see the Balance brought forward item in their bill details
    other_affected_versions="2022-15"
    Given user has a "AO2" account type
      And user has bills
      And user does not have charges in the "payment_plan" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "balance_brought_forward_text" textfield with "Balance brought forward" text is displayed
      And the "balance_brought_forward_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed

  @jira.QANOV-204921 @android @cv.13.2 @ios @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk @regression
  @qa @webapp
  Scenario: An AO2 user with payment plan can't see the Balance brought forward item in their bill details
    other_affected_versions="2022-15"
    Given user has a "AO2" account type
      And user has bills
      And user has charges in the "payment_plan" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "balance_brought_forward_text" textfield is not displayed
      And waits until the "total_text" element is visible
      And the "total_text" textfield with "Total" text is displayed
      And the "total_cost" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed

  @jira.QANOV-216379 @android @cv.13.6 @ios @jira.disabled @jira.link.parent_test_plan.QANOV-77438
  @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @o2uk @regression
  Scenario: An AO2 user with a bill available can see a status description
    The status description will only be displayed if it comes through API. It should be displayed under the total
    amount. An example of possible status is: "Please make payment by due date. Log in to My O2 to see how to make a payment."
    Given user has a "AO2 postpay" account type
      And user has bills
      And user has bill status description
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     Then the "status_description_textfield" textfield will be displayed

  @jira.QANOV-355658 @android @ios @jira.link.parent_test_plan.QANOV-24140 @manual @mobile @o2uk @qa @regression
  Scenario: AO2 user with legacy bills is advised to see bills before migration in Billing History
    Given user has a "AO2 postpay" account type
      And user has legacy bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on a month with legacy bill in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
     Then the "Billing Warning" page is displayed
      And the "billing_warning.icon" icon is displayed
      And the "billing_warning.title" textfield with "Just to ket you know" text is displayed
      And the "billing_warning.info" textfield with "You'll need to go to the Billing history page to view your bill and charges" text is displayed
      And the "billing_warning.button" button with "Billing History" text is displayed

  @jira.QANOV-355659 @TBD @android @cert0 @cert1 @ios @jira.link.parent_test_plan.QANOV-24140 @manual @mobile @o2uk @regression
  Scenario: AO2 user with legacy bills can see Billing History
    Given user has a "AO2 postpay" account type
      And user has legacy bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on a month with legacy bill in the bills graph
      And waits until the "bill.see_bill_details_link" element is visible
      And clicks on the "bill.see_bill_details_link" link
      And the "Billing Warning" page is displayed
      And clicks on the "billing_warning.button" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Billing Warning" page is displayed
# -*- coding: utf-8 -*-
@jira.QANOV-126809
Feature: Invoice Module


  @jira.QANOV-5670 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-165898 @mobile @o2uk @smoke
  Scenario: The Bills card will show the empty case when last bill is not available or doesn't exist for legacy users
    internal_checkpoint="to search a user without bills you can check the APIC request
    /{msisdn}/postpay/bill/profile and the response will contain: 'paymentStatus': 'NOBILL'
    CERT0: testuser25@o2.com"
    other_affected_versions="2021-46"
    Given user has a "legacy postpay" account type
      And user has no bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.empty_case.title" textfield with "Latest Airtime Bill" text is displayed
      And the "latest_invoice.empty_case.icon" icon is displayed
      And the "latest_invoice.empty_case.subtitle" textfield with "Your latest airtime bill will appear here once it has been issued" text is displayed
      And the "latest_invoice.empty_case.button" button with "Go to Bills" text is displayed

  @jira.QANOV-5673 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-101232 @live @mobile @next @o2uk @sanity
  Scenario: A legacy postpay user with latest airtime bill available access to dashboard: the bills card will be shown
    internal_checkpoint="The 'latest_invoice.amount' format is '£X.XX'
    CERT0: MBB - test30689357@stf.ref.o2.co.uk (09/06/2021)"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.title" textfield with "Latest Airtime Bill" text is displayed
      And the "latest_invoice.bill_status" textfield is displayed
      And the "latest_invoice.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "latest_invoice.pay_bill_button" button with "Make a payment" text is displayed
      And the "latest_invoice.link" link with "View bill" text is displayed

  @jira.QANOV-5677 @android @automatic @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100681 @mobile @o2uk @qa @regression
  Scenario: A legacy postpay user is able to see the bills card with the last bill available with bill amount 0
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill with "0" charges
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.title" textfield with "Latest Airtime Bill" text is displayed
      And the "latest_invoice.bill_status" textfield is displayed
      And the "latest_invoice.amount" textfield with "£0.00" text is displayed
      And the "latest_invoice.pay_bill_button" button with "Make a payment" text is displayed
      And the "latest_invoice.link" link with "View bill" text is displayed

  @jira.QANOV-5680 @android @automatic @ber @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-165898 @mobile @o2uk @qa @smoke
  Scenario: The Bills card will show the empty case when last bill is not available or doesn't exist for AO2 users
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has no bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.empty_case.title" textfield with "Latest Bill" text is displayed
      And the "latest_invoice.empty_case.icon" icon is displayed
      And the "latest_invoice.empty_case.subtitle" textfield with "Your latest bill will appear here once it has been issued" text is displayed
      And the "latest_invoice.empty_case.button" button with "Go to Bills" text is displayed

  @jira.QANOV-5682 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-24947 @qa
  @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-101232 @mobile @o2uk @sanity
  Scenario: An AO2 user with latest airtime bill available access to dashboard: the bills card will be shown
    latest_invoice.amount format: £X.XX
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.title" textfield with "Latest Bill" text is displayed
      And the "latest_invoice.billing_period" textfield is displayed
      And the "latest_invoice.bill_status" textfield is displayed
      And the "latest_invoice.amount" textfield with the "£(\d+,|)\d+.\d\d" format is displayed
      And the "latest_invoice.pay_bill_button" button with "Make a payment" text is displayed
      And the "latest_invoice.link" link with "View bill" text is displayed

  @jira.QANOV-5684 @android @automation.pending_mock @impeded_mock @ios @jira.cv.13.0
  @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-100681 @manual @mobile @o2uk @regression
  Scenario: An AO2 user is able to see the bills card with the last bill available with bill amount 0
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill with "0" charges
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.title" textfield with "Latest Bill" text is displayed
      And the "latest_invoice.billing_period" textfield is displayed
      And the "latest_invoice.bill_status" textfield is displayed
      And the "latest_invoice.amount" textfield with "£0.00" text is displayed
      And the "latest_invoice.pay_bill_button" button with "Make a payment" text is displayed
      And the "latest_invoice.link" link with "View bill" text is displayed

  @jira.QANOV-5689 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100911 @mobile @netcracker
  @o2uk @regression
  Scenario: The last bill is available and airtime bill amount has a float format
    latest_invoice.amount format: £X.XX
    Given user has a "postpay" account type
      And user has the latest airtime bill with "float" amount format
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.amount" textfield with the "£\d+.\d\d" format is displayed

  @jira.QANOV-5692 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100912 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user is able to see the bills card with the last bill available with negative bill amount
    internal_checkpoint="CERT2: 447711111111@gmail.com
    CERT1: 447521115942/rbmuatlokesh_donotusee2113@stf.ref.o2.co.uk
    latest_invoice.amount format: -£X.XX"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill with "<0" charges
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.title" textfield with "Latest Airtime Bill" text is displayed
      And the "latest_invoice.bill_status" textfield is displayed
      And the "latest_invoice.amount" textfield with the "-£\d+.\d\d" format is displayed
      And the "latest_invoice.pay_bill_button" button with "Make a payment" text is displayed
      And the "latest_invoice.link" link with "View bill" text is displayed

  @jira.QANOV-5697 @android @automation.pending_mock @impeded_mock @ios @jira.cv.13.0
  @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-100912 @manual @mobile @o2uk @regression
  Scenario: An AO2 user is able to see the bills card with the last bill available with negative bill amount
    latest_invoice.amount format: -£X.XX
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill with "<0" charges
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.title" textfield with "Latest Bill" text is displayed
      And the "latest_invoice.billing_period" textfield is displayed
      And the "latest_invoice.bill_status" textfield is displayed
      And the "latest_invoice.amount" textfield with the "-£\d+.\d\d" format is displayed
      And the "latest_invoice.pay_bill_button" button with "Make a payment" text is displayed
      And the "latest_invoice.link" link with "View bill" text is displayed

  @jira.QANOV-5698 @android @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-174497 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user can see the time period of the last bill when invoice has only end date in the bills card when the last bill is available
    internal_checkpoint="latest_invoice.billing_period format: Bill period up to DD Mmm 'YY"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill "without" start date and "with" end date
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.billing_period" textfield with the "^(Bill period up to) \d\d (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d\d" format is displayed

  @jira.QANOV-5700 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-174498
  @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user can see the time period of the last bill when invoice has start and end date in the bills card when the last bill is available
    commented_tags="@depends_on.NOV-101231"
    internal_checkpoint="latest_invoice.billing_period format: DD Mmm 'YY - DD Mmm 'YY"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill "with" start date and "with" end date
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.billing_period" textfield with the "\d\d (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d\d - \d\d (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d\d" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-174499
  @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user should not see the time period of the last bill when invoice only start date or no dates are available in the bills card when the last bill is available
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill "<start_date>" start date and "without" end date
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.billing_period" textfield is not displayed

    @automation.pending_mock @impeded_mock
    Examples:
          | start_date | jira_id    |
          | with       | QANOV-5703 |

    Examples:
          | start_date | jira_id    |
          | without    | QANOV-5704 |

  @jira.QANOV-6205 @android @ios @jira.cv.11.1 @jira.link.detects.OBO2UK-1378 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-101245 @manual @mobile @o2uk @smoke
  Scenario: A legacy user can pay for his/her bill from the dashboard
    commented_tags="@depends_on.NOV-101232"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "latest_invoice.pay_bill_button" button
     Then the internal webview with "O2 | My Bills" header is displayed

  @jira.QANOV-6206 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-101245 @mobile @o2uk @smoke
  Scenario: An AO2 user can pay for his/her bill from the dashboard
    User is first asked to sign in (select a line and enter the code 999999 in cert0)
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "latest_invoice.pay_bill_button" button
      And waits "5" seconds
     Then the internal webview is displayed
      And the header that contains the "Make a payment" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-6364 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100882 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user who has the latest bill in status Unknown can not see any tag in the Bills card
    internal_checkpoint="To test this TC you should check the O2 Middleware response of '/{msisdn}/postpay/bill/profile'"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill in "unknown" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "payment_date" textfield is not displayed
      And the "balance_due" textfield is not displayed
      And the "status_tag" icon is not displayed

  @jira.<jira_id> @<automation> @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100880 @manual @mobile @netcracker
  @o2uk @qa @regression
  Scenario Outline: A <account_type> user who paid the last bill can see a paid tag in the bills card
    internal_checkpoint="CERT1: in00322v_118704@o2.com"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill in "paid" status
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.bill_status" textfield with "Paid" text is displayed

    Examples:
          | account_type | automation              | jira_id    |
          | PAYM         |                         | QANOV-6370 |
          | MBB          | automation.pending_mock | QANOV-6371 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100881 @mobile @o2uk @qa @regression
  Scenario Outline: A <account_type> user who did reach the payment due date without paying can see a specific tag in the Bills card
    internal_checkpoint="CERT0:
    - PAYM: aaa.b@c.om, in01808o_175099@o2.com, inl_may8842@o2.com(447521116559) --> invalid user, without bills
    - MBB: test30689357@stf.ref.o2.co.uk, acce88909351@stf.ref.o2.co.uk
    https://app.zeplin.io/project/5a2bcf19ab11dec6c2ba05b6/screen/5beae42c08d1323cf3fc0c78. Some further explanations
    from Eduardo: When a bill is produced there a user has 14 days to pay it, e.g my bill gets produced on the 16th
    of each month, but I don't have to pay it until 30th of each month, those 14 days are treated as Neutral
    (provided I haven't paid the bill early) after the 30th there is a further 7 days which the status is GRACE if I
    still haven't paid after those 7 days and I still haven't paid the status changes to LATE. Grace and Late are the
    LPF triggers, however there is a slight exception that if the unpaid amount is less that a certain threshold
    £5, then LPF does not apply and therefore Grace/Late do not apply. In this case UNPAID would be the status."
    Given user has a "<account_type>" account type
      And user has the latest airtime bill in "<bill_state>" status
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "latest_invoice.bill_status" textfield with "Overdue" text is displayed

    @netcracker
    Examples:
          | account_type | bill_state | jira_id    |
          | postpay      | grace      | QANOV-6239 |
          | postpay      | late       | QANOV-6240 |

    @automation.pending_mock @impeded_mock @jira.link.parent_test_plan.QANOV-24141
    Examples:
          | account_type   | bill_state | jira_id    |
          | legacy postpay | unpaid     | QANOV-6241 |

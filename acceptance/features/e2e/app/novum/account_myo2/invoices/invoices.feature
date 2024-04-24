# -*- coding: utf-8 -*-
@jira.QANOV-6204
Feature: Invoices


  @jira.QANOV-6208 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5619
  @jira.link.relates_to.NOV-162901 @live @mobile @netcracker @next @o2uk @sanity @webapp @qa
  Scenario: A postpay user with bills for only some months can access Bills screen from the account dashboard
    internal_checkpoint="To check the users bills you can view the request
    /previous/bills and will see the number of bills"
    Given user has a "postpay" account type
      And user has bills for "some" months
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     When clicks on the "latest_invoice.link" link
     Then the "Bills" page is displayed
      And the "Bills" header is displayed
      And the "subtitle" textfield with the "Total billed in (January|February|March|April|May|June|July|August|September|October|November|December)" format is displayed
      And the "total_amount" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "bills_graph" graph is displayed
      And the "last" month is selected in the bills graph
      And the "bill.selected_month" textfield with the "Bill from (January|February|March|April|May|June|July|August|September|October|November|December) \d\d\d\d" format is displayed
      And the "bill.status_text" textfield is displayed
      And the "bill.amount" textfield with the "-?£\d+(?:,\d+)*.\d\d" format is displayed
      And the "bill.make_a_payment_button" button with "Make a payment" text is displayed
      And the "bill.see_bill_details_link" link with "See bill details" text is displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-6209 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162902 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user with bills for the last 6 months access Bills screen
    internal_checkpoint="To check the users bills you can view the request
    /previous/bills and will see the number of bills"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "postpay" account type
      And user has bills for "6" months
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     When clicks on the "bills_card_link" link
     Then the "Bills" page is displayed
      And the "Bills" header is displayed
      And the "subtitle" textfield with the "Total billed in MONTH" format is displayed
      And the "total_amount" textfield with the "£XX.XX" format is displayed
      And the "bills_graph" graph is displayed
      And the "last" month is selected in the bills graph
      And the "bill.selected_month" textfield with the "Bill from Month YYYY" format is displayed
      And the "bill.status_text" textfield is displayed
      And the "bill.amount" textfield with the "£XX.XX" format is displayed
      And the "bill.make_a_payment_button" button with "Make a payment" text is displayed
      And the "bill.see_bill_details_link" link with "See bill details" text is displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed

  @jira.QANOV-6210 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208 @jira.link.depends_on.QANOV-6209
  @jira.link.depends_on.QANOV-6218 @jira.link.relates_to.NOV-162905 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can see a bill with zero amount in the Bills screen
    To check the users bills you can view the request /previous/bills and will see the number of bills
    Given user has a "postpay" account type
      And user has a bill with "0" charges
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on a bill with "0" charges
     Then the "Bills" page is displayed
      And the "Bills" header is displayed
      And the "subtitle" textfield with the "Total billed in MONTH_SELECTED" format is displayed
      And the "total_amount" textfield with the "£0.00" format is displayed
      And the "bills_graph" graph is displayed
      And the months in "short" format are displayed in the "bills_graph" graph
      And the "selected_month" in the "bills_graph" with empty line is displayed
      And the "bill.selected_month" textfield with the "Bill from Month YYYY" format is displayed
      And the "bil.status_text" textfield is displayed
      And the "bill.amount" textfield with the "£0.00" format is displayed
      And the "bill.make_a_payment_button" button with "Make a payment" text is displayed
      And the "bill.see_bill_details_link" link with "See bill details" text is displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed

  @jira.QANOV-6211 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208 @jira.link.depends_on.QANOV-6209
  @jira.link.depends_on.QANOV-6218 @jira.link.relates_to.NOV-162904 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can see a negative amount for a month in the Bills screen
    internal_checkpoint="To check the users bills you can view the request /previous/bills and will see the number of bills
    CERT0: rbmuatlokesh_donotusee2113@stf.ref.o2.co.uk
    CERT0: inavl0ww_878541@o2.com"
    Given user has a "postpay" account type
      And user has a bill with "<0" charges
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on a bill with "<0" charges
     Then the "Bills" page is displayed
      And the "Bills" header is displayed
      And the "subtitle" textfield with the "Total billed in MONTH_SELECTED" format is displayed
      And the "total_amount" textfield with the "-£XX.XX" format is displayed
      And the "bills_graph" graph is displayed
      And the months in "short" format are displayed in the "bills_graph" graph
      And the "selected_month" in the "bills_graph" with an inverse line is displayed
      And the "bill.selected_month" textfield with the "Bill from Month YYYY" format is displayed
      And the "bill.status_text" textfield is displayed
      And the "bill.amount" textfield with the "-£XX.XX" format is displayed
      And the "bill.make_a_payment_button" button with "Make a payment" text is displayed
      And the "bill.see_bill_details_link" link with "See bill details" text is displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed

  @jira.QANOV-6212 @android @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-6208 @jira.link.depends_on.QANOV-6209
  @jira.link.detects.OBO2UK-1378 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100915
  @jira.link.relates_to.NOV-162910 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay user can pay his/her bill from the Bills screen
    Given user has a "legacy postpay" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "bill.make_a_payment_button" button
     Then the "Make A Payment" internal webview is displayed
      And the "O2 | My Bills" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-6213 @android @ios @jira.cv.13.0 @jira.link.depends_on.QANOV-6208 @jira.link.depends_on.QANOV-6209
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-100915 @jira.link.relates_to.NOV-162910 @manual
  @mobile @o2uk @smoke
  Scenario: An AO2 postpay user can pay his/her bill from the Bills screen
    User is first asked to sign in (select a line and enter the code 999999 in cert0)
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "bill.make_a_payment_button" button
     Then the internal webview is displayed
      And the "O2 | Accounts" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-6216 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208
  @jira.link.depends_on.QANOV-6209 @jira.link.relates_to.NOV-164519 @live @mobile @netcracker @next @o2uk @smoke @qa
  Scenario: A legacy postpay user can access to Airtime rewards website from the Bills screen
    internal_checkpoint="the airtime rewards url is https://myo2.airtimerewards.co.uk"
    commented_tags="@depends_on.NOV-164518"
    Given user has a "legacy postpay" account type
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "airtime_rewards.chevron" entrypoint
     Then the browser webview with "Airtime Rewards | My O2" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Bills" page is displayed

  @jira.QANOV-6218 @android @automatic @ber @qa @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208
  @jira.link.depends_on.QANOV-6209 @jira.link.relates_to.NOV-162903 @live @mobile @netcracker @next @o2uk @regression
  @webapp @cert0
  Scenario: A postpay user can select another month in the Bills screen
    To check the users bills you can view the request /previous/bills and will see the number of bills
    Given user has a "postpay" account type
      And user has bills for "several" months
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on a different month in the bills graph
     Then the "Bills" header is displayed
      And the "subtitle" textfield with the "Total billed in (January|February|March|April|May|June|July|August|September|October|November|December)" format is displayed
      And the "total_amount" textfield with the "(-?£\d+(?:,\d+)*.\d\d|-.--)" format is displayed
      And the "bills_graph" graph is displayed
      And the eligible month is selected in the bills graph
      And the "bill" module is displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed

  @jira.QANOV-6229 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208 @jira.link.depends_on.QANOV-6209
  @jira.link.relates_to.NOV-162907 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can see a paid bill in the Latest airtime bill in the Bills screen
    internal_checkpoint="To check the bill you can view the request '/{msisdn}/postpay/bill/profile?billnumber=
    {billNumber}' and the billNumber can be seen in the /previous/bills request
    CERT0: testuser28@o2.com"
    Given user has a "postpay" account type
      And user has the latest airtime bill in "paid" status
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "5" month in the bills graph
     Then the "bill.paid_icon" icon is displayed
      And the "bill.status_text" textfield with "PAID" text is displayed

  @jira.QANOV-6230 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208 @jira.link.depends_on.QANOV-6209
  @jira.link.relates_to.NOV-162908 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can see an overdue bill in the Bills screen
    internal_checkpoint="To check the bill you can view the request '/{msisdn}/postpay/bill/profile?billnumber=
    {billNumber}' and the billNumber can be seen in the /previous/bills request
    CERT0: inl_may8842@o2.com(447521109498) --> invalid user, without bills"
    Given user has a "postpay" account type
      And user has the latest airtime bill in "overdue" status
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "5" month in the bills graph
     Then the "bill.overdue_icon" icon is displayed
      And the "bill.status_text" textfield with "OVERDUE" text is displayed

  @jira.QANOV-6231 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-6208
  @jira.link.depends_on.QANOV-6209 @jira.link.relates_to.NOV-162909 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user can see a pending payment bill in the Bills screen
    internal_checkpoint="To check the bill you can view the request '/{msisdn}/postpay/bill/profile?billnumber=
    {billNumber}' and the billNumber can be seen in the /previous/bills request. The request should return
    billPaymentStatus UNPAID and the payment_date must not be in the past. CERT0 07521130461 in inl_may8842@o2.com --> invalid user, without bills"
    Given user has a "postpay" account type
      And user has the latest airtime bill in "pending_payment" status
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "5" month in the bills graph
     Then the "bill.pending_icon" icon is displayed
      And the "bill.status_text" textfield with the "PAYMENT DUE ON DD Mmm 'YY" format is displayed

  @jira.QANOV-6235 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100883 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user who did not reach the payment due date (neutral) can not see any tag in the Bills card
    internal_checkpoint="To test this TC you should check the O2 Middleware response
    of '/{msisdn}/postpay/bill/profile' and the user in Neutral status will have 'paymentStatus': 'NEUTRAL'.
    Some further explanations from Eduardo: When a bill is produced there a user has 14 days to pay it, e.g my bill
    gets produced on the 16th of each month, but I dont have to pay it until 30th of each month, those 14 days are
    treated as Neutral (provided I haven't paid the bill early).
    After the 30th there is a further 7 days which the status is GRACE, if I still haven't paid after those 7 days and
    I still haven't paid the status changes to LATE.
    Grace and Late are the LPF triggers, however there is a slight exception that if the unpaid amount is less that a
    certain threshold £5, then LPF does not apply and therefore Grace/Late do not apply. In this case UNPAID would be
    the status."
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill in "neutral" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     Then the "bill_paid_status" icon is not displayed
      And the "bill_text_status" textfield is not displayed

  @jira.QANOV-6237 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100884 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user who did not reach the payment due date (neutral) can not see any badge/tag in the billing details
    internal_checkpoint="To test this TC you should check the O2 Middleware response
    of '/{msisdn}/postpay/bill/profile' and the user in Neutral status will have 'paymentStatus': 'NEUTRAL'. Some
    further explanations from Eduardo: When a bill is produced there a user has 14 days to pay it, e.g my bill gets
    produced on the 16th of each month, but I dont have to pay it until 30th of each month, those 14 days are treated
    as Neutral (provided I haven't paid the bill early), after the 30th there is a further 7 days which the status is
    GRACE if I still haven't paid after those 7 days and I still haven't paid the status changes to LATE. Grace and
    Late are the LPF triggers, however there is a slight exception that if the unpaid amount is less that a certain
    threshold £5, then LPF does not apply and therefore Grace/Late do not apply. In this case UNPAID would be the
    status."
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill in "neutral" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "bill_text_status" textfield is not displayed

  @jira.QANOV-6356 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-162906 @manual @mobile @netcracker @o2uk @smoke
  Scenario: A postpay user without bills in a month cannot see them in the Bills screen
    internal_checkpoint="To check the users bills you can view the request /previous/bills and will see the number of bills"
    other_affected_versions="2021-46"
    Given user has a "postpay" account type
      And user has a month with "no" bill
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on the month with "no" bill in the "bills_graph" graph
     Then the "subtitle" textfield with the "Total billed in MONTH" format is displayed
      And the "total_amount" textfield with "-.--" text is displayed
      And the "bill.empty_case_icon" icon is displayed
      And the "bill.empty_case_title" textfield with "[LANG:bills.month_without_bills.bills_empty_case_title]" text is displayed
      And the "bill.empty_case_subtitle" textfield with "[LANG:bills.month_without_bills.bills_empty_case_subtitle]" text is displayed
      And the "bill.see_bill_details_link" button is not displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed

  @jira.QANOV-6359 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-164518 @manual @mobile @netcracker @o2uk @smoke
  Scenario: A postpay user without bills access Bills screen
    internal_checkpoint="
    to search a user without bills you can check the APIC request /{msisdn}/postpay/bill/profile and the response will contain: 'paymentStatus': 'NOBILL'
    - CERT0: inavl0ww_878541@o2.com"
    other_affected_versions="2021-46"
    Given user has a "postpay" account type
      And user has bills for "no" months
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "airtime-rewards" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     When clicks on the "latest_invoice.empty_case.button" link
     Then the "Bills" page is displayed
      And the "Bills" header is displayed
      And the "bills_graph" graph is not displayed
      And the "bill.empty_case_icon" icon is displayed
      And the "bill.empty_case_title" textfield with "[LANG:bills.month_without_bills.bills_empty_case_title]" text is displayed
      And the "bill.empty_case_subtitle" textfield with "[LANG:bills.month_without_bills.bills_empty_case_subtitle]" text is displayed
      And the "bill.see_bill_details_link" button is not displayed
      And the "airtime_rewards.image" icon is displayed
      And the "airtime_rewards.title" textfield with "Visit Airtime Rewards" text is displayed
      And the "airtime_rewards.subtitle" textfield with "to save money off your bill" text is displayed
      And the "airtime_rewards.chevron" icon is displayed

  @jira.QANOV-6421 @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100860 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user can see the same Amount to be paid on the Bills card and in the Latest Airtime Bill screen
    Given user has a "postpay" account type
      And user has the latest airtime bill available
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user has the "invoices-header" module configured in CMS for "invoices-list" page
      And user is in the "Account" page
     When saves the "bill_amount_to_be_paid" textfield in the "BILL_CARD_AMOUNT_TO_BE_PAID" variable
      And clicks on the "bills_card_link" link
      And the "Bills" page is displayed
      And clicks on "5" month in the bills graph
     Then the "total_amount" textfield with "BILL_CARD_AMOUNT_TO_BE_PAID" text is displayed
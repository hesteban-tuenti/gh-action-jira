# -*- coding: utf-8 -*-
@jira.QANOV-126813
Feature: Device Plan Module


  @jira.QANOV-5715 @android @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100954 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: User without a device plan can not see the Device plan card
    internal_checkpoint="It is considered that a user does not have a device plan when the
    response to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    has ccaStatus = CANCELLED
    has ccaStatus = NEW
    CERT0: sandeepumredkar@mailinator.com"
    Given user has a "postpay" account type
      And user has no device plan
      And user has the matching subscription selected in the account
      And user has any of the "device-plan-legacy,device-plan-ao2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "device_plan_card" module is not displayed

  @jira.QANOV-5717 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.1 @jira.link.relates_to.NOV-113279
  @manual @mobile @netcracker @o2uk @regression
  Scenario: User won't see the device plan when there's no device plan information available
    internal_checkpoint="Note: we consider that there is no device plan information available when
    the /{msisdn}/postpay/bill/cca/phoneplan returns error
    Tested with 07731296919 o2smartdrive+tt01@gmail.com in CERT1
    NOTE: user 011111081@gmail.com / password or user  011111088@gmail.com / password"
    Given user has a "postpay" account type
      And user has no available information of device plan
      And user has the matching subscription selected in the account
      And user has any of the "device-plan-legacy,device-plan-ao2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "device_plan_module" module is not displayed

  @jira.QANOV-5713 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-150712 @mobile @o2uk @sanity @webapp
  Scenario: A legacy user with device plan in overdue status accesses the account dashboard
    It is considered that a user does have a device plan in
    'overdue' status when the response to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    has ccaStatus = ACTIVE and has paymentStatus = UNPAID
    CERT0: inavl0ww_878541@o2.com (07731296925)
    commented_tags="@depends_on.NOV-150713"
    Given user has a "legacy postpay" account type
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "device_plan_card" element is visible
     Then the "device_plan_card.title" textfield with "[CONTEXT:device_name]" text is displayed
      And the "device_plan_card.overdue_status" icon is displayed
      And the "device_plan_card.text_status" textfield with "Overdue" text is displayed
      And the "device_plan_card.installment_amount" textfield is displayed
      And the "device_plan_card.progress_bar" progress bar is displayed
      And the "device_plan_card.amount_to_pay" textfield is displayed
      And the "device_plan_card.link" link with "View details" text is displayed

  @jira.QANOV-84641 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.parent_test_plan.QANOV-24947 @live @mobile @next @o2uk @sanity @qa @webapp
  Scenario: An AO2 user with device plan in overdue status accesses the account dashboard
    CERTO: xamexe4993@grokleft.com
    Given user has a "AO2 postpay" account type
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "device_plan_card.title" textfield with "[CONTEXT:device_name]" text is displayed
      And the "device_plan_card.overdue_status" icon is not displayed
      And the "device_plan_card.text_status" textfield is not displayed
      And the "device_plan_card.progress_bar" progress bar is displayed
      And the "device_plan_card.amount_to_pay" textfield is displayed
      And the "device_plan_card.link" link with "View details" text is displayed

  @jira.QANOV-5718 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100950 @mobile @o2uk @regression @webapp
  Scenario: A legacy user with fully paid device plan can see the device plan details in the Account Dashboard
    internal_checkpoint="It is considered that a user does have a device plan in 'fully paid' status when
    the response to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan has ccaStatus = CLOSED. CERT0 - testuser25@o2.com"
    Given user has a "legacy postpay" account type
      And user has the device plan in "fully_paid" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "device_plan_card" element is visible
     Then the "device_plan_card.title" textfield with "Monthly Device Plan" text is displayed
      And the "device_plan_card.paid_status" icon is displayed
      And the "device_plan_card.text_status" textfield with "Fully Paid" text is displayed
      And the "device_plan_card.fully_paid_text" textfield with "You have paid off your device plan" text is displayed

  @jira.QANOV-5721 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-150701 @mobile @o2uk @regression @webapp
  Scenario: A legacy user with device plan in paid status accesses the account dashboard
    It is considered that a user does have a device plan in 'paid' status when
    the response to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan has ccaStatus = ACTIVE and has paymentStatus = PAID or  has ccaSatus = PENDING_CLOSURE and has paymentStatus = PAID
    device_plan_card.installment_amount format: £X.XX
    CERT0: in00322v_432556@o2.com (07521008652)
    Given user has a "legacy postpay" account type
      And user has the device plan in "paid" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "device_plan_card" element is visible
     Then the "device_plan_card.title" textfield with "[CONTEXT:device_name]" text is displayed
      And the "device_plan_card.paid_status" icon is displayed
      And the "device_plan_card.text_status" textfield with "Paid" text is displayed
      And the "device_plan_card.installment_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "device_plan_card.progress_bar" progress bar is displayed
      And the "device_plan_card.amount_to_pay" textfield is displayed
      And the "device_plan_card.link" link with "View details" text is displayed

  @jira.QANOV-84642 @android @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140 @manual @mobile @o2uk
  @regression
  Scenario: An AO2 user with device plan in paid status accesses the account dashboard
    Given user has a "AO2 postpay" account type
      And user has the device plan in "paid" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "device_plan_card.title" textfield with "[CONTEXT:device_name]" text is displayed
      And the "device_plan_card.paid_status" icon is not displayed
      And the "device_plan_card.text_status" textfield is not displayed
      And the "device_plan_card.installment_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "device_plan_card.progress_bar" progress bar is displayed
      And the "device_plan_card.amount_to_pay" textfield is displayed
      And the "device_plan_card.link" link with "View details" text is displayed

  @jira.QANOV-5722 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-150708
  @manual @mobile @o2uk @regression
  Scenario: A legacy user with device plan in pending payment status accesses the account dashboard
    internal_checkpoint="It is considered that a user does have a device plan in 'pending payment'
    status when the response to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    has ccaStatus = ACTIVE and has paymentStatus = NEUTRAL
    device_plan_card.text_status format: Payment due on DD Mmm'YY"
    Given user has a "legacy postpay" account type
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "device_plan_card.title" textfield with "Monthly Device Plan" text is displayed
      And the "device_plan_card.pending_status" icon is displayed
      And the "device_plan_card.text_status" textfield with the "Payment due on \d\d [A-z]{3}'\d\d" format is displayed
      And the "device_plan_card.installment_amount" textfield is displayed
      And the "device_plan_card.progress_bar" progress bar is displayed
      And the "device_plan_card.amount_to_pay" textfield is displayed
      And the "device_plan_card.link" link with "View details" text is displayed

  @jira.QANOV-84643 @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140 @manual @mobile @o2uk @regression
  Scenario: An AO2 user with device plan in pending payment status accesses the account dashboard
    Given user has a "AO2 postpay" account type
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "device_plan_card.title" textfield with "[CONTEXT:device_name]" text is displayed
      And the "device_plan_card.pending_status" icon is not displayed
      And the "device_plan_card.text_status" textfield is not displayed
      And the "device_plan_card.installment_amount" textfield is displayed
      And the "device_plan_card.progress_bar" progress bar is displayed
      And the "device_plan_card.amount_to_pay" textfield is displayed
      And the "device_plan_card.link" link with "View details" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @jira.link.detects.OBO2UK-1421
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user can access to the SIM-free financing device webview
    For legacy, a device account type is only sim-free and for AO2 is sim-free and EECC
    other_affected_versions="2021-07, 2022-23"
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "device-plan-<cms-account>" module configured in CMS for "dashboard" page for the "sim-free-finance" product
      And user is in the "Account" page
     When clicks on the "sim_free_device_plan.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

    Examples:
          | account_type  | header            | cms-account | cv   | parent_test_plan                     | detects   | jira_id     |
          | legacy device | O2 \| Device plan | legacy      | 12.0 | QANOV-24141:QANOV-35253              | O2UK-4389 | QANOV-37486 |
          | AO2 device    | Device plan       | ao2         | 13.1 | QANOV-77438:QANOV-35253:QANOV-178803 |           | QANOV-98328 |

# -*- coding: utf-8 -*-
@jira.QANOV-7805
Feature: Device Plan

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.<jira_id> @android @ios @jira.cv.9.11 @jira.link.depends_on.QANOV-7806 @jira.link.detects.OBO2UK-989
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-91779 @mobile @no_automatable @o2uk @regression
  Scenario Outline: User can upgrade
    internal_checkpoint="CERT1:
    'Upgrade now': acce32044476@stf.ref.o2.co.uk"
    Given user has a "legacy" account type
      And user has the matching subscription selected in the account
      And user is in the "Upgrade Options" page
     When clicks on the "<upgrade_option>" button
      And follows the steps to upgrade
     Then the device plan is upgraded

    Examples:
          | upgrade_option      | jira_id    |
          | upgrade_now         | QANOV-7808 |
          | pay_off_and_upgrade | QANOV-7810 |

  @jira.QANOV-7813 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-150713 @mobile @o2uk @sanity @webapp
  Scenario: A legacy postpay user with device plan in overdue status can access the device plan details screen
    It is considered that a user does have a device plan in 'overdue' status when the response
    to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    - has ccaStatus = ACTIVE and has paymentStatus = UNPAID
    relative path to the 'Device plan payment' webview: /sso/paydevice
    CERT0: inavl0ww_878541@o2.com (07731296925)
    other_affected_versions="2022-18"
    commented_tags="@depends_on.NOV-150712"
    Given user has a "legacy postpay" account type
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "device-plan-header" module configured in CMS for "device-plan" page
      And user has the "device-plan-rows" module configured in CMS for "device-plan" page
      And user is in the "Account" page
      And waits until the "device_plan_card" element is visible
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.title" textfield is displayed
      And the "device_plan_information.pretitle" textfield with "Overdue" text is displayed
      And the "device_plan_information.description" textfield with the "£\d+.\d\d" format is displayed
      And the "device_plan_information.button" button with "Make a payment" text is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.info" icon is displayed
      And the element in "0" position in the "repayment.list" list has the "title" field with the "Status" text
      And the element in "0" position in the "repayment.list" list has the "value" field with the "Overdue" text
      And the element in "1" position in the "repayment.list" list has the "title" field with the "Monthly repayment" text
      And the element in "1" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "2" position in the "repayment.list" list has the "title" field with the "Paid to date" text
      And the element in "2" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "3" position in the "repayment.list" list has the "title" field with the "Total left to pay" text
      And the element in "3" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "4" position in the "repayment.list" list has the "title" field with the "Payment due on" text
      And the element in "4" position in the "repayment.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the element in "0" position in the "device_plan.list" list has the "title" field with the "Device model" text
      And the element in "1" position in the "device_plan.list" list has the "title" field with the "Device Plan" text
      And the element in "2" position in the "device_plan.list" list has the "title" field with the "Duration of plan" text
      And the element in "2" position in the "device_plan.list" list has the "value" field with the "\d+ months" format
      And the element in "3" position in the "device_plan.list" list has the "title" field with the "Device plan start date" text
      And the element in "3" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "4" position in the "device_plan.list" list has the "title" field with the "Device plan end date" text
      And the element in "4" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "5" position in the "device_plan.list" list has the "title" field with the "Total credit" text
      And the element in "5" position in the "device_plan.list" list has the "value" field with the "£(\d+|\d+,\d{3}).\d\d" format
      And the element in "6" position in the "device_plan.list" list has the "title" field with the "APR*" text
      And the element in "6" position in the "device_plan.list" list has the "value" field with the "\d.\d\d %" format
      And the "device_plan.footer_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-225477 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-150713 @mobile @o2uk @qa @sanity @webapp
  Scenario: An AO2 user with only 1 device in their device plan and in overdue status can access the device plan details screen
    Given user has a "AO2 postpay" account type
      And user has a device plan with "1" devices
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "device_plan_card" element is visible
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.title" textfield is displayed
      And the "device_plan_information.pretitle" textfield with "Overdue" text is displayed
      And the "device_plan_information.description" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.info" icon is displayed
      And the element in "0" position in the "repayment.list" list has the "title" field with the "Status" text
      And the element in "0" position in the "repayment.list" list has the "value" field with the "Overdue" text
      And the element in "1" position in the "repayment.list" list has the "title" field with the "Monthly repayment" text
      And the element in "1" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "2" position in the "repayment.list" list has the "title" field with the "Paid to date" text
      And the element in "2" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "3" position in the "repayment.list" list has the "title" field with the "Total left to pay" text
      And the element in "3" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "4" position in the "repayment.list" list has the "title" field with the "Payment due on" text
      And the element in "4" position in the "repayment.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the element in "0" position in the "device_plan.list" list has the "title" field with the "Device model" text
      And the element in "1" position in the "device_plan.list" list has the "title" field with the "Device Plan" text
      And the element in "2" position in the "device_plan.list" list has the "title" field with the "Duration of plan" text
      And the element in "2" position in the "device_plan.list" list has the "value" field with the "\d+ months" format
      And the element in "3" position in the "device_plan.list" list has the "title" field with the "Device plan start date" text
      And the element in "3" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "4" position in the "device_plan.list" list has the "title" field with the "Device plan end date" text
      And the element in "4" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "5" position in the "device_plan.list" list has the "title" field with the "Total credit" text
      And the element in "5" position in the "device_plan.list" list has the "value" field with the "£(\d+|\d+,\d{3}).\d\d" format
      And the element in "6" position in the "device_plan.list" list has the "title" field with the "APR*" text
      And the element in "6" position in the "device_plan.list" list has the "value" field with the "\d+.\d\d %" format
      And the element in "7" position in the "device_plan.list" list has the "title" field with the "More device plan details" text
      And the element in "7" position of the "device_plan.list" list has the "chevron" field
      And the "device_plan.footer_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-225478 @android @cert0 @cert1 @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-132515 @manual @mobile @o2uk
  @smoke @jira.disabled
  Scenario: An AO2 user with more than one device in their device plan and in overdue status can access the device plan details screen
    Given user has a "AO2 postpay" account type
      And user has a device plan with ">1" device
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.title" textfield with "Overdue" text is displayed
      And the "device_plan_information.pretitle" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.status.title" textfield with "Status" text is displayed
      And the "repayment.status.value" textfield with "Overdue" text is displayed
      And the "repayment.installment_amount.title" textfield with "Monthly repayment" text is displayed
      And the "repayment.installment_amount.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.paid_to_date.title" textfield with "Paid to date" text is displayed
      And the "repayment.paid_to_date.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.bill_date.title" textfield with "Payment due on" text is displayed
      And the "repayment.bill_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the "device_plan.duration.title" textfield with "Duration of plan" text is displayed
      And the "device_plan.duration.value" textfield with the "\d+ months" format is displayed
      And the "device_plan.start_date.title" textfield with "Device plan start date" text is displayed
      And the "device_plan.start_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.end_date.title" textfield with "Device plan end date" text is displayed
      And the "device_plan.end_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.total_credit.title" textfield with "Total credit" text is displayed
      And the "device_plan.total_credit.value" textfield with the "£(\d+|\d+,\d{3}).\d\d" format is displayed
      And the "device_plan.apr.title" textfield with "APR*" text is displayed
      And the "device_plan.apr.value" textfield with the "\d.\d\d %" format is displayed
      And the "device_plan.more_details.title" textfield with "More device plan details" text is displayed
      And the "device_plan.more_details.chevron" icon is displayed
      And the "devices_included.title" textfield with "DEVICES" text is displayed
      And the "devices_included.devices_list" list is displayed
      And each element in the "devices_included.devices_list" list has the "device_name" field
      And the "device_plan.apr_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed
      And the "device_plan_regulation_information" textfield with "Telefonica UK Limited is authorised and regulated by the Financial Conduct Authority (Reference Number 718822)" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-7814 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.9.8 @jira.link.depends_on.QANOV-7813
  @jira.link.detects.OBO2UK-1368 @jira.link.detects.OBO2UK-1378 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-91823 @mobile @o2uk @smoke
  Scenario: A legacy user with a device plan in overdue status taps on make a payment button in the device plan details screen
    internal_checkpoint="The payment check is necessary to verify that the user is authenticated
    it is considered that a user does have a device plan in 'overdue' status when the response
    to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    - has ccaStatus = ACTIVE and has paymentStatus = UNPAID
    relative path to the 'Device plan payment' webview: /sso/paydevice"
    Given user has a "legacy" account type
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "device_plan_information.button" button
     Then the internal webview with "O2 | My Bills" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Device Plan" page is displayed

  @jira.QANOV-7815 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7813
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-91823 @mobile @o2uk @smoke @jira.disabled
  Scenario: An AO2 user with a device plan in overdue status taps on make a payment button in the device plan details screen
    Given user has a "AO2" account type
      And user has the device plan in "overdue" status
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "device_plan_information.button" button
     Then the internal webview is displayed
      And the "Make a payment | My O2" header is displayed
      And the "Balance" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Device Plan" page is displayed
      
  @jira.QANOV-7817 @android @automatic @ber @ios @jira.cv.11.4 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-150709 @mobile @o2uk @qa @regression @webapp
  Scenario: A legacy postpay user with device plan in pending status can access the device plan details screen
    It is considered that a user does have a device plan in 'pending' status when the response
    to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    - has ccaStatus = ACTIVE and has paymentStatus = NEUTRAL
    relative path to the 'Device plan payment' webview: /sso/paydevice
    other_affected_versions="2022-18"
    commented_tags="@depends_on.NOV-150708"
    Given user has a "legacy postpay" account type
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "device-plan-header" module configured in CMS for "device-plan" page
      And user has the "device-plan-rows" module configured in CMS for "device-plan" page
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.title" textfield is displayed
      And the "device_plan_information.pretitle" textfield with the "Payment due on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan_information.description" textfield with the "£(\d,|)\d+.\d\d" format is displayed
      And the "device_plan_information.button" button with "Make a payment" text is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.info" icon is displayed
      And the element in "0" position in the "repayment.list" list has the "title" field with the "Status" text
      And the element in "0" position in the "repayment.list" list has the "value" field with the "Payment due on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "1" position in the "repayment.list" list has the "title" field with the "Monthly repayment" text
      And the element in "1" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "2" position in the "repayment.list" list has the "title" field with the "Paid to date" text
      And the element in "2" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "3" position in the "repayment.list" list has the "title" field with the "Total left to pay" text
      And the element in "3" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "4" position in the "repayment.list" list has the "title" field with the "Payment due on" text
      And the element in "4" position in the "repayment.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the element in "0" position in the "device_plan.list" list has the "title" textfield with the "Device model" text
      And the element in "1" position in the "device_plan.list" list has the "title" textfield with the "Device Plan" text
      And the element in "2" position in the "device_plan.list" list has the "title" textfield with the "Duration of plan" text
      And the element in "2" position in the "device_plan.list" list has the "value" field with the "\d+ months" format
      And the element in "3" position in the "device_plan.list" list has the "title" textfield with the "Device plan start date" text
      And the element in "3" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "4" position in the "device_plan.list" list has the "title" textfield with the "Device plan end date" text
      And the element in "4" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "5" position in the "device_plan.list" list has the "title" textfield with the "Total credit" text
      And the element in "5" position in the "device_plan.list" list has the "value" field with the "£(\d+|\d+,\d{3}).\d\d" format
      And the element in "6" position in the "device_plan.list" list has the "title" textfield with the "APR*" text
      And the element in "6" position in the "device_plan.list" list has the "value" field with the "\d.\d\d %" format
      And the "device_plan.footer_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed

  @jira.QANOV-225479 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-150709 @mobile @o2uk @qa @regression @webapp
  Scenario: An AO2 postpay user with only one device in the device plan and in pending status can access the device plan details screen
    Given user has a "AO2 postpay" account type
      And user has a device plan with "1" devices
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.title" textfield is displayed
      And the "device_plan_information.pretitle" textfield with the "Payment due on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan_information.description" textfield with the "£(\d,|)\d+.\d\d" format is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.info" icon is displayed
      And the element in "0" position in the "repayment.list" list has the "title" field with the "Status" text
      And the element in "0" position in the "repayment.list" list has the "value" field with the "Payment due on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "1" position in the "repayment.list" list has the "title" field with the "Monthly repayment" text
      And the element in "1" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "2" position in the "repayment.list" list has the "title" field with the "Paid to date" text
      And the element in "2" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "3" position in the "repayment.list" list has the "title" field with the "Total left to pay" text
      And the element in "3" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "4" position in the "repayment.list" list has the "title" field with the "Payment due on" text
      And the element in "4" position in the "repayment.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the element in "0" position in the "device_plan.list" list has the "title" textfield with the "Device model" text
      And the element in "1" position in the "device_plan.list" list has the "title" textfield with the "Device Plan" text
      And the element in "2" position in the "device_plan.list" list has the "title" textfield with the "Duration of plan" text
      And the element in "2" position in the "device_plan.list" list has the "value" field with the "\d+ months" format
      And the element in "3" position in the "device_plan.list" list has the "title" textfield with the "Device plan start date" text
      And the element in "3" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "4" position in the "device_plan.list" list has the "title" textfield with the "Device plan end date" text
      And the element in "4" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "5" position in the "device_plan.list" list has the "title" textfield with the "Total credit" text
      And the element in "5" position in the "device_plan.list" list has the "value" field with the "£(\d+|\d+,\d{3}).\d\d" format
      And the element in "6" position in the "device_plan.list" list has the "title" textfield with the "APR*" text
      And the element in "6" position in the "device_plan.list" list has the "value" field with the "\d.\d\d %" format
      And the element in "7" position in the "device_plan.list" list has the "title" field with the "More device plan details" text
      And the element in "7" position of the "device_plan.list" list has the "chevron" field
      And the "device_plan.footer_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed

  @jira.QANOV-225480 @android @cert0 @cert1 @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-132515
  @jira.link.relates_to.NOV-150713 @manual @mobile @o2uk @smoke @jira.disabled
  Scenario: An AO2 user with more than 1 device in their device plan and in pending payment status can access the device plan details screen
    Given user has a "AO2 postpay" account type
      And user has a device plan with ">1" device
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.status" textfield with "Payment due on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" text is displayed
      And the "device_plan_information.installment_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.status.title" textfield with "Status" text is displayed
      And the "repayment.status.value" textfield with "Payment due on (0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" text is displayed
      And the "repayment.installment_amount.title" textfield with "Monthly repayment" text is displayed
      And the "repayment.installment_amount.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.paid_to_date.title" textfield with "Paid to date" text is displayed
      And the "repayment.paid_to_date.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.bill_date.title" textfield with "Payment due on" text is displayed
      And the "repayment.bill_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the "device_plan.duration.title" textfield with "Duration of plan" text is displayed
      And the "device_plan.duration.value" textfield with the "\d+ months" format is displayed
      And the "device_plan.start_date.title" textfield with "Device plan start date" text is displayed
      And the "device_plan.start_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.end_date.title" textfield with "Device plan end date" text is displayed
      And the "device_plan.end_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.total_credit.title" textfield with "Total credit" text is displayed
      And the "device_plan.total_credit.value" textfield with the "£\d+(,\d{3}|).\d\d" format is displayed
      And the "device_plan.apr.title" textfield with "APR*" text is displayed
      And the "device_plan.apr.value" textfield with the "\d.\d\d %" format is displayed
      And the "device_plan.more_details.title" textfield with "More device plan details" text is displayed
      And the "device_plan.more_details.chevron" icon is displayed
      And the "devices_included.title" textfield with "DEVICES" text is displayed
      And the "devices_included.devices_list" list is displayed
      And each element in the "devices_included.devices_list" list has the "device_name" field
      And the "device_plan.apr_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed
      And the "device_plan_regulation_information" textfield with "Telefonica UK Limited is authorised and regulated by the Financial Conduct Authority (Reference Number 718822)" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-7818 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.4 @jira.link.depends_on.QANOV-7817
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-150710 @manual @mobile @o2uk @regression
  Scenario: A legacy user with device plan in pending status taps on make a payment button in the device plan details screen
    internal_checkpoint="it is considered that a user does have a device plan in 'pending' status when the response
    to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    - has ccaStatus = ACTIVE and has paymentStatus = NEUTRAL
    relative path to the 'Device plan payment' webview: /sso/paydevice"
    Given user has a "legacy" account type
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "device_plan_information.make_payment" button
     Then the internal webview is displayed
      And the user is authenticated
      And make a payment out of schedule is available

  @jira.QANOV-7819 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7817 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-150710 @manual @mobile @o2uk @regression
  Scenario: An AO2 user with device plan in pending status taps on make a payment button in the device plan details screen
    Given user has a "AO2" account type
      And user has the device plan in "pending_payment" status
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "device_plan_information.make_payment" button
     Then the internal webview is displayed
      And the "O2 | My Bills" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Device Plan" page is displayed

  @jira.QANOV-7823 @android @automatic @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-150702 @mobile @o2uk @regression @webapp
  Scenario: A legacy postpay user with device plan in paid status accesses the device plan details screen
    It is considered that a user does have a device plan in 'paid' status when the response
    to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    - has ccaStatus = ACTIVE and has paymentStatus = PAID
    - has ccaStatus = PENDING_CLOSURE and has paymentStatus = PAID
    CERT0: in00322v_432556@o2.com
    other_affected_versions="2022-18"
    commented_tags="@depends_on.NOV-150701"
    Given user has a "legacy postpay" account type
      And user has the device plan in "paid" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "device-plan-header" module configured in CMS for "device-plan" page
      And user has the "device-plan-rows" module configured in CMS for "device-plan" page
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.title" textfield is displayed
      And the "device_plan_information.pretitle" textfield with "Paid" text is displayed
      And the "device_plan_information.description" textfield with the "£\d+.\d\d" format is displayed
      And the "device_plan_information.button" button with "Make an additional payment" text is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.info" icon is displayed
      And the element in "0" position in the "repayment.list" list has the "title" field with the "Status" text
      And the element in "0" position in the "repayment.list" list has the "value" field with the "Paid" text
      And the element in "1" position in the "repayment.list" list has the "title" field with the "Monthly repayment" text
      And the element in "1" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "2" position in the "repayment.list" list has the "title" field with the "Paid to date" text
      And the element in "2" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the element in "3" position in the "repayment.list" list has the "title" field with the "Total left to pay" text
      And the element in "3" position in the "repayment.list" list has the "value" field with the "£\d+.\d\d" format
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the element in "0" position in the "device_plan.list" list has the "title" textfield with the "Device model" text
      And the element in "1" position in the "device_plan.list" list has the "title" textfield with the "Device Plan" text
      And the element in "2" position in the "device_plan.list" list has the "title" textfield with the "Duration of plan" text
      And the element in "2" position in the "device_plan.list" list has the "value" field with the "\d+ months" format
      And the element in "3" position in the "device_plan.list" list has the "title" textfield with the "Device plan start date" text
      And the element in "3" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "4" position in the "device_plan.list" list has the "title" textfield with the "Device plan end date" text
      And the element in "4" position in the "device_plan.list" list has the "value" field with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format
      And the element in "5" position in the "device_plan.list" list has the "title" textfield with the "Total credit" text
      And the element in "5" position in the "device_plan.list" list has the "value" field with the "£(\d+|\d+,\d{3}).\d\d" format
      And the element in "6" position in the "device_plan.list" list has the "title" textfield with the "APR*" text
      And the element in "6" position in the "device_plan.list" list has the "value" field with the "\d.\d\d %" format
      And the "device_plan.footer_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed

  @jira.QANOV-225481 @android @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-150702 @manual @mobile @o2uk @regression
  Scenario: An AO2 postpay user with only one deivce in the device plan and in paid status accesses the device plan details screen
    Given user has a "AO2 postpay" account type
      And user has a device plan with "1" devices
      And user has the device plan in "paid" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.device_name" textfield is displayed
      And the "device_plan_information.status" textfield with "Paid" text is displayed
      And the "device_plan_information.installment_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.info" icon is displayed
      And the "repayment.status.title" textfield with "Status" text is displayed
      And the "repayment.status.value" textfield with "Paid" text is displayed
      And the "repayment.installment_amount.title" textfield with "Monthly repayment" text is displayed
      And the "repayment.installment_amount.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.paid_to_date.title" textfield with "Paid to date" text is displayed
      And the "repayment.paid_to_date.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.left_to_pay.title" textfield with "Total left to pay" text is displayed
      And the "repayment.left_to_pay.value" textfield with the "£\d+.\d\d" format is displayed
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the "device_plan.model" textfield with "Device model" text is displayed
      And the "device_plan.plan_id" textfield with "Device Plan" text is displayed
      And the "device_plan.duration.title" textfield with "Duration of plan" text is displayed
      And the "device_plan.duration.value" textfield with the "\d+ months" format is displayed
      And the "device_plan.start_date.title" textfield with "Device plan start date" text is displayed
      And the "device_plan.start_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.end_date.title" textfield with "Device plan end date" text is displayed
      And the "device_plan.end_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.total_credit.title" textfield with "Total credit" text is displayed
      And the "device_plan.total_credit.value" textfield with the "£(\d+|\d+,\d{3}).\d\d" format is displayed
      And the "device_plan.apr.title" textfield with "APR*" text is displayed
      And the "device_plan.apr.value" textfield with the "\d+.\d\d %" format is displayed
      And the "device_plan.more_details.title" textfield with "More device plan details" text is displayed
      And the "device_plan.more_details.chevron" icon is displayed
      And the "device_plan.apr_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed

  @jira.QANOV-225482 @android @cert0 @cert1 @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-132515
  @jira.link.relates_to.NOV-150713 @manual @mobile @o2uk @smoke @jira.disabled
  Scenario: An AO2 user with more than 1 device in their device plan and in paid status can access the device plan details screen
    Given user has a "AO2 postpay" account type
      And user has a device plan with ">1" device
      And user has the device plan in "paid" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "device_plan_card.link" link
     Then the "Device Plan" page is displayed
      And the "Device Plan" header is displayed
      And the "device_plan_information.status" textfield with "Paid" text is displayed
      And the "device_plan_information.installment_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.title" textfield with "REPAYMENTS" text is displayed
      And the "repayment.status.title" textfield with "Status" text is displayed
      And the "repayment.status.value" textfield with "Paid" text is displayed
      And the "repayment.installment_amount.title" textfield with "Monthly repayment" text is displayed
      And the "repayment.installment_amount.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.paid_to_date.title" textfield with "Paid to date" text is displayed
      And the "repayment.paid_to_date.value" textfield with the "£\d+.\d\d" format is displayed
      And the "repayment.bill_date.title" textfield with "Payment due on" text is displayed
      And the "repayment.bill_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.title" textfield with "DEVICE PLAN INFO" text is displayed
      And the "device_plan.duration.title" textfield with "Duration of plan" text is displayed
      And the "device_plan.duration.value" textfield with the "\d+ months" format is displayed
      And the "device_plan.start_date.title" textfield with "Device plan start date" text is displayed
      And the "device_plan.start_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.end_date.title" textfield with "Device plan end date" text is displayed
      And the "device_plan.end_date.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) '\d{2}" format is displayed
      And the "device_plan.total_credit.title" textfield with "Total credit" text is displayed
      And the "device_plan.total_credit.value" textfield with the "£\d+(,\d{3}|).\d\d" format is displayed
      And the "device_plan.apr.title" textfield with "APR*" text is displayed
      And the "device_plan.apr.value" textfield with the "\d.\d\d %" format is displayed
      And the "device_plan.more_details.title" textfield with "More device plan details" text is displayed
      And the "device_plan.more_details.chevron" icon is displayed
      And the "devices_included.title" textfield with "DEVICES" text is displayed
      And the "devices_included.devices_list" list is displayed
      And each element in the "devices_included.devices_list" list has the "device_name" field
      And the "device_plan.apr_description" textfield with "*Interest rate (calculated in the same way as the APR, but excluding fees)" text is displayed
      And the "device_plan_regulation_information" textfield with "Telefonica UK Limited is authorised and regulated by the Financial Conduct Authority (Reference Number 718822)" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-7824 @android @automatic @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.depends_on.QANOV-7823
  @jira.link.detects.OBO2UK-1368 @jira.link.detects.OBO2UK-1378 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-150703 @mobile @o2uk @regression
  Scenario: A legacy user with the device plan in paid status taps on make an additional payment in the device plan details screen
    internal_checkpoint="it is considered that a user does have a device plan in 'paid' status when the response
    to APIC endpoint /{msisdn}/postpay/bill/cca/phoneplan:
    - has ccaStatus = ACTIVE and has paymentStatus = PAID
    - has ccaStatus = PENDING_CLOSURE and has paymentStatus = PAID
    CERT0: in00322v_432556@o2.com"
    Given user has a "legacy" account type
      And user has the device plan in "paid" status
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "device_plan_information.button" button
     Then the internal webview with "O2 | My Bills" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Device Plan" page is displayed

  @jira.QANOV-7825 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-7823 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-150703 @manual @mobile @o2uk @regression
  Scenario: An AO2 user with the device plan in paid status taps on make an additional payment in the device plan details screen
    Given user has the device plan in "paid" status
      And user has a "AO2" account type
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "device_plan_information.make_additional_payment" button
     Then the internal webview is displayed
      And the "O2 | My Bills" header is displayed
      And the user is authenticated
      And make a payment out of schedule is available
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Device Plan" page is displayed

  @jira.QANOV-7829 @android @automatic @cert0 @cert1 @ios @jira.cv.11.4 @jira.link.depends_on.QANOV-7813
  @jira.link.depends_on.QANOV-7817 @jira.link.depends_on.QANOV-7823 @jira.link.relates_to.NOV-150705 @mobile @netcracker
  @o2uk @regression @webapp
  Scenario: User in the device plan details screen can access to the financial information screen
    internal_checkpoint="We consider that a device plan has the status active if it's in any of the following status:
    paid, pending payment or overdue"
    Given user has the device plan in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Device Plan" page
     When clicks on the "repayment.info" icon
     Then the "Repayments Financial Information" page is displayed
      And the "Device Plan" header is displayed
      And the "information" icon is displayed
      And the "title" textfield with "Financial information" text is displayed
      And the "telefonica_regulation" textfield with "Telefonica UK Limited is authorised and regulated by the Financial Conduct Authority (Reference Number 718822)" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Device Plan" page is displayed

  @jira.QANOV-323138 @android @automatic @ber @cert0 @cert1 @ios @jira.link.parent_test_plan.QANOV-132515 @mobile
  @o2uk @regression
  Scenario: An AO2 user with a device plan can access to My Device Plan entrypoint
    Given user has a "AO2 postpay" account type
      And user has the device plan in "active" status
      And user has the matching subscription selected in the account
      And user has the "device-plan-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Device Plan" page
     When clicks on the element with "title" field with "More device plan details" value of the "device_plan.list" list
     Then the internal webview is displayed
      And the "Device plan | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Device Plan" page is displayed
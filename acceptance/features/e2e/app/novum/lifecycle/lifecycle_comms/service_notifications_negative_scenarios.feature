# -*- coding: utf-8 -*-
@jira.QANOV-132839
Feature: Service Notifications directly to Novum negative scenarios


  @jira.<jira_id> @<product> @automation.hard @android @ios @mobile @manual @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176285 @regression
  Scenario Outline: A <product> <account_type> user who has triggered any event and logs out won't receive any push notification having the app in <status> status
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234
    Only invoice_payment_due, pending_redeem_alert and pending_choose_alert are in scope of PAYM3 (AO2)
    other_affected_version="2022-09"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has activated any of these "<triggers>" triggers
     When logs out in the application
     Then the notification is not displayed in the notification center

    Examples:
          | cv   | product | account_type   | status     | triggers                                                                                                                                         | parent_test_plan                    | jira_id     |
          | 11.2 | o2uk    | legacy postpay | background | invoice_payment_due;payment_alert;high_spend_alert;bar_alert;disconnection_alert;appointment_reminder                                            | QANOV-24141                         | QANOV-7635  |
          | 11.2 | o2uk    | legacy postpay | killed     | invoice_payment_due;payment_alert;high_spend_alert;bar_alert;disconnection_alert;appointment_reminder                                            | QANOV-24141                         | QANOV-7636  |
          | 13.0 | o2uk    | AO2 postpay    | background | invoice_payment_due;payment_alert;bar_alert;cca_payment_alert;disconnection_alert;cca_balance_due_alert;order_dispatched_alert;order_ready_alert | QANOV-77438:QANOV-56964             | QANOV-59785 |
          | 13.0 | o2uk    | AO2 postpay    | killed     | invoice_payment_due;payment_alert;bar_alert;cca_payment_alert;disconnection_alert;cca_balance_due_alert;order_dispatched_alert;order_ready_alert | QANOV-77438:QANOV-56964             | QANOV-59786 |
          | 13.0 | o2uk    | AO2            | background | low_data;no-data                                                                                                                                 | QANOV-97827:QANOV-56964             | QANOV-59787 |
          | 13.0 | o2uk    | AO2            | killed     | low_data;no-data                                                                                                                                 | QANOV-97827:QANOV-56964             | QANOV-59788 |
          | 13.0 | o2uk    | AO2 postpay    | background | pending_redeem_alert;pending_choose_alert                                                                                                        | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59789 |
          | 13.0 | o2uk    | AO2 postpay    | killed     | pending_redeem_alert;pending_choose_alert                                                                                                        | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59790 |

  @jira.<jira_id> @automation.hard @android @ios @mobile @manual @jira.cv.11.2
  @jira.link.relates_to.NOV-176285 @regression @vivobr
  Scenario Outline: A Vivo postpay user who has triggered any event and logs out won't receive any push notification having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "postpay" account type
      And user has the app in "<status>" status
      And user has activated any of these "no-data;low_data;invoice_payment_due;no-balance;no-voice;low-voice" triggers
     When logs out in the application
     Then the notification is not displayed in the notification center

    Examples:
          | status     | jira_id    |
          | background | QANOV-7637 |
          | killed     | QANOV-7638 |

  @jira.<jira_id> @automation.hard @android @ios @mobile @manual @jira.cv.11.2
  @jira.link.relates_to.NOV-176288 @regression @vivobr
  Scenario Outline: A Meu Vivo legacy user is logged in with more than one lines in the app triggers an event with the non-active line having the app in <status> status. The push notification won't be displayed
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user is logged in with "2" account/s
      And user has activated any of these "no-data;low_data;invoice_payment_due;no-balance;no-voice;low-voice" triggers with a non-active line
     When changes to the other account
     Then the notification is not displayed in the notification center

    Examples:
          | status     | jira_id    |
          | background | QANOV-7665 |
          | killed     | QANOV-7666 |

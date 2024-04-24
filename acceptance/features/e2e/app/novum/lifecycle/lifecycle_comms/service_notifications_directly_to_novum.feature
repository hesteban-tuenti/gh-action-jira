# -*- coding: utf-8 -*-
@jira.QANOV-7600
Feature: Service Notifications directly to Novum


  @jira.<jira_id> @android @automation.hard @har @ios @jira.cv.11.2 @jira.link.detects.LOYAL-265
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176269 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user receives a push notification when one bill becomes available while having the app in <status> status
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Bill Ready'
    AO2 user to test: fefixi4291@brownal.net / Test1234
    other_affected_version="2022-09"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
     When has the last bill available
     Then the "invoice_payment_due" notification is received
      And the "notification_title" textfield with "<push_title>" text is displayed
      And the "notification_body" textfield with "<push_body>" text is displayed

    Examples:
          | product | cv   | account_type   | status     | push_title                            | push_body                                      | parent_test_plan        | jira_id     |
          | o2uk    | 11.2 | legacy postpay | background | Your latest bill is ready             | Your latest bill is ready. Let's take a look.  | QANOV-24141             | QANOV-7601  |
          | o2uk    | 11.2 | legacy postpay | killed     | Your latest bill is ready             | Your latest bill is ready. Let's take a look.  | QANOV-24141             | QANOV-7602  |
          | o2uk    | 13.0 | AO2 postpay    | background | Your latest bill is now ready to view | Your latest bill is ready. You can view it now | QANOV-56964:QANOV-77438 | QANOV-59755 |
          | o2uk    | 13.0 | AO2 postpay    | killed     | Your latest bill is now ready to view | Your latest bill is ready. You can view it now | QANOV-56964:QANOV-77438 | QANOV-59756 |

  @jira.<jira_id> @android @automation.hard @impeded_legacy @ios @jira.cv.11.2 @jira.link.detects.LOYAL-265
  @jira.link.relates_to.NOV-176269 @manual @mobile @regression @vivobr
  Scenario Outline: A <account_type> user receives a push notification when one bill becomes available while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Bill Ready'"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the app in "<status>" status
     When has the last bill available
     Then the "invoice_payment_due" notification is received
      And the "notification_title" textfield with "<push_title>" text is displayed
      And the "notification_body" textfield with "<push_body>" text is displayed

    Examples:
          | account_type   | status     | push_title                   | push_body                                                                                       | jira_id    |
          | legacy control | background | Sua conta já está disponível | Olá, sua conta de celular Vivo deste mês já está disponível aqui no Meu Vivo. Acesse e confira. | QANOV-7603 |
          | legacy postpay | killed     | Sua conta já está disponível | Olá, sua conta de celular Vivo deste mês já está disponível aqui no Meu Vivo. Acesse e confira. | QANOV-7604 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176270 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user receives a push notification when the bill from the previous month hasn't been paid while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Payment Reminder'
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has the latest airtime bill in "unpaid" status
     Then the "payment_alert" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | cv   | account_type   | status     | notification_title                  | notification_body                                                                                      | parent_test_plan        | jira_id     |
          | 11.6 | legacy postpay | background | You haven't paid your bill yet      | We've noticed you haven't paid your bill yet. Give us a call or make a payment using this secure link. | QANOV-24141             | QANOV-7605  |
          | 11.6 | legacy postpay | killed     | You haven't paid your bill yet      | We've noticed you haven't paid your bill yet. Give us a call or make a payment using this secure link. | QANOV-24141             | QANOV-7606  |
          | 13.2 | AO2 postpay    | background | Your bill’s overdue, please pay now | You haven’t paid your overdue bill yet. Please pay it now.                                             | QANOV-56964:QANOV-97827 | QANOV-59757 |
          | 13.2 | AO2 postpay    | killed     | Your bill’s overdue, please pay now | You haven’t paid your overdue bill yet. Please pay it now.                                             | QANOV-56964:QANOV-97827 | QANOV-59758 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-97827 @jira.link.relates_to.NOV-176270 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification when the device plan payment is overdue while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Payment Reminder'
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2 postpay" account type
      And user has the app in "<status>" status
      And user has the device plan in "overdue" status
     Then the "cca_payment_alert" notification is received
      And the "notification_title" textfield with "Your payment is now overdue" text is displayed
      And the "notification_body" textfield with "The payment of your CCA instalment is now overdue. It's really important you pay this or call us on TBD" text is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-59759 |
          | killed     | QANOV-59760 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-97827 @jira.link.relates_to.NOV-176270 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification when the device plan hasn't been paid while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Payment Reminder'
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2 postpay" account type
      And user has the app in "<status>" status
      And user has the device plan in "overdue" status
     Then the "device_plan_balance_due_alert" notification is received
      And the "notification_title" textfield with "You’ve not paid. Full balance now due" text is displayed
      And the "notification_body" textfield with "Unfortunately we've not received your payment, so the full balance of your CCA(s) is now due. Please pay or call us now on TBD" text is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-59761 |
          | killed     | QANOV-59762 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-176271 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user receives a push notification when unsual high charges have been made outside of the contract bundle requesting him/her to pay the unbilled amount while having the app in <status> status
    internal_checkpoint="OB Event triggered: High Spend Alert
    property: initial
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - High Spend warning'"
    Given user has a "legacy postpay" account type
      And user has the app in "<status>" status
      And user has high charges outside of the contract bundle
      And the ob triggered an alert with the "initial" property
     Then the "high_spend_alert" notification is received
      And the "notification_title" textfield with "You're spending more than usual" text is displayed
      And the "notification_body" textfield with "You've been spending more than usual on your account. Call us or make a payment through this secure link to stop your account being suspended." text is displayed

    Examples:
          | status     | jira_id    |
          | background | QANOV-7607 |
          | killed     | QANOV-7608 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-176272 @manual @mobile @o2uk @regression
  Scenario Outline: A user receives a push notification when the account has been suspended due to high spend amount while having the app in <status> status
    internal_checkpoint="OB Event triggered: High Spend Alert
    property: bar
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - High spend suspension alert'"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has high charges outside of the contract bundle
      And the ob triggered an alert with the "bar" property
     Then the "high_spend_alert" notification is received
      And the "notification_title" textfield with "We've suspended your account" text is displayed
      And the "notification_body" textfield with "You've been spending more than usual. Call us or make a payment through this secure link to reactivate your account." text is displayed

    Examples:
          | account_type   | status     | jira_id    |
          | legacy postpay | background | QANOV-7609 |
          | legacy postpay | killed     | QANOV-7610 |
          | legacy prepay  | background | QANOV-7611 |
          | legacy prepay  | killed     | QANOV-7612 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176273 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user receives a push notification when the account has been suspended due to unpaid bills while having the app in <status> status
    internal_checkpoint="OB Event triggered: Bar Alert
    property: class-9
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Bar alert - service suspended'
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has received a "payment_alert" notification
      And user has the latest airtime bill in "unpaid" status
      And the ob triggered an alert with the "class-9" property
     Then the "bar_alert" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | cv   | account_type   | status     | notification_title             | notification_body                                                                                                          | parent_test_plan        | jira_id     |
          | 11.6 | legacy postpay | background | We've suspended your account   | We're diverting your outgoing calls to our payment line and barring data. Ignore this if you've paid in the last 24 hours. | QANOV-24141             | QANOV-7613  |
          | 11.6 | legacy postpay | killed     | We've suspended your account   | We're diverting your outgoing calls to our payment line and barring data. Ignore this if you've paid in the last 24 hours. | QANOV-24141             | QANOV-7614  |
          | 13.2 | AO2 postpay    | background | Your services is now suspended | We've now suspended your service. It's really important you pay your overdue bill or call us on TBD                        | QANOV-56964:QANOV-97827 | QANOV-59763 |
          | 13.2 | AO2 postpay    | killed     | Your services is now suspended | We've now suspended your service. It's really important you pay your overdue bill or call us on TBD                        | QANOV-56964:QANOV-97827 | QANOV-59764 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176274 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user receives a push notification when outbound calls are about to be barred due to unpaid bills while having the app in <status> status
    internal_checkpoint="OB Event triggered: Bar Alert
    property: outbound-call
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Bar alert - outbound calls barred'
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has received a "payment_alert" notification
      And user has the latest airtime bill in "unpaid" status
      And the ob triggered an alert with the "outbound-call" property
     Then the "bar_alert" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | cv   | account_type   | status     | notification_title                 | notification_body                                                                                                                                                     | parent_test_plan        | jira_id     |
          | 11.6 | legacy postpay | background | Outgoing calls and texts barred    | Your payment is overdue. We're barring your outgoing calls and texts.                                                                                                 | QANOV-24141             | QANOV-7615  |
          | 11.6 | legacy postpay | killed     | Outgoing calls and texts barred    | Your payment is overdue. We're barring your outgoing calls and texts.                                                                                                 | QANOV-24141             | QANOV-7616  |
          | 13.2 | AO2 postpay    | background | Your calls and messages are barred | Your bill's still overdue so we've put further restrictions on your service. You won’t be able to make calls or send messages until this bill is paid. Please pay now | QANOV-56964:QANOV-97827 | QANOV-59765 |
          | 13.2 | AO2 postpay    | killed     | Your calls and messages are barred | Your bill's still overdue so we've put further restrictions on your service. You won’t be able to make calls or send messages until this bill is paid. Please pay now | QANOV-56964:QANOV-97827 | QANOV-59766 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-176275 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user receives a push notification when outbound and inbound calls are about to be barred due to unpaid bills while having the app in <status> status
    internal_checkpoint="OB Event triggered: Bar Alert
    property: bothway-call
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    A Comm is created in o2uk-cert0 as 'Service Notifications - Bar alert - both way calls barred'"
    Given user has a "legacy postpay" account type
      And user has the app in "<status>" status
      And user has received a "payment_alert" notification
      And user has the latest airtime bill in "unpaid" status
      And the ob triggered an alert with the "bothway-call" property
     Then the "bar_alert" notification is received
      And the "notification_title" textfield with "We'll disconnect your service soon" text is displayed
      And the "notification_body" textfield with "You might have extra charges to pay and you might not be able to reconnect. Ignore this if you've paid recently." text is displayed

    Examples:
          | status     | jira_id    |
          | background | QANOV-7617 |
          | killed     | QANOV-7618 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification when data and purchases are about to get barred due to unpaid bills while having the app in <status> status
    internal_checkpoint="AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2 postpay" account type
      And user has the app in "<status>" status
      And user has received a "payment_alert" notification
      And user has the latest airtime bill in "unpaid" status
      And the ob triggered an alert with the "data-use" property
     Then the "bar_alert" notification is received
      And the "notification_title" textfield with "Your data and purchases are barred" text is displayed
      And the "notification_body" textfield with "Your bill's still overdue so we've put further restrictions on your service. You won’t be able to use data or make purchases until this bill is paid" text is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-59767 |
          | killed     | QANOV-59768 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification when out of bundle usage is about to get barred due to unpaid bills while having the app in <status> status
    internal_checkpoint="AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2 postpay" account type
      And user has the app in "<status>" status
      And user has received a "payment_alert" notification
      And user has the latest airtime bill in "unpaid" status
      And the ob triggered an alert with the "out-of-bundle" property
     Then the "bar_alert" notification is received
      And the "notification_title" textfield with "Your out-of-allowance spend is barred" text is displayed
      And the "notification_body" textfield with "Your bill's overdue so we've had to restrict your service. You won't be able to spend outside of your current allowance until this bill is paid" text is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-59769 |
          | killed     | QANOV-59770 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176276 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user receives a push notification when the account is about to be disconnected due to unpaid bills while having the app in <status> status
    internal_checkpoint="OB Event triggered: Disconnect Alert
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has received a "payment_alert" notification
      And user has the latest airtime bill in "unpaid" status
     Then the "disconnection_alert" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | cv   | account_type   | status     | notification_title                  | notification_body                                                                                                                  | parent_tes_plan         | jira_id     |
          | 11.6 | legacy postpay | background | We've disconnected your service     | We're passing your account to a debt recovery company. Call 0800 588 4213 now. Ignore this if you've paid recently.                | QANOV-24141             | QANOV-7619  |
          | 11.6 | legacy postpay | killed     | We've disconnected your service     | We're passing your account to a debt recovery company. Call 0800 588 4213 now. Ignore this if you've paid recently.                | QANOV-24141             | QANOV-7620  |
          | 13.2 | AO2 postpay    | background | We’ve now disconnected your service | Unfortunately we've not received your payment, so we've disconnected your products and services. Please pay now or call us on TBD. | QANOV-56964:QANOV-97827 | QANOV-59771 |
          | 13.2 | AO2 postpay    | killed     | We’ve now disconnected your service | Unfortunately we've not received your payment, so we've disconnected your products and services. Please pay now or call us on TBD. | QANOV-56964:QANOV-97827 | QANOV-59772 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-176277 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user receives a push notification when there is an O2 Guru appointment for the same day while having the app in <status> status
    internal_checkpoint="The O2 guru trigger can be generated with the FSM:
    CommstoolSender::executeEvent
    eventId: ob_event.appointment_reminder
    params: {'name':'event.appointment_start_tm','value':'2020-10-26T17:40:00Z'},{'name':'event.phone_number','value':'+447756555685'},{'name':'event.notification_event_id','value':'0cce684d-9823-4728-8ab2-ec4c52071561:SFDC-pn-20201026150031252+0000:00D20000000CYGAEA4'},{'name':'event.msisdn','value':'4477521118750'},{'name':'event.user_id','value':'2000273957'},{'name':'event.user_roles','value':'HOLDER,USER'}
    The hour of the trigger, the phone number and the userid must be replaced for the desired user.
    Make sure to insert a valid json in params, with double quote.
    Also, must meet the following conditions:
    guruReminderToday: date:isToday(event.appointment_start_tm, 'Europe/London') && date:literalHoursLeft(event.appointment_start_tm, 'Europe/London') >= 2 && date:inTimeRange(event.appointment_start_tm, 'Europe/London', 11, 0, 20, 0) (It must be today, with more than 2 hours left and the time must be between 11 and 20)"
    Given user has a "legacy" account type
      And user has the app in "<status>" status
      And user has an O2 Guru appointment between "11" and "20" the day "today"
     Then the "appointment_reminder" notification is received
      And the "notification_title" textfield with "O2 Guru appointment today" text is displayed
      And the "notification_body" textfield with "You've got an appointment with an O2 Guru at $appointment_start_tm today" format is displayed

    Examples:
          | status     | jira_id    |
          | background | QANOV-7621 |
          | killed     | QANOV-7622 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-176278 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user receives a push notification when there is an O2 Guru appointment for the day after while having the app in <status> status
    internal_checkpoint="The O2 guru trigger can be generated with the FSM:
    CommstoolSender::executeEvent
    eventId: ob_event.appointment_reminder
    params: {'name':'event.appointment_start_tm','value':'2020-10-26T17:40:00Z'},{'name':'event.phone_number','value':'+447756555685'},{'name':'event.notification_event_id','value':'0cce684d-9823-4728-8ab2-ec4c52071561:SFDC-pn-20201026150031252+0000:00D20000000CYGAEA4'},{'name':'event.msisdn','value':'4477521118750'},{'name':'event.user_id','value':'2000273957'},{'name':'event.user_roles','value':'HOLDER,USER'}
    The hour of the trigger, the phone number and the userid must be replaced for the desired user.
    Make sure to insert a valid json in params, with double quote.
    Also, must meet the following conditions:
    guruReminderTomorrow: date:isTomorrow(event.appointment_start_tm, 'Europe/London') && date:inTimeRange(event.appointment_start_tm, 'Europe/London', 9, 0, 10, 59) (It must be tomorrow and it must happen between 9 and 11)"
    Given user has a "legacy" account type
      And user has the app in "<status>" status
      And user has an O2 Guru appointment the day "tomorrow"
     Then the "appointment_reminder" notification is received
      And the "notification_title" textfield with "O2 Guru appointment tomorrow" text is displayed
      And the "notification_body" textfield with "Your O2 Guru appointment is tomorrow at $appointment_start_tm" format is displayed

    Examples:
          | status     | jira_id    |
          | background | QANOV-7623 |
          | killed     | QANOV-7624 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-56965 @jira.link.parent_test_plan.QANOV-77438 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification having the app in <status> status when they have a <extra_pending> extra
    AO2 user to test: fefixi4291@brownal.net / Test1234
    other_affected_version="2022-09"
    Given user has a "AO2" account type
      And user has the app in "<status>" status
      And user has a "<extra_pending>" extra
     Then the "<trigger>" notification is received
      And the "notification_title" textfield with the "<notification_title>" format is displayed
      And the "notification_body" textfield with the "<notification_body>" format is displayed

    Examples:
          | status     | extra_pending  | trigger              | notification_title                                                                | notification_body                                                                                                                                                                             | jira_id     |
          | background | pending_redeem | pending_redeem_alert | Activate your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2])         | Don't forget, you need to activate your \\w Extra to have it included. You've got until ([0][1-9]\  \|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]). Or activate it now in your My O2 app           | QANOV-59773 |
          | killed     | pending_redeem | pending_redeem_alert | Activate your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2])         | Don't forget, you need to activate your \\w Extra to have it included. You've got until ([0][1-9]\  \|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]). Or activate it now in your My O2 app           | QANOV-59774 |
          | background | pending_choose | pending_choose_alert | Remember to pick your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) | Don't forget, your tariff comes with an Extra included. You've got until ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) to pick the one you want. Or pick it right now in your My O2 app. | QANOV-59775 |
          | killed     | pending_choose | pending_choose_alert | Remember to pick your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) | Don't forget, your tariff comes with an Extra included. You've got until ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) to pick the one you want. Or pick it right now in your My O2 app. | QANOV-59776 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-56965 @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification having the app in <status> status when they have an order that has been dispatched
    internal_checkpoint="AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2" account type
      And user has the app in "<status>" status
      And an order for the user has been dispatched
     Then the "order_dispatched_alert" notification is received
      And the "notification_title" textfield with "Your order has been dispatched" text is displayed
      And the "notification_body" textfield with the "Your order has been dispatched. You’ll find a tracking link via the link below." format is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-59777 |
          | killed     | QANOV-59778 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.QANOV-56964
  @jira.link.parent_test_plan.QANOV-56965 @jira.link.parent_test_plan.QANOV-97827 @manual @mobile @o2uk @regression
  Scenario Outline: An AO2 user receives a push notification having the app in <status> status when they have an order ready to be collected
    internal_checkpoint="AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2" account type
      And user has the app in "<status>" status
      And an order for the user is ready to be collected
     Then the "order_ready" notification is received
      And the "notification_title" textfield with "Your order’s now ready to collect" text is displayed
      And the "notification_body" textfield with the "Your order’s now ready to collect. It's waiting for you at your chosen O2 shop." format is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-59779 |
          | killed     | QANOV-59780 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176279 @manual @mobile @o2uk @regression
  Scenario Outline: A AO2 user who consumes all the data receives a push notification while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2" account type
      And user has the app in "<status>" status
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
     Then the "no-data" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | status     | notification_title               | notification_body                                                                       | parent_test_plan        | jira_id     |
          | background | You’ve now used up all your data | You’ve now used up all your data this month. If you need more, just add a data Bolt On. | QANOV-97827:QANOV-56964 | QANOV-59781 |
          | killed     | You’ve now used up all your data | You’ve now used up all your data this month. If you need more, just add a data Bolt On. | QANOV-97827:QANOV-56964 | QANOV-59782 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176279 @manual @mobile
  @regression @vivobr
  Scenario Outline: A legacy user who consumes all the data receives a push notification while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
     Then the "no-data" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | status     | notification_title           | notification_body                                                                                      | jira_id    |
          | background | Contrate um pacote adicional | Olá. Sua internet acabou Você pode comprar um pacote de internet aqui no app para continuar conectado. | QANOV-7625 |
          | killed     | Contrate um pacote adicional | Olá. Sua internet acabou Você pode comprar um pacote de internet aqui no app para continuar conectado. | QANOV-7626 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176280 @manual @mobile
  @regression @vivobr
  Scenario Outline: A legacy user who consumes over 80% of their data allowance receives a push notification while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
     Then the "low_data" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | status     | notification_title    | notification_body                                                                                  | jira_id    |
          | background | Acompanhe seu consumo | Sua internet está acabando Lembre-se que você pode acompanhar seu consumo de internet aqui no app. | QANOV-7627 |
          | killed     | Acompanhe seu consumo | Sua internet está acabando Lembre-se que você pode acompanhar seu consumo de internet aqui no app. | QANOV-7628 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.13.2 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176280 @manual @mobile @o2uk @regression
  Scenario Outline: A AO2 user who consumes over 80% of their data allowance receives a push notification while having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "AO2" account type
      And user has the app in "<status>" status
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
     Then the "low_data" notification is received
      And the "notification_title" textfield with "<notification_title>" text is displayed
      And the "notification_body" textfield with "<notification_body>" text is displayed

    Examples:
          | status     | notification_title               | notification_body                                                                                   | parent_test_plan        | jira_id     |
          | background | You’ve now used 80% of your data | You’ve now used 80% of your data this month. If you think you’ll need more, just add a data Bolt On | QANOV-97827:QANOV-56964 | QANOV-59783 |
          | killed     | You’ve now used 80% of your data | You’ve now used 80% of your data this month. If you think you’ll need more, just add a data Bolt On | QANOV-97827:QANOV-56964 | QANOV-59784 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176281 @manual @mobile
  @regression @vivobr
  Scenario Outline: A <account_type> user who consumes all the balance receives a push notification having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has consumed "100%" of the balance
     Then the "no-balance" notification is received
      And the "notification_title" textfield with "Faça uma recarga" text is displayed
      And the "notification_body" textfield with "Olá, seus crédito acabaram Mas não se preocupe, você pode colocar crédito aqui no Meu Vivo e ainda ganhar bônus de internet." text is displayed

    Examples:
          | account_type  | status     | jira_id    |
          | legacy prepay | background | QANOV-7629 |

    @impeded_legacy
    Examples:
          | account_type   | status | jira_id    |
          | legacy control | killed | QANOV-7630 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176283 @manual @mobile
  @regression @vivobr
  Scenario Outline: A <account_type> user who consumes all the voice minutes receives a push notification having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has consumed "100%" of the "minutes" allowance in the "mobile_line" product
     Then the "no-voice" notification is received
      And the "notification_title" textfield with "Contrate um pacote adicional" text is displayed
      And the "notification_body" textfield with "Olá, seus minutos para ligações acabaram. Confira os pacotes e promoções disponíveis para continuar falando." text is displayed

    Examples:
          | account_type  | status     | jira_id    |
          | legacy prepay | background | QANOV-7631 |

    @impeded_legacy
    Examples:
          | account_type   | status | jira_id    |
          | legacy control | killed | QANOV-7632 |

  @jira.<jira_id> @TBD @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176284 @manual @mobile
  @regression @vivobr
  Scenario Outline: A <account_type> user who consumes voice minutes below a treshold receives a push notification having the app in <status> status
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    This notification is triggered when the ob notifies the 'low-voice' event, the percentage that triggers the event might change"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has consumed ">=80%" of the "minutes" allowance in the "mobile_line" product
     Then the "low-voice" notification is received
      And the "notification_title" textfield with "Faça uma recarga" text is displayed
      And the "notification_body" textfield with "Olá, você consumiu $event-threshold dos seus minutos. Você pode colocar créditos aqui no app e adquirir uma promoção." format is displayed

    Examples:
          | account_type  | status     | jira_id    |
          | legacy prepay | background | QANOV-7633 |

    @impeded_legacy
    Examples:
          | account_type   | status | jira_id    |
          | legacy control | killed | QANOV-7634 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176286 @manual @mobile @netcracker @o2uk @regression
  Scenario Outline: A <account_type> user who is logged in with several sessions and triggers any event will receive a push notification in all the devices
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234
    Only invoice_payment_due, pending_redeem_alert and pending_choose_alert are in scope of PAYM3 (AO2)
    other_affected_version="2022-09"
    Given user has a "<account_type>" account type
      And user is logged in with the same account in two devices
      And user has activated any of these "<triggers>" triggers
     Then receives a notification

    Examples:
          | cv   | account_type   | triggers                                                                                                                                         | parent_test_plan                    | jira_id     |
          | 11.2 | legacy postpay | invoice_payment_due;payment_alert;high_spend_alert;bar_alert;disconnection_alert;appointment_reminder                                            | QANOV-24141                         | QANOV-7639  |
          | 13.0 | AO2 postpay    | invoice_payment_due;payment_alert;bar_alert;cca_payment_alert;disconnection_alert;cca_balance_due_alert;order_dispatched_alert;order_ready_alert | QANOV-77438:QANOV-56964             | QANOV-59791 |
          | 13.2 | AO2            | low_data;no-data                                                                                                                                 | QANOV-97827:QANOV-56964             | QANOV-59792 |
          | 13.0 | AO2 postpay    | pending_redeem_alert;pending_choose_alert                                                                                                        | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59793 |

  @jira.QANOV-7640 @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176286 @manual @mobile
  @regression @vivobr
  Scenario: A legacy user who is logged in with several sessions and triggers any event will receive a push notification in all the devices
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy" account type
      And user has "1" plans
      And user is logged in with the same account in two devices
      And user has activated any of these "no-data;low_data;invoice_payment_due;no-balance;no-voice;low-voice" triggers
     Then receives a notification

  @jira.<jira_id> @<priority> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176287 @manual @mobile @netcracker @o2uk
  Scenario Outline: A MyO2 user who is logged in and received a <notification> service notification push having the app in <status> status opens it and is redirected to the app section
    internal_checkpoint="AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And has received a "<notification>" notification
     When clicks on the notification
     Then the "<page_displayed>" page is displayed

    Examples:
          | cv   | account_type   | status     | notification        | page_displayed | priority   | parent_test_plan        | jira_id     |
          | 11.2 | postpay        | background | invoice_payment_due | Bills          | smoke      | QANOV-56964             | QANOV-7641  |
          | 11.2 | postpay        | killed     | invoice_payment_due | Bills          | regression | QANOV-56964             | QANOV-7642  |
          | 11.2 | legacy postpay | killed     | disconnection_alert | Account        | regression | QANOV-24141             | QANOV-7643  |
          | 11.2 | legacy postpay | background | disconnection_alert | Account        | smoke      | QANOV-24141             | QANOV-7644  |
          | 13.2 | AO2            | background | low_data            | Account        | smoke      | QANOV-97827:QANOV-56964 | QANOV-59794 |
          | 13.2 | AO2            | killed     | low_data            | Account        | regression | QANOV-97827:QANOV-56964 | QANOV-59795 |
          | 13.2 | AO2            | background | no-data             | Account        | regression | QANOV-97827:QANOV-56964 | QANOV-59796 |
          | 13.2 | AO2            | killed     | no-data             | Account        | regression | QANOV-97827:QANOV-56964 | QANOV-59797 |

  @jira.<jira_id> @<priority> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176287 @manual @mobile @netcracker @o2uk
  Scenario Outline: A MyO2 <account_type> user who is logged in and received a <notification> service notification push having the app in <status> status opens it and is redirected to an internal webview
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    NOTE: The 'Order History' webview is an AO2 especific webview only accessible through the notifications
    AO2 user to test: fefixi4291@brownal.net / Test1234
    other_affected_version="2022-09"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And has received a "<notification>" notification
     When clicks on the notification
     Then the "<page_displayed>" internal webview is displayed

    Examples:
          | cv   | account_type   | status     | notification           | page_displayed | priority   | parent_test_plan                    | jira_id     |
          | 11.2 | AO2 postpay    | killed     | payment_alert          | Make A Payment | smoke      | QANOV-97827:QANOV-56964             | QANOV-7645  |
          | 11.2 | AO2 postpay    | background | payment_alert          | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-7646  |
          | 11.2 | legacy postpay | background | appointment_reminder   | Meet Gurus     | regression | QANOV-24141                         | QANOV-7647  |
          | 11.2 | legacy postpay | killed     | appointment_reminder   | Meet Gurus     | smoke      | QANOV-24141                         | QANOV-7648  |
          | 11.2 | legacy prepay  | background | high_spend_alert       | Make A Payment | smoke      | QANOV-24141                         | QANOV-7649  |
          | 11.2 | legacy prepay  | killed     | high_spend_alert       | Make A Payment | regression | QANOV-24141                         | QANOV-7650  |
          | 11.2 | AO2 postpay    | killed     | bar_alert              | Make A Payment | smoke      | QANOV-97827:QANOV-56964             | QANOV-7651  |
          | 11.2 | AO2 postpay    | background | bar_alert              | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-7652  |
          | 13.2 | AO2 postpay    | killed     | cca_payment_alert      | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-59798 |
          | 13.2 | AO2 postpay    | background | cca_payment_alert      | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-59799 |
          | 13.2 | AO2 postpay    | killed     | cca_balance_due_alert  | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-59800 |
          | 13.2 | AO2 postpay    | background | cca_balance_due_alert  | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-59801 |
          | 13.2 | AO2 postpay    | killed     | disconnection_alert    | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-59802 |
          | 13.2 | AO2 postpay    | background | disconnection_alert    | Make A Payment | regression | QANOV-97827:QANOV-56964             | QANOV-59803 |
          | 13.0 | AO2            | killed     | pending_redeem_alert   | Your Extras    | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59804 |
          | 13.0 | AO2            | background | pending_redeem_alert   | Your Extras    | smoke      | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59805 |
          | 13.0 | AO2            | killed     | pending_choose_alert   | Your Extras    | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59806 |
          | 13.0 | AO2            | background | pending_choose_alert   | Your Extras    | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59807 |
          | 13.2 | AO2            | killed     | order_dispatched_alert | Order History  | regression | QANOV-97827:QANOV-56964             | QANOV-59808 |
          | 13.2 | AO2            | background | order_dispatched_alert | Order History  | regression | QANOV-97827:QANOV-56964             | QANOV-59809 |
          | 13.2 | AO2            | killed     | order_ready_alert      | Order History  | regression | QANOV-97827:QANOV-56964             | QANOV-59810 |
          | 13.2 | AO2            | background | order_ready_alert      | Order History  | regression | QANOV-97827:QANOV-56964             | QANOV-59811 |

  @jira.<jira_id> @<priority> @android @automation.hard @impeded_legacy @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-176287 @manual @mobile @old_app @vivobr
  Scenario Outline: A Meu Vivo legacy postpay user who is logged in and received a <notification> service notification push having the app in <status> status opens it and is redirected to the app section
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy postpay" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And has received a "<notification>" notification
     When clicks on the notification
     Then the "<page_displayed>" page is displayed

    Examples:
          | status     | notification        | page_displayed | priority   | jira_id    |
          | background | low_data            | ConsumptionV1  | smoke      | QANOV-7653 |
          | killed     | low_data            | ConsumptionV1  | regression | QANOV-7654 |
          | background | invoice_payment_due | BillsV1        | regression | QANOV-7655 |
          | killed     | invoice_payment_due | BillsV1        | smoke      | QANOV-7656 |

  @jira.<jira_id> @<priority> @TBD @android @automation.hard @impeded_legacy @ios @jira.cv.24.3 @manual @mobile @vivobr
  Scenario Outline: A Meu Vivo legacy postpay user who is logged in and received a <notification> service notification push having the app in <status> status opens it and is redirected to the app section
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy postpay" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And has received a "<notification>" notification
     When clicks on the notification
     Then the "TBD" page is displayed

    Examples:
          | status     | notification        | priority   | jira_id      |
          | background | low_data            | smoke      | QANOV-599271 |
          | killed     | low_data            | regression | QANOV-599272 |
          | background | invoice_payment_due | regression | QANOV-599273 |
          | killed     | invoice_payment_due | smoke      | QANOV-599274 |

  @jira.<jira_id> @<priority> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-176287 @manual
  @mobile @vivobr
  Scenario Outline: A Meu Vivo legacy user who is logged in and received a <notification> service notification push having the app in <status> status opens it and is redirected to an internal webview
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And has received a "<notification>" notification
     When clicks on the notification
     Then the "<page_displayed>" internal webview is displayed

    Examples:
          | status     | notification | page_displayed | priority   | jira_id    |
          | background | no-data      | Pacotes        | smoke      | QANOV-7657 |
          | killed     | no-data      | Pacotes        | regression | QANOV-7658 |
          | background | no-balance   | Recarga        | regression | QANOV-7659 |
          | killed     | no-balance   | Recarga        | smoke      | QANOV-7660 |
          | background | no-voice     | Pacotes        | regression | QANOV-7661 |
          | killed     | no-voice     | Pacotes        | regression | QANOV-7662 |
          | background | low-voice    | Recarga        | regression | QANOV-7663 |
          | killed     | low-voice    | Recarga        | regression | QANOV-7664 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176290 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user who receives a service notification with the app in <status> status can dismiss it
    AO2 user to test: fefixi4291@brownal.net / Test1234
    Only invoice_payment_due, pending_redeem_alert and pending_choose_alert are in scope of PAYM3 (AO2)
    other_affected_version="2022-09"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has activated any of these "<triggers>" triggers
     When dismisses the notification
     Then the notification is not displayed in the notification center

    Examples:
          | cv   | account_type   | status     | triggers                                                                                                                                                          | parent_test_plan                    | jira_id     |
          | 11.6 | legacy postpay | background | invoice_payment_due;payment_alert;high_spend_alert;bar_alert;disconnection_alert;appointment_reminder                                                             | QANOV-24141                         | QANOV-7667  |
          | 11.6 | legacy postpay | killed     | invoice_payment_due;payment_alert;high_spend_alert;bar_alert;disconnection_alert;appointment_reminder                                                             | QANOV-24141                         | QANOV-7668  |
          | 13.0 | AO2 postpay    | background | invoice_payment_due;payment_alert;bar_alert;cca_payment_alert;disconnection_alert;cca_balance_due_alert;low_data;no-data;order_dispatched_alert;order_ready_alert | QANOV-77438:QANOV-56964             | QANOV-59812 |
          | 13.0 | AO2 postpay    | killed     | invoice_payment_due;payment_alert;bar_alert;cca_payment_alert;disconnection_alert;cca_balance_due_alert;low_data;no-data;order_dispatched_alert;order_ready_alert | QANOV-77438:QANOV-56964             | QANOV-59813 |
          | 13.0 | AO2 postpay    | background | pending_redeem_alert;pending_choose_alert                                                                                                                         | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59814 |
          | 13.0 | AO2 postpay    | killed     | pending_redeem_alert;pending_choose_alert                                                                                                                         | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59815 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.6 @jira.link.relates_to.NOV-176290 @manual @mobile
  @regression @vivobr
  Scenario Outline: A legacy user who receives a service notification with the app in <status> status can dismiss it
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has activated any of these "no-data;low_data;invoice_payment_due;no-balance;no-voice;low-voice" triggers
     When dismisses the notification
     Then the notification is not displayed in the notification center

    Examples:
          | status     | jira_id    |
          | background | QANOV-7669 |
          | killed     | QANOV-7670 |

  @jira.<jira_id> @<priority> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-176291 @manual @mobile @o2uk
  Scenario Outline: A <account_type> user who receives a <trigger> service notification push having the app in <status> status can see the injected message in the Notification Inbox
    If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234
    other_affected_version="2022-09"
    Given user has a "<account_type>" account type
      And user has the app in "<status>" status
      And user has activated the "<trigger>" triggers
      And user has received a notification
     When launches the app
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "Account" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "<element_title>" text
      And the "text" textfield with the "<element_text>" format is displayed

    Examples:
          | cv   | product | account_type   | status     | trigger                | element_title                                                                     | element_text                                                                                                                                                                                  | priority   | parent_test_plan                    | jira_id     |
          | 11.6 | o2uk    | legacy postpay | background | invoice_payment_due    | Your latest bill is ready                                                         | Your latest bill is ready. Let's take a look.                                                                                                                                                 | smoke      | QANOV-24141                         | QANOV-7671  |
          | 11.6 | o2uk    | legacy postpay | killed     | invoice_payment_due    | Your latest bill is ready                                                         | Your latest bill is ready. Let's take a look.                                                                                                                                                 | regression | QANOV-24141                         | QANOV-7672  |
          | 11.6 | o2uk    | legacy postpay | background | payment_alert          | You haven't paid your bill yet                                                    | We've noticed you haven't paid your bill yet. Give us a call or make a payment using this secure link.                                                                                        | regression | QANOV-24141                         | QANOV-7673  |
          | 11.6 | o2uk    | legacy postpay | killed     | payment_alert          | You haven't paid your bill yet                                                    | We've noticed you haven't paid your bill yet. Give us a call or make a payment using this secure link.                                                                                        | regression | QANOV-24141                         | QANOV-7674  |
          | 11.6 | o2uk    | legacy postpay | background | disconnection_alert    | We've disconnected your service                                                   | We're passing your account to a debt recovery company. Call 0800 588 4213 now. Ignore this if you've paid recently.                                                                           | regression | QANOV-24141                         | QANOV-7675  |
          | 11.6 | o2uk    | legacy postpay | killed     | disconnection_alert    | We've disconnected your service                                                   | We're passing your account to a debt recovery company. Call 0800 588 4213 now. Ignore this if you've paid recently.                                                                           | regression | QANOV-24141                         | QANOV-7676  |
          | 11.6 | o2uk    | legacy prepay  | background | disconnection_alert    | We've disconnected your service                                                   | We're passing your account to a debt recovery company. Call 0800 588 4213 now. Ignore this if you've paid recently.                                                                           | smoke      | QANOV-24141                         | QANOV-7677  |
          | 11.6 | o2uk    | legacy prepay  | killed     | disconnection_alert    | We've disconnected your service                                                   | We're passing your account to a debt recovery company. Call 0800 588 4213 now. Ignore this if you've paid recently.                                                                           | regression | QANOV-24141                         | QANOV-7678  |
          | 13.0 | o2uk    | AO2 postpay    | background | invoice_payment_due    | Your latest bill is now ready to view                                             | Your latest bill is ready. You can view it now                                                                                                                                                | smoke      | QANOV-77438:QANOV-56964             | QANOV-59816 |
          | 13.0 | o2uk    | AO2 postpay    | killed     | invoice_payment_due    | Your latest bill is now ready to view                                             | Your latest bill is ready. You can view it now                                                                                                                                                | regression | QANOV-77438:QANOV-56964             | QANOV-59817 |
          | 13.2 | o2uk    | AO2 postpay    | background | payment_alert          | Your bill’s overdue, please pay now                                               | You haven’t paid your overdue bill yet. Please pay it now.                                                                                                                                    | regression | QANOV-97827:QANOV-56964             | QANOV-59818 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | payment_alert          | Your bill’s overdue, please pay now                                               | You haven’t paid your overdue bill yet. Please pay it now.                                                                                                                                    | regression | QANOV-97827:QANOV-56964             | QANOV-59819 |
          | 13.2 | o2uk    | AO2 postpay    | background | cca_payment_alert      | Your payment is now overdue                                                       | The payment of your CCA instalment is now overdue. It's really important you pay this or call us on TBD                                                                                       | regression | QANOV-97827:QANOV-56964             | QANOV-59820 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | cca_payment_alert      | Your payment is now overdue                                                       | The payment of your CCA instalment is now overdue. It's really important you pay this or call us on TBD                                                                                       | regression | QANOV-97827:QANOV-56964             | QANOV-59821 |
          | 13.2 | o2uk    | AO2 postpay    | background | disconnection_alert    | We’ve now disconnected your service                                               | Unfortunately we've not received your payment, so we've disconnected your products and services. Please pay now or call us on TBD.                                                            | regression | QANOV-97827:QANOV-56964             | QANOV-59822 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | disconnection_alert    | We’ve now disconnected your service                                               | Unfortunately we've not received your payment, so we've disconnected your products and services. Please pay now or call us on TBD.                                                            | regression | QANOV-97827:QANOV-56964             | QANOV-59823 |
          | 13.2 | o2uk    | AO2 postpay    | background | cca_balance_due_alert  | You’ve not paid. Full balance now due                                             | Unfortunately we've not received your payment, so the full balance of your CCA(s) is now due. Please pay or call us now on TBD                                                                | regression | QANOV-97827:QANOV-56964             | QANOV-59824 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | cca_balance_due_alert  | You’ve not paid. Full balance now due                                             | Unfortunately we've not received your payment, so the full balance of your CCA(s) is now due. Please pay or call us now on TBD                                                                | regression | QANOV-97827:QANOV-56964             | QANOV-59825 |
          | 13.2 | o2uk    | AO2 postpay    | background | low_data_alert         | You’ve now used 80% of your data                                                  | You’ve now used 80% of your data this month. If you think you’ll need more, just add a data Bolt On                                                                                           | regression | QANOV-97827:QANOV-56964             | QANOV-59826 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | low_data_alert         | You’ve now used 80% of your data                                                  | You’ve now used 80% of your data this month. If you think you’ll need more, just add a data Bolt On                                                                                           | regression | QANOV-97827:QANOV-56964             | QANOV-59827 |
          | 13.2 | o2uk    | AO2 postpay    | background | no-data_alert          | You’ve now used up all your data                                                  | You’ve now used up all your data this month. If you need more, just add a data Bolt On.                                                                                                       | regression | QANOV-97827:QANOV-56964             | QANOV-59828 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | no-data_alert          | You’ve now used up all your data                                                  | You’ve now used up all your data this month. If you need more, just add a data Bolt On.                                                                                                       | regression | QANOV-97827:QANOV-56964             | QANOV-59829 |
          | 13.0 | o2uk    | AO2 postpay    | background | pending_redeem_alert   | Activate your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2])         | Don't forget, you need to activate your \\w Extra to have it included. You've got until ([0][1-9]\  \|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]). Or activate it now in your My O2 app           | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59830 |
          | 13.0 | o2uk    | AO2 postpay    | killed     | pending_redeem_alert   | Activate your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2])         | Don't forget, you need to activate your \\w Extra to have it included. You've got until ([0][1-9]\  \|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]). Or activate it now in your My O2 app           | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59831 |
          | 13.0 | o2uk    | AO2 postpay    | background | pending_choose_alert   | Remember to pick your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) | Don't forget, your tariff comes with an Extra included. You've got until ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) to pick the one you want. Or pick it right now in your My O2 app. | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59832 |
          | 13.0 | o2uk    | AO2 postpay    | killed     | pending_choose_alert   | Remember to pick your Extra by ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) | Don't forget, your tariff comes with an Extra included. You've got until ([0][1-9]\|[12]\\d\  \|3[01])/([0][1-9]\|[1][1-2]) to pick the one you want. Or pick it right now in your My O2 app. | regression | QANOV-77438:QANOV-56964:QANOV-56965 | QANOV-59833 |
          | 13.2 | o2uk    | AO2 postpay    | background | order_dispatched_alert | Your order has been dispatched                                                    | Your order has been dispatched. You’ll find a tracking link via the link below.                                                                                                               | regression | QANOV-97827:QANOV-56964             | QANOV-59834 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | order_dispatched_alert | Your order has been dispatched                                                    | Your order has been dispatched. You’ll find a tracking link via the link below.                                                                                                               | regression | QANOV-97827:QANOV-56964             | QANOV-59835 |
          | 13.2 | o2uk    | AO2 postpay    | background | order_ready_alert      | Your order’s now ready to collect                                                 | Your order’s now ready to collect. It's waiting for you at your chosen O2 shop.                                                                                                               | regression | QANOV-97827:QANOV-56964             | QANOV-59836 |
          | 13.2 | o2uk    | AO2 postpay    | killed     | order_ready_alert      | Your order’s now ready to collect                                                 | Your order’s now ready to collect. It's waiting for you at your chosen O2 shop.                                                                                                               | regression | QANOV-97827:QANOV-56964             | QANOV-59837 |

  @jira.<jira_id> @<test_priority> @android @automation.hard @ios @jira.cv.11.6 @jira.link.relates_to.NOV-176291 @manual
  @mobile @vivobr
  Scenario Outline: A legacy user who receives a <trigger> service notification push having the app in <status> status can see the injected message in the Notification Inbox
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the app in "<status>" status
      And user has activated the "<trigger>" triggers
      And user has received a notification
     When launches the app
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "Account" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "<element_title>" text
      And the "text" textfield with "<element_text>" text is displayed

    Examples:
          | status     | trigger    | element_title                | element_text                                                                                                                 | priority   | jira_id    |
          | background | no-data    | Contrate um pacote adicional | Olá. Sua internet acabou Você pode comprar um pacote de internet aqui no app para continuar conectado.                       | smoke      | QANOV-7679 |
          | killed     | no-data    | Contrate um pacote adicional | Olá. Sua internet acabou Você pode comprar um pacote de internet aqui no app para continuar conectado.                       | regression | QANOV-7680 |
          | background | no-balance | Faça uma recarga             | Olá, seus crédito acabaram Mas não se preocupe, você pode colocar crédito aqui no Meu Vivo e ainda ganhar bônus de internet. | regression | QANOV-7681 |
          | killed     | no-balance | Faça uma recarga             | Olá, seus crédito acabaram Mas não se preocupe, você pode colocar crédito aqui no Meu Vivo e ainda ganhar bônus de internet. | smoke      | QANOV-7682 |

  @jira.<jira_id> @<priority> @<product> @android @automation.hard @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-176291 @manual @mobile
  Scenario Outline: A <account_type> user who receives a <property> BAR ALERT service notification push can see the injected message in the Notification Inbox
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS
    AO2 user to test: fefixi4291@brownal.net / Test1234"
    Given user has a "<account_type>" account type
      And the ob triggered an alert with the "<property>" property
      And user has activated the "bar_alert" triggers
      And user has received a notification
     When launches the app
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "Account" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "<element_title>" text
      And the "text" textfield with "<element_text>" text is displayed

    Examples:
          | cv   | product | account_type   | property      | element_title                         | element_text                                                                                                                                                          | priority   | parent_test_plan        | jira_id     |
          | 11.6 | o2uk    | legacy postpay | class-9       | We've suspended your account          | We're diverting your outgoing calls to our payment line and barring data. Ignore this if you've paid in the last 24 hours.                                            | smoke      | QANOV-24141             | QANOV-7683  |
          | 11.6 | o2uk    | legacy postpay | outbound-call | Outgoing calls and texts barred       | Your payment is overdue. We're barring your outgoing calls and texts.                                                                                                 | regression | QANOV-24141             | QANOV-7684  |
          | 11.6 | o2uk    | legacy postpay | bothway-call  | We'll disconnect your service soon    | You might have extra charges to pay and you might not be able to reconnect. Ignore this if you've paid recently.                                                      | regression | QANOV-24141             | QANOV-7685  |
          | 13.2 | o2uk    | AO2 postpay    | class-9       | Your services is now suspended        | We've now suspended your service. It's really important you pay your overdue bill or call us on TBD                                                                   | regression | QANOV-97827:QANOV-56964 | QANOV-59838 |
          | 13.2 | o2uk    | AO2 postpay    | outbound-call | Your calls and messages are barred    | Your bill's still overdue so we've put further restrictions on your service. You won’t be able to make calls or send messages until this bill is paid. Please pay now | regression | QANOV-97827:QANOV-56964 | QANOV-59839 |
          | 13.2 | o2uk    | AO2 postpay    | data-use      | Your data and purchases are barred    | Your bill's still overdue so we've put further restrictions on your service. You won’t be able to use data or make purchases until this bill is paid                  | regression | QANOV-97827:QANOV-56964 | QANOV-59840 |
          | 13.2 | o2uk    | AO2 postpay    | out-of-bundle | Your out-of-allowance spend is barred | Your bill's overdue so we've had to restrict your service. You won't be able to spend outside of your current allowance until this bill is paid                       | smoke      | QANOV-97827:QANOV-56964 | QANOV-59841 |

  @jira.<jira_id> @<priority> @<product> @android @automation.hard @ios @jira.cv.11.6
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-176291 @manual @mobile
  Scenario Outline: A <account_type> user who receives a <property> HIGHT SPENT ALERT service notification push can see the injected message in the Notification Inbox
    internal_checkpoint="If it is not possible to trigger a real event, the notification can be injected from the comms
    tool with the following tutorial: https://telefonicacorp.sharepoint.com/:w:/s/ColaboraTID/qacdo/EQGhFjGX1eBKhDQsnItFAzwBmJScS3-pn9pgAlbt9QP_zA?e=7PtLXS"
    Given user has a "<account_type>" account type
      And the ob triggered an alert with the "<property>" property
      And user has activated the "high_spend_alert" triggers
      And user has received a notification
     When launches the app
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "Account" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "<element_title>" text
      And the "text" textfield with "<element_text>" text is displayed

    Examples:
          | product | account_type   | property | element_title                   | element_text                                                                                                                                   | priority   | jira_id    |
          | o2uk    | legacy postpay | initial  | You're spending more than usual | You've been spending more than usual on your account. Call us or make a payment through this secure link to stop your account being suspended. | smoke      | QANOV-7686 |
          | o2uk    | legacy prepay  | initial  | You're spending more than usual | You've been spending more than usual on your account. Call us or make a payment through this secure link to stop your account being suspended. | regression | QANOV-7687 |
          | o2uk    | legacy postpay | bar      | We've suspended your account    | You've been spending more than usual. Call us or make a payment through this secure link to reactivate your account.                           | regression | QANOV-7688 |
          | o2uk    | legacy prepay  | bar      | We've suspended your account    | You've been spending more than usual. Call us or make a payment through this secure link to reactivate your account.                           | smoke      | QANOV-7689 |

  @jira.<jira_id> @<priority> @<product> @android @automation.hard @ios @jira.cv.11.6
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-176291 @manual @mobile
  Scenario Outline: A <account_type> user who receives a <appointment_day> APPOINTMENT REMINDER ALERT service notification push can see the injected message in the Notification Inbox
    internal_checkpoint="The O2 guru trigger can be generated with the FSM:
    CommstoolSender::executeEvent
    eventId: ob_event.appointment_reminder
    params: {'name':'event.appointment_start_tm','value':'2020-10-26T17:40:00Z'},{'name':'event.phone_number','value':'+447756555685'},{'name':'event.notification_event_id','value':'0cce684d-9823-4728-8ab2-ec4c52071561:SFDC-pn-20201026150031252+0000:00D20000000CYGAEA4'},{'name':'event.msisdn','value':'4477521118750'},{'name':'event.user_id','value':'2000273957'},{'name':'event.user_roles','value':'HOLDER,USER'}
    The hour of the trigger, the phone number and the userid must be replaced for the desired user.
    Make sure to insert a valid json in params, with double quote.
    Also, must meet the following conditions:
    guruReminderToday: date:isToday(event.appointment_start_tm, 'Europe/London') && date:literalHoursLeft(event.appointment_start_tm, 'Europe/London') >= 2 && date:inTimeRange(event.appointment_start_tm, 'Europe/London', 11, 0, 20, 0) (It must be today, missing more than 2 hours and the time must be between 11 and 20)
    guruReminderTomorrow: date:isTomorrow(event.appointment_start_tm, 'Europe/London') && date:inTimeRange(event.appointment_start_tm, 'Europe/London', 9, 0, 10, 59) (It must be tomorrow and it must happen between 9 and 11)"
    Given user has a "<account_type>" account type
      And user has an O2 Guru appointment the day "<appointment_day>"
      And user has activated the "appointment_reminder" triggers
      And user has received a notification
     When launches the app
      And clicks on the "navigation_tab_bar.account_tab" tab
      And the "Account" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "<element_title>" text
      And the "text" textfield with "<element_text>" format is displayed

    Examples:
          | product | account_type   | appointment_day | element_title                | element_text                                                             | priority   | jira_id    |
          | o2uk    | legacy postpay | today           | O2 Guru appointment today    | You've got an appointment with an O2 Guru at $appointment_start_tm today | smoke      | QANOV-7690 |
          | o2uk    | legacy prepay  | today           | O2 Guru appointment today    | You've got an appointment with an O2 Guru at $appointment_start_tm today | regression | QANOV-7691 |
          | o2uk    | legacy postpay | tomorrow        | O2 Guru appointment tomorrow | Your O2 Guru appointment is tomorrow at $appointment_start_tm            | regression | QANOV-7692 |
          | o2uk    | legacy prepay  | tomorrow        | O2 Guru appointment tomorrow | Your O2 Guru appointment is tomorrow at $appointment_start_tm            | smoke      | QANOV-7693 |

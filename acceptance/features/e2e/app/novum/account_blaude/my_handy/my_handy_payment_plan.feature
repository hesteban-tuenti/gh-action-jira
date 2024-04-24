# -*- coding: utf-8 -*-
@jira.QANOV-224664
Feature: My Handy payment plan

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has the "My Handy card" module configured in CMS for "Account" page
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page
      And user has the "Payment Plan" module configured in CMS for "Payment Plan" page


  @jira.QANOV-224665 @android @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215960
  @jira.link.depends_on.QANOV-215961 @jira.link.depends_on.QANOV-215962 @jira.link.depends_on.QANOV-215963
  @jira.link.depends_on.QANOV-297967 @jira.link.detects.OBO2DE-150 @jira.link.detects.OBO2DE-153
  @jira.link.detects.OBO2DE-731 @automatic @mobile @sanity @qa @raitt_drop1 @webapp
  Scenario: Postpay user with a MyHandy product can access to the "Payment Plan" screen
    We will show always the next 3 payments for the user. When he pays, that payment will move to the last position.
    If there is some payment frozen like overdue we will show it at first position until user makes the payment.
    Possible status of each payment: paid, unpaid, overdue, cancelled.
    Given user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "billing_information.payment_plan_entrypoint" entrypoint
     Then the "Payment Plan" page is displayed
      And the "Ratenplan" header is displayed
      And the "general_information" module is displayed
      And the "general_information.title" textfield with "ALLGEMEINE INFORMATIONEN" text is displayed
      And the "general_information.amount_paid_label" textfield with "Bereits gezahlt" text is displayed
      And the "general_information.amount_paid_value" textfield with the "\d+,\d\d €" format is displayed
      And the "general_information.balance_label" textfield with "Restbetrag" text is displayed
      And the "general_information.balance_value" textfield with the "\d+,\d\d €" format is displayed
      And the "general_information.total_label" textfield with "Gesamtbetrag" text is displayed
      And the "general_information.total_value" textfield with the "\d+,\d\d €" format is displayed
      And the "details" module is displayed
      And the "details.title" textfield with "DETAILS" text is displayed
      And the "details.next_payments_list" list is displayed
      And the "details.view_more_link" link with "Mehr anzeigen" text is displayed
      And the "myhandy_repair" module is displayed
      And the "myhandy_repair.title" textfield with "My Handy Reparatur" text is displayed
      And the "myhandy_repair.subtitle" textfield with "Benötigt dein Gerät eine Reparatur?" text is displayed
      And the "myhandy_repair.description" textfield with "Unser Team hilft dir bei der schnellen Reparatur." text is displayed
      And the "myhandy_repair.repair_order_button" button with "Zum Reparatur Auftrag" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "My Handy Details" page is displayed

  @jira.QANOV-269827 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224665 @manual @mobile @regression
  Scenario: Postpay user can access to the MyHandy Repair screen from the "Payment Plan" screen
    Given user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "myhandy_repair.repair_order_button" button
     Then the internal webview is displayed
      And the "Reparaturportal - Auftragserfassung" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Payment Plan" page is displayed

  @jira.QANOV-224666 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224665 @jira.link.detects.O2DE-3038
  @manual @mobile @smoke
  Scenario: Postpay user with a MyHandy product can see all the payment plan
    Given user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "details.view_more_link" link
     Then the "details.next_payments_list" list is displayed expanded
      And each element in the "details.next_payments_list" list has the "payment_status_tag" textfield with the "(Offen|Bezahlt|Überfällig|Abgebrochen)" format
      And each element in the "details.next_payments_list" list has the "payment_name" textfield with the "(Anzahlung|\d\d. Rate|Auflösung Ratenplan)" format
      And each element in the "details.next_payments_list" list has the "payment_date" textfield with the "(Fällig|Bezahlt|Cancelled) am \d{2}.\d{2}.\d{4}" format
      And each element in the "details.next_payments_list" list has the "payment_amount" textfield with the "\d+,\d\d €" format
      And the "details.view_less_link" link with "Weniger anzeigen" text is displayed

  @jira.QANOV-224667 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224666 @manual @mobile @regression
  Scenario: Postpay user with a MyHandy product can collapse the payment plan
    Given user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "details.view_more_link" link
      And clicks on the "details.view_less_link" link
     Then the "details.next_payments_list" list is displayed collapsed
      And the "details.view_more_link" link with "Mehr anzeigen" text is displayed

  @jira.QANOV-224668 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224665 @manual @mobile @regression
  Scenario: Postpay user who just started a MyHandy contract can see all the payments in "Unpaid" status
    Pending payments will appear at the beginning of the list (first overdue payments and then unpaid payments), and the
    already paid payments will appear at the end of the list.
    Given user has "all" my handy payments in "unpaid" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "details.view_more_link" link
     Then each element in the "details.next_payments_list" list has the "payment_status_tag" textfield with "Offen" text

  @jira.QANOV-224669 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224665 @manual @mobile @regression
  Scenario: Postpay user with a MyHandy product can see the unpaid payments at the beginning of the "payment plan" list
    Pending payments will appear at the beginning of the list (first overdue payments and then unpaid payments), and the
    already paid payments will appear at the end of the list.
    Given  user has "some" my handy payments in "unpaid" status
      And user has "some" my handy payments in "paid" status
      And user has "0" my handy payments in "overdue" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "details.view_more_link" link
     Then the "0" index in the "details.next_payments_list" list has the "payment_status_tag" field with "Offen" text
      And the "last" index in the "details.next_payments_list" list has the "payment_status_tag" field with "Bezahlt" text

  @jira.QANOV-224670 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224665 @manual @mobile @smoke
  Scenario: Postpay user with a MyHandy product can see the overdue payments at the beginning of the "payment plan" list
    Pending payments will appear at the beginning of the list (first overdue payments and then unpaid payments), and the
    already paid payments will appear at the end of the list.
    Given user has "some" my handy payments in "unpaid" status
      And user has "some" my handy payments in "paid" status
      And user has "1" my handy payments in "overdue" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "details.view_more_link" link
     Then the "0" index in the "details.next_payments_list" list has the "payment_status_tag" field with "Überfällig" text
      And the "1" index in the "details.next_payments_list" list has the "payment_status_tag" field with "Offen" text
      And the "last" index in the "details.next_payments_list" list has the "payment_status_tag" field with "Bezahlt" text

  @jira.QANOV-224671 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224665 @manual @mobile @regression
  Scenario: Postpay user who just finished a MyHandy contract can see all the payments in "Paid" status
    Pending payments will appear at the beginning of the list (first overdue payments and then unpaid payments), and the
    already paid payments will appear at the end of the list.
    Given user has "all" my handy payments in "paid" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Plan" page
     When clicks on the "details.view_more_link" link
     Then each element in the "details.next_payments_list" list has the "payment_status_tag" textfield with "Bezahlt" text

# -*- coding: utf-8 -*-
@jira.QANOV-127135
Feature: Invoice - Messages Charges


  @jira.QANOV-96379 @ber @automatic @sanity @android @cert0 @cert1 @ios @jira.cv.10.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47459 @mobile @o2uk @qa @webapp
  Scenario: A legacy postpay user with 1 lines associated to their bill can see the details of Messages charges in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has "messages" events "with" cost in the latest airtime bill
      And user does not have late landing charges in the "messages" category in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "messages_entrypoint" entrypoint
     Then the "Bill Messages Consumption" page is displayed
      And the "Messages" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "sms" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field
      And each element in the "events_list" list has the "sms_type" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-6276 @automatic @sanity @android @cert0 @cert1 @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47459 @mobile @o2uk @qa @webapp
  Scenario: A legacy postpay user with several lines associated to their bill can see the details of Messages charges in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has "messages" events "with" cost in the latest airtime bill
      And user does not have late landing charges in the "messages" category in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
      And waits until the "lines_title" element is visible
     When clicks on the eligible msisdn entrypoint in bill
      And the "Bill Concepts" page is displayed
      And clicks on the "messages_entrypoint" entrypoint
     Then the "Bill Messages Consumption" page is displayed
      And the "Messages" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "last" day of the "consumption_graph" graph
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "sms" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field
      And each element in the "events_list" list has the "sms_type" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Concepts" page is displayed

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6277
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47540 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the daily charges in the graph of Messages details in the latest airtime bill
    internal_checkpoint="PAYM - inavl0ww_878541@o2.com (07525948396)"
    Given user has a "<account_type>" account type
      And user has "messages" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Messages" page
     When clicks on a different day in the consumption graph
     Then the "consumption_graph.y.selected_day_label" icon is displayed
      And the "consumption_graph.y.selected_day_label" textfield with the "dd Mmm · £X.XX" format is displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6278 |
          | legacy MBB   | impeded_mock  | automation.pending_mock | QANOV-6279 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47459 @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the details of Messages without charges in the latest airtime bill
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Messages'"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "messages" events "without" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "messages" entrypoint
     Then the "Bill Messages" page is displayed
      And the "Messages" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "event_number" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill | QANOV-96381 |
          | legacy PAYM  | several   | Bill Concepts       | QANOV-6280  |
          | legacy MBB   | 1         | Latest Airtime Bill | QANOV-96382 |
          | legacy MBB   | several   | Bill Concepts       | QANOV-6281  |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47459 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the late landing charges of "Messages"
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Messages'
    The late landing charges module only is displayed if the charges of this kind are != 0
    CERT0:
    PAYM - inavl0ww_878541@o2.com(0752594test_priority8396)"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has late landing charges in the "messages" category in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "messages" entrypoint
     Then the "Bill Messages" page is displayed
      And the "Messages" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_number" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | impeded_label | automation              | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill | impeded_mock  | automation.pending_mock | QANOV-96383 |
          | legacy PAYM  | several   | Bill Concepts       |               |                         | QANOV-6282  |
          | legacy MBB   | 1         | Latest Airtime Bill | impeded_mock  | automation.pending_mock | QANOV-96384 |
          | legacy MBB   | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6283  |

# -*- coding: utf-8 -*-
@jira.QANOV-127144
Feature: Invoice - Data Charges


  @jira.QANOV-6268 @android @ios @jira.cv.10.2 @ber @qa @jira.link.parent_test_plan.QANOV-24141 
  @jira.link.relates_to.NOV-47460 @automatic @mobile @o2uk @sanity @webapp
  Scenario: A legacy user with 1 associated to their bill can see the details of Data charges in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has "data" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "data_entrypoint" entrypoint
     Then the "Bill Data Consumption" page is displayed
      And the "Data" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "date" textfield with the "(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[0-2])\/(20\d\d)" format
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "consumed" textfield with the "\d+ (MB|GB)" format
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-6269 @android @ios @jira.cv.10.2 @qa @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47460
  @automatic @mobile @o2uk @sanity @webapp
  Scenario: A legacy user with several associated to their bill can see the details of Data charges in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has "data" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
      And waits until the "lines_title" element is visible
     When clicks on the eligible msisdn entrypoint in bill
      And the "Bill Concepts" page is displayed
      And clicks on the "data_entrypoint" entrypoint
     Then the "Bill Data Consumption" page is displayed
      And the "Data" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "date" textfield with the "(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[0-2])\/(20\d\d)" format
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "consumed" textfield with the "\d+ (MB|GB)" format
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Concepts" page is displayed

  @jira.QANOV-6270 @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6269 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47541 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the daily charges in the graph of Data details in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has events "with" cost in the "data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Data" page
     Then the "consumption_graph.y.selected_day_label" icon is displayed
      And the "consumption_graph.y.selected_day_label" textfield with the "dd Mmm · £X.XX" format is displayed

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47460 @manual @mobile @o2uk @smoke
  Scenario Outline: A legacy user with <num_lines> associated to their bill can see the details of Data without charges in the latest airtime bill
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Data'
    CERT0: PAYM - inavl0ww_878541@o2.com (07525948396)"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has events "without" cost in the "data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "data" entrypoint
     Then the "Bill Data" page is displayed
      And the "Data" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "event_consumed" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | num_lines | page                | impeded_label | automation              | jira_id    |
          | 1         | Latest Airtime Bill |               |                         | QANOV-6272 |
          | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6273 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47460 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with <num_lines> associated to their bill can see the late landing charges of "Data"
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Data'
    The late landing charges module only is displayed if the charges of this kind are != 0
    CERT0: inl_may8842@o2.com (07521130461) --> invalid user, without bills"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has event "with" cost in the "data" bill section
      And user has late landing charges in the "data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "data" entrypoint
     Then the "Bill Data" page is displayed
      And the "Data" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_consumed" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | num_lines | page                | jira_id    |
          | 1         | Latest Airtime Bill | QANOV-6274 |
          | several   | Bill Concepts       | QANOV-6275 |

  @jira.<jira_id> @android @automation.pending_mock @ios @jira.cv.10.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-91714 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user can check the data charges of last bill for the companion device
    internal_checkpoint="NOTE that the data charges that must be represented are the companion device ones,
    not the lead line charges"
    Given user has a "legacy postpay" account type with companion line associated
      And user has "<mobile_lines>" mobile lines
      And user has the latest airtime bill available
      And user has consumed "<lead_msisdn_data_charges>" of the "data" allowance in the "lead_mobile_line" product
      And user has consumed "<companion_device_data_charges>" of the "data" allowance in the "companion_device" product
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "companion_device_entry" entrypoint
     Then the "Bill Concepts" page is displayed
      And the "data_charges" textfield with the "£XX.XX" format is displayed

    Examples:
          | mobile_lines | lead_msisdn_data_charges | companion_device_data_charges | jira_id    |
          | 1            | 0%                       | >0%                           | QANOV-6344 |
          | 1            | >0%                      | 0%                            | QANOV-6345 |
          | 1            | >0%                      | >0%                           | QANOV-6346 |
          | several      | 0%                       | >0%                           | QANOV-6347 |
          | several      | >0%                      | 0%                            | QANOV-6348 |
          | several      | >0%                      | >0%                           | QANOV-6349 |

  @jira.<jira_id> @android @automation.pending_mock @ios @jira.cv.10.6 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-91713 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user can check the data charges of last bill for the lead device
    internal_checkpoint="NOTE that the data charges that must be represented are the lead line ones,
    not the companion device charges"
    Given user has a "legacy postpay" account type with companion line associated
      And user has "<mobile_lines>" mobile lines
      And user has the latest airtime bill available
      And user has consumed "<lead_msisdn_data_charges>" of the "data" allowance in the "lead_mobile_line" product
      And user has consumed "<companion_device_data_charges>" of the "data" allowance in the "companion_device" product
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "lead_msisdn_entry" entrypoint
     Then the "Bill Concepts" page is displayed
      And the "data_charges" textfield with the "£XX.XX" format is displayed

    Examples:
          | mobile_lines | lead_msisdn_data_charges | companion_device_data_charges | jira_id    |
          | 1            | 0%                       | >0%                           | QANOV-6350 |
          | 1            | >0%                      | 0%                            | QANOV-6351 |
          | 1            | >0%                      | >0%                           | QANOV-6352 |
          | several      | 0%                       | >0%                           | QANOV-6353 |
          | several      | >0%                      | 0%                            | QANOV-6354 |
          | several      | >0%                      | >0%                           | QANOV-6355 |

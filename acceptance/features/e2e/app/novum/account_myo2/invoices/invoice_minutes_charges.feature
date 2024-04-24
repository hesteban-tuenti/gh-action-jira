# -*- coding: utf-8 -*-
@jira.QANOV-127138
Feature: Invoice - Minutes Charges


  @jira.QANOV-96374 @automatic @android @cert0 @cert1 @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-39033 @mobile @o2uk @regression @qa @webapp
  Scenario: A legacy user with 1 line associated to their bill can see the filter calls module in his/her Latest airtime bill
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has "minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "Minutes consumption" header is displayed
      And the "calls_selector" module is displayed
      And the "calls_selector.label" textfield with "Filter by" text is displayed
      And the "calls_selector.all_calls_option" textfield with "All calls" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Latest Airtime Bill" page is displayed

  @jira.QANOV-6254 @automatic @android @cert0 @cert1 @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-39033 @mobile @o2uk @regression @qa @webapp
  Scenario: A legacy user with several lines associated to their bill can see the filter calls module in his/her Latest airtime bill
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has "minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
      And waits until the "lines_title" element is visible
     When clicks on the eligible msisdn entrypoint in bill
      And the "Bill Concepts" page is displayed
      And clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "Minutes consumption" header is displayed
      And the "calls_selector" module is displayed
      And the "calls_selector.label" textfield with "Filter by" text is displayed
      And the "calls_selector.all_calls_option" textfield with "All calls" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Concepts" page is displayed

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-53590 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with <num_lines> associated to their bill can see which calls are premium (from Minutes consumption screen)
    internal_checkpoint="Can be verified checking the field isNGNCharge: true in tables
    bill_billedcharges_voice and bill_recentcharges_voice
    CERT0: 12oc72476237@stf.ref.o2.co.uk (447568414425)"
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has premium calls in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "premium_call_icon" icon is displayed
      And the "view_details" link with "View details" text is displayed

    Examples:
          | num_lines | page                | impeded_label | automation              | jira_id     |
          | 1         | Latest Airtime Bill |               |                         | QANOV-96375 |
          | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6255  |

  @jira.QANOV-6256 @android @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-53591
  @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of a premium call service (from Minutes consumption screen)
    internal_checkpoint="Can be verified checking the field isNGNCharge: true in tables
    bill_billedcharges_voice and bill_recentcharges_voice
    CERT0: 12oc72476237@stf.ref.o2.co.uk (447568414425)"
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has premium calls in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Minutes Consumption" page
     When clicks on the "view_details" link
     Then the browser webview is displayed
      And the "Premium Service Checker" header is displayed

  @jira.QANOV-6257 @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34191
  @manual @mobile @o2uk @regression
  Scenario: A legacy user does not have calls in his/her latest airtime bill
    internal_checkpoint="CERT0: in00322v_432556@o2.com(07521008652)"
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has no calls in the Latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     Then the "minutes_chevron" icon is not displayed

  @jira.QANOV-6258 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-6260
  @jira.link.parent_test_plan.QANOV-24141 @mobile @o2uk @regression @qa
  Scenario: A legacy user who has calls with cost in the Latest airtime bill can see all the calls filter options
    internal_checkpoint="CERT0: set532@test.com/test123"
    Given user has a "legacy PAYM" account type
      And user has "minutes" events "with" cost in the latest airtime bill
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bills" page
     When clicks on "last" month in the bills graph
      And clicks on the "bill.see_bill_details_link" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "minutes_entrypoint" entrypoint
      And the "Bill Minutes Consumption" page is displayed
      And clicks on the "filter.button" button
     Then the "filter.all_calls_option" textfield with "All calls" text is displayed
      And the "filter.most_expensive_calls_option" textfield with "Most expensive calls" text is displayed
      And the "filter.longest_calls_option" textfield with "Longest calls" text is displayed
      And the "filter.most_frequent_calls_option" textfield with "Most frequent calls" text is displayed
      And closes the native calls filter

  @jira.QANOV-96376 @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34186
  @automatic @mobile @o2uk @sanity @qa @webapp
  Scenario: A legacy user with 1 line associated to their bill can view all their charged calls in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has "minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "Minutes consumption" header is displayed
      And the "calls_selector" module is displayed
      And the "calls_selector.label" textfield with "Filter by" text is displayed
      And the "calls_selector.all_calls_option" textfield with "All Calls" text is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And waits until the "consumption_graph.y.selected_day_label" element is visible
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field

  @jira.QANOV-6259 @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34186
  @automatic @mobile @o2uk @sanity @qa @webapp
  Scenario: A legacy user with several lines associated to their bill can view all his/her charged calls in the latest airtime bill
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has "minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the eligible msisdn entrypoint in bill
      And the "Bill Concepts" page is displayed
      And clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "Minutes consumption" header is displayed
      And the "calls_selector" module is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "consumption_graph" graph
      And waits until the "consumption_graph.y.selected_day_label" element is visible
      And the "consumption_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "average_usage_label" textfield with "Average usage in period" text is displayed
      And the "average_usage_amount" textfield with the "£\d+.\d\d" format is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34186 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with <num_lines> associated to their bill can view all his/her uncharged calls in the latest airtime bill
    internal_checkpoint="CERT0:
    - only calls without cost: inl_may8842@o2.com(07521116559) --> invalid user, without bills"
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "X > 0" calls without cost in the latest airtime bill
      And user has "0" calls with cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "Minutes Consumption" header is displayed
      And the "calls_selector" module is displayed
      And the "calls_selector.label" textfield with "Filter by" text is displayed
      And the "calls_selector.all_calls_option" textfield with "All Calls" text is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "direction" field

    Examples:
          | num_lines | page                | impeded_label | automation              | jira_id     |
          | 1         | Latest Airtime Bill | impeded_mock  | automation.pending_mock | QANOV-96377 |
          | several   | Bill Concepts       |               |                         | QANOV-6260  |

  @jira.<jira_id> @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34186
  @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with <num_lines> associated to their bill can view the Late landing charges in the Latest airtime bill
    internal_checkpoint="CERT0: inavl0ww_878541@o2.com(07525948396)
    The late landing charges module only is displayed if the charges of this kind are != 0"
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has late landing charges in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is displayed
      And the "Minutes Consumption" header is displayed
      And the "late_landing_module.title" textfield with "Late landing charges" text is displayed
      And the "late_landing_module.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "late_landing_module" are included in the "events_list" list

    Examples:
          | num_lines | page                | jira_id     |
          | 1         | Latest Airtime Bill | QANOV-96378 |
          | several   | Bill Concepts       | QANOV-6261  |

  @jira.QANOV-6262 @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-6260 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34190 @manual @mobile @o2uk @regression
  Scenario: A legacy user can view the most frequent calls in his/her latest airtime bill
    Given user has a "legacy PAYM" account type
      And user has calls in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Minutes Consumption" page
     When clicks on the "calls_selector.button" button
      And clicks on the "filter.most_frequent_calls_option" button
     Then a maximum of "10" calls are displayed
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "calls_counter" field
      And the "events_list" list is ordered "descendant" by "frequency"
      And the "consumption_graph" graph is not displayed
      And the "late_landing_module" entrypoint is not displayed

  @jira.QANOV-6263 @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-6260 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34188 @manual @mobile @o2uk @regression
  Scenario: A legacy user can view the longest calls in his/her latest airtime bill
    Given user has a "legacy PAYM" account type
      And user has calls in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Minutes Consumption" page
     When clicks on the "calls_selector.button" button
      And clicks on the "filter.longest_calls_option" button
     Then a maximum of "10" calls are displayed
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "calls_duration" field
      And the "events_list" list is ordered "descendant" by "duration"
      And the "consumption_graph" graph is not displayed
      And the "call_cost" textfield is not displayed
      And the "late_landing_module" entrypoint is not displayed

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-6260
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34187 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user can view the most expensive calls in his/her latest airtime bill
    internal_checkpoint="CERT0:
    - only calls with cost: 12oc72476237@stf.ref.o2.co.uk(07568414425)
    - calls with and without cost: inavl0ww_878541@o2.com(07525948396)"
    Given user has a "legacy PAYM" account type
      And user has "<number_of_calls_without_cost>" calls without cost in the latest airtime bill
      And user has "<number_of_calls_with_cost>" calls with cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Minutes Consumption" page
     When clicks on the "calls_selector.button" button
      And clicks on the "filter.most_expensive_calls_option" button
     Then a maximum of "10" calls are displayed
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" field
      And the "events_list" list is ordered "descendant" by "cost"
      And the calls without cost are not displayed
      And the "consumption_graph" graph is not displayed
      And the "late_landing_module" entrypoint is not displayed

    Examples:
          | number_of_calls_without_cost | number_of_calls_with_cost | impeded_label | automation              | jira_id    |
          | 0                            | X > 0                     | impeded_mock  | automation.pending_mock | QANOV-6264 |
          | X > 0                        | X > 0                     |               |                         | QANOV-6265 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.1 @jira.link.depends_on.QANOV-6260
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34185 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user can not view his/her most expensive recent calls (because he/she does not have)
    internal_checkpoint="CERT0:
    - only calls without cost (<10): inl_may8842@o2.com(07521116559) --> invalid user, without bills"
    Given user has a "legacy PAYM" account type
      And user has "<number_of_calls_without_cost>" calls without cost in the latest airtime bill
      And user has "<number_of_calls_with_cost>" calls with cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Minutes Consumption" page
     When clicks on the "calls_selector.button" button
     Then the "calls_selector.most_expensive_calls_option" textfield is not displayed
      And closes the native calls filter

    Examples:
          | number_of_calls_without_cost | number_of_calls_with_cost | impeded_label | automation              | jira_id    |
          | 10 > X > 0                   | 0                         |               |                         | QANOV-6266 |
          | X > 10                       | 0                         | impeded_mock  | automation.pending_mock | QANOV-6267 |


  @jira.<jira_id> @<execution_mode> @android @cert0 @cert1 @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-34192 @mobile @o2uk @regression @qa
  Scenario Outline: A legacy user who has only calls without cost in the Latest airtime bill cannot see the "Most expensive calls" option in the calls filter
    internal_checkpoint="CERT1/CERT0: inl_may8842@o2.com --> invalid user, without bills (07521116559), testuser28@o2.com"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "minutes" events "without" cost in the latest airtime bill
      And user has no "minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "minutes_entrypoint" entrypoint
      And the "Bill Minutes Consumption" page is displayed
      And clicks on the "calls_selector.button" button
     Then the "calls_selector.most_expensive_calls_option" textfield is not displayed
      And the "calls_selector.all_calls_option" textfield with "All calls" text is displayed
      And the "calls_selector.longest_calls_option" textfield with "Longest calls" text is displayed
      And the "calls_selector.most_frequent_calls_option" textfield with "Most frequent calls" text is displayed
      And closes the native calls filter

    Examples:
          | num_lines | page                | execution_mode | jira_id    |
          | 1         | Latest Airtime Bill | automatic      | QANOV-6360 |
          | several   | Bill Concepts       | automatic      | QANOV-6361 |

  @jira.<jira_id> @android @ios @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-34184
  @manual @mobile @o2uk @regression
  Scenario Outline: A legacy user with <num_lines> associated to their bill cannot access the Bill Minutes Consumption page if they don't have recent calls
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "0" calls without cost in the latest airtime bill
      And user has "0" calls with cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "minutes_entrypoint" entrypoint
     Then the "Bill Minutes Consumption" page is not displayed
      And the "minutes_chevron" icon is not displayed

    Examples:
          | num_lines | page                | jira_id     |
          | 1         | Latest Airtime Bill | QANOV-96402 |
          | several   | Bill Concepts       | QANOV-6386  |

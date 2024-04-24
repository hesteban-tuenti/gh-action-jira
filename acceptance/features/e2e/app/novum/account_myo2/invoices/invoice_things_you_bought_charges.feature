# -*- coding: utf-8 -*-
@jira.QANOV-127146
Feature: Invoice - Things You Bought Charges


  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47462 @<execution_mode> @mobile @o2uk @<ber> @qa
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the details of "Things you've bought" with charges in the latest airtime bill
    If the user has several lines, he will have to select the desired line before tapping on 'Things you've bought'
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "things you have bought" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "things_you_have_bought_entrypoint" entrypoint
     Then the "Bill Things You Have Bought Consumption" page is displayed
      And the "Things you’ve bought" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "date" field
      And each element in the "events_list" list has the "cost" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | test_priority | jira_id     | ber | execution_mode |
          | legacy PAYM  | 1         | Latest Airtime Bill | sanity        | QANOV-96385 | ber | automatic      |
          | legacy PAYM  | several   | Bill Concepts       | regression    | QANOV-6284  |     | manual         |

    @automation.pending_mock @impeded_mock
    Examples:
          | account_type | num_lines | page                | test_priority | jira_id     | ber | execution_mode |
          | legacy MBB   | 1         | Latest Airtime Bill | regression    | QANOV-96386 |     | manual         |
          | legacy MBB   | several   | Bill Concepts       | regression    | QANOV-6285  |     | manual         |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6285
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47543 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the daily charges in the graph of "Things you've bought" details in the latest airtime bill
    internal_checkpoint="PAYM - testinguser1@o2.com(07801003168)"
    Given user has a "<account_type>" account type
      And user has events "with" cost in the "things_you_have_bought" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Things You Have Bought" page
     Then the "consumption_graph.y.selected_day_label" icon is displayed
      And the "consumption_graph.y.selected_day_label" textfield with the "dd Mmm · £X.XX" format is displayed

    Examples:
          | account_type | automation              | impeded      | jira_id    |
          | legacy PAYM  |                         |              | QANOV-6286 |
          | legacy MBB   | automation.pending_mock | impeded_mock | QANOV-6287 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47462 @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the details of "Things you've bought" without charges in the latest airtime bill
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Things you've bought'
    CERT0: PAYM - inavl0ww_878541@o2.com(07731296925)"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has events "without" cost in the "things_you_have_bought" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "things_you_have_bought" entrypoint
     Then the "Bill Things You Have Bought" page is displayed
      And the "Things you've bought" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill | QANOV-96387 |
          | legacy PAYM  | several   | Bill Concepts       | QANOV-6288  |
          | legacy MBB   | 1         | Latest Airtime Bill | QANOV-96388 |
          | legacy MBB   | several   | Bill Concepts       | QANOV-6289  |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47462 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the late landing charges of "Things you've bought"
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Things you've bought'
    The late landing charges module only is displayed if the charges of this kind are != 0"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has late landing charges in the "things_you_have_bought" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "things_you_have_bought" entrypoint
     Then the "Bill Things You Have Bought" page is displayed
      And the "Things you've bought" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill | QANOV-96389 |
          | legacy PAYM  | several   | Bill Concepts       | QANOV-6290  |
          | legacy MBB   | 1         | Latest Airtime Bill | QANOV-96390 |
          | legacy MBB   | several   | Bill Concepts       | QANOV-6291  |

# -*- coding: utf-8 -*-
@jira.QANOV-127141
Feature: Invoice - Premium Charges


  @jira.<jira_id> @<automation> @<ber> @<execution_mode> @<impeded_label> @<test_priority> @android @ios @jira.cv.10.2
  @jira.link.detects.O2UK-4182 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47461 @mobile @o2uk @qa
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the details of "Premium & information services" with charges in the latest airtime bill
    If the user has several lines, he will have to select the desired line before
    tapping on 'Premium & information services'
    QA: user10@o2ukmocks.com
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "premium and info services" events "with" cost in the latest airtime bill
      And user does not have late landing charges in the "premium and info services" category in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "premium_and_information_services_entrypoint" entrypoint
     Then the "Bill Premium Consumption" page is displayed
      And the "Premium & information services" header is displayed
      And the "total_charges_label" textfield with "Total charges" text is displayed
      And the "total_charges_amount" textfield with the "£\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "date" textfield with the "(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[0-2])\/(20\d\d)" format
      And each element in the "events_list" list has the "sms" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "sms_text" field
      And each element in the "events_list" list has the "time_stamp" textfield with the "\d+:\d\d" format
      And each element in the "events_list" list has the "description" textfield with "Incoming SMS" text
      And each element in the "events_list" list has the "view_details" textfield with "View details" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | impeded_label | automation              | test_priority | ber | execution_mode | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill |               |                         | sanity        | ber | automatic      | QANOV-96391 |
          | legacy PAYM  | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | smoke         |     | manual         | QANOV-6292  |
          | legacy MBB   | 1         | Latest Airtime Bill | impeded_mock  | automation.pending_mock | smoke         |     | manual         | QANOV-96392 |
          | legacy MBB   | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | regression    |     | manual         | QANOV-6293  |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47461 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can click in other day in the graph in "Bill Premium And Information Services Consumption" screen
    If the user has several lines, he will have to select the desired line before
    tapping on 'Premium & information services'
    QA: user10@o2ukmocks.com
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has "premium and info services" events "with" cost in the latest airtime bill
      And user does not have late landing charges in the "premium and info services" category in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "premium_and_information_services_entrypoint" entrypoint
      And the "Bill Premium And Information Services Consumption" page is displayed
      And clicks on the "2" day in the "consumption_graph"
     Then the "consumption_graph.y.selected_day_label" line is displayed in the "2" day
      And the "consumption_graph.y.selected_day_label" textfield is updated with the charges for the "2" day
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | impeded_label | automation              | depends_on  | jira_id      |
          | legacy PAYM  | 1         | Latest Airtime Bill |               |                         | QANOV-96391 | QANOV-287447 |
          | legacy PAYM  | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6292  | QANOV-287448 |
          | legacy MBB   | 1         | Latest Airtime Bill | impeded_mock  | automation.pending_mock | QANOV-96392 | QANOV-287449 |
          | legacy MBB   | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6293  | QANOV-287450 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6293
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47542 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the daily charges in the graph of "Premium & information services" details in the latest airtime bill
    internal_checkpoint="CERT0: testuser11@o2.com"
    Given user has a "<account_type>" account type
      And user has events "with" cost in the "premium_and_information_services" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Premium And Information Services" page
     Then the "consumption_graph.y.selected_day_label" icon is displayed
      And the "consumption_graph.y.selected_day_label" textfield with the "dd Mmm · £X.XX" format is displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6294 |
          | legacy MBB   | impeded_mock  | automation.pending_mock | QANOV-6295 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47461
  @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the details of "Premium & information services" without charges in the latest airtime bill
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Premium & information services'
    CERT0: inl_may8842@o2.com (07521130461)"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has events "without" cost in the "premium_and_information_services" bill section
      And user does not have events "with" cost in the "premium_and_information_services" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "premium_and_information_services" entrypoint
     Then the "Bill Premium And Information Services" page is displayed
      And the "Premium & information services" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "event_sms" icon
      And each element in the "events_list" list has the "event_short_code" field
      And each element in the "events_list" list has the "event_time" field
      And each element in the "events_list" list has the "event_type" field
      And each element in the "events_list" list has the "view_details" link
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill | QANOV-96393 |
          | legacy PAYM  | several   | Bill Concepts       | QANOV-6296  |
          | legacy MBB   | 1         | Latest Airtime Bill | QANOV-96394 |
          | legacy MBB   | several   | Bill Concepts       | QANOV-6297  |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47461 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill can see the late landing charges of "Premium & information services"
    internal_checkpoint="if the user has several lines, he will have to select the desired line before
    tapping on 'Premium & information services'
    The late landing charges module only is displayed if the charges of this kind are != 0"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has late landing charges in the "premium_and_information_services" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "premium_and_information_services" entrypoint
     Then the "Bill Premium And Information Services" page is displayed
      And the "Premium & information services" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_sms_icon" field
      And each element in the "events_list" list has the "event_short_code" field
      And each element in the "events_list" list has the "event_time" field
      And each element in the "events_list" list has the "event_type" field
      And each element in the "events_list" list has the "view_details" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | account_type | num_lines | page                | impeded_label | automation              | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill |               |                         | QANOV-96395 |
          | legacy PAYM  | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6298  |
          | legacy MBB   | 1         | Latest Airtime Bill | impeded_mock  | automation.pending_mock | QANOV-96396 |
          | legacy MBB   | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6300  |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-53589 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see which SMS are premium in the "Premium & Information Services" screen
    internal_checkpoint="CERT0: PAYM - inl_may8842@o2.com (07521130461)"
    Given user has a "<account_type>" account type
      And user has premium sms events in "premium_and_information_services" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Premium And Information Services" page
     Then each element in the "events_list" list has the "premium_sms_icon" field
      And each element in the "events_list" list has the "premium_label" field
      And each element in the "events_list" list has the "view_details" field with "View details" text

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6301 |
          | legacy MBB   | immpeded_mock | automation.pending_mock | QANOV-6302 |

  @jira.<jira_id> @<automation> @<impeded_label @<impeded_label> @android @ios @jira.cv.10.5
  @jira.link.depends_on.QANOV-6302 @jira.link.detects.O2UK-3415 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-53695 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of a premium SMS service
    internal_checkpoint="CERT0: PAYM - inl_may8842@o2.com (07521130461)"
    Given user has a "<account_type>" account type
      And user has premium sms events in "premium_and_information_services" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Bill Premium And Information Services" page
     When clicks on the "view_details" entrypoint
     Then the browser webview is displayed
      And the "Premium Service Checker | Account and billing | Help & Support | O2" header is displayed
      And clicks on the "navigation_top_bar.close" button
      And the "Bill Premium And Information Services" page is displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6304 |
          | legacy MBB   | impeded_mock  | automation.pending_mock | QANOV-6305 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100865 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with <num_lines> associated to their bill is not able to click on Premium & Information services when it has no charges from latest airtime bill
    internal_checkpoint="CERT0: PAYM - inl_may8842@o2.com(07521109498)
    MBB - test30689357@stf.ref.o2.co.uk(07521167878)"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "<num_lines>" mobile lines
      And user has no events in the "premium_and_information_services" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "<page>" page
     When clicks on the "premium_and_information_services" entrypoint
     Then the "<page>" page is displayed
      And the "Bill Premium And Information Services" page is not displayed

    Examples:
          | account_type | num_lines | page                | impeded_label | automation              | jira_id     |
          | legacy PAYM  | 1         | Latest Airtime Bill |               |                         | QANOV-96397 |
          | legacy PAYM  | several   | Bill Concepts       |               |                         | QANOV-6306  |
          | legacy MBB   | 1         | Latest Airtime Bill |               |                         | QANOV-96398 |
          | legacy MBB   | several   | Bill Concepts       | impeded_mock  | automation.pending_mock | QANOV-6307  |

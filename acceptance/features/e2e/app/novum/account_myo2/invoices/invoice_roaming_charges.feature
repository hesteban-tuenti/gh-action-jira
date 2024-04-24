# -*- coding: utf-8 -*-
@jira.QANOV-127143
Feature: Invoice - Roaming Charges


  @jira.<jira_id> @automatic @<test_priority> @android @ios @jira.cv.10.2 @mobile @o2uk @ber
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47463 @webapp
  Scenario Outline: A <account_type> user with 1 mobile line associated to their bill can see the details of "Charges when abroad" charges in the latest airtime bill
    internal_checkpoint="if the user has several lines, he will have to select the desired line before tapping on 'Charges when abroad'.
    PAYM with several lines in last bill(cert0): in00322v_432556@o2.com
    PAYM with 1 line in last bill(cert0): inl_may8842@o2.com(07521130461)
    MBB (cer0): test30689357@stf.ref.o2.co.uk"
    other_affected_versions="2021-08"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "charges_when_abroad_entrypoint" entrypoint
     Then the "Bill Charges When Abroad Consumption" page is displayed
      And the "Charges when abroad" header is displayed
      And the "international_data_entrypoint" entrypoint with "International data" text is displayed
      And the "international_minutes_entrypoint" entrypoint with "International minutes" text is displayed
      And the "international_messages_entrypoint" entrypoint with "International messages" text is displayed
      And the "more_about_international_charges" link with "More about international charges" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Latest Airtime Bill" page is displayed

    @cert0 @cert1
    Examples:
          | account_type | test_priority | jira_id     |
          | legacy PAYM  | sanity        | QANOV-96399 |

    @qa
    Examples:
          | account_type | test_priority | jira_id     |
          | legacy MBB   | regression    | QANOV-96400 |

  @jira.<jira_id> @automatic @<test_priority> @android @ios @jira.cv.10.2 @mobile @o2uk @qa
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47463 @webapp
  Scenario Outline: A <account_type> user with several mobile lines associated to their bill can see the details of "Charges when abroad" charges in the latest airtime bill
    internal_checkpoint="if the user has several lines, he will have to select the desired line before tapping on 'Charges when abroad'.
    PAYM with several lines in last bill(cert0): in00322v_432556@o2.com
    PAYM with 1 line in last bill(cert0): inl_may8842@o2.com(07521130461)
    MBB (cer0): test30689357@stf.ref.o2.co.uk"
    other_affected_versions="2021-08"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
      And waits until the "multimsisdn_entrypoints" list is displayed
     When clicks on any element in the "multimsisdn_entrypoints" list
      And the "Bill Concepts" page is displayed
      And clicks on the "charges_when_abroad_entrypoint" entrypoint
     Then the "Bill Charges When Abroad Consumption" page is displayed
      And the "Charges when abroad" header is displayed
      And the "international_data_entrypoint" entrypoint with "International data" text is displayed
      And the "international_minutes_entrypoint" entrypoint with "International minutes" text is displayed
      And the "international_messages_entrypoint" entrypoint with "International messages" text is displayed
      And the "more_about_international_charges" link with "More about international charges" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Concepts" page is displayed

    Examples:
          | account_type | test_priority | jira_id    |
          | legacy PAYM  | smoke         | QANOV-6308 |
          | legacy MBB   | regression    | QANOV-6309 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-100690 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user who was in Charges when abroad is not able to click on <charge_type> when it has no cost
    internal_checkpoint="CERT0: PAYM - inl_may8842@o2.com(07521109498)
    MBB - test30689357@stf.ref.o2.co.uk(07521167878)"
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has "none" events in the "<charge_type>" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     Then the "<charge_type>" entrypoint is displayed
      And the "charge_type.chevron" icon is not displayed

    Examples:
          | account_type | charge_type            | jira_id    |
          | legacy PAYM  | international_data     | QANOV-6310 |
          | legacy PAYM  | international_minutes  | QANOV-6311 |
          | legacy PAYM  | international_messages | QANOV-6313 |
          | legacy MBB   | international_data     | QANOV-6314 |
          | legacy MBB   | international_messages | QANOV-6315 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47464 @manual @mobile @o2uk @smoke
  Scenario Outline: A <account_type> user can see the details of "International data" with charges in the latest airtime bill
    internal_checckpoint="CERT0: testinguser1@o2.com(07801003168)"
    Given user has a "<account_type>" account type
      And user has events "with" cost in the "international_data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_data" entrypoint
     Then the "International Data" page is displayed
      And the "International data" header is displayed
      And the "total_charges" textfield with the "Total charges £\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_consumed" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-6316 |
          | legacy MBB   | QANOV-6317 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6317 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47544 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the daily charges in the graph of "International data" details in the latest airtime bill
    Given user has a "<account_type>" account type
      And user has events "with" cost in the "international_data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "International Data" page
     When clicks on the "2" day in the "consumption_graph"
     Then the "consumption_graph.y.selected_day_label" line is displayed in the "2" day
      And the "consumption_graph.y.selected_day_label" textfield is updated with the charges for the "2" day

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-6318 |
          | legacy MBB   | QANOV-6319 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47464 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of "International data" without charges in the latest airtime bill
    internal_checkpoint="CERT0: PAYM - inl_may8842@o2.com (07521130461)"
    Given user has a "<account_type>" account type
      And user has events "without" cost in the "international_data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_data" entrypoint
     Then the "International Data" page is displayed
      And the "International data" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "event_consumed" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6320 |
          | legacy MBB   | impeded_mock  | automation.pending_mock | QANOV-6321 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47464 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the late landing charges of "International data"
    internal_checkpoint="The late landing charges module only is displayed if the charges of this kind are != 0"
    Given user has a "<account_type>" account type
      And user has late landing charges in the "international_data" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_data" entrypoint
     Then the "International Data" page is displayed
      And the "International data" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_consumed" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-6323 |
          | legacy MBB   | QANOV-6324 |

  @jira.QANOV-6325 @<ber> @automatic @smoke @android @cert0 @cert1 @ios @jira.cv.10.2 @qa
  @jira.link.depends_on.QANOV-6309 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47466 @mobile @o2uk @webapp
  Scenario: A legacy user can see the details of "International minutes" with charges in the latest airtime bill
    internal_checkpoint="CERT0: inl_may8842@o2.com (07568417604)
    NOTE: for premium international calls, the call icon will be a phone icon with a star
    on the left of it, and a 'view details' link will appear at the end."
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has "international_minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "charges_when_abroad_entrypoint" entrypoint
      And the "Bill Charges When Abroad Consumption" page is displayed
      And clicks on the "international_minutes_entrypoint" entrypoint
     Then the "Bill International Minutes Consumption" page is displayed
      And the "International minutes" header is displayed
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
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "call_type" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Charges When Abroad Consumption" page is displayed

  @jira.QANOV-108942 @automation.pending_mock @automatic @regression @android @cert0 @cert1 @ios @jira.cv.10.2 @qa
  @jira.link.depends_on.QANOV-6309 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47466 @mobile @o2uk @webapp
  Scenario: A legacy user can see the details of "International minutes" with charges in the latest airtime bill
    internal_checkpoint="CERT0: inl_may8842@o2.com (07568417604)
    NOTE: for premium international calls, the call icon will be a phone icon with a star
    on the left of it, and a 'view details' link will appear at the end."
    Given user has a "legacy PAYM" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has "international_minutes" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
      And waits until the "multimsisdn_entrypoints" list is displayed
     When clicks on any element in the "multimsisdn_entrypoints" list
      And the "Bill Concepts" page is displayed
      And clicks on the "charges_when_abroad_entrypoint" entrypoint
      And the "Bill Charges When Abroad Consumption" page is displayed
      And clicks on the "international_minutes_entrypoint" entrypoint
     Then the "Bill International Minutes Consumption" page is displayed
      And the "International minutes" header is displayed
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
      And each element in the "events_list" list has the "call_direction_icon" field
      And each element in the "events_list" list has the "phonenumber" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "time_stamp" field
      And each element in the "events_list" list has the "call_type" field
      And each element in the "events_list" list has the "country_code" field
      And the elements in the "events_list" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Charges When Abroad Consumption" page is displayed

  @jira.QANOV-6326 @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6325 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47546 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the daily charges in the graph of "International minutes" details in the latest airtime bill
    internal_checkpoint="CERT0: inl_may8842@o2.com"
    Given user has a "legacy PAYM" account type
      And user has events "with" cost in the "international_minutes" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "International Minutes" page
     When clicks on the "2" day in the "consumption_graph"
     Then the "consumption_graph.y.selected_day_label" line is displayed in the "2" day
      And the "consumption_graph.y.selected_day_label" textfield is updated with the charges for the "2" day

  @jira.QANOV-6327 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47466 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of "International minutes" without charges in the latest airtime bill
    Given user has a "legacy PAYM" account type
      And user has events "without" cost in the "international_minutes" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_minutes" entrypoint
     Then the "International Minutes" page is displayed
      And the "International minutes" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "event_direction" field
      And each element in the "events_list" list has the "event_direction_icon" field
      And each element in the "events_list" list has the "event_number" field
      And each element in the "events_list" list has the "event_time" field
      And each element in the "events_list" list has the "event_duration" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

  @jira.QANOV-6328 @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47466 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the late landing charges of "International minutes"
    internal_checkpoint="CERT0: gb083240_785792@o2.com
    The late landing charges module only is displayed if the charges of this kind are != 0"
    Given user has a "legacy PAYM" account type
      And user has late landing charges in the "international_minutes" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_minutes" entrypoint
     Then the "International Minutes" page is displayed
      And the "International minutes" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_direction" field
      And each element in the "events_list" list has the "event_direction_icon" field
      And each element in the "events_list" list has the "event_number" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_time" field
      And each element in the "events_list" list has the "event_duration" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47465 @manual @mobile @o2uk
  Scenario Outline: A <account_type> user can see the details of "International messages" with charges in the latest airtime bill
    Given user has a "<account_type>" account type
      And user has events "with" cost in the "international_messages" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_messages" entrypoint
     Then the "International Messages" page is displayed
      And the "International messages" header is displayed
      And the "total_charges" textfield with the "Total charges £\d+.\d\d" format is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the extra charges are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_number" field
      And each element in the "events_list" list has the "event_direction" field
      And each element in the "events_list" list has the "event_type" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

    Examples:
          | account_type | test_priority | jira_id    |
          | legacy PAYM  | smoke         | QANOV-6329 |
          | legacy MBB   | regression    | QANOV-6330 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6330 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-47545 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the daily charges in the graph of "International messages" details in the latest airtime bill
    Given user has a "<account_type>" account type
      And user has events "with" cost in the "international_messages" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "International Messages" page
     When clicks on the "2" day in the "consumption_graph"
     Then the "consumption_graph.y.selected_day_label" line is displayed in the "2" day
      And the "consumption_graph.y.selected_day_label" textfield is updated with the charges for the "2" day

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-6332 |
          | legacy MBB   | QANOV-6333 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47465 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of "International messages" without charges in the latest airtime bill
    internal_checkpoint="CERT0: inl_may8842@o2.com (07521130461)"
    Given user has a "<account_type>" account type
      And user has events "without" cost in the "international_messages" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_messages" entrypoint
     Then the "International Messages" page is displayed
      And the "International messages" header is displayed
      And the "total_charges" textfield is not displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" textfield with "£0.00" text
      And each element in the "events_list" list has the "event_number" field
      And each element in the "events_list" list has the "event_direction" field
      And each element in the "events_list" list has the "event_type" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6334 |
          | legacy MBB   | impeded_mock  | automation.pending_mock | QANOV-6335 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.10.2 @jira.link.depends_on.QANOV-6309
  @jira.link.detects.O2UK-3945 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-47465 @manual @mobile
  @o2uk @regression
  Scenario Outline: A <account_type> user can see the late landing charges of "International messages"
    CERT0: inl_may8842@o2.com (07521130461)
    The late landing charges module will be displayed as long as there are any 'lateLanding' charges, and the cost
    shown is the sum of all these individual charges (it could be 0 pounds if all lateLanding charges have cost 0)
    Given user has a "<account_type>" account type
      And user has late landing charges in the "international_messages" bill section
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Charges When Abroad" page
     When clicks on the "international_messages" entrypoint
     Then the "International Messages" page is displayed
      And the "International messages" header is displayed
      And the "late_landing_title" textfield with "Late landing charges" text is displayed
      And the "late_landing_description" textfield with "Charges from previous bills charged now" text is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "event_sms_icon" field
      And each element in the "events_list" list has the "event_international_number" field
      And each element in the "events_list" list has the "event_date" field
      And each element in the "events_list" list has the "event_cost" field
      And each element in the "events_list" list has the "event_number" field
      And each element in the "events_list" list has the "event_direction" field
      And each element in the "events_list" list has the "event_type" field
      And each element in the "events_list" list has the "event_country" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Charges When Abroad" page is displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | legacy PAYM  |               |                         | QANOV-6336 |
          | legacy MBB   | impeded_mock  | automation.pending_mock | QANOV-6337 |

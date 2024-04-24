# -*- coding: utf-8 -*-
@jira.QANOV-127134
Feature: Invoice - Monthly Extras Charges


  @jira.<jira_id> @android @ios @jira.cv.9.15 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-38656
  @<execution_mode> @mobile @o2uk @<test_priority> @<ber> @qa
  Scenario Outline: A <account_type> user with 1 mobile lines in their bill can see the details of the Monthly Extra charges in the Latest airtime bill
    PAYM (CERT0): inl_may8842@o2.com --> invalid user, without bills (07521130461), inavl0ww_878541@o2.com
    MBB (CERT0): test30689357@stf.ref.o2.co.uk
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "1" mobile lines
      And user has "monthly_extras" events "with" cost in the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "monthly_extras_entrypoint" entrypoint
     Then the "Bill Monthly Extras Consumption" page is displayed
      And the "Monthly extras" header is displayed
      And the "events_list" list is displayed
      And the elements in the "events_list" list are ordered by date descendant
      And each element in the "events_list" list has the "date" textfield with the "(0?[1-9]|[12][0-9]|3[01])\/(0?[1-9]|1[0-2])\/(20\d\d)" format
      And each element in the "events_list" list has the "title" field
      And each element in the "events_list" list has the "cost" textfield with the "£\d+.\d\d" format
      And each element in the "events_list" list has the "expiration_date" textfield with the "Expires at the end of (\d{1,2} )?(Jan|Feb|Mar|Abr|Apr|May|Jun|Jul|Ago|Aug|Sep|Oct|Nov|Dec) \'\d\d" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Latest Airtime Bill" page is displayed

    Examples:
          | account_type | jira_id    | test_priority | ber | execution_mode |
          | legacy PAYM  | QANOV-6377 | sanity        | ber | automatic      |
          | legacy MBB   | QANOV-6378 | smoke         |     | manual         |

  @jira.<jira_id> @<automation> @android @ios @jira.cv.9.15 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-38656 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with several mobile lines in their bill can see the details of the Monthly Extra charges in the Latest airtime bill
    PAYM (CERT0): in00322v_432556@o2.com
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And user has the latest airtime bill with "several" mobile lines
      And user has charges under the "monthly_extras" category of the latest airtime bill
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page
      And user is in the "Latest Airtime Bill" page
     When clicks on the "lead_msisdn_entry" entrypoint
      And the "Bill Concepts" page is displayed
      And clicks on the "monthly_extras" link
     Then the "Monthly Extras" page is displayed
      And the "Monthly Extras" header is displayed
      And the "extras_list" list is displayed
      And each element in the "extras_list" list has the "start_date" textfield with the "\d{1,2}\/\d{1,2}\/\d{4}" format
      And each element in the "extras_list" list has the "charge_name" field
      And each element in the "extras_list" list has the "charge_cost" textfield with the "£XX.XX" format
      And each element in the "extras_list" list has the "end_date" textfield with the "Expires at the end of dd/mm/yyyy" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Latest Airtime Bill" page is displayed

    Examples:
          | account_type | automation              | jira_id    |
          | legacy PAYM  |                         | QANOV-6379 |
          | legacy MBB   | automation.pending_mock | QANOV-6380 |

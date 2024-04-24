# -*- coding: utf-8 -*-
@jira.QANOV-474604
Feature: Invoice History


  @jira.QANOV-474605 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity @vivobr
  Scenario: A beatrix;multivivo;convergente user can see "Bills History" module in Bills Central page
    Given user has a "beatrix;multivivo;convergente" account type
      And user has "any" bills for "<=4" months
      And user is in the "Bills Central" page
     Then the "bills_history" module is displayed
      And the "bills_history" list has "<=4" elements
      And each element in the "bills_history" list has the "icon" field
      And each element in the "bills_history" list has the "month_name" field
      And each element in the "bills_history" list has the "bill_status" field
      And each element in the "bills_history" list has the "price" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "bills_history" list has the "chevron" field
      And the "bills_history_link" link is not displayed

  @jira.QANOV-474608 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: A beatrix;multivivo;convergente user can see "bills_history_link" link in "Bills History" module in Bills Central page
    Given user has a "beatrix;multivivo;convergente" account type
      And user has "any" bills for ">4" months
      And user is in the "Bills Central" page
     Then the "bills_history" module is displayed
      And the "bills_history" list has "4" elements
      And each element in the "bills_history" list has the "icon" field
      And each element in the "bills_history" list has the "month_name" field
      And each element in the "bills_history" list has the "bill_status" field
      And each element in the "bills_history" list has the "price" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" format
      And each element in the "bills_history" list has the "chevron" field
      And the "bills_history_link" link is displayed

  @jira.QANOV-474611 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: A beatrix;multivivo;convergente user has ">1" bills with same status in "Bills History" module
    Given user has a "beatrix;multivivo;convergente" account type
      And user has ">1" bills with the same status for "any" months
      And user is in the "Bills Central" page
     Then the "bills_history" module is displayed
      And any element in the "bills_history" list has the "bill_status" textfield with the "\d \w+" format

  @jira.QANOV-474612 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: A beatrix;multivivo;convergente user has ">1" bills with different status in "Bills History" module
    Given user has a "beatrix;multivivo;convergente" account type
      And user has ">1" bills with different status for "any" months
      And user is in the "Bills Central" page
     Then the "bills_history" module is displayed
      And any element in the "bills_history" list has the "bill_status" textfield with all bills status

  @jira.QANOV-474613 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity @vivobr
  Scenario: A beatrix;multivivo;convergente user can see "Bills History Detail" page
    Given user has a "beatrix;multivivo;convergente" account type
      And user has "any" bills for ">4" months
      And user has "any" bills for "<=12" months
      And user is in the "Bills Central" page
     When clicks on the "bills_history_link" link
     Then the "Bills History Detail" page is displayed
      And the "bills_history_details.title" textfield with "Histórico de faturas" text is displayed
      And the "bills_history_details.year" textfield is displayed
      And the "bills_history_details" list has ">4" elements
      And the "bills_history_details" list has "<=12" elements
      And the "bills_history_details" list is ordered "descendent" by "date"
      And each element in the "bills_history" list has the "icon" field
      And each element in the "bills_history" list has the "month_name" field
      And each element in the "bills_history" list has the "bill_status" field
      And each element in the "bills_history" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-474616 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: A beatrix;multivivo;convergente user can see "Bills History Detail" page for ">12" months
    Given user has a "beatrix;multivivo;convergente" account type
      And user has "any" bills for ">12" months
      And user is in the "Bills Central" page
     When clicks on the "bills_history_link" link
     Then the "Bills History Detail" page is displayed
      And the "bills_history_details.title" textfield with "Histórico de faturas" text is displayed
      And the "bills_history_details.year" textfield is displayed
      And the "bills_history_details" list has "12" elements
      And the "bills_history_details" list is ordered "descendent" by "date"
      And each element in the "bills_history" list has the "icon" field
      And each element in the "bills_history" list has the "month_name" field
      And each element in the "bills_history" list has the "bill_status" field
      And each element in the "bills_history" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-474619 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity @vivobr
  Scenario: A beatrix;multivivo;convergente user can see "Bills History Detail Month" page
    Given user has a "beatrix;multivivo;convergente" account type
      And user has "any" bills for "any" months
      And user is in the "Bills Central" page
     When clicks on any element in the "bills_history" list
     Then the "Bills History Detail Month" page is displayed
      And the "bills_history_details_month.title" textfield that contains the "Faturas de" text is displayed
      And the "bills_summary" card is displayed

  @jira.QANOV-474622 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: A beatrix;multivivo;convergente user can see "Bills History Detail" page when has more than 1 bill for month
    Given user has a "beatrix;multivivo;convergente" account type
      And user has ">1" bills for "any" months
      And user is in the "Bills Central" page
     When clicks on month with ">1" bills in the "bills_history" list
     Then the "Bills History Detail Month" page is displayed
      And the "bills_history_details_month.title" textfield that contains the "Faturas de" text is displayed
      And the "bills_summary" list has ">1" elements

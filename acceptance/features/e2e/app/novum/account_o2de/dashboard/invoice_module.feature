# -*- coding: utf-8 -*-
@jira.QANOV-47706
Feature: Invoice module

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has the "invoices-chart" module configured in CMS for "dashboard" page
      And user is in the "Account" page


  @jira.QANOV-295144 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @o2de
  @regression
  Scenario: Postpay user cannot see the last bills in the account dashboard if an error occurs when requesting this information
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has bills
      And user has the matching subscription selected in the account
     When pulls down the page to refresh
      And there is an API error when requesting the billing information
     Then the "Account" page is displayed
      And the "bills" module is displayed
      And the "bills.internal_error_bills_title_textfield" textfield with "[LANG:account.dashboard.internal_error_bills_title]" text is displayed
      And the "bills.internal_error_bills_subtitle_textfield" textfield with "[LANG:account.dashboard.internal_error_bills_subtitle]" text is displayed

  @jira.QANOV-47708 @android @ios @jira.cv.14.2 @jira.link.detects.O2DE-273 @automatic @mobile @o2de @smoke @webapp @qa
  Scenario: Postpay user without bills can see the empty-case message in the account dashboard
    Given user has no bills
      And user has the matching subscription selected in the account
     Then the "bills" module is displayed
      And the "bills.empty_case_icon" icon is displayed
      And the "bills.empty_case_title" textfield with "[LANG:account.dashboard.no_bills_title]" text is displayed
      And the "bills.empty_case_subtitle" textfield with "[LANG:account.dashboard.no_bills_subtitle]" text is displayed

  @jira.QANOV-47709 @android @ber @ios @jira.cv.14.2 @automatic @mobile @o2de @sanity @webapp @live @next
  @jira.link.parent_test_plan.QANOV-437471
  Scenario: Postpay user can see the invoice module in the account dashboard
    If the user has bills for more than 6 months, the pagination will be displayed under the bills graph. The user can
    see 24 invoices in total.
    Given user has bills
      And user has the matching subscription selected in the account
     Then the "bills" module is displayed
      And the "bills.title" textfield with "NEUESTE RECHNUNGEN" text is displayed
      And the "bills.chart.selection_title" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "bills.chart.selection_amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills.chart.carousel" graph is displayed
      And the last invoice of the "bills.chart" invoices chart is selected
      And the "bills.chart.see_all_invoices_link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

  @jira.QANOV-47710 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  Scenario: Postpay user can see a positive bill in the account dashboard
    Given user has a month with "positive" bill
      And user has the matching subscription selected in the account
     When clicks on the eligible month in the bills graph
     Then the "bills.month_textfield" textfield is displayed
      And the "bills.amount_textfield" textfield with the "\d+,\d\d €" format is displayed
      And the "bills_graph" graph is displayed
      And the "bills.link" link is displayed

  @jira.QANOV-47711 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  Scenario: Postpay user can see a negative bill in the account dashboard
    Given user has a month with "negative" bill
      And user has the matching subscription selected in the account
     When clicks on the eligible month in the bills graph
     Then the "bills.month_textfield" textfield is displayed
      And the "bills.amount_textfield" textfield with the "-\d+,\d\d €" format is displayed
      And the "bills_graph" graph is displayed
      And the "bills.link" link is displayed

  @jira.QANOV-47712 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  Scenario: Postpay user can see a month without bill in the account dashboard
    Given user has a month with "no" bill
      And user has the matching subscription selected in the account
     When clicks on the eligible month in the bills graph
     Then the "bills.month_textfield" textfield is displayed
      And the "bills.amount_textfield" textfield with "-,--" text is displayed
      And the "bills_graph" graph is displayed
      And the "bills.link" link is displayed

  @jira.QANOV-47713 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  @jira.link.parent_test_plan.QANOV-437471
  Scenario: Postpay user can select another month in the bills graph of the account dashboard
    Given user has bills for "some" months
      And user has the matching subscription selected in the account
     When clicks on a different month in the bills graph
     Then the "bills.month_textfield" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the month in "bills.month_textfield" textfield corresponds with the month selected in the bills graph
      And the "bills.amount_textfield" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_graph" graph is displayed
      And the eligible month is selected in the bills graph
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

  @jira.QANOV-204347 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  Scenario: Postpay user with 6 or less months with bills won't see the bills graph paginated in the account dashboard
    Given user has bills for "<=6" months
      And user has the matching subscription selected in the account
     Then the "bills_graph" graph is not paginated

  @jira.QANOV-204348 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  Scenario: Postpay user with more than 6 months with bills will see the bills graph paginated in the account dashboard
    User can see bills for the last 24 months.
    Given user has bills for ">6" months
      And user has the matching subscription selected in the account
     Then the "bills_graph" graph is paginated

  @jira.QANOV-204349 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47709 @manual @mobile @o2de @regression
  Scenario: Postpay user can see bills for the last 24 months in the account dashboard
    Given user has bills for ">6" months
      And user has the matching subscription selected in the account
     When swipes the "bills_graph" carousel in "right" direction
      And clicks on the eligible month in the bills graph
     Then the "bills.month_textfield" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the month in "bills.month_textfield" textfield corresponds with the month selected in the bills graph
      And the "bills.amount_textfield" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_graph" graph is displayed
      And the eligible month is selected in the bills graph
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

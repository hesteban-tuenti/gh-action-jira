# -*- coding: utf-8 -*-
@jira.QANOV-126315
Feature: Invoice Module


  @jira.QANOV-6892 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.detects.ACCOUNT-13891 @ber
  @jira.link.detects.MOVES-4606 @jira.link.relates_to.NOV-47883 @moves @smoke 
  @jira.link.parent_test_plan.QANOV-189597 @impeded_legacy
  Scenario: Legado postpay user can see the bills section in the Account screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has bills for "some" months
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "bills.month_text" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bills.amount_text" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bills_graph" graph is displayed
      And the "last" month is selected in the bills graph
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

  @jira.QANOV-6845 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.detects.ACCOUNT-13891
  @jira.link.relates_to.NOV-53268 @moves @regression @impeded_legacy
  Scenario: Legado postpay user can select another month in the Main account screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has bills for "some" months
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on a different month in the bills graph
     Then the eligible month is selected in the bills graph

  @jira.QANOV-6844 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.detects.ACCOUNT-13891
  @jira.link.relates_to.NOV-47893 @moves @regression @impeded_legacy
  Scenario: Legado postpay user with a negative bill can see it in Main account screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a month with "negative" bill
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
     Then the "bills.month_text" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bills.amount_text" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bills_graph" graph is displayed
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

  @jira.QANOV-6846 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.detects.ACCOUNT-13891
  @jira.link.relates_to.NOV-64291 @moves @regression @impeded_legacy
  Scenario: Legado postpay user can select month without bills in the Main account screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a month with "no" bill
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
     Then the "bills.month_text" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bills.amount_text" textfield with "-,--" text is displayed
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

  @jira.QANOV-6893 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.detects.ACCOUNT-13891
  @jira.link.relates_to.NOV-47882 @moves @smoke @ber @jira.link.parent_test_plan.QANOV-189597 @impeded_legacy
  Scenario: Legado postpay user without bills can see the empty-case message
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has no bills
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "bills.no_bills_icon" icon is displayed
      And the "bills.no_bills_title" textfield with "[LANG:account.dashboard.no_bills_title]" text is displayed
      And the "bills.no_bills_subtitle" textfield with "[LANG:account.dashboard.no_bills_subtitle]" text is displayed

  @jira.QANOV-6894 @automation.pending_mock @android @ios @mobile @jira.cv.10.5 @no_automatable
  @jira.link.detects.ACCOUNT-13891 @jira.link.relates_to.NOV-47891 @moves @regression @impeded_legacy
  Scenario: Legado postpay user with bills for all months can see them in the Account screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has bills for "6" months
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "bills.month_text" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bills.amount_text" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "last" month is selected in the bills graph
      And all the bills have amounts
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-5030
Feature: Topup entry point


  @jira.QANOV-133882 @android @ber @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @smoke
  @vivobr @old_app
  Scenario: A legacy prepay user can request a topup from the account dashboard
    Given user has a "legacy prepay" account type
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "balance_module.topup_button" link
     Then the internal webview is displayed
      And the "Faça uma recarga" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @ber @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-311687 @manual @mobile @sanity
  @jira.link.parent_test_plan.QANOV-476782 @vivobr @old_app
  Scenario Outline: A <account_type> user can go to top up screen from topup tab
    Given user has a "<account_type>" account type
      And user has "1" plans
      And initiate the app
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.topup_tab" tab
     Then the internal webview is displayed
      And the "Recarga" header is displayed

    Examples:
          | account_type  | jira_id      |
          | jeri prepay   | QANOV-312686 |
          | legacy prepay | QANOV-312687 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-311687 @manual @mobile
  @vivobr @old_app
  Scenario Outline: A <account_type> user with several prepay plans can see Disambiguation screen from topup tab
    Given user has a "<account_type>" account type
      And has "several" prepay plans
      And user does not have any "convergente;beatrix;multivivo;jeri control;jeri postpay;control_n;legacy postpay;legacy control" account types
      And initiate the app
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.topup_tab" tab
     Then the "Line Disambiguation" page is displayed
      And the "Recargas" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "lines.list" list is displayed
      And each element in the "lines.list" list has the "icon" field
      And each element in the "lines.list" list has the "subtitle" field
      And each element in the "lines.list" list has the "title" field
      And the "phone_number" field of "lines.list" list entries will match the user mobile lines whose account type is not any of "convergente;beatrix;multivivo;jeri control;jeri postpay;control_n;legacy postpay;legacy control;vivo easy"

    Examples:
          | priority   | account_type  | jira_id      |
          | sanity     | jeri prepay   | QANOV-312688 |
          | regression | legacy prepay | QANOV-312689 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-311687 @manual @mobile
  @vivobr @old_app
  Scenario Outline: A <account_type> user with several prepay plans can go to top up screen from topup tab
    Given user has a "<account_type>" account type
      And has "several" prepay plans
      And user does not have any "convergente;beatrix;multivivo;jeri control;jeri postpay;control_n;legacy postpay;legacy control" account types
      And initiate the app
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.topup_tab" tab
     Then the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Disambiguation" page is displayed

    Examples:
          | priority   | account_type  | jira_id      |
          | sanity     | jery prepay   | QANOV-312691 |
          | regression | legacy prepay | QANOV-312692 |

  @jira.QANOV-360494 @android @ios @jira.cv.14.6 @manual @mobile @smoke @vivobr @old_app
  Scenario: Multiplan user can see that topup tab is autorefreshed
    Given user has any "jeri prepay;legacy prepay" account types
      And has "several" prepay plans
      And user does not have any "convergente;beatrix;multivivo;jeri control;jeri postpay;control_n;legacy postpay;legacy control" account types
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.topup_tab" tab
     Then the "Line Disambiguation" page is autorefreshed
      And the "Line Disambiguation" page is displayed

  @jira.QANOV-360495 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: Monoplan user can see that topup tab is autorefreshed
    Given user has any "jeri prepay;legacy prepay" account types
      And user has "1" plans
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.topup_tab" tab
     Then the "Topup Tab" page is autorefreshed
      And the internal webview is displayed
      And the "Faça uma recarga" header is displayed

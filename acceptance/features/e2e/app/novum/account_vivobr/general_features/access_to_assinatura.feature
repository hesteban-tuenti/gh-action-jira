# -*- coding: utf-8 -*-
@jira.QANOV-388282
Feature: Access to Assinaturas


  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A <account_type> user selects Assinatura tab: Assinatura screen is displayed with the proper information
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Loja" page
     When clicks on the "navigation_tab_bar.assinatura" tab
     Then the "Assinatura" page is displayed
      And the "navigation_top_bar.menu_icon" icon is displayed
      And the "navigation_top_bar.question_icon" icon is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-388284 |
          | convergente  |     | QANOV-388285 |
          | multivivo    |     | QANOV-388287 |
          | jeri         |     | QANOV-388288 |
          | legacy       | ber | QANOV-388289 |
          | control_n    |     | QANOV-388290 |

  @jira.QANOV-388291 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario: User who is in Assinatura screen can see menu icon and question icon in grey color
    Given user is in the "Loja" page
     When clicks on the "navigation_tab_bar.assinatura" tab
     Then the "Assinatura" page is displayed
      And the "navigation_top_bar.menu_icon" icon is displayed in "grey" color
      And the "navigation_top_bar.question_icon" icon is displayed in "grey" color

  @jira.QANOV-603270 @android @har @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr
  Scenario: Assinatura page is autorefreshed
    Given user is in the "Assinatura" page
     When pulls down the page to refresh
     Then the "refresh_top_spinner" icon is displayed in "purple" color
      And the "Assinatura" page is autorefreshed
      And the "Assinatura" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-388309
Feature: Financas Access


  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke
  @vivobr @<har>
  Scenario Outline: User who is in the <main_tab> tab can access to the Finanças screen
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.financas" tab
     Then the "Financas" page is displayed
      And the "navigation_top_bar.menu_icon" icon is displayed

    Examples:
          | main_tab      | ber |  har  | jira_id      |
          | Assinatura    | ber |       | QANOV-388310 |
          | Start         |     |  har  | QANOV-388311 |
          | Vivo Valoriza |     |       | QANOV-388312 |
          | Explore       |     |       | QANOV-388314 |

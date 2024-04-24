# -*- coding: utf-8 -*-
@jira.QANOV-388298
Feature: Beneficios Access


  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke
  @vivobr @<har>
  Scenario Outline: User who is in the <main_tab> tab can access to the Beneficios screen
    Given user has any "convergente;multivivo;beatrix;legacy;jeri;control_n" account types
      And user does not have any "legacy prepay;jeri prepay" account types
      And user has a "any" plan in "no cancelled" status
      And user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.beneficios" tab
     Then the "Vivo Valoriza" page is displayed
      And the "navigation_top_bar.menu_icon" icon is displayed
      And the "navigation_top_bar.ticket_icon" icon is displayed

    Examples:
          | main_tab   | ber | har |jira_id      |
          | Assinatura | ber |     |QANOV-388299 |
          | Start      |     | har |QANOV-388301 |
          | Explore    |     |     |QANOV-388302 |
          | Financas   |     |     |QANOV-388303 |

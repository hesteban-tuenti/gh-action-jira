# -*- coding: utf-8 -*-
@jira.QANOV-388380
Feature: Menu Mais Access


  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke
  @vivobr
  Scenario Outline: User who is in the <main_tab> tab can access to the Menu screen
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.menu_icon" icon
     Then the "Menu Mais" page is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "navigation_top_bar.profile_icon" icon is displayed
      And the "menu_title" textfield with "Tudo do app você encontra aqui." text is displayed
      And the "mosaico_carousel" carousel is displayed
      And the "mosaico_carousel_title" textfield is displayed
      And the "mosaico_carousel_list" list is displayed
      And each element in the "mosaico_carousel_list" carousel has the "icon" field
      And each element in the "mosaico_carousel_list" carousel has the "name" field
      And the "services_list" list is displayed
      And each element in the "services_list" list has the "icon" field
      And each element in the "services_list" list has the "title" field
      And each element in the "services_list" list has the "chevron" field
      And the "navigation_tab_bar" tab is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<main_tab>" page is displayed

    Examples:
          | main_tab      | ber | jira_id      |
          | Assinatura    | ber | QANOV-388381 |
          | Explore       |     | QANOV-388382 |
          | Vivo Valoriza |     | QANOV-388383 |
          | Financas      |     | QANOV-388385 |
          | Start         |     | QANOV-388386 |

  @jira.QANOV-388387 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr @har
  Scenario: User who is in Menu screen can see back button and profile icon in grey color
    Given user is in the "Assinatura" page
     When clicks on the "navigation_top_bar.menu_icon" icon
     Then the "Menu Mais" page is displayed
      And the "navigation_top_bar.back_button" button is displayed in "grey" color
      And the "navigation_top_bar.profile_icon" icon is displayed in "grey" color
      And clicks on the "navigation_top_bar.back_button" button
      And the "Menu Mais" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario Outline: User who is in <main_tab> screen can access to the Menu screen if swap in the <main_tab> screen
    Given user is in the "<main_tab>" page
     When swipes from "right to left" in the page
     Then the "Menu Mais" page is displayed

    Examples:
          | main_tab      | jira_id      |
          | Assinatura    | QANOV-388388 |
          | Explore       | QANOV-388389 |
          | Vivo Valoriza | QANOV-388390 |
          | Financas      | QANOV-388391 |
          | Start         | QANOV-388392 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario Outline: User who is in Menu screen can access to the <main_tab> screen if swap in the Menu screen
    Given user is in the "<main_tab>" page
     When swipes from "right to left" in the page
      And the "Menu Mais" page is displayed
      And swipes from "left to right" in the page
     Then the "<main_tab>" page is displayed

    Examples:
          | main_tab      | jira_id      |
          | Assinatura    | QANOV-388394 |
          | Explore       | QANOV-388395 |
          | Vivo Valoriza | QANOV-388396 |
          | Financas      | QANOV-388397 |
          | Start         | QANOV-388398 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual
  @mobile @vivobr
  Scenario Outline: User who is in the <main_tab> tab can access to the Menu screen and see an error message during a maintenance window
    Given user is in the "<main_tab>" page
      And there is a maintenance window
     When clicks on the "navigation_top_bar.menu_icon" icon
     Then the "Menu Mais Error" page is displayed
      And the "error_icon" icon is displayed
      And the "title" textfield is displayed
      And the "subtitle" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<main_tab>" page is displayed

    Examples:
          | main_tab      | ber | priority   | jira_id      |
          | Assinatura    | ber | sanity     | QANOV-517447 |
          | Explore       |     | regression | QANOV-517448 |
          | Vivo Valoriza |     | regression | QANOV-517449 |
          | Financas      |     | regression | QANOV-517450 |
          | Start         |     | regression | QANOV-517451 |

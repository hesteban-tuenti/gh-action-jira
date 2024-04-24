# -*- coding: utf-8 -*-
@jira.QANOV-599453
Feature: Menu Mais Services Access


  @jira.<jira_id> @<har> @<priority> @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile
  @vivobr
  Scenario Outline: A <account_type> user can access to the Aura screen from the Menu Mais screen on Android devices
    Given user has a "<account_type>" account type
      And user is in the "Menu Mais" page
     When clicks on the "chat" button
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Menu Mais" page is displayed

    Examples:
          | account_type | priority | har | jira_id      |
          | legacy       | smoke    |     | QANOV-599454 |
          | convergente  | smoke    |     | QANOV-599456 |
          | beatrix      | smoke    | har | QANOV-599457 |
          | multivivo    | sanity   |     | QANOV-599458 |
          | jeri         | smoke    |     | QANOV-599459 |
          | control_n    | smoke    |     | QANOV-599460 |

  @jira.<jira_id> @<priority> @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @vivobr
  Scenario Outline: A <account_type> user can access to the Aura screen from the Menu Mais screen on iOS devices
    Given user has a "<account_type>" account type
      And user is in the "Menu Mais" page
     When clicks on the "chat" button
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Menu Mais" page is displayed

    Examples:
          | account_type | priority | har | jira_id      |
          | legacy       | smoke    |     | QANOV-599461 |
          | convergente  | smoke    |     | QANOV-599462 |
          | beatrix      | smoke    | har | QANOV-599463 |
          | multivivo    | sanity   |     | QANOV-599465 |
          | jeri         | smoke    |     | QANOV-599467 |
          | control_n    | smoke    |     | QANOV-599468 |

  @jira.QANOV-605611 @android @har @ios @jira.cv.24.3 @manual @mobile @smoke @vivobr
  Scenario: User can access to any deeplink from Aura screen
    Given user is in the "Menu Mais" page
     When clicks on the "chat" button
      And the "Aura Chat" page is displayed
      And fills the "chat_inputtext" inputtext with the "Meu plano" text
      And clicks on the "send" button
      And the aura response is displayed
      And clicks on the "acessar_faturas" link
     Then the "Bills Central" page is displayed

  @jira.QANOV-605612 @android @ios @jira.cv.24.3 @manual @mobile @regression @vivobr
  Scenario: User can access to the Aura screen cached
    Given user is in the "Menu Mais" page
     When clicks on the "chat" button
      And the "Aura Chat" page is displayed
      And the "Aura Chat" page is cached
      And opens the "Tabmais.Aura Title" deeplink with the app in "background" status
     Then the "camera" button is displayed
      And the "attach_file" button is displayed

  @jira.QANOV-599469 @android @har @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @sanity
  @vivobr
  Scenario: A user that has an eSIM compatible device will see the module in the Menu Mais screen
    The eSIM module should be a card in the quick_access_carousel module.
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has a device with eSIM capabilities
      And user is in the "Menu Mais" page
     Then the "esim_card" button is displayed

  @jira.QANOV-599470 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @smoke @vivobr
  Scenario: A user that has not an eSIM compatible device will not see the module in the Menu Mais screen
    The eSIM module should be a card in the quick_access_carousel module.
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user does not have a device with eSIM capabilities
      And user is in the "Menu Mais" page
     Then the "esim_card" button is not displayed

  @jira.QANOV-599471 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @regression
  @vivobr
  Scenario: A user that has an eSIM compatible device will see Aura page from the Menu Mais screen
    User is redirected to Aura chat
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has a device with eSIM capabilities
      And user is in the "Menu Mais" page
     When clicks on the "esim_card" button
     Then the internal webview with the "Ativar eSIM" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Menu Mais" page is displayed

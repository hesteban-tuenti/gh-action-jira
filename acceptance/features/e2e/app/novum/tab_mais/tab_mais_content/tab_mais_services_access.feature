# -*- coding: utf-8 -*-
@jira.QANOV-249046
Feature: Tab Mais Services Access

  Actions Before each Scenario:
    Given user has the "other_options_list" module configured in CMS for "tab_mais" page


  @jira.<jira_id> @<priority> @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @vivobr
  @old_app
  Scenario Outline: A <account_type> user can access to the Aura screen from the Tab Mais screen on Android devices
    Given user has a "<account_type>" account type
      And user has any "platinum;V" segmentation
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.chat" button
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tab Mais" page is displayed

    Examples:
          | account_type | priority | jira_id      |
          | legacy       | smoke    | QANOV-249047 |
          | convergente  | smoke    | QANOV-249048 |
          | beatrix      | smoke    | QANOV-249049 |
          | multivivo    | sanity   | QANOV-249050 |
          | jeri         | smoke    | QANOV-249051 |
          | control_n    | smoke    | QANOV-249052 |

  @jira.<jira_id> @<priority> @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @vivobr
  @old_app
  Scenario Outline: A <account_type> user can access to the Aura screen from the Tab Mais screen on iOS devices
    Given user has a "<account_type>" account type
      And user has any "platinum;V" segmentation
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.chat" button
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tab Mais" page is displayed

    Examples:
          | account_type | priority | jira_id      |
          | legacy       | smoke    | QANOV-437334 |
          | convergente  | smoke    | QANOV-437335 |
          | beatrix      | smoke    | QANOV-437336 |
          | multivivo    | sanity   | QANOV-437337 |
          | jeri         | smoke    | QANOV-437339 |
          | control_n    | smoke    | QANOV-437344 |

  @jira.QANOV-249053 @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @regression @vivobr
  @old_app
  Scenario: A user can access to the Aura screen from the Ajuda screen on Android devices
    Given user has any "platinum;V" segmentation
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.help" button
      And the "Help" page is displayed
      And clicks on the "chat" entrypoint
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Help" page is displayed

  @jira.QANOV-437345 @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @regression @vivobr
  @old_app
  Scenario: A user can access to the Aura screen from the Ajuda screen on iOS devices
    Given user has any "platinum;V" segmentation
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.help" button
      And the "Help" page is displayed
      And clicks on the "chat" entrypoint
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Help" page is displayed

  @jira.QANOV-376080 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: A user that has an eSIM compatible device will see the module in the Tab Mais screen
    The eSIM module should be a card in the quick_access_carousel module.
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user has a device with eSIM capabilities
      And user is in the "Tab Mais" page
     Then the "snapcard_esim_card" card is displayed
      And the "snapcard_esim_card.esim_icon" icon is displayed
      And the "snapcard_esim_card.title" textfield is displayed

  @jira.QANOV-376082 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A user that has not an eSIM compatible device will not see the module in the Tab Mais screen
    The eSIM module should be a card in the quick_access_carousel module.
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user does not have a device with eSIM capabilities
      And user is in the "Tab Mais" page
     Then the "snapcard_esim_card" card is not displayed

  @jira.QANOV-376741 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user that has an eSIM compatible device will see Aura page from the Tab Mais screen
    User is redirected to Aura chat
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user has a device with eSIM capabilities
      And user is in the "Tab Mais" page
     When clicks on the "snapcard_esim_card" card
     Then the internal webview with the "Ativar eSIM" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Tab Mais" page is displayed

  @jira.QANOV-376084 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: A user that has an eSIM compatible device will see the entrypoint in the more options screen
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user has a device with eSIM capabilities
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.more_options" entrypoint
     Then the "esim_entrypoint" entrypoint is displayed

  @jira.QANOV-376085 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A user that has not an eSIM compatible device will not see the entrypoint in the more options screen
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user does not have a device with eSIM capabilities
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.more_options" entrypoint
     Then the "More Options" page is displayed
      And the "esim_entrypoint" entrypoint is not displayed

  @jira.QANOV-376742 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user that has an eSIM compatible device will see Aura page from the more options screen
    User is redirected to Aura chat
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user has a device with eSIM capabilities
      And user is in the "Tab Mais" page
     When clicks on the "other_options_list.more_options" entrypoint
      And the "More Options" page is displayed
      And clicks on the "esim_entrypoint" entrypoint
     Then the internal webview with the "Ativar eSIM" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "More Options" page is displayed

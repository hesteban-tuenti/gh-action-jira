# -*- coding: utf-8 -*-
@jira.QANOV-249080
Feature: Tab Mais Access


  @jira.<jira_id> @android @automatic @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @live @mobile @next
  @qa @smoke @vivobr @old_app @har
  Scenario Outline: User who is in the <main_tab> tab can access to the Tab Mais screen
    Given user is in the "<main_tab>" page
      And user has a "any" plan in "no cancelled" status
     When clicks on the "navigation_tab_bar.mais_tab" tab
     Then the "Tab Mais" page is displayed
      And the "Mais" header is displayed

    Examples:
          | main_tab | jira_id      | ber |
          | Account  | QANOV-249081 | ber |
          | Explore  | QANOV-249082 |     |

  @jira.QANOV-403115 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: User who is in the Account tab can access to the Tab Mais screen
    Given user is in the "Account" page
      And user has all plans in "cancelled" status
     When clicks on the "navigation_tab_bar.mais_tab" tab
     Then the "Tab Mais" page is displayed
      And the "Mais" header is displayed

  @jira.QANOV-298714 @android @automatic @ber @ios @jira.cv.14.0 @jira.link.parent_test_plan.QANOV-297826 @live @mobile
  @next @qa @smoke @vivobr @old_app
  Scenario: User who is in the Start tab can access to the Tab Mais screen
    Given user has any "convergente;multivivo;legacy prepay;beatrix;control_n;jeri" account types
      And user does not have any "legacy control;legacy postpay" account types
      And user has a "any" plan in "no cancelled" status
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.mais_tab" tab
     Then the "Tab Mais" page is displayed
      And the "Mais" header is displayed

  @jira.QANOV-249084 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @live @next @smoke
  @vivobr @old_app
  Scenario: User who is in the Vivo valoriza tab can access to the Tab Mais screen
    Given user has a "beatrix" mobile line
      And user has a "any" plan in "no cancelled" status
      And user is in the "Vivo Valoriza" page
     When clicks on the "navigation_tab_bar.mais_tab" tab
     Then the "Tab Mais" page is displayed
      And the "Mais" header is displayed

  @jira.QANOV-249085 @android @automatic @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065
  @jira.link.parent_test_plan.QANOV-360674 @live @mobile @next @qa @sanity @vivobr @old_app
  Scenario: User can see the Tab Mais content
    Given user is in the "Tab Mais" page
      And user has the "services-summary" module configured in CMS for "tab-mais-landing" page
      And user has the "services-summary-2" module configured in CMS for "tab-mais-landing" page
     Then the "Mais" header is displayed
      And the "quick_access_carousel" carousel is displayed
      And the "quick_access_carousel_title" textfield is displayed
      And each element in the "quick_access_carousel" carousel has the "icon" field
      And each element in the "quick_access_carousel" carousel has the "name" field
      And the "other_options_list" list is displayed
      And the "other_options_list_title" textfield is displayed
      And each element in the "other_options_list" list has the "icon" field
      And each element in the "other_options_list" list has the "title" field
      And each element in the "other_options_list" list has the "chevron" field

  @jira.QANOV-268862 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A user with segmentation can see the Chat principal services
    Given user has any "legacy;convergente;beatrix;multivivo;jeri;control_n" account types
      And user has any "platinum;V" segmentation
      And user is in the "Tab Mais" page
      And user has the "other_options_list" module configured in CMS for "tab_mais" page
      And user has the "Chat" entrypoint configured in CMS for the "services-summary-2" list
     Then the "Mais" header is displayed
      And the "other_options_list" module is displayed
      And the "other_options_list.chat" entrypoint is displayed

  @jira.QANOV-249118 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Page is scrolled up when user taps on the Tab Mais tab button after scrolling down
    Given user is in the "Tab Mais" page
     When scrolls down
      And the "main_title_textfield" textfield is not visible in the actual screen
      And clicks on the "navigation_tab_bar.tab_mais" tab
     Then the "main_title_textfield" textfield with "Mais" text is displayed

  @jira.QANOV-313075 @android @ios @jira.cv.14.1 @manual @mobile @regression @vivobr @old_app
  Scenario: Page is refreshed when user pulls down the Tab mais page
    Given user is in the "Tab Mais" page
     When pulls down the page to refresh
      And waits until the "skeleton" element is not visible
     Then the "error_loading_text" textfield is not displayed
      And the "quick_access_carousel" carousel is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: User with beatrix mobile line in pre active status who is in the <main_tab> tab can access to the Tab Mais screen
    Given user has a "beatrix" mobile line in "pre active" status
      And user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.mais_tab" tab
     Then the "Tab Mais" page is displayed
      And the "Mais" header is displayed

    Examples:
          | main_tab | jira_id      |
          | Account  | QANOV-356575 |

  @jira.QANOV-360504 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: Tab mais screen is autorefreshed
    Given user is in the "Account" page
     When clicks on the "navigation_tab_bar.mais_tab" tab
     Then the "Tab Mais" page is autorefreshed
      And the "Tab Mais" page is displayed

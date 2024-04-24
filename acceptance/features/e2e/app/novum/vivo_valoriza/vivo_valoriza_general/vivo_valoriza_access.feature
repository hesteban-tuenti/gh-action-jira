# -*- coding: utf-8 -*-
@jira.QANOV-313078
Feature: Vivo Valoriza Access


  @jira.<jira_id> @android @automatic @<ber> @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-319348 @live @mobile @next
  @smoke @vivobr @old_app @har
  Scenario Outline: User who is in the <main_tab> tab can access to the Vivo Valoriza screen
    Given user has any "convergente;multivivo;beatrix;legacy postpay;legacy control" account types
      And user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.valoriza_tab" tab
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

    Examples:
          | main_tab | ber | jira_id      |
          | Account  | ber | QANOV-313079 |
          | Explore  |     | QANOV-313080 |
          | Tab Mais |     | QANOV-313081 |

  @jira.QANOV-313083 @android @automatic @ber @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-319348 @live @mobile
  @next @smoke @vivobr @old_app @har
  Scenario: User who is in the Start tab can access to the Vivo Valoriza screen
    Given user has any "convergente;multivivo;legacy prepay;beatrix;control_n;jeri" account types
      And user does not have any "legacy control;legacy postpay" account types
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.valoriza_tab" tab
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

  @jira.QANOV-313084 @android @automatic @ber @ios @jira.cv.13.8 @live @mobile @next @sanity @vivobr @old_app
  Scenario: User can see the Vivo Valoriza content
    Given user has any "convergente;multivivo;beatrix;legacy postpay;legacy control" account types
      And user is in the "Vivo Valoriza" page
     Then the "Vivo Valoriza" header is displayed
      And the "Destaques" string is displayed
      And the "Resgatados" string is displayed
      And the "Mais" string is displayed

  @jira.QANOV-313085 @android @ios @jira.cv.13.8 @manual @mobile @regression @vivobr @old_app
  Scenario: Page is scrolled up when user taps on the Vivo Valoriza tab button after scrolling down
    Given user has any "convergente;multivivo;beatrix;legacy postpay;legacy control" account types
      And user is in the "Vivo Valoriza" page
     When scrolls down
      And the "main_title_textfield" textfield is not visible in the actual screen
      And clicks on the "navigation_tab_bar.valoriza_tab" tab
     Then the "main_title_textfield" textfield with "Vivo Valoriza" text is displayed

  @jira.QANOV-313086 @android @ios @jira.cv.14.1 @manual @mobile @regression @vivobr @old_app
  Scenario: Page is refreshed when user pulls down the Vivo Valoriza page
    Given user has any "convergente;multivivo;beatrix;legacy postpay;legacy control" account types
      And user is in the "Vivo Valoriza" page
     When pulls down the page to refresh
      And waits until the "skeleton" element is not visible
      And the "error_loading_text" textfield is not displayed
     Then the "main_title_textfield" textfield with "Vivo Valoriza" text is displayed
      And the "Destaques" string is displayed
      And the "Resgatados" string is displayed
      And the "Mais" string is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: User with beatrix mobile line in pre active status who is in the <main_tab> tab can access to the Vivo Valoriza screen
    Given user has any "convergente;multivivo;beatrix" account types
      And user has a "beatrix" mobile line in "pre active" status
      And user has "several" plans
      And user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.valoriza_tab" tab
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

    Examples:
          | main_tab | jira_id      |
          | Account  | QANOV-356577 |
          | Explore  | QANOV-356578 |
          | Tab Mais | QANOV-356579 |

  @jira.QANOV-360505 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: Vivo Valoriza screen is autorefreshed
    Given user has any "convergente;multivivo;beatrix;legacy postpay;legacy control" account types
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.valoriza_tab" tab
     Then the "Vivo Valoriza" page is autorefreshed
      And the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

  @jira.QANOV-400694 @android @ios @jira.cv.14.5 @manual @mobile @sanity @vivobr @old_app
  Scenario: User can see the Vivo Valoriza content with several users
    Given user has any "convergente;multivivo;beatrix;legacy postpay;legacy control" account types
      And user is logged in the application with "more" than "1" users
      And user is in the "Profile" page
     When clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
      And clicks on the "navigation_top_bar.back_button" button
      And clicks on the "navigation_tab_bar.valoriza_tab" tab
     Then the "Vivo Valoriza" header is displayed
      And the "Destaques" string is displayed
      And the "Resgatados" string is displayed
      And the "Mais" string is displayed

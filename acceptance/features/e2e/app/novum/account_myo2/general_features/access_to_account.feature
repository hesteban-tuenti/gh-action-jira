# -*- coding: utf-8 -*-
@jira.QANOV-7056
Feature: Access to account


  @jira.QANOV-7062 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-24140 @manual @mobile @o2uk @regression
  Scenario: An AO2 user can't navigate the app if one of their lines is being migrated to AO2
    internal_checkpoint="Line to test CERT0 (4/5/2021): gb083240_187864@o2.com"
    other_affected_versions="2021-43"
    Given user has at least a line being migrated to AO2
      And terminates the app
     When launches the app
     Then the "Migration Splash Screen" page is displayed
      And the "title" textfield with "We're working on it" text is displayed
      And the "message" textfield with "This page is unavailable at the moment because we're making some improvements to the app. We'll have it back up and running as soon as possible." text is displayed
      And the "navigation_tab_bar.tab_bar" bar is not displayed
      And the "navigation_top_bar.profile_icon" icon is not displayed

  @jira.QANOV-7066 @android @automatic @cert0 @cert1 @har @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47637 @live @mobile
  @next @o2uk @sanity
  Scenario: User selects Account icon: account screen is displayed with the proper title
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the "Account" header is displayed

  @jira.QANOV-295136 @android @har @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.NOV-63928 @manual @mobile @o2uk @regression
  Scenario: User reloads the Account: account screen is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Account" page is displayed

  @jira.QANOV-360491 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @o2uk @smoke
  Scenario: Account page is autorefreshed
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is autorefreshed
      And the "Account" page is displayed
      And the "Account" header is displayed

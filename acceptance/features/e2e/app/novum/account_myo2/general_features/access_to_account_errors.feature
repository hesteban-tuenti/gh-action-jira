# -*- coding: utf-8 -*-
@jira.QANOV-126732
Feature: Access to account errors


  @jira.QANOV-7069 @android @ios @jira.cv.10.7 @jira.link.relates_to.NOV-80691 @manual @mobile @o2uk @regression
  Scenario: User accesses to the account tab and an API error occurs: API error screen is displayed
    internal_checkpoint="Note that here API error means that the API faÇade that returns the account information must
    fail. This might be tested by asking that the thirdPartyClients/4p/url points to an invalid URL and waiting some
    minutes, but not for Colombia Home lines. Home lines do not require enough 4p information to get into the 'general
    failure'.
    Carlos Fernandez from account team proposes to configure hystrix circuits between account and NOVUM services to be
    open. We might explore this option"
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-295138 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @o2uk
  @regression
  Scenario: A user who is in the screen error after the 4P API returned an error and taps the Retry button will remain in the same screen if the error is not solved
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "internal_error_title" textfield is displayed

  @jira.QANOV-38251 @android @automatic @ber @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-24141 @mobile @o2uk @qa
  @regression @webapp
  Scenario: There is an API error retrieving the consumption of an allowance: an error is displayed in the consumption roundel
    other_affected_versions="2020-48"
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And there is an API error in an allowance roundel
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "allowances_carousel" module is displayed
      And the "[CONTEXT:roundel_with_error]_roundel.error" textfield with "[LANG:account.api_errors.roundel]" text is displayed

  @jira.QANOV-7072 @android @ios @jira.cv.10.7 @jira.link.relates_to.NOV-80725 @manual @mobile @o2uk @regression
  Scenario: User taps on an specific option in the account tab and an API error occurs: API error screen is displayed
    Given user has bills
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "see_bills" button
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-7075 @android @jira.cv.11.2 @jira.link.relates_to.NOV-120545 @manual @mobile @o2uk @regression
  Scenario: Logged user without data connection opens the app in Android: error message is displayed
    internal_checkpoint="This scenario can be simulated by disabling the connectivity very quickly just after the user
    logged in the app and before the account screen is loaded)"
    Given user is logged in
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-295140 @android @jira.cv.14.1 @jira.link.detects.APPS-6591 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.NOV-120546 @manual @mobile @o2uk @regression
  Scenario: User without data connection reloads the account in Android: error message is displayed
    This scenario can be simulated by disabling the connectivity very quickly just after the user
    logged in the app and before the account screen is loaded)
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is logged in
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-7079 @ios @jira.cv.10.1 @jira.link.relates_to.NOV-36816 @manual @mobile @o2uk @regression
  Scenario: Logged user without data connection opens the app in iOS: error message is displayed
    Given user is in the "Account" page
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-295141 @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-27 @manual
  @mobile @o2uk @regression
  Scenario: User without data connection reloads the account in iOS: error message is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

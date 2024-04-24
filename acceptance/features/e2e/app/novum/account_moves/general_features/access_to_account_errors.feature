# -*- coding: utf-8 -*-
@jira.QANOV-126319
Feature: Access to account errors


  @jira.QANOV-7880 @android @automation.pending_mock @impeded_legacy @impeded_mock @ios @jira.cv.10.7
  @jira.link.relates_to.NOV-80691 @manual @mobile @moves @regression
  Scenario: Legado user accesses to the account tab and an API error occurs: API error screen is displayed
    internal_checkpoint="Note that here API error means that the API faÇade that returns the account information must
    fail. This might be tested by asking that the thirdPartyClients/4p/url points to an invalid URL and waiting some
    minutes, but not for Colombia Home lines. Home lines do not require enough 4p information to get into the 'general
    failure'.
    Carlos Fernandez from account team proposes to configure hystrix circuits between account and NOVUM services to be
    open. We might explore this option"
    Given user has a "legado" account type
      And user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-295137 @android @impeded_legacy @impeded_mock @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-7886 @mobile @moves @no_automatable @regression
  Scenario: A Legado user who is in the screen error after the API returned an error and taps the retry button will see the Account information if the error is solved
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "legado" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And the API error is solved
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "internal_error_title" textfield is not displayed

  @jira.QANOV-311169 @android @automation.pending_mock @impeded_legacy @impeded_mock @ios @jira.cv.14.1
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-7888 @mobile @moves @no_automatable @regression
  Scenario: A Legado user who is in the screen error after the 4P API returned an error and taps the Retry button will remain in the same screen if the error is not solved
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "legado" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "internal_error_title" textfield is displayed

  @jira.QANOV-7889 @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.7 @jira.link.depends_on.QANOV-7870
  @jira.link.relates_to.NOV-80725 @mobile @moves @no_automatable @regression
  Scenario: Legado user taps on an specific option in the account tab and an API error occurs: API error screen is displayed
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    Given user has a "legado postpay" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
      And user has bills
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
     When clicks on the "see_bills" button
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-7894 @android @automation.hard @impeded_legacy @jira.cv.11.2 @jira.link.relates_to.NOV-120545 @manual
  @mobile @moves @regression
  Scenario: Logged Legado user without data connection opens the app in Android: error message is displayed
    Given user has a "legado" account type
      And user is logged in
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-311171 @android @automation.hard @impeded_legacy @jira.cv.14.1 @jira.link.detects.APPS-6591
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.NOV-120546 @jira.link.relates_to.QANOV-7915 @manual
  @mobile @moves @regression
  Scenario: Legado user without data connection reloads the account in Android: error message is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "legado" account type
      And user is logged in
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-7929 @impeded_legacy @ios @jira.cv.10.1 @jira.link.relates_to.NOV-36816 @manual @mobile @moves @regression
  Scenario: Logged Legado user without data connection opens the app in iOS: error message is displayed
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "legado" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-311172 @impeded_legacy @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.NOV-27 @jira.link.relates_to.QANOV-7939 @manual @mobile @moves @regression
  Scenario: Legado user without data connection reloads the account in iOS: error message is displayed
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "legado" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

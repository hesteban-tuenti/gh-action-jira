# -*- coding: utf-8 -*-
@jira.QANOV-203299
Feature: Access to account


  @jira.QANOV-203300 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @live @mobile @next @qa @sanity
  @raitt_drop1 @har
  Scenario: User can see the proper title in the account screen
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-295126 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-203301 @manual @mobile @regression @har
  Scenario: User reloads the account screen
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Account" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario Outline: User sees the account in German
    Given user is in the "Account" page
      And the device language is "<language>"
     Then the texts are displayed in "German"

    @har
    Examples:
          | language | jira_id      |
          | German   | QANOV-203302 |

    Examples:
          | language | jira_id      |
          | English  | QANOV-203303 |

  @jira.QANOV-203304 @TBD @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: User accesses to the account tab and an API error occurs: API error screen is displayed
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-295127 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-203304
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-203305 @manual @mobile @regression
  Scenario: A user who is in the API error screen taps on the retry button: the account content is displayed if the error is solved
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And the API error is solved
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "internal_error_title" textfield is not displayed

  @jira.QANOV-295128 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-203304
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-203306 @manual @mobile @regression
  Scenario: A user who is in the API error screen taps on the retry button: the same API error screen is displayed if the error is not solved
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "internal_error_title" textfield is displayed

  @jira.QANOV-203307 @TBD @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: User taps on an specific option in the account screen and an API error occurs: API error screen is displayed
    Given user is in the "Account" page
      And user has bills
     When clicks on the "see_bills" button
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-203309 @android @blaude @jira.cv.13.9 @manual @mobile @regression
  Scenario: User with the account content cached and without data connection opens the app in Android: the account content cached is displayed
    Given user is in the "Account" page
      And the "Account" page is cached
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "Account" content previously cached is displayed

  @jira.QANOV-203310 @TBD @android @blaude @jira.cv.13.9 @manual @mobile @regression
  Scenario: User without the account content cached neither data connection opens the app in Android: error message is displayed
    internal_checkpoint="This scenario can be simulated by disabling the connectivity very quickly just after the user
    logged in the app and before the account screen is loaded."
    Given user is logged in
      And user turns on the Airplane mode
      And the "Account" page is not cached
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-295130 @android @blaude @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-203311 @manual @mobile @regression
  Scenario: User with the account content cached and without data connection reloads the account in Android: the content cached is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
      And the "Account" page is cached
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "Account" content previously cached is displayed

  @jira.QANOV-295131 @android @blaude @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-203312 @manual @mobile @regression
  Scenario: User without the account content cached neither data connection reloads the account in Android: error message is displayed
    This scenario can be simulated by disabling the connectivity very quickly just after the user
    logged in the app and before the account screen is loaded)
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is logged in
      And user turns on the Airplane mode
      And the "Account" page is not cached
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-203313 @TBD @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: User without data connection opens the app in iOS: error message is displayed
    Given user is in the "Account" page
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-295132 @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-203314 @manual @mobile @regression
  Scenario: User without data connection reloads the account in iOS: error message is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-360489 @android @blaude @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke
  Scenario: Account page is autorefreshed
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is autorefreshed
      And the "Account" page is displayed
      And the "Vertrag" header is displayed

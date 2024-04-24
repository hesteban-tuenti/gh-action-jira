# -*- coding: utf-8 -*-
@jira.QANOV-38081
Feature: Access to account


  @jira.QANOV-38082 @android @ber @ios @jira.cv.14.2 @automatic @mobile @o2de @sanity @live @next @har
  Scenario: User can see the proper title in the account screen
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-295145 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-38083 @manual @mobile @o2de @regression @har
  Scenario: User reloads the account screen
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Account" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario Outline: User sees the account in German
    Given user is in the "Account" page
      And the device language is "<language>"
     Then the texts are displayed in "German"

    @har
    Examples:
          | language | jira_id     |
          | German   | QANOV-38084 |

    Examples:
          | language | jira_id     |
          | English  | QANOV-38085 |

  @jira.QANOV-38086 @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: User accesses to the account tab and an API error occurs: API error screen is displayed
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-295146 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38086
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-38087 @manual @mobile @o2de @regression
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

  @jira.QANOV-295147 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38086
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-38088 @manual @mobile @o2de @regression
  Scenario: A user who is in the API error screen taps on the retry button: the same API error screen is displayed if the error is not solved
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
     When pulls down the page to refresh
      And there is an API error
      And the "internal_error_title" textfield is displayed
      And pulls down the page to refresh
     Then the "Account" page is displayed
      And the "internal_error_title" textfield is displayed

  @jira.QANOV-38089 @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: User taps on an specific option in the account screen and an API error occurs: API error screen is displayed
    Given user is in the "Account" page
      And user has bills
     When clicks on the "see_bills" button
      And there is an API error
     Then the "Account" page is displayed
      And the "internal_error_title" textfield with "[LANG:account.maintenance.internal_error.internal_error_title]" text is displayed
      And the "internal_error_text" textfield with "[LANG:account.maintenance.internal_error.internal_error_text]" text is displayed

  @jira.QANOV-38092 @TBD @android @jira.cv.14.2 @manual @mobile @o2de @regression
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

  @jira.QANOV-295150 @android @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-38094
  @manual @mobile @o2de @regression
  Scenario: User without the account content cached neither data connection reloads the account in Android: error message is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    This scenario can be simulated by disabling the connectivity very quickly just after the user
    logged in the app and before the account screen is loaded)
    Given user is logged in
      And user turns on the Airplane mode
      And the "Account" page is not cached
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-38095 @TBD @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: User without data connection opens the app in iOS: error message is displayed
    Given user is in the "Account" page
      And user turns on the Airplane mode
      And terminates the app
     When launches the app
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-295151 @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-38096 @manual
  @mobile @o2de @regression
  Scenario: User without data connection reloads the account in iOS: error message is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is in the "Account" page
      And user turns on the Airplane mode
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-360492 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @o2de @smoke
  Scenario: Account page is autorefreshed
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is autorefreshed
      And the "Account" page is displayed
      And the "Vertrag" header is displayed

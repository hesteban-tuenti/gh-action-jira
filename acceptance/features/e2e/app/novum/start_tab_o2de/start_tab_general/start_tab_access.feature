# -*- coding: utf-8 -*-
@jira.QANOV-312796
Feature: Start tab access

  @jira.QANOV-312797 @android @ber @ios @jira.cv.14.2 @manual @mobile @o2de @sanity @har
  Scenario: A user who opens the killed app will land in the Start tab
    Given terminates the app
     When launches the app
      And initiate the app
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-312798 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A user can access to the Start tab
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And waits until the "skeleton" element is not visible
      And the "error_loading_text" textfield is not displayed

  @jira.QANOV-312799 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user can refresh the Start tab
    Given user is in the "Start" page
     When pulls down the page to refresh
     Then the "Start" page is displayed
      And waits until the "skeleton" element is not visible
      And the "error_loading_text" textfield is not displayed

  @jira.QANOV-312800 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user lands in the Start tab but there's a general webview error: error message will be shown
    Given terminates the app
     When launches the app
      And initiate the app
      And there is a general webview error
     Then the "Start" page is displayed
      And the "error_loading_text" textfield with "[LANG:start.errors.general_error.text]" text is displayed
      And the "error_loading_button" button with "[LANG:start.errors.general_error.button]" text is displayed

  @jira.<jira_id> @TBD @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario Outline: A user lands in the Start tab but there's an error loading the "<fragment>" fragment: error message will be shown in the place of the fragment
    Given terminates the app
     When launches the app
      And initiate the app
      And there is an error loading the "<fragment>" fragment
     Then the "Start" page is displayed
      And the "error_fragment_icon" icon is displayed
      And the "error_fragment_title" textfield with "[LANG:start.errors.fragment_error.text]" text is displayed
      And the "error_fragment_description" textfield with "<fragment_description>" text is displayed

    Examples:
          | fragment       | fragment_description                                          | jira_id      |
          | explore        | [LANG:start.errors.fragment_error.explore_description]        | QANOV-312802 |
          | order_tracking | [LANG:start.errors.fragment_error.order_tracking_description] | QANOV-312803 |
          | telco          | [LANG:start.errors.fragment_error.telco_description]          | QANOV-312804 |

  @jira.QANOV-312805 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp for the first time: the default connectivity message will be shown
    Given user is logged out
      And the "Start" page is not cached
     When logs in the application
      And turns on the Airplane mode
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-312806 @android @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): cached content will be shown in android devices
    Given the "Start" page is cached
      And terminates the app
     When launches the app
      And initiate the app
      And turns on the Airplane mode
     Then the "Start" page is displayed with cached content

  @jira.QANOV-312807 @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): the default connectivity message will be shown in iOS devices
    Given terminates the app
     When turns on the Airplane mode
      And launches the app
      And initiate the app
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-360501 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @o2de @smoke
  @jira.link.detects.IOS-8976
  Scenario: Start screen is autorefreshed
    Given user is in the "Account" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is autorefreshed
      And the "Start" page is displayed

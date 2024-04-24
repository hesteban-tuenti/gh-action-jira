# -*- coding: utf-8 -*-
@jira.QANOV-267990
Feature: Start tab access


  @jira.QANOV-267991 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.14.1 @live @mobile @next @o2uk @smoke
  Scenario: A prepay user does not see the Start tab page
    Given user has a "prepay" account type
      And user has "1" mobile lines
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-267992 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multimsisdn prepay user does not see the Start tab page
    Given user has a "prepay" account type
      And user does not have a "postpay" account type
      And user has "several" mobile lines
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-267993 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.14.1 @mobile @o2uk @smoke
  Scenario: A multimisidn user with prepay and postpay lines does not see the Start tab page
    Given user has the "postpay;prepay" account types
      And user has "several" mobile lines
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-267994 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.14.1 @mobile @o2uk @smoke
  Scenario: A user with sim-free line and without postpay lines does not see the Start tab page
    Given user has a "device" account type
      And user does not have a "postpay" account type
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-267995 @android @automatic @ber @cert0 @cert1 @har @ios @jira.cv.14.1 @live @mobile @next @o2uk @sanity
  Scenario: A logged postpay user who opens the killed app will land in the Start tab
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And terminates the app
     When launches the app
      And initiate the app
     Then the "Start" page is displayed
      And the "error_loading" textfield is not displayed

  @jira.QANOV-295234 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @o2uk
  @regression
  Scenario: A postpay user who was in the start tab taps on the refresh button: The start tab content will be updated
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user is in the "Start" page
     When pulls down the page to refresh
     Then the "Start" page is displayed
      And waits until the "skeleton" element is not visible
      And the "error_loading" textfield is not displayed

  @jira.QANOV-267997 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A postpay user lands in the Start tab but there's a general webview error: error message will be shown
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And terminates the app
     When launches the app
      And there is a general webview error
     Then the "Start" page is displayed
      And the "load_error" textfield with "[LANG:start.errors.general_error.text]" text is displayed
      And the "reload" button with "[LANG:start.errors.general_error.button]" text is displayed

  @jira.QANOV-267998 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A postpapy user lands in the Start tab but there's an error loading a fragment: error message will be shown in the place of the fragment
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And terminates the app
     When launches the app
      And there is an error loading fragment
     Then the "Start" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "[LANG:start.errors.fragment_error.text]" text is displayed
      And the "error_subtitle" textfield that contains the "cant't be displayed" text is displayed

  @jira.QANOV-267999 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A postpay user lands in the Start tab but there's a connectivity error loading the webapp for the first time: the default no connectivity message will be shown
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user is logged out
      And the "Start" page is not cached
     When logs in the application
      And turns on the Airplane mode
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-268000 @android @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A postpay user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): cached content will be shown in android devices
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And the "Start" page is cached
      And terminates the app
     When launches the app
      And turns on the Airplane mode
     Then the "Start" page is displayed with cached content

  @jira.QANOV-268001 @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A postpay user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): retry message will be shown in iOS devices
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And terminates the app
     When turns on the Airplane mode
      And launches the app
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-360502 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @o2uk @smoke
  Scenario: Start screen is autorefreshed
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is autorefreshed
      And the "Start" page is displayed

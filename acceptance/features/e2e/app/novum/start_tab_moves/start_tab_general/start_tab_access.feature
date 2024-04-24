# -*- coding: utf-8 -*-
@jira.QANOV-674
Feature: Start tab Access

  @jira.QANOV-76879 @android @no_automatable @ios @jira.cv.12.2 @mobile @moves @smoke @impeded_legacy
  Scenario: Legado user does not see the Start tab page
    Given user has a "legado" account type
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-675 @android @automatic @ber @cert2 @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186763 @live @mobile @moves
  @next @sanity @qa @har
  Scenario: A telco logged user who opens the killed app will land in the Start tab
    Given user has a "telco" account type
      And terminates the app
     When launches the app
      And initiate the app
     Then the "Start" page is displayed
      And the "start_header" module is displayed

  @jira.QANOV-129635 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-127764 @manual @mobile @moves
  @regression
  Scenario: User with a fusion or pikolin plan order on track but not activated yet who opens the killed app will land in the Start tab
    other_affected_versions="2021-39"
    Given user has a "telco postpay" account type
      And user has a "fusion;pikolin" order on track
      And user has "any" active subscriptions
      And user has a "any_admin" role
     When launches the app
      And initiate the app
     Then the "Start" page is displayed
      And the "error_loading" textfield is not displayed

  @jira.QANOV-677 @android @automation.pending_api @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194530
  @mobile @moves @no_automatable @regression
  Scenario: A telco user lands in the Start tab but there's a general webview error: error message will be shown
    Given user has a "telco" account type
      And terminates the app
     When launches the app
      And there is a general webview error
     Then the "Start" page is displayed
      And the "load_error" textfield with "[LANG:start.errors.general_error.text]" text is displayed
      And the "reload" button with "[LANG:start.errors.general_error.button]" text is displayed

  @jira.QANOV-679 @android @automation.pending_api @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194532
  @mobile @moves @no_automatable @regression
  Scenario: A telco user lands in the Start tab but there's an error loading fragment list: error message will be shown
    Given user has a "telco" account type
      And terminates the app
     When launches the app
      And there is an error loading fragment
     Then the "Start" page is displayed
      And the "load_error" textfield with "[LANG:start.errors.fragment_error.text]" text is displayed
      And the "reload" button with "[LANG:start.errors.fragment_error.button]" text is displayed

  @jira.QANOV-683 @android @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194536 @mobile @moves @no_automatable @regression
  Scenario: A telco user lands in the Start tab but there's a connectivity error loading the webapp for the first time: the default no connectivity message will be shown
    Given user has a "telco" account type
      And user is logged out
      And the "Start" page is not cached
     When logs in the application
      And turns on the Airplane mode
     Then the "No Connectivity" page is displayed
      And the "retry_button" button with "Reintentar" text is displayed

  @jira.QANOV-684 @android @automation.hard @jira.cv.11.8 @jira.link.relates_to.NOV-194537 @mobile @moves @no_automatable
  @regression
  Scenario: A telco user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): cached content will be shown
    Given user has a "telco" account type
      And the "Start" page is cached
      And terminates the app
     When launches the app
      And turns on the Airplane mode
     Then the "Start" page is displayed with cached content

  @jira.QANOV-685 @manual @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194538 @mobile @moves
  @regression
  Scenario: A telco user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): retry message will be shown
    Given user has a "telco" account type
      And terminates the app
     When turns on the Airplane mode
      And launches the app
     Then the "No Connectivity Start" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-141217 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-127764
  @jira.link.parent_test_plan.QANOV-131587 @manual @mobile @moves @smoke
  Scenario: User with a Fusion or Pikolin plan order on track but not activated yet will see just the Onboarding modules in the Start tab
    other_affected_versions="2021-39"
    Zero Case test plan - Cover the US: 1.1 , 2.1 , 3.1
    Given user has a "telco postpay" account type
      And user has a "fusion;pikolin" order on track
      And user has "any" active subscriptions
      And user has a "any_admin" role
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "header.title" textfield with "¡Gracias por elegirnos! Te vamos a acompañar para que saques el mayor partido a tus productos" text is displayed
      And the "order_tracking" module is displayed
      And the "onboarding_entrypoints" list is displayed
      And the "ecosystem" module is not displayed
      And the "telco" module is not displayed
      And the "smart_wifi" module is not displayed
      And the "explore" module is not displayed
      And the "movistar_plus" module is not displayed
      And the "appointment_booking" module is not displayed
      And the "ticketing" module is not displayed

  @jira.QANOV-194560 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-131587 @manual @mobile @moves
  @regression
  Scenario: User with a Fusion or Pikolin plan order on track and with a plan order on track but with some issue will see just the Onboarding modules in the Start tab
    other_affected_versions="2021-39"
    Zero Case test plan - Cover the US: 0.1.2 , 0.1.3
    Given user has a "telco postpay" account type
      And user has a "fusion;pikolin" order on track
      And user has a "any" order on track with some issue
      And user has ">0" active subscriptions
      And user has a "any_admin" role
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "header.title" textfield with "¡Gracias por elegirnos! Te vamos a acompañar para que saques el mayor partido a tus productos" text is displayed
      And the "order_tracking" module is displayed
      And the "onboarding_entrypoints" list is displayed

  @jira.QANOV-194561 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-131587 @manual @mobile @moves
  @regression
  Scenario: User with at least one active subscription and with a plan order on track but with some issue will see the general Start tab content
    Zero Case test plan - Cover the US: 0.1.4
    Given user has a "telco postpay" account type
      And user has a "any" order on track with some issue
      And user has "several" active subscriptions
      And user has a "any_admin" role
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "Start" page is displayed
      And the "error_loading" textfield is not displayed

  @jira.QANOV-142144 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-131587 @manual @mobile @moves
  @regression
  Scenario: User with at least one active subscription and with a 'non fusion' or 'non pikolin' plan order on track will see the general Start tab content
    Zero Case test plan - Cover the US: 2.2 , 3.2
    Given user has a "telco postpay" account type
      And user has a "non fusion or pikolin" order on track
      And user has "several" active subscriptions
      And user has a "any_admin" role
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "Start" page is displayed
      And the "error_loading" textfield is not displayed

  @jira.QANOV-194562 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-131587 @manual @mobile @moves
  @regression
  Scenario: User without subscriptions and with a plan order on track but with some issue won't see the Start tab
    Zero Case test plan - Cover the US: 0.1.1
    Given user has a "telco postpay" account type
      And user has a "any" order on track with some issue
      And user has "0" active subscriptions
      And user has a "any_admin" role
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-142143 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-131587 @manual @mobile @moves
  @regression
  Scenario: User without subscriptions and with a plan order on track won't see the Start tab
    Given user has a "telco postpay" account type
      And user has a "any" order on track
      And user has "0" active subscriptions
      And user has a "any_admin" role
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.QANOV-360500 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @moves @smoke
  Scenario: Start screen is autorefreshed
    Given user has a "telco" account type
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is autorefreshed
      And the "Start" page is displayed

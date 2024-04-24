# -*- coding: utf-8 -*-
@jira.QANOV-97580
Feature: Start tab Access


  @jira.<jira_id> @android @ber @impeded_legacy @ios @jira.cv.12.5 @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: <account_type> user does not see the Start tab page
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

    Examples:
          | account_type   | jira_id      |
          | legacy postpay | QANOV-97581  |
          | legacy control | QANOV-97582  |
          | jeri postpay   | QANOV-274606 |

  @jira.QANOV-191253 @android @automatic @ber @ios @jira.cv.13.6 @mobile @qa @regression @vivobr @old_app
  Scenario: Multiplan user with a legacy control or postpay account type does not see the start tab
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user is in the "[CONF:landing_tab]" page
     Then the "navigation_tab_bar.start_tab" tab is not displayed

  @jira.<jira_id> @<test_priority> @android @<ber> @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-319348 @mobile
  @vivobr @old_app @har
  Scenario Outline: A <account_type> user with <plans> plans who opens the killed app will land in the Start tab
    Given user has a "<account_type>" account type
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And terminates the app
     When launches the app
      And initiate the app
     Then the "Start" page is displayed

    @automatic @qa
    Examples:
          | account_type  | plans   | test_priority | cv   | jira_id      | ber |
          | convergente   | 1       | sanity        | 12.5 | QANOV-97584  |     |
          | multivivo     | 1       | smoke         | 12.5 | QANOV-97585  | ber |
          | legacy prepay | 1       | sanity        | 12.5 | QANOV-97586  |     |
          | legacy prepay | several | smoke         | 13.6 | QANOV-153136 | ber |
          | jeri prepay   | 1       | smoke         | 13.8 | QANOV-274604 |     |
          | jeri prepay   | several | sanity        | 13.8 | QANOV-274605 |     |
          | control_n     | 1       | smoke         | 14.0 | QANOV-313105 |     |
          | control_n     | several | smoke         | 14.0 | QANOV-313106 | ber |
          | jeri control  | several | smoke         | 14.0 | QANOV-313108 |     |

    @manual
    Examples:
          | account_type | plans | test_priority | cv   | jira_id      | ber |
          | jeri control | 1     | smoke         | 14.0 | QANOV-313107 |     |

    @automatic @live @next @qa
    Examples:
          | account_type | plans   | test_priority | cv   | jira_id      | ber |
          | beatrix      | 1       | smoke         | 12.5 | QANOV-97588  |     |
          | beatrix      | several | sanity        | 12.5 | QANOV-356573 | ber |
          | convergente  | several | sanity        | 13.6 | QANOV-153134 |     |
          | multivivo    | several | sanity        | 13.6 | QANOV-153135 |     |

  @jira.QANOV-424466 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @mobile @sanity @vivobr
  Scenario: A user who opens the killed app will land in the Start tab
     When launches the app
      And initiate the app
     Then the "Start" page is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke
  @vivobr @har
  Scenario Outline: User who is in the <main_tab> tab can access to the Start tab screen
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "navigation_top_bar.menu_icon" icon is displayed
      And the "navigation_top_bar.notification_inbox_icon" icon is displayed

    Examples:
          | main_tab      | ber | jira_id      |
          | Assinatura    | ber | QANOV-388403 |
          | Explore       |     | QANOV-388404 |
          | Vivo Valoriza |     | QANOV-388405 |
          | Financas      |     | QANOV-388406 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual
  @mobile @vivobr
  Scenario Outline: User who is in the <main_tab> tab can access to the Start tab screen during a maintenance window
    Given user is in the "<main_tab>" page
      And there is a maintenance window
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "navigation_top_bar.menu_icon" icon is displayed
      And the "navigation_top_bar.notification_inbox_icon" icon is displayed

    Examples:
          | main_tab      | ber | priority   | jira_id      |
          | Assinatura    | ber | sanity     | QANOV-517458 |
          | Explore       |     | regression | QANOV-517459 |
          | Vivo Valoriza |     | regression | QANOV-517460 |
          | Financas      |     | regression | QANOV-517461 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A user with Start tab who was in the start tab taps on the refresh button: The start tab content will be updated
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user is in the "Start" page
     When pulls down the page to refresh
     Then the "Start" page is displayed
      And the "error_loading" textfield is not displayed

    Examples:
          | plans   | account_types                                                                  | jira_id      |
          | 1       | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-295235 |
          | several | any                                                                            | QANOV-295236 |

  @jira.QANOV-424467 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @regression
  @vivobr
  Scenario: A user who was in the start tab pulls down to refresh: The start tab content will be updated
    Given user is in the "Start" page
     When pulls down the page to refresh
     Then the "Start" page is displayed
      And the "error_loading" textfield is not displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A user with Start tab lands in the Start tab but there's a general webview error: error message will be shown
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And terminates the app
     When launches the app
      And there is a general webview error
     Then the "Start" page is displayed
      And the "load_error" textfield with "[LANG:start.errors.general_error.text]" text is displayed
      And the "reload" button with "[LANG:start.errors.general_error.button]" text is displayed

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-97590  |
          | several | 13.6 | any                                                                            | QANOV-153140 |

  @jira.QANOV-424468 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user with Start tab lands in the Start tab but there's a general webview error: error message will be shown
     When terminates the app
      And launches the app
      And there is a general webview error
     Then the "Start" page is displayed
      And the "load_error" textfield with "[LANG:start.errors.general_error.text]" text is displayed
      And the "reload" button with "[LANG:start.errors.general_error.button]" text is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A user with Start tab lands in the Start tab but there's an error loading fragment list: error message will be shown
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And terminates the app
     When launches the app
      And there is an error loading fragment
     Then the "Start" page is displayed
      And the "error_module.text" textfield with "[LANG:start.errors.fragment_error.text]" text is displayed

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-97592  |
          | several | 13.6 | any                                                                            | QANOV-153141 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: A user with Start tab lands in the Start tab but there's a connectivity error loading the webapp for the first time: the default no connectivity message will be shown
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user is logged out
      And the "Start" page is not cached
     When logs in the application
      And turns on the Airplane mode
     Then the "No Connectivity" page is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-97594  |
          | several | 13.6 | any                                                                            | QANOV-153142 |

  @jira.QANOV-424469 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @mobile @regression @vivobr
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp for the first time: the default no connectivity message will be shown
    Given user is logged out
      And the "Start" page is not cached
     When logs in the application
      And turns on the Airplane mode
     Then the "No Connectivity" page is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: A user with Start tab lands in the Start tab but there's a connectivity error loading the webapp (not the first time): cached content will be shown
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And the "Start" page is cached
      And terminates the app
     When launches the app
      And turns on the Airplane mode
     Then the "Start" page is displayed with cached content

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-97595  |
          | several | 13.6 | any                                                                            | QANOV-153143 |

  @jira.QANOV-424470 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @mobile @regression @vivobr
  Scenario: A user lands in the Start tab but there's a connectivity error loading the webapp (not the first time): cached content will be shown
    Given the "Start" page is cached
      And terminates the app
     When launches the app
      And turns on the Airplane mode
     Then the "Start" page is displayed with cached content

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with Start tab lands in the Start tab but there's a connectivity error loading the webapp (not the first time): retry message will be shown
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And terminates the app
     When turns on the Airplane mode
      And launches the app
     Then the "No Connectivity Start" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-97596  |
          | several | 13.6 | any                                                                            | QANOV-153144 |

  @jira.QANOV-424472 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @regression
  @vivobr
  Scenario: A user with Start tab lands in the Start tab but there's a connectivity error loading the webapp (not the first time): retry message will be shown
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "No Connectivity Start" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-356574 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: User with beatrix mobile line in pre active status who opens the killed app will land in the Start tab
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has a "beatrix" mobile line in "pre active" status
      And terminates the app
     When launches the app
      And initiate the app
     Then the "Start" page is displayed

  @jira.QANOV-360503 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke @vivobr
  @old_app @har
  Scenario: Start tab screen is autorefreshed
    Given user has any "convergente;multivivo;legacy prepay;beatrix;jeri prepay;jeri control;control_n" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is autorefreshed
      And the "Start" page is displayed

  @jira.QANOV-424473 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke @vivobr
  Scenario: Start tab screen is autorefreshed
    Given user is in the "Assinatura" page
     When clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is autorefreshed
      And the "Start" page is displayed

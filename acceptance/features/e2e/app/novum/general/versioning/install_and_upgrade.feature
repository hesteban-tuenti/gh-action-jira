# -*- coding: utf-8 -*-
@jira.QANOV-6431
Feature: Install and Upgrade

  Actions Before the Feature:
    Given user has downloaded the previous build of the app from AppCenter

  Actions Before each Scenario:
    Given user has installed the app "[CONTEXT:appcenter_previous_app_path]" with build "[CONTEXT:appcenter_previous_app_build]"
      And initiate the app


  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged out from the app can upgrade the app on his/her iOS device
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And user is logged out
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-6905   |
          | vivobr  | 10.1   | QANOV-6908   |
          | o2uk    | 10.1   | QANOV-6910   |
          | blaude  | 13.9   | QANOV-254422 |
          | o2de    | 14.2   | QANOV-254424 |
          | o2es    | Future | QANOV-416994 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged out from the app can upgrade the app on his/her android device
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Upgrade tests for android must be executed with store apps.
    Given user is logged out
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-6904   |
          | vivobr  | 10.1   | QANOV-6906   |
          | o2uk    | 10.1   | QANOV-6909   |
          | blaude  | 13.9   | QANOV-254421 |
          | o2de    | 14.2   | QANOV-254423 |
          | o2es    | Future | QANOV-416993 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged out from the app can reinstall the app on his/her iOS device
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And user is logged out
      And a newer app version exists in "AppStore"
     When uninstalls the app
      And installs the app from the "AppStore"
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-6913   |
          | vivobr  | 10.1   | QANOV-6915   |
          | o2uk    | 10.1   | QANOV-6918   |
          | blaude  | 13.9   | QANOV-254426 |
          | o2de    | 14.2   | QANOV-254428 |
          | o2es    | Future | QANOV-416997 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged out from the app can reinstall the app on his/her android device
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Upgrade tests for android must be executed with store apps.
    Given user is logged out
      And a newer app version exists in "Google Play"
     When uninstalls the app
      And installs the app from the "Google Play"
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | client  | cv     | jira_id      |
          | moves   | android | 10.1   | QANOV-6912   |
          | vivobr  | android | 10.1   | QANOV-6914   |
          | o2uk    | android | 10.1   | QANOV-6917   |
          | blaude  | android | 13.9   | QANOV-254425 |
          | o2de    | android | 14.2   | QANOV-254427 |
          | o2es    | android | Future | QANOV-416996 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged in the app in iOS device can reinstall the app on his/her iOS device and needs to log in again
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And a newer app version exists in "App Store"
     When uninstalls the app
      And installs the app from the "App Store"
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.9   | QANOV-449872 |
          | vivobr  | 14.9   | QANOV-449873 |
          | o2uk    | 14.9   | QANOV-449874 |
          | o2es    | Future | QANOV-449875 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged in the app in android device can reinstall the app on his/her device and needs to log in again
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Upgrade tests for android must be executed with store apps.
    Given user is logged in
      And a newer app version exists in "Google Play"
     When uninstalls the app
      And installs the app from the "Google Play"
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-6923   |
          | vivobr  | 10.1   | QANOV-6924   |
          | o2uk    | 10.1   | QANOV-6926   |
          | o2es    | Future | QANOV-417000 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged in the app in iOS device can reinstall the app on his/her device and needs to log in again
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And a newer app version exists in "App Store>"
     When uninstalls the app
      And installs the app from the "App Store"
      And launches the app
     Then the "Cookies Management" popup is displayed
      And clicks on the "accept_all_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.9 | QANOV-449876 |
          | o2de    | 14.9 | QANOV-449877 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user logged in the app in android device can reinstall the app on his/her device and needs to log in again
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Upgrade tests for android must be executed with store apps.
    Given user is logged in
      And a newer app version exists in "Google Play"
     When uninstalls the app
      And installs the app from the "Google Play"
      And launches the app
     Then the "Cookies Management" popup is displayed
      And clicks on the "accept_all_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-254434 |
          | o2de    | 14.2 | QANOV-254435 |

  @jira.<jira_id> @ios @<execution_mode> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-24947 @mobile
  @sanity @har
  Scenario Outline: A <product> user who was logged in the app is not logged out after upgrade and session is refreshed on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    You can make it easy without having to wait 1 hour or until session is renewed:
    - Have a previous version installed and with a user logged in.
    - Update the application and force a session renegotiation in the debug settings:
    Developer settings -> Authentication -> Simulate Access Token Invalidation
    - User should remain logged in.
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the landing tab page is displayed
      And session id is invalidated
      And pulls down the page to refresh
     Then the landing tab page is displayed

    Examples:
          | product | cv   | execution_mode | jira_id      |
          | o2uk    | 14.1 | manual         | QANOV-311164 |
          | blaude  | 14.1 | manual         | QANOV-311166 |
          | o2de    | 14.2 | manual         | QANOV-311168 |

  @jira.<jira_id> @android @<execution_mode> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-24947 @mobile
  @sanity @har
  Scenario Outline: A <product> user who was logged in the app is not logged out after upgrade and session is refreshed on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    You can make it easy without having to wait 1 hour or until session is renewed:
    - Have a previous version installed and with a user logged in.
    - Update the application and force a session renegotiation in the debug settings:
    Developer settings -> Authentication -> Simulate Access Token Invalidation
    - User should remain logged in.
    Given user is logged in
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
      And the landing tab page is displayed
      And session id is invalidated
      And pulls down the page to refresh
     Then the landing tab page is displayed

    Examples:
          | product | cv   | execution_mode | jira_id      |
          | o2uk    | 14.1 | manual         | QANOV-311163 |
          | blaude  | 14.1 | manual         | QANOV-311165 |
          | o2de    | 14.2 | manual         | QANOV-311167 |

  @jira.<jira_id> @<product> @har @ios @jira.link.parent_test_plan.QANOV-24947 @jira.link.parent_test_plan.QANOV-293817
  @manual @mobile
  Scenario Outline: A <product> user who was logged in the app is not logged out after upgrade and session is refreshed on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    You can wait 1 hour until session is renewed or simulate the session invalidation:
    - Have a previous version installed and with a user logged in.
    - Update the application and force a session renegotiation in the debug settings:
    Developer settings -> Authentication -> Simulate Access Token Invalidation
    - User should remain logged in.
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And session id is invalidated
      And pulls down the page to refresh
     Then the landing tab page is displayed

    @jira.cv.14.1 @regression
    Examples:
          | product | jira_id      |
          | moves   | QANOV-295181 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-417002 |

    @jira.cv.14.1 @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-295185 |

  @jira.<jira_id> @<product> @android @har @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-293817 @manual @mobile
  Scenario Outline: A <product> user who was logged in the app is not logged out after upgrade and session is refreshed on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    You can wait 1 hour until session is renewed or simulate the session invalidation:
    - Have a previous version installed and with a user logged in.
    - Update the application and force a session renegotiation in the debug settings:
    Developer settings -> Authentication -> Simulate Access Token Invalidation
    - User should remain logged in.
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user is logged in
      And user has "PIN" feature "disabled" in the application
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And session id is invalidated
      And pulls down the page to refresh
     Then the landing tab page is displayed

    @jira.cv.14.1 @regression
    Examples:
          | product | jira_id      |
          | moves   | QANOV-295180 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-417001 |

    @jira.cv.14.1 @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-295183 |

  @jira.<jira_id> @har @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario Outline: A o2uk <account_type> user who was in "<tab_name>" tab can access to <tab_name> tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has a "<account_type>" account type
      And user does not have a "<no_account_type>" account type
      And user is logged in
      And user is in the "<tab_name>" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" button
     Then the "Start" page is displayed

    Examples:
          | account_type | no_account_type | tab_name | jira_id      |
          | postpay      | prepay          | Start    | QANOV-268012 |
          | prepay       | postpay         | Account  | QANOV-6989   |

  @jira.<jira_id> @android @har @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario Outline: A o2uk <account_type> user who was in "<tab_name>" can access to <tab_name> tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has a "<account_type>" account type
      And user does not have a "<no_account_type>" account type
      And user is logged in
      And user is in the "<tab_name>" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" button
     Then the "Start" page is displayed

    Examples:
          | account_type | no_account_type | tab_name | jira_id      |
          | postpay      | prepay          | Start    | QANOV-268011 |
          | prepay       | postpay         | Account  | QANOV-6988   |

  @jira.QANOV-268014 @har @ios @jira.cv.11.13 @manual @mobile @moves @smoke
  Scenario: A telco user who was in Start tab can access to Start tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has a "telco" account type
      And user has "PIN" feature "disabled" in the application
      And user is logged in
      And user is in the "Start" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" button
     Then the "Start" page is displayed

  @jira.QANOV-268013 @android @har @jira.cv.11.13 @manual @mobile @moves @smoke
  Scenario: A telco user who was in Start tab can access to Start tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has a "telco" account type
      And user has "PIN" feature "disabled" in the application
      And user is logged in
      And user is in the "Start" page
      And a newer app version exists in "<store>"
     When upgrades the app from the "<store>"
      And launches the app
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-268016 @ios @jira.cv.12.5 @manual @mobile @sanity @vivobr @har
  Scenario: A vivo user who was in Start tab can access to Start tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;control_n;jeri" account types
      And user has "PIN" feature "disabled" in the application
      And user is logged in
      And user is in the "Start" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
     Then the "Start" page is displayed

  @jira.QANOV-268015 @andorid @jira.cv.12.5 @manual @mobile @sanity @vivobr @har
  Scenario: A vivo user who was in Start tab can access to Start tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;control_n;jeri" account types
      And user has "PIN" feature "disabled" in the application
      And user is logged in
      And user is in the "Start" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
     Then the "Start" page is displayed

  @jira.QANOV-417004 @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es user who was in Account tab can access to Account tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has "PIN" feature "disabled" in the application
      And user is logged in
      And user is in the "Start" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
     Then the "Start" page is displayed

  @jira.QANOV-417003 @android @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es user who was in Account tab can access to Account tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has "PIN" feature "disabled" in the application
      And user is logged in
      And user is in the "Start" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.account_tab" button
     Then the "Account" page is displayed

  @jira.<jira_id> @ios @<product> @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24947 @manual @mobile @smoke @har
  Scenario Outline: A user who was in account tab can access to account tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Account" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.account_tab" button
     Then the "Account" page is displayed

    Examples:
          | product | jira_id    |
          | moves   | QANOV-6992 |
          | vivobr  | QANOV-6995 |

  @jira.<jira_id> @android @<product> @jira.cv.10.1 @jira.link.parent_test_plan.QANOV-24947 @manual @mobile @smoke @har
  Scenario Outline: A user who was in account tab can access to account tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Account" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.account_tab" button
     Then the "Account" page is displayed

    Examples:
          | product | jira_id    |
          | moves   | QANOV-6990 |
          | vivobr  | QANOV-6993 |

  @jira.QANOV-6997 @har @ios @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A user who was in aura can access to aura after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has a "postpay" account type
      And user is in the "Aura" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
      And the "Support" page is displayed
      And clicks on the "support_aura" entrypoint
     Then the "Aura" page is displayed

  @jira.QANOV-6996 @android @har @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A user who was in aura can access to aura after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user has a "postpay" account type
      And user is in the "Aura" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
      And the "Support" page is displayed
      And clicks on the "help_me_topics_module.aura" entrypoint
     Then the "Aura" page is displayed

  @jira.QANOV-7009 @har @ios @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A user who was in explore tab can access to explore tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has a "MBB" account type
      And user is logged in
      And user is in the "Explore" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed

  @jira.QANOV-7008 @android @har @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A user who was in explore tab can access to explore tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has a "MBB" account type
      And user is logged in
      And user is in the "Explore" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A user who was in explore tab can access to explore tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Explore" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-7011   |
          | vivobr  | 10.1   | QANOV-7013   |
          | o2es    | Future | QANOV-417006 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A user who was in explore tab can access to explore tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Explore" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-7010   |
          | vivobr  | 10.1   | QANOV-7012   |
          | o2es    | Future | QANOV-417005 |

  @jira.QANOV-7015 @automatic @cert0 @cert1 @har @ios @jira.cv.10.1 @live @mobile @o2uk @sanity
  Scenario: A user who was in profile screen can access to profile screen after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user is in the "Profile" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed

  @jira.QANOV-7014 @android @cert0 @cert1 @har @jira.cv.10.1 @live @manual @mobile @o2uk @sanity
  Scenario: A user who was in profile screen can access to profile screen after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user is in the "Profile" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed

  @jira.<jira_id> @<product> @ios @mobile
  Scenario Outline: A user who was in profile tab can access to profile tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Profile" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed

    @automatic @cert2 @jira.cv.10.1 @live @next @sanity
    Examples:
          | product | jira_id    |
          | moves   | QANOV-7017 |

    @automatic @jira.cv.10.1 @live @next @qa @smoke
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-7019 |

    @jira.cv.Future @manual @smoke
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-417009 |

  @jira.<jira_id> @<product> @android @har @mobile
  Scenario Outline: A user who was in profile tab can access to profile tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Profile" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
     Then the "Profile" page is displayed

    @cert2 @jira.cv.10.1 @live @manual @next @sanity
    Examples:
          | product | jira_id    |
          | moves   | QANOV-7016 |

    @jira.cv.10.1 @live @manual @next @qa @smoke
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-7018 |

    @jira.cv.Future @manual @smoke
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-417008 |

  @jira.QANOV-6986 @har @ios @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A o2uk user who was in Support tab can access to Support tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user is in the "Support" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
     Then the "Support" page is displayed

  @jira.QANOV-6985 @android @har @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A o2uk user who was in Support tab can access to Support tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user is in the "Support" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
     Then the "Support" page is displayed

  @jira.QANOV-7021 @har @ios @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A user who was in support conversation can access to support conversation after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user is in the "Support Chat" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
      And the "Support" page is displayed
      And clicks on the "support_chat_module.button" entrypoint
     Then the "Support Chat" page is displayed

  @jira.QANOV-7020 @android @har @jira.cv.10.1 @manual @mobile @o2uk @smoke
  Scenario: A user who was in support conversation can access to support conversation after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user is in the "Support Chat" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
      And the "Support" page is displayed
      And clicks on the "support_chat_module.button" entrypoint
     Then the "Support Chat" page is displayed

  @jira.QANOV-417011 @ios @o2es @manual @mobile @smoke @jira.cv.Future
  Scenario: A user who was in support tab can access to support tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Support" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
     Then the "Support" page is displayed

  @jira.QANOV-417010 @android @o2es @manual @mobile @smoke @jira.cv.Future
  Scenario: A user who was in support tab can access to support tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Support" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.support_tab" button
     Then the "Support" page is displayed

  @jira.QANOV-250443 @ios @vivobr @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @smoke
  Scenario: A user who was in Mais tab can access to Mais tab after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has any "legacy control;legacy postpay;control_n;jeri" account types
      And user does not have any "convergente;multivivo;beatrix" account types
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Tab Mais" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.mais_tab" button
     Then the "Tab Mais" page is displayed

  @jira.QANOV-250442 @android @vivobr @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @smoke @har
  Scenario: A user who was in Mais tab can access to Mais tab after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has any "legacy control;legacy postpay;control_n;jeri" account types
      And user does not have any "convergente;multivivo;beatrix" account types
      And user is logged in
      And user has "PIN" feature "disabled" in the application
      And user is in the "Tab Mais" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.mais_tab" button
     Then the "Tab Mais" page is displayed

  @jira.<jira_id> @<product> @<test_priority> @ios @jira.cv.<cv> @mobile @<har>
  Scenario Outline: A <product> user who was in <page> screen can access to <page> screen after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has a "<stack_type>" account type
      And user has a "<account_type>" account type
      And user is logged in
      And user is in the "<page>" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "<button>" button
     Then the "<page>" page is displayed

    @automatic @cert3 @live @next
    Examples:
          | product | cv   | stack_type | account_type | page    | button                          | har | test_priority | jira_id      |
          | blaude  | 13.9 | box7       | postpay      | Profile | navigation_top_bar.profile_icon |     | sanity        | QANOV-254470 |

    @manual
    Examples:
          | product | cv   | stack_type | account_type | page    | button                         | har | test_priority | jira_id      |
          | blaude  | 14.0 | box7       | prepay       | Start   | navigation_tab_bar.start_tab   |     | smoke         | QANOV-268018 |
          | blaude  | 13.9 | raitt      | prepay       | Support | navigation_tab_bar.support_tab |     | smoke         | QANOV-254462 |
          | blaude  | 13.9 | box7       | postpay      | Account | navigation_tab_bar.account_tab | har | smoke         | QANOV-254464 |
          | blaude  | 13.9 | box7       | postpay      | Explore | navigation_tab_bar.explore_tab |     | smoke         | QANOV-254468 |

  @jira.<jira_id> @android @<product> @<test_priority> @jira.cv.<cv> @mobile @har
  Scenario Outline: A <product> user who was in <page> screen can access to <page> screen after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has a "<stack_type>" account type
      And user has a "<account_type>" account type
      And user is logged in
      And user is in the "<page>" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "<button>" button
     Then the "<page>" page is displayed

    @cert3 @live @manual @next
    Examples:
          | product | cv   | stack_type | account_type | page    | button                          | har | test_priority | jira_id      |
          | blaude  | 13.9 | box7       | postpay      | Profile | navigation_top_bar.profile_icon | har | sanity        | QANOV-254469 |

    @manual
    Examples:
          | product | cv   | stack_type | account_type | page    | button                         | har | test_priority | jira_id      |
          | blaude  | 14.0 | box7       | prepay       | Start   | navigation_tab_bar.start_tab   |     | smoke         | QANOV-268017 |
          | blaude  | 13.9 | raitt      | prepay       | Support | navigation_tab_bar.support_tab | har | smoke         | QANOV-254461 |
          | blaude  | 13.9 | box7       | postpay      | Account | navigation_tab_bar.account_tab |     | smoke         | QANOV-254463 |
          | blaude  | 13.9 | box7       | postpay      | Explore | navigation_tab_bar.explore_tab |     | smoke         | QANOV-254467 |

  @jira.<jira_id> @ios @<product> @<test_priority> @jira.cv.<cv> @mobile @<har>
  Scenario Outline: A <product> user who was in <page> screen can access to <page> screen after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user has a "<account_type>" account type
      And user is logged in
      And user is in the "<page>" page
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "<button>" button
     Then the "<page>" page is displayed

    @automatic @live @next
    Examples:
          | product | cv   | account_type | page    | button                          | har | test_priority | jira_id      |
          | o2de    | 14.2 | postpay      | Profile | navigation_top_bar.profile_icon |     | sanity        | QANOV-254480 |

    @manual
    Examples:
          | product | cv   | account_type | page    | button                          | har | test_priority | jira_id      |
          | o2de    | 14.2 | postpay      | Start   | navigation_tab_bar.start_tab    | har | smoke         | QANOV-268020 |
          | o2de    | 14.2 | postpay      | Support | navigation_tab_bar.support_tab  |     | smoke         | QANOV-254472 |
          | o2de    | 14.2 | prepay       | Account | navigation_tab_bar.account_tab  |     | smoke         | QANOV-254474 |
          | o2de    | 14.2 | prepay       | Explore | navigation_tab_bar.explore_tab  |     | smoke         | QANOV-254478 |

  @jira.<jira_id> @android @<product> @<test_priority> @jira.cv.<cv> @mobile @<har>
  Scenario Outline: A <product> user who was in <page> screen can access to <page> screen after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "<page>" page
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "<button>" button
     Then the "<page>" page is displayed

    @live @manual @next
    Examples:
          | product | cv   | account_type | page    | button                          | har | test_priority | jira_id      |
          | o2de    | 14.2 | postpay      | Profile | navigation_top_bar.profile_icon | har | sanity        | QANOV-254479 |

    @manual
    Examples:
          | product | cv   | account_type | page    | button                          | har | test_priority | jira_id      |
          | o2de    | 14.2 | postpay      | Start   | navigation_tab_bar.start_tab    | har | smoke         | QANOV-268019 |
          | o2de    | 14.2 | postpay      | Support | navigation_tab_bar.support_tab  |     | smoke         | QANOV-254471 |
          | o2de    | 14.2 | prepay       | Account | navigation_tab_bar.account_tab  |     | smoke         | QANOV-254473 |
          | o2de    | 14.2 | prepay       | Explore | navigation_tab_bar.explore_tab  | har | smoke         | QANOV-254477 |

  @jira.QANOV-7039 @automation.hard @har @ios @jira.cv.11.2 @manual @mobile @moves @regression
  Scenario: A user who had installed the widget can use it after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And the Account widget is installed in the device
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And goes to the Account widget
      And clicks on the "refresh" icon
     Then the information about the mobile line is displayed on the Account widget

  @jira.QANOV-7037 @android @automation.hard @har @jira.cv.11.2 @manual @mobile @moves @regression
  Scenario: A user who had installed the widget can use it after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And the Account widget is installed in the device
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And goes to the Account widget
      And clicks on the "refresh" icon
     Then the information about the mobile line is displayed on the Account widget

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: The user's PIN/FINGERPRINT won't be lost after upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | o2uk    | 10.1  | QANOV-7042   |
          | blaude  | 13.10 | QANOV-286483 |
          | o2de    | 14.2  | QANOV-286485 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: The user's PIN/FINGERPRINT won't be lost after upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv    | jira_id      |
          | o2uk    | 10.1  | QANOV-7040   |
          | blaude  | 13.10 | QANOV-286482 |
          | o2de    | 14.2  | QANOV-286484 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: The user's PIN/FINGERPRINT won't be lost on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user has "PIN" feature "enabled" in the application
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-7045   |
          | vivobr  | 10.1   | QANOV-7048   |
          | o2es    | Future | QANOV-417014 |

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: The user's PIN/FINGERPRINT won't be lost on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user has "PIN" feature "enabled" in the application
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-7043   |
          | vivobr  | 10.1   | QANOV-7047   |
          | o2es    | Future | QANOV-417013 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can access to the app after logout, login and upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user is logged out
      And user is logged in
     When upgrades the app from the "AppStore"
      And launches the app
     Then the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 12.1 | QANOV-57141  |
          | blaude  | 13.9 | QANOV-286487 |
          | o2de    | 14.2 | QANOV-286489 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can access to the app after logout, login and upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user is logged out
      And user is logged in
     When upgrades the app from the "Google Play"
      And launches the app
     Then the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 12.1 | QANOV-57140  |
          | blaude  | 13.9 | QANOV-286486 |
          | o2de    | 14.2 | QANOV-286488 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can access to the app after logout, login and upgrading the app on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given set environment, disable app rating and in-app messages
      And user is logged in
      And user is logged out
      And user is logged in
     When upgrades the app from the "AppStore"
      And launches the app
     Then the landing page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 12.1   | QANOV-57143  |
          | vivobr  | 12.1   | QANOV-57145  |
          | o2es    | Future | QANOV-417016 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can access to the app after logout, login and upgrading the app on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user is logged out
      And user is logged in
     When upgrades the app from the "Google Play"
      And launches the app
     Then the landing page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 12.1   | QANOV-57142  |
          | vivobr  | 12.1   | QANOV-57144  |
          | o2es    | Future | QANOV-417015 |

  @jira.QANOV-183093 @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-181726 @manual @mobile @regression @vivobr
  Scenario: A user from the app can install the app in his/her device and can see the new name on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And a newer app version exists in "AppStore"
     When uninstalls the app
      And installs the app from the "AppStore"
     Then the "Vivo" app is displayed

  @jira.QANOV-183092 @android @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-181726 @manual @mobile @regression @vivobr
  Scenario: A user from the app can install the app in his/her device and can see the new name on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And a newer app version exists in "Google Play"
     When uninstalls the app
      And installs the app from the "Google Play"
     Then the "Vivo" app is displayed

  @jira.QANOV-183095 @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-181726 @manual @mobile @regression @vivobr
  Scenario: A user from the app can upgrade the app in his/her device and can see the new name on iOS devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given set environment, disable app rating and in-app messages
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
     Then the "Vivo" app is displayed

  @jira.QANOV-183094 @<product> @android @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-181726 @manual @mobile
  @regression
  Scenario: A user from the app can upgrade the app in his/her device and can see the new name on Android devices
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
     Then the "Vivo" app is displayed

  @jira.QANOV-450030 @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: A user with multiple lines can upgrade the app on iOS devices
    Given set environment, disable app rating and in-app messages
      And user is logged in the application with "several" lines
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
     Then the landing page is displayed

  @jira.QANOV-450029 @android @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: A user with multiple lines can upgrade the app on Android devices
    Given user is logged in the application with "several" lines
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
     Then the landing page is displayed

  @jira.QANOV-450032 @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: A user with multiple lines who upgraded the app can switch between lines on iOS devices
    Given set environment, disable app rating and in-app messages
      And user is logged in the application with "several" lines
      And a newer app version exists in "AppStore"
     When upgrades the app from the "AppStore"
      And launches the app
      And navigates to "Profile" page
      And clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
     Then the "Profile" page is displayed

  @jira.QANOV-450031 @android @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: A user with multiple lines who upgraded the app can switch between lines on Android devices
    Given user is logged in the application with "several" lines
      And a newer app version exists in "Google Play"
     When upgrades the app from the "Google Play"
      And launches the app
      And navigates to "Profile" page
      And clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
     Then the "Profile" page is displayed

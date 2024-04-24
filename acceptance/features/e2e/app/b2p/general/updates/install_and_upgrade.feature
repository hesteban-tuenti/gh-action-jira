# -*- coding: utf-8 -*-
@jira.QABP-89
Feature: Install and Upgrade

  Actions Before the Feature:
    Given user has downloaded the previous build of the app from AppCenter

  Actions Before each Scenario:
    Given user has installed the app "[CONTEXT:appcenter_previous_app_path]" with build "[CONTEXT:appcenter_previous_app_build]"
      And initiate the app


  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user logged out from the app can upgrade the app in his/her device
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given user is logged out
      And a newer app version exists in "<store>"
     When upgrades the app from the "<store>"
      And launches the app
     Then the "Cookies Management" popup is displayed
      And clicks on the "accept_all_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | client  | cv     | store       | jira_id |
          | was     | android | Future | Google Play | QABP-90 |
          | was     | ios     | Future | App Store   | QABP-91 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user logged out from the app can reinstall the app in his/her device
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given user is logged out
      And a newer app version exists in "<store>"
     When uninstalls the app
      And installs the app from the "<store>"
      And launches the app
     Then the "Cookies Management" popup is displayed
      And clicks on the "accept_all_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | client  | cv     | store       | jira_id |
          | was     | android | Future | Google Play | QABP-92 |
          | was     | ios     | Future | App Store   | QABP-93 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user logged in the app in <client> device can reinstall the app in his/her device and needs to log in again
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding appstore regarding installations and upgrades.
    Given user is logged in
      And a newer app version exists in "<store>"
     When uninstalls the app
      And installs the app from the "<store>"
      And launches the app
     Then the "Cookies Management" popup is displayed
      And clicks on the "accept_all_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | client  | cv     | store       | jira_id |
          | was     | android | Future | Google Play | QABP-94 |
          | was     | ios     | Future | App Store   | QABP-95 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user logged in the app will reach the landing tab after upgrading the app
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And user is in the "Start" page
      And a newer app version exists in "<store>"
     When upgrades the app from the "<store>"
      And launches the app
     Then the landing tab page is displayed

    Examples:
          | product | client  | cv     | store       | jira_id |
          | was     | android | Future | Google Play | QABP-96 |
          | was     | ios     | Future | App Store   | QABP-97 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can navigate through the app after upgrading the app
    NOTE that for executions performed internally by NOVUM team members including QSYS & NOC, the tester will interact
    with App Center instead of the corresponding store regarding installations and upgrades.
    For Android it will be executed with the corresponding internal store distribution. This cannot be done with the
    ios app (only enterprise distribution).
    Given user is logged in
      And a newer app version exists in "<store>"
     When upgrades the app from the "<store>"
      And launches the app
      And the landing tab page is displayed
      And clicks on the "any" button of any element of the "navigation_tab_bar" list
     Then the page is loaded

    Examples:
          | product | client  | cv     | store       | jira_id |
          | was     | android | Future | Google Play | QABP-98 |
          | was     | ios     | Future | App Store   | QABP-99 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can access to the app after logout, login and upgrading the app
    Given user is logged in
      And user is logged out
      And user is logged in
     When upgrades the app from the "<store>"
      And launches the app
     Then the landing page is displayed

    Examples:
          | product | client  | cv     | store       | jira_id  |
          | was     | android | Future | Google Play | QABP-100 |
          | was     | ios     | Future | App Store   | QABP-101 |

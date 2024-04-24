# -*- coding: utf-8 -*-
@jira.QANOV-7722
Feature: Access to account


  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.10.6 @jira.link.relates_to.NOV-65679 @mobile @moves
  @no_automatable @regression
  Scenario Outline: Legado user sees the account in Spanish
    Given user has a "legado" account type
      And user is in the "Account" page
      And the device language is "<language>"
     Then the texts are displayed in "Spanish"

    Examples:
          | language | jira_id    |
          | Spanish  | QANOV-7862 |
          | English  | QANOV-7864 |

  @jira.QANOV-7870 @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.detects.IOS-6872 @jira.link.relates_to.NOV-47637
  @mobile @moves @no_automatable @smoke
  Scenario: Legado user selects Account icon: account screen is displayed with the proper title
    Given user has a "legado" account type
      And user is in the "Account" page
      And user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.QANOV-295135 @android @impeded_legacy @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile
  @moves @regression
  Scenario: Legado user reloads the Account: account screen is displayed
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "legado" account type
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Account" page is displayed

  @jira.QANOV-360490 @android @impeded_legacy @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-360452 @manual
  @mobile @moves @smoke
  Scenario: Legado account page is autorefreshed
    Given user has a "legado" account type
      And user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is autorefreshed
      And the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.6 @mobile @moves @no_automatable @regression
  Scenario Outline: TELCO user sees the Dashboard in Spanish
    Given user has a "telco" account type
      And user is in the "Dashboard" page
      And the device language is "<language>"
     Then the texts are displayed in "Spanish"

    @har
    Examples:
          | language | jira_id      |
          | Spanish  | QANOV-407669 |

    Examples:
          | language | jira_id      |
          | English  | QANOV-407670 |

  @jira.QANOV-407671 @android @automatic @ber @cert2 @ios @jira.cv.10.4 @live @mobile @moves @next @qa @sanity @har
  Scenario: TELCO user selects Dashboard icon: account screen is displayed with the proper title
    Given user is in the "Invoices" page
     When clicks on the "navigation_tab_bar.dashboard_tab" tab
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

  @jira.QANOV-407672 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression @har
  Scenario: TELCO user reloads the Dashboard: Dashboard screen is displayed
    Given user has a "telco" account type
      And user is in the "Dashboard" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

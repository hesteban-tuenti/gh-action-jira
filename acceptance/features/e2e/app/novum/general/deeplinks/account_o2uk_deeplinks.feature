# -*- coding: utf-8 -*-
@jira.QANOV-127139
Feature: Account O2uk Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.11.8 @jira.link.detects.ANDROID-10483
  @jira.link.relates_to.NOV-202756 @live @mobile @netcracker @next @o2uk @regression
  Scenario Outline: SingleMSISDN "<stack_group>" user can open the Bolt Ons deeplink
    Given user has a "<stack_group>" account type
      And user has "1" mobile lines
     When opens the "Account.Bolt Ons" deeplink with the app in "killed" status
     Then the "Bolt Ons" internal webview is displayed
      And the "Your Bolt Ons" header is displayed

    Examples:
          | stack_group | jira_id      |
          | AO2         | QANOV-8389   |
          | legacy      | QANOV-493462 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.relates_to.NOV-117592 @live @mobile
  @netcracker @next @o2uk @sanity
  Scenario Outline: A "<account_type>" user can open the "Account.Bills" deeplink
    Given user has a "<account_type>" account type
      And launches the app
      And initiate the app
      And user has the matching subscription selected in the account
     When opens the "Account.Bills" deeplink with the app in "killed" status
     Then the "Bills" internal webview is displayed
      And the internal webview with "Bills" header is displayed

    Examples:
          | account_type   | jira_id      |
          | AO2 postpay    | QANOV-8433   |
          | legacy postpay | QANOV-493463 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.detects.ANDROID-10483
  @jira.link.detects.O2UK-3946 @jira.link.detects.O2UK-4232 @jira.link.relates_to.NOV-117588 @live @mobile @netcracker
  @next @o2uk @sanity
  Scenario Outline: A "<account_type>" user can open the "Account.Latest Invoice" deeplink
    Given user has a "<account_type>" account type
      And user has the latest airtime bill available
      And launches the app
      And initiate the app
      And user has the matching subscription selected in the account
     When opens the "Account.Latest Invoice" deeplink with the app in "killed" status
     Then the "Latest Airtime Bill" internal webview is displayed
      And the internal webview with "Bill" header is displayed

    Examples:
          | account_type   | jira_id      |
          | AO2 postpay    | QANOV-8435   |
          | legacy postpay | QANOV-493464 |

  @jira.<jira_id> @<ber> @android @automatic @cert0 @cert1 @ios @jira.cv.<cv> @jira.link.detects.<bug_id>
  @jira.link.relates_to.<relates_to> @live @mobile @next @o2uk @smoke
  Scenario Outline: A "<stack_group>" user can open the "<deeplink_name>" deeplink
    Given user has a "<stack_group>" account type
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" internal webview is displayed
      And the internal webview with "<header_value>" header is displayed

    Examples:
          | deeplink_name          | page_name      | header_value        | cv   | relates_to | ber | bug_id        | stack_group | jira_id      |
          | Account.Services       | Services       | Manage your account | 11.1 | NOV-117602 |     |               | AO2         | QANOV-8437   |
          | Account.Services       | Services       | Manage your account | 11.1 | NOV-117602 |     |               | legacy      | QANOV-493465 |
          | Account.Main Account   | Account        | Account             | 11.1 | NOV-100855 | ber | O2UK-5737     | AO2         | QANOV-8439   |
          | Account.Main Account   | Account        | Account             | 11.1 | NOV-100855 | ber | O2UK-5737     | legacy      | QANOV-493466 |
          | Account.Tariff Details | Tariff Details | Your tariff details | 10.2 | NOV-94402  |     | ANDROID-10483 | AO2         | QANOV-8431   |
          | Account.Tariff Details | Tariff Details | Your tariff details | 10.2 | NOV-94402  |     | ANDROID-10483 | legacy      | QANOV-493467 |

  @jira.QANOV-8441 @android @automatic @cert0 @cert1 @ios @jira.cv.11.8 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-202757 @live @mobile @next @o2uk @regression
  Scenario: A legacy user can open the "Account.Extras" deeplink
    Given user has a "legacy postpay" account type
      And user has "1" mobile lines
     When opens the "Account.Extras" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the browser webview with "O2 | My device" text in the header is displayed
      And the "Add Extras" string in browser is displayed

  @jira.QANOV-21739 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-202757 @live @mobile @next @o2uk @regression
  Scenario: An AO2 user can open the "Account.Extras" deeplink
    Given user has a "AO2" account type
     When opens the "Account.Extras" deeplink with the app in "killed" status
     Then the browser webview is displayed
      And the "Your Extras" header is displayed

  @jira.QANOV-606370 @android @cert0 @cert1 @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-573446 @manual @mobile
  @o2uk @regression @e2e
  Scenario: An "postpay" o2uk user can open the "View your latest bill" deeplink: The "Bills" page is displayed
    Given user has a "postpay" account type
      And user has "1" mobile lines
     When opens the "Account.View your latest bill" deeplink with the app in "killed" status
     Then the "Bills" page is displayed
      And the "navigation_top_bar.back_button" button is displayed

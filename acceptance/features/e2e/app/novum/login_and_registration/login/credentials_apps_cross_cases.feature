# -*- coding: utf-8 -*-
@jira.QANOV-272851
Feature: Credentials Apps Cross Cases


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: User with credentials saved in 4p after logging in app A will see the Account Chooser when logging in App B
    Given user has ">=1" credentials saved in 4P after loggin in the App A
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And App A and App B have authentication level acr2
     When user logs in the App B
     Then the "Account Chooser" browser webview is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials

    Examples:
          | product | parent_test_plan | jira_id      | cv     |
          | moves   | QANOV-310051     | QANOV-272852 | 14.3   |
          | vivobr  | QANOV-321305     | QANOV-342844 | Future |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: User with credentials saved in 4p after logging in app A can log in selecting a credential in the the Account Chooser in App B
    Given user has ">=1" credentials saved in 4P after loggin in the App A
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has saved credentials not expired in 4P
      And App A and App B have authentication level acr2
     When user starts logging in the App B
      And the "Account Chooser" browser webview is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials
      And clicks on the "any" element in the "user_4P_stored_credentials" list
     Then user is logged in the App B

    Examples:
          | product | parent_test_plan | jira_id      | cv     |
          | moves   | QANOV-310051     | QANOV-272853 | 14.3   |
          | vivobr  | QANOV-321305     | QANOV-342845 | Future |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke
  Scenario Outline: User with credentials saved in the browser will see password complete when starting the logging process with same credential in App B
    Given user has ">=1" passwords stored on the default browser after loggin in the App A
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
     When user starts logging in the App B
      And fills the "identifier_inputtext" inputtext with the stored identifier
      And clicks on the "pass_field" inputtext
      And the "Account Selector" popup is displayed
      And clicks on the "0" element in the "user_stored_passwords" list
     Then user is logged in the App B

    Examples:
          | product | parent_test_plan | jira_id      | cv     |
          | moves   | QANOV-310051     | QANOV-272854 | 14.3   |
          | vivobr  | QANOV-321305     | QANOV-342846 | Future |

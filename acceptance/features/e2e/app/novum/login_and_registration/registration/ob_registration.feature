# -*- coding: utf-8 -*-
@jira.QANOV-1448
Feature: OB Registration

  Actions Before each Scenario:
    Given user is in the "Splash Screen" page


  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.detects.OBO2UK-1201 @jira.link.relates_to.NOV-91694 @manual
  @mobile @o2uk @regression
  Scenario Outline: A user can log in again after registering
    Given user has "<num_lines>" mobile lines
      And user has registered in the application previously
     When logs in the application and accepts permissions
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | num_lines | jira_id    |
          | 1         | QANOV-1449 |
          | several   | QANOV-1450 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-47695 @manual @mobile
  @o2uk
  Scenario Outline: A user with <num_lines> line(s) can register in the application
    commented_tags="@relates_to.NOV-47601 @relates_to.NOV-47602 @relates_to.NOV-47603 @relates_to.NOV-47610 @relates_to.NOV-47635 @relates_to.NOV-58627 @relates_to.NOV-175385 @relates_to.NOV-175428 @relates_to.NOV-175429"
    Given user has "<num_lines>" mobile lines
      And user has not registered in the application previously
     When logs in the application and accepts permissions
     Then the "Welcome" page is displayed

    Examples:
          | num_lines | test_priority | jira_id    |
          | 1         | sanity        | QANOV-1451 |
          | several   | smoke         | QANOV-1452 |

  @jira.QANOV-25144 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @regression @vivobr
  Scenario: Vivo user can log in after registering
    Given user has registered in the application previously
     When logs in the application and accepts permissions
     Then the landing tab page is displayed

  @jira.QANOV-25145 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @regression @vivobr @old_app
  Scenario: Vivo user can register in the app
    Given user has a "any" plan in "no cancelled" status
      And user has not registered in the application previously
      And user is in the "Vivobr Credentials Login" page
     When clicks on the "register" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @<execution_mode> @mobile
  @<test_priority> @live @next @cert3
  Scenario Outline: A user can register in the app from the "<page>" page
    Given user has set the cookies preferences
      And user is in the "<page>" page
     When clicks on the "registration_link" link
     Then the custom tab webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | page                      | test_priority | depends_on                | jira_id      | execution_mode |
          | blaude  | 13.9 | Blaude Credentials Login  | sanity        | QANOV-230132              | QANOV-230236 | manual         |
          | blaude  | 13.9 | Blaude Login Password     | regression    | QANOV-230134              | QANOV-230237 | manual         |
          | blaude  | 13.9 | Blaude Login Phone Number | regression    | QANOV-230190:QANOV-230191 | QANOV-230238 | manual         |
          | blaude  | 13.9 | Blaude Login SMS Code     | regression    | QANOV-230194              | QANOV-230239 | manual         |
          | o2de    | 14.2 | O2de Login Credentials    | regression    | QANOV-230133              | QANOV-230240 | manual         |
          | o2de    | 14.2 | O2de Login Password       | regression    | QANOV-230135              | QANOV-230241 | manual         |
          | o2de    | 14.2 | O2de Login Phone Number   | sanity        | QANOV-230192:QANOV-230193 | QANOV-230242 | manual         |
          | o2de    | 14.2 | O2de Login SMS Code       | regression    | QANOV-230195              | QANOV-230243 | manual         |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user can log in the app after registering
    Given user has set the cookies preferences
      And user has registered in the application previously
     When logs in the application and accepts permissions
     Then the landing tab page is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-230236:QANOV-230237:QANOV-230238:QANOV-230239 | QANOV-230244 |
          | o2de    | 14.2 | QANOV-230240:QANOV-230241:QANOV-230242:QANOV-230243 | QANOV-230245 |

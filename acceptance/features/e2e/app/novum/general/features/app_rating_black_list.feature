# -*- coding: utf-8 -*-
@jira.QANOV-127081
Feature: App rating black list


  @jira.QANOV-9037 @android @automation.pending_mock @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121910 @manual @mobile
  @o2uk @regression
  Scenario: A o2uk user who is eligible to receive the app rating popup won't get it when the user has an app/OS that has been blacklisted
    Given user has never rated the application
      And the OB has blacklisted the user's device and app version for the app rating feature
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-121910 @mobile @old_app @regression @vivobr
  Scenario Outline: Vivo user who is eligible to receive the app rating popup won't get it when the user has an app/OS that has been blacklisted
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And the OB has blacklisted the user's device and app version for the app rating feature
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the "Pacotes" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id      |
          | legacy       | ServicesV1    | 1            | 11.2 |                  | QANOV-9039   |
          | jeri         | ServicesV1    | 1            | 13.6 | QANOV-226748     | QANOV-228890 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id    |
          | beatrix      | Account       | any          | 11.2 |                  | QANOV-9040 |

  @jira.QANOV-599247 @android @ios @jira.cv.24.3 @mobile @regression @vivobr
  Scenario: Vivo user who is eligible to receive the app rating popup won't get it when the user has an app/OS that has been blacklisted
    Given user has never rated the application
      And the OB has blacklisted the user's device and app version for the app rating feature
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Assinatura" page
     When clicks on the "pacotes" entrypoint
      And the "Pacotes" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who is eligible to receive the app rating popup won't get it when the user has an app/OS that has been blacklisted
    Given user has a "mobile_line" product in "active" status
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has blacklisted the user's device and app version for the app rating feature
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375531 |
          | o2de    | QANOV-375532 |

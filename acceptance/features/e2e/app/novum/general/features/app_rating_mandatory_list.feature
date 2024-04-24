# -*- coding: utf-8 -*-
@jira.QANOV-127085
Feature: App rating mandatory list


  @jira.QANOV-9049 @o2uk @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-122321 @manual @mobile @regression
  Scenario: User who has never received the app rating popup and is eligible to receive it will get it when the user has an app/OS that has been included in the mandatory list
    Given user has never rated the application
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-122321 @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who has never received the app rating popup and is eligible to receive it will get it when the user has an app/OS that has been included in the mandatory list
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the "Pacotes" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id      |
          | legacy       | ServicesV1    | 1            | 11.2 |                  | QANOV-9051   |
          | jeri         | ServicesV1    | 1            | 13.6 | QANOV-226748     | QANOV-228895 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id    |
          | beatrix      | Account       | any          | 11.2 |                  | QANOV-9052 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who has never received the app rating popup and is eligible to receive it will get it when the user has an app/OS that has been included in the mandatory list
    Given user has a "mobile_line" product in "active" status
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375590 |
          | o2de    | QANOV-375591 |

  @jira.QANOV-9053 @o2uk @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-121922 @manual @mobile @regression
  Scenario: User who has consumed the app rating popup and is eligible to receive it again won't get it when the user has an app/OS that has been included in a mandatory list and less than a month has passed
    Given user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-121922 @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who has consumed the app rating popup and is eligible to receive it again won't get it when the user has an app/OS that has been included in a mandatory list and less than a month has passed
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
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
          | legacy       | ServicesV1    | 1            | 11.2 |                  | QANOV-9055   |
          | jeri         | ServicesV1    | 1            | 13.6 | QANOV-226748     | QANOV-228899 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id    |
          | beatrix      | Account       | any          | 11.2 |                  | QANOV-9056 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who has consumed the app rating popup and is eligible to receive it again won't get it when the user has an app/OS that has been included in a mandatory list and less than a month has passed
    Given user has a "mobile_line" product in "active" status
      And And user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375592 |
          | o2de    | QANOV-375593 |

  @jira.QANOV-9057 @o2uk @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-121914 @manual @mobile @regression
  Scenario: User who has consumed the app rating popup and is eligible to receive it again will get it when the user has an app/OS that has been included in a mandatory list and more than a month has passed
    Given user rated the app ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-121914 @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who has consumed the app rating popup and is eligible to receive it again will get it when the user has an app/OS that has been included in a mandatory list and more than a month has passed
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user rated the app ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the "Pacotes" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id      |
          | legacy       | ServicesV1    | 1            | 11.2 |                  | QANOV-9059   |
          | jeri         | ServicesV1    | 1            | 13.6 | QANOV-226748     | QANOV-228904 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id    |
          | beatrix      | Account       | any          | 11.2 |                  | QANOV-9060 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who has consumed the app rating popup and is eligible to receive it again will get it when the user has an app/OS that has been included in a mandatory list and more than a month has passed
    Given user has a "mobile_line" product in "active" status
      And user rated the app ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And the OB has included the user's device and app version in a mandatory list for the app rating feature
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375594 |
          | o2de    | QANOV-375595 |

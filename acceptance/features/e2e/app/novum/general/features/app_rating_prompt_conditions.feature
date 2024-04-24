# -*- coding: utf-8 -*-
@jira.QANOV-375864
Feature: App rating prompt conditions

  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
     Then app rating is "disabled"


  @jira.QANOV-8926 @o2uk @android @automation.pending_mock @impeded_mock @ios @jira.cv.9.14
  @jira.link.relates_to.NOV-13572 @manual @mobile @regression
  Scenario: A o2uk user who rated the app cannot rate the app again if the rate limit hasn't been reached
    Given user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
     When user is in the "Explore" page
      And clicks on the "navigation_tab_bar.support" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.QANOV-8924 @moves @android @automation.pending_mock @impeded_mock @ios @jira.cv.9.14
  @jira.link.relates_to.NOV-13572 @manual @mobile @regression
  Scenario: A moves user who rated the app cannot rate the app again if the rate limit hasn't been reached
    Given user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
     When user is in the "Start" page
      And clicks on the "navigation_tab_bar.explore" tab
      And the "Explore" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-13572 @manual @mobile @regression @vivobr
  Scenario Outline: Vivo user who rated the app cannot rate the app again if the rate limit hasn't been reached
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | account_type | services_page | number_plans | cv   | parent_test_plan | jira_id      |
          | legacy       | ServicesV1    | 1            | 9.14 |                  | QANOV-8928   |
          | jeri         | ServicesV1    | 1            | 13.6 | QANOV-226748     | QANOV-228894 |
          | beatrix      | Account       | any          | 9.14 |                  | QANOV-8929   |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who rated the app cannot rate the app again if the rate limit hasn't been reached
    Given user has a "mobile_line" product in "active" status
      And user rated the app "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375880 |
          | o2de    | QANOV-375881 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.9.14
  @jira.link.relates_to.NOV-13571 @manual @mobile @regression
  Scenario Outline: A <product> user who rated the app can rate the app again if the rate limit has been reached
    Given user rated the app ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.mais_tab" tab
      And the "Tab Mais" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | jira_id    |
          | o2uk    | QANOV-8918 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13571
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who rated the app can rate the app again if the rate limit has been reached
    Given user has a "<account_type>" account type
      And user rated the app ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When clicks on the "pacotes" entrypoint
      And the "Pacotes" internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | account_type | jira_id    |
          | beatrix      | QANOV-8921 |
          | convergente  | QANOV-8923 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who rated the app can rate the app again if the rate limit has been reached
    Given user has a "mobile_line" product in "active" status
      And user rated the app ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375884 |
          | o2de    | QANOV-375885 |

  @jira.QANOV-375886 @o2uk @android @automation.hard @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13575 @manual @mobile
  @regression
  Scenario: A o2uk user who discarded the rating message cannot rate the app if the rate limit hasn't been reached
    Given user discarded the app rating "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.QANOV-8931 @moves @android @automation.hard @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13575 @manual @mobile
  @regression
  Scenario: A moves user who discarded the rating message cannot rate the app if the rate limit hasn't been reached
    Given user discarded the app rating "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore" tab
      And the "Explore" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13575 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: Vivo user who discarded the rating message cannot rate the app if the rate limit hasn't been reached
    Given user has a "<account_type>" account type
      And user discarded the app rating "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | account_type | services_page | jira_id    |
          | beatrix      | Services      | QANOV-8933 |
          | convergente  | Services      | QANOV-8934 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who discarded the rating message cannot rate the app if the rate limit hasn't been reached
    Given user has a "mobile_line" product in "active" status
      And user discarded the app rating "<30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375889 |
          | o2de    | QANOV-375890 |

  @jira.QANOV-8936 @android @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13574 @manual @mobile @moves @regression
  Scenario: MOVES user who discarded the rating message can rate the app if the rate limit has been reached
    Given user discarded the app rating ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore" tab
      And the "Explore" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.9.14 @jira.link.relates_to.NOV-13574 @mobile
  @regression @vivobr @old_app
  Scenario Outline: Vivo user who discarded the rating message can rate the app if the rate limit has been reached
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user is in the "<services_page>" page
      And user discarded the app rating ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | legacy       | ServicesV1    | 1            | QANOV-8938 |

    @manual
    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | beatrix      | Services      | any          | QANOV-8940 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who discarded the rating message can rate the app if the rate limit has been reached
    Given user has a "mobile_line" product in "active" status
      And user discarded the app rating ">30" days ago
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375893 |
          | o2de    | QANOV-375894 |

  @jira.QANOV-145285 @android @automation.hard @ios @jira.cv.12.7 @jira.link.relates_to.NOV-13575 @manual @mobile
  @regression @vivobr @old_app
  Scenario: Vivo user who has already rated the app and updates the app can rate again after reaching the rate limit
    Siebel and soft convergente won't have the Services screen therefore they have been filtered out in the pre-requisites
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have a "siebel" plan
      And user does not have a "soft convergente" plan
      And user installs a newer app version
      And user rated the app ">30" days ago
      And user is in the "Services" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Services" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.QANOV-145286 @android @automation.hard @ios @jira.cv.12.7 @jira.link.relates_to.NOV-13575 @manual @mobile
  @regression @vivobr @old_app
  Scenario: Vivo user who has already rated the app and updates the app can rate again even if the rate limit hasn't been reached when auto-reset is enabled
    Siebel and soft convergente won't have the Services screen therefore they have been filtered out in the pre-requisites
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have a "siebel" plan
      And user does not have a "soft convergente" plan
      And user installs a newer app version
      And user rated the app "<30" days ago
      And environment has the app rating auto-reset enabled
      And user is in the "Services" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button_button" button
      And the "Services" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.QANOV-9041 @o2uk @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-121812 @manual @mobile @regression
  Scenario: o2uk user who is eligible to receive the app rating popup won't get the app rating popup when Account is down
    internal_checkpoint="
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |"
    Given user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.QANOV-9042 @moves @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-121812 @manual @mobile @regression
  Scenario: moves user who is eligible to receive the app rating popup won't get the app rating popup when Account is down
    internal_checkpoint="
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |"
    Given user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121812 @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who is eligible to receive the app rating popup won't get the app rating popup when Account is down
    internal_checkpoint="
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |"
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | legacy       | ServicesV1    | 1            | QANOV-9043 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | beatrix      | Account       | any          | QANOV-9044 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5 @manual @mobile
  @regression
  Scenario Outline: A <product> user who is eligible to receive the app rating popup won't get the app rating popup when Account is down
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |
    Given user has a "mobile_line" product in "active" status
      And user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375897 |
          | o2de    | QANOV-375899 |

  @jira.QANOV-9045 @o2uk @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-121825 @manual @mobile @regression
  Scenario: o2uk user who didn't get the app rating popup when Account was down and is eligible to receive it will receive it when Account is not down
    internal_checkpoint="
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |"
    Given user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "180" seconds
      And clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.QANOV-9046 @moves @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.relates_to.NOV-121825 @manual @mobile @regression
  Scenario: moves user who didn't get the app rating popup when Account was down and is eligible to receive it will receive it when Account is not down
    internal_checkpoint="
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |"
    Given user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And waits "180" seconds
      And clicks on the "navigation_tab_bar.start_tab" tab
      And the "Start" page is displayed
      And clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121825 @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who didn't get the app rating popup when Account was down and is eligible to receive it will receive it when Account is not down
    internal_checkpoint="
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |"
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "180" seconds
      And clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | legacy       | ServicesV1    | 1            | QANOV-9047 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | number_plans | jira_id    |
          | beatrix      | Account       | any          | QANOV-9048 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5
  @jira.link.detects.ANDROID-13457 @manual @mobile @regression
  Scenario Outline: A <product> user who didn't get the app rating popup when Account was down and is eligible to receive it will receive it when Account is not down
    ||number_of_events||event_type||
    |>x (TBD by the OB)|CRITICAL  |
    |20%(TBD by the OB)|BAD       |
    Given user has a "mobile_line" product in "active" status
      And user has never rated the application
      And critical events or more than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "180" seconds
      And clicks on the "navigation_tab_bar.account_tab" tab
      And user is in the "Account" page
      And makes a successful bundle purchase
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375901 |
          | o2de    | QANOV-375903 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-63864 @manual @mobile @regression
  Scenario Outline: The app rating popup appears when the app is killed after the app rating triggering event and before the app rating popup appeared
    Given user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And terminates the app
      And waits "<wait_time>" seconds
      And launches the app
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | wait_time | jira_id    |
          | o2uk    | 295       | QANOV-8965 |
          | o2uk    | 305       | QANOV-8967 |
          | o2uk    | 600       | QANOV-8969 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-63864 @manual @mobile @regression
  Scenario Outline: The app rating popup appears when the app is killed after the app rating triggering event and before the app rating popup appeared
    Given user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And terminates the app
      And waits "<wait_time>" seconds
      And launches the app
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | wait_time | jira_id    |
          | moves   | 1         | QANOV-8971 |
          | moves   | 5         | QANOV-8973 |
          | moves   | 600       | QANOV-8975 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-63864 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: The app rating popup appears when the app is killed after the app rating triggering event and before the app rating popup appeared in Vivo
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And terminates the app
      And waits "<wait_time>" seconds
      And launches the app
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | account_type | services_page | wait_time | number_plans | jira_id    |
          | legacy       | ServicesV1    | 175       | 1            | QANOV-8977 |
          | legacy       | ServicesV1    | 185       | 1            | QANOV-8978 |
          | legacy       | ServicesV1    | 600       | 1            | QANOV-8980 |
          | beatrix      | Account       | 175       | any          | QANOV-8982 |
          | beatrix      | Account       | 185       | any          | QANOV-8984 |
          | beatrix      | Account       | 600       | any          | QANOV-8986 |

  @jira.<jira_id> @<product> @android @automation.pending_mock @impeded_mock @ios @jira.cv.14.5
  @jira.link.detects.ANDROID-13456 @manual @mobile @regression
  Scenario Outline: The app rating popup appears when the app is killed after the app rating triggering event and before the app rating popup appeared in <product> app
    Given user has a "mobile_line" product in "active" status
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And terminates the app
      And waits "<wait_time>" seconds
      And launches the app
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | wait_time | jira_id      |
          | blaude  | 200       | QANOV-375909 |
          | blaude  | 300       | QANOV-375910 |
          | blaude  | 600       | QANOV-375911 |
          | o2de    | 200       | QANOV-375913 |
          | o2de    | 300       | QANOV-375914 |
          | o2de    | 600       | QANOV-375915 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121846 @manual @mobile
  @regression
  Scenario Outline: User who is logged in two devices with different OS and triggers an app rating event and Account has reported being down in a device: The app rating popup will be displayed in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has never rated the application
      And critical events or more than "20" % of BAD events in the last "3" minutes in Account for the "<device1>" device
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed in the "<device1>" device
      And the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | product | device1 | device2 | jira_id    |
          | o2uk    | Android | iOS     | QANOV-8995 |
          | o2uk    | iOS     | Android | QANOV-8997 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121846 @manual @mobile
  @regression
  Scenario Outline: User who is logged in two devices with different OS and triggers an app rating event and Account has reported being down in a device: The app rating popup will be displayed in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has never rated the application
      And critical events or more than "20" % of BAD events in the last "3" minutes in Account for the "<device1>" device
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed in the "<device1>" device
      And the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | product | device1 | device2 | jira_id    |
          | moves   | Android | iOS     | QANOV-8999 |
          | moves   | iOS     | Android | QANOV-9001 |

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121846 @mobile @regression @vivobr @old_app
  Scenario Outline: Vivo user who is logged in two devices with different OS and triggers an app rating event and Account has reported being down in a device: The app rating popup will be displayed in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And critical events or more than "20" % of BAD events in the last "3" minutes in Account for the "<device1>" device
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed in the "<device1>" device
      And the "Popup Rate Stars" popup is displayed in the "<device2>" device

    @impeded_legacy @no_automatable
    Examples:
          | account_type | services_page | device1 | device2 | number_plans | jira_id    |
          | legacy       | ServicesV1    | Android | iOS     | 1            | QANOV-9003 |
          | legacy       | ServicesV1    | iOS     | Android | 1            | QANOV-9004 |

    @automation.hard @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type | services_page | device1 | device2 | number_plans | jira_id    |
          | beatrix      | Account       | Android | iOS     | any          | QANOV-9006 |
          | beatrix      | Account       | iOS     | Android | any          | QANOV-9008 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.14.5 @manual @mobile @regression
  Scenario Outline: A <product> user who is logged in two devices with different OS and triggers an app rating event and Account has reported being down in a device: The app rating popup will be displayed in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has a "mobile_line" product in "active" status
      And user has never rated the application
      And critical events or more than "20" % of BAD events in the last "3" minutes in Account for the "<device1>" device
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is not displayed in the "<device1>" device
      And the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | product | device1 | device2 | jira_id      |
          | blaude  | Android | iOS     | QANOV-375919 |
          | blaude  | iOS     | Android | QANOV-375921 |
          | o2de    | Android | iOS     | QANOV-375922 |
          | o2de    | iOS     | Android | QANOV-375923 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121879 @manual @mobile
  @regression
  Scenario Outline: User who has received the app rating popup in both devices and consumes the popup in one device: still will see the popup in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed in the "<device1>" device
      And clicks on the "cancel_button" button in the "<device1>" device
     Then the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | product | device1 | device2 | jira_id    |
          | o2uk    | Android | iOS     | QANOV-9010 |
          | o2uk    | iOS     | Android | QANOV-9012 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121879 @manual @mobile
  @regression
  Scenario Outline: User who has received the app rating popup in both devices and consumes the popup in one device: still will see the popup in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed in the "<device1>" device
      And clicks on the "cancel_button" button in the "<device1>" device
     Then the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | product | device1 | device2 | jira_id    |
          | moves   | Android | iOS     | QANOV-9014 |
          | moves   | iOS     | Android | QANOV-9015 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-121879 @manual @mobile
  @regression @vivobr @old_app
  Scenario Outline: Vivo user who has received the app rating popup in both devices and consumes the popup in one device: still will see the popup in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed in the "<device1>" device
      And clicks on the "cancel_button" button in the "<device1>" device
     Then the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | account_type | services_page | device1 | device2 | number_plans | jira_id    |
          | legacy       | ServicesV1    | Android | iOS     | 1            | QANOV-9017 |
          | legacy       | ServicesV1    | iOS     | Android | 1            | QANOV-9019 |
          | beatrix      | Account       | Android | iOS     | any          | QANOV-9021 |
          | beatrix      | Account       | iOS     | Android | any          | QANOV-9023 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.14.5 @manual @mobile @regression
  Scenario Outline: A <product> user who has received the app rating popup in both devices and consumes the popup in one device: user will still see the popup in the other device
    Given user is logged in with the same account in two devices with different OS
      And user has a "mobile_line" product in "active" status
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account for any device
      And user is in the "Account" page
     When makes a successful bundle purchase
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed in the "<device1>" device
      And clicks on the "cancel_button" button in the "<device1>" device
     Then the "Popup Rate Stars" popup is displayed in the "<device2>" device

    Examples:
          | product | device1 | device2 | jira_id      |
          | blaude  | Android | iOS     | QANOV-375927 |
          | blaude  | iOS     | Android | QANOV-375928 |
          | o2de    | Android | iOS     | QANOV-375929 |
          | o2de    | iOS     | Android | QANOV-375930 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.10.2 @jira.link.relates_to.NOV-39060 @manual @mobile
  @regression
  Scenario Outline: App rating popup appears when the app is brought back to foreground
    internal_checkpoint="The triggers and its delays can be modified. You can check the actual configuration here:
    - https://gitlab.tuenti.io/tuenti/unified_config/blob/master/environment/novum/vivo-br/tuenti-ng/appRating.yaml"
    Given user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And runs the app in the background for "<wait_time>" seconds
     Then the "Popup Rate Stars" popup is displayed

    @har
    Examples:
          | product | wait_time | jira_id    |
          | o2uk    | 290       | QANOV-9024 |
          | o2uk    | 310       | QANOV-9026 |
          | o2uk    | 605       | QANOV-9027 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.10.2 @jira.link.relates_to.NOV-39060 @manual @mobile
  @regression
  Scenario Outline: App rating popup appears when the app is brought back to foreground
    internal_checkpoint="The triggers and its delays can be modified. You can check the actual configuration here:
    - https://gitlab.tuenti.io/tuenti/unified_config/blob/master/environment/novum/vivo-br/tuenti-ng/appRating.yaml"
    Given user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
      And runs the app in the background for "<wait_time>" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | wait_time | jira_id    |
          | moves   | 1         | QANOV-9028 |
          | moves   | 5         | QANOV-9029 |
          | moves   | 605       | QANOV-9030 |

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-39060 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: App rating popup appears when the app is brought back to foreground in Vivo
    internal_checkpoint="The triggers and its delays can be modified. You can check the actual configuration here:
    - https://gitlab.tuenti.io/tuenti/unified_config/blob/master/environment/novum/o2-uk/tuenti-ng/appRating.yaml
    - https://gitlab.tuenti.io/tuenti/unified_config/blob/master/environment/tuenti/base/tuenti-ng/appRating.yaml"
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "<services_page>" page
     When clicks on the "pacotes" entrypoint
      And the internal webview with "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<services_page>" page is displayed
      And runs the app in the background for "<wait_time>" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | account_type | services_page | wait_time | number_plans | jira_id    |
          | legacy       | ServicesV1    | 175       | 1            | QANOV-9031 |
          | legacy       | ServicesV1    | 185       | 1            | QANOV-9032 |
          | legacy       | ServicesV1    | 605       | 1            | QANOV-9033 |
          | beatrix      | Account       | 175       | any          | QANOV-9034 |
          | beatrix      | Account       | 185       | any          | QANOV-9035 |
          | beatrix      | Account       | 605       | any          | QANOV-9036 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.14.5 @manual @mobile @regression
  Scenario Outline: App rating popup appears when the app is brought back to foreground
    Given user has a "mobile_line" product in "active" status
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Account" page
     When makes a successful bundle purchase
      And runs the app in the background for "<wait_time>" seconds
     Then the "Popup Rate Stars" popup is displayed

    Examples:
          | product | wait_time | jira_id      |
          | blaude  | 200       | QANOV-375944 |
          | blaude  | 300       | QANOV-375945 |
          | blaude  | 605       | QANOV-375946 |
          | o2de    | 200       | QANOV-375947 |
          | o2de    | 300       | QANOV-375948 |
          | o2de    | 605       | QANOV-375949 |

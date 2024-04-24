# -*- coding: utf-8 -*-
@jira.QANOV-127149
Feature: Feedback alerts allowances

  Actions Before each Scenario:
    Given user has the "alerts" module configured in CMS for "dashboard" page


  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-201024 @manual @mobile @smoke @vivobr
  @old_app
  Scenario Outline: User who has changed the plan can see an alert about new plan
    Given user has a "<account_type>" account type
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "User plan has changed" preconfiguration
      And user has changed the current plan
      And user has not closed the "change_plan_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "change_plan_alert" element is displayed
      And the "change_plan_alert.title" textfield with the "Seu plano mudou em dd/mm/yyyy" format is displayed
      And the "change_plan_alert.subtitle" textfield that contains the "Agora ele é um plano" text is displayed
      And the "change_plan_alert.close" button is displayed
      And the "change_plan_alert.plan_details" link with "Ir para detalhes do plano" text is displayed

    Examples:
          | cv     | account_type | jira_id    |
          | Future | beatrix      | QANOV-4658 |
          | Future | convergente  | QANOV-4659 |
          | Future | multivivo    | QANOV-4660 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-4669 @jira.link.relates_to.NOV-201027 @manual
  @mobile @regression @vivobr @old_app
  Scenario Outline: User can see the change plan alert 30 days after user close the alert
    Given user has a "<account_type>" account type
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "User plan has changed" preconfiguration
      And user has changed the current plan
      And user has closed the "change_plan_alert" alert more than "30 days" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "change_plan_alert.alert" element is displayed
      And the "change_plan_alert.subtitle" textfield that contains the "Agora ele é um plano" text is displayed
      And the "change_plan_alert.close" button is displayed
      And the "change_plan_alert.plan_details" link with "Ir para detalhes do plano" text is displayed

    Examples:
          | cv     | account_type | jira_id    |
          | Future | beatrix      | QANOV-4661 |
          | Future | convergente  | QANOV-4662 |
          | Future | multivivo    | QANOV-4663 |

  @jira.QANOV-131631 @android @ios @jira.cv.Future @jira.link.detects.ACCOUNT-15789 @old_app
  @jira.link.parent_test_plan.QANOV-66163 @jira.link.relates_to.NOV-201024 @manual @mobile @smoke @vivobr
  Scenario: A siebel user with an internet fiber available can see an alert about the fiber change plan
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a "any" plan in "active" status
      And user has an internet fiber available
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "User plan has changed" preconfiguration
      And user has not closed the "change_plan_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "change_plan_alert.alert" element is displayed
      And the "change_plan_alert.title" textfield with the "TBD" format is displayed
      And the "change_plan_alert.subtitle" textfield that contains the "TBD" text is displayed
      And the "change_plan_alert.close" button is displayed
      And the "change_plan_alert.plan_details" link with "TBD" text is displayed

  @jira.QANOV-131632 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-131631 @old_app
  @jira.link.parent_test_plan.QANOV-66163 @jira.link.relates_to.NOV-201024 @manual @mobile @regression @vivobr
  Scenario: A siebel user with an internet fiber available taps on the fiber change plan alert: User is redirected to the the fiber change plan information screen
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a "any" plan in "active" status
      And user has an internet fiber available
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "User plan has changed" preconfiguration
      And user has not closed the "change_plan_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "change_plan_alert.plan_details" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-4660 @jira.link.relates_to.NOV-201025 @manual
  @mobile @regression @vivobr @old_app
  Scenario Outline: User taps on the "Ir para detalhes do plano" button on a change plan alert: User is redirected to the "Meus Produtos" screen
    Given user has a "<account_type>" account type
      And user has changed the current plan
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "User plan has changed" preconfiguration
      And user has not closed the "change_plan_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "change_plan_alert.plan_details" link
     Then the "Meus Produtos" internal webview is displayed
      And the "Meus Produtos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | cv     | account_type | jira_id    |
          | Future | beatrix      | QANOV-4664 |
          | Future | convergente  | QANOV-4665 |
          | Future | multivivo    | QANOV-4666 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-4660 @jira.link.relates_to.NOV-185675 @manual
  @mobile @regression @vivobr @old_app
  Scenario Outline: User who has changed the plan can close alert in the account dashboard
    internal_checkpoint="if user refresh the account alert shouldn't be displayed"
    Given user has a "<account_type>" account type
      And user has changed the current plan
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "User plan has changed" preconfiguration
      And user has not closed the "change_plan_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "change_plan_alert.close" button
     Then the "change_plan_alert.alert" element is not displayed

    Examples:
          | cv     | account_type | jira_id    |
          | Future | beatrix      | QANOV-4667 |
          | Future | convergente  | QANOV-4668 |
          | Future | multivivo    | QANOV-4669 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: User who has finished a fiber migration can see an alert about new plan
    Given user has a "<account_type>" account type
      And user has an internet fiber migration finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "change_fiber_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "change_fiber_alert.alert" element is displayed
      And the "change_fiber_alert.title" textfield with the "Tudo certo! Seu plano já mudou" format is displayed
      And the "change_fiber_alert.subtitle" textfield that contains the "Seu produto Vivo está instalado e funcionando. Veja as novidades" text is displayed
      And the "change_fiber_alert.close" button is displayed
      And the "change_fiber_alert.plan_details" link with "Ver mais" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-162455 |
          | convergente  | QANOV-162456 |
          | multivivo    | QANOV-162457 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User who has finished a fiber migration can see an alert TBD days after closing the alert
    Given user has a "<account_type>" account type
      And user has an internet fiber migration finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has closed the "change_fiber_alert" alert more than "TBD days" ago
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "change_fiber_alert.alert" element is displayed
      And the "change_fiber_alert.subtitle" textfield that contains the "Seu produto Vivo está instalado e funcionando. Veja as novidades" text is displayed
      And the "change_fiber_alert.close" button is displayed
      And the "change_fiber_alert.plan_details" link with "Ver mais" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-162458 |
          | convergente  | QANOV-162459 |
          | multivivo    | QANOV-162460 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User taps on the "Ver mais" button on a finished fiber migration alert: User is redirected to the "Welcome" screen
    Given user has a "<account_type>" account type
      And user has an internet fiber migration finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "change_fiber_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "change_fiber_alert.plan_details" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-162461 |
          | convergente  | QANOV-162462 |
          | multivivo    | QANOV-162463 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User who has finished a fiber migration can close the alert in the account dashboard
    if user refresh the account alert shouldn't be displayed
    Given user has a "<account_type>" account type
      And user has an internet fiber migration finished
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "TBD" preconfiguration
      And user has not closed the "change_fiber_alert" alert
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "change_fiber_alert.close" button
     Then the "change_fiber_alert.alert" element is not displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-162464 |
          | convergente  | QANOV-162465 |
          | multivivo    | QANOV-162466 |

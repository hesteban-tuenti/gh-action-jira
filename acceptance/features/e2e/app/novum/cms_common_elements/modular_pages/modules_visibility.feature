# -*- coding: utf-8 -*-
@jira.QANOV-310307
Feature: Modules Visibility


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_<audience>_audience
  Scenario Outline: A user can see a module configured with an audience that belongs to the user
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And user has a "<account_type>" account type
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_action_row" module is displayed

    Examples:
          | product | cv   | audience          | account_type  | jira_id      |
          | vivobr  | 13.3 | ob-4p             | convergente   | QANOV-189642 |
          | o2uk    | 13.3 | legacy            | legacy        | QANOV-189643 |
          | moves   | 13.1 | telco-has-postpay | telco postpay | QANOV-189644 |
          | blaude  | 24.0 | postpay           | postpay       | QANOV-531549 |
          | o2de    | 24.0 | postpay           | postpay       | QANOV-531550 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_<audience>_audience
  @fixture.cms.module.simple_highlighted_card
  Scenario Outline: A user can't see a module configured with an audience not allowed to the user
    To be executed in QA
    Given the "Highlighted Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And user has a "<account_type>" account type
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_action_row" module is not displayed
      And the "simple_highlighted_card" module is displayed

    Examples:
          | product | cv   | audience  | account_type | jira_id      |
          | vivobr  | 13.3 | ob-legacy | convergente  | QANOV-189645 |
          | o2uk    | 13.3 | ao2       | legacy       | QANOV-189646 |
          | moves   | 13.1 | prepay    | postpay      | QANOV-189647 |
          | blaude  | 24.0 | prepay    | postpay      | QANOV-531551 |
          | o2de    | 24.0 | prepay    | postpay      | QANOV-531552 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @moves @qa @regression
  Scenario Outline: A Moves user can see a module configured with a composition of audiences where user must meet <composition>
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "telco postpay" account type
      And user does not have a "pikolin" plan
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is displayed

    Examples:
          | audience                          | composition            | jira_id      |
          | ob-telco;!not-has-pikolin;postpay | all conditions         | QANOV-313366 |
          | has-pikolin;ob-telco;!postpay     | one or more conditions | QANOV-313367 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @qa @regression @vivobr
  Scenario Outline: A Vivo user can see a module configured with a composition of audiences where user must meet <composition>
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "beatrix postpay" account type
      And user has "several" plans
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is displayed

    Examples:
          | audience                          | composition            | jira_id      |
          | ob-beatrix;!only-one-plan;postpay | all conditions         | QANOV-313368 |
          | !multi-plan;ob-beatrix;!postpay   | one or more conditions | QANOV-313369 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @qa @regression
  Scenario Outline: A O2uk user can see a module configured with a composition of audiences where user must meet <composition>
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "legacy" account type
      And user has "several" mobile lines
      And user does not have a "device" account type
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is displayed

    Examples:
          | audience                               | composition            | jira_id      |
          | legacy;multi-plan;!is-sim-free-finance | all conditions         | QANOV-313370 |
          | !legacy;multi-plan;is-sim-free-finance | one or more conditions | QANOV-313371 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @qa @regression
  Scenario Outline: A <product> user can see a module configured with a composition of audiences where user must meet <composition>
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "postpay" account type
      And user has "several" mobile lines
      And user does not have a "device" account type
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is displayed

    Examples:
          | product | audience                   | composition            | jira_id      |
          | blaude  | postpay;multi-plan;!prepay | all conditions         | QANOV-531553 |
          | o2de    | !postpay;multi-plan;prepay | one or more conditions | QANOV-531554 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @moves @qa @regression
  Scenario Outline: A Moves user can't see a module configured with a composition of audiences where none of them belongs to the user
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "ob-telco;!not-has-pikolin;postpay" audience defined
      And the audiences defined must meet <composition>
      And user has a "legacy postpay" account type
      And user does not have a "pikolin" plan
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is not displayed

    Examples:
          | audience                          | composition            | jira_id      |
          | ob-telco;!not-has-pikolin;postpay | all conditions         | QANOV-313372 |
          | has-pikolin;ob-telco;!prepay      | one or more conditions | QANOV-313373 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @qa @regression @vivobr
  Scenario Outline: A Vivo user can't see a module configured with a composition of audiences where none of them belongs to the user
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "beatrix postpay" account type
      And user has "1" plans
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is not displayed

    Examples:
          | audience                          | composition            | jira_id      |
          | ob-beatrix;!only-one-plan;postpay | all conditions         | QANOV-313374 |
          | multi-plan;!ob-beatrix;prepay     | one or more conditions | QANOV-313375 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @o2uk @qa @regression
  Scenario Outline: A O2uk user can't see a module configured with a composition of audiences where none of them belongs to the user
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "AO2" account type
      And user has "1" mobile lines
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is not displayed

    Examples:
          | audience                             | composition            | jira_id      |
          | !legacy;mono-product;upgrades-legacy | all conditions         | QANOV-313376 |
          | !legacy;multi-plan;upgrades-legacy   | one or more conditions | QANOV-313377 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @qa @regression
  Scenario Outline: A <product> user can't see a module configured with a composition of audiences where none of them belongs to the user
    To be executed in QA
    Given the "Action Row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the action row configured in CMS has the "<audience>" audience defined
      And the audiences defined must meet <composition>
      And user has a "postpay" account type
      And user has "several" mobile lines
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "action_row_module" module is not displayed

    Examples:
          | product | audience                           | composition            | jira_id      |
          | blaude  | !postpay;mono-product;SHOW_BALANCE | all conditions         | QANOV-531555 |
          | o2de    | !postpay;mono-product;SHOW_BALANCE | one or more conditions | QANOV-531556 |

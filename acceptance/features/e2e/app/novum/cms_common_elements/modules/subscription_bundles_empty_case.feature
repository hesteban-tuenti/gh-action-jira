# -*- coding: utf-8 -*-
@jira.QANOV-419815
Feature: Subscription bundles empty case


  @jira.<jira_id> @<product> @<test_priority> @android @automatic @ios @jira.cv.<cv> @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.subscription_bundle_empty_case_<origin>_origin
  Scenario Outline: A <product> user can see the Subscription bundle empty case module configured for the <origin> origin with the mandatory fields
    To be executed in QA
    Given user does not have data bundles for "<origin>" origin
      And the "Subscription bundles with empty case" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Subscription bundles with empty case" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
     Then the "subscription_bundles_with_empty_case.module_title" textfield with "Gebuchtes highspeed-Datenvolumen" text is displayed
      And the "subscription_bundles_with_empty_case.empty_case_icon" icon is displayed
      And the "subscription_bundles_with_empty_case.empty_case_title" textfield with "[CONTEXT:subscription_bundles_with_empty_case.emptyStateCardTitle]" text is displayed
      And the "subscription_bundles_with_empty_case.empty_case_description" textfield is not displayed

    Examples:
          | product | origin | cv   | test_priority | jira_id      |
          | blaude  | EU     | 14.6 | smoke         | QANOV-419816 |
          | blaude  | home   | 14.6 | sanity        | QANOV-419817 |
          | blaude  | zone2  | 14.6 | smoke         | QANOV-419818 |
          | blaude  | zone3  | 14.6 | regression    | QANOV-419819 |
          | blaude  | zone4  | 14.6 | regression    | QANOV-419820 |
          | blaude  | zone5  | 14.6 | regression    | QANOV-419821 |
          | o2de    | EU     | 24.0 | smoke         | QANOV-419822 |
          | o2de    | home   | 24.0 | sanity        | QANOV-419823 |
          | o2de    | zone2  | 24.0 | smoke         | QANOV-419824 |
          | o2de    | zone3  | 24.0 | regression    | QANOV-419825 |
          | o2de    | zone4  | 24.0 | regression    | QANOV-419826 |
          | o2de    | zone5  | 24.0 | regression    | QANOV-419827 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.subscription_bundle_empty_case_zone5_origin_with_description
  Scenario Outline: A user can see the Subscription bundle empty case module configured for an origin with a description
    To be executed in QA
    Given user does not have data bundles for "zone5" origin
      And the "Subscription bundles with empty case" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Subscription bundles with empty case" module configured in CMS has the "emptyStateCardDescription" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
     Then the "subscription_bundles_with_empty_case.module_title" textfield with "Gebuchtes highspeed-Datenvolumen" text is displayed
      And the "subscription_bundles_with_empty_case.empty_case_icon" icon is displayed
      And the "subscription_bundles_with_empty_case.empty_case_title" textfield with "[CONTEXT:subscription_bundles_with_empty_case.emptyStateCardTitle]" text is displayed
      And the "subscription_bundles_with_empty_case.empty_case_description" textfield with "[CONTEXT:subscription_bundles_with_empty_case.emptyStateCardDescription]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.6 | QANOV-419828 |
          | o2de    | 24.0 | QANOV-419829 |

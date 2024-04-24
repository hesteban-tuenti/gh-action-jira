# -*- coding: utf-8 -*-
@jira.QANOV-418471
Feature: Subscription bundles


  @jira.<jira_id> @<product> @<test_priority> @android @automatic @ios @jira.cv.<cv> @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.subscription_bundle_<origin>_origin
  Scenario Outline: A <product> user can see the Subscription bundle module configured for the <origin> origin
    To be executed in QA
    Given user has data bundles for "<origin>" origin
      And the "Subscription bundles" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
     Then the "subscription_bundle.module_title" textfield with "Gebuchtes highspeed-Datenvolumen" text is displayed
      And the "subscription_bundle.list" list is displayed

    Examples:
          | product | origin | cv   | test_priority | jira_id      |
          | blaude  | EU     | 14.6 | smoke         | QANOV-418472 |
          | blaude  | home   | 14.6 | sanity        | QANOV-418473 |
          | blaude  | zone2  | 14.6 | smoke         | QANOV-418474 |
          | blaude  | zone3  | 14.6 | regression    | QANOV-418475 |
          | blaude  | zone4  | 14.6 | regression    | QANOV-418476 |
          | blaude  | zone5  | 14.6 | regression    | QANOV-418477 |
          | o2de    | EU     | 24.0 | smoke         | QANOV-418478 |
          | o2de    | home   | 24.0 | sanity        | QANOV-418479 |
          | o2de    | zone2  | 24.0 | smoke         | QANOV-418480 |
          | o2de    | zone3  | 24.0 | regression    | QANOV-418481 |
          | o2de    | zone4  | 24.0 | regression    | QANOV-418482 |
          | o2de    | zone5  | 24.0 | regression    | QANOV-418483 |

  @jira.<jira_id> @<product> @regression @android @automatic @ios @jira.cv.<cv> @mobile @qa @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.subscription_bundle_all_origins
  Scenario Outline: A user can see the Subscription bundle module configured for several origins
    To be executed in QA
    Given user has data bundles for "any" origin
      And the "Subscription bundles" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching agreement
     Then the "subscription_bundle.module_title" textfield with "Gebuchtes highspeed-Datenvolumen" text is displayed
      And the "subscription_bundle.list" list is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.6 | QANOV-418484 |
          | o2de    | 24.0 | QANOV-418485 |

# -*- coding: utf-8 -*-
@jira.QANOV-129624
Feature: Onboarding entrypoints list


  @jira.<jira_id> @android @ios @jira.cv.<created_version> @jira.link.parent_test_plan.QANOV-127764
  @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  Scenario Outline: User with a Fusion or Pikolin plan order on track but not activated yet, will see the onboarding entrypoints list
    other_affected_versions="2021-39"
    Given user has a "telco postpay" account type
      And user has a "miMovistar" order on track
      And user has "<subscriptions>" active subscriptions
      And user has the "services-summary" module configured in CMS for "start" page
      And user has a "any_admin" role
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "onboarding_entrypoints" module is displayed

    @regression @manual
    Examples:
          | subscriptions | created_version | jira_id      |
          | 0             | 12.8            | QANOV-129625 |

    @smoke @ber @automatic @qa @webapp
    Examples:
          | subscriptions | created_version | jira_id      |
          | >0            | 12.7            | QANOV-129626 |

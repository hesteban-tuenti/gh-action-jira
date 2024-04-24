# -*- coding: utf-8 -*-
@jira.QANOV-106763
Feature: Ecosystem module

  Actions Before each Scenario:
    Given user has the "extras" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @<execution_mode> @<test_priority> @android @ios @jira.cv.12.5 @mobile @qa @vivobr @old_app
  Scenario Outline: A <account_type> user with Start tab will see the ecosystem module
    Pending to solve ACCOUNT-17986 to add the live and next tags to the beatrix test
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has apps included in the tariff
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "ecosystem" module is displayed
      And the "ecosystem.title" textfield with "MEUS APPS" text is displayed
      And each element in the "ecosystem.list" list has the "image" field
      And each element in the "ecosystem.list" list has the "name" field
      And the "ecosystem.link" link with "Gerenciar meus apps" text is displayed

    Examples:
          | account_type | test_priority | execution_mode | ber | jira_id      |
          | convergente  | smoke         | automatic      |     | QANOV-106764 |
          | multivivo    | regression    | automatic      |     | QANOV-106765 |

    @jira.link.detects.ACCOUNT-17986
    Examples:
          | account_type | test_priority | execution_mode | ber | jira_id      |
          | beatrix      | sanity        | automatic      | ber | QANOV-106766 |

  @jira.QANOV-106767 @android @automatic @ios @jira.cv.12.5 @mobile @qa @regression @vivobr @old_app
  Scenario: A user with Start tab without apps included in the tariff does not see the ecosystem module
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user does not have apps included in the tariff
      And user is in the "Start" page
     Then the "ecosystem" module is not displayed

  @jira.QANOV-106768 @android @automatic @ios @jira.cv.12.5 @mobile @qa @regression @vivobr @old_app
  Scenario: A legacy prepay/jeri prepay/jeri postpay user does not see the ecosystem module in Start tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user is in the "Start" page
     Then the "ecosystem" module is not displayed

  @jira.QANOV-184178 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user can not see the ecosystem module
    Given user has "several" plans
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
     Then the "ecosystem" module is not displayed

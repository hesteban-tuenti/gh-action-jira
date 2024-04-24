# -*- coding: utf-8 -*-
@jira.QANOV-97687
Feature: Explore module

  Actions Before each Scenario:
    Given user has the "explore" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @<execution_mode> @<test_priority> @android @ios @jira.cv.<cv> @mobile @qa @vivobr @old_app
  Scenario Outline: A user with <plans> plans will see a module with offers in Star tab
    Given user has a "<account_type>" account type
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "explore" module is displayed
      And the "explore.title" textfield with "OFERTAS SELECIONADAS" text is displayed
      And each element in the "explore.list" list has the "name" field
      And each element in the "explore.list" list has the "title" field
      And each element in the "explore.list" list has the "description" field
      And each element in the "explore.list" list has the "image" field
      And the "explore.link" link with "Acessar todas as ofertas" text is displayed

    Examples:
          | account_type  | plans | test_priority | execution_mode | ber | cv   | jira_id      |
          | convergente   | 1     | smoke         | automatic      |     | 12.5 | QANOV-97688  |
          | multivivo     | 1     | regression    | automatic      |     | 12.5 | QANOV-97689  |
          | legacy prepay | 1     | regression    | automatic      | ber | 12.5 | QANOV-97691  |
          | jeri prepay   | 1     | regression    | manual         |     | 13.8 | QANOV-274602 |
          | jeri control  | 1     | regression    | manual         |     | 14.2 | QANOV-313091 |
          | control_n     | 1     | regression    | manual         |     | 14.2 | QANOV-313092 |

    @live @next
    Examples:
          | account_type | plans   | test_priority | execution_mode | ber | cv   | jira_id      |
          | beatrix      | 1       | sanity        | automatic      | ber | 12.5 | QANOV-97690  |
          | any          | several | smoke         | automatic      | ber | 13.6 | QANOV-153080 |

  @jira.<jira_id> @<execution_mode> @android @ios @jira.cv.<cv> @live @mobile @next @qa @regression @vivobr @old_app
  Scenario Outline: A user with <plans> plans can access to Explore page from the Explore fragment in Start tab
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "explore.link" link
     Then the "Explore" page is displayed

    Examples:
          | plans   | cv   | execution_mode | account_types                                                                  | jira_id      |
          | 1       | 12.5 | automatic      | convergente;multivivo;beatrix;legacy prepay;jeri prepay;control_n;jeri control | QANOV-111590 |
          | several | 13.6 | manual         | any                                                                            | QANOV-153081 |

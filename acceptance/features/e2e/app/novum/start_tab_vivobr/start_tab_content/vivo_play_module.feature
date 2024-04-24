# -*- coding: utf-8 -*-
@jira.QANOV-142013
Feature: Vivo play module

  Actions Before each Scenario:
    Given user has the "explore-vivo-play" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @<execution_mode> @<test_priority> @android @ios @jira.cv.<cv> @mobile @qa @vivobr @old_app
  Scenario Outline: A user with <plans> plans will see the Vivo play module in Start tab
    other_affected_versions="2021-39-B"
    Given user has a "<account_type>" account type
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
     Then the "vivo_play" module is displayed
      And the "vivo_play.title" textfield with "BILHETERIA EM CASA" text is displayed
      And each element in the "vivo_play.list" list has the "image" field
      And each element in the "vivo_play.list" list has the "category" field
      And each element in the "vivo_play.list" list has the "name" field
      And each element in the "vivo_play.list" list has the "rent" field with "Alugar" text
      And each element in the "vivo_play.list" list has the "price" field
      And the "vivo_play.link" link with "Conhecer mais opções" text is displayed

    Examples:
          | account_type  | plans   | test_priority | ber | cv   | execution_mode | jira_id      |
          | convergente   | 1       | regression    |     | 12.5 | automatic      | QANOV-142014 |
          | multivivo     | 1       | smoke         |     | 12.5 | automatic      | QANOV-142015 |
          | legacy prepay | 1       | regression    | ber | 12.5 | automatic      | QANOV-142016 |
          | jeri prepay   | 1       | regression    |     | 13.8 | manual         | QANOV-274612 |
          | jeri control  | 1       | regression    |     | 14.0 | manual         | QANOV-313101 |
          | jeri postpay  | 1       | regression    |     | 14.0 | manual         | QANOV-313102 |
          | any           | several | smoke         |     | 13.6 | manual         | QANOV-153133 |

    @live @next
    Examples:
          | account_type | plans | test_priority | ber | cv   | execution_mode | jira_id      |
          | beatrix      | 1     | smoke         | ber | 12.5 | automatic      | QANOV-142017 |

  @jira.QANOV-142018 @android @ios @jira.cv.<cv> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with <plans> plans can access to see a film details in Start tab
    other_affected_versions="2021-39-B"
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
     When clicks on the "any" element in the "vivo_play.list" list
     Then the internal webview with "Vivo Play" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Explore" page is displayed

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-142018 |
          | several | 13.6 | any                                                                            | QANOV-142018 |

  @jira.QANOV-142019 @android @ios @jira.cv.<cv> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with <plans> plans can access Explore from Vivo play link in Start tab
    other_affected_versions="2021-39-B"
    Given user has any "<account_types>" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
     When clicks on the "vivo_play.link" entrypoint
     Then the "Explore" page is displayed

    Examples:
          | plans   | cv   | account_types                                                                  | jira_id      |
          | 1       | 12.5 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | QANOV-142019 |
          | several | 13.6 | any                                                                            | QANOV-142019 |

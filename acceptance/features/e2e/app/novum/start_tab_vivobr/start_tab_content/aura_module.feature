# -*- coding: utf-8 -*-
@jira.QANOV-98408
Feature: Aura module

  Actions Before each Scenario:
    Given user has the "aura" module configured in CMS for "start" page


  @jira.<jira_id> @<execution_mode> @<test_priority> @android @ios @jira.cv.<cv> @mobile @qa @vivobr @old_app
  Scenario Outline: A user with <plans> plans will see the Aura module in Start tab
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "aura" module is displayed
      And the "aura.icon" icon is displayed
      And the "aura.text" textfield with "Você tem alguma dúvida?" text is displayed
      And the "aura.button" button with "Fale com a Aura" text is displayed

    Examples:
          | account_type  | plans | test_priority | execution_mode | cv   | jira_id      |
          | convergente   | 1     | regression    | automatic      | 12.5 | QANOV-98409  |
          | multivivo     | 1     | regression    | automatic      | 12.5 | QANOV-98410  |
          | legacy prepay | 1     | smoke         | automatic      | 12.5 | QANOV-98411  |
          | jeri prepay   | 1     | regression    | manual         | 13.8 | QANOV-274598 |
          | jeri control  | 1     | regression    | manual         | 14.0 | QANOV-319308 |
          | control_n     | 1     | regression    | manual         | 14.0 | QANOV-319309 |

    @live @next
    Examples:
          | account_type | plans   | test_priority | execution_mode | cv   | jira_id      |
          | beatrix      | 1       | sanity        | automatic      | 12.5 | QANOV-98412  |
          | any          | several | smoke         | automatic      | 13.6 | QANOV-153059 |

  @jira.<jira_id> @<execution_mode> @<os> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-236429 @live @mobile @next
  @smoke @vivobr @old_app
  Scenario Outline: A user with <plans> plans can access to Aura from "Aura" module in Start Tab in <os> devices
    Given user has any "<account_types>" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "aura.button" button
     Then the "Aura Chat" page is displayed
      And the "Aura" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Start" page is displayed

    Examples:
          | os      | plans   | execution_mode | cv   | account_types                                                                  | button       | jira_id      |
          | android | 1       | automatic      | 13.6 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | back_button  | QANOV-98413  |
          | android | several | automatic      | 13.6 | any                                                                            | back_button  | QANOV-153060 |
          | ios     | 1       | automatic      | 13.6 | convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control | close_button | QANOV-268593 |
          | ios     | several | automatic      | 13.6 | any                                                                            | close_button | QANOV-268594 |

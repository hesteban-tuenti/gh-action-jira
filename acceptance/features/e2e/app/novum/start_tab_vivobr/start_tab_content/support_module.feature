# -*- coding: utf-8 -*-
@jira.QANOV-284671
Feature: Support module

  Actions Before each Scenario:
    Given user has the "carrossel-atendimento-seguranca-platinum-v" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.13.9 @live @mobile @next @qa @vivobr @old_app
  Scenario Outline: A user with Start tab will see the support module
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "support_module" module is displayed
      And the "support_module.title" textfield with "ATENDIMENTO" text is displayed
      And the "support_module.carousel" carousel is displayed
      And each element in the "support_module.carousel" carousel has the "icon" field
      And each element in the "support_module.carousel" carousel has the "name" field

    Examples:
          | plans   | test_priority | ber | jira_id      |
          | 1       | smoke         | ber | QANOV-284672 |
          | several | regression    |     | QANOV-284673 |

  @jira.<jira_id> @<os> @automatic @ber @jira.cv.13.9 @jira.link.parent_test_plan.QANOV-236429 @live @mobile @next @smoke
  @vivobr @old_app
  Scenario Outline: A user can access to the Aura Chat from the support module in Start Tab in <os> devices
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has a "any" plan in "active" status
      And user has any "purpura;silver;gold" segmentation
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the card with "Aura" text on the "name" of the "support_module.carousel" carousel
     Then the "Aura Chat" page is displayed
      And the "Aura" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Start" page is displayed

    Examples:
          | os      | button       | jira_id      |
          | android | back_button  | QANOV-284674 |
          | ios     | close_button | QANOV-284675 |

  @jira.<jira_id> @<os> @automatic @ber @jira.cv.13.9 @jira.link.parent_test_plan.QANOV-236429 @live @mobile @next @smoke
  @vivobr @old_app
  Scenario Outline: A user can access to the Chat from the support module in Start Tab in <os> devices
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has a "any" plan in "active" status
      And user does not have any "purpura;silver;gold" segmentation
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the card with "Chat" text on the "name" of the "support_module.carousel" carousel
     Then the "Aura Chat" page is displayed
      And the "Chat" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Start" page is displayed

    Examples:
          | os      | button       | jira_id      |
          | android | back_button  | QANOV-287402 |
          | ios     | close_button | QANOV-287403 |

  @jira.QANOV-284676 @android @automatic @ios @jira.cv.13.9 @live @mobile @next @smoke @vivobr @old_app
  Scenario: A monoplan user with Start tab can access to the Tech support webview from support module
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the card with "Suporte Técnico" text on the "name" of the "support_module.carousel" carousel
     Then the internal webview with "(Verificando conexão|Suporte Técnico)" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-284677 @android @automatic @ber @ios @jira.cv.13.9 @live @mobile @next @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab can access to disambiguation screen for the Tech support webview from the support module
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the card with "Suporte Técnico" text on the "name" of the "support_module.carousel" carousel
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "product_customer_type" field
      And each element in the "plans" list has the "plan_name" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-284678 @android @automatic @ber @ios @jira.cv.12.5 @live @mobile @next @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab can access to the Tech support webview from the Disambiguation screen
    Depending if the plan selected in the disambiguation screen has mobile line or no, a diferent webview is opened, so two titles are checked
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the card with "Suporte Técnico" text on the "name" of the "support_module.carousel" carousel
      And the "Plan Disambiguation" page is displayed
      And clicks on the "any" element in the "plans" list
     Then the internal webview with the "(Verificando conexão|Suporte Técnico)" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-525525
Feature: Access to Assinaturas Errors


  @jira.QANOV-525526 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user will see error card when there is a consumptions API error
    Given user has any "beatrix;control_n;jeri control;convergente;multivivo;prepay" account types
      And there is a consumptions API error
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.mobile_allowances" section is displayed
      And the "plans.mobile_allowances.subtitle" textfield with "Não foi possível exibir o consumo. Você pode tentar de novo mais tarde" text is displayed

  @jira.QANOV-525527 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Convergente user will see error card when there is a fixo information API error
    Given user has a "convergente" account type
      And there is a fixo information API error
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.products_list" list is displayed
      And any element in the "plans.products_list" list has the "info" textfield with the "Não foi possível exibir a informação. Você pode tentar de novo mais tarde" text

  @jira.QANOV-525528 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user will not see principal_sva section when there is a main SVA API error
    Given there is a main SVA API error
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "plans.principal_sva" section is not displayed

  @jira.QANOV-525529 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user will not see travel card when there is a travel API error
    Given user has any "convergente;multivivo;jeri postpay;legacy postpay;beatrix postpay" account types
      And there is a travel API error
      And user is in the "Assinatura" page
     Then the "travel" card is not displayed

  @jira.QANOV-525530 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user will see error message when there is a balance API error
    Given user has any "legacy prepay;jeri prepay" account types
      And there is a balance API error
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.vivinho" icon is displayed
      And the "plans.title" textfield is displayed
      And the "plans.meatball_menu" button is displayed
      And the "balance_module.amount_textfield" textfield with "Erro ao exibir saldo" text is displayed
      And the "balance_module.topup_button" link with "Fazer recarga" text is displayed

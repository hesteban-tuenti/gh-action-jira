# -*- coding: utf-8 -*-
@jira.QANOV-525511
Feature: Plan details Errors


  @jira.QANOV-525512 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User will see error card when there is a consumptions API error
    Given user has any "beatrix;control_n;jeri control;convergente;multivivo;prepay" account types
      And there is a consumptions API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "error_module" module is displayed
      And the "error_module.exclamation_icon" icon is displayed
      And the "error_module.title" textfield with "Algo deu errado por aqui" text is displayed
      And the "error_module.subtitle" textfield with "Não foi possível exibir o consumo. Você pode tentar de novo mais tarde" text is displayed
      And the "quick_actions" carousel is displayed

  @jira.QANOV-525513 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Multivivo user will not see data information when there is a consumptions API error
    Given user has any "convergente;multivivo" account types
      And user has "several" mobile lines in plan
      And there is a consumptions API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "plan.lines_module" module is displayed
      And the "plan.information" textfield is not displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario Outline: convergente user will see error card when there is a <product> information API error
    Given user has a "convergente" account type
      And user has a "<product>" product
      And there is a "<product>" information API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "error_module" module is displayed
      And the "error_module.exclamation_icon" icon is displayed
      And the "error_module.title" textfield with "Algo deu errado por aqui" text is displayed
      And the "error_module.subtitle" textfield with "<subtitle>" text is displayed
      And the "quick_actions" carousel is displayed

    Examples:
          | product  | subtitle                                                                       | jira_id      |
          | internet | Erro ao exibir informações do \d+. Você pode tentar de novo mais tarde         | QANOV-525514 |
          | tv       | Erro ao exibir os canais inclusos no \d+. Você pode tentar de novo mais tarde  | QANOV-525515 |

  @jira.QANOV-525516 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: convergente user will not see landline card when there is a landline information API error
    Given user has a "convergente" account type
      And user has a "landline" product
      And there is a landline information API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "plan.landline" module is not displayed

  @jira.QANOV-525517 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User with less than 1GB will not see commercial module when there is a commercial API error
    Given user has a "mobile_line" product
      And user has "<=1" GB of the "data" allowance in the "mobile_line" product
      And there is a commercial API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "commercial_module" module is not displayed

  @jira.QANOV-525518 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User will not see about plan module in plan details page when there is an assinaturas information API error
    Given there is an assinaturas information API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "about_plan" module is not displayed

  @jira.QANOV-525519 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User will not see main SVA activation module in plan details page when there is a main SVA activation API error
    Given user has "principal" apps included in the tariff in "pending" status
      And there is a main SVA activation API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "principal_sva_activation" module is not displayed

  @jira.QANOV-525520 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User will not see main SVA module in plan details page when there is a main SVA API error
    Given user has "principal" apps included in the tariff in "active" status
      And there is a main SVA API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "principal_sva" module is not displayed

  @jira.QANOV-525521 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user will see error message when there is a balance API error
    Given user has any "legacy prepay;jeri prepay" account types
      And there is a balance API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "error_module" module is displayed
      And the "error_module.exclamation_icon" icon is displayed
      And the "error_module.title" textfield with "Algo deu errado por aqui" text is displayed
      And the "error_module.subtitle" textfield with "Não foi possível exibir o saldo de recarga. Você pode tentar de novo mais tarde" text is displayed
      And the "plans.balance.topup_button" link is displayed
      And the "plans.balance.extrato" link is displayed

  @jira.QANOV-525522 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user will not see travel card when there is a travel API error
    Given there is a travel API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "travel" card is not displayed

  @jira.QANOV-525523 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User will not see sva_included module in plan details page when there is a SVA included API error
    Given user has "any" apps included in the tariff
      And there is a SVA included API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "sva_included" module is not displayed

  @jira.QANOV-525524 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-423279 @manual @mobile @regression
  @vivobr
  Scenario: User will see services_list module in plan details page when there is a any API error
    Given there is any API error
      And user is in the "Assinatura" page
     When clicks on the "plans" card with api error
     Then the "Plan Details" page is displayed
      And the "services_list" module is displayed

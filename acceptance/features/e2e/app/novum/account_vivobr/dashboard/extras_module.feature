# -*- coding: utf-8 -*-
@jira.QANOV-377331
Feature: Extras module


  @jira.QANOV-377332 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: User with principal sva will see the principal sva in the plans card in Assinatura tab
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.principal_sva" section is displayed
      And the "plans.principal_sva.icon" icon is displayed
      And the "plans.principal_sva.name" textfield is displayed
      And the "plans.principal_sva.button" link is displayed

  @jira.QANOV-377334 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User without principal sva will not see the principal sva in the plans card in Assinatura tab
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user does not have "principal" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.principal_sva" section is not displayed

  @jira.QANOV-377335 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User will not see the sva module in Assinatura tab
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user does not have "any" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "sva_included" module is not displayed

  @jira.QANOV-377336 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User will see the sva module in Assinatura tab
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "any" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "sva_included" module is displayed

  @jira.QANOV-377337 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User will see the extra sva not included in the tariff module in Assinatura tab
    In this module user will see apps that are not included in the tariff
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "sva_not_included" module is displayed

  @jira.QANOV-377338 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario: User with principal sva can access to "Extras Details" screen
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans.principal_sva_button" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed

  @jira.QANOV-377339 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile
  @smoke @vivobr
  Scenario: User can access to "Extras Details" screen from sva not included module
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "sva_not_included" module
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed

  @jira.QANOV-450773 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User with principal sva in pending status will see the principal sva module to activate in Plan details page
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff in "pending" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "principal_sva_activation" module is displayed
      And the "principal_sva_activation.title" textfield with "O app \w+ não está ativo" text is displayed
      And the "principal_sva_activation.close" button is displayed
      And the "principal_sva_activation.link" link with "Ativar app" text is displayed

  @jira.QANOV-450774 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: User with principal sva in pending status will see activation screen
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff in "pending" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "principal_sva_activation.link" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-450775 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User with principal sva in pending status can close the module
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff in "pending" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "principal_sva_activation.close" button
     Then the "principal_sva_activation" module is not displayed

  @jira.QANOV-450776 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User with principal sva in active status cannot see the principal_sva_activation module
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "principal_sva_activation" module is not displayed

  @jira.QANOV-450777 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User without principal sva cannot see the principal_sva_activation module
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user does not have "principal" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "principal_sva_activation" module is not displayed

  @jira.QANOV-450778 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @sanity
  @vivobr
  Scenario: User without apps inlcuded in the tariff will not see the sva module in Plan details page
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user does not have "any" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "sva_included" module is not displayed

  @jira.QANOV-450779 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @sanity
  @vivobr
  Scenario: User with any app included in the tariff will see the sva module in Plan details page
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "any" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "sva_included" module is displayed

  @jira.QANOV-377332 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: User with principal sva will see the principal sva in the plans card in Plan details page
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "principal_sva" module is displayed
      And the "principal_sva.icon" icon is displayed
      And the "principal_sva.name" textfield is displayed
      And the "principal_sva.text" textfield with "Incluso na sua assinatura" text is displayed

  @jira.QANOV-377334 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User without principal sva will not see the principal sva in the plans card in Plan detail screen
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user does not have "principal" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "principal_sva" module is not displayed

  @jira.QANOV-519429 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario: User with principal sva can access to principal sva details
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "principal" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "principal_sva" card
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-377338 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario: User with any sva can access to "Extras Details" screen in Plan details screen
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "any" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "any" element in the "sva_included" list
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

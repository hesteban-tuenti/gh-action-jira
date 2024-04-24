# -*- coding: utf-8 -*-
@jira.QANOV-2405
Feature: Balance module


  @jira.QANOV-133804 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-272041 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A prepay user without balance and active status will see the balance module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "0" balance
      And user has balance in "active" status
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "balance_module" module is displayed
      And the "balance_module.status_icon" textfield with "Saldo disponível" text is displayed
      And the "balance_module.title_textfield" textfield with "Recarregue pra navegar" text is displayed
      And the "balance_module.amount_textfield" textfield with "R\$ 0,00" text is displayed
      And the "balance_module.topup_button" link with "Fazer recarga" text is displayed
      And the "balance_module.more_link" link with "Ver extrato" text is displayed

  @jira.QANOV-133805 @android @ber @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-272041 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: A prepay user with balance and active status will see the balance module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a ">0" balance
      And user has balance in "active" status
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "balance_module" module is displayed
      And the "balance_module.status_icon" textfield with "Saldo disponível" text is displayed
      And the "balance_module.subtitle_textfield" textfield with "Válido até \d\d/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)" text is displayed
      And the "balance_module.amount_textfield" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "balance_module.topup_button" link with "Fazer recarga" text is displayed
      And the "balance_module.more_link" link with "Ver extrato" text is displayed

  @jira.QANOV-214335 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-272041 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: A prepay user with balance and blocked status will see the balance module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a ">0" balance
      And user has balance in "blocked" status
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "balance_module" module is displayed
      And the "balance_module.status_icon" textfield with "Saldo bloqueado" text is displayed
      And the "balance_module.subtitle_textfield" textfield with "Faça uma recarga pra usar nossos serviços" text is displayed
      And the "balance_module.amount_textfield" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "balance_module.topup_button" link with "Fazer recarga" text is displayed
      And the "balance_module.more_link" link with "Ver extrato" text is displayed

  @jira.QANOV-133806 @android @ber @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-272041 @manual @mobile @smoke
  @vivobr @old_app
  Scenario: Prepay user can access to the balance details screen
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "balance_module.topup_button" link
     Then the internal webview is displayed
      And the "Faça uma recarga" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-272643 @android @ber @ios @jira. @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-272041 @manual @mobile
  @smoke @vivobr @old_app
  Scenario: Prepay user can access to the Extrato screen
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "balance_module.more_link" link
     Then the internal webview is displayed
      And the "Extrato" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-377272 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: Prepay user will see the balance section in the plans card in Assinatura tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "plans" card is displayed
      And the "plans.balance" section is displayed
      And the "plans.balance.amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d de saldo" text is displayed
      And the "plans.balance.topup_button" link with "Fazer recarga" text is displayed

  @jira.QANOV-453397 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: Prepay user with balance in blocked status will see the balance module in the plans details page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has balance in "blocked" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "balance" module is displayed
      And the "balance.tag" textfield with "Saldo bloqueado" text is displayed
      And the "balance.amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "balance.info" textfield with "Recarregue para desbloquear" text is displayed
      And the "plans.balance.topup_button" link is displayed
      And the "plans.balance.extrato" link is displayed

  @jira.QANOV-453398 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: Prepay user with enought balance to renew will see the balance module in the plans details page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has promotion in "active" status
      And user has balance in "active" status
      And user has enought balace to renew plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "balance" module is displayed
      And the "balance.tag" textfield with "Suficiente para promoção" text is displayed
      And the "balance.amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "balance.date" textfield with "Válido até \d\d/\d\d" text is displayed
      And the "balance.renew_date" textfield with "Renova em \d\d/\d\d/\d\d\d\d, se houver saldo" text is displayed
      And the "plans.balance.topup_button" link is displayed
      And the "plans.balance.extrato" link is displayed

  @jira.QANOV-453399 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: Prepay user without enought balance to renew will see the balance module in the plans details page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has promotion in "active" status
      And user has balance in "active" status
      And user does not have enought balace to renew plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "balance" module is displayed
      And the "balance.tag" textfield with "Insuficiente para promoção" text is displayed
      And the "balance.amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "balance.date" textfield with "Válido até \d\d/\d\d" text is displayed
      And the "balance.renew_date" textfield with "Renova em \d\d/\d\d/\d\d\d\d, se houver saldo" text is displayed
      And the "plans.balance.topup_button" link is displayed
      And the "plans.balance.extrato" link is displayed

  @jira.QANOV-453400 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: Prepay user with promo deactivated will see the balance module in the plans details page
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has promotion in "deactive" status
      And user has balance in "active" status
      And user does not have enought balace to renew plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "balance" module is displayed
      And the "balance.tag" textfield with "Insuficiente para renovação" text is displayed
      And the "balance.amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "balance.date" textfield with "Válido até \d\d/\d\d" text is displayed
      And the "balance.info" textfield with "Recarregue para renovar sua promoção" text is displayed
      And the "plans.balance.topup_button" link is displayed
      And the "plans.balance.extrato" link is displayed

  @jira.<jira_id> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario Outline: User can access to <balance_button> screen from plan details screen
    Given user has any "legacy prepay;jeri prepay" account types
      And user has a "any" balance
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "<balance_button>" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

    Examples:
          | balance_button | ber | jira_id      |
          | topup_button   | ber | QANOV-453401 |
          | extrato        |     | QANOV-453402 |

# -*- coding: utf-8 -*-
@jira.QANOV-477237
Feature: Access to Recurrent Payment - Novo App


  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario Outline: A no legacy user with automatic payment <recurrent_payment_status> and automatic debit <automatic_debit_status> can see the status of automatic payment in the Bills Details page
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
     Then the "Bills Details" page is displayed
      And the "recurrent_payment_entrypoint" textfield with "Pagamento automático" text is displayed
      And the "recurrent_payment_description" textfield with the "<status_text>" format is displayed

    Examples:
          | recurrent_payment_status | automatic_debit_status | status_text                       | jira_id      |
          | deactivated              | deactivated            | Ative pra evitar multas e atrasos | QANOV-477238 |
          | deactivated              | activated              | Debito automático no Itaú         | QANOV-477239 |

  @jira.QANOV-477240 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with automatic payment configured and automatic debit deactivated can see the status of automatic payment in the Bills Details page
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
     Then the "Bills Details" page is displayed
      And the "recurrent_payment_entrypoint" textfield with "Pagamento automático" text is displayed
      And the "recurrent_payment_description" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed

  @jira.QANOV-477241 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user without credit cards saved and recurrent payment in disabled status accesses to the add new card screen to activate it
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
     Then the "Add New Card" page is displayed
      And the "main_title" textfield with "Agora é hora de inserir os dados do seu cartão de crédito" text is displayed
      And the "subtitle" textfield with "Para ativar o pagamento automático, você precisa adicionar um cartão" text is displayed
      And the "card_number" module is displayed
      And the "card_number.label" textfield with "Número do cartão" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date.label" textfield with "Validade" text is displayed
      And the "expiration_date.input" inputtext is displayed
      And the "cvv.label" textfield with "CVC" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" icon is displayed
      And the "terms_link" textfield with "Ao confirmar, você aceita nossos termos e condições" text is displayed
      And the "enable" button with "Ativar pagamento automático" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477242 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with <3 credit cards saved and recurrent payment in disabled status accesses to the credit card selection screen to activate it
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Em qual cartão você quer ativar o pagamento automático?" text is displayed
      And the "subtitle" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has ">1" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the element in "0" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477243 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with 3 credit cards saved and recurrent payment in disabled status accesses to the credit card selection screen to activate it
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "3" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Em qual cartão você quer ativar o pagamento automático?" text is displayed
      And the "subtitle" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And each element in the "payment_methods_list" list has the "payment_description" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And no element in the "payment_methods_list" list has the value "Novo cartão de crédito" in the "payment_description" field
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477244 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with automatic debit enabled can manage it with a OB webview
    Only recurrent payment (with credit card) belongs to Novum. Automatic debit (bank account) belongs to OB
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
     Then the internal webview is displayed

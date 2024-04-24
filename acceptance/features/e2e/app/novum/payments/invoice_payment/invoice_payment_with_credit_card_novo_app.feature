# -*- coding: utf-8 -*-
@jira.QANOV-454003
Feature: Invoice Payment with Credit Card - Novo App


  @jira.QANOV-454004 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user without saved cards who wants to pay several bills sees the "Add New Card" scren after selecting bills
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
     Then the "Add New Card" page is displayed
      And the "main_title" textfield with "Agora é hora de inserir os dados do seu cartão de crédito" text is displayed
      And the "total_amount" textfield with the "Valor das faturas: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_number" module is displayed
      And the "card_number.label" textfield with "Número do cartão" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date.label" textfield with "Validade" text is displayed
      And the "expiration_date.input" inputtext is displayed
      And the "cvv.label" textfield with "CVC" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" icon is displayed
      And the "pay" button with "Adicionar cartão" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454005 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with saved cards who can see the "Add New Card" screen after selecting bills
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
     Then the "Add New Card" page is displayed
      And the "main_title" textfield with "Agora é hora de inserir os dados do seu cartão de crédito" text is displayed
      And the "total_amount" textfield with the "Valor das faturas: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_number" module is displayed
      And the "card_number.label" textfield with "Número do cartão" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date.label" textfield with "Validade" text is displayed
      And the "expiration_date.input" inputtext is displayed
      And the "cvv.label" textfield with "CVC" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" icon is displayed
      And the "pay" button with "Adicionar cartão" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454007 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with saved cards who wants to pay several bills sees the "Choose Payment Methods" screen with only credit cards
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">1" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the element in "0" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-454008 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user can see the cvv info in the "Add New Card" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Add New Card" page is displayed
      And clicks on the "cvv.info" button
     Then the "cvc_info_popover" element is on display
      And the "cvc_info_popover.text" textfield with "Código de Verificação do Cartão (CVC) de 3 ou 4 dígitos que está no verso do cartão" text is displayed
      And the "cvc_info_popover.close" icon is displayed

  @jira.QANOV-454009 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454008
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user can close the cvv info in the "Add New Card" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Add New Card" page is displayed
      And clicks on the "cvv.info" button
      And clicks on the "cvc_info_popover.close" icon
     Then the "cvc_info_popover" element is not on display

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario Outline: A no legacy user introduces invalid data in the "Add New Card" page
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Add New Card" page is displayed
      And fills the "<field_1>.input" inputtext with the "<value>" text
      And clicks on the "<field_2>.input" inputtext
     Then the "<field_1>.error_message" textfield with "<feedback>" text is displayed

    Examples:
          | field_1         | value | field_2         | feedback                                | jira_id      |
          | card_number     | 12345 | cvv             | Número não encontrado. Dê uma conferida | QANOV-454010 |
          | expiration_date | 0122  | card_number     | Validade incorreta. Dê uma conferida    | QANOV-454011 |
          | cvv             | 12    | expiration_date | Dê uma conferida                        | QANOV-454012 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario Outline: A no legacy user clicks on pay button in the "Add New Card" page with not all fields filled
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Add New Card" page is displayed
      And fills the "<field1>.input" inputtext with the "<value1>" text
      And fills the "<field2>.input" inputtext with the "<value2>" text
      And clicks on the "save" button
      And waits until the "<field3>.error_message" element is visible
     Then the "<field3>.error_message" textfield with "<feedback>" text is displayed

    Examples:
          | field1          | value1           | field2          | value2 | field3          | feedback                                | jira_id      |
          | card_number     | 5410080000000005 | expiration_date | 1224   | cvv             | Dê uma conferida                        | QANOV-454013 |
          | expiration_date | 1224             | cvv             | 123    | card_number     | Número não encontrado. Dê uma conferida | QANOV-454014 |
          | card_number     | 5410080000000005 | cvv             | 123    | expiration_date | Validade incorreta. Dê uma conferida    | QANOV-454015 |

  @jira.QANOV-454016 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with one bill and without credit cards saved sees the "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-454017 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with one bill and with some valid credit cards saved sees the "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the element in "2" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454018 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and with 3 valid credit cards saved sees the "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has "5" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the element in "2" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And the element in "3" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And the element in "4" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And each element in the "payment_methods_list" list does not have the "add_new_card" field
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario Outline: A no legacy user with one bill and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> cannot select the card used for automatic payment
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has ">0" expired cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the element in "2" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_message" button with the "Pagamento recorrente ativo" text
      And the element with "Pagamento recorrente ativo" text in the "payment_message" button in the "payment_methods_list" list is disabled
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | priority   | jira_id      |
          | activated              | deactivated              | regression | QANOV-454019 |
          | deactivated            | activated                | smoke      | QANOV-454020 |
          | activated              | activated                | regression | QANOV-454021 |

  @jira.QANOV-454022 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and with some valid and expired credit cards saved sees the "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has ">0" expired cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the element in "2" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_message" button with the "Cartão de crédito expirado" text
      And the element with "Cartão de crédito expirado" text in the "payment_message" button in the "payment_methods_list" list is disabled
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-454023 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with several bills and with some valid credit cards saved sees the "Choose Payment Method" screen without pix and código de barras options
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the element in "0" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-454024 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user can access to "Choose Payment Method PMA" screen from "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "payment_methods_link" link
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And any element in the "available_cards_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Choose Payment Method" page is displayed

  @jira.QANOV-454025 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with one bill and with some valid credit cards saved sees the summary screen before the payment
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
     Then the "Payment Summary" page is displayed
      And the "main_title" textfield with "Quase lá! Só falta confirmar suas informações para finalizar" text is displayed
      And the "summary_label" textfield with "Pagar" text is displayed
      And the "summary_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "amount_label" textfield with the "Valor total" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "pagamento_automatico_box.title" textfield with "Quer ativar o pagamento automático?" text is displayed
      And the "pagamento_automatico_box.subtitle" textfield with "Ative para evitar multas e atrasos" text is displayed
      And the "pagamento_automatico_box.checkbox" element is displayed
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
      And the "terms_link" textfield with "Ao confirmar, você aceita nossos termos e condições" text is displayed
      And the "pay" button with "Confirmar pagamento" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-550604 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with one bill, with some valid credit cards saved and recurrent payment active don't see the "activate recurrent payment" checkbox before the payment
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
     Then the "Payment Summary" page is displayed
      And the "pagamento_automatico_box" element is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454026 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with several bills and with some valid credit cards saved sees the summary screen before the payment
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
     Then the "Payment Summary" page is displayed
      And the "main_title" textfield with "Quase lá! Só falta confirmar suas informações para finalizar" text is displayed
      And the "summary_label" textfield with "Pagar" text is displayed
      And the "summary_number" textfield with "2 faturas" text is displayed
      And the "amount_label" textfield with the "Valor total" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "pagamento_automatico_box.title" textfield with "Quer ativar o pagamento automático?" text is displayed
      And the "pagamento_automatico_box.subtitle" textfield with "Ative para evitar multas e atrasos" text is displayed
      And the "pagamento_automatico_box.checkbox" element is displayed
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
      And the "terms_link" textfield with "Ao confirmar, você aceita nossos termos e condições" text is displayed
      And the "pay" button with "Confirmar pagamento" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454027 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454025 @jira.link.depends_on.QANOV-454026
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user can see terms and conditions through "Payment Summary" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "terms_link" button
     Then the internal webview is displayed
      And the "main_title" textfield with "TERMO DE USO - CONDIÇÕES DO PAGAMENTO PONTUAL DA FATURA VIVO COM CARTÃO DE CRÉDITO" text is displayed
      And the "pagar a fatura Vivo com cartão de crédito está disponível" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Payment Summary" page is displayed

  @jira.QANOV-454028 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454026
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with several bills and with some valid credit cards can see the list os bills to pay before the payment
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "summary_number" button
     Then the "Bill to Pay" page is displayed
      And the "main_title" textfield with "2 faturas" text is displayed
      And the "bills_to_pay_list" list is displayed
      And each element in the "bills_to_pay_list" list has the "due_date" textfield with the "(Vence|Venceu) em \d\d/\d\d" format
      And each element in the "bills_to_pay_list" list has the "bill_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format
      And each element in the "bills_to_pay_list" list has the "bill_amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Payment Summary" page is displayed

  @jira.QANOV-454029 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user with one bill and without credit cards can pay it and sees the feedback screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
     Then the "pay" button displays a spinner in it
      And the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "update_message" textfield with "Vamos atualizar suas faturas como pagas em até 48h" text is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And card with number "376674000000008" is saved in the payment methods area
      And the "navigation_top_bar.back_button" button is not visible in the actual screen
      And clicks on the "ok_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454030 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with one bill and with some valid credit cards saved can pay it and sees the feedback screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "update_message" textfield with "Vamos atualizar suas faturas como pagas em até 48h" text is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not visible in the actual screen
      And clicks on the "ok_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454031 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with several bills and without credit cards can pay it and sees the feedback screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_number" textfield with "2 faturas" text is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "update_message" textfield with "Vamos atualizar suas faturas como pagas em até 48h" text is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And card with number "376674000000008" is saved in the payment methods area
      And the "navigation_top_bar.back_button" button is not visible in the actual screen
      And clicks on the "ok_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-454032 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity
  @vivobr
  Scenario: A no legacy user with several bills and with some valid credit cards saved can pay it and sees the feedback screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_number" textfield with "2 faturas" text is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "update_message" textfield with "Vamos atualizar suas faturas como pagas em até 48h" text is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not visible in the actual screen
      And clicks on the "ok_button" button
      And the "Bills Central" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-453915
Feature: Access to Invoice Payment - Novo App

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-453916 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity
  @vivobr
  Scenario: A no legacy user with one bill sees the "Choose Payment Method" screen after selecting a bill to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-453917 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A blacklisted user with one bill can see Pix and Código de Barras as payment methods in the "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the "callout" module is displayed
      And the "callout.card_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.link" link with "Saber mais" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-453918 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453916
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user can see an informative screen about payment methods through "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "callout.link" link
     Then the internal webview is displayed
      And the "Rio de Janeiro - RJ" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Choose Payment Method" page is displayed

  @jira.QANOV-453919 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @automatic @mobile @sanity
  @vivobr @live @next @qa
  Scenario: A no legacy user with several bills sees an popup after clicking in the pay bill button in the "Bills Central" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
     Then the "Select More Bills Sheet" sheet is displayed
      And the "sheet_title" textfield with "Você tem mais faturas pra pagar" text is displayed
      And the "sheet_subtitle" textfield with "Com cartão de crédito, você pode pagar mais de uma fatura ao mesmo tempo" text is displayed
      And the "pay_current_bill" button with "Pagar somente esta fatura" text is displayed
      And the "select_more_bills" link with "Escolher faturas" text is displayed

  @jira.QANOV-453920 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @automatic @mobile @sanity
  @vivobr @live @next @qa
  Scenario: A no legacy user with several bills who wants to pay one bill sees the "Choose Payment Method" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "pay_current_bill" button
     Then the "Choose Payment Method Novo App" page is displayed
      And the "main_title" textfield with "Como quer pagar a sua fatura?" text is displayed
      And the "valor_title" textfield with the "Valor da fatura: R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "payment_methods_list" list has ">2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix Copia e Cola" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Copiar código de barras" text
      And the "callout" module is displayed
      And the "callout.info_icon" icon is displayed
      And the "callout.title" textfield with "Cartão Vivo Itaú" text is displayed
      And the "callout.description" textfield with "Pague com Vivo Itaú e receba até 10% de cashback na fatura do cartão" text is displayed
      And the "callout.single_action_link" link with "Saber mais" text is displayed
      And the "navigation_tab_bar.assinaturas_tab" button is not visible in the actual screen
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-453921 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity
  @vivobr
  Scenario: A no legacy user with several bills can see all bills in the "Bill Selection" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
     Then the "Bill Selection" page is displayed
      And the "main_title" textfield with "Quais faturas você quer incluir pra pagar?" text is displayed
      And the "list_title" textfield with "FATURAS" text is displayed
      And the "select_all_checkbox_label" textfield with "Selecionar todas" text is displayed
      And the "select_all_checkbox" checkbox is displayed
      And the "unpaid_bills_list" list is displayed
      And each element in the "unpaid_bills_list" list has the "due_date" textfield with the "(Vence|Venceu) em \d\d/\d\d" format
      And each element in the "unpaid_bills_list" list has the "bill_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format
      And each element in the "unpaid_bills_list" list has the "bill_amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format
      And each element in the "unpaid_bills_list" list has the "selected" field
      And the "callout" module is displayed
      And the "callout.title" textfield with "Sua faturas estão em dia?" text is displayed
      And the "callout.description" textfield with "Acesse a Central de faturas pra conferir" text is displayed
      And the "bill_selected" textfield with "0 fatura" text is displayed
      And the "total_amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "continue" button with "Continuar" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-453922 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with several bills sees the "Continue" button enabled when selects a bill
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And the "continue" button is disabled
      And clicks on any element in the "unpaid_bills_list" list with the "selected" field
     Then the "continue" button is enabled

  @jira.QANOV-453923 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with several bills who wants to pay several bills to pay can select all with one click in the "Bill Selection" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects the "select_all_checkbox" checkbox
     Then each element in the "unpaid_bills_list" list has the "selected" field checked

  @jira.QANOV-453924 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with several bills who has selected several bills to pay can unselect all with one click in the "Bill Selection" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" fields of "unpaid_bills_list" list
      And selects the "select_all_checkbox" checkbox
     Then each element in the "unpaid_bills_list" list has the "selected" field unchecked

  @jira.QANOV-453925 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with several bills and several plans who wants to pay several bills only sees the bills for the current plan in the "Bill Selection" screen
    Given user is not a "legacy;control_n;jeri" account type
      And user has "several" plans
      And has "several" bills in "unpaid" status for each plan
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
     Then the "Bill Selection" page is displayed
      And each element in the "unpaid_bills_list" belong to the current plan

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario Outline: A no legacy user with several bills sees the number of select bills updated in the "Bill Selection" screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "Select More Bills Sheet" sheet is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "<bills_selected>" elements of "unpaid_bills_list" list
     Then the "bill_selected" textfield with the "<bills_selected> <bill_label>" format is displayed

    Examples:
          | bills_selected | bill_label | jira_id      |
          | 1              | fatura     | QANOV-453926 |
          | 2              | faturas    | QANOV-453927 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile
  @vivobr
  Scenario Outline: A no legacy user with one bill and with some valid credit cards saved and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> sees an informative popup when trying to pay with saved card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
     Then the "automatic_payment_popup" popup is displayed
      And the "automatic_payment_popup.title" textfield with "O pagamento automático está ativo" text is displayed
      And the "automatic_payment_popup.message" textfield with "Ao continuar e pagar antes do vencimento da fatura, o pagamento pode ser duplicado. Caso isso ocorra, o valor duplicado será descontado na sua próxima fatura." text is displayed
      And the "automatic_payment_popup.accept" button with "Continuar" text is displayed
      And the "automatic_payment_popup.cancel" button with "Voltar" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | priority   | jira_id      |
          | activated              | deactivated              | smoke      | QANOV-453928 |
          | deactivated            | activated                | regression | QANOV-453929 |
          | activated              | activated                | regression | QANOV-453930 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and with some valid credit cards saved and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> accepts the popup when trying to pay with saved card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.accept" button
     Then the "Payment Summary" page is displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | depends_on   | jira_id      |
          | activated              | deactivated              | QANOV-453928 | QANOV-453931 |
          | deactivated            | activated                | QANOV-453929 | QANOV-453932 |
          | activated              | activated                | QANOV-453930 | QANOV-453933 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and with some valid credit cards saved and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> accepts the popup when trying to add a new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.accept" button
     Then the "Add New Card" page is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Choose Payment Method" page is displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | depends_on   | jira_id      |
          | activated              | deactivated              | QANOV-453928 | QANOV-453937 |
          | deactivated            | activated                | QANOV-453929 | QANOV-453938 |
          | activated              | activated                | QANOV-453930 | QANOV-453939 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile
  @vivobr
  Scenario Outline: A no legacy user with one bill and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> sees an informative popup when trying to pay with new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
     Then the "automatic_payment_popup" popup is displayed
      And the "automatic_payment_popup.title" textfield with "O pagamento automático está ativo" text is displayed
      And the "automatic_payment_popup.message" textfield with "Ao continuar e pagar antes do vencimento da fatura, o pagamento pode ser duplicado. Caso isso ocorra, o valor duplicado será descontado na  sua próxima fatura." text is displayed
      And the "automatic_payment_popup.accept" button with "Continuar" text is displayed
      And the "automatic_payment_popup.cancel" button with "Voltar" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen

    Examples:
          | automatic_debit_status | recurrent_payment_status | priority   | jira_id      |
          | activated              | deactivated              | regression | QANOV-453940 |
          | deactivated            | activated                | sanity     | QANOV-453941 |
          | activated              | activated                | regression | QANOV-453942 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> accepts the popup when trying to pay with new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.accept" button
     Then the "Feedback Payment Success" page is displayed
      And card with number "376674000000008" is saved in the payment methods area

    Examples:
          | automatic_debit_status | recurrent_payment_status | depends_on   | jira_id      |
          | activated              | deactivated              | QANOV-453928 | QANOV-453943 |
          | deactivated            | activated                | QANOV-453929 | QANOV-453944 |
          | activated              | activated                | QANOV-453930 | QANOV-453945 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario Outline: A no legacy user with one bill and with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> can close the automatic payment popup
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.cancel" button
     Then the "automatic_payment_popup" popup is not displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      |
          | activated              | deactivated              | QANOV-453946 |
          | deactivated            | activated                | QANOV-453947 |
          | activated              | activated                | QANOV-453948 |

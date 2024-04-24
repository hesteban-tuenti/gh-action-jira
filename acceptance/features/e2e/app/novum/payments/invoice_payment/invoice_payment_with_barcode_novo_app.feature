# -*- coding: utf-8 -*-
@jira.QANOV-453988
Feature: Invoice Payment with Barcode - Novo App


  @jira.QANOV-453989 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity
  @vivobr
  Scenario: A no legacy user can copy the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Você copiou o código de barras" text is displayed
      And the "snackbar.link" textfield with "Fechar" text is displayed
      And the clipboard has the "barcode" text

  @jira.QANOV-453990 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453989
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user can close the barcode snackbar after copying the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
      And clicks on the "snackbar.link" link
     Then the "snackbar" element is not on display
      And the clipboard has the "barcode" text

  @jira.QANOV-453991 @TBD @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453989
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user waits TBD seconds with the barcode snackbar and it is closed
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
      And waits "TBD" seconds
     Then the "snackbar" element is not on display
      And the clipboard has the "barcode" text

  @jira.QANOV-453992 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user sees an error message if there is an error while copying the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And there is a server error
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Algo deu errado ao copiar o código de barras. Tente de novo" text is displayed
      And the "snackbar.link" textfield with "Entendi" text is displayed
      And the clipboard does not have the "barcode" text

  @jira.QANOV-453993 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453992
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user can close the barcode snackbar after seeing the error message triggered by copying the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And there is a server error
      And waits until the "spinner" element is not visible
      And clicks on the "snackbar.link" link
     Then the "snackbar" element is not on display
      And the clipboard does not have the "barcode" text

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @<priority>
  @vivobr
  Scenario Outline: A no legacy user with with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status>  sees an informative popup when trying to copy the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
     Then the "automatic_payment_popup" popup is displayed
      And the "automatic_payment_popup.title" textfield with "O pagamento automático está ativo" text is displayed
      And the "automatic_payment_popup.message" textfield with "Ao continuar e pagar antes do vencimento da fatura, o pagamento pode ser duplicado. Caso isso ocorra, o valor duplicado será descontado na  sua próxima fatura." text is displayed
      And the "automatic_payment_popup.accept" button with "Continuar" text is displayed
      And the "automatic_payment_popup.cancel" button with "Voltar" text is displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      | priority   |
          | activated              | deactivated              | QANOV-453994 | regression |
          | deactivated            | activated                | QANOV-453995 | smoke      |
          | activated              | activated                | QANOV-453996 | regression |

  @jira.<jira_id> @ber @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-439542
  @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> accepts the popup when trying to copy the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.accept" link
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Você copiou o código de barras" text is displayed
      And the "snackbar.link" textfield with "Fechar" text is displayed
      And the clipboard has the "barcode" text

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      | depends_on   | ber |
          | activated              | deactivated              | QANOV-453997 | QANOV-453994 |     |
          | deactivated            | activated                | QANOV-453998 | QANOV-453995 | ber |
          | activated              | activated                | QANOV-453999 | QANOV-453996 |     |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-439542
  @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> close the popup when trying to copy the barcode
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Copiar código de barras" value of the "payment_methods_list" list
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.close" link
     Then the "automatic_payment_popup" popup is not displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      | depends_on   |
          | activated              | deactivated              | QANOV-454000 | QANOV-453997 |
          | deactivated            | activated                | QANOV-454001 | QANOV-453998 |
          | activated              | activated                | QANOV-454002 | QANOV-453999 |

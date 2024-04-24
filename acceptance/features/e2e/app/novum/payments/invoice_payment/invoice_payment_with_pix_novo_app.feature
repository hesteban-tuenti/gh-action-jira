# -*- coding: utf-8 -*-
@jira.QANOV-454033
Feature: Invoice Payment with PIX - Novo App


  @jira.QANOV-454034 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity
  @vivobr
  Scenario: A no legacy user can copy the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Você copiou o código Pix" text is displayed
      And the "snackbar.link" textfield with "Fechar" text is displayed
      And the clipboard has the "pix_code" text

  @jira.QANOV-454035 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454034
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user can close the Pix snackbar after copying the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
      And clicks on the "snackbar.link" link
     Then the "snackbar" element is not on display
      And the clipboard has the "pix_code" text

  @jira.QANOV-454036 @TBD @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454034
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user waits TBD seconds with the Pix code snackbar and it is closed
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And waits until the "spinner" element is not visible
      And waits "TBD" seconds
     Then the "snackbar" element is not on display
      And the clipboard has the "pix_code" text

  @jira.QANOV-454037 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user sees an error message if there is an error while copying the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And there is a server error
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Algo deu errado ao copiar código Pix. Tente de novo" text is displayed
      And the "snackbar.link" textfield with "Entendi" text is displayed
      And the clipboard does not have the "pix_code" text

  @jira.QANOV-454038 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454037
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user can close the Pix snackbar after seeing the error message triggered by copying the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And there is a server error
      And waits until the "spinner" element is not visible
      And clicks on the "snackbar.link" link
     Then the "snackbar" element is not on display
      And the clipboard does not have the "pix_code" text

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @<priority>
  @vivobr
  Scenario Outline: A no legacy user with with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status>  sees an informative popup when trying to copy the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
     Then the "automatic_payment_popup" popup is displayed
      And the "automatic_payment_popup.title" textfield with "O pagamento automático está ativo" text is displayed
      And the "automatic_payment_popup.message" textfield with "Ao continuar e pagar antes do vencimento da fatura, o pagamento pode ser duplicado. Caso isso ocorra, o valor duplicado será descontado na  sua próxima fatura." text is displayed
      And the "automatic_payment_popup.accept" button with "Continuar" text is displayed
      And the "automatic_payment_popup.cancel" button with "Voltar" text is displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      | priority   |
          | activated              | deactivated              | QANOV-454039 | regression |
          | deactivated            | activated                | QANOV-454040 | smoke      |
          | activated              | activated                | QANOV-454041 | regression |

  @jira.<jira_id> @ber @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-439542
  @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> accepts the popup when trying to copy the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.accept" link
      And waits until the "spinner" element is not visible
     Then the "snackbar.text" textfield with "Você copiou o código Pix" text is displayed
      And the "snackbar.link" textfield with "Fechar" text is displayed
      And the clipboard has the "pix_code" text

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      | depends_on   | ber |
          | activated              | deactivated              | QANOV-454042 | QANOV-454039 |     |
          | deactivated            | activated                | QANOV-454043 | QANOV-454040 |     |
          | activated              | activated                | QANOV-454044 | QANOV-454041 | ber |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-439542
  @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with with automatic debit <automatic_debit_status> and recurrent payment <recurrent_payment_status> close the popup when trying to copy the Pix code
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix Copia e Cola" value of the "payment_methods_list" list
      And the "automatic_payment_popup" popup is displayed
      And clicks on the "automatic_payment_popup.close" link
     Then the "automatic_payment_popup" popup is not displayed

    Examples:
          | automatic_debit_status | recurrent_payment_status | jira_id      | depends_on   |
          | activated              | deactivated              | QANOV-454045 | QANOV-454042 |
          | deactivated            | activated                | QANOV-454046 | QANOV-454043 |
          | activated              | activated                | QANOV-454047 | QANOV-454044 |

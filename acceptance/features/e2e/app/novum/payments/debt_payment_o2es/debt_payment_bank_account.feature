# -*- coding: utf-8 -*-
@jira.QANOV-146402 @not_hardening
Feature: Debt payment with bank account


  @jira.QANOV-143615 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69000 @manual @mobile @o2es @regression
  Scenario: A user can access to the pay with bank account
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
     Then the "Pay With Bank Account" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Tu cuenta bancaria" text is displayed
      And each element in the "bank_accounts_list" list has the "bank_account_icon" field
      And each element in the "bank_accounts_list" list has the "payment_description" textfield with "Cuenta bancaria" text
      And each element in the "bank_accounts_list" list has the "bank_account_ending" textfield with the "Termina en [0-9]{2}" format
      And each element in the "bank_accounts_list" list has the "associated_bills" textfield with "Ver facturas asociadas" text
      And each element in the "bank_accounts_list" list has the "account_amount" textfield with the "\d+(\,\d{1,2})?€" format
      And the "bank_account_payment_message" textfield with "La deuda de cada producto se cargará a la cuenta bancaria asociada. Si quieres editarla deberás ir a Mi Perfil > Datos personales > Datos bancarios > Cambio de cuenta bancaria" text is displayed
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "Pagar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-143616 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143615
  @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es @sanity
  Scenario: A user can see the associated bills for a bank account
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "associated_bills" button
     Then the "Associated Bills" page is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with the "Facturas asociadas a la cuenta terminada en [0-9]{4}" format is displayed
      And each element in the "bank_accounts_list" list has the "bill_date" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format
      And each element in the "bank_accounts_list" list has the "bill_status" field
      And each element in the "bank_accounts_list" list has the "bill_number" field
      And each element in the "bank_accounts_list" list has the "bill_amount" textfield with the "\d+(\,\d{1,2})?€" format
      And the "total_bills_label" textfield with "Total" text is displayed
      And the "total_bills" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Pay With Bank Account" page is displayed

  @jira.QANOV-143617 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69001 @manual @mobile @o2es @regression
  Scenario: A user sees an error when there is an error loading the bank account
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error loading the bank account
     Then the "Pay With Bank Account" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "alert" icon is displayed
      And the "main_title" textfield with "Algo ha ido mal" text is displayed
      And the "load_error_textfield" textfield with "No hemos podido cargar el contenido. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "reload_button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-143618 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69002 @manual @mobile @o2es @regression
  Scenario: A user can retry when there is an error loading the bank account
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error loading the bank account
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "reload_button" button
     Then the "Pay With Bank Account" internal webview is displayed

  @jira.QANOV-143619 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143615
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69003 @manual @mobile @o2es @smoke
  Scenario: A user completes the bank account payment successfully
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And debt payment is completed successfully
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Pago realizado" text is displayed
      And the "success_message" textfield with "Has pagado tus facturas pendientes. Recibirás un email con la confirmación del pago y tu servicio se reactivará en un plazo máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143620 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143619
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69004 @manual @mobile @o2es @regression
  Scenario: A user can return to account after doing the bank account payment
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And debt payment is completed successfully
      And the "Bill Payment Success Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143621 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143615
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69005 @manual @mobile @o2es @regression
  Scenario: A user completes the bank account payment with processing status
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si en tu banco aparece como realizado, se descontará de tu deuda en un plazo máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143622 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143621
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69006 @manual @mobile @o2es @regression
  Scenario: A user can return to account after completing the bank account payment with processing status
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And payment is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143623 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143615
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69005 @manual @mobile @o2es @regression
  Scenario: A user cannot complete the bank account payment with a bank in process of being changed
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
      And the user bank account is in process of being changed
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "El pago no se puede completar porque tu cuenta bancaria todavia se está actualizando" text is displayed
      And the "procesing_message" textfield with "El cambio puede tardar hasta 24h en completarse. Vuelve a intentarlo más tarde." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143624 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143623
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69006 @manual @mobile @o2es @regression
  Scenario: A user can return to account after failing a bank account payment because the bank account is being updated
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
      And the user bank account is in process of being changed
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And payment is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143625 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143615
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69007 @manual @mobile @o2es @regression
  Scenario: A user completes the bank account payment partially
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algunas facturas no se han podido pagar" text is displayed
      And the "informative_message" textfield with "Por favor, revisa la deuda pendiente e inténtalo de nuevo." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143626 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143625
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69008 @manual @mobile @o2es @regression
  Scenario: A user can return to account after completing the bank account payment partially
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143627 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69009 @manual @mobile @o2es @regression
  Scenario: A user cannot complete the bank account payment due an error
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And there is an error procesing the payment
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Ha habido un error al realizar el pago" text is displayed
      And the "informative_message" textfield with "El pago no se ha podido completar. Por favor, inténtalo más tarde." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143628 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143627
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69010 @manual @mobile @o2es @regression
  Scenario: A user can retry the bank account payment after an error procesing the bank account
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Pay With Bank Account" page is displayed

  @jira.QANOV-143629 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143627
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69011 @manual @mobile @o2es @regression
  Scenario: A user can return to account after seeing the error screen due an error procesing the bank account
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143630 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69012 @manual @mobile @o2es @regression
  Scenario: A user without connectivity cannot complete the bank account payment
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And user turns on the Airplane mode
      And clicks on the "pay" button
     Then the "Bill Payment No Connectivity Error Feedback" page is displayed
      And the "informative_title" textfield with "En este momento no tienes conexión." text is displayed
      And the "informative_message" textfield with "Por favor, comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And user turns off the Airplane mode

  @jira.QANOV-143631 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143630
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69013 @manual @mobile @o2es @regression
  Scenario: A user without connectivity can retry the bank account payment by tapping the retry button
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cuenta bancaria" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And user turns on the Airplane mode
      And clicks on the "pay" button
      And the "Bill Payment No Connectivity Error Feedback" page is displayed
      And user turns off the Airplane mode
      And clicks on the "retry" button
     Then the "Pay With Bank Account" page is displayed

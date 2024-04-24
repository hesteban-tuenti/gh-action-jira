# -*- coding: utf-8 -*-
@jira.QANOV-146409 @not_hardening
Feature: Debt payment with credit card


  @jira.QANOV-143632 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es @smoke
  Scenario: A user can see the summary of the selected debt
    Given user is in the "Bill Selection" page
     When clicks on the "continue" button
     Then the "Debt Payment Summary" page is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Resumen del pago" text is displayed
      And the "list_title" textfield with "FACTURAS" text is displayed
      And the "selected_bills" list is displayed
      And each element in the "selected_bills" list has the "bill_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format
      And each element in the "selected_bills" list has the "bill_status" field
      And each element in the "selected_bills" list has the "bill_number" field
      And each element in the "selected_bills" list has the "bill_amount" textfield with the "\d+(\,\d{1,2})?€" format
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue" button with "Continuar" text is displayed

  @jira.QANOV-143633 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69015 @manual @mobile @o2es @sanity
  Scenario: A user with bills supporting credit card and bank payment sees Choose Payment Method screen to continue the payment
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
     Then the "Choose Payment Method" page is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Elige un método de pago" text is displayed
      And the "payment_methods_list" list has "3" elements
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Tarjetas de crédito / débito" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "bank_account_icon" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Cuenta bancaria" text
      And the "2" index in the "payment_methods_list" list has the "bizum_icon" field
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "Bizum" text
      And the "total_debt_label" textfield with "Total (impuestos incl.)" text is displayed
      And the "total_debt" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the "continue" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-143634 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es
  @regression
  Scenario: A user rejects the transaction and sees an error screen
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And rejects the transaction
     Then the "Bill Payment Reject Payment Feedback" page is displayed
      And the "payment_rejected_title" textfield with "No se ha podido completar el pago" text is displayed
      And the "payment_rejected_message" textfield with "Puedes volver a intentarlo en unos minutos." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143635 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @manual @mobile @o2es @regression
  Scenario: A user can retry the debt payment after rejecting it with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And rejects the transaction
      And the "Bill Payment Reject Payment Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-143636 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @manual @mobile @o2es @regression
  Scenario: A user can return to account after rejecting the payment with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And rejects the transaction
      And the "Bill Payment Reject Payment Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143637 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69031 @manual @mobile @o2es @regression
  Scenario: A user without connectivity cannot complete the credit card payment
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And user turns on the Airplane mode
     Then the "Bill Payment No Connectivity Error Feedback" page is displayed
      And the "no_conectivity_title" textfield with "En este momento no tienes conexión." text is displayed
      And the "no_conectivity_message" textfield with "Por favor, comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And user turns off the Airplane mode

  @jira.QANOV-143638 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69032 @manual @mobile @o2es @regression
  Scenario: A user without connectivity can retry the credit card payment by tapping the retry button
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And user turns on the Airplane mode
      And clicks on the "pay" button
     Then the "Bill Payment No Connectivity Error Feedback" page is displayed
      And user turns off the Airplane mode
      And clicks on the "retry" button
      And the "Add New Card" internal webview is displayed

  @jira.QANOV-143639 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es
  @regression
  Scenario: A user completes the credit card payment with processing status
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si en tu banco aparece como realizado, se descontará de tu deuda en un plazo máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143640 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143639
  @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es @regression
  Scenario: A user can return to account after completing the credit card payment with processing status
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And payment is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143641 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143639
  @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es @regression
  Scenario: A user completes the credit card payment partially
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algunas facturas no se han podido pagar" text is displayed
      And the "informative_message" textfield with "Por favor, revisa la deuda pendiente e inténtalo de nuevo." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143642 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143641
  @jira.link.parent_test_plan.QANOV-142826 @manual @mobile @o2es @regression
  Scenario: A user can return to account after completing the credit card payment partially
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143653 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-133233 @manual @mobile @o2es @sanity
  Scenario: A user can access to the pay with new card screen
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
     Then the "Add New Card" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Añade tu tarjeta para pagar" text is displayed
      And the "cards_accepted" textfield with "Tarjetas aceptadas" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "card_name.input" inputtext with "Nombre que aparece en la tarjeta" text is displayed
      And the "card_number.input" inputtext with "Número de tarjeta" text is displayed
      And the "card.icon" icon is displayed
      And the "expiration_date.input" inputtext with "Caducidad" text is displayed
      And the "expiration_date.icon" icon is displayed
      And the "cvv.input" textfield with "CVV" text is displayed
      And the "cvv.info" link with "(i)" text is displayed
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "Pagar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-143654 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-125923 @manual @mobile @o2es @smoke
  Scenario: A user with saved cards completes the credit card payment with a new card accepting the transaction
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths.
    User has to select the save card check to save the card. In this case, the card is not saved
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt payment is completed successfully
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Pago realizado" text is displayed
      And the "success_message" textfield with "Tus facturas pendientes están pagadas, podrás verlo actualizado en tu cuenta. Recibirás un email con la confirmación del pago. La reactivación del servicio puede tardar hasta 24 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143655 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143654
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-123741 @manual @mobile @o2es @regression
  Scenario: A user can return to account after doing the payment
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And the "Bill Payment Success Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143656 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-123730 @manual @mobile @o2es @regression
  Scenario: A user clicks on the CVV (i) link at the "Add New Card" screen
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
     Then the "Add New Card" internal webview is displayed
     When clicks on the "cvv_info" link
     Then the "cvv_info" popup is displayed
      And the "cvv_info.title" textfield with "Código de seguridad (CVV)" text is displayed
      And the "cvv_info.cards" textfield with "Visa y Mastercard" text is displayed
      And the "cvv_info.message" textfield with "Son los 3 dígitos en el reverso de la tarjeta." text is displayed
      And the "cvv_info.close" button is displayed

  @jira.QANOV-143657 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-123731 @manual @mobile @o2es @regression
  Scenario: A user closes the CVV info popup
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
     Then the "Add New Card" internal webview is displayed
     When clicks on the "cvv_info" link
      And the "cvv_info" popup is displayed
      And clicks on the "cvv_info.close" link
     Then the "cvv_info" popup is not displayed

  @jira.QANOV-143658 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-123746 @manual @mobile @o2es @regression
  Scenario: A user cannot continue the payment without filling all inputs
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or
    directly if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And clicks on the "pay" button
     Then the "Este campo es obligatorio" text is displayed under the "card_number.input" field
      And the "Este campo es obligatorio" text is displayed under the "expiration_date.input" field
      And the "Este campo es obligatorio" text is displayed under the "cvv.input" field
      And the "Este campo es obligatorio" text is displayed under the "card_name.input" field

  @android @ios @jira.<jira_id> @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.<relates_to> @manual @mobile @o2es @regression
  Scenario Outline: A user introduces invalid data in the "Add New Card" page
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "<field_1>" inputtext with the "<value>" text
      And clicks on the "pay" button
     Then the "<error_field>" textfield with "<feedback_message>" text is displayed

    Examples:
          | field_1               | value     | error_field                   | feedback_message             | relates_to   | jira_id      |
          | card_name.input       | R233##aúl | card_name_error_message       | Nombre incorrecto            | QANOV-123747 | QANOV-143659 |
          | card_number.input     | 11222     | card_number_error_message     | Número de tarjeta incorrecto | QANOV-126297 | QANOV-143660 |
          | expiration_date.input | 01/@?     | expiration_date_error_message | Caducidad incorrecta         | QANOV-123748 | QANOV-143661 |
          | cvv.input             | 02        | cvv_error_error_message       | CVV incorrecto               | QANOV-125929 | QANOV-143662 |

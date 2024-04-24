# -*- coding: utf-8 -*-
@jira.QANOV-146410 @not_hardening
Feature: Debt payment with errors in transactions


  @jira.QANOV-143644 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-125920 @manual @mobile @o2es @regression
  Scenario: A user sees an error when there is an error processing the credit card payment
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
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Ha habido un error al realizar el pago" text is displayed
      And the "informative_message" textfield with "El pago no se ha podido completar. Por favor, inténtalo más tarde." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-143645 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143644
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-125921 @manual @mobile @o2es @regression
  Scenario: A user can retry the payment after seeing the error page during payment validation with a new card
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
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-143646 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143644
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-125922 @manual @mobile @o2es @regression
  Scenario: A user can return to account after seeing the error page during payment validation with a new card
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
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143647 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-84632 @manual @mobile @o2es @regression
  Scenario: A user reaches Payment Provider inactivity timeout in "Add New Card" page
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And waits "900" seconds
     Then the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-143648 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143647
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-84633 @manual @mobile @o2es @regression
  Scenario: A user clicks on retry after timeout error
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And waits "900" seconds
      And the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card" internal webview is displayed

  @jira.QANOV-143649 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143647
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-123745 @manual @mobile @o2es @regression
  Scenario: A user clicks on back after timeout error
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And waits "900" seconds
      And the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-143650 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.relates_to.QANOV-69019 @manual @mobile @o2es @regression
  Scenario: A user sees an error when there is an error loading the credit card form
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And there is an error loading the form
     Then the "Add New Card" internal webview is displayed
      And the "Pago de deuda" header is displayed
      And the "main_title" textfield with "Añade tu tarjeta para pagar" text is displayed
      And the "valid_cards_info" textfield with "Tarjetas aceptadas" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the "load_error_textfield" textfield with "Algo ha ido mal. No hemos podido cargar el contenido. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "reload_button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-143651 @android @impeded_mock @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-143650
  @jira.link.parent_test_plan.QANOV-142826 @jira.link.relates_to.QANOV-69020 @manual @mobile @o2es @regression
  Scenario: A user can reload the page when there is an error loading the credit card form
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And there is an error loading the form
      And the "Add New Card" internal webview is displayed
      And clicks on the "reload_button" button
     Then the "Add New Card" internal webview is displayed
      And the "pay" button with "Pagar" text is displayed

  @jira.QANOV-203678 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user cannot complete the Bizum payment due an error
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And there is an error procesing the payment
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-203679 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-203678
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @o2es @regression
  Scenario: A user can retry the Bizum payment after an error procesing the payment
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Pay With Bank Account" page is displayed

  @jira.QANOV-203680 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-203678
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @o2es @regression
  Scenario: A user can return to account after seeing the error screen due an error procesing the payment with Bizum
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-203681 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user completes the Bizum payment partially
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayedF
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algunas facturas no se han podido pagar" text is displayed
      And the "informative_message" textfield with "Por favor, revisa la deuda pendiente e inténtalo de nuevo." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-203682 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-203681
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @o2es @regression
  Scenario: A user can return to account after completing the Bizum payment partially
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-203683 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @o2es @regression
  Scenario: A user completes the Bizum payment with processing status
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si en tu banco aparece como realizado, se descontará de tu deuda en un plazo máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-203684 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-203683
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @o2es @regression
  Scenario: A user can return to account after completing the Bizum payment with processing status
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" button
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And payment is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

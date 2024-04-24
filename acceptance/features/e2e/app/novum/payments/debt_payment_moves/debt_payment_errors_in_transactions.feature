# -*- coding: utf-8 -*-
@jira.QANOV-127170 @not_hardening
Feature: Debt payment with errors in transactions


  @jira.QANOV-125920 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin without saved cards sees an error when there is an error processing the credit card payment with a new card. Card is not saved
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
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
      And there is an error saving the card
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-131878 @android @automation.hard @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin with saved cards sees an error when there is an error processing the credit card payment with a new card. Card is not saved
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "first" element in the "cards_list" list
      And the "Saved Card Global Payments" internal webview is displayed
      And clicks on the "pay_with_new_card" button
     Then the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
      And there is an error saving the card
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-151689 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin without saved cards sees an error when there is an error processing the credit card payment with a new card. Card is saved
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
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
      And the "informative_title" textfield with "No hemos podido completar tu solicitud" text is displayed
      And the "informative_message" textfield with "Tu tarjeta se ha guardado para que puedas intentarlo más tarde." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "4000120000001154" number is saved

  @jira.QANOV-125921 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-125920
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the payment after seeing the error page during payment validation with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
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
      And there is an error saving the card
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-125922 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-125920
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error page during payment validation with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
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
      And there is an error saving the card
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-151690 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin cannot pay adding a saved card from the new card screen
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
      And the card with "4000120000001154" number is saved
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "El pago no se puede completar porque ya tenías esta tarjeta guardada" text is displayed
      And the "informative_message" textfield with "Para continuar, añade otra tarjeta o usa una de tus tarjetas guardadas." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-151691 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-151690
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the payment after trying the payment adding a previous saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
      And the card with "4000120000001154" number is saved
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-151692 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-151690
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after trying the payment adding a previous saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
      And the card with "4000120000001154" number is saved
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-151693 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69000 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the credit card payment partially
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algunas facturas no se han podido pagar" text is displayed
      And the "informative_message" textfield with "Por favor, revisa la deuda pendiente e inténtalo de nuevo." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-151694 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-151693
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after completing the credit card payment partially
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-151695 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin completes the credit card payment with processing status. Card is not saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And payment is processing
      And there is an error saving the card
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-151696 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-151695
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after completing the credit card payment with processing status. Card is not saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And payment is processing
      And there is an error saving the card
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-151697 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin completes the credit card payment with processing status. Card is saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Tu pago se está procesando" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "4000120000001154" number is saved

  @jira.QANOV-151698 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-151697
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after completing the credit card payment with processing status. Card is saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" internal webview is displayed
      And fills the "card_number.input" inputtext with the "4000120000001154" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And payment is processing
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-123735 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin with bills sees an error when there is an error processing the credit card payment after selecting it
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-123736 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-123735
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the payment after seeing the error page during payment validation with a saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Credit Card Selection" page is displayed

  @jira.QANOV-123737 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-123735
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error page during payment validation with a saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-84632 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods reaches Payment Provider inactivity timeout in "Add New Card" page
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And waits "900" seconds
     Then the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-84633 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-84632 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods clicks on retry after timeout error
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And waits "900" seconds
      And the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card" internal webview is displayed

  @jira.QANOV-123745 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-84632 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods clicks on back after timeout error
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
      And the selected bills support credit card and bank account payment
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And waits "900" seconds
      And the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-69019 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin sees an error when there is an error loading the credit card form
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And there is an error loading the form
     Then the "Add New Card" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Añade tu tarjeta para pagar" text is displayed
      And the "valid_cards_info" textfield with "Tarjetas aceptadas" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "load_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "load_error_textfield" textfield with "No hemos podido cargar el contenido. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "reload_button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-69020 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69019
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can reload the page when there is an error loading the credit card form
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And there is an error loading the form
      And the "Add New Card" internal webview is displayed
      And clicks on the "reload_button" button
     Then the "Add New Card" internal webview is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed

  @jira.QANOV-69001 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin sees an error when there is an error loading the bank account
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error loading the bank account
     Then the "Pay With Bank Account" internal webview is displayed
      And the "Pago de facturas" header is displayed
      And the "main_title" textfield with "Tu cuenta bancaria" text is displayed
      And the "load_error_textfield" textfield with "Algo ha ido mal. No hemos podido cargar el contenido. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "reload_button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-69002 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin can retry when there is an error loading the bank account
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error loading the bank account
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "reload_button" button
     Then the "Pay With Bank Account" internal webview is displayed
      And the "bank_accounts_list" list has "1" elements

  @jira.QANOV-69009 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin cannot complete the bank account payment due an error
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And there is an error procesing the payment
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "informative_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "informative_message" textfield with "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed

  @jira.QANOV-69010 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69009
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the bank account payment after an error procesing the bank account
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Pay With Bank Account" page is displayed

  @jira.QANOV-69011 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-69009
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error screen due an error procesing the bank account
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Pay With Bank Account" internal webview is displayed
      And clicks on the "pay" button
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-203662 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin cannot complete the Bizum payment due an error
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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

  @jira.QANOV-203663 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-203662
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the Bizum payment after an error procesing the payment
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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

  @jira.QANOV-203664 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-203662
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error screen due an error procesing the payment with Bizum
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Bizum" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And the "Bizum Payment" internal webview is displayed
      And fills the "bizum_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "pay" buttont
      And fills the "bizum_pass" inputtext with the "[CONTEXT:user.bizum_password]" text
      And clicks on the "pay" button
      And the "Bizum OTP Screen" internal webview is displayed
      And inserts the otp code
      And the "Bizum Confirmation Screen" internal webview is displayed
      And waits "2" seconds
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-203665 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin completes the Bizum payment partially
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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

  @jira.QANOV-203666 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-203665
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after completing the Bizum payment partially
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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
     Then the "Invoices" page is displayed

  @jira.QANOV-203667 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin completes the Bizum payment with processing status
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-203668 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-203667
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after completing the Bizum payment with processing status
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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
     Then the "Invoices" page is displayed

  @jira.QANOV-473660 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin can see debt cancellation error screen after paying debt with Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Debt Payment Summary" page
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
      And debt is not cancelled
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Algo ha ido mal con la confirmación de tu pago" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, procederemos al reembolso en los próximos días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-473661 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin can see debt cancellation error screen after paying debt with credit card
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt is not cancelled
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Algo ha ido mal con la confirmación de tu pago" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, procederemos al reembolso en los próximos días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-473662 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin can see debt cancellation error screen due to a refund error
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt is not cancelled
      And automatic refund throw an error
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Algo ha ido mal con la confirmación de tu pago" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, procederemos al reembolso en los próximos días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-473663 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco user in a Feedback screen can go back by clicking webview back button
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt is not cancelled
      And automatic refund throw an error
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "back" button with "Volver" text is displayed
      And the "Debt Detail" page is displayed

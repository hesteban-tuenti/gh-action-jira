# -*- coding: utf-8 -*-
@jira.QANOV-133240 @not_hardening
Feature: Debt payment with errors in transactions


  @jira.QANOV-125936 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-125920 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin without saved cards sees an error when there is an error processing the credit card payment with a new card. Card is not saved
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And there is an error saving the card
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde"
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Bill Selection" page is loaded
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-125937 @jira.cv.12.7 @jira.link.depends_on.QANOV-125935 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-125936 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error page during payment validation with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-133241 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-131878 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin with saved cards sees an error when there is an error processing the credit card payment with a new card. Card is not saved
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Saved Card Global Payments" page is loaded
      And I click on the "pay_with_new_card" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And there is an error saving the card
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "No hemos podido completar tu solicitud"
      And the text of the element "informative_message" is equal to "Tu tarjeta se ha guardado para que puedas intentarlo más tarde."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Bill Selection" page is loaded
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-151715 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin without saved cards sees an error when there is an error processing the credit card payment with a new card. Card is saved
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Saved Card Global Payments" page is loaded
      And I click on the "pay_with_new_card" button
     Then the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde"
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Bill Selection" page is loaded
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-126298 @jira.cv.12.7 @jira.link.depends_on.QANOV-125935 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-125921 @jira.link.relates_to.QANOV-125936 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the payment after seeing the error page during payment validation with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And there is an error saving the card
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "retry" button
     Then the "Add New Card" page is loaded

  @jira.QANOV-133242 @jira.cv.12.7 @jira.link.depends_on.QANOV-125935 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-125922 @jira.link.relates_to.QANOV-125936 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error page during payment validation with a new card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And there is an error saving the card
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-151716 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin cannot pay adding a saved card from the new card screen
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And the card with "4000120000001154" number is saved
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" icon is displayed
      And the text of the element "informative_title" is equal to "El pago no se puede completar porque ya tenías esta tarjeta guardada"
      And the text of the element "informative_message" is equal to "Para continuar, añade otra tarjeta o usa una de tus tarjetas guardadas."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-151717 @jira.cv.12.7 @jira.link.depends_on.QANOV-151716 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the payment after trying the payment adding a previous saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And the card with "4000120000001154" number is saved
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loadedd
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "retry" button
     Then the "Add New Card" page is loaded

  @jira.QANOV-151718 @jira.cv.12.7 @jira.link.depends_on.QANOV-151716 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after trying the payment adding a previous saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And the card with "4000120000001154" number is saved
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-151719 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the credit card payment partially
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Algunas facturas no se han podido pagar"
      And the text of the element "informative_message" is equal to "Por favor, revisa la deuda pendiente e inténtalo de nuevo."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-151720 @jira.cv.12.7 @jira.link.depends_on.QANOV-151719 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the credit card payment partially
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-151721 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the credit card payment with processing status. Card is not saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And payment is processing
      And there is an error saving the card
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago se está procesando"
      And the text of the element "informative_message" is equal to "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días."
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Account" page is loaded
      And the card with "4000120000001154" number is not saved

  @jira.QANOV-151722 @jira.cv.12.7 @jira.link.depends_on.QANOV-151721 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the credit card payment with processing status. Card is not saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And payment is processing
      And there is an error saving the card
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-151723 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the credit card payment with processing status. Card is saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "procesing_title" is equal to "Tu pago se está procesando"
      And the text of the element "procesing_message" is equal to "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días."
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Account" page is loaded
      And the card with "4000120000001154" number is saved

  @jira.QANOV-151724 @jira.cv.12.7 @jira.link.depends_on.QANOV-151723 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the credit card payment with processing status. Card is saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">1" valid cards saved in the payment methods area
      And the card with "4000120000001154" number is not saved
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "first" element in the "cards_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4000120000001154"
      And I fill in the "expiration_date.input" field with "12/21"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum Card"
      And I click on the "save_card.check" checkbox
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And payment is processing
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-123757 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-123735 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills sees an error when there is an error processing the credit card payment after selecting it
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "pay" button
      And the "Saved Card Global Payments" page is loaded
      And I fill in the "cvv.input" field with "123"
      And I click on the "pay" button
      And there is an error processing the credit card payment
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde"
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Credit Card Selection" page is loaded

  @jira.QANOV-123758 @jira.cv.12.7 @jira.link.depends_on.QANOV-123757 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123736 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the payment after seeing the error page during payment validation with a saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "pay" button
      And the "Saved Card Global Payments" page is loaded
      And I fill in the "cvv.input" field with "123"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "retry" button
     Then the "Credit Card Selection" page is loaded

  @jira.QANOV-123759 @jira.cv.12.7 @jira.link.depends_on.QANOV-123757 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123737 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error page during payment validation with a saved card
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And I click on the "pay" button
      And the "Saved Card Global Payments" page is loaded
      And I fill in the "cvv.input" field with "123"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And there is an error processing the credit card payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-123767 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-84632 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods reaches Payment Provider inactivity timeout in "Add New Card" page
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Add New Card" page is loaded
      And I wait "900" seconds
     Then the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is loaded
      And the text of the element "error_title" is equal to "El pago no se ha completado"
      And the text of the element "error_message" is equal to "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver al inicio"

  @jira.QANOV-123768 @jira.cv.12.7 @jira.link.depends_on.QANOV-123767 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-84633 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods clicks on retry after timeout error
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Add New Card" page is loaded
      And I wait "900" seconds
      And the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is loaded
      And I click on the "retry" button
     Then the "Add New Card" page is loaded

  @jira.QANOV-123769 @jira.cv.12.7 @jira.link.depends_on.QANOV-123767 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123745 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods clicks on back after timeout error
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Add New Card" page is loaded
      And I wait "900" seconds
      And the "Feedback Bill Payment with Credit Card Provider Timeout Error" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-77406 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-69019 @manual @moves
  @regression @web
  Scenario: A telco postpay user logged in as admin sees an error when there is an error loading the credit card form
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And there is an error loading the form
     Then the "Add New Card" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Añade tu tarjeta para pagar"
      And the text of the element "valid_cards_info" is equal to "Tarjetas aceptadas"
      And the "visa.icon" element is displayed
      And the "mastercard.icon" element is displayed
      And the text of the element "total_amount_label" is equal to "Total a pagar"
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the text of the element "load_error_title" is equal to "Algo ha ido mal"
      And the text of the element "load_error_textfield" is equal to "No hemos podido cargar el contenido. Por favor, inténtalo de nuevo más tarde."
      And the text of the element "reload_button" is equal to "Reintentar"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-77407 @jira.cv.12.7 @jira.link.depends_on.QANOV-77406 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69020 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can reload the page when there is an error loading the credit card form
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Pay With New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And there is an error loading the form
      And the "Add New Card" page is loaded
      And I click on the "reload_button" button
     Then the "Add New Card" page is loaded
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"

  @jira.QANOV-203732 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin cannot complete the Bizum payment due an error
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And there is an error procesing the payment
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-203733 @jira.cv.14.5 @jira.link.depends_on.QANOV-203732 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the Bizum payment after an error procesing the payment
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "retry" button
     Then the "Pay With Bank Account" page is loaded

  @jira.QANOV-203734 @jira.cv.14.5 @jira.link.depends_on.QANOV-203732 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error screen due an error procesing the payment with Bizum
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-203735 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the Bizum payment partially
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And payment is completed partially
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Algunas facturas no se han podido pagar"
      And the text of the element "informative_message" is equal to "Por favor, revisa la deuda pendiente e inténtalo de nuevo."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-203736 @jira.cv.14.5 @jira.link.depends_on.QANOV-203735 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the Bizum payment partially
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And payment is completed partially
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-203737 @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin completes the Bizum payment with processing status
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And payment is processing
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago se está procesando"
      And the text of the element "informative_message" is equal to "Si este cargo aparece en tu cuenta bancaria, se descontará de tu importe pendiente en un máximo de 5 días."
      And the text of the element "back" is equal to "Volver"
      And I go back to the previous page
      And the "Account" page is loaded

  @jira.QANOV-203738 @jira.cv.14.5 @jira.link.depends_on.QANOV-203737 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after completing the Bizum payment with processing status
    The "Bizum Payment" and the "Bizum OTP Screen" webview is external. Belongs to Bizum. Bizum OTP Screen depends
    on the bank. Can be different for each bank
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And payment is processing
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-77389 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-69001 @manual @moves
  @regression @web
  Scenario: A telco postpay user logged in as admin sees an error when there is an error loading the bank account
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And there is an error loading the bank account
     Then the "Pay With Bank Account" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Tu cuenta bancaria"
      And the text of the element "load_error_textfield" is equal to "Algo ha ido mal. No hemos podido cargar el contenido. Por favor, inténtalo de nuevo más tarde."
      And the text of the element "reload_button" is equal to "Reintentar"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-77390 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-69002 @manual @moves
  @regression @web
  Scenario: A telco postpay user logged in as admin can retry when there is an error loading the bank account
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And there is an error loading the bank account
      And the "Pay With Bank Account" page is loaded
      And I click on the "reload_button" button
     Then the "Pay With Bank Account" page is loaded
      And the "bank_accounts_list" list has "1" elements

  @jira.QANOV-77397 @jira.cv.12.7 @jira.link.detects.CHECKOUT-2512 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69009 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin cannot complete the bank account payment due an error
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "Pay With Bank Account" page is loaded
      And I click on the "pay" button
      And there is an error procesing the payment
     Then the "Bill Payment Informative Feedback" page is loaded
      And the "error_icon" element is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago de tus facturas no se ha podido procesar. Por favor, inténtalo de nuevo más tarde."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-77398 @jira.cv.12.7 @jira.link.depends_on.QANOV-77397 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69010 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the bank account payment after an error procesing the bank account
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "Pay With Bank Account" page is loaded
      And I click on the "pay" button
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "retry" button
     Then the "Pay With Bank Account" page is loaded

  @jira.QANOV-77399 @jira.cv.12.7 @jira.link.depends_on.QANOV-77397 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-69011 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after seeing the error screen due an error procesing the bank account
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And I click on the "continue" button
      And the "Pay With Bank Account" page is loaded
      And I click on the "pay" button
      And there is an error procesing the payment
      And the "Bill Payment Informative Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-473664 @jira.cv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can see debt cancellation error screen after paying debt with Bizum
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Bizum Payment" page is loaded
      And I fill in the "bizum_number" field with "[CONTEXT:user.number]"
      And I click on the "pay" button
      And I fill in the "bizum_pass" field with "[CONTEXT:user.bizum_password]"
      And I click on the "pay" button
      And the "Bizum OTP Screen" page is loaded
      And I insert the otp code
      And the "Bizum Confirmation Screen" page is loaded
      And I wait "2" seconds
      And debt is not cancelled
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Algo ha ido mal con la confirmación de tu pago" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, procederemos al reembolso en los próximos días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-473665 @jira.cv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can see debt cancellation error screen after paying debt with credit card
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" internal webview is displayed
      And fills the "cvv.input" inputtext with the "123" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And debt is not cancelled
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "procesing_title" textfield with "Algo ha ido mal con la confirmación de tu pago" text is displayed
      And the "procesing_message" textfield with "Si este cargo aparece en tu cuenta bancaria, procederemos al reembolso en los próximos días." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-473666 @jira.cv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
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

  @jira.QANOV-473667 @jira.cv.Future @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
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
     Then the "Bill Payment Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "back" button with "Volver" text is displayed
      And the "Debt Detail" page is displayed

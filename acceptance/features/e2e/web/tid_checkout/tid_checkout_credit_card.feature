# -*- coding: utf-8 -*-
@jira.QANOV-558338
Feature: TID Checkout - Credit Card


  @jira.QANOV-558339 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @smoke @tidgco @web
  Scenario: User accesses to the Add New Card screen by selecting it in the Choose Payment Method Screen
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
     Then the "Add New Card" page is loaded
      And the text of the element "main_title" is equal to "Añade tu tarjeta para pagar"
      And the "total_amount" textfield with the "Total \d+(\,\d{1,2})?€" format is displayed
      And the text of the element "cards_accepted" is equal to "Tarjetas Aceptadas"
      And the "visa.icon" element is displayed
      And the "mastercard.icon" element is displayed
      And the text of the element "card_number.label" is equal to "Número de tarjeta"
      And the "card_number.input" inputtext with the "Número de tarjeta" placeholder is displayed
      And the "card.icon" element is displayed
      And the text of the element "expiration_date.label" is equal to "Caducidad"
      And the "expiration_date.input" inputtext with the "MMAA" placeholder is displayed
      And the "expiration_date.icon" element is displayed
      And the text of the element "cvv.label" is equal to "CVV"
      And the "cvv.input" element is displayed
      And the "cvv.info" element is displayed
      And the text of the element "card_name.input" is equal to "Nombre del titular de la tarjeta"
      And the "card_name.input" element is displayed
      And the text of the element "pay" is equal to "Pagar"
      And I go back to the previous page
      And the "Choose Payment Method" page is loaded

  @jira.QANOV-558340 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User clicks on the CVV (i) link at the "Add New Card" page
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I click on the "info" field in the element "cvv"
     Then the "cvv_info" element is displayed
      And the "message" field in the "cvv_info" element has the "El CVV se encuentra en el reverso de la tarjeta. Está compuesto por tres dígitos." in the "data-bs-original-title" attribute

  @jira.QANOV-558341 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User closes the CVV info
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I click on the "info" field in the element "cvv"
      And the "cvv_info" element is displayed
      And I click on the "input" field in the element "expiration_date"
      And waits "1" seconds
     Then the "info" field in the "cvv" element does not have the "aria-describedby" attribute

  @jira.QANOV-558342 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User cannot continue the payment with a new card without filling all inputs
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I click on the "pay" button
     Then the "error_message" textfield is displayed
      And the "Add New Card" page is displayed

  @jira.<jira_id> @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario Outline: User introduces invalid data in the <field_1> in "Add New Card" page and sees the validation error
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "<field_1>" field with "<value>"
      And I click on the "pay" button
     Then the text of the element "<error_field>" is equal to "<feedback_message>"

    Examples:
          | field_1               | value | error_field                   | feedback_message                            | jira_id      |
          | card_number.input     | 11222 | card_number_error_message     | El número de tarjeta no es válido           | QANOV-558344 |
          | expiration_date.input | 01/@? | expiration_date_error_message | Introduce una fecha válida con formato MMAA | QANOV-558345 |
          | cvv.input             | 02    | cvv_error_error_message       | CVV incorrecto                              | QANOV-558346 |

  @jira.QANOV-558347 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @sanity @tidgco @web
  Scenario: User completes the Payment by credit card and sees the Payment Success screen
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
     Then the "Feedback Payment Success" page is loaded
      And the "success_icon" icon is displayed
      And the text of the element "informative_title" is equal to "¡Listo!"
      And the text of the element "informative_message" is equal to "Tu pago se ha completado y pronto recibirás un email con la confirmación."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-558348 @TBD @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558347 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: User returns to TDB after doing a payment with credit card
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
      And the "Feedback Payment Success" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-558349 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User sees an error screen when credit card payment is not completed
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
      And there is an error with the payment
     Then the "Feedback Payment Error" page is loaded
      And the "error_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago no se ha podido procesar. Por favor, inténtalo de nuevo más tarde."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-558350 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558349 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: User taps on retry button after an error doing a payment with credit card
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
      And there is an error with the payment
      And the "Feedback Payment Success" page is loaded
      And I click on the "retry" button
     Then the "Add New Card" page is loaded

  @jira.QANOV-558351 @TBD @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558349 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: User taps on back button after an error doing a payment with credit card
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
      And there is an error with the payment
      And the "Feedback Payment Success" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-558352 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User completes the Payment by credit card and payment is processing
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
      And payment is processing
     Then the "Feedback Payment Error" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago se está procesando"
      And the text of the element "informative_message" is equal to "Parece que el pago se ha realizado. Pronto recibirás un email con la confirmación"
      And the text of the element "back" is equal to "Aceptar"

  @jira.QANOV-558353 @TBD @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558352 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: User returns to TDB after doing a payment with credit card when payment is processing
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4548814479727229"
      And I fill in the "expiration_date.input" field with "1240"
      And I fill in the "cvv.input" field with "123"
      And I fill in the "card_name.input" field with "QA Novum"
      And I click on the "pay" button
      And payment is processing
      And the "Feedback Payment Error" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-619040 @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User sees the timeout error screen after waiting in the add new card screen
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And waits "180" seconds
     Then the "Feedback Payment Error" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "El pago no se ha completado"
      And the text of the element "informative_message" is equal to "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-619041 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-619040 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: User taps on retry button after a timeout error in the add new card screen
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And waits "180" seconds
      And the "Feedback Payment Error" page is loaded
      And I click on the "back" button
     Then the "Add New Card" page is loaded

  @jira.QANOV-619042 @TBD @e2e @jira.cv.Future @jira.link.depends_on.QANOV-619040 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: User taps on back button after a timeout error in the add new card screen
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Añadir tarjeta" value of the "payment_methods_list" list
      And the "Add New Card" page is loaded
      And waits "180" seconds
      And the "Feedback Payment Error" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

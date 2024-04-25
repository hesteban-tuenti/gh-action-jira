# -*- coding: utf-8 -*-
@jira.QANOV-152278
Feature: Financed payment


  @jira.QANOV-152279 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin can see the summary of his/her payment before selecting the payment method
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     Then the "Pago" header is displayed
      And the text of the element "main_title" is equal to "Resumen del pago"
      And the text of the element "list_title" is equal to "PRODUCTOS"
      And the "adquired_products" list is displayed
      And each element in the "adquired_products" list has the "product_title" field
      And each element in the "adquired_products" list has the "additional_information" field
      And each element in the "adquired_products" list has the "product_amount" textfield with the "\d+(\,\d{1,2})?€" format
      And the text of the element "total_amount_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the text of the element "continue" is equal to "Continuar"
      And I go back to the previous page
      And the "TBD" page is loaded

  @jira.QANOV-152280 @TBD @jira.cv.Future @manual @moves @sanity @web
  Scenario: A Movistar web telco postpay user logged in as admin with more than 300€ to purchase sees Choose Payment Method screen to continue the payment
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
     Then the "Choose Payment Method" page is loaded
      And the "Pago" header is displayed
      And the text of the element "main_title" is equal to "[LANG:payments.choose_payment_method.main_title]"
      And the "payment_methods_list" list has "2" elements
      And the "0" index in the "payment_methods_list" has the "icon" field with "bill" icon
      And the "0" index in the "payment_methods_list" has the "label" field with "POPULAR" text
      And the "0" index in the "payment_methods_list" has the "payment_description" field with "Pago financiado" text
      And the "0" index in the "payment_methods_list" has the "amount" textfield with the "Desde \d+(\,\d{1,2})?€/mes" format
      And the "0" index in the "payment_methods_list" has the "selected" button with "enabled" value
      And the "1" index in the "payment_methods_list" has the "icon" field with "credit_card" icon
      And the "1" index in the "payment_methods_list" has the "payment_description" field with "[LANG:payments.card_label]" text
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the text of the element "continue" is equal to "Continuar"
      And I go back to the previous page
      And the "TBD" page is loaded

  @jira.QANOV-152281 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin can see the different financed options
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
     Then the "Select Terms" page is loaded
      And the "Pago" header is displayed
      And the text of the element "main_title" is equal to "Selecciona el plazo"
      And the "available_terms" list is displayed
      And each element in the "available_terms" list has the "financed_summary" textfield with the "\d+(\,\d{1,2})?€/mes - Durante [0-9]{2} meses" format
      And each element in the "available_terms" list has the "total_financed" textfield with the "Total adeudado: \d+(\,\d{1,2})?€" format
      And each element in the "available_terms" list has the "product_amount" textfield with the "TIN: \d+(\,\d{1,2})?% - TAE: \d+(\,\d{1,2})?%" format
      And the "0" index in the "available_terms" has the "label" field with "RECOMENDADO" text
      And the "0" index in the "available_terms" has the "selected" button with "enabled" value
      And the "data_shared_check" element is displayed
      And the text of the element "data_shared_button" is equal to "Acepto que mis datos sean compartidos con la financiera Telefónica Consumer Finance EFC, S.A."
      And the "conditions_check" element is displayed
      And the text of the element "conditions_button" is equal to "He leído y acepto las condiciones generales, particulares y de desistimiento."
      And the text of the element "terms_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the text of the element "continue" is equal to "Continuar"
      And I go back to the previous page
      And the "TBD" page is loaded

  @jira.QANOV-152282 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin can see the conditions of the financed payment
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "conditions_button" button
     Then the "TBD" page is loaded
      And I go back to the previous page
      And the "TBD" page is loaded

  @jira.QANOV-152283 @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin cannot continue the payment without accepting the terms and conditions
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "continue" button
     Then the "No Terms Conditions Accepted" popup is displayed
      And the text of the element "popup.message" is equal to "Por favor, acepta nuestros términos y condiciones para continuar"
      And the text of the element "popup.accept" is equal to "Entendido"

  @jira.<jira_id> @jira.cv.Future @manual @moves @regression @web
  Scenario Outline: A Movistar web telco postpay user logged in as admin cannot continue the payment after selecting only "<selected_check>"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "<selected_check>" checkbox
      And I click on the "continue" button
     Then the "No Terms Conditions Accepted" popup is displayed
      And the text of the element "popup.message" is equal to "Por favor, acepta nuestros términos y condiciones para continuar"
      And the text of the element "popup.accept" is equal to "Entendido"

    Examples:
          | selected_check         | jira_id      |
          | data_shared_check      | QANOV-152284 |
          | admin-conditions_check | QANOV-152285 |

  @jira.QANOV-152286 @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin can close the "No Terms Conditions Accepted" popup
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "continue" button
      And the "No Terms Conditions Accepted" popup is displayed
      And I click on the "popup.accept" button
     Then the "No Terms Conditions Accepted" popup is not displayed

  @jira.QANOV-152287 @TBD @jira.cv.Future @manual @moves @sanity @web
  Scenario: A Movistar web telco postpay user logged in as admin can see the screen to fill his/her personal data to complete the financed payment
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "data_shared_check" element
      And I click on the "conditions_check" element
      And I click on the "continue" button
     Then the "TBD" page is loaded
      And I go back to the previous page
      And the "TBD" page is loaded

  @jira.QANOV-152288 @jira.cv.Future @manual @moves @smoke @web
  Scenario: A Movistar web telco postpay user logged in as admin completes the financed payment successfully
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "data_shared_check" element
      And I click on the "conditions_check" element
      And I click on the "continue" button
      And I fill the personal data
      And the financed payment is completed successfully
     Then the "Financed Payment Success Feedback" page is loaded
      And the "success_icon" element is displayed
      And the text of the element "success_title" is equal to "¡Listo!"
      And the text of the element "success_message" is equal to "Hemos completado tu pago. Recibirás un email con la confirmación del pago financiado. Puedes hacer el seguimiento de tu pedido desde tu perfil."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-152289 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin returns to "TBD" after completing the financed payment
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "data_shared_check" checkbox
      And I click on the "conditions_check" checkbox
      And I click on the "continue" button
      And I fill the personal data
      And the financed payment is completed successfully
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-152290 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin completes the financed payment. Error enabling the payment
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "data_shared_check" checkbox
      And I click on the "conditions_check" checkbox
      And I click on the "continue" button
      And I fill the personal data
      And there is an error during financed payment activation
     Then the "Financed Payment Error Feedback" page is loaded
      And the "error_icon" icon is displayed
      And the text of the element "error_title" is equal to "Tu pago no se puede completar"
      And the text of the element "error_message" is equal to "TBD"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-152291 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin can retry the financed payment activation after an error
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "data_shared_check" checkbox
      And I click on the "conditions_check" checkbox
      And I click on the "continue" button
      And I fill the personal data
      And there is an error during financed payment activation
      And the "Financed Payment Error Feedback" page is loaded
      And I click on the "retry" button
     Then the "TBD" page is loaded

  @jira.QANOV-152292 @TBD @jira.cv.Future @manual @moves @regression @web
  Scenario: A Movistar web telco postpay user logged in as admin returns to "TBD" after sees the error during financed payment activation
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the "continue" button
      And the "Select Terms" page is loaded
      And I click on the "data_shared_check" checkbox
      And I click on the "conditions_check" checkbox
      And I click on the "continue" button
      And I fill the personal data
      And there is an error during financed payment activation
      And the "Financed Payment Error Feedback" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-152293 @TBD @jira.cv.Future @manual @moves @sanity @web
  Scenario: A Movistar web telco postpay user logged in as admin with less than 300€ to purchase sees Choose Payment Method screen to continue the payment
    If the total amount is less than 300€, financed payment won't be available. By default, the user will be redirected
    to the screen to add a new card, but depends of the previous page and of the available payment methods
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for "<300" € to purchase
     When I click on the "continue" button
     Then the "Add New Card" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Añade tu tarjeta para pagar"
      And the text of the web element "cards_accepted" is equal to "Tarjetas aceptadas"
      And the "visa.icon" element is displayed
      And the "mastercard.icon" element is displayed
      And the text of the web element "card_name.input" is equal to "Nombre que aparece en la tarjeta"
      And the text of the web element "card_number.input" is equal to "Número de tarjeta"
      And the "card.icon" element is displayed
      And the text of the web element "expiration_date" is equal to "Caducidad"
      And the "expiration_date.icon" element is displayed
      And the text of the web element "cvv.input" is equal to "CVV"
      And the "cvv.info" element is displayed
      And the "save_card.check" element is displayed
      And the text of the web element "save_card.button" is equal to "Guardar tarjeta para futuras compras"
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

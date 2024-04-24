# -*- coding: utf-8 -*-
@jira.QANOV-152262
Feature: Financed payment


  @jira.QANOV-152263 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can see the summary of his/her payment before selecting the payment method
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     Then the "Pago" header is displayed
      And the "main_title" textfield with "Resumen del pago" text is displayed
      And the "list_title" textfield with "PRODUCTOS" text is displayed
      And the "adquired_products" list is displayed
      And each element in the "adquired_products" list has the "product_title" field
      And each element in the "adquired_products" list has the "additional_information" field
      And each element in the "adquired_products" list has the "product_amount" textfield with the "\d+(\,\d{1,2})?€" format
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the "continue" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "TBD" page is displayed

  @jira.QANOV-152264 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @sanity
  Scenario: A telco postpay user logged in as admin with more than 300€ to purchase sees Choose Payment Method screen to continue the payment
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
     Then the "Choose Payment Method" page is displayed
      And the "Pago" header is displayed
      And the "main_title" textfield with "[LANG:payments.choose_payment_method.main_title]" text is displayed
      And the "payment_methods_list" list has "2" elements
      And the "0" index in the "payment_methods_list" has the "icon" field with "bill" icon
      And the "0" index in the "payment_methods_list" has the "label" field with "POPULAR" text
      And the "0" index in the "payment_methods_list" has the "payment_description" field with "Pago financiado" text
      And the "0" index in the "payment_methods_list" has the "amount" textfield with the "Desde \d+(\,\d{1,2})?€/mes" format
      And the "0" index in the "payment_methods_list" has the "selected" button with "enabled" value
      And the "1" index in the "payment_methods_list" has the "icon" field with "credit_card" icon
      And the "1" index in the "payment_methods_list" has the "payment_description" field with "[LANG:payments.card_label]" text
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the "continue" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "TBD" page is displayed

  @jira.QANOV-152265 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can see the different financed options
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
     Then the "Select Terms" page is displayed
      And the "Pago" header is displayed
      And the "main_title" textfield with "Selecciona el plazo" text is displayed
      And the "available_terms" list is displayed
      And each element in the "available_terms" list has the "financed_summary" textfield with the "\d+(\,\d{1,2})?€/mes - Durante [0-9]{2} meses" format
      And each element in the "available_terms" list has the "total_financed" textfield with the "Total adeudado: \d+(\,\d{1,2})?€" format
      And each element in the "available_terms" list has the "product_amount" textfield with the "TIN: \d+(\,\d{1,2})?% - TAE: \d+(\,\d{1,2})?%" format
      And the "0" index in the "available_terms" has the "label" field with "RECOMENDADO" text
      And the "0" index in the "available_terms" has the "selected" button with "enabled" value
      And the "data_shared_check" checkbox is displayed
      And the "data_shared_button" button with "Acepto que mis datos sean compartidos con la financiera Telefónica Consumer Finance EFC, S.A." text is displayed
      And the "conditions_check" checkbox is displayed
      And the "conditions_button" button with "He leído y acepto las condiciones generales, particulares y de desistimiento." text is displayed
      And the "terms_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the "continue" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "TBD" page is displayed

  @jira.QANOV-152266 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can see the conditions of the financed payment
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "conditions_button" button
     Then the internal webview with "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "TBD" page is displayed

  @jira.QANOV-152267 @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin cannot continue the payment without accepting the terms and conditions
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "continue" button
     Then the "No Terms Conditions Accepted" popup is displayed
      And the "popup.message" textfield with "Por favor, acepta nuestros términos y condiciones para continuar" text is displayed
      And the "popup.accept" button with "Entendido" text is displayed

  @android @ios @jira.<jira_id> @jira.cv.Future @manual @mobile @moves @regression
  Scenario Outline: A telco postpay user logged in as admin cannot continue the payment after selecting only "<selected_check>"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "<selected_check>" checkbox
      And clicks on the "continue" button
     Then the "No Terms Conditions Accepted" popup is displayed
      And the "popup.message" textfield with "Por favor, acepta nuestros términos y condiciones para continuar" text is displayed
      And the "popup.accept" button with "Entendido" text is displayed

    Examples:
          | selected_check         | jira_id      |
          | data_shared_check      | QANOV-152268 |
          | admin-conditions_check | QANOV-152269 |

  @jira.QANOV-152270 @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can close the "No Terms Conditions Accepted" popup
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "continue" button
      And the "No Terms Conditions Accepted" popup is displayed
      And clicks on the "popup.accept" button
     Then the "No Terms Conditions Accepted" popup is not displayed

  @jira.QANOV-152271 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @sanity
  Scenario: A telco postpay user logged in as admin can see the screen to fill his/her personal data to complete the financed payment
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "data_shared_check" checkbox
      And clicks on the "conditions_check" checkbox
      And clicks on the "continue" button
     Then the internal webview with "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "TBD" page is displayed

  @jira.QANOV-152272 @android @ios @jira.cv.Future @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin completes the financed payment successfully
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "data_shared_check" checkbox
      And clicks on the "conditions_check" checkbox
      And clicks on the "continue" button
      And fills the personal data
      And the financed payment is completed successfully
     Then the "Financed Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message" textfield with "Hemos completado tu pago. Recibirás un email con la confirmación del pago financiado. Puedes hacer el seguimiento de tu pedido desde tu perfil." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-152273 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin returns to "TBD" after completing the financed payment
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "data_shared_check" checkbox
      And clicks on the "conditions_check" checkbox
      And clicks on the "continue" button
      And fills the personal data
      And the financed payment is completed successfully
      And clicks on the "back" button
     Then the "TBD" page is displayed

  @jira.QANOV-152274 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the financed payment. Error enabling the payment
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "data_shared_check" checkbox
      And clicks on the "conditions_check" checkbox
      And clicks on the "continue" button
      And fills the personal data
      And there is an error during financed payment activation
     Then the "Financed Payment Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Tu pago no se puede completar" text is displayed
      And the "error_message" textfield with "TBD" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-152275 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the financed payment activation after an error
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "data_shared_check" checkbox
      And clicks on the "conditions_check" checkbox
      And clicks on the "continue" button
      And fills the personal data
      And there is an error during financed payment activation
      And the "Financed Payment Error Feedback" page is displayed
      And clicks on the "retry" button
     Then the internal webview with "TBD" header is displayed

  @jira.QANOV-152276 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin returns to "TBD" after sees the error during financed payment activation
    The screen to insert the personal data belongs to the OB
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for ">300" € to purchase
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue" button
      And the "Select Terms" page is displayed
      And clicks on the "data_shared_check" checkbox
      And clicks on the "conditions_check" checkbox
      And clicks on the "continue" button
      And fills the personal data
      And there is an error during financed payment activation
      And the "Financed Payment Error Feedback" page is displayed
      And clicks on the "back" button
     Then the "TBD" page is displayed

  @jira.QANOV-152277 @TBD @android @ios @jira.cv.Future @manual @mobile @moves @sanity
  Scenario: A telco postpay user logged in as admin with less than 300€ to purchase sees Choose Payment Method screen to continue the payment
    If the total amount is less than 300€, financed payment won't be available. By default, the user will be redirected
    to the screen to add a new card, but depends of the previous page and of the available payment methods
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Payment Summary" page
      And user has selected products for "<300" € to purchase
     When clicks on the "continue" button
     Then the "Add New Card" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
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
      And the "save_card.check" checkbox is displayed
      And the "save_card.button" button with "Guardar tarjeta para futuras compras" text is displayed
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "TBD" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-77402 @not_hardening
Feature: Debt payment with credit card


  @jira.QANOV-77403 @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-69015
  @moves @qa @sanity @web
  Scenario: A telco postpay user logged in as admin with bills supporting credit card and bank payment sees Choose Payment Method screen to continue the payment
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Detail" page is loaded
      And I switch to "iframe" iframe
      And waits "1" seconds
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is loaded
      And I click on the "continue_button" button
      And the "Debt Payment Summary" page is loaded
      And I click on the "continue_button" button
     Then the "Choose Payment Method" page is loaded
      And the text of the element "main_title" is equal to "[LANG:payments.choose_payment_method.main_title]"
      And there are "3" elements on the "payment_methods_list" elements list
      And each element in the "payment_methods_list" web list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.card_label]" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Bizum" text
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.bank_account_label]" text
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "continue_button" is equal to "Continuar"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.<jira_id> @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.<relates_to> @manual @moves
  @regression @web
  Scenario Outline: A telco postpay user logged in as admin with saved cards for both legal entities pays the <legal_entity_1> debt with the <legal_entity_2> saved card
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has a card saved associated to a TME debt payment
      And has a card saved associated to a TDE debt payment
      And user has debt from "<legal_entity_1>" legal entity
      And user has selected "<legal_entity_1>" bills
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Credit Card Selection" page is loaded
      And the card associated to TME debt payment is displayed in the "cards_list" list
      And the card associated to TDE debt payment is displayed in the "cards_list" list
      And I select the card associated to a "<legal_entity_2>" debt payment
      And I click on the "pay" button
      And the "Saved Card Global Payments" page is loaded
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And debt payment is completed successfully
     Then the "Bill Feedback Payment Success" page is loaded

    Examples:
          | legal_entity_1 | legal_entity_2 | relates_to   | jira_id      |
          | TDE            | TME            | QANOV-131872 | QANOV-133243 |
          | TME            | TDE            | QANOV-131873 | QANOV-133244 |

  @jira.QANOV-123764 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-123742 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin rejects the transaction and sees an error message after a payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
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
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I reject the transaction
     Then the "Bill Payment Reject Payment Feedback" page is loaded
      And the text of the element "payment_rejected_title" is equal to "No se ha podido completar el pago"
      And the text of the element "payment_rejected_message" is equal to "Puedes volver a intentarlo en unos minutos."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver al inicio"

  @jira.QANOV-125942 @jira.cv.12.7 @jira.link.depends_on.QANOV-123764 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-125927 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the payment after rejecting it with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
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
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I reject the transaction
      And the "Bill Payment Reject Payment Feedback" page is loaded
      And I click on the "retry" button
     Then the "Credit Card Selection" page is loaded

  @jira.QANOV-125943 @jira.cv.12.7 @jira.link.depends_on.QANOV-123764 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123742 @jira.link.relates_to.QANOV-125928 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after rejecting the payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
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
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I reject the transaction
      And the "Bill Payment Reject Payment Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-77417 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin rejects the transaction and sees an error message
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And has "0" valid cards saved in the payment methods area
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4111111111111111"
      And I fill in the "expiration_date.input" field with "[CONF:debt_payment.valid_expiration_date]"
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I fill in the "card_name.input" field with "[CONF:debt_payment.valid_card_name]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I reject the transaction
     Then the "Bill Payment Reject Payment Feedback" page is loaded
      And the text of the element "payment_rejected_title" is equal to "No se ha podido completar el pago"
      And the text of the element "payment_rejected_message" is equal to "Puedes volver a intentarlo en unos minutos."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver al inicio"

  @jira.QANOV-125946 @jira.cv.12.7 @jira.link.depends_on.QANOV-77417 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin can retry the payment after rejecting it with a new card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And has "0" valid cards saved in the payment methods area
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4111111111111111"
      And I fill in the "expiration_date.input" field with "[CONF:debt_payment.valid_expiration_date]"
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I fill in the "card_name.input" field with "[CONF:debt_payment.valid_card_name]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I reject the transaction
      And the "Bill Payment Reject Payment Feedback" page is loaded
      And I click on the "retry" button
     Then the "Credit Card Selection" page is loaded

  @jira.QANOV-125947 @jira.cv.12.7 @jira.link.depends_on.QANOV-77417 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123742 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after rejecting the payment with a new card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the selected bills support credit card and bank account payment
      And has "0" valid cards saved in the payment methods area
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "card_number.input" field with "4111111111111111"
      And I fill in the "expiration_date.input" field with "[CONF:debt_payment.valid_expiration_date]"
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I fill in the "card_name.input" field with "[CONF:debt_payment.valid_card_name]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I reject the transaction
      And the "Bill Payment Reject Payment Feedback" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

  @jira.QANOV-142075 @jira.cv.12.7 @jira.link.depends_on.QANOV-77391 @jira.link.parent_test_plan.QANOV-76684 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin who has a debt in payment process (paid by credit card) can see it with "pending" status
    While invoice is not paid in checkout, the status will be "in process of payment". We cannot control when the bill will disappear. After 5 days, if debt is retrieved by 4P, checkout will show again to pay it
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a debt in payment process by credit card
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     Then the "Bill Selection" page is loaded
      And the text of the element "select_debt_message" is equal to "Selecciona las facturas que deseas pagar"
      And the "unpaid_bills" element is displayed
      And any element in the "unpaid_bills" list has the "label" textfield with the "EN PROCESO DE PAGO" text
      And the debt with label "EN PROCESO DE PAGO" does not have the "selected" icon
      And I go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-133237 @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-133233
  @moves @qa @smoke @web
  Scenario: A telco postpay user logged in as admin with bills supporting both payments methods can access to the pay with new card screen
    other_affected_versions="2021-40"
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Detail" page is loaded
      And I switch to "iframe" iframe
      And waits "1" seconds
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is loaded
      And I click on the "continue_button" button
      And the "Debt Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.card_label]" value of the "payment_methods_list" list
      And I click on the "continue_button" button
     Then the "Add New Card" page is loaded after "20" seconds
      And the text of the element "main_title" is equal to "Añade tu tarjeta para pagar"
      And the text of the element "total_amount_label" is equal to "Total a pagar"
      And the "total_amount" element text matches regexp "[LANG:payments.debt_amount_format]"
      And I switch to "form_iframe" iframe
      And the "card_number" element is displayed
      And I switch to "card_iframe" iframe
      And the "card_number_input" element is displayed
      And I switch to original frame
      And I switch to "iframe" iframe
      And I switch to "form_iframe" iframe
      And the text of the element "cards_accepted" is equal to "Tarjetas Aceptadas"
      And the "visa_icon" element is displayed
      And the "mastercard_icon" element is displayed
      And the text of the "label" field in the element "card_number" is equal to "Número de tarjeta"
      And the "card_number" element has the "icon" field
      And the text of the "label" field in the element "expiration_date" is equal to "Caducidad"
      And the "expiration_date" element has the "icon" field
      And the "cvv" element has the "input" field
      And the text of the "label" field in the element "cvv" is equal to "CVV"
      And the "cvv" element has the "input" field
      And the "cvv" element has the "info" field
      And the text of the "label" field in the element "card_name" is equal to "Nombre del titular de la tarjeta"
      And the "card_name" element has the "input" field
      And the "save_card_check" checkbox is displayed
      And the text of the element "save_card_label" is equal to "Guardar tarjeta para futuras compras"
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"
      And I switch to original frame
      And I switch to "iframe" iframe
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-133238 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-133234 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment can access to the pay with new card screen
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
     Then the "Add New Card" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Añade tu tarjeta para pagar"
      And the text of the element "cards_accepted" is equal to "Tarjetas aceptadas"
      And the "visa.icon" element is displayed
      And the "mastercard.icon" element is displayed
      And the text of the element "card_name.input" is equal to "Nombre que aparece en la tarjeta"
      And the text of the element "card_number.input" is equal to "Número de tarjeta"
      And the "card.icon" element is displayed
      And the text of the element "expiration_date" is equal to "Caducidad"
      And the "expiration_date.icon" element is displayed
      And the text of the element "cvv.input" is equal to "CVV"
      And the "cvv.info" element is displayed
      And the "save_card.check" element is displayed
      And the text of the element "save_card.button" is equal to "Guardar tarjeta para futuras compras"
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-123752 @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-123730
  @moves @qa @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment clicks on the CVV (i) link at the "Add New Card" page by Global Payments
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Detail" page is loaded
      And I switch to "iframe" iframe
      And waits "1" seconds
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is loaded
      And I click on the "continue_button" button
      And the "Debt Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.card_label]" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And the "Add New Card" page is loaded after "20" seconds
      And I switch to "form_iframe" iframe
      And I click on the "info" field in the element "cvv"
     Then the "cvv_info" element is displayed
      And the "message" field in the "cvv_info" element has the "El CVV se encuentra en el reverso de la tarjeta. Está compuesto por tres dígitos." in the "data-bs-original-title" attribute
      And I go back to the previous page
      And I switch to original frame
      And I switch to "iframe" iframe
      And the "Bill Selection" page is loaded

  @jira.QANOV-123753 @automatic @jira.cv.12.7 @jira.link.depends_on.QANOV-123752 @jira.link.parent_test_plan.QANOV-76684
  @moves @qa @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment closes the CVV info popup
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Detail" page is loaded
      And I switch to "iframe" iframe
      And waits "1" seconds
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is loaded
      And I click on the "continue_button" button
      And the "Debt Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And clicks on the element with "payment_description" field with "[LANG:payments.card_label]" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And the "Add New Card" page is loaded after "20" seconds
      And I switch to "form_iframe" iframe
      And I click on the "info" field in the element "cvv"
      And the "cvv_info" element is displayed
      And I click on the "input" field in the element "expiration_date"
      And waits "1" seconds
     Then the "info" field in the "cvv" element does not have the "aria-describedby" attribute

  @jira.QANOV-123754 @ber @impeded_mock @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123732 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment can access to the credit card selection screen without expired cards by Global Payments
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And has "0" expired card in global checkout
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
     Then the "Credit Card Selection" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Selecciona una tarjeta para pagar"
      And the text of the element "available_cards_label" is equal to "TARJETAS DISPONIBLES"
      And the "cards_list" list is displayed
      And each card in the "cards_list" carousel has the "company_icon" field
      And each card in the "cards_list" carousel has the "type" field
      And each card in the "cards_list" carousel has the "last_digits" field
      And each card in the "cards_list" carousel has the "expiration" field
      And each card in the "cards_list" carousel has the "selected" field
      And the "last" card in the "cards_list" carousel has the "add" icon
      And the "last" card in the "cards_list" carousel has the "add_card" textfield with "Añadir tarjeta" text
      And the "last" card in the "cards_list" carousel has the "chevron" icon
      And the "first" card in the "cards_list" carousel has the "selected" field with "enabled" value
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"

  @jira.QANOV-123755 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-123733 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment can access to the credit card selection screen with expired cards by Global Payments
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And has ">=1" expired card in global checkout
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
     Then the "Credit Card Selection" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Selecciona una tarjeta para pagar"
      And the text of the element "available_cards_label" is equal to "TARJETAS DISPONIBLES"
      And the "cards_list" list is displayed
      And each card in the "cards_list" carousel has the "company_icon" field
      And each card in the "cards_list" carousel has the "type" field
      And each card in the "cards_list" carousel has the "last_digits" field
      And each card in the "cards_list" carousel has the "expiration" field
      And each card in the "cards_list" carousel has the "selected" field
      And the "last" card in the "cards_list" carousel has the "add" icon
      And the "last" card in the "cards_list" carousel has the "add_card" textfield with "Añadir tarjeta" text
      And the "last" card in the "cards_list" carousel has the "chevron" icon
      And the "first" card in the "cards_list" carousel has the "selected" field with "enabled" value
      And the text of the element "expired_cards_label" is equal to "TARJETAS CADUCADAS"
      And the "expired_cards_list" list is displayed
      And each card in the "expired_cards_list" carousel has the "company_icon" field
      And each card in the "expired_cards_list" carousel has the "type" field
      And each card in the "expired_cards_list" carousel has the "last_digits" field
      And each element in the "expired_cards_list" list has the "expiration" textfield with "Caducada" text
      And the text of the element "total_debt_label" is equal to "[LANG:payments.debt_amount_label]"
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"

  @jira.QANOV-123770 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-123746 @manual
  @moves @regression @web
  Scenario: A telco postpay user logged in as admin cannot continue the payment by Global Payments without filling all inputs
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or
    directly if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Add New Card" page is loaded
      And I click on the "pay" button
     Then the "error_message" textfield is displayed
      And the "Add New Card" page is displayed

  @jira.<jira_id> @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.<relates_to> @manual @moves
  @regression @web
  Scenario Outline: A telco postpay user logged in as admin introduces invalid data in the "Add New Card" page by Global Payments
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And the selected bills only support "credit card" payment
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "Debt Payment Summary" page is loaded
     When I click on the "continue" button
      And the "Add New Card" page is loaded
      And I fill in the "<field_1>" field with "<value>"
      And I click on the "pay" button
     Then the text of the element "<error_field>" is equal to "<feedback_message>"

    Examples:
          | field_1               | value     | error_field                   | feedback_message             | relates_to   | jira_id      |
          | card_name.input       | R233##aúl | card_name_error_message       | Nombre incorrecto            | QANOV-123747 | QANOV-123771 |
          | card_number.input     | 11222     | card_number_error_message     | Número de tarjeta incorrecto | QANOV-126297 | QANOV-126299 |
          | expiration_date.input | 01/@?     | expiration_date_error_message | Caducidad incorrecta         | QANOV-123748 | QANOV-123772 |
          | cvv.input             | 02        | cvv_error_error_message       | CVV incorrecto               | QANOV-125929 | QANOV-125944 |

  @jira.QANOV-134873 @ber @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @manual @moves @smoke @web
  Scenario: A telco postpay user logged in as admin sees the card data after selecting a saved card to complete the payment
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
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
     Then the "Saved Card Global Payments" page is loaded
      And the "[LANG:payments.header]" header is displayed
      And the text of the element "main_title" is equal to "Por seguridad, vuelve a introducir el CVV de tu tarjeta"
      And the text of the element "total_amount_label" is equal to "Total a pagar"
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the text of the element "card_name.input" is equal to "Nombre que aparece en la tarjeta"
      And the "card_name.input" inputtext is filled
      And the text of the element "card_number.input" is equal to "Número de tarjeta"
      And the "card_number.input" inputtext is filled
      And the "card.icon" element is displayed
      And the text of the element "expiration_date.input" is equal to "Caducidad"
      And the "expiration_date.input" inputtext is filled
      And the "expiration_date.icon" element is displayed
      And the text of the element "cvv.input" is equal to "CVV"
      And the "cvv.input" inputtext is not filled
      And the text of the element "cvv.info" is equal to "(i)"
      And the text of the element "pay" is equal to "[LANG:payments.pay_button]"
      And I go back to the previous page
      And the "Bill Selection" page is loaded

  @jira.QANOV-123763 @jira.cv.12.7 @jira.link.depends_on.QANOV-123762 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-123741 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin can return to account after doing the payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
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
      And I fill in the "cvv.input" field with "[CONF:debt_payment.valid_cvv]"
      And I click on the "pay" button
      And the "3d_secure" module is displayed
      And I accept the transaction
      And the "Bill Feedback Payment Success" page is loaded
      And I click on the "back" button
     Then the "Account" page is loaded

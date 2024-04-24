# -*- coding: utf-8 -*-
@jira.QANOV-69014
Feature: Debt payment with credit card

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-69015 @android @automatic @ber @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2231
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @sanity @webapp
  Scenario: A telco postpay user logged in as admin with bills supporting credit card and bank payment sees Choose Payment Method screen to continue the payment
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "[LANG:payments.choose_payment_method.main_title]" text is displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.card_label]" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Bizum" text
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.bank_account_label]" text
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue_button" button with "[LANG:payments.continue_button]" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

  @jira.QANOV-123742 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin rejects the transaction code and sees an error message after a payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And rejects the transaction
     Then the "Bill Payment Reject Payment Feedback" page is displayed
      And the "payment_rejected_title" textfield with "No se ha podido completar el pago" text is displayed
      And the "payment_rejected_message" textfield with "Puedes volver a intentarlo en unos minutos." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-125927 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-123742
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry the payment after rejecting it with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And rejects the transaction
      And the "Bill Payment Reject Payment Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Credit Card Selection" page is displayed

  @jira.QANOV-125928 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-123742
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after rejecting the payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And rejects the transaction
      And the "Bill Payment Reject Payment Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

  @jira.QANOV-123743 @android @automation.pending_mock @ios @jira.cv.12.7 @jira.link.detects.NOV-228611
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin without connectivity cannot complete the credit card payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And user turns on the Airplane mode
     Then the "Payments No Connectivity Popup" popup is displayed
      And the "popup.title" textfield with "La página https://telefonica-sandbox.truust.io dice:" text is displayed
      And the "popup.message" textfield with "Se ha perdido la conexión a internet y no se puede completar el pago. Inténtelo de nuevo más tarde." text is displayed
      And the "popup.button" button with "ACEPTAR" text is displayed
      And user turns off the Airplane mode

  @jira.QANOV-123744 @android @automation.pending_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual
  @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin without connectivity can retry the credit card payment with a saved card by tapping the retry button
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And user turns on the Airplane mode
     Then the "Payments No Connectivity Popup" popup is displayed
      And user turns off the Airplane mode
      And clicks on the "popup.button" button
      And the "Credit Card Selection" page is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @jira.link.detects.CHECKOUT-3329
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario Outline: A telco postpay user logged in as admin without connectivity cannot complete the credit card payment
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And switches to "card_iframe" iframe
      And fills the "card_number_input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And clicks on the "pay" button
     Then the "Payments No Connectivity Popup" popup is displayed
      And the "popup.title" textfield that contains the "https://telefonica-sandbox.truust.io" text is displayed
      And the "popup.message" textfield with "Se ha perdido la conexión a internet y no se puede completar el pago. Inténtelo de nuevo más tarde." text is displayed
      And the "popup.button" button with "ACEPTAR" text is displayed
      And user turns off the Airplane mode

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-69031  |
          | ios     | manual    | QANOV-207863 |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @jira.link.depends_on.QANOV-69031 @jira.link.detects.CHECKOUT-3329
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario Outline: A telco postpay user logged in as admin without connectivity can close the no connectivity popup by tapping on accept button
    Currently, only payment with new card is possible. We cannot save the credit cards, so user
    always is redirected to payment with new card screen.
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-35 2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And switches to "card_iframe" iframe
      And fills the "card_number_input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And clicks on the "pay" button
      And the "Payments No Connectivity Popup" popup is displayed
      And user turns off the Airplane mode
      And clicks on the "popup.button" button
     Then the "Payments No Connectivity Popup" popup is not displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-69032  |
          | ios     | manual    | QANOV-207864 |

  @jira.QANOV-142076 @android @automation.pending_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-123738
  @jira.link.depends_on.QANOV-123739 @jira.link.depends_on.QANOV-123740 @jira.link.depends_on.QANOV-125919
  @jira.link.detects.CHECKOUT-3145 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who has a debt in payment process (paid by credit card) can see it with "pending" status
    While invoice is not paid in checkout, the status will be "in process of payment". We cannot control when the bill will disappear. After 5 days, if debt is retrieved by 4P, checkout will show again to pay it
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Invoices" page
      And user has a debt in payment process by credit card
     When clicks on the "outstanding_debt_button" button
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And any element in the "unpaid_bills" list has the "label" textfield with the "EN PROCESO DE PAGO" text
      And the debt with label "EN PROCESO DE PAGO" does not have the "selected" icon
      And the "navigation_tab_bar.account_tab" element is not on display
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @jira.link.detects.CHECKOUT-3329
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario Outline: A telco postpay user logged in as admin with bills supporting both payments methods can access to the pay with new card screen
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
     Then the "Add New Card" page is displayed
      And the "main_title" textfield with "Añade tu tarjeta para pagar" text is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And switches to "form_iframe" iframe
      And the "cards_accepted" textfield with "Tarjetas aceptadas" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "expiration_date.label" textfield with "Caducidad" text is displayed
      And the "expiration_date.input" inputtext with the "MMAA" placeholder is displayed
      And the "expiration_date.icon" icon is displayed
      And the "cvv.label" textfield with "CVV" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" link is displayed
      And the "card_name.input" inputtext is displayed
      And the "card_name.label" textfield with "Nombre del titular de la tarjeta" text is displayed
      And the "save_card_check" checkbox is displayed
      And the "save_card_label" button with "Guardar tarjeta para futuras compras" text is displayed
      And the "pay" button with "Pagar" text is displayed
      And the "card_number.label" textfield with "Número de tarjeta" text is displayed
      And the "card_number.icon" icon is displayed
      And switches to "card_iframe" iframe
      And the "card_number_input" inputtext is displayed
      And switches to original frame
      And the "[LANG:payments.header]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-133233 |
          | ios     | manual    | QANOV-207865 |
          | webapp  | automatic | QANOV-527402 |

  @jira.QANOV-133234 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-3144 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment can access to the pay with new card screen
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
      And the selected bills only support "credit card" payment
     When clicks on the "continue" button
     Then the "Add New Card" page is displayed
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
      And the "Bill Selection" page is displayed

  @jira.<jira_id> @<ber> @<client> @<execution> @jira.cv.12.7 @jira.link.detects.CHECKOUT-3329
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @sanity
  Scenario Outline: A telco postpay user logged in as admin completes the credit card payment and sees the feedback screen
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And switches to "form_iframe" iframe
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And switches to "card_iframe" iframe
      And fills the "card_number_input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And clicks on the enter key for the "card_name.input" inputtext
      And accepts the transaction
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message1" textfield with "El pago se ha completado y pronto recibirás la confirmación por email." text is displayed
      And the "success_message2" textfield with "Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "ok_button" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    Examples:
          | client  | execution | ber | jira_id      |
          | android | automatic | ber | QANOV-223862 |
          | ios     | manual    |     | QANOV-223863 |

  @jira.QANOV-296650 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the credit card payment for payable documents and sees the feedback screen
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" payable documents from "TDE" legal entity
      And user has "pending" payable documents from "TME" legal entity
      And user does not have "any" debt
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And fills the "card_number_input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message1" textfield with "El pago se ha completado y pronto recibirás la confirmación por email." text is displayed
      And the "success_message2" textfield with "Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-296651 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin completes the credit card payment for debt and payable documents and sees the feedback screen
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user has "pending" payable documents
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And fills the "card_number_input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message1" textfield with "El pago se ha completado y pronto recibirás la confirmación por email." text is displayed
      And the "success_message2" textfield with "Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @regression
  Scenario Outline: A telco postpay user logged in as admin clicks on the CVV (i) link at the "Add New Card" screen
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.message" textfield with "El CVV se encuentra en el reverso de la tarjeta. Está compuesto por tres dígitos." text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-123730 |
          | ios     | manual    | QANOV-207866 |
          | webapp  | automatic | QANOV-527404 |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @jira.link.depends_on.QANOV-123730
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression
  Scenario Outline: A telco postpay user logged in as admin with bills closes the CVV info
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Debt Payment Summary" page is displayed
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And switches to original frame
      And switches to "iframe" iframe
      And switches to "form_iframe" iframe
      And clicks on the "cvv.info" link
      And the "cvv_info" module is displayed
      And clicks on the "expiration_date.input" link
     Then the "cvv_info" module is not displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-123731 |
          | ios     | manual    | QANOV-207867 |

  @jira.QANOV-123732 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment can access to the credit card selection screen without expired cards
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And has "0" expired cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
     Then the "Credit Card Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona una tarjeta para pagar" text is displayed
      And the "available_cards_label" textfield with "TARJETAS DISPONIBLES" text is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "type" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "selected" field
      And the "last" element in the "cards_list" list has the "add" icon
      And the "last" element in the "cards_list" list has the "add_card" textfield with "Añadir tarjeta" text
      And the "last" element in the "cards_list" list has the "chevron" icon
      And the "first" element in the "cards_list" list has the "selected" field with "enabled" value
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed

  @jira.QANOV-123733 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin with bills supporting only credit card payment can access to the credit card selection screen with expired cards
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And has ">=1" expired cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
     Then the "Credit Card Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona una tarjeta para pagar" text is displayed
      And the "available_cards_label" textfield with "TARJETAS DISPONIBLES" text is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "type" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "selected" field
      And the "last" element in the "cards_list" list has the "add" icon
      And the "last" element in the "cards_list" list has the "add_card" textfield with "Añadir tarjeta" text
      And the "last" element in the "cards_list" list has the "chevron" icon
      And the "first" element in the "cards_list" list has the "selected" field with "enabled" value
      And the "expired_cards_label" textfield with "TARJETAS CADUCADAS" text is displayed
      And the "expired_cards_list" list is displayed
      And each element in the "expired_cards_list" list has the "company_icon" field
      And each element in the "expired_cards_list" list has the "type" field
      And each element in the "expired_cards_list" list has the "last_digits" field
      And each element in the "expired_cards_list" list has the "expiration" textfield with "Caducada" text
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed

  @jira.QANOV-123746 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin cannot continue the payment without filling all inputs
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or
    directly if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "title" field with "Tarjetas de crédito / débito" value of the "payment_methods" list
      And clicks on the "continue" button
      And the "Add New Card" page is displayed
      And clicks on the "pay" button
     Then the "error_message" textfield is displayed
      And the "Add New Card" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario Outline: A telco postpay user logged in as admin introduces invalid data in the "Add New Card" screen
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Choose Payment Method" page
     When clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And fills the "<field>" inputtext with the "<value>" text
      And clicks on the "save" button
     Then the "<field>.error_message" textfield with "<feedback_message>" text is displayed

    Examples:
          | field                 | value  | feedback_message                                      | jira_id      |
          | card_number.input     | 404556 | El número de tarjeta no es válido                     | QANOV-126297 |
          | expiration_date.input | 01/    | Introduce una fecha válida con formato MMAA           | QANOV-123748 |
          | cvv.input             | 11     | El CVV son los tres dígitos del reverso de tu tarjeta | QANOV-125929 |

  @jira.QANOV-123739 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin with saved cards completes the credit card payment with a new card accepting the transaction and saves the new card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
      And the card with "[CONF:debt_payment.valid_card_number]" number is not saved
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And clicks on the "save_card.check" checkbox
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt payment is completed successfully
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message" textfield with "El pago se ha completado y pronto recibirás la confirmación por email. Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "[CONF:debt_payment.valid_card_number]" number is saved

  @jira.QANOV-125923 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin with saved cards completes the credit card payment with a new card accepting the transaction and doesn't save the new card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths.
    User has to select the save card check to save the card. In this case, the card is not saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:debt_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:debt_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And fills the "card_name.input" inputtext with the "[CONF:debt_payment.valid_card_name]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt payment is completed successfully
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message" textfield with "El pago se ha completado y pronto recibirás la confirmación por email. Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the card with "[CONF:debt_payment.valid_card_number]" number is not saved

  @jira.QANOV-134872 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin sees the card data after selecting a saved card to complete the payment
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
     Then the "Saved Card Global Payments" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Por seguridad, vuelve a introducir el CVV de tu tarjeta" text is displayed
      And the "card_name.input" inputtext with "Nombre que aparece en la tarjeta" text is displayed
      And the "card_name.input" inputtext is filled
      And the "card_number.input" inputtext with "Número de tarjeta" text is displayed
      And the "card_number.input" inputtext is filled
      And the "card.icon" icon is displayed
      And the "expiration_date.input" inputtext with "Caducidad" text is displayed
      And the "expiration_date.input" inputtext is filled
      And the "expiration_date.icon" icon is displayed
      And the "cvv.input" textfield with "CVV" text is displayed
      And the "cvv.input" inputtext is not filled
      And the "cvv.info" link with "(i)" text is displayed
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-123740 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2680 @jira.link.parent_test_plan.QANOV-67291
  @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin completes the credit card payment with a saved card accepting the transaction
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt payment is completed successfully
     Then the "Bill Payment Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "¡Listo!" text is displayed
      And the "success_message" textfield with "El pago se ha completado y pronto recibirás la confirmación por email. Si tienes algún servicio suspendido asociado a este importe, volverá a estar disponible en un máximo de 3 horas." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-123741 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-123740
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can return to account after doing the payment with a saved card
    The Add New Card screen can be reached by selecting credit card in the Choose Payment Method screen or directly
    if user has selected bills that only support credit card payment. It is the same screen for both paths
    other_affected_versions="2021-40"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
     When clicks on the "continue" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Saved Card Global Payments" page is displayed
      And fills the "cvv.input" inputtext with the "[CONF:debt_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And the "Bill Payment Success Feedback" page is displayed
      And clicks on the "back" button
     Then the "Invoices" page is displayed

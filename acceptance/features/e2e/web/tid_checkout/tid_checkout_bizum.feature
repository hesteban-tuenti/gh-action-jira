# -*- coding: utf-8 -*-
@jira.QANOV-558329
Feature: TID Checkout - Bizum


  @jira.QANOV-558330 @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @smoke @tidgco @web @e2e
  Scenario: User starts the Bizum flow by selecting in in the Choose Payment Method screen
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
     Then the internal webview is displayed
      And the "Teléfono registrado en Bizum" string is displayed

  @jira.QANOV-558331 @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @sanity @tidgco @web @e2e
  Scenario: User completes the Payment by Bizum and sees the Payment Success screen
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And payment is done
     Then the "Feedback Payment Success" page is loaded
      And the "success_icon" icon is displayed
      And the text of the element "informative_title" is equal to "¡Listo!"
      And the text of the element "informative_message" is equal to "Tu pago se ha completado y pronto recibirás un email con la confirmación."
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-558332 @TBD @jira.cv.Future @jira.link.depends_on.QANOV-558331 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web @e2e
  Scenario: User returns to TDB after doing a payment with Bizum
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And payment is done
      And the "Feedback Payment Success" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-558333 @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web @e2e
  Scenario: User sees an error screen when Bizum payment is not completed
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And there is an error with the payment
     Then the "Feedback Payment Error" page is loaded
      And the "error_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago no se puede completar"
      And the text of the element "informative_message" is equal to "El pago no se ha podido procesar. Por favor, inténtalo de nuevo más tarde."
      And the text of the element "retry" is equal to "Reintentar"
      And the text of the element "back" is equal to "Volver"

  @jira.QANOV-558334 @jira.cv.Future @jira.link.depends_on.QANOV-558333 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web @e2e
  Scenario: User taps on retry button after an error doing a payment with Bizum
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And there is an error with the payment
      And the "Feedback Payment Success" page is loaded
      And I click on the "retry" button
     Then the "Choose Payment Method" page is loaded

  @jira.QANOV-558335 @TBD @jira.cv.Future @jira.link.depends_on.QANOV-558333 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web @e2e
  Scenario: User taps on back button after an error doing a payment with Bizum
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And there is an error with the payment
      And the "Feedback Payment Success" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

  @jira.QANOV-558336 @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  @e2e
  Scenario: User completes the Payment by Bizum and payment is processing
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And payment is processing
     Then the "Feedback Payment Error" page is loaded
      And the "informative_icon" icon is displayed
      And the text of the element "informative_title" is equal to "Tu pago se está procesando"
      And the text of the element "informative_message" is equal to "Parece que el pago se ha realizado. Pronto recibirás un email con la confirmación"
      And the text of the element "back" is equal to "Aceptar"

  @jira.QANOV-558337 @TBD @jira.cv.Future @jira.link.depends_on.QANOV-558336 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web @e2e
  Scenario: User returns to TDB after doing a payment with Bizum when payment is processing
    Bizum webview is external. Belongs to Bizum
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
      And the "Choose Payment Method" page is loaded
      And I click on the element with "title" field with "Bizum" value of the "payment_methods_list" list
      And I click on the "continue_button" button
      And completes Bizum flow
      And payment is processing
      And the "Feedback Payment Error" page is loaded
      And I click on the "back" button
     Then the "TBD" page is loaded

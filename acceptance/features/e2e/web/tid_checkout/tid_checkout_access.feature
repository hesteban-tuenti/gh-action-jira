# -*- coding: utf-8 -*-
@jira.QANOV-558323
Feature: TID Checkout access


  @jira.QANOV-558324 @TBD @e2e @jira.cv.Future @jira.link.parent_test_plan.QANOV-550712 @manual @sanity @tidgco @web
  Scenario: User sees the payment summary after selecting a product
    Given I go to "TBD_URL" web page
      And the "TBD" page is loaded
     When I click on the "pay" button
     Then the "Payment Summary" page is loaded
      And the text of the element "main_title" is equal to "Resumen de pago"
      And the "plan_title" element is displayed
      And the "plan_description" element is displayed
      And the "total_amount" textfield with the "\d+(\,\d{1,2})?€" format is displayed
      And the "total_amount_label" textfield is not displayed
      And the text of the element "continue_button" is equal to "Continuar"

  @jira.QANOV-558325 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558324 @jira.link.parent_test_plan.QANOV-550712
  @manual @sanity @tidgco @web
  Scenario: B2C user sees the billing info after clicking on continue button in the Payment Summary screen
    Given I go to "TBD_URL_SUMMARY" web page
      And user has a "B2C" account type
      And the "Payment Summary" page is loaded
     When I click on the "continue_button" button
     Then the "Billing Info" page is loaded
      And the "B2C" radiobutton is selected
      And the text of the element "main_title" is equal to "Rellena tus datos"
      And the "name" inputtext with the "Nombre (opcional)" placeholder is displayed
      And the "surname" inputtext with the "Apellidos (opcional)" placeholder is displayed
      And the "country" drop-down is displayed
      And the "email" inputtext with the "Email" placeholder is displayed
      And the text of the element "continue_button" is equal to "Continuar"
      And I go back to the previous page
      And the "Payment Summary" page is loaded

  @jira.QANOV-578632 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558325 @jira.link.parent_test_plan.QANOV-550712
  @manual @smoke @tidgco @web
  Scenario: B2C can change to B2B tab in the billing info page
    Given I go to "TBD_URL_SUMMARY" web page
      And user has a "B2C" account type
      And the "Payment Summary" page is loaded
     When I click on the "continue_button" button
      And the "Billing Info" page is loaded
      And I click on the "B2B" radiobutton
     Then the "B2B" radiobutton is selected
      And the text of the element "main_title" is equal to "Rellena tus datos"
      And the "nif" inputtext with the "NIF" placeholder is displayed
      And the "name" inputtext with the "Razón social" placeholder is displayed
      And the "email" inputtext with the "Email" placeholder is displayed
      And the "country" drop-down is displayed
      And the "postal_code" inputtext with the "Código postal" placeholder is displayed
      And the "city" inputtext with the "Localidad" placeholder is displayed
      And the "address_1" inputtext with the "Calle y Número" placeholder is displayed
      And the "address_2" inputtext with the "Portal/Escalera/Puerta/Piso (opcional)" placeholder is displayed
      And the text of the element "continue_button" is equal to "Continuar"
      And I go back to the previous page
      And the "Payment Summary" page is loaded

  @jira.QANOV-578633 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558324 @jira.link.parent_test_plan.QANOV-550712
  @manual @sanity @tidgco @web
  Scenario: B2B user sees the billing info after clicking on continue button in the Payment Summary screen
    Given I go to "TBD_URL_SUMMARY" web page
      And user has a "B2B" account type
      And the "Payment Summary" page is loaded
     When I click on the "continue_button" button
      And the "Billing Info" page is loaded
     Then the "B2B" radiobutton is not displayed
      And the text of the element "main_title" is equal to "Rellena tus datos"
      And the "nif" inputtext with the "NIF" placeholder is displayed
      And the "name" inputtext with the "Razón social" placeholder is displayed
      And the "email" inputtext with the "Email" placeholder is displayed
      And the "country" drop-down is displayed
      And the "postal_code" inputtext with the "Código postal" placeholder is displayed
      And the "city" inputtext with the "Localidad" placeholder is displayed
      And the "address_1" inputtext with the "Calle y Número" placeholder is displayed
      And the "address_2" inputtext with the "Portal/Escalera/Puerta/Piso (opcional)" placeholder is displayed
      And the text of the element "continue_button" is equal to "Continuar"
      And I go back to the previous page
      And the "Payment Summary" page is loaded

  @jira.QANOV-558326 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558325 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: B2C user can see an error when users tap on continue button without all mandatory fields filled in the B2C tab
    Given I go to "TBD_URL_SUMMARY" web page
      And user has a "B2C" account type
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
      And the "B2C" radiobutton is selected
     When I click on the "continue_button" button
     Then the text of the element "email.error_message" is equal to "Este campo es obligatorio"

  @jira.QANOV-578634 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-578632 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: B2C user can see an error when users tap on continue button without all mandatory fields filled in the B2B tab
    Given I go to "TBD_URL_SUMMARY" web page
      And user has a "B2C" account type
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When I click on the "B2B" radiobutton
      And the "B2B" radiobutton is selected
      And I click on the "continue_button" button
     Then the text of the element "nif.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "name.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "email.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "postal_code.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "address_1.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "address_2.error_message" is equal to "Este campo es obligatorio"

  @jira.QANOV-578635 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-578633 @jira.link.parent_test_plan.QANOV-550712
  @manual @regression @tidgco @web
  Scenario: B2B user can see an error when users tap on continue button without all mandatory fields filled
    Given I go to "TBD_URL_SUMMARY" web page
      And user has a "B2B" account type
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When I click on the "continue_button" button
     Then the text of the element "nif.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "name.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "email.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "postal_code.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "address_1.error_message" is equal to "Este campo es obligatorio"
      And the text of the element "address_2.error_message" is equal to "Este campo es obligatorio"

  @jira.QANOV-558327 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558325 @jira.link.depends_on.QANOV-578632
  @jira.link.depends_on.QANOV-578633 @jira.link.parent_test_plan.QANOV-550712 @manual @regression @tidgco @web
  Scenario: User can see a validation error when user fills the email input with wrong format
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When I fill in the "email" field with "mail"
     Then the text of the element "error_message" is equal to "Introduce un email válido"

  @jira.QANOV-558328 @e2e @jira.cv.Future @jira.link.depends_on.QANOV-558325 @jira.link.parent_test_plan.QANOV-550712
  @manual @smoke @tidgco @web
  Scenario: User sees the choose payment method after filling the billing info
    Only new card is shown. Saved card will be implemeted later
    Given I go to "TBD_URL_SUMMARY" web page
      And the "Payment Summary" page is loaded
      And I click on the "continue_button" button
      And the "Billing Info" page is loaded
     When fills the mandatory data
      And I click on the "continue_button" button
     Then the "Choose Payment Method" page is loaded
      And the text of the element "main_title" is equal to "Elige tu método de pago"
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" web list has the "icon" field
      And each element in the "payment_methods_list" web list has the "chevron" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Añadir tarjeta" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Bizum" text
      And the "total_amount" textfield is not displayed
      And I go back to the previous page
      And the "Billing Info" page is loaded

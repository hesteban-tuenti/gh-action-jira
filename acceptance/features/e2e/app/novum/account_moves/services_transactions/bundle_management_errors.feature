# -*- coding: utf-8 -*-
@jira.QANOV-126802 @dv.Future
Feature: Bundle Management Errors


  @jira.QANOV-9339 @android @ios @mobile @no_automatable @impeded_legacy @jira.cv.11.2
  @jira.link.depends_on.QANOV-9320 @jira.link.relates_to.NOV-119884 @moves @regression @dv.Future
  Scenario: User buys a bundle: Error processing the request
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element in the "any" position of the "bundle_list" list
      And the "Purchase Summary" page is displayed
      And clicks on the "pay_button" button
      And there is an API error
     Then the "Feedback Error" page is displayed
      And the "error_title" textfield with "Lo sentimos, no hemos podido procesar tu compra." text is displayed
      And the "error_message" textfield with "No hemos podido completar tu compra. Puedes intentarlo de nuevo más tarde, disculpa las molestias." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back_to_account" button with "Volver a mi línea" text is displayed

  @jira.QANOV-9341 @android @ios @mobile @no_automatable @impeded_legacy @jira.cv.11.2
  @jira.link.depends_on.QANOV-9320 @jira.link.relates_to.NOV-119886 @moves @regression @dv.Future
  Scenario: A prepay user goes back to bundle purchase page after an error purchasing a bundle
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element in the "any" position of the "bundle_list" list
      And the "Purchase Summary" page is displayed
      And clicks on the "pay_button" button
      And there is an API error
      And the "Feedback Error" page is displayed
      And clicks on the "retry" button
     Then the "Bundle Purchase" page is displayed
      And the "balance_title" textfield with "Tu saldo" text is displayed

  @jira.QANOV-9344 @android @ios @mobile @no_automatable @impeded_legacy @jira.cv.11.2
  @jira.link.depends_on.QANOV-9320 @jira.link.relates_to.NOV-119885 @moves @regression @dv.Future
  Scenario: Prepay user goes back to main account page after an error purchasing a bundle
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element in the "any" position of the "bundle_list" list
      And the "Purchase Summary" page is displayed
      And clicks on the "pay_button" button
      And there is an API error
      And the "Feedback Error" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.QANOV-9275 @android @ios @mobile @no_automatable @impeded_legacy @jira.cv.11.8 @dv.Future
  @jira.link.parent_test_plan.QANOV-21056 @jira.link.relates_to.NOV-195321 @moves @regression
  Scenario: Legado postpay user taps on the Contratar button of a QuickAction And error occurs while loading: Empty case error will be displayed
    internal_checkpoint="Posible QuickAction cards:
    - If no data bundle is active, then show the 5, 10 and 20GB extras
    - If the 5GB one is active, then show the 10, 20 and 40GB extras
    - If the 10GB one is active, then show the 5, 20 and 40GB extras
    - If the 20GB one is active, then show the 5, 10 and 40GB extras
    - If the 40GB one is active, then show the 5, 10 and 20GB extras"
    commented_tags="@depends_on.NOV-195309 @depends_on.NOV-195312 @depends_on.NOV-195314 @depends_on.NOV-195316"
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "link" link of any card of the "data_quick_actions" carousel
      And an error occurs while loading the confirmation action sheet
     Then the "confirmation_action" sheet is displayed
      And the "empty_case_error_title_text" textfield with "Ups, algo ha ido mal." text is displayed
      And the "empty_case_error_subtitle_text" textfield with "No podemos mostrar los paquetes de datos recomendados. Accede desde Gestionar datos o inténtalo más tarde." text is displayed

  @jira.QANOV-9284 @android @ios @mobile @no_automatable @impeded_legacy @jira.cv.11.8
  @jira.link.depends_on.QANOV-9278 @jira.link.parent_test_plan.QANOV-21056 @jira.link.relates_to.NOV-195313 @moves
  @regression @dv.Future
  Scenario: Legado postpay user confirms the data bundle purchase but an error occurs during the validation: User will be redirected to the negative feedback page
    internal_checkpoint="If the validation of the purchase is not immediate, the TEXT of the Contratar button may be replaced for 'Validando' with a loading spinner"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "none" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "link" link of the card with "any_amount" text on the "title" field of the "data_quick_actions" carousel
      And clicks on the "purchase_button" button
      And an error happens during the operation
     Then the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "No hemos podido completar tu solicitud" text is displayed
      And the "negative_feedback_subtitle" textfield with "Puedes intentarlo de nuevo más tarde, disculpa las molestias." text is displayed
      And the "back_to_account" button with "Entendido" text is displayed
      And receives a "operation_failed" notification

  @jira.QANOV-9304 @android @ios @mobile @no_automatable @impeded_legacy @jira.cv.11.8 @dv.Future
  @jira.link.parent_test_plan.QANOV-21056 @jira.link.relates_to.NOV-195311 @moves @regression
  Scenario: Legado postpay user confirms the data bundle purchase but an error occurs during the validation: User will be redirected to the negative feedback page
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has "data" allowances in the "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "link" link of the card with "any_amount" text on the "title" field of the "data_quick_actions" carousel
      And clicks on the "purchase_button" button
      And an error happens during the operation
     Then the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "No hemos podido completar tu solicitud" text is displayed
      And the "negative_feedback_subtitle" textfield with "Puedes intentarlo de nuevo más tarde, disculpa las molestias." text is displayed
      And the "back_to_account" button with "Entendido" text is displayed
      And receives a "operation_failed" notification

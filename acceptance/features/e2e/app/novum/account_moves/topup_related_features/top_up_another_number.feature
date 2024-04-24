@jira.QANOV-9430
Feature: Topup another number


  Actions Before the Feature:
    Given user has a "legado prepay" account type
     And user has the "services-summary" module configured in CMS for "dashboard" page


  @jira.QANOV-182678 @android @ios @jira.cv.13.0 @no_automatable @mobile @moves @regression @impeded_legacy
  Scenario: A user can see the "Recarga saldo a otra línea" entry point
    Given And user has a "legado" account type
      And user has a "fusion" plan
      And user has a list of entrypoints configured in CMS for "mobile" page
      And the list of entrypoints configured in CMS has a "preconfigured" entrypoint
      And the entrypoint configured in CMS has the "topup-for-others" preconfiguration
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "entrypoint" textfield with "Recarga saldo a otra línea" text is displayed

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable
  @jira.link.relates_to.<relates_to> @moves @regression @impeded_legacy @jira.link.detects.MOVES-5231
  Scenario Outline: Legado user can access "Recarga saldo a otra línea"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "services.top_up_another_number" entrypoint
     Then the "Topup Another Number" page is displayed
      And the "Recarga de saldo a otra línea" header is displayed
      And the "another_number_introduction_summary" textfield with "Línea Movistar prepago a recargar" text is displayed
      And the "phone_number_to_topup" inputtext with "Número de línea" text is displayed
      And the "phonebook" icon is displayed
      And the "add_from_phonebook" link with "Añadir desde agenda" text is displayed
      And the "payment_button" button with "Seleccionar cantidad" text is displayed
      And the "payment_button" webview element is disabled
      And the "payment_secure_text" textfield with "100% seguro" text is displayed

    Examples:
      | relates_to | account_type   | plan     | jira_id    |
      | NOV-135486 | legado postpay | fusion   | QANOV-9431 |
      | NOV-119907 | legado postpay | monoline | QANOV-9433 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-119908 @moves @regression
  Scenario Outline: User introduces a number to topup: "Seleccionar cantidad" is enabled
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Topup Another Number" page
     When fills the "phone_number_to_topup" inputtext with the "0" text
     Then the "payment_button" button is enabled

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9437 | QANOV-9431 |
      | legado postpay | monoline | QANOV-9439 | QANOV-9433 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-119909 @moves @regression
  Scenario Outline: User can select a number to topup from phonebook
    internal_checkpoint="
    User's phonebook will be shown with all his/her contacts,
    in the future maybe only Movistar contacts will be shown"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Topup Another Number" page
     When clicks on the "add_from_phonebook" link
     Then the "Native Phonebook" app is displayed

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9443 | QANOV-9431 |
      | legado postpay | monoline | QANOV-9445 | QANOV-9433 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-119910 @moves @regression
  Scenario Outline: User selects a Movistar prepay contact form its phonebook: User can continue the topup flow
    internal_checkpoint="
    User's phonebook will be shown with all his/her contacts,
    in the future maybe only Movistar contacts will be shown"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Topup Another Number" page
     When clicks on the "add_from_phonebook" link
      And the "Native Phonebook" app is displayed
      And clicks on a valid mobile line in the phonebook
     Then the "Topup Another Number" page is displayed
      And the "Recarga de saldo a otra línea" header is displayed
      And the "phone_number_to_topup" inputtext is filled with the "[CONTEXT: selected_phone_number]" text
      And the "payment_button" button is enabled

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9447 | QANOV-9443 |
      | legado postpay | monoline | QANOV-9448 | QANOV-9445 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-119913 @moves @regression
  Scenario Outline: User sees different amounts to topup
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Topup Another Number" page
     When fills the "phone_number_to_topup" inputtext with the "655555555" text
      And clicks on the "payment_button" button
     Then the "Top Up Amount Selection To Other" page is displayed
      And the "Recarga de saldo a otra línea" header is displayed
      And the "select_amount_text" textfield with "Elige la cantidad que deseas recargar" text is displayed
      And the amount buttons with texts "5 €;10 €;15 €;20 €;25 €;30 €" are displayed
      And the "payment_secure_text" textfield with "100% seguro" text is displayed

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9450 | QANOV-9431 |
      | legado postpay | monoline | QANOV-9451 | QANOV-9433 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-119915 @moves @regression
  Scenario Outline: User is redirected to a summary screen after selecting an amount to topup
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Top Up Amount Selection To Other" page
      And user has a "legado postpay" account associated
     When clicks on any of the amount buttons
     Then the "Top Up Summary To Other" page is displayed
      And the "phone_number_field_title" textfield with "Número de teléfono" text is displayed
      And the "phone_number_field_number" textfield with the "6XX XX XX XX" format is displayed
      And the "top_up_amount_field_title" textfield with "Cantidad de la recarga" text is displayed
      And the "top_up_amount_field_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "select_payment_method" button with "Seleccionar método de pago" text is displayed
      And the "payment_secure_text" textfield with "100% seguro" text is displayed

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9453 | QANOV-9450 |
      | legado postpay | monoline | QANOV-9454 | QANOV-9451 |


  @jira.QANOV-9456 @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy @jira.link.depends_on.QANOV-9453
  @jira.link.depends_on.QANOV-9454 @moves @regression
  Scenario: Legados selects the payment method to make the top-up: some options to make the top-up will be displayed
    Given user has a "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Top Up Summary To Other" page
     When clicks on the "select_payment_method" button
     Then the "Top Up Payment Selection To Other" page is displayed
      And the "amount_to_top_up_field_title" textfield with "Cantidad que vas a recargar" text is displayed
      And the "amount_to_top_up_field_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "select_payment_method_text" textfield with "Selecciona método de pago" text is displayed
      And the "credit_card_option" entrypoint with "Tarjeta de débito/crédito" text is displayed
      And the "against_invoice_option" entrypoint with "Contra factura" text is displayed
      And the "payment_secure_text" textfield with "100% seguro" text is displayed


  @jira.QANOV-9457 @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.QANOV-9456 @jira.link.relates_to.NOV-119920 @moves @regression
  Scenario: Legado user with only one billing account can see its plan to charge the topup
    Given user has "1" "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Top Up Payment Selection To Other" page
     When clicks on the "against_invoice_option" entrypoint
     Then the "Against Invoice Payment To Other" page is displayed
      And the "amount_to_top_up_field_title" textfield with "Cantidad que vas a recargar" text is displayed
      And the "amount_to_top_up_field_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "against_invoice_summary" textfield with "Selecciona una cuenta de facturación para realizar el pago" text is displayed
      And the "against_invoice_plan_selector" list is displayed
      And each element in the "against_invoice_plan_selector" list has the "plan_name" field
      And each element in the "against_invoice_plan_selector" list has the "plan_switch" field
      And the "plan_switch" switch of the element in the "0" position of the "against_invoice_plan_selector" list is shown enabled
      And the "against_invoice_plan_selector" list has "1" entries
      And the "payment_button" button with "Pagar" text is displayed
      And the "payment_button" button is enabled
      And the "payment_secure_text" textfield with "100% seguro" text is displayed


  @jira.QANOV-9458 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9456
  @jira.link.relates_to.NOV-119917 @moves @regression @impeded_legacy
  Scenario: Legado user with more than one postpay plan can see his/her plans to charge the topup
    internal_checkpoint=" User in DEV to test: 02000029J"
    Given user has "several" "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Top Up Payment Selection To Other" page
     When clicks on the "against_invoice_option" entrypoint
     Then the "Against Invoice Payment To Other" page is displayed
      And the "amount_to_top_up_field_title" textfield with "Cantidad que vas a recargar" text is displayed
      And the "amount_to_top_up_field_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "against_invoice_summary" textfield with "Selecciona una cuenta de facturación para realizar el pago" text is displayed
      And the "against_invoice_plan_selector" list is displayed
      And each element in the "against_invoice_plan_selector" list has the "plan_name" field
      And each element in the "against_invoice_plan_selector" list has the "plan_switch" field
      And each "plan_switch" switch of the "against_invoice_plan_selector" list is shown disabled
      And the "against_invoice_plan_selector" list has "several" entries
      And the "payment_button" button with "Pagar" text is displayed
      And the "payment_button" button is disabled
      And the "payment_secure_text" textfield with "100% seguro" text is displayed


  @jira.QANOV-9459 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9456
  @jira.link.relates_to.NOV-119921 @moves @regression @impeded_legacy
  Scenario: Legado user with more than one postpay plan can select a plan to charge the topup
    internal_checkpoint=" User in DEV to test: 02000029J"
    Given user has "several" "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Against Invoice Payment To Other" page
      And the "against_invoice_plan_selector" list is displayed
      And each "plan_switch" switch of the "against_invoice_plan_selector" list is shown disabled
     When clicks on the "plan_switch" field of the element in the "0" position of the "against_invoice_plan_selector" list
     Then the "payment_button" button is enabled


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.QANOV-9457 @jira.link.depends_on.QANOV-9459 @jira.link.relates_to.NOV-119922 @moves @regression
  Scenario Outline: Legado user with <postpay_plans> postpay plan/s can successfully complete a topup against invoice to another number
    Given user has "<postpay_plans>" "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Against Invoice Payment To Other" page
      And the "against_invoice_plan_selector" list is displayed
      And the "plan_switch" switch of the element in the "0" position of the "against_invoice_plan_selector" list is shown enabled
     When clicks on the "payment_button" button
     Then the "Feedback Success" page is displayed
      And the "positive_feedback_icon" icon is displayed
      And the "success_title" textfield with the "Tu solicitud de recarga de XX,XX€ para la línea 6XX XXX XXX se ha realizado correctamente" format is displayed
      And the "success_message" textfield with "En breve recibirás un SMS de confirmación" text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    Examples:
      | postpay_plans | jira_id    |
      | 1             | QANOV-9460 |
      | several       | QANOV-9461 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-119925 @moves @regression
  Scenario Outline: User goes back to main account screen after having done a topup to another nomber against invoice request
    Given user has "<postpay_plans>" "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Against Invoice Payment To Other" page
      And the "against_invoice_plan_selector" list is displayed
      And the "plan_switch" switch of the element in the "0" position of the "against_invoice_plan_selector" list is shown enabled
     When clicks on the "payment_button" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Mobile Line Dashboard" page is displayed

    Examples:
      | postpay_plans | jira_id    | depends_on |
      | 1             | QANOV-9462 | QANOV-9460 |
      | several       | QANOV-9463 | QANOV-9461 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136903 @moves @regression @jira.link.detects.OBMOVES-314 @impeded_legacy
  Scenario Outline: User cannot top-up against invoice to another number to a Postpay Movistar España user
    internal_checkpoint=" The 686401312 is a TELCO Postpay Movistar Spain user, but any other postpay user is valid"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has a "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Topup Another Number" page
     When fills the "phone_number_to_topup" inputtext with the "686401312" text
      And clicks on the "payment_button" button
      And the "Top Up Amount Selection To Other" page is displayed
      And clicks on any of the amount buttons
      And the "Top Up Summary To Other" page is displayed
      And clicks on the "select_payment_method" button
      And the "Top Up Payment Selection To Other" page is displayed
      And clicks on the "against_invoice_option" entrypoint
      And the "Against Invoice Payment To Other" page is displayed
      And the "plan_switch" switch of the element in the "0" position of the "against_invoice_plan_selector" list is shown enabled
      And clicks on the "payment_button" button
     Then the "Feedback Ko" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield is displayed
      And the "negative_feedback_subtitle" textfield is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9464 | QANOV-9431 |
      | legado postpay | monoline | QANOV-9465 | QANOV-9431 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-136904 @moves @regression @jira.link.detects.OBMOVES-314 @impeded_legacy
  Scenario Outline: User cannot top-up against invoice to another number to a non Movistar España user
    internal_checkpoint=" The 600000000 is a Non Movistar Spain user, but any other postpay user is valid"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "<plan>" plan
      And user has a "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Topup Another Number" page
     When fills the "phone_number_to_topup" inputtext with the "600000000" text
      And clicks on the "payment_button" button
      And the "Top Up Amount Selection To Other" page is displayed
      And clicks on any of the amount buttons
      And the "Top Up Summary To Other" page is displayed
      And clicks on the "select_payment_method" button
      And the "Top Up Payment Selection To Other" page is displayed
      And clicks on the "against_invoice_option" entrypoint
      And the "Against Invoice Payment To Other" page is displayed
      And the "plan_switch" switch of the element in the "0" position of the "against_invoice_plan_selector" list is shown enabled
      And clicks on the "payment_button" button
     Then the "Feedback Ko" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield is displayed
      And the "negative_feedback_subtitle" textfield is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    Examples:
      | account_type   | plan     | jira_id    | depends_on |
      | legado postpay | fusion   | QANOV-9467 | QANOV-9431 |
      | legado postpay | monoline | QANOV-9468 | QANOV-9431 |


  @jira.<jira_id> @android @ios @mobile @jira.cv.11.15 @no_automatable @impeded_legacy
  @jira.link.depends_on.QANOV-9456 @jira.link.relates_to.NOV-136807 @moves @regression
  Scenario Outline: <account_type> user with at least one postpay plan can access to the credit card introduction view
    other_affected_versions="2020-47"
    Given user has a "legado postpay" account type
      And user has a "<plan>" plan
      And user has a "legado postpay" account associated
      And user has the matching subscription selected in the account
      And user is in the "Top Up Payment Selection To Other" page
     When clicks on the "credit_card_option" entrypoint
     Then the browser webview is displayed
      And the "Recargar saldo" header is displayed

    Examples:
      | plan     | jira_id    |
      | fusion   | QANOV-9472 |
      | monoline | QANOV-9473 |

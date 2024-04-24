# -*- coding: utf-8 -*-
@jira.QANOV-477261
Feature: Recurrent Payment Deactivation - Novo App


  @jira.QANOV-477263 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with recurrent payment enabled can access to the screen to disable the service
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
     Then the "Payment Summary" page is displayed
      And the "main_title" textfield with "Você quer desativar o pagamento automático?" text is displayed
      And the "subtitle" textfield with "Você não vai mais pagar as suas faturas de forma automática pra evitar atrasos e multas" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_text" textfield with "Na fatura do cartão" text is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "disable" button with "Desativar pagamento automático" text is displayed
      And the "terms_link" link is not displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477264 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user with recurrent payment enabled can disable it and sees the feedback success screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você desativou o pagamento automático" text is displayed
      And the "success_message" textfield with "Você vai receber uma confirmação da desativação por SMS A partir do próximo mês, você precisa lembrar de pagar suas faturas até a data de vencimento" text is displayed
      And the "ok_button" button with "Ir para o início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-477265 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477264
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled returns to Account after disabling Recurrent Payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
     Then the "Assinaturas" page is displayed

  @jira.QANOV-477266 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user recurrent payment enabled tries to disable Recurrent Payment with an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
      And there is an error disabling recurrent payment
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o cartão de crédito" text is displayed
      And the "error_message" textfield with "Você pode tentar de novo. Se o erro continuar, entre em contato com o banco" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477268 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477266
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on retry button after disabling Recurrent Payment with an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
      And there is an error disabling recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Payment Summary" page is displayed

  @jira.QANOV-477270 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477266
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on back button after disabling Recurrent Payment with an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
      And there is an error disabling recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477271 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user recurrent payment enabled tries to disable Recurrent Payment and deactivation is pending
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
      And the result of the deactivation is unknown
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Estamos desativando o pagamento automático" text is displayed
      And the "error_message" textfield with "Em instantes ele será desativado e você poderá conferir em Gerenciar cartões" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477272 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477271
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on back button after disabling Recurrent Payment while deactivation is pending
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Payment Summary" page is displayed
      And clicks on the "disable" button
      And the result of the deactivation is unknown
      And the "Feedback Payment Success" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477273 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: Recurrent payment service is disabled when user has an expired card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has "1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When the recurrent payment date is reached
      And clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
     Then the "Bills Details" page is displayed
      And the "recurrent_payment_entrypoint" textfield with "Pagamento automático" text is displayed
      And the "recurrent_payment_description" textfield with the "Ative pra evitar multas e atrasos" format is displayed

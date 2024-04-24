# -*- coding: utf-8 -*-
@jira.QANOV-477246
Feature: Modify Recurrent Payment once enabled  - Novo App


  @jira.QANOV-477247 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with recurrent payment enabled accesses to Manage Recurrent Payment screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
     Then the "Manage Recurrent Payment" page is displayed
      And the "main_title" textfield with "Pagamento automático" text is displayed
      And the "subtitle" textfield with "O pagamento automático está ativo " text is displayed
      And the "selected_card" module is displayed
      And the "selected_card.title" textfield with "CARTÃO ATIVO" text is displayed
      And the "selected_card.company_icon" icon is displayed
      And the "selected_card.last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) ••••\d\d\d\d" format is displayed
      And the "selected_card.expiration" textfield with the "\d{2}\/\d{2}" format is displayed
      And the "other_options" textfield with "GENENCIE" text is displayed
      And waits until the "other_options_module" element is visible
      And the "other_options_list" list is displayed
      And the "other_options_list" list has "2" elements
      And each element in the "other_options_list" list has the "chevron" field
      And the "0" index in the "other_options_list" list has the "name" field with "Trocar cartão de crédito" text
      And the "1" index in the "other_options_list" list has the "name" field with "Desativar pagamento automático" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477248 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with recurrent payment enabled sees the available credit cards to modify recurrent payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Em qual cartão você quer ativar o pagamento automático?" text is displayed
      And the "subtitle" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has ">1" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the element in "0" position in the "payment_methods_list" list has the "payment_description" field with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And any element in the "payment_methods_list" list has the "payment_description" button with the "Novo cartão de crédito" text
      And the "payment_methods_link" link with "Gerenciar cartões" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477249 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled and expired card saved cannot use an expired card for recurrent
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has ">=1" expired cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
     Then the "Choose Payment Method" page is displayed
      And any element in the "payment_methods_list" list has the "payment_message" button with the "Cartão de crédito expirado" text
      And the element with "Cartão de crédito expirado" text in the "payment_message" button in the "payment_methods_list" list is disabled

  @jira.QANOV-477250 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled cannot modify card for recurrent payment with the same one
    TO BE DEFINED
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has "1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
     Then the "Choose Payment Method" page is displayed
      And the "TBD" element is on display

  @jira.QANOV-477251 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with recurrent payment enabled sees a summary screen after selecting the card to change recurrent payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
     Then the "Payment Summary" page is displayed
      And the "main_title" textfield with "Quer trocar o cartão de crédito para pagamento?" text is displayed
      And the "subtitle" textfield with "Suas próximas faturas serão pagas por meio dele" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_text" textfield with "Na fatura do cartão" text is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "modify" button with "Confirmar troca" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477252 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user with recurrent payment enabled can change the card used for recurrent payment and sees the feedback screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você trocou o cartão para pagamento automático" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_text" textfield with "Na fatura do cartão" text is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "billing_date_label" textfield with "Data de cobrança" text is displayed
      And the "billing_date" textfield with the "Todo dia ^\d{1,2}$" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-477253 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477252
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled returns to Account after changing the card used for recurrent payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477255 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled tries to change the card used for recurrent payment and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
      And there is an error modifying the card used for recurrent payment
     Then the "Feedback Payment Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Algo deu errado ao trocar o cartão" text is displayed
      And the "error_message" textfield with "Tente de novo mais tarde. Se o erro continuar, entre em contato com o banco" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477257 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477255
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on retry button after trying to modify the recurrent payment card with a saved one with an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
      And there is an error modifying the card used for recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Payment Summary" page is displayed

  @jira.QANOV-477258 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477255
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on back button after trying to modify the recurrent payment card with a saved one with an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
      And there is an error modifying the card used for recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477259 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled tries to change the card used for recurrent payment and change is pending
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
      And the card modificitation is pending
     Then the "Feedback Payment Error" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Estamos trocando seu cartão para pagamento automático" text is displayed
      And the "error_message" textfield with "Em instantes ele será atualizado e você poderá conferir em Gerenciar cartões" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477260 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477259
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on back button after trying to modify the recurrent payment card with a saved one and change is pending
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "0" element in the "other_options_list" list
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "modify" button
      And the card modificitation is pending
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-477274
Feature: Recurrent Payment with new card - Novo App


  @jira.QANOV-477275 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user without credit cards saved and recurrent payment in disabled status activates it with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And the "pay" button displays a spinner in it
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você ativou o pagamento automático" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "card_label" textfield with the "Na fatura do cartão" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And card with number "4761120000000148" is saved in the payment methods area

  @jira.QANOV-477276 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477275
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user without credit cards saved returns to AccountDetails after activating recurrent payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477277 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with <3 credit cards saved and recurrent payment disabled activate it with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "<3" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você ativou o pagamento automático" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "billing_period_label" textfield with "Data de cobrança" text is displayed
      And the "billing_period" textfield with the "Todo dia ^\d{1,2}$" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And card with number "4761120000000148" is saved in the payment methods area

  @jira.QANOV-477279 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user recurrent payment disabled tries to enable Recurrent Payment with a new card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And there is an error enabling recurrent payment
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o cartão de crédito" text is displayed
      And the "error_message" textfield with "Tente de novo mais tarde. Se o erro continuar, entre em contato com o banco" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477280 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477279
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on retry button after trying to enable Recurrent Payment with a new card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And there is an error enabling recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-477281 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477279
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on back button after after trying to enable Recurrent Payment with a new card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And there is an error enabling recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477282 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled tries to enable Recurrent Payment with a new card and is pending activation
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And the recurrent payment activation is pending
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Estamos ativando o pagamento automático" text is displayed
      And the "error_message" textfield with "Em instantes ele será ativado e você poderá conferir em Gerenciar cartões" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And card with number "4761120000000148" is saved in the payment methods area

  @jira.QANOV-477284 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477282
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on back button after trying to enable Recurrent Payment with a new card and there is pending activation
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "enable" button
      And the recurrent payment activation is pending
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477285 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled sees an error after waiting 180 seconds in the add new card screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "<3" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And waits "180" seconds
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Para continuar com a ativação, você precisa tentar de novo" text is displayed
      And the "informative_message" textfield with "Percebemos que você ficou ausente do app por algum tempo. Por segurança, tente de novo" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477286 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477285
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on retry button after trying to enable Recurrent Payment and wait 180 seconds in the add new card screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "<3" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And waits "180" seconds
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-477287 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477285
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on back button after after trying to enable Recurrent Payment and wait 180 seconds in the add new card screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "<3" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And waits "180" seconds
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477289 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user without credit cards saved and recurrent payment in disabled status tries to enable it with a debit card and sees an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "TBD" text
      And fills the "expiration_date.input" inputtext with the "TBD" text
      And fills the "cvv.input" inputtext with the "TBD" text
      And clicks on the "enable" button
     Then the "TBD" page is displayed

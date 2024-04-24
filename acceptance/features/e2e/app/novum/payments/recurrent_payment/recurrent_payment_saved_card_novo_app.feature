# -*- coding: utf-8 -*-
@jira.QANOV-477291
Feature: Recurrent Payment with saved card - Novo App


  @jira.QANOV-477292 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with credit cards saved and recurrent payment in disabled status sees a summary screen before activate it
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
     Then the "Payment Summary" page is displayed
      And the "main_title" textfield with "Quase lá! Só falta confirmar suas informações para finalizar" text is displayed
      And the "subtitle" textfield with "Você vai pagar as próximas faturas direto no seu cartão de crédito" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_text" textfield with "Na fatura do cartão" text is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "terms_link" textfield with "Ao confirmar, você aceita nossos termos e condições" text is displayed
      And the "enable" button with "Ativar pagamento automático" text is displayed
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.back_button" button
      And the "Choose Payment Method" page is displayed

  @jira.QANOV-477293 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477292
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user can see terms and conditions through "Payment Summary" screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "terms_link" button
     Then the internal webview is displayed
      And the "main_title" textfield with "TERMO DE USO - CONDIÇÕES DO PAGAMENTO MENSAL DA FATURA VIVO COM CARTÃO DE CRÉDITO" text is displayed
      And the "pagar a fatura Vivo com cartão de crédito está disponível" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Payment Summary" page is displayed

  @jira.QANOV-477294 @ber @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477292
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user with credit cards saved and recurrent payment in disabled status activate it with a saved card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você ativou o pagamento automático" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "card_label" textfield with the "Na fatura do cartão" format is displayed
      And the "billing_date_label" textfield with "Data de cobrança" text is displayed
      And the "billing_date" textfield with the "Todo dia ^\d{1,2}$" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "ok_button" button with "Ir pro início" text is displayed

  @jira.QANOV-477295 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477294
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with credit cards saved and recurrent payment in disabled status return to Assinatura after activating it with a saved card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477296 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with expired credit cards saved and recurrent payment in disabled status cannot activate recurrent payment by expired credit card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" expired cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "recurrent_payment_entrypoint" button
     Then the "Choose Payment Method" page is displayed
      And any element in the "payment_methods_list" list has the "payment_message" button with the "Cartão de crédito expirado" text
      And the element with "Cartão de crédito expirado" text in the "payment_message" button in the "payment_methods_list" list is disabled

  @jira.QANOV-477297 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled tries to enable Recurrent Payment with a saved card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
      And there is an error enabling recurrent payment
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o cartão de crédito" text is displayed
      And the "error_message" textfield with "Tente de novo mais tarde. Se o erro continuar, entre em contato com o banco" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-477298 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477297
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on retry button after trying to enable Recurrent Payment with a saved card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
      And there is an error enabling recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-477299 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477297
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on back button after after trying to enable Recurrent Payment with a saved card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
      And there is an error enabling recurrent payment
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477300 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user recurrent payment disabled tries to enable Recurrent Payment with a saved card and is pending activation
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
      And the recurrent payment activation is pending
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Estamos ativando o pagamento automático" text is displayed
      And the "error_message" textfield with "Em instantes ele será ativado e você poderá conferir em Gerenciar cartões" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And card with number "4761120000000148" is saved in the payment methods area

  @jira.QANOV-477301 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-477300
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment disabled taps on back button after after trying to enable Recurrent Payment with a saved card and there is pending activation
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
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
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And clicks on the "enable" button
      And the recurrent payment activation is pending
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-550608 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454026 @jira.link.depends_on.QANOV-477293
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user activates Pagamento recurrente succesfully from the invoice payment flow
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Summary" page
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
     When clicks on the "pagamento_automatico_box.checkbox" button
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "billing_period_label" textfield with "Pagamento automático" text is displayed
      And the "billing_period" textfield with the "Todo dia ^\d{1,2}$" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "update_message" textfield with "Vamos atualizar suas faturas como pagas em até 48h" text is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And clicks on the "ok_button" button
      And the "Assinatura" page is displayed

  @jira.QANOV-550609 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454026 @jira.link.depends_on.QANOV-477293
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @regression @vivobr
  Scenario: A no legacy user wants to activate Pagamento recurrente from the invoice payment flow: invoice is paid but recurrent payment is not active
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Summary" page
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
     When clicks on the "pagamento_automatico_box.checkbox" button
      And clicks on the "pay" button
      And invoice is paid succesfully
      And an error occurs activating recurrent payment
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura, mas o pagamento automático não foi ativado" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "update_message" textfield with "Você ainda pode ativar o pagamento automático nas próximas faturas" text is displayed
      And the "automatic_payment_retry" button with "Ativar pagamento automático" text is displayed
      And the "back" button with "Ir pro inicio" text is displayed

  @jira.QANOV-550610 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454026 @jira.link.depends_on.QANOV-477293
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @regression @vivobr
  Scenario: A no legacy user wants to activate Pagamento recurrente from the invoice payment flow: invoice is paid but recurrent payment is pending for activation
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Summary" page
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
     When clicks on the "pagamento_automatico_box.checkbox" button
      And clicks on the "pay" button
      And invoice is paid succesfully
      And recurrent payment activation is pending
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você pagou sua fatura, e o pagamento automático está sendo processado" text is displayed
      And the "summary_label" textfield with "Pagamento" text is displayed
      And the "summary_date" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "amount_label" textfield with the "Valor" format is displayed
      And the "amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "card_label" textfield with the "Cartão de crédito" format is displayed
      And the "card" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format is displayed
      And the "update_message" textfield with "Você pode conferir em até 48h na opção Pagamento automático dentro do menu do app" text is displayed
      And the "back" button with "Ir pro inicio" text is displayed

  @jira.QANOV-550611 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454026 @jira.link.depends_on.QANOV-477293
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @regression @vivobr
  Scenario: A no legacy user wants to activate Pagamento recurrente from the invoice payment flow: invoice is pending and recurrent payment activation has not been tried
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Summary" page
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
     When clicks on the "pagamento_automatico_box.checkbox" button
      And clicks on the "pay" button
      And invoice payment is pending
      And recurrent payment activation has not been tried
     Then the "Feedback Payment Error" page is displayed
      And the "info_icon" icon is displayed
      And the "feedback_title" textfield with "Estamos processando o pagamento" text is displayed
      And the "feedback_subtitle" textfield with "Você pode conferir, em até 48h na Central de faturas, se a fatura foi paga" text is displayed
      And the "feedback_description" textfield with the "Mas o seu cartão de crédito, final •••• \d\d\d\d, já foi adicionado para você tentar de novo agora ou mais tarde" format is displayed
      And the "back" button with "Ir pro inicio" text is displayed

  @jira.QANOV-550612 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-454026 @jira.link.depends_on.QANOV-477293
  @jira.link.parent_test_plan.QANOV-439542 @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @regression @vivobr
  Scenario: A no legacy user wants to activate Pagamento recurrente from the invoice payment flow: invoice is KO and recurrent payment activation has not been tried
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Payment Summary" page
      And the "pagamento_automatico_box.checkbox" checkbox is disabled
     When clicks on the "pagamento_automatico_box.checkbox" button
      And clicks on the "pay" button
      And invoice payment is KO
      And recurrent payment activation has not been tried
     Then the "Feedback Payment Error" page is displayed
      And the "info_icon" icon is displayed
      And the "feedback_title" textfield with "Algo deu errado com o pagamento" text is displayed
      And the "feedback_description" textfield with the "Mas o seu cartão de crédito, final •••• \d\d\d\d, já foi adicionado para você tentar de novo agora ou mais tarde" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir pro inicio" text is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-95687
Feature: Modify Recurrent Payment once enabled

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-95688 @android @automatic @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-4548 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @sanity @vivobr
  Scenario: A no legacy user with recurrent payment enabled access to Manage Recurrent Payment screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
     Then the "Manage Recurrent Payment" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Pagamento automático com cartão de crédito" text is displayed
      And the "current_card_info" textfield with "Minha fatura está sendo paga todo mês com:" text is displayed
      And the "selected_card" module is displayed
      And the "selected_card.company_icon" icon is displayed
      And the "selected_card.last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) ••••\d\d\d\d" format is displayed
      And the "selected_card.expiration" textfield with the "\d{2}\/\d{2}" format is displayed
      And the "other_options" textfield with "OPÇOES" text is displayed
      And waits until the "other_options_module" element is visible
      And the "other_options_list" list is displayed
      And the "other_options_list" list has "2" elements
      And each element in the "other_options_list" list has the "chevron" field
      And the "0" index in the "other_options_list" list has the "name" field with "Escolher outro cartão de crédito" text
      And the "1" index in the "other_options_list" list has the "name" field with "Desativar o serviço" text
      And switches to original frame

  @jira.QANOV-95689 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @smoke @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can access to the screen to select a new card
    This screen in the same that QANOV-22043, so the validations, errors are the same and flow to add a new one are the same
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
     Then the "Enable With Saved Card" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Quero fazer pagamento automático com o cartão:" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "available_cards_label" textfield with "CARTÕES DISPONÍVEIS" text is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) ••••\d\d\d\d" format
      And each element in the "cards_list" list has the "expiration" textfield with the "\d{2}\/\d{2}" format
      And any element in the "cards_list" list has the "selected" field
      And the "add_card" textfield with "Adicionar cartão" text is displayed
      And the "enable" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-95690 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95689 @old_app 
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled sees an error popup when trying to select the same card for recurrent payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "enable" entrypoint
      And waits until the "dialog" element is visible
     Then the "dialog" module is displayed
      And the "dialog.title" textfield with "Nenhuma mudança foi feita" text is displayed
      And the "dialog.message" textfield with "Você precisa trocar ou cadastrar um novo cartão de crédito para mudar o pagamento automático" text is displayed
      And the "dialog.accept" button with "OK" text is displayed

  @jira.QANOV-95691 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95690 @old_app 
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can close the popup after seleting the same card for recurrent payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And waits until the "enable" element is visible
      And clicks on the "enable" entrypoint
      And waits until the "dialog" element is visible
      And the "dialog" module is displayed
      And clicks on the "dialog.accept" button
     Then the "dialog" module is not displayed
      And the "Enable With Saved Card" page is displayed

  @jira.QANOV-95692 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @smoke @vivobr 
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can modify successfully the selected card by another saved one
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "unselected_cards" list
      And clicks on the "enable" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with the "Você mudou o pagamento automático pro cartão ••••\d\d\d\d." format is displayed
      And the "success_message2" textfield with the "Pode ser que ainda aconteça um pagamento no cartão anterior ••••\d\d\d\d, confira na sua fatura." format is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And switches to original frame
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

  @jira.QANOV-95693 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95692 @old_app 
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can return to account screen after modifying the card for recurrent payment by another saved one
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "unselected_cards" list
      And clicks on the "enable" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
      And switches to original frame
     Then the "Account" page is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @jira.link.detects.CHECKOUT-2118
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user with several cards saved and with recurrent payment enabled can modify successfully the selected card by a new one
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with the "Você mudou o pagamento automático pro cartão ••••\d\d\d\d." format is displayed
      And the "success_message2" textfield with the "Pode ser que ainda aconteça um pagamento no cartão anterior ••••\d\d\d\d, confira na sua fatura." format is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And switches to original frame
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-95694  |
          | ios     | manual    | QANOV-218979 |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-95694 @old_app 
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @mobile @qa @regression @vivobr
  Scenario Outline: A no legacy user with several cards saved and with recurrent payment enabled can return to Account screen after modifying the card for recurrent payment by a new one
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "other_options_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "add_card" button
      And the "Add New Card Recurrent Payment" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "pay" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
      And switches to original frame
     Then the "Account" page is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-95695  |
          | ios     | manual    | QANOV-218980 |

  @jira.QANOV-95696 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled tries to modify the selected card by another saved one. Payment processed unsuccessfully due to DCP payment error
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "1" element in the "cards_list" list
      And clicks on the "modify_card" button
      And there is an error with the payment
     Then the "Feedback Recurrent Payment Card Modified Error" page is displayed
      And the "error_title" textfield with "Algo deu errado por aquí" text is displayed
      And the "error_title" textfield with "Ocorreu um problema ao alterar seu cartão. Por favor, tente novamente. Se o problema persistir, tente mais tarde." text is displayed
      And the "retry" button with "OK, tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed

  @jira.QANOV-95697 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95696 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can retry the card modification after an error
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And switches to "iframe" iframe
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "1" element in the "cards_list" list
      And clicks on the "modify_card" button
      And there is an error with the payment
      And the "Feedback Recurrent Payment Card Modified Error" page is displayed
      And clicks on the "retry" button
     Then the "Enable With Saved Card" page is displayed

  @jira.QANOV-95698 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95696 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can return to bills screen after trying to modify the card for recurrent payment by another saved one with an error
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "1" element in the "cards_list" list
      And clicks on the "modify_card" button
      And there is an error with the payment
      And the "Feedback Recurrent Payment Card Modified Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-95699 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled tries to modify the selected card by another saved one. Payment result unknown
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "1" element in the "cards_list" list
      And clicks on the "modify_card" button
      And the result of the payment is unknown
     Then the "Feedback Recurrent Payment Card Modified Pending" page is displayed
      And the "error_title" textfield with "Estamos tentando alterar seu cartão de crédito ainda" text is displayed
      And the "error_title" textfield with "Você pode vontar depois para ver se deu tudo certo ou consultar o status em minhas faturas " text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-95700 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95699 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can retry the card modification after a pending status
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "1" element in the "cards_list" list
      And clicks on the "modify_card" button
      And the result of the payment is unknown
      And the "Feedback Recurrent Payment Card Modified Pending" page is displayed
      And clicks on the "retry" button
     Then the "Enable With Saved Card" page is displayed

  @jira.QANOV-95701 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95699 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can return to bills screen after trying to modify the card for recurrent payment by another saved one with an pending status
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "1" element in the "cards_list" list
      And clicks on the "modify_card" button
      And the result of the payment is unknown
      And the "Feedback Recurrent Payment Card Modified Pending" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-95702 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can tries to modify the selected card by a new one. Payment error. Card not saved
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "enable" button
      And there is an error saving the card
      And there is an error with the payment
     Then the "Feedback Recurrent Payment Card Modified Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o pagamento da sua fatura" text is displayed
      And the "error_message" textfield with the "Mas a gente já salvou o seu cartão aqui pra você tentar de novo mais tarde. Se o problema continuar, entre em contato com a administradora do seu cartão \*\*\*\*\d\d\d\d" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And card_number "[CONF:invoice_payment.valid_card_number]" is not saved in payment methods area

  @jira.QANOV-95703 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95702 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can retry the card modification after an error with the payment and saving the card
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "enable" button
      And there is an error saving the card
      And there is an error with the payment
      And the "Feedback Recurrent Payment Card Modified Error" page is displayed
      And clicks on the "retry" button
     Then the "Enable With New Card" page is displayed

  @jira.QANOV-95704 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95702 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can return to bills screen after trying to modify the card for recurrent payment by a new one with an error with the payment and saving the card
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "enable" button
      And there is an error saving the card
      And there is an error with the payment
      And the "Feedback Recurrent Payment Card Modified Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-95705 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can tries to modify the selected card by a new one. Payment result unknown. Card not saved
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "enable" button
      And there is an error saving the card
      And the result of the payment is unknown
     Then the "Feedback Recurrent Payment Card Modified Pending" page is displayed
      And the "error_title" textfield with "Estamos tentando processar seu pagamento ainda" text is displayed
      And the "error_message" textfield with "O seu cartão foi salvo, mas o seu pagamento ainda não foi concluído. Você pode voltar depois pra ver se deu tudo certo e consultar o status em Minhas faturas. Esse processo de atualização do status pode levar até 48 horas, ok?" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And card_number "[CONF:invoice_payment.valid_card_number]" is not saved in payment methods area

  @jira.QANOV-95706 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95705 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can retry the card modification after a pending status with the payment and without saving the card
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "enable" button
      And there is an error saving the card
      And the result of the payment is unknown
      And the "Feedback Recurrent Payment Card Modified Pending" page is displayed
      And clicks on the "retry" button
     Then the "Enable With New Card" page is displayed

  @jira.QANOV-95707 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95705 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can return to bills screen after trying to modify the card for recurrent payment by a new one with pending status with the payment and without saving the card
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "enable" button
      And there is an error saving the card
      And the result of the payment is unknown
      And the "Feedback Recurrent Payment Card Modified Pending" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-95708 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95688 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled reaches DCP inactivity timeout adding a new card to modify the payment method
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And waits "180" seconds
     Then the "Feedback Recurrent Payment DCP Timeout Error" page is displayed
      And the "error_title" textfield with "Sua ativação ainda não foi feita, mas é só começar de novo" text is displayed
      And the "error_message" textfield with "Por inatividade sua ativação não foi finalizada, você precisa começar de novo." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-95709 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95708 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can retry the add new card process after reaching DCP inactivity timeout
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And waits "180" seconds
      And the "Feedback Recurrent Payment DCP Timeout Error" page is displayed
      And clicks on the "retry" button
     Then the "Enable With New Card" page is displayed

  @jira.QANOV-95710 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95708 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1807 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can return to bills screen after reaching DCP inactivity timeout while adding a new card to modify the payment method
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And waits until the "card_list_module" element is visible
      And clicks on the "0" element in the "other_options_list" list
      And the "Enable With Saved Card" page is displayed
      And clicks on the "last" element in the "cards_list" list
      And the "Enable With New Card" page is displayed
      And waits "180" seconds
      And the "Feedback Recurrent Payment DCP Timeout Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-95711
Feature: Recurrent Payment with new card

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.detects.CHECKOUT-2924 @qa @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @mobile @sanity @vivobr
  Scenario Outline: A no legacy user without any saved card and with recurrent payment disabled access to Enable With New Card from Enable Recurrent Payment screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
     Then the "Add New Card" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito pro pagamento automático" text is displayed
      And the "cards_accepted" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And switches to "embedded_iframe" iframe
      And the "card_number" module is displayed
      And the "card_number.label" textfield with "Número do cartão: *" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date.label" textfield with "Vencimento: *" text is displayed
      And the "expiration_date.input" inputtext with the "MM/AA" placeholder is displayed
      And the "cvv.label" textfield with "CVV: *" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" link is displayed
      And the "save" button with "Cadastrar Cartão" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Enable Recurrent Payment" page is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-95712  |
          | ios     | manual    | QANOV-168379 |

  @jira.QANOV-95713 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled access to Enable With New Card from Enable Recurrent Payment screen. Error loading the DCP form
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And there is an error loading the DCP form
     Then the "Add New Card" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Cadastre um cartão de crédito pro pagamento automático" text is displayed
      And the "valid_cards_info" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "no_connectivity_title" textfield with "Não foi possível carregar o formulário para inserir os dados do cartão" text is displayed
      And the "no_connectivity_text" textfield with "Espere uns minutos caso o formulário não apareça novamente." text is displayed
      And the "retry" button with "Tentar novamente" text is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @jira.link.detects.CHECKOUT-1894
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @mobile @qa @regression @vivobr
  @jira.link.detects.CHECKOUT-4380 @old_app
  Scenario Outline: A no legacy user without any saved card and with recurrent payment disabled clicks on the CVV (i) link at the "Add New Card" page without filling the card number
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.title" textfield with "CÓDIGO DE SEGURANÇA" text is displayed
      And the "cvv_info.message1" textfield with "São os 3 dígitos do verso de seu cartão." text is displayed
      And the "cvv_info.icons1" icon is displayed
      And the "cvv_info.message2" textfield with "São os 4 dígitos do anverso de seu cartão." text is displayed
      And the "cvv_info.icons2" icon is displayed
      And the "cvv_info.close" button is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-95714  |
          | ios     | manual    | QANOV-168380 |

  @jira.QANOV-285790 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled clicks on the CVV (i) link at the "Add New Card" page with a VISA, Mastercard, ELO or Hypercard card number
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4000000000000002" text
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.message" textfield with "Código de Verificação do Cartão (CVC) de 3 ou 4 dígitos que está no verso do cartão" text is displayed
      And the "cvv_info.close" button is displayed

  @jira.QANOV-285791 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled clicks on the CVV (i) link at the "Add New Card" page with an AMEX card number
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4000000000000002" text
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.title" textfield with "Código de segurança (CVV)" text is displayed
      And the "cvv_info.message" textfield with "São os 4 dígitos do anverso de seu cartão." text is displayed
      And the "cvv_info.cards_list" list has "2" elements
      And the "cvv_info.close" button is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @mobile @qa @regression @vivobr
  Scenario Outline: A no legacy user without any saved card and with recurrent payment disabled introduces invalid data in the "Add New Card" page
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "<field_1>.input" inputtext with the "<value>" text
      And clicks on the "<field_2>.input" inputtext
     Then the "<field_1>.error_message" textfield with "<feedback>" text is displayed
      And switches to original frame

    Examples:
          | field_1         | value | field_2         | feedback                                          | execution | client  | jira_id      |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | automatic | android | QANOV-95715  |
          | expiration_date | 392   | card_number     | Data inválida                                     | manual    | android | QANOV-95716  |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | automatic | android | QANOV-95717  |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | manual    | ios     | QANOV-168381 |
          | expiration_date | 392   | card_number     | Data inválida                                     | manual    | ios     | QANOV-168382 |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | manual    | ios     | QANOV-168383 |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @mobile @qa @regression @vivobr
  Scenario Outline: A no legacy user without any saved card and with recurrent payment disabled clicks on pay button in the "Add New Card" page with not all fields filled
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "<field1>.input" inputtext with the "<value1>" text
      And fills the "<field2>.input" inputtext with the "<value2>" text
     When clicks on the "save" button
     Then the "<field3>.error_message" textfield with "<feedback>" text is displayed
      And switches to original frame

    Examples:
          | field1          | value1           | field2          | value2 | field3          | feedback                                          | execution | client  | jira_id      |
          | card_number     | 4532395457945981 | expiration_date | 1224   | cvv             | Código de segurança inválido                      | automatic | android | QANOV-95718  |
          | expiration_date | 1224             | cvv             | 123    | card_number     | Tem algo errado com este número. Dá uma conferida | automatic | android | QANOV-95719  |
          | card_number     | 4532395457945981 | cvv             | 123    | expiration_date | Data inválida                                     | manual    | android | QANOV-95720  |
          | card_number     | 4532395457945981 | expiration_date | 1224   | cvv             | Código de segurança inválido                      | manual    | ios     | QANOV-168384 |
          | expiration_date | 1224             | cvv             | 123    | card_number     | Tem algo errado com este número. Dá uma conferida | manual    | ios     | QANOV-168385 |
          | card_number     | 4532395457945981 | cvv             | 123    | expiration_date | Data inválida                                     | manual    | ios     | QANOV-168386 |

  @jira.QANOV-95721 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled with an unpaid bill reaches DCP inactivity timeout in "Add New Card" page
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card" page
      And waits "180" seconds
     Then the "Feedback Recurrent Payment DCP Timeout Error" page is displayed
      And the "error_title" textfield with "Sua ativação ainda não foi feita, mas é só começar de novo" text is displayed
      And the "error_message" textfield with "Por inatividade sua ativação não foi finalizada, você precisa começar de novo." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-95722 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95721 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled in the Feedback Recurrent Payment Timeout Error can add the card again
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card" page
      And waits "180" seconds
      And the "Feedback Recurrent Payment DCP Timeout Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-95723 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95721 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled in the Feedback Recurrent Payment Timeout Error returns to "Bills" screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card" page
      And waits "180" seconds
      And the "Feedback Recurrent Payment DCP Timeout Error" page is displayed
     When clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-2115 @old_app
  @jira.link.detects.CHECKOUT-2118 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @manual @mobile
  @vivobr
  Scenario Outline: A <account_type> user without any saved card and with recurrent payment disabled clicks on pay button in the "Add New Card" page with valid data. Payment processed successfully
    other_affected_versions="2021-50"
    The OB system will send an SMS notifying the customer that the feature has been activated.
    For LIVE environment, we have to use a real card
    Given user has a "<account_type>" account type
      And user is not a "siebel" plan
      And user does not have a "prepay" account type
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And switches to "iframe" iframe
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "pay" button
      And switches to original frame
     Then the "Feedback Payment Success" page is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with "Você ativou seu pagamento no cartão de crédito" text is displayed
      And the "success_message2" textfield with the "Cartão de crédito \*\*\*\*\d\d\d\d foi cadastrado. O primeiro pagamento com cartão pode ocorrer em até 2 vencimentos da fatura Vivo. Dá uma conferida na sua fatura do cartão e se não constar a fatura Vivo, você precisa usar outra forma de pagamento, ok?" format is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And card_number "4761120000000148" is saved in payment methods area

    Examples:
          | account_type | test_priority | jira_id     |
          | beatrix      | regression    | QANOV-95724 |
          | convergente  | smoke         | QANOV-95725 |
          | multivivo    | regression    | QANOV-95726 |

  @jira.<jira_id> @android @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user without any saved card and with recurrent payment disabled returns to "Bills" after enabling recurrent payment successfully
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user has a "<account_type>" account type
      And user is not a "siebel" plan
      And user does not have a "prepay" account type
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And switches to "iframe" iframe
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And clicks on the "pay" button
      And switches to original frame
      And the "Feedback Payment Success" page is displayed
      And clicks on the "back" entrypoint
     Then the "Account" page is displayed

    Examples:
          | account_type | depends_on  | jira_id     |
          | beatrix      | QANOV-95724 | QANOV-95727 |
          | convergente  | QANOV-95725 | QANOV-95728 |
          | multivivo    | QANOV-95726 | QANOV-95729 |

  @jira.QANOV-95730 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr
  Scenario: A no legacy user without any saved card and with recurrent payment disabled clicks on pay button in the "Add New Card" page with valid data. Payment processed unsuccessfully due to DCP payment error. Card not saved
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "enable" button
      And there is an error saving the card
      And there is an error with the payment
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "error_title" textfield with "Alguma coisa deu errado ao ativar seu pagamento automático" text is displayed
      And the "error_text" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And card_number "4761120000000148" is not saved in payment methods area

  @jira.QANOV-95731 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95730 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr
  Scenario: A no legacy user without any saved card and with recurrent payment disabled in the Feedback Recurrent Payment Error after an error saving the card can add the card again
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card" page
      And there is an error saving the card
      And there is an error with the payment
      And the "Feedback Recurrent Payment Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-95732 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95730 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr
  Scenario: A no legacy user without any saved card and with recurrent payment disabled in the Feedback Recurrent Payment Error after an error saving the card returns to "Bills" screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card" page
      And there is an error saving the card
      And there is an error with the payment
      And the "Feedback Recurrent Payment Error" page is displayed
     When clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-95733 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr
  Scenario: A no legacy user without any saved card and with recurrent payment disabled clicks on pay button in the "Add New Card" page with valid data. Payment result unknown. Card not saved
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "enable" button
      And there is an error saving the card
      And the result of the payment is unknown
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "unknown_status_title" textfield with "Estamos tentando ativar seu serviço ainda" text is displayed
      And the "unknown_status_message" textfield with "Você pode voltar depois pra ver se deu tudo certo" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And card_number "4761120000000148" is not saved in payment methods area

  @jira.QANOV-95734 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled clicks on pay button in the "Add New Card" page with valid data. Payment processed unsuccessfully due to DCP payment error
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "enable" button
      And there is an error with the payment
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "payment_error_title" textfield with "Algo deu errado com o pagamento da sua fatura" text is displayed
      And the "payment_error_message" textfield with "Mas a gente já salvou o seu cartão aqui pra você tentar de novo mais tarde. Se o problema continuar, entre em contato com a administradora do seu cartão \*\*\*\*\d\d\d\d" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And card_number "4761120000000148" is saved in payment methods area

  @jira.QANOV-95735 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95712 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1805 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without any saved card and with recurrent payment disabled clicks on pay button in the "Add New Card" page with valid data. Payment result unknown
    other_affected_versions="2021-50"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Add New Card" page is displayed
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "enable" button
      And the result of the payment is unknown
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "unknown_status_title" textfield with "Estamos tentando processar seu pagamento ainda" text is displayed
      And the "unknown_status_message" textfield with "O seu cartão foi salvo, mas o seu pagamento ainda não foi concluído. Você pode voltar depois pra ver se deu tudo certo e consultar o status em Minhas contas. Esse processo de atualização do status pode levar até 48 horas, ok?" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And card_number "4761120000000148" is saved in payment methods area

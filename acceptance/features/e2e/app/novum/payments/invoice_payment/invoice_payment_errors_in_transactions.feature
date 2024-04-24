# -*- coding: utf-8 -*-
@jira.QANOV-194425
Feature: Invoice Payment with Credit Card Errors in transactions


  @jira.QANOV-22000 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill and without credit cards in his payment methods area confirms that he wants to pay with credit card in "Payment Summary" page. Error loading the DCP form
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
     When clicks on the "continue" button
      And there is an error loading the DCP form
     Then the "Add New Card" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito" text is displayed
      And the "valid_cards_info" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield is displayed
      And the "no_connectivity_title" textfield with "Tem algo errado com sua internet" text is displayed
      And the "no_connectivity_text" textfield with "Veja se sua conexão está ok e tente novamente" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A no legacy user with an unpaid bill clicks on pay button in the "Add New Card" page with valid data. Payment processed unsuccessfully due to DCP payment error
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    For QA environment, used card cannot be saved
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And the "last_bill_amount" textfield contains an "<amount>" amount
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Add New Card" page
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
     When clicks on the "pay" button
      And a DCP error with "<DCP_error_code>" error code and "<error_name>" error name occurs
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o pagamento da sua fatura" text is displayed
      And the "error_message" textfield with "Mas a gente já salvou seu cartão aqui pra você tentar de novo mais tarde.\n\nSe o problema continuar, entre em contato com a administradora do seu cartão \*\*\*\*\d\d\d\d" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And card_number "4761120000000148" is saved in payment methods area

    Examples:
          | DCP_error_code | error_name                          | amount  | jira_id     |
          | 0100           | ERROR SISTEMA - DESCONOCIDO         | <=1     | QANOV-22014 |
          | 0908           | ERROR SISTEMA - LARGA DURACION      | 1<X<=2  | QANOV-22015 |
          | 0912           | ERROR SISTEMA - PUNTUAL             | 2<X<=3  | QANOV-22016 |
          | 0550           | ERROR ADQUIRIENTE (posible puntual) | 3<X<=4  | QANOV-22017 |
          | 0551           | ERROR ADQUIRIENTE                   | 4<X<=5  | QANOV-22018 |
          | 0230           | PENDIENTE                           | 5<X<=6  | QANOV-22019 |
          | 0238           | FRAUDE                              | 6<X<=7  | QANOV-22020 |
          | 0111           | ERROR NUMERO TARJETA                | 7<X<=9  | QANOV-22021 |
          | 0278           | FRAUDE POR LISTA BLANCA             | 8<X<=9  | QANOV-22022 |
          | 0101           | ERROR DATOS TOKENIZACION            | 9<X<=10 | QANOV-22023 |

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.detects.CHECKOUT-1655 @jira.link.detects.CHECKOUT-1727 @jira.link.parent_test_plan.QANOV-68826 @manual
  @mobile @regression @vivobr @old_app
  Scenario Outline: A no legacy user with an unpaid bill clicks on pay button in the "Add New Card" page with valid data. Payment processed unsuccessfully due to DCP card error
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Add New Card" page
      And fills the "card_number" inputtext with the "<card_number>" text
      And fills the "expiration_date" inputtext with the "12/24" text
      And fills the "cvv" inputtext with the "123" text
     When clicks on the "pay" button
      And a DCP error with "<DCP_error_code>" error code and "<error_name>" error name occurs
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o pagamento da sua fatura" text is displayed
      And the "error_message" textfield with "O serviço não está funcionando agora, mas você pode tentar de novo mais tarde\n\nSe o problema continuar, entre em contato com a administradora do seu cartão  \*\*\*\*\d\d\d\d" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And card_number "<card_number>" is not saved in payment methods area

    Examples:
          | DCP_error_code | error_name                          | card_number      | jira_id     |
          | 0100           | ERROR SISTEMA - DESCONOCIDO         | 2223000048410010 | QANOV-22024 |
          | 0908           | ERROR SISTEMA - LARGA DURACION      | 2223520443560010 | QANOV-22025 |
          | 0912           | ERROR SISTEMA - PUNTUAL             | 2222410740360010 | QANOV-22026 |
          | 0550           | ERROR ADQUIRIENTE (posible puntual) | 5100081112223332 | QANOV-22027 |
          | 0551           | ERROR ADQUIRIENTE                   | 5103221911199245 | QANOV-22028 |
          | 0230           | PENDIENTE                           | 5100290029002909 | QANOV-22029 |
          | 0238           | FRAUDE                              | 5577000055770004 | QANOV-22030 |
          | 0279           | TOKEN NO CREADO                     | 5136333333333335 | QANOV-22031 |
          | 0101           | ERROR FECHA (TARJETA EXPIRADA)      | 5585558555855583 | QANOV-22032 |
          | 0111           | ERROR NUMERO TARJETA                | 5555444433331111 | QANOV-22033 |
          | 0278           | FRAUDE POR LISTA BLANCA             | 5555555555554444 | QANOV-22034 |

  @jira.QANOV-22035 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill clicks on pay button in the "Add New Card" page with valid data. Feedback Timeout Reached before card is saved
    If the operation takes too long, the app will show feedback. The user will need to go to
    recent purchases to check the status
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Add New Card" page
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
     When clicks on the "pay" button
      And timeout is reached before card is saved
     Then the "Feedback Bill Payment with Credit Card Feedback Timeout Error" page is displayed
      And the "error_title" textfield with "Estamos tentando processar seu pagamento ainda" text is displayed
      And the "error_message" textfield with "Você pode voltar depois pra ver se deu tudo certo." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-22047 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill and with credit cards in his payment methods area confirms that he wants to pay with credit card in "Payment Summary" page. Error retrieving the cards
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has ">1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
     When clicks on the "pay" button
      And there is an error retrieving the cards information
     Then the "Credit Card Selection" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Não conseguimos carregar seus cartões. Insira os dados de novo" text is displayed
      And the "valid_cards_info" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield is displayed
      And the "card_number_label" textfield with "Número do cartão: *" text is displayed
      And the "card_number" inputtext is displayed
      And the "expiration_label" textfield with "Vencimento: *" text is displayed
      And the "expiration_date" inputtext with the "MM/AA" placeholder is displayed
      And the "cvv_label" textfield with "Código de segurança (CVV): *" text is displayed
      And the "cvv" inputtext is displayed
      And the "cvv_info" link with "(i)" text is displayed
      And the "pay" button with "Cadastrar Cartão" text is displayed

  @jira.QANOV-22049 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill and with credit cards in his payment methods area confirms that he wants to pay with credit card in "Payment Summary" page. Error retrieving the cards information and error loading the cards form
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has ">1" valid cards saved in the payment methods area
      And has ">1" bills selected for payment
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
     When clicks on the "pay" button
      And the "success_message" textfield with "Cartão de crédito \*\*\*\*\d\d\d\d foi cadastrado. O primeiro pagamento com cartão pode ocorrer em até 2 vencimentos da fatura Vivo. Dá uma conferida na sua fatura do cartão e se não constar a fatura Vivo, você precisa usar outra forma de pagamento, ok?" format is displayedAnd there is an error retrieving the cards information
      And there is a loading cards form error
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Algo deu errrado ao carregar o conteúdo" text is displayed
      And the "error_message" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde" text is displayed
      And the "retry" button with "Tentar novamente" text is displayed
      And the "back" button with "Voltar pro início" text is displayed

  @jira.QANOV-22057 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22043
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill and with credit cards in his payment methods area tries to access to "Add New Card" page from "Credit Card Selection" page. Error loading the form
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Credit Card Selection" page
     When clicks on the "last" element in the "cards_list" list
      And there is an error loading the form
     Then the "Add New Card" internal webview is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito" text is displayed
      And the "valid_cards_info" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield is displayed
      And the "no_connectivity_title" textfield with "Tem algo errado com sua internet" text is displayed
      And the "no_connectivity_text" textfield with "Veja se sua conexão está ok e tente novamente" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

  @jira.QANOV-22065 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1727
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with more than one unpaid bill can not complete the payment of several bills
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
      And has ">1" bills selected for payment
     When clicks on the "continue" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And there is a server error
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o pagamento da sua fatura" text is displayed
      And the "error_message" textfield with "O serviço não está funcionando agora, mas você pode tentar de novo mais tarde\n\nSe o problema continuar, entre em contato com a administradora do seu cartão  \*\*\*\*\d\d\d\d" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-22067 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1676
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user returns from error feedback screen to account
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
      And has ">1" bills selected for payment
     When clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number" inputtext with the "2222410740360010" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "pay" button
      And there is a server error
      And the "Feedback Bill Payment with Credit Card Error" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-22069 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1725
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user without saved cards retries payment. Retry failure
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
      And has ">1" bills selected for payment
     When clicks on the "continue" button
      And the "Add New Card" internal webview is displayed
      And fills the "card_number" inputtext with the "2222410740360010" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "pay" button
      And there is a server error
      And the "Feedback Bill Payment with Credit Card Error" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-66646 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user with saved cards retries payment. Retry failure
    The saved card must be not valid for payment
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has ">1" bills in "unpaid" status in any subscription
      And has "1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
      And has ">1" bills selected for payment
     When clicks on the "continue" button
      And the "Credit Card Selection" internal webview is displayed
      And clicks on the "pay" button
      And there is a server error
      And the "Feedback Bill Payment with Credit Card Error" page is displayed
      And clicks on the "retry" button
     Then the "Credit Card Selection" page is displayed

  @jira.QANOV-26305 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.detects.CHECKOUT-1724 @jira.link.detects.CHECKOUT-1727 @jira.link.parent_test_plan.QANOV-68826 @manual
  @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill clicks on pay button in the "Add New Card" page with valid data: No response received from Third Parties
    Ask global checkout dev team to reproduce this scenario. Requires changes in the environment. The wait time is
    not confirmed, depends on configuration
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Add New Card" page
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
     When clicks on the "pay" button
      And no response is received from third parties
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Algo deu errado com o pagamento da sua fatura" text is displayed
      And the "error_message" textfield with "O serviço não está funcionando agora, mas você pode tentar de novo mais tarde\n\nSe o problema continuar, entre em contato com a administradora do seu cartão  \*\*\*\*\d\d\d\d" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-223878 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user sees an error screen when barcode is unavailable
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error retrieving the barcode information
     Then the "Feedback Payment Error" page is displayed
      And the "payment_error_title" textfield with "Algo deu errado com este serviço" text is displayed
      And the "payment_error_message" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-223879 @android @ios @jira.cv.13.5 @jira.link.depends_on.QANOV-223878
  @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy taps on retry button after an error retrieving the barcode and accesses to the Bill Barcode button
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error retrieving the barcode information
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Bill Barcode" page is displayed

  @jira.QANOV-223880 @android @ios @jira.cv.13.5 @jira.link.depends_on.QANOV-223878
  @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy taps on back button after an error retrieving the barcode and return to Bills screen
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Código de barras" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error retrieving the barcode information
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-229120 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user sees an error screen when Pix code is unavailable
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" bill whose "due_date" field is after "31-08-2022" date
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list whose "due_date" field is after "31-08-2022" date
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error retrieving the pix information
     Then the "Feedback Payment Error" page is displayed
      And the "payment_error_title" textfield with "Algo deu errado" text is displayed
      And the "payment_error_message" textfield with "O pagamento com PIX não está disponível nesse momento para essa fatura, mas você pode tentar novamente mais tarde." text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-229122 @android @ios @jira.cv.13.5 @jira.link.depends_on.QANOV-229120 @manual @mobile @regression @vivobr
  @old_app
  Scenario: A no legacy taps on back button after an error retrieving the Pix code and return to Bills screen
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has a month with "unpaid" bill whose "due_date" field is after "31-08-2022" date
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills_list" list
      And selects "1" elements of "unpaid_bills_list" list whose "due_date" field is after "31-08-2022" date
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Pix" value of the "payment_methods_list" list
      And clicks on the "continue" button
      And there is an error retrieving the pix information
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

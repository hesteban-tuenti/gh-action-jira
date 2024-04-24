# -*- coding: utf-8 -*-
@jira.QANOV-21997
Feature: Invoice Payment with Credit Card

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.<jira_id> @<ber> @<client> @<execution> @jira.cv.12.8 @jira.link.detects.CHECKOUT-1627
  @jira.link.detects.CHECKOUT-1629 @jira.link.detects.CHECKOUT-1630 @jira.link.detects.CHECKOUT-1681
  @jira.link.detects.CHECKOUT-2015 @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @sanity @vivobr @old_app
  Scenario Outline: A no legacy user with an unpaid bill and without credit cards sees the "Add New Card" screen after payment summary
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "Add New Card" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito" text is displayed
      And the "cards_accepted" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And the "terms_footer" is displayed with multiline text
    """
    Ao continuar você aceita nossos
    Termos e condições
    """
      And the "terms_link" link with "Termos e condições" text is displayed
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
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

    Examples:
          | client  | execution | ber | jira_id      |
          | android | automatic | ber | QANOV-21998  |
          | ios     | manual    |     | QANOV-168592 |
          | webapp  | automatic |     | QANOV-529839 |

  @jira.QANOV-242624 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user access to Terms & Conditions from "Add New Card" page
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And waits until the "terms_link" element is visible
      And clicks on the "terms_link" web link
     Then the internal webview with "Termos e condições" header is displayed
      And the "presente termo formaliza" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Add New Card" page is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.detects.CHECKOUT-1858 @jira.link.detects.CHECKOUT-1894
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user clicks on the CVV (i) link at the "Add New Card" page without filling the card number
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
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
          | android | automatic | QANOV-194419 |
          | ios     | manual    | QANOV-194420 |
          | webapp  | automatic | QANOV-529840 |

  @jira.QANOV-285788 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user clicks on the CVV (i) link at the "Add New Card" page with a VISA, Mastercard, ELO or Hypercard card number
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4000000000000002" text
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.message" textfield with "Código de Verificação do Cartão (CVC) de 3 ou 4 dígitos que está no verso do cartão" text is displayed
      And the "cvv_info.close" button is displayed

  @jira.QANOV-285789 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user clicks on the CVV (i) link at the "Add New Card" page with an AMEX card number
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "340000000001007" text
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.title" textfield with "Código de segurança (CVV)" text is displayed
      And the "cvv_info.message" textfield with "São os 4 dígitos do anverso de seu cartão." text is displayed
      And the "cvv_info.cards_list" list has "2" elements
      And the "cvv_info.close" button is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user introduces invalid data in the "Add New Card" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "<field_1>.input" inputtext with the "<value>" text
      And clicks on the "<field_2>.input" inputtext
     Then the "<field_1>.error_message" textfield with "<feedback>" text is displayed

    Examples:
          | field_1         | value | field_2         | feedback                                          | execution | client  | jira_id      |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | automatic | android | QANOV-22006  |
          | expiration_date | 0122  | card_number     | Data inválida                                     | automatic | android | QANOV-22007  |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | automatic | android | QANOV-22008  |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | manual    | ios     | QANOV-168594 |
          | expiration_date | 0122  | card_number     | Data inválida                                     | manual    | ios     | QANOV-168595 |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | manual    | ios     | QANOV-168596 |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | automatic | webapp  | QANOV-529841 |
          | expiration_date | 0122  | card_number     | Data inválida                                     | automatic | webapp  | QANOV-529842 |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | automatic | webapp  | QANOV-529843 |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user clicks on pay button in the "Add New Card" page with not all fields filled
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "<field1>.input" inputtext with the "<value1>" text
      And fills the "<field2>.input" inputtext with the "<value2>" text
      And clicks on the "save" button
      And waits until the "<field3>.error_message" element is visible
     Then the "<field3>.error_message" textfield with "<feedback>" text is displayed

    Examples:
          | field1          | value1           | field2          | value2 | field3          | feedback                                          | execution | client  | jira_id      |
          | card_number     | 5410080000000005 | expiration_date | 1224   | cvv             | Código de segurança inválido                      | automatic | android | QANOV-22009  |
          | expiration_date | 1224             | cvv             | 123    | card_number     | Tem algo errado com este número. Dá uma conferida | automatic | android | QANOV-22010  |
          | card_number     | 5410080000000005 | cvv             | 123    | expiration_date | Data inválida                                     | manual    | android | QANOV-22011  |
          | card_number     | 5410080000000005 | expiration_date | 1224   | cvv             | Código de segurança inválido                      | manual    | ios     | QANOV-168597 |
          | expiration_date | 1224             | cvv             | 123    | card_number     | Tem algo errado com este número. Dá uma conferida | manual    | ios     | QANOV-168598 |
          | card_number     | 5410080000000005 | cvv             | 123    | expiration_date | Data inválida                                     | manual    | ios     | QANOV-168599 |
          | card_number     | 5410080000000005 | expiration_date | 1224   | cvv             | Código de segurança inválido                      | automatic | webapp  | QANOV-529844 |
          | expiration_date | 1224             | cvv             | 123    | card_number     | Tem algo errado com este número. Dá uma conferida | automatic | webapp  | QANOV-529845 |
          | card_number     | 5410080000000005 | cvv             | 123    | expiration_date | Data inválida                                     | manual    | webapp  | QANOV-529846 |

  @jira.<jira_id> @<ber> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-21998
  @jira.link.detects.CHECKOUT-1728 @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @sanity @vivobr @old_app
  Scenario Outline: A no legacy user with an unpaid bill clicks on pay button in the "Add New Card" page with valid data. Payment processed successfully
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    For QA environment, used card cannot be saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is not blacklisted to pay with card
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And scrolls down
      And clicks on the element with "payment_description" field with "Cartão de crédito" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "save" button
      And switches to original frame
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with the "Você usou o cartão ••••\d\d\d\d pra pagar o total de R\$ \d+,\d\d (da|das) fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d." format is displayed
      And the "success_message2" textfield with "Podemos levar até 48 horas pra atualizar as informações do pagamento." text is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And switches to original frame
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

    Examples:
          | client  | execution | ber | jira_id      |
          | android | automatic | ber | QANOV-22012  |
          | ios     | manual    |     | QANOV-194421 |

  @jira.QANOV-194422 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile
  @smoke @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill make a payment from "Add New Card" page. Card is saved
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    For QA environment, used card cannot be saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is not blacklisted to pay with card
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on any element in the "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And scrolls down
      And clicks on the element with "payment_description" field with "Cartão de crédito" value of the "payment_methods_list" list
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "save" button
     Then the "Feedback Payment Success" page is displayed
      And card_number "4761120000000148" is saved in payment methods area

  @jira.<jira_id> @<ber> @<client> @<execution> @jira.cv.12.8 @jira.link.detects.CHECKOUT-1729
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @smoke @vivobr @old_app
  Scenario Outline: A no legacy user with more than one unpaid bill completes the payment of several bills successfully from the "Add New Card" page
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    For QA environment, used card cannot be saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "save" button
      And switches to original frame
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with the "Você usou o cartão ••••\d\d\d\d pra pagar o total de R\$ \d+,\d\d (da|das) fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d." format is displayed
      And the "success_message2" textfield with "Podemos levar até 48 horas pra atualizar as informações do pagamento." text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

    Examples:
          | client  | execution | ber | jira_id      |
          | android | automatic | ber | QANOV-22061  |
          | ios     | manual    |     | QANOV-194423 |

  @jira.QANOV-194424 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A no legacy user with more than one unpaid bill make a payment from "Add New Card" page. Card is saved
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    For QA environment, used card cannot be saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And clicks on the "save" button
     Then the "Feedback Payment Success" page is displayed
      And card_number "4761120000000148" is saved in payment methods area

  @jira.QANOV-22039 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998 @jira.link.detects.CHECKOUT-1859
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill reaches DCP inactivity timeout in "Add New Card" page
    If the pay button is not clicked on time, the app will show an error
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Add New Card" page
      And waits "180" seconds
     Then the "Feedback Bill Payment with Credit Card DCP Timeout Error" page is displayed
      And the "error_title" textfield with "Seu pagamento ainda não foi feito, mas é só começar de novo" text is displayed
      And the "error_message" textfield with "Você ficou um tempinho longe daqui e o pagamento não foi concluído" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-22041 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998 @jira.link.detects.CHECKOUT-1635
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user in the Feedback Bill Payment with Credit Card Timeout Error clicks on retry
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Add New Card" page
      And waits "180" seconds
      And the "Feedback Bill Payment with Credit Card DCP Timeout Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card" page is displayed

  @jira.QANOV-22043 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1622
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @sanity @vivobr @webapp @old_app
  Scenario: A no legacy user with an unpaid bill and with saved cards can see the screen to select card for the payment
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "Credit Card Selection" page is displayed
      And the "main_title" textfield with "Quero pagar com o cartão:" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "available_cards_label" textfield with "CARTÕES DISPONÍVEIS" text is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And the "0" index in the "cards_list" list has the "selected" field
      And the "add_card" textfield with "Adicionar cartão" text is displayed
      And the "terms_footer" textfield that contains the "Ao continuar você aceita nossos" text is displayed
      And the "terms_link" link with "Termos e condições" text is displayed
      And the "total_debt" textfield with the "R\$ \d+(\.\d+)?\,\d{2}?" format is displayed
      And the "pay" button with "Pagar agora" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

  @jira.QANOV-242625 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user access to Terms & Conditions from "Credit Card Selection" page
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "terms_link" web link
     Then the internal webview with "Termos e condições" header is displayed
      And the "presente termo formaliza" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Credit Card Selection" page is displayed

  @jira.QANOV-22045 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A no legacy user with an unpaid bill and with 3 credit cards in his payment methods area in expired status confirms that he wants to pay with credit card in "Payment Summary" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a month with "unpaid" bill
      And has "3" expired cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
     When clicks on the "pay" button
     Then the "Credit Card Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Seus cartões estão vencidos. Você precisa remover e adicionar um novo" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "expired_cards_label" textfield with "CARTÕES VENCIDOS" text is displayed
      And the "expired_cards_list" list is displayed
      And each element in the "expired_cards_list" list has the "company_icon" field
      And each element in the "expired_cards_list" list has the "last_digits" field
      And each element in the "expired_cards_list" list has the "expiration" field
      And each element in the "expired_cards_list" list has the "delete_card" field
      And each element in the "expired_cards_list" list has the "expiration" textfield with the "\d{2}\/\d{2} · Vencido" format
      And the "terms_footer" textfield with "Ao continuar você aceita nossos Termos e condições" text is displayed
      And the "terms_link" link with "Termos e condições" text is displayed
      And the "return" button with "Ok, ir pro início" text is displayed

  @jira.QANOV-22051 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22043
  @jira.link.detects.CHECKOUT-1682 @mobile @qa @regression @vivobr @webapp @old_app
  Scenario: A no legacy user with an unpaid bill and with credit cards in his payment methods area changes the selected credit card at the "Credit Card Selection" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">1" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Credit Card Selection" page is displayed
      And the "0" index in the "cards_list" list has the "selected" field
      And the "1" index in the "cards_list" list has the "unselected" field
      And clicks on the "unselected" field of "cards_list" list with "1" index
     Then the "1" index in the "cards_list" list has the "selected" field
      And the "0" index in the "cards_list" list has the "unselected" field
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

  @jira.<jira_id> @<ber> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-22043
  @jira.link.detects.CHECKOUT-1627 @jira.link.detects.CHECKOUT-1629 @jira.link.detects.CHECKOUT-1630
  @jira.link.detects.CHECKOUT-2015 @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @sanity @vivobr @old_app
  Scenario Outline: A no legacy user with an unpaid bill and with credit cards in his payment methods area access to "Add New Card" page from "Credit Card Selection" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Account" page
     When clicks on the "bills.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_card" button
     Then the "Add New Card" page is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito" text is displayed
      And the "cards_accepted" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield with the "R\$ \d+(.\d+)?,\d\d" format is displayed
      And switches to "form_iframe" iframe
      And the "card_number.label" textfield with "Número do cartão: *" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date.label" textfield with "Vencimento: *" text is displayed
      And the "cvv.label" textfield with "CVV: *" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" link is displayed
      And the "pay" button with "Cadastrar Cartão" text is displayed
      And switches to original frame
      And switches to "iframe" iframe
      And the "terms_footer" textfield that contains the "Ao continuar você aceita nossos" text is displayed
      And the "terms_link" link with "Termos e condições" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

    Examples:
          | client  | execution | ber | jira_id      |
          | android | automatic | ber | QANOV-22055  |
          | ios     | manual    |     | QANOV-195975 |
          | webapp  | automatic |     | QANOV-529849 |

  @jira.QANOV-22063 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1729
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @smoke @vivobr @old_app
  Scenario: A no legacy user with more than one unpaid bill completes the payment of several bills successfully with a credit card previously saved in his payment methods area
    Into the success_message will appear all months that user will paid
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">=1" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is not blacklisted to pay with card
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with the "Você usou o cartão ••••\d\d\d\d pra pagar o total de R\$ \d+(.\d+)?,\d\d (da|das) (fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d\, )*?(fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d e )?fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d\." format is displayed
      And the "success_message2" textfield with "Podemos levar até 48 horas pra atualizar as informações do pagamento." text is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

  @jira.QANOV-97182 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1729
  @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @smoke @vivobr @old_app
  Scenario: A no legacy user with unpaid bill completes the payment of one bill successfully with a credit card previously saved in his payment methods area
    Into the success_message will appear all months that user will paid
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">=1" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user is not blacklisted to pay with card
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list except one
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the element with "payment_description" field with "Cartão de crédito" value of the "payment_methods_list" list
      And clicks on the "continue_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message" textfield with the "Você usou o cartão ••••\d\d\d\d pra pagar o total de R\$ \d+(.\d+)?,\d\d (da|das) (fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d\, )*?(fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d e )?fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d\." format is displayed
      And the "success_message2" textfield with "Podemos levar até 48 horas pra atualizar as informações do pagamento." text is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

  @jira.QANOV-76795 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @smoke
  @vivobr @webapp @old_app
  Scenario: A no legacy user returns to Account after completing the payment successfully
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">=1" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
      And switches to original frame
     Then the "Account" page is displayed

  @jira.QANOV-76798 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A no legacy user with unpaid bill cannot complete successfully the payment. Payment is pending
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has ">=1" bills in "unpaid" status in any subscription
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
      And has ">=1" bills selected for payment
     When clicks on the "continue" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the payment is pending
     Then the "Feedback Bill Payment with Credit Card Pending" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "pending_title" textfield with "Estamos tentando procesar seu pagamento ainda" text is displayed
      And the "pending_message" textfield with "Você pode voltar depois pra ver se deu tudo certo e consultar o status em Minhas faturas. Esse processo de atualização do status pode levar até 48 horas, ok?" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-76799 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-76798
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user returns to Account after a pending payment
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has ">=1" bills in "unpaid" status in any subscription
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Payment Summary" page
      And has ">=1" bills selected for payment
     When clicks on the "continue" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the payment is pending
      And the "Feedback Bill Payment with Credit Card Pending" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-21998 @jira.link.detects.CHECKOUT-1636
  @jira.link.detects.CHECKOUT-3201 @jira.link.parent_test_plan.QANOV-68826 @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user without saved cards clicks on pay button in the "Add New Card" page with valid data but without data connectivity
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Add New Card" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "[CONF:invoice_payment.valid_card_number]" text
      And fills the "expiration_date.input" inputtext with the "[CONF:invoice_payment.valid_expiration_date]" text
      And fills the "cvv.input" inputtext with the "[CONF:invoice_payment.valid_cvv]" text
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And clicks on the "save" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado por aqui" text is displayed
      And the "no_connectivity_text" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde" text is displayed
      And the "retry" button with "Ok, voltar pro início" text is displayed
      And user turns off the Airplane mode

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-26307  |
          | ios     | manual    | QANOV-195976 |
          | webapp  | automatic | QANOV-529850 |

  @jira.QANOV-195977 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21998 @jira.link.detects.CHECKOUT-3414
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @qa @regression @vivobr @old_app
  Scenario: A no legacy user with saved cards clicks on pay button in the "Credit Card Selection" page with valid data but without data connectivity
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
      And the "Credit Card Selection" page is displayed
      And user turns on the Airplane mode
      And clicks on the "pay" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Tem algo errado com sua internet" text is displayed
      And the "no_connectivity_text" textfield with "Veja se sua conexão está ok e tente novamente" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

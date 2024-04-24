# -*- coding: utf-8 -*-
@jira.QANOV-151713
Feature: Payment Methods Area - vivobr

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-22073 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.NOV-100992 @old_app
  @jira.link.detects.ACCOUNT-13728 @jira.link.detects.ACCOUNT-16474 @jira.link.detects.CHECKOUT-1625
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @live @mobile @qa @sanity @vivobr
  Scenario: A no legacy user without saved cards accesses "Credit Card Selection PMA" page from "Invoices" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
     Then the "Gerenciar cartões" header is displayed
      And the "main_title" textfield with "Meus cartões de crédito" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "available_cards_label" textfield with "CARTÕES DISPONÍVEIS" text is displayed
      And the "available_cards_list_module" module is not displayed
      And the "add_card" textfield with "Adicionar cartão" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-22104 @android @automatic @ber @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1625 @old_app
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @mobile
  @qa @regression @vivobr @webapp
  Scenario: A no legacy user with saved cards accesses "Credit Card Selection PMA" page from "Invoices" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
     Then the "Gerenciar cartões" header is displayed
      And the "main_title" textfield with "Meus cartões de crédito" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "available_cards_label" textfield with "CARTÕES DISPONÍVEIS" text is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "delete_card" field
      And the "add_card" textfield with "Adicionar cartão" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-22079 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.NOV-100992
  @jira.link.detects.CHECKOUT-1567 @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @mobile
  @qa @regression @vivobr @webapp @old_app
  Scenario: A no legacy user with expired card accesses "Credit Card Selection PMA" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" expired cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
     Then the "Gerenciar cartões" header is displayed
      And the "main_title" textfield with "Meus cartões de crédito" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "expired_cards_label" textfield with "CARTÕES VENCIDOS" text is displayed
      And the "expired_cards_list" list is displayed
      And each element in the "expired_cards_list" list has the "company_icon" field
      And each element in the "expired_cards_list" list has the "last_digits" field
      And each element in the "expired_cards_list" list has the "expiration" field
      And each element in the "expired_cards_list" list has the "delete_card" field
      And each element in the "expired_cards_list" list has the "expiration" textfield with the "\d{2}\/\d{2} · Vencido" format

  @jira.QANOV-22081 @android @ios @jira.cv.12.8 @jira.link.depends_on.NOV-100992 @jira.link.detects.CHECKOUT-1654 @old_app
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with about to expire card accesses "Credit Card Selection PMA" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" valid cards saved in the payment methods area that expires soon
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
     Then the "Credit Card Selection PMA" page is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "delete_card" field
      And any element in the "cards_list" list has the "expiration" textfield with the "\d{2}\/\d{2} · Vence em (1 mês|2 meses|3 meses)" format

  @jira.<jira_id> @<client> @<execution> @<ber> @jira.cv.12.8 @jira.link.depends_on.QANOV-22073
  @jira.link.detects.CHECKOUT-1619 @jira.link.detects.CHECKOUT-1628 @jira.link.detects.CHECKOUT-1644
  @jira.link.detects.CHECKOUT-1835 @jira.link.detects.CHECKOUT-2015 @jira.link.detects.CHECKOUT-2082
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @mobile
  @qa @smoke @vivobr @old_app
  Scenario Outline: A no legacy user accesses to "Add New Card PMA" page from "Credit Card Selection PMA" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito" text is displayed
      And the "cards_accepted" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And switches to "embedded_iframe" iframe
      And the "card_number" module is displayed
      And the "card_number.label" textfield with "Número do cartão: *" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date" module is displayed
      And the "expiration_date.label" textfield with "Vencimento: *" text is displayed
      And the "cvv" module is displayed
      And the "cvv.label" textfield with "CVV: *" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" link is displayed
      And the "save" button with "Cadastrar Cartão" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

    Examples:
          | client  | execution | jira_id      | ber |
          | android | automatic | QANOV-22083  | ber |
          | ios     | manual    | QANOV-166450 |     |
          | webapp  | automatic | QANOV-417786 | ber |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-22083 @jira.link.detects.CHECKOUT-1857
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @live
  @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user adds <card_brand> card number on "Add New Card PMA" page. <card_brand> icon is shown
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "card_number.input" inputtext with the "<value>" text
      And clicks on the "cvv.input" inputtext
      And waits until the "card_number.<card_brand>" element is visible
     Then the "card_number.<card_brand>" icon is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

    Examples:
          | value            | card_brand | client  | execution | jira_id      |
          | 4761120000000148 | visa       | android | automatic | QANOV-66644  |
          | 5100290029002909 | mastercard | android | automatic | QANOV-66645  |
          | 5091064523532211 | elo        | android | automatic | QANOV-326018 |
          | 370000000000002  | amex       | android | automatic | QANOV-326019 |
          | 6062828888666688 | hipercard  | android | automatic | QANOV-326020 |
          | 4761120000000148 | visa       | ios     | manual    | QANOV-166451 |
          | 5100290029002909 | mastercard | ios     | manual    | QANOV-166452 |
          | 5091064523532211 | elo        | ios     | manual    | QANOV-326021 |
          | 370000000000002  | amex       | ios     | manual    | QANOV-326022 |
          | 6062828888666688 | hipercard  | ios     | manual    | QANOV-326023 |
          | 4761120000000148 | visa       | webapp  | automatic | QANOV-417787 |
          | 5100290029002909 | mastercard | webapp  | automatic | QANOV-417788 |
          | 5091064523532211 | elo        | webapp  | automatic | QANOV-417789 |
          | 370000000000002  | amex       | webapp  | automatic | QANOV-417790 |
          | 6062828888666688 | hipercard  | webapp  | automatic | QANOV-417791 |

  @jira.QANOV-285792 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user clicks on the CVV (i) link at the "Add New Card PMA" page without filling the card number
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "chevron" button
      And the "Add New Card PMA" page is displayed
      And switches to "embedded_iframe" iframe
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.message" textfield with "Código de Verificação do Cartão (CVC) de 3 ou 4 dígitos que está no verso do cartão" text is displayed
      And the "cvv_info.close" button is displayed
      And switches to original frame

  @jira.QANOV-285793 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user clicks on the CVV (i) link at the "Add New Card PMA" page with a VISA, Mastercard, ELO or Hypercard card number
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "chevron" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "4000000000000002" text
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.message" textfield with "Código de Verificação do Cartão (CVC) de 3 ou 4 dígitos que está no verso do cartão" text is displayed
      And the "cvv_info.close" button is displayed

  @jira.QANOV-285794 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy user clicks on the CVV (i) link at the "Add New Card PMA" page with an AMEX card number
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "chevron" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "340000000001007" text
      And clicks on the "cvv.info" link
     Then the "cvv_info" module is displayed
      And the "cvv_info.title" textfield with "Código de segurança (CVV)" text is displayed
      And the "cvv_info.message" textfield with "São os 4 dígitos do anverso de seu cartão." text is displayed
      And the "cvv_info.cards_list" list has "2" elements
      And the "cvv_info.close" button is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-22083
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @live
  @mobile @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user tries to add card to Payment Methods with invalid data
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And switches to "embedded_iframe" iframe
      And fills the "<field>.input" inputtext with the "<value>" text
      And clicks on the "<other_field>.input" inputtext
     Then the "<field>.error_message" textfield with "<feedback>" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

    Examples:
          | field           | value | other_field     | feedback                                          | client  | execution | jira_id      |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | android | automatic | QANOV-22084  |
          | expiration_date | 0     | cvv             | Data inválida                                     | android | automatic | QANOV-22085  |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | android | automatic | QANOV-22086  |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | ios     | manual    | QANOV-166453 |
          | expiration_date | 0     | cvv             | Data inválida                                     | ios     | manual    | QANOV-166454 |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | ios     | manual    | QANOV-166455 |
          | card_number     | 12345 | cvv             | Tem algo errado com este número. Dá uma conferida | webapp  | automatic | QANOV-417792 |
          | expiration_date | 0     | cvv             | Data inválida                                     | webapp  | automatic | QANOV-417793 |
          | cvv             | 12    | expiration_date | Código de segurança inválido                      | webapp  | automatic | QANOV-417794 |

  @jira.<jira_id> @<ber> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-22083
  @jira.link.detects.CHECKOUT-1631 @jira.link.detects.CHECKOUT-1632 @jira.link.detects.CHECKOUT-4524
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @mobile
  @qa @smoke @vivobr @old_app
  Scenario Outline: A no legacy user adds card to Payment Methods and see the success feedback screen
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And switches to "embedded_iframe" iframe
      And waits until the "card_number" element is visible
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And waits "1" seconds
      And <step>
     Then the "Feedback Payment Success" page is displayed
      And waits until the "success_message1" element is visible
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message1" textfield with "Seu cartão de crédito foi cadastrado." text is displayed
      And the "success_message2" textfield with "Você agora pode usar esse cartão pra pagar suas faturas." text is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And switches to original frame
      And the "navigation_top_bar.back_button" button is <back_button_display>

    Examples:
          | client  | execution | ber | step                             | back_button_display              | jira_id      |
          | android | automatic | ber | clicks on the "save" button      | not visible in the actual screen | QANOV-22088  |
          | ios     | manual    |     | clicks on the "save" button      | not visible in the actual screen | QANOV-195026 |

  @jira.QANOV-195027 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22083 @jira.link.parent_test_plan.QANOV-68826
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @manual @mobile @smoke @vivobr @old_app
  Scenario: A no legacy user adds card to Payment Methods and card is saved
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card PMA" page
      And fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
     When clicks on the "save" button
     Then the "Feedback Payment Methods Success" page is displayed
      And card_number "4761120000000148" is saved in payment methods area

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.8 @jira.link.depends_on.QANOV-22088
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @mobile
  @qa @regression @vivobr @old_app
  Scenario Outline: A no legacy user returns to Account after adding a new card
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And switches to "embedded_iframe" iframe
      And waits until the "card_number" element is visible
      And fills the "card_number.input" inputtext with the "4761120000000148" text
      And fills the "expiration_date.input" inputtext with the "1229" text
      And fills the "cvv.input" inputtext with the "111" text
      And waits "1" seconds
      And <step>
     Then the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" button
      And switches to original frame
     Then the "Account" page is displayed

    Examples:
          | client  | execution | step                             | jira_id      |
          | android | automatic | clicks on the "save" button      | QANOV-76790  |
          | ios     | manual    | clicks on the "save" button      | QANOV-195028 |
          | webapp  | automatic | I click on the "save" web button | QANOV-417796 |

  @jira.QANOV-22092 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22073
  @jira.link.detects.CHECKOUT-3077 @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1810 @mobile @qa @smoke @vivobr @old_app
  Scenario: A no legacy user clicks on remove card from "Credit Card Selection PMA" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And waits until the "dialog" element is visible
     Then the "dialog" element is displayed
      And the "dialog.title" textfield with the "Quer mesmo remover o cartão ••••\d\d\d\d da lista?" format is displayed
      And the "dialog.message" textfield with "Suas faturas que usam este cartão vão ter que ser pagas de outro jeito. É importante conferir se ainda vai ter alguma cobrança na próxima fatura ; )" text is displayed
      And the "dialog.accept" button with "CONFIRMAR" text is displayed
      And the "dialog.cancel" button with "CANCELAR" text is displayed

  @jira.QANOV-22094 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22092 @jira.link.parent_test_plan.QANOV-68826
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1810 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user cancels card removal
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
      And clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "dialog" element is displayed
     When clicks on the "dialog.cancel" button
     Then the "Credit Card Selection PMA" page is displayed
      And the "first" element of the "cards_list" is not deleted
      And switches to original frame

  @jira.QANOV-22096 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22092
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1810 @mobile
  @qa @smoke @vivobr @old_app
  Scenario: A no legacy user confirms card removal Success. Feedback message is shown
    Brand is the type of card: visa, mastercard, etc.
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And waits until the "dialog" element is visible
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
     Then the "warning.text" textfield with the "Tudo certo! Você removeu seu cartão ••••\d\d\d\d. Agora, é só adicionar outro \;\)" format is displayed

  @jira.QANOV-195029 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22092 @jira.link.parent_test_plan.QANOV-68826
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1810 @manual @mobile @smoke @vivobr @old_app
  Scenario: A no legacy user confirms card removal Success. Card is deleted
    Brand is the type of card: visa, mastercard, etc.
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "1" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
     Then the "Credit Card Selection PMA" page is displayed
      And the "first" element of the "cards_list" is deleted

  @jira.QANOV-22102 @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826
  @jira.link.parent_test_plan.QANOV-78038 @mobile @qa @regression @vivobr @old_app
  Scenario: A no legacy user with three cards saved in the Payment Methods Area accesses "Credit Card Selection PMA" page from "Invoices" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
     Then the "Gerenciar cartões" header is displayed
      And the "Credit Card Selection PMA" page is displayed
      And the "main_title" textfield with "Meus cartões de crédito" text is displayed
      And the "max_number_of_cards_info" textfield with "podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "cards_list" list has "3" elements
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "delete_card" field
      And the "add_card" button is not displayed

  @jira.QANOV-95743 @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038 @mobile @qa @regression
  @vivobr @old_app
  Scenario: User with recurrent payment enabled cannot delete the card used for recurrent payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
     Then the "dialog" element is displayed
      And the "dialog.title" textfield with "Você está usando esse cartão para pagar sua conta Vivo" text is displayed
      And the "dialog.message" textfield with "Para exclui-lo e necessário alterar o cartão usado para pagamento ou desativar o pagamento com cartão." text is displayed
      And the "dialog.cancel" button with "Cancelar" text is displayed
      And the "dialog.accept" button with "Alterar Cartão" text is displayed

  @jira.QANOV-108394 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95743
  @jira.link.parent_test_plan.QANOV-78038 @mobile @qa @regression @vivobr @old_app
  Scenario: User with recurrent payment enabled is redirected to manage recurrent payment page from the card used for recurrent payment popup when trying to delete it
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
     Then the "Manage Recurrent Payment" page is displayed

  @jira.QANOV-108395 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95743
  @jira.link.parent_test_plan.QANOV-78038 @mobile @qa @regression @vivobr @old_app
  Scenario: User with recurrent payment enabled can close the card used for recurrent payment popup when trying to delete it
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.cancel" button
     Then the "Credit Card Selection PMA" page is displayed

  @jira.QANOV-22121 @android @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1638 @jira.link.detects.CHECKOUT-1726
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @manual
  @mobile @regression @vivobr @old_app
  Scenario: A no legacy user reaches DCP inactivity timeout in "Add New Card PMA" page
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And waits "180" seconds
     Then the "Feedback Insert Card DCP Timeout Error" page is displayed
      And the "error_title" textfield with "Seu castro ainda não foi feito, mas é só começar de novo" text is displayed
      And the "error_message" textfield with "Você ficou um tempinho longe daqui e o pagamento não foi concluido" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-22123 @android @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1620 @jira.link.detects.CHECKOUT-1621
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @manual
  @mobile @regression @vivobr @old_app
  Scenario: A no legacy user in the "Feedback Insert Card DCP Timeout Error" page clicks on retry
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card PMA" page
      And waits "180" seconds
      And the "Feedback Insert Card DCP Timeout Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card PMA" page is displayed

  @jira.QANOV-22075 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.NOV-100992
  @jira.link.depends_on.QANOV-22083 @jira.link.detects.CHECKOUT-1582 @jira.link.detects.CHECKOUT-1641
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @mobile @no_automatable @regression
  @vivobr @old_app
  Scenario: A no legacy user tries to access "Credit Card Selection PMA" page from "Invoices" page. Error retrieving cards information
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.payment_methods_management" entrypoint
      And there is an error retrieving cards information
     Then the "Credit Card Selection PMA" page is displayed
      And the "Gerenciar cartões" header is displayed
      And the "main_title" textfield with "Meus cartões de crédito" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado ao carrgar o conteúdo" text is displayed
      And the "no_connectivity_text" textfield with "Aguarde alguns minutos e tente novamente." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

  @jira.QANOV-22098 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1810 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user confirms card removal. Error due to unknown card status
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "Remove Card Confirmation" popup is displayed
      And clicks on the "continue" button
      And the cards status can not be verified
     Then the "Credit Card Selection PMA" page is displayed
      And the "first" element of the "cards_list" is not deleted
      And the "warning.text" textfield is displayed in "red" color
      And the "warning.text" textfield with "Ainda estamos tentando remover seu cartão. Você pode voltar mais tarde pra ver se deu certo" text is displayed

  @jira.QANOV-22100 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-68826 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1810 @manual @mobile @regression @vivobr
  Scenario: A no legacy user confirms card removal. Error validating card data
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "Remove Card Confirmation" popup is displayed
      And clicks on the "continue" button
      And the card data can not be validated
     Then the "Credit Card Selection PMA" page is displayed
      And the "first" element of the "cards_list" is not deleted
      And the "warning.text" textfield is displayed in "red" color
      And the "warning.text" textfield with "Algo deu errado ao remover seu cartão de crédito" text is displayed

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1656
  @jira.link.detects.CHECKOUT-1836 @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1809 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A no legacy user tries to save card. DCP Error
    The result of the operation can be tracked in kibana filtering with:
    field logger is com.tuenti.services.checkout.service.dcp.callback.DCPCallbackController
    serviceName is checkout-service in the corresponding kibana and namespace
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<=3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card PMA" page
     When fills the "card_number" inputtext with the "<card_number>" text
      And fills the "expiration_date" inputtext with the "12/24" text
      And fills the "cvv" inputtext with the "123" text
      And clicks on the "save" button
      And a DCP error with "<DCP_error_code>" error code and "<error_name>" error name occurs
     Then the "Feedback Payment Methods Error" page is displayed
      And the "error_title" textfield with "Algo deu errado no cadastro do cartão de crédito" text is displayed
      And the "error_message" textfield with "Dá uma conferida nos dados do cartão e tente de novo" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "card_number" is not saved

    Examples:
          | DCP_error_code | error_name                          | card_number      | detects       | jira_id     |
          | 0100           | ERROR SISTEMA - DESCONOCIDO         | 2223000048410010 |               | QANOV-22105 |
          | 0908           | ERROR SISTEMA - LARGA DURACION      | 2223520443560010 |               | QANOV-22106 |
          | 0912           | ERROR SISTEMA - PUNTUAL             | 2222410740360010 |               | QANOV-22107 |
          | 0550           | ERROR ADQUIRIENTE (posible puntual) | 5100081112223332 | CHECKOUT-1749 | QANOV-22108 |
          | 0551           | ERROR ADQUIRIENTE                   | 5103221911199245 |               | QANOV-22109 |
          | 0230           | PENDIENTE                           | TBD              |               | QANOV-22110 |
          | 0238           | FRAUDE                              | 5577000055770004 |               | QANOV-22111 |
          | 0279           | TOKEN NO CREADO                     | 5136333333333335 |               | QANOV-22112 |
          | 0101           | ERROR FECHA (TARJETA EXPIRADA)      | 5585558555855583 |               | QANOV-22113 |
          | 0111           | ERROR NUMERO TARJETA                | 5555444433331111 |               | QANOV-22114 |
          | 0278           | FRAUDE POR LISTA BLANCA             | 5555555555554444 |               | QANOV-22115 |

  @jira.QANOV-22117 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-22083
  @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1809 @manual
  @mobile @regression @vivobr @old_app
  Scenario: A no legacy user tries to save card. Feedback Timeout
    other_affected_versions="2021-46-B"
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<=3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Add New Card PMA" page
     When fills the "card_number" inputtext with the "4761120000000148" text
      And fills the "expiration_date" inputtext with the "1229" text
      And fills the "cvv" inputtext with the "111" text
      And clicks on the "save" button
      And timeout is reached before card is saved
     Then the "Feedback Payment Methods Timeout Error" page is displayed
      And the "error_title" textfield with "Estamos tentando salvar seu cartão de crédito ainda" text is displayed
      And the "error_message" textfield with "Você pode voltar depois pra ver se deu tudo certo ou deixar pra ver quando for fazer um novo pagamento" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-22119 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1637
  @jira.link.detects.CHECKOUT-1732 @jira.link.parent_test_plan.QANOV-68826 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1809 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user tries to "Add New Card PMA" page from "Credit Card Selection PMA" page. Error loading the form
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page
      And user has the "Adicionar ou remover cartão" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Credit Card Selection PMA" page
     When user turns on the Airplane mode
      And clicks on the "chevron" button
      And there is an error loading the form
     Then the "Add New Card PMA" page is displayed
      And the "Gerenciar cartões" header is displayed
      And the "main_title" textfield with "Cadastre seu cartão de crédito" text is displayed
      And the "cards_accepted" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And the "no_connectivity_title" textfield with "Tem algo errado com sua internet" text is displayed
      And the "no_connectivity_text" textfield with "Veja sua conexão está ok e tente novamente" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

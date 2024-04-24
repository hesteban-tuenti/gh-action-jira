# -*- coding: utf-8 -*-
@jira.QANOV-477177
Feature: Payment Methods Area - vivobr - Novo App


  @jira.QANOV-477178 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user without saved cards accesses "Choose Payment Method PMA" page from "Bills Central" page
    Given user is not a "legacy;control_n;jeri" account type
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list is not displayed
      And the "add_card" button with "Novo cartão de crédito" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.QANOV-477179 @ber @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with saved cards accesses "Choose Payment Method PMA" page from "Bills Central" page
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has ">0" elements
      And each element in the "available_cards_list" list has the "company_icon" field
      And each element in the "available_cards_list" list has the "last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And each element in the "available_cards_list" list has the "delete_card" field
      And the "add_card" button with "Novo cartão de crédito" text is displayed

  @jira.QANOV-477180 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with three cards saved in the Payment Methods Area accesses "Choose Payment Method PMA" page from "Bills Details" page
    Given user is not a "legacy;control_n;jeri" account type
      And has "3" valid cards saved in the payment methods area
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "available_cards_list" list has the "company_icon" field
      And each element in the "available_cards_list" list has the "last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And each element in the "available_cards_list" list has the "delete_card" field
      And the "add_card" button is not displayed

  @jira.QANOV-477181 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with expired cards accesses "Choose Payment Method PMA" page from "Bills Central" page
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" expired cards saved in the payment methods area
      And has "<2" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has ">0" elements
      And each element in the "available_cards_list" list has the "company_icon" field
      And each element in the "available_cards_list" list has the "last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And each element in the "available_cards_list" list has the "delete_card" field
      And any element in the "available_cards_list" list has the "expired" textfield with the "Cartão de crédito expirado" text
      And the "add_card" button with "Novo cartão de crédito" text is displayed

  @jira.QANOV-477182 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user with recurrent payment enabled accesses "Choose Payment Method PMA" page from "Bills Central" page
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Você pode adicionar até 3 cartões" text is displayed
      And the "payment_methods_list" list has ">0" elements
      And each element in the "available_cards_list" list has the "company_icon" field
      And each element in the "available_cards_list" list has the "last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) •••• \d\d\d\d" format
      And each element in the "available_cards_list" list has the "delete_card" field
      And any element in the "available_cards_list" list has the "payment_message" textfield with the "Pagamento recorrente ativo" text

  @jira.QANOV-477183 @ber @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user accesses to "Add New Card PMA" page from "Choose Payment Method PMA" page
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
     Then the "Add New Card PMA" page is displayed
      And the "main_title" textfield with "Agora é hora de inserir os dados do seu cartão de crédito" text is displayed
      And the "card_number" module is displayed
      And the "card_number.label" textfield with "Número do cartão" text is displayed
      And the "card_number.input" inputtext is displayed
      And the "expiration_date.label" textfield with "Validade" text is displayed
      And the "expiration_date.input" inputtext is displayed
      And the "cvv.label" textfield with "CVC" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" icon is displayed
      And the "save" button with "Adicionar cartão" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario Outline: A no legacy user adds <card_brand> card number on "Add New Card" page. <card_brand> icon is shown
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "<value>" text
      And clicks on the "cvv.input" inputtext
     Then the "card_number.<card_brand>" icon is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

    Examples:
          | value            | card_brand | jira_id      |
          | 4761120000000148 | visa       | QANOV-477184 |
          | 5100290029002909 | mastercard | QANOV-477185 |
          | 5091064523532211 | elo        | QANOV-477186 |
          | 370000000000002  | amex       | QANOV-477187 |
          | 6062828888666688 | hipercard  | QANOV-477188 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario Outline: A no legacy user tries to add card to Payment Methods with invalid data
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "<field>.input" inputtext with the "<value>" text
      And clicks on the "<other_field>.input" inputtext
     Then the "<field>.error_message" textfield with "<feedback>" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Details" page is displayed

    Examples:
          | field           | value | other_field     | feedback                                | jira_id      |
          | card_number     | 12345 | cvv             | Número não encontrado. Dê uma conferida | QANOV-477189 |
          | expiration_date | 0     | cvv             | Validade incorreta. Dê uma conferida    | QANOV-477190 |
          | cvv             | 12    | expiration_date | Dê uma conferida                        | QANOV-477191 |

  @jira.QANOV-477192 @ber @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user adds card to Payment Methods and see the success feedback screen
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
     Then the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "save" button
      And the "pay" button displays a spinner in it
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Você cadastrou seu cartão de crédito" text is displayed
      And the "success_message" textfield with "Você agora pode usar esse cartão pra pagar suas faturas" text is displayed
      And the "ok_button" button with "Ir pro início" text is displayed
      And card_number "376674000000008" is saved in payment methods area

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477192
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user returns to Account after adding a new card
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "save" button
      And clicks on the "ok_button" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-477193 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: A no legacy user clicks on remove card from "Choose Payment Method PMA" page
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
     Then the "dialog" element is displayed
      And the "dialog.title" textfield with the "Quer remover o cartão ••••\d\d\d\d?" format is displayed
      And the "dialog.message" textfield with "É importante que você insira outro cartão ou forma de pagamento para pagar as próximas faturas" text is displayed
      And the "dialog.accept" button with "Sim, remover" text is displayed
      And the "dialog.cancel" button with "Voltar" text is displayed

  @jira.QANOV-477194 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477193
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user cancels card removal
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.cancel" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "first" element of the "available_cards_list" is not deleted

  @jira.QANOV-477195 @ber @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477193
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @sanity @vivobr
  Scenario: A no legacy user confirms card removal Success. Feedback message is shown
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
     Then the "warning.text" textfield with "Você removeu o cartão de crédito" text is displayed
      And the "warning.link" textfield with "Fechar" text is displayed
      And the "first" element of the "available_cards_list" is deleted

  @jira.QANOV-477196 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477195
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user can close the warning after deleting a card
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
      And clicks on the "warning.link" button
     Then the "dialog" element is not displayed

  @jira.QANOV-477197 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477195
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user waits 15 seconds after deleting a card. The warning is not shown
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
      And waits "15" seconds
     Then the "dialog" element is not displayed

  @jira.QANOV-477198 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477193
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user confirms card removal Success and there is an error. Error message is shown
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
      And there is an error saving the card
     Then the "warning.text" textfield with "Algo deu errado ao remover o cartão. Tente de novo mais tarde" text is displayed
      And the "warning.link" textfield with "Entendi" text is displayed
      And the "first" element of the "available_cards_list" is deleted

  @jira.QANOV-477199 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477198
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user can close the warning after deleting a card with an error
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
      And there is an error saving the card
      And clicks on the "warning.link" button
     Then the "dialog" element is not displayed

  @jira.QANOV-477200 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477198
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user waits 15 seconds after trying to delete a card with an error. The warning is not shown
    Given user is not a "legacy;control_n;jeri" account type
      And has ">0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
      And there is an error saving the card
      And waits "15" seconds
     Then the "dialog" element is not displayed

  @jira.QANOV-477201 @ber @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @smoke @vivobr
  Scenario: User with recurrent payment enabled cannot delete the card used for recurrent payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
     Then the "dialog" element is displayed
      And the "dialog.title" textfield with the "Quer remover o cartão ••••\d\d\d\d?" format is displayed
      And the "dialog.message" textfield with "Você está usando esse cartão para pagar sua conta Vivo. Para remover o cartão é necessário alterar o cartão usado para pagamento automático ou desativar o pagamento automático." text is displayed
      And the "dialog.accept" button with "Alterar cartão" text is displayed
      And the "dialog.cancel" button with "Voltar" text is displayed

  @jira.QANOV-477202 @ber @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477201
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user cancels recurrent payment card removal
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.cancel" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "first" element of the "available_cards_list" is not deleted

  @jira.QANOV-477203 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477201
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user is redirected to choose payment method after tapping on confirm to delete a card used for recurrent payment
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "delete_card" button of "available_cards_list" list with "0" index
      And the "dialog" element is displayed
      And clicks on the "dialog.accept" button
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Em qual cartão você quer ativar o pagamento automático?" text is displayed

  @jira.QANOV-477204 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user tries to access "Choose Payment Method PMA" page from "Bills Central" page. Error retrieving cards information
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "configured" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And there is an error retrieving cards information
     Then the "Choose Payment Method PMA" page is displayed
      And the "main_title" textfield with "Em qual cartão você quer ativar o pagamento automático?" text is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado ao carrgar o conteúdo" text is displayed
      And the "no_connectivity_text" textfield with "Aguarde alguns minutos e tente novamente." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

  @jira.QANOV-477205 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user tries to save card. Feedback Timeout
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "save" button
      And timeout is reached before card is saved
     Then the "Feedback Payment Error" page is displayed
      And the "error_title" textfield with "Estamos tentando salvar seu cartão crédito." text is displayed
      And the "error_message" textfield with "Volte mais tarde para conferir se deu deu certo ou deixe para ver quando for fazer um novo pagamento." text is displayed
      And the "continue" button with "Continuar" text is displayed
      And the "back" button with "Tentar de novo" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-477206 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user tries to access to "Add New Card" page from "Choose Payment Method PMA" page. Error loading the form
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And there is an error loading the form
     Then the "Add New Card PMA" page is displayed
      And the "main_title" textfield with "Em qual cartão você quer ativar o pagamento automático?" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "elo_icon" icon is displayed
      And the "amex_icon" icon is displayed
      And the "hipercard_icon" icon is displayed
      And the "no_connectivity_title" textfield with "Tem algo errado com sua internet" text is displayed
      And the "no_connectivity_text" textfield with "Veja sua conexão está ok e tente novamente" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

  @jira.QANOV-477207 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr @jira.link.parent_test_plan.QANOV-529758
  Scenario: A no legacy user tries to add a card to Payment Methods. Error is shown
    For LIVE environment, we have to use a real card
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "save" button
      And there is an error saving the card
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "error_title" textfield with "Algo deu errado com o cartão de crédito" text is displayed
      And the "error_message" textfield with "Tente de novo mais tarde. Se o erro continuar, entre em contato com o banco" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-477208 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477207
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on retry button after trying to save a card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "save" button
      And there is an error saving the card
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card PMA" page is displayed

  @jira.QANOV-477209 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-477207
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with recurrent payment enabled taps on back button after after trying to save a card and there is an error
    Given user is not a "legacy;control_n;jeri" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "save" button
      And there is an error saving the card
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Assinatura" page is displayed

  @jira.QANOV-550605 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @regression @vivobr
  Scenario: A no legacy user add new card pasting card number on input field
    Given user is not a "legacy" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And the clipboard has the "376674000000008" text
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And pastes clipboard content into the "card_number.input" inputtext
     Then the "card_number.input" inputtext with "376674000000008" text is displayed

  @jira.QANOV-550606 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-439542
  @jira.link.parent_test_plan.QANOV-529758 @manual @mobile @regression @vivobr
  Scenario: A no legacy user pastes card number on input field: only numbers are pasted
    Given user is not a "legacy" account type
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the accountt
      And the clipboard has the "376674000000008abc" text
      And user is in the "Bills Central" page
     When clicks on any element in the "bill.meatball_menu" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
      And the "Bills Details" page is displayed
      And clicks on the "payment_methods_management" button
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card PMA" page is displayed
      And pastes clipboard content into the "card_number.input" inputtext
     Then the "card_number.input" inputtext with "376674000000008" text is displayed

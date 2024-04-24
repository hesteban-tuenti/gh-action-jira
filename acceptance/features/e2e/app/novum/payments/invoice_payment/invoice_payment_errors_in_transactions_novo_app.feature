# -*- coding: utf-8 -*-
@jira.QANOV-453949
Feature: Invoice Payment with Credit Card Errors in transactions - Novo App


  @jira.QANOV-453950 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and without credit cards sees an error when payment is failed and card is not saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And there is a server error in payment
      And there is an error saving the card
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algo deu errado. Tente de novo mais tarde" text is displayed
      And the "informative_message" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And card with number "376674000000008" is not saved in the payment methods area

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453950
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and without credit cards tap on <button> button when payment is failed and card is not saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And there is a server error in payment
      And there is an error saving the card
      And clicks on the "<button>" button
     Then the "<screen>" page is displayed

    Examples:
          | button | screen        | jira_id      |
          | retry  | Add New Card  | QANOV-453951 |
          | back   | Bills Central | QANOV-453952 |

  @jira.QANOV-453953 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and without credit cards sees an error when payment is failed and card is saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And there is a server error in payment
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algo deu errado com o pagamento" text is displayed
      And the "informative_message" textfield with the "Mas o seu cartão de crédito, final •••• \d\d\d\d, já foi salvo para você tentar de novo agora ou mais tarde" format is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And card with number "376674000000008" is saved in the payment methods area

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453953
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and without credit cards tap on <button> button when payment is failed and card is saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And there is a server error in payment
      And clicks on the "<button>" button
     Then the "<screen>" page is displayed
      And card with number "376674000000008" is saved in the payment methods area

    Examples:
          | button | screen                | jira_id      |
          | retry  | Choose Payment Method | QANOV-453954 |
          | back   | Bills Central         | QANOV-453955 |

  @jira.QANOV-453956 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and without credit cards sees an informative screen when payment in pending and card is not saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And payment is pending
      And there is an error saving the card
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Estamos processando o pagamento" text is displayed
      And the "informative_message" textfield with "Você pode conferir, em até 48h na Central de faturas, se a fatura foi paga" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And card with number "376674000000008" is not saved in the payment methods area

  @jira.QANOV-453957 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453956
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with one bill and without credit cards clicks on the back button when payment in pending and card is not saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And payment is pending
      And there is an error saving the card
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills Central" page is displayed
      And card with number "376674000000008" is not saved in the payment methods area

  @jira.QANOV-453958 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and without credit cards sees an error when payment in pending and card is saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And payment is pending
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Estamos processando o pagamento" text is displayed
      And the "informative_message" textfield with the "Você pode conferir, em até 48h na Central de faturas, se a fatura foi paga Mas o seu cartão de crédito, final •••• \d\d\d\d, já foi salvo para você usar nos próximos pagamentos" format is displayed
      And the "back" button with "Ir para o início" text is displayed
      And card with number "376674000000008" is saved in the payment methods area

  @jira.QANOV-453959 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453958
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with one bill and without credit cards clicks on the back button when payment in pending and card is saved
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "376674000000008" text
      And fills the "expiration_date.input" inputtext with the "1249" text
      And fills the "cvv.input" inputtext with the "1234" text
      And clicks on the "pay" button
      And payment is pending
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills Central" page is displayed
      And card with number "376674000000008" is saved in the payment methods area

  @jira.QANOV-453960 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and without credit cards sees an error after waiting 180 seconds in the add new card screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
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

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453960
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and without credit cards taps on <button> button in the "Feedback Payment Error" screen after waiting 180 seconds in the add new card screen
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Add New Card" page is displayed
      And waits "180" seconds
      And the "Feedback Payment Error" page is displayed
      And clicks on the "<button>" button
     Then the "<screen>" page is displayed

    Examples:
          | button | screen        | jira_id      |
          | retry  | Add New Card  | QANOV-453961 |
          | back   | Bills Central | QANOV-453962 |

  @jira.QANOV-453963 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A blacklisted user without saved cards user cannot pay a bill with a new credit card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algo deu errado com o pagamento das faturas" text is displayed
      And the "informative_message" textfield with "Para você conseguir pagar, use Pix ou código de barras e pague uma fatura de cada vez" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-453964 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453963
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A blacklisted user without saved cards tap on back button after trying to pay a bill with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "0" valid cards saved in the payment methods area
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Bill Selection" page is displayed
      And selects "2" elements of "unpaid_bills_list" list
      And clicks on the "continue" button
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills Central" page is displayed

  @jira.QANOV-453965 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A blacklisted user with saved cards cannot pay a bill with a saved card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.pay_current_bill" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algo deu errado com o pagamento das faturas" text is displayed
      And the "informative_message" textfield with "Para você conseguir pagar, use Pix ou código de barras e pague uma fatura de cada vez" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-453966 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453965
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A blacklisted user with saved cards taps on back button after trying to pay a bill with a saved card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.pay_current_bill" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "0" element in the "payment_methods_list" list
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills Central" page is displayed

  @jira.QANOV-453967 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A blacklisted user with saved cards user cannot pay a bill with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.pay_current_bill" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
     Then the "Feedback Payment Error" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Algo deu errado com o pagamento das faturas" text is displayed
      And the "informative_message" textfield with "Para você conseguir pagar, use Pix ou código de barras e pague uma fatura de cada vez" text is displayed
      And the "back" button with "Ir para o início" text is displayed

  @jira.QANOV-453968 @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453967
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario: A blacklisted user with saved cards taps on back button after trying to pay a bill with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And is blacklisted by the OB for credit card payment
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And clicks on the "more_bills_unpaid.pay_current_bill" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "add_card" button
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills Central" page is displayed

  @jira.QANOV-453969 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and without connectivity sees the "Payments No Connectivity" screen after selecting a bill to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When turns on the Airplane mode
      And clicks on the "pay_bill_button" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado com a conexão de internet" text is displayed
      And the "no_connectivity_text" textfield with "Tente de novo mais tarde ou use outra rede pra se conectar" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And user turns off the Airplane mode

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453969
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and without connectivity taps on <button> button in the "Payments No Connectivity" screen after selecting a bill to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When turns on the Airplane mode
      And clicks on the "pay_bill_button" button
      And the "Payments No Connectivity" page is displayed
      And user turns off the Airplane mode
      And clicks on the "<button>" button
     Then the "Bills Central" page is displayed

    Examples:
          | button | jira_id      |
          | retry  | QANOV-453970 |
          | back   | QANOV-453971 |

  @jira.QANOV-453972 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with several bills and without connectivity sees the "Payments No Connectivity" screen before selecting one bill to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And turns on the Airplane mode
      And clicks on the "more_bills_unpaid.pay_current_bill" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado com a conexão de internet" text is displayed
      And the "no_connectivity_text" textfield with "Tente de novo mais tarde ou use outra rede pra se conectar" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And user turns off the Airplane mode

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453972
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with several bills and without connectivity taps on <button> button in the "Payments No Connectivity" screen before selecting one bill to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And turns on the Airplane mode
      And clicks on the "more_bills_unpaid.pay_current_bill" button
      And the "Payments No Connectivity" page is displayed
      And user turns off the Airplane mode
      And clicks on the "<button>" button
     Then the "Bills Central" page is displayed

    Examples:
          | button | jira_id      |
          | retry  | QANOV-453973 |
          | back   | QANOV-453974 |

  @jira.QANOV-453975 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with several bills and without connectivity sees the "Payments No Connectivity" screen before selecting several bills to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And turns on the Airplane mode
      And clicks on the "more_bills_unpaid.select_more_bills" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado com a conexão de internet" text is displayed
      And the "no_connectivity_text" textfield with "Tente de novo mais tarde ou use outra rede pra se conectar" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And user turns off the Airplane mode

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453975
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with several bills and without connectivity taps on <button> button in the "Payments No Connectivity" screen before selecting several bills to pay
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on any element in the "pay_bill_button" list
      And the "more_bills_unpaid" popup is displayed
      And turns on the Airplane mode
      And clicks on the "more_bills_unpaid.select_more_bills" button
      And the "Payments No Connectivity" page is displayed
      And user turns off the Airplane mode
      And clicks on the "<button>" button
     Then the "Bills Central" page is displayed

    Examples:
          | button | jira_id      |
          | retry  | QANOV-453976 |
          | back   | QANOV-453977 |

  @jira.QANOV-453978 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and with some valid credit cards saved sees the "Payments No Connectivity" when after selecting the saved card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And turns on the Airplane mode
      And clicks on the "2" element in the "payment_methods_list" list
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado com a conexão de internet" text is displayed
      And the "no_connectivity_text" textfield with "Tente de novo mais tarde ou use outra rede pra se conectar" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And user turns off the Airplane mode

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453978
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and with some valid credit cards saved taps on <button> button in the "Payments No Connectivity" when after selecting the saved card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And turns on the Airplane mode
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payments No Connectivity" page is displayed
      And clicks on the "<button>" button
     Then the "<screen>" page is displayed

    Examples:
          | button | screen                | jira_id      |
          | retry  | Choose Payment Method | QANOV-453979 |
          | back   | Bills Central         | QANOV-453980 |

  @jira.QANOV-453981 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill sees the "Payments No Connectivity" when trying to pay the bill with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And turns on the Airplane mode
      And clicks on the "add_card" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado com a conexão de internet" text is displayed
      And the "no_connectivity_text" textfield with "Tente de novo mais tarde ou use outra rede pra se conectar" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And user turns off the Airplane mode

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453981
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill taps on <button> button in the "Payments No Connectivity" when trying to pay the bill with a new card
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has "<3" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And turns on the Airplane mode
      And clicks on the "add_card" button
      And the "Payments No Connectivity" page is displayed
      And clicks on the "<button>" button
     Then the "<screen>" page is displayed

    Examples:
          | button | screen                | jira_id      |
          | retry  | Choose Payment Method | QANOV-453982 |
          | back   | Bills Central         | QANOV-453983 |

  @jira.QANOV-453984 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression
  @vivobr
  Scenario: A no legacy user with one bill and with some valid credit cards saved sees the "Payments No Connectivity" when trying to pay the bill
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And turns on the Airplane mode
      And clicks on the "pay" button
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Algo deu errado com a conexão de internet" text is displayed
      And the "no_connectivity_text" textfield with "Tente de novo mais tarde ou use outra rede pra se conectar" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ir para o início" text is displayed
      And user turns off the Airplane mode

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.depends_on.QANOV-453984
  @jira.link.parent_test_plan.QANOV-439542 @manual @mobile @regression @vivobr
  Scenario Outline: A no legacy user with one bill and with some valid credit cards saved taps on <button> button in the "Payments No Connectivity" when trying to pay the bill
    Given user is not a "legacy;control_n;jeri" account type
      And has "1" bills in "unpaid" status in any subscription
      And has ">0" valid cards saved in the payment methods area
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills Central" page
     When clicks on the "pay_bill_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "2" element in the "payment_methods_list" list
      And the "Payment Summary" page is displayed
      And turns on the Airplane mode
      And clicks on the "pay" button
      And the "Payments No Connectivity" page is displayed
      And clicks on the "<button>" button
     Then the "<screen>" page is displayed

    Examples:
          | button | screen          | jira_id      |
          | retry  | Payment Summary | QANOV-453985 |
          | back   | Bills Central   | QANOV-453986 |

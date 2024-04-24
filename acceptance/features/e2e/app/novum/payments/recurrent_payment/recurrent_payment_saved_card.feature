# -*- coding: utf-8 -*-
@jira.QANOV-95745
Feature: Recurrent Payment disabled with saved card

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-95746 @android @automatic @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-2199 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1806 @jira.link.tests.CHECKOUT-2072 @mobile @qa
  @sanity @vivobr
  Scenario: A no legacy user with less than 3 cards saved and with recurrent payment disabled access to Enable With Saved Card from Credit Card Selection screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And has "<3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
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
      And the "enable" button with "Ativar pagamento automático" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Enable Recurrent Payment" page is displayed

  @jira.QANOV-95747 @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @mobile @qa @smoke @vivobr @old_app
  Scenario: A no legacy user with 3 cards saved and with recurrent payment disabled access to Enable With Saved Card from Credit Card Selection screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And has "3" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
     Then the "Enable With Saved Card" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Quero fazer pagamento automático com o cartão:" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "available_cards_label" textfield with "CARTÕES DISPONÍVEIS" text is displayed
      And the "cards_list" list is displayed
      And the "cards_list" list has "3" elements
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" textfield with the "(Visa|Mastercard|AMEX|ELO|Hypercard) ••••\d\d\d\d" format
      And each element in the "cards_list" list has the "expiration" textfield with the "\d{2}\/\d{2}" format
      And any element in the "cards_list" list has the "selected" field
      And the "enable" button with "Ativar pagamento automático" text is displayed

  @jira.QANOV-95748 @android @automation.pending_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user and with recurrent payment disabled and with 3 credit cards in his payment methods area in expired status cannot enable recurrent payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And has "3" expired cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
     Then the "Credit Card Selection" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Escolha um cartão pra fazer o pagamento automático" text is displayed
      And the "max_number_of_cards_info" textfield with "Podem ser cadastrados no máximo 3 cartões." text is displayed
      And the "expired_cards_label" textfield with "CARTÕES VENCIDOS" text is displayed
      And the "expired_cards_list" list is displayed
      And the "expired_cards_list" list has "3" elements
      And each element in the "expired_cards_list" list has the "company_icon" field
      And each element in the "expired_cards_list" list has the "last_digits" field
      And each element in the "expired_cards_list" list has the "expiration" field with "Vencido" text
      And the "return" button with "Ok, ir pro início" text is displayed

  @jira.QANOV-95749 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95748 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user and with recurrent payment disabled and with 3 credit cards in his payment methods area in expired status returns to bill from Credit Card Selection screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "3" expired cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "return" button
     Then the "Bills" page is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-2114
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1806 @mobile @qa @vivobr @old_app
  Scenario Outline: A <account_type> user with saved cards and with recurrent payment disabled clicks on pay button in the "Enable With Saved Card" page. Payment processed successfully
    other_affected_versions="2021-50"
    The OB system will send an SMS notifying the customer that the feature has been activated
    Given user has a "<account_type>" account type
      And user is not a "siebel" plan
      And user does not have a "prepay" account type
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Enable With Saved Card" page is displayed
      And clicks on the "enable" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_title" textfield with "Deu certo! Você ativou seu pagamento no cartão de crédito" text is displayed
      And the "success_message1" textfield with the "Pra saber quando os débitos no cartão ••••\d\d\d\d vão começar a acontecer é só acompanhar sua conta Vivo." format is displayed
      And the "success_message2" textfield with "Confira se suas faturas anteriores estão em dia. Se tiver alguma pendência, o pagamento deve ser feito de outra forma." text is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not visible in the actual screen

    Examples:
          | account_type | test_priority | ber | jira_id     |
          | beatrix      | regression    | ber | QANOV-95753 |
          | convergente  | smoke         |     | QANOV-95754 |
          | multivivo    | regression    |     | QANOV-95755 |

  @jira.<jira_id> @android @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user with saved cards and with recurrent payment disabled returns to Account after enabling recurrent payment successfully
    other_affected_versions="2021-50"
    Given user has a "<account_type>" account type
      And user is not a "siebel" plan
      And user does not have a "prepay" account type
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Enable With Saved Card" page is displayed
      And clicks on the "enable" button
      And the "Feedback Payment Success" page is displayed
      And clicks on the "back" entrypoint
     Then the "Account" page is displayed

    Examples:
          | account_type | depends_on  | jira_id     |
          | beatrix      | QANOV-95753 | QANOV-95756 |
          | convergente  | QANOV-95754 | QANOV-95757 |
          | multivivo    | QANOV-95755 | QANOV-95758 |

  @jira.QANOV-95750 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with cards saved and with recurrent payment disabled sees an error if the cards cannot be retrieved and the DCP forms cannot load
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "success_message" textfield with the "Cartão de crédito \*\*\*\*\d\d\d\d foi cadastrado. O primeiro pagamento com cartão pode ocorrer em até 2 vencimentos da fatura Vivo. Dá uma conferida na sua fatura do cartão e se não constar a fatura Vivo, você precisa usar outra forma de pagamento, ok?" format is displayed
      And there is an error retrieving the cards information
      And there is an error loading the DCP form
     Then the "Enable With Saved Card Error" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Não foi possível carregar seus cartões. Cadastre um novo" text is displayed
      And the "valid_cards_info" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "form_error_title" textfield with "Algo deu errado ao carregar o conteúdo" text is displayed
      And the "form_error_text" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed

  @jira.QANOV-95751 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95750 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with cards saved and with recurrent payment disabled can retry the form when there is an error retrieving the cards information and loading the DCP form
    other_affected_versions="2021-50"
    Once the errors are solved, the retry button will redirect to the correct screen
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "success_message" textfield with the "Cartão de crédito \*\*\*\*\d\d\d\d foi cadastrado. O primeiro pagamento com cartão pode ocorrer em até 2 vencimentos da fatura Vivo. Dá uma conferida na sua fatura do cartão e se não constar a fatura Vivo, você precisa usar outra forma de pagamento, ok?" format is displayed
      And there is an error retrieving the cards information
      And there is an error loading the DCP form
      And clicks on the "retry" button
     Then the "Enable With Saved Card" page is displayed

  @jira.QANOV-95752 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with cards saved and with recurrent payment disabled sees an error if the cards cannot be retrieved
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "success_message" textfield with the "Cartão de crédito \*\*\*\*\d\d\d\d foi cadastrado. O primeiro pagamento com cartão pode ocorrer em até 2 vencimentos da fatura Vivo. Dá uma conferida na sua fatura do cartão e se não constar a fatura Vivo, você precisa usar outra forma de pagamento, ok?" format is displayed
      And there is an error retrieving the cards information
     Then the "Enable With Saved Card Error" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "Não foi possível carregar seus cartões. Cadastre um novo" text is displayed
      And the "valid_cards_info" textfield with "Você pode pagar com as bandeiras:" text is displayed
      And the "visa.icon" icon is displayed
      And the "mastercard.icon" icon is displayed
      And the "card_number_label" textfield with "Número do cartão: *" text is displayed
      And the "card_number" inputtext is displayed
      And the "expiration_label" textfield with "Vencimento: *" text is displayed
      And the "expiration_date" inputtext with the "MM/AA" placeholder is displayed
      And the "cvv_label" textfield with "Código de segurança (CVV): *" text is displayed
      And the "cvv" inputtext is displayed
      And the "cvv_info" link with "(i)" text is displayed
      And the "add_card" button with "Cadastrar cartão e Ativar pagamento" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-95759 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95746 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with saved cards and with recurrent payment disabled clicks on pay button in the "Enable Recurrent Payment" page with valid data. Payment processed unsuccessfully due to DCP payment error. Card not saved
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Enable With Saved Card" page is displayed
      And clicks on the "enable" button
      And there is an error saving the card
      And there is an error with the payment
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "error_title" textfield with "Alguma coisa deu errado ao ativar seu pagamento automático" text is displayed
      And the "error_text" textfield with "Você pode tentar de novo agora ou fazer isso mais tarde." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-95760 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95759 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with saved cards and with recurrent payment disabled in the Feedback Recurrent Payment Error after an error saving the card can add the card again
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has "0" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Enable With New Card" page
      And there is an error saving the card
      And there is an error with the payment
      And the "Feedback Recurrent Payment Error" page is displayed
     When clicks on the "retry" button
     Then the "Enable With New Card" page is displayed

  @jira.QANOV-95761 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95746 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1806 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with saved cards and with recurrent payment disabled clicks on pay button in the "Enable Recurrent Payment" page with valid data. Payment result unknown
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Enable With Saved Card" page is displayed
      And clicks on the "enable" button
      And the result of the payment is unknown
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "unknown_status_title" textfield with "Estamos tentando ativar seu serviço ainda" text is displayed
      And the "unknown_status_message" textfield with "Você pode voltar depois pra ver se deu tudo certo" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

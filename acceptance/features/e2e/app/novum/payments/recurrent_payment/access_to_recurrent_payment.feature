# -*- coding: utf-8 -*-
@jira.QANOV-95669
Feature: Access to Recurrent Payment

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.<jira_id> @android @automatic @ios @jira.cv.12.8 @jira.link.detects.<detects> @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.<tests> @mobile @smoke @vivobr @webapp
  Scenario Outline: A no legacy user with recurrent payment <recurrent_payment_status> can see the status of recurrent payment in the Bills page
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     Then the "bills_settings.recurrent_payment_title_textfield" textfield with "Cartão de crédito" text is displayed
      And the "bills_settings.recurrent_payment_status_textfield" textfield with "<status_text>" text is displayed

    @qa
    Examples:
          | recurrent_payment_status | status_text | tests         | detects       | jira_id     |
          | configured               | Ativado     | CHECKOUT-1787 | CHECKOUT-2070 | QANOV-95670 |
          | deactivated              | Desativado  | CHECKOUT-1786 | CHECKOUT-2071 | QANOV-95671 |

  @jira.QANOV-95672 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-2096 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1788 @jira.link.tests.CHECKOUT-1789 @manual @mobile
  @regression @vivobr
  Scenario: A no legacy user with recurrent payment in pending status can see the status of recurrent payment in the Bills page
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "pending" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     Then the "bills_settings.recurrent_payment_title_textfield" textfield with "Cartão de crédito" text is displayed
      And the "bills_settings.recurrent_payment_status_textfield" textfield with the "(Ativando|Desativando)" format is displayed

  @jira.QANOV-95651 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1959
  @manual @mobile @regression @vivobr @old_app
  Scenario: A blacklisted user can see an information screen by tapping on the recurrent payment entrypoint
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user is blacklisted to pay with card
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
     Then the "Feedback Recurrent Payment Error" page is displayed
      And the "error_title" textfield with "Não é possível realizar seu pagamento no cartão de crédito" text is displayed
      And the "automatic_debt_message" textfield with "Vimos que teve um estorno no pagamento da sua fatura Vivo com cartão de crédito. Pra su segurança, use outro meio de sua preferência:" text is displayed
      And the "automatic_debt_subtitle" textfield with "Débito automático" text is displayed
      And the "expiration_message" textfield with "Você não se preocupa como o vencimiento. O valor é debitado todo mês na sua conta bancária" text is displayed
      And the "barcode_subtitle" textfield with "Código de barras" text is displayed
      And the "barcode_message" textfield with "Você usa o código de barras e escolhe como pagar: no site, no app ou onde seu banco permitir" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-95652 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95651 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1959 @manual @mobile @regression @vivobr @old_app
  Scenario: A blacklisted user can return to bills page after seeing the information screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user is blacklisted to pay with card
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Feedback Recurrent Payment Error" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed

  @jira.QANOV-95674 @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1786 @mobile @qa @sanity @vivobr @webapp @old_app
  Scenario: A no legacy user with recurrent payment in disabled status can access to the Enable Recurrent Payment screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
     Then the "Enable Recurrent Payment" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "A fatura Vivo todo mês direto na fatura do seu cartão" text is displayed
      And the "enable" button with "Ativar" text is displayed
      And the "terms_message" textfield that contains the "Ao ativar você aceita nossos Termos e condições" text is displayed
      And the "terms_link" textfield that contains the "Termos e condições" text is displayed
      And the "recurrent_payment_message_1_icon" icon is displayed
      And the "recurrent_payment_message_1_title" textfield with "Comodidade" text is displayed
      And the "recurrent_payment_message_1_description" textfield with "Sem preocupação com o vencimento da fatura Vivo" text is displayed
      And the "recurrent_payment_message_2_icon" icon is displayed
      And the "recurrent_payment_message_2_title" textfield with "Fatura? Só pra conferir" text is displayed
      And the "recurrent_payment_message_2_description" textfield with "A fatura Vivo ainda é enviada todo mês com os detalhes dos gastos" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-95675 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1785
  @manual @mobile @qa @regression @vivobr @webapp @old_app
  Scenario: A no legacy user accesses to Terms & Conditions from "Enable Recurrent Payment" page
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "terms_link" link
      And switches to original frame
     Then the internal webview with "Termos e condições" header is displayed
      And clicks on the "navigation_top_bar.close_button" button to go back to the previous page
      And the "Enable Recurrent Payment" page is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1786 @mobile @qa @smoke @vivobr @webapp @old_app
  Scenario Outline: A no legacy user with <cards_saved> cards saved and with recurrent payment in disabled status and automatic debit disabled can access to <page_name> from Enable Recurrent Payment screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "deactivated" status
      And has "<cards_saved>" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
     Then the "<page_name>" page is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Enable Recurrent Payment" page is displayed

    Examples:
          | cards_saved | page_name              | jira_id     |
          | 0           | Add New Card           | QANOV-95676 |
          | >=1         | Enable With Saved Card | QANOV-95677 |

  @jira.QANOV-95678 @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1790 @mobile @qa @smoke @vivobr @webapp @old_app
  Scenario: A no legacy user with recurrent payment in disabled status and automatic debit enabled sees a popup when trying to enable recurrent payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And waits until the "dialog" element is visible
     Then the "dialog" module is displayed
      And the "dialog.title" textfield with "Pra continuar, você tem que desativar o débito automático" text is displayed
      And the "dialog.message" textfield with "Você vai perder o bônus de 3GB e pode ser que a próxima fatura Vivo ainda venha em débito automático" text is displayed
      And the "dialog.cancel" button with "Fechar" text is displayed
      And the "dialog.accept" button with "Desativar" text is displayed

  @jira.QANOV-95679 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95678 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1790 @mobile @qa @regression @vivobr @webapp
  Scenario: A no legacy user with recurrent payment in disabled status and automatic debit enabled can close the Disable Automatic Debit popup
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And waits until the "dialog" element is visible
      And the "dialog" module is displayed
      And clicks on the "dialog.cancel" button
      And switches to original frame
     Then the "Enable Recurrent Payment" page is displayed

  @jira.QANOV-95680 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95678 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1790 @mobile @qa @regression @vivobr @webapp
  Scenario: A no legacy user with recurrent payment in disabled status and automatic debit enabled can access to the "Enable With Saved Card" screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has ">=1" valid cards saved in the payment methods area
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "dialog" module is displayed
      And clicks on the "dialog.accept" button
     Then the "Enable With Saved Card" page is displayed

  @jira.QANOV-99188 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1790
  @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with recurrent payment in disabled status and automatic debit in pending status sees an information screen when trying to activate recurrent payment
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "pending" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
     Then the "Pending Automatic Debit" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "title" textfield with "Por enquanto, você não pode fazer pagamentos com cartão" text is displayed
      And the "message" textfield with "Aguarde a resposta da análise de débito automático do seu banco pra mudar a forma de pagamento." text is displayed
      And the "understand" button with "Ok, entendi " text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Enable Recurrent Payment" page is displayed

  @jira.QANOV-99189 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-99188 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1790 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with recurrent payment in disabled status and automatic debit in pending status can return to account from the information screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "deactivated" status
      And user has "automatic_debit" service in "pending" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Enable Recurrent Payment" page is displayed
      And clicks on the "enable" button
      And the "Pending Automatic Debit" page is displayed
      And clicks on the "understand" button
     Then the "Account" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.<tests> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A no legacy user with recurrent payment in <recurrent_payment_status> status sees an information screen about the status after clicking in the entrypoint
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
     Then the "Pending Recurrent Payment status" page is displayed
      And the "Cartão de crédito" header is displayed
      And the "main_title" textfield with "<title_text>" text is displayed
      And the "description" textfield with "Você pode voltar depois pra ver se deu tudo certo." text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

    Examples:
          | recurrent_payment_status | title_text                             | depends_on  | tests         | jira_id     |
          | enabling                 | Estamos tentando ativar seu serviço    | QANOV-95672 | CHECKOUT-1788 | QANOV-95681 |
          | disabling                | Estamos tentando desativar seu serviço | QANOV-95673 | CHECKOUT-1789 | QANOV-95682 |

  @jira.<jira_id> @android @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.<tests> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A no legacy user with recurrent payment in <recurrent_payment_status> status can return to the bills screen after seeing the information screen
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "<recurrent_payment_status>" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Pending Recurrent Payment status" page is displayed
      And clicks on the "back" button
     Then the "Bills" page is displayed
      And the "bills_settings.recurrent_payment_status_textfield" entrypoint with "<status_text>" text is displayed

    Examples:
          | recurrent_payment_status | status_text | depends_on  | tests         | jira_id     |
          | enabling                 | Ativando    | QANOV-95681 | CHECKOUT-1788 | QANOV-95683 |
          | disabling                | Desativando | QANOV-95682 | CHECKOUT-1789 | QANOV-95684 |

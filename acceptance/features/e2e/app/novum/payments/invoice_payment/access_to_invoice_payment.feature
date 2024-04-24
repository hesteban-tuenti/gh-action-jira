# -*- coding: utf-8 -*-
@jira.QANOV-21952
Feature: Access to Invoice Payment

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-21973 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-21969 @jira.link.detects.CHECKOUT-3142
  @jira.link.detects.CHECKOUT-3143 @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user views bill pdf from the "Bill Selection" page
    The 'unpaid' bill is a bill in delayed or pending status
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And has "several" bills in "unpaid" status in any subscription
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "bill_details_link" button of "unpaid_bills" list with "0" index
     Then the "bill" file with the "Fatura.pdf" format is downloaded as a PDF

  @jira.QANOV-21981 @android @automatic @ios @jira.cv.12.8 @jira.link.detects.CHECKOUT-1733
  @jira.link.detects.CHECKOUT-3141 @jira.link.detects.LOC-619 @jira.link.parent_test_plan.QANOV-68826 @mobile @qa
  @regression @vivobr @webapp @old_app
  Scenario: A no legacy user with unpaid bills clicks continue without any bill selected in the "Bill Selection" page
    The 'unpaid' bill is a bill in delayed or pending status
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bill Selection" page
      And the "unpaid_bills" list is displayed
     When clicks on all "selected" buttons of "unpaid_bills" list
      And clicks on the "continue_button" button
     Then the "dialog" element is displayed
      And the "dialog.title" textfield with "Nenhuma fatura selecionada" text is displayed
      And the "dialog.message" textfield with "Selecione uma ou mais faturas pra continuar com o pagamento" text is displayed
      And the "dialog.accept" button with "Ok, entendi" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.CHECKOUT-1618 @jira.link.detects.CHECKOUT-1702
  @jira.link.detects.WEB-493 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-360674
  @jira.link.parent_test_plan.QANOV-68826 @mobile @smoke @vivobr @webapp @old_app
  Scenario Outline: A no legacy user <status> with unpaid bills accesses to "Payment Summary" screen
    other_affected_versions="2021-46-B"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "any" plan in "<status>" status
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue_button" button
     Then the "Payment Summary" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Resumo do pagamento" text is displayed
      And the "invoices_list_title" textfield with "VOCÊ ESTÁ PAGANDO" text is displayed
      And the "selected_bills_list" list is displayed
      And each element in the "selected_bills_list" list has the "bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro) \d\d\d\d" format
      And each element in the "selected_bills_list" list has the "bill_status" textfield with the "(Aberta|Atrasada)" format
      And each element in the "selected_bills_list" list has the "bill_due" textfield with the "Vence(u)? em \d{1,2}\/(jan|fev|mar|abr|mai|jun|jul|ago|set|out|nov|dez)(\/\d\d)?" format
      And each element in the "selected_bills_list" list has the "bill_amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield with the "R\$ (\d*(\.\d{3})?),[0-9]{2}" format is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed

    @automatic @qa
    Examples:
          | status | parent_test_plan | cv   | jira_id     |
          | active |                  | 12.8 | QANOV-34022 |

    @manual
    Examples:
          | status    | parent_test_plan | cv    | jira_id      |
          | pending   |                  | 12.8  | QANOV-403109 |
          | cancelled | QANOV-360674     | 14.11 | QANOV-403110 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @vivobr @old_app
  Scenario Outline: A no legacy user <status> who has select 1 bill with due date before 1st of September of 2022 and has not closed the security_advice alert sees the "Cartão de crédito" and "Código de barras" option in the Choose Payment Method screen with alert
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "any" plan in "<status>" status
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" bill which "due_date" field is before "01-09-2022" date
      And user has not closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "1" elements of "unpaid_bills" list which "due_date" field is before "01-09-2022" date
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.close" icon is displayed
      And the "informative_alert.title" textfield with "Dicas de segurança" text is displayed
      And the "informative_alert.description" textfield with "O App Vivo é o canal mais seguro pra você confirmar todas as informações da sua fatura" text is displayed
      And the "informative_alert.link" textfield with "Ver mais" text is displayed
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Cartão de crédito" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

    Examples:
          | status    | parent_test_plan | cv    | priority   | jira_id      |
          | active    |                  | 13.5  | sanity     | QANOV-223882 |
          | pending   |                  | 13.5  | smoke      | QANOV-403111 |
          | cancelled | QANOV-360674     | 14.11 | regression | QANOV-403112 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @vivobr @old_app
  Scenario Outline: A no legacy user <status> who has select 1 bill with due date after than 31st of August of 2022 and has not closed the "security_advice" alert sees the "Pix", "Cartão de crédito" and "Código de barras" option in the Choose Payment Method screen with alert
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And user has a "any" plan in "<status>" status
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" status bill which "due_date" field is after "08-2022"
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects a bill in the "unpaid_bills" list which due_date is after "08-2022"
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is displayed
      And the "informative_alert.info_icon" icon is displayed
      And the "informative_alert.close" icon is displayed
      And the "informative_alert.title" textfield with "Dicas de segurança" text is displayed
      And the "informative_alert.description" textfield with "O App Vivo é o canal mais seguro pra você confirmar todas as informações da sua fatura" text is displayed
      And the "informative_alert.link" textfield with "Ver mais" text is displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Cartão de crédito" text
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

    Examples:
          | status    | parent_test_plan | cv    | priority   | jira_id      |
          | active    |                  | 13.5  | sanity     | QANOV-257995 |
          | pending   |                  | 13.5  | smoke      | QANOV-403113 |
          | cancelled | QANOV-360674     | 14.11 | regression | QANOV-403114 |

  @jira.QANOV-242621 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill and has not closed the "security_advice" alert can see the security advice screen
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has not closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "1" elements of "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "informative_alert.link" icon
     Then the "Security Advice" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Dicas de segurança" text is displayed
      And the "sms_info_title" textfield with "Não enviamos SMS com informações do código Pix para pagamento" text is displayed
      And the "sms_info_message" textfield with "QR Code Pix e/ou código Pix Copia e Cola estão nas faturas Vivo enviadas por e-mail ou correio e, também, aqui, no App Vivo" text is displayed
      And the "contact_info_title" textfield with "Fique atento" text is displayed
      And the "contact_info_message" textfield with "Sempre confira se o nome do titular, telefone e endereço estão corretos na fatura e se o destinatário do pagamento é a Telefônica ou a Vivo" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Choose Payment Method" page is displayed

  @jira.QANOV-242622 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill and has not closed the "security_advice" alert can close it
    other_affected_versions="2022-29"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has not closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "1" elements of "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "Choose Payment Method" page is displayed
      And clicks on the "informative_alert.close" icon
     Then the "informative_alert" module is not displayed

  @jira.QANOV-242623 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill with due date before than 1st of September of 2022 and has closed the "security_advice" alert with sees the "Cartão de crédito" and "Código de barras" option in the Choose Payment Method screen without alert
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" bill which "due_date" field is before "01-09-2022" date
      And user has closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "1" elements of "unpaid_bills" list which "due_date" field is before "01-09-2022" date
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is not displayed
      And the "payment_methods_list" list has "2" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Cartão de crédito" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-257998 @android @ios @jira.cv.13.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user who has select 1 bill with due date after than 31st of August of 2022 and has closed the "security_advice" alert sees the "Pix", "Cartão de crédito" and "Código de barras" option in the Choose Payment Method screen without alert
    other_affected_versions="2022-29, 2022-36"
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And user has "automatic_debit" service in "deactivated" status
      And user has "recurrent_payment" service in "deactivated" status
      And user has a month with "unpaid" bill which "due_date" field is after "31-08-2022" date
      And user has closed the "security_advice" alert
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "1" elements of "unpaid_bills" list which "due_date" field is after "31-08-2022" date
      And clicks on the "continue_button" button
     Then the "Choose Payment Method" page is displayed
      And the "main_title" textfield with "Escolha a forma de pagamento" text is displayed
      And the "informative_alert" module is not displayed
      And the "payment_methods_list" list has "3" elements
      And each element in the "payment_methods_list" list has the "icon" field
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "Pix" text
      And the "0" index in the "payment_methods_list" list has the "selected" field
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "Cartão de crédito" text
      And the "2" index in the "payment_methods_list" list has the "payment_description" field with "Código de barras" text
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @smoke @vivobr
  @old_app
  Scenario Outline: A no legacy user with <saved_cards> saved cards who has select several bills doesn't see the Choose Payment Method screen. User is redirected to <payment_screen>
    Given user is not a "legacy;control_n;jeri" account type
      And has "several" bills in "unpaid" status in any subscription
      And has "<saved_cards>" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoice-chart-body" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "invoice-chart-header" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_bill_button" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "2" elements of "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "<payment_screen>" page is displayed

    Examples:
          | saved_cards | payment_screen        | jira_id      |
          | 0           | Add New Card          | QANOV-223885 |
          | >=1         | Credit Card Selection | QANOV-223886 |

  @jira.QANOV-223895 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458
  @jira.link.relates_to.QANOV-21995 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user blacklisted by the OB for credit card payment with an unpaid bill tries to pay several bills and sees an informative message
    other_affected_versions="2022-29"
    A 'unpaid' bill is a bill in delayed or pending status. Copies can be modified
    Given user is not a "legacy;control_n;jeri" account type
      And is blacklisted by the OB for credit card payment
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
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "2" elements of "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Não é possível realizar seu pagamento no cartão de crédito" text is displayed
      And the "automatic_debt_message" textfield with "Vimos que teve um estorno no pagamento da sua fatura Vivo com cartão de crédito. Pra su segurança, use outro meio de sua preferência:" text is displayed
      And the "automatic_debt_subtitle" textfield with "Débito automático" text is displayed
      And the "expiration_message" textfield with "Você não se preocupa como o vencimiento. O valor é debitado todo mês na sua conta bancária" text is displayed
      And the "barcode_subtitle" textfield with "Código de barras" text is displayed
      And the "barcode_message" textfield with "Você usa o código de barras e escolhe como pagar: no site, no app ou onde seu banco permitir" text is displayed
      And the "pix_subtitle" textfield with "Pix" text is displayed
      And the "pix_message" textfield with "Pagamento disponível 24 horas, inclusive nos finais de semana e feriados" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

  @jira.QANOV-223897 @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-217458 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A no legacy dependent user tries to pay several bills with credit card from "Bills" page and sees an informative message
    other_affected_versions="2022-29"
    Copies can be modified
    Given user is not a "legacy;control_n;jeri" account type
      And user has "several" mobile lines
      And user has a "dependent" role
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
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "2" elements of "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "Payment Summary" page is displayed
      And clicks on the "pay" button
     Then the "Feedback Bill Payment with Credit Card Error" page is displayed
      And the "error_title" textfield with "Não é possível realizar seu pagamento no cartão de crédito" text is displayed
      And the "automatic_debt_message" textfield with "Vimos que teve um estorno no pagamento da sua fatura Vivo com cartão de crédito. Pra su segurança, use outro meio de sua preferência:" text is displayed
      And the "automatic_debt_subtitle" textfield with "Débito automático" text is displayed
      And the "expiration_message" textfield with "Você não se preocupa como o vencimiento. O valor é debitado todo mês na sua conta bancária" text is displayed
      And the "barcode_subtitle" textfield with "Código de barras" text is displayed
      And the "barcode_message" textfield with "Você usa o código de barras e escolhe como pagar: no site, no app ou onde seu banco permitir" text is displayed
      And the "pix_subtitle" textfield with "Pix" text is displayed
      And the "pix_message" textfield with "Pagamento disponível 24 horas, inclusive nos finais de semana e feriados" text is displayed
      And the "back" button with "Ok, voltar pro início" text is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-293162
Feature: Menu Mais Deeplinks

  Actions After the Feature:
     Then terminates the app
      And launches the app
      And the "[CONF:landing_tab]" page is displayed

  @jira.<jira_id> @<ber> @<priority> @android @automatic @ios @jira.cv.12.1 @live @mobile @next @vivobr
  Scenario Outline: A multiplan user can open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans whose account type is not any of "vivo easy"

    Examples:
          | deeplink_name          | priority   | ber | jira_id     |
          | Account.Troca de plano | regression |     | QANOV-44785 |

    @qa
    Examples:
          | deeplink_name           | priority | ber | jira_id     |
          | Account.Suporte técnico | smoke    | ber | QANOV-58652 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual
  @mobile @vivobr
  Scenario Outline: A multiplan user can open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans whose account type is not any of "vivo easy"

    Examples:
          | deeplink_name           | priority   | ber | jira_id      |
          | Account.Troca de plano  | regression |     | QANOV-406589 |
          | Account.Suporte técnico | smoke      | ber | QANOV-406590 |

  @jira.QANOV-44778 @android @automatic @ber @ios @jira.cv.12.1 @live @mobile @next @sanity @vivobr
  Scenario: A multiplan user can open the "Account.Detalhe do Plano" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "Account.Detalhe do Plano" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-406591 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity
  @vivobr
  Scenario: A multiplan user can open the "Account.Detalhe do Plano" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "Account.Detalhe do Plano" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-293164 @android @automatic @ios @jira.cv.12.1 @live @mobile @next @qa @smoke @vivobr
  Scenario: A multiplan user can open the "Tabmais.Agendar atendimento" deeplink: disambiguation screen is displayed
    Given user has "several" plans
      And user has "several" mobile lines
     When opens the "Tabmais.Agendar atendimento" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans with any mobile line whose account type is not any of "control n;jeri control;vivo easy"

  @jira.QANOV-406592 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @smoke @vivobr
  Scenario: A multiplan user can open the "Tabmais.Agendar atendimento" deeplink: disambiguation screen is displayed
    Given user has "several" plans
      And user has "several" mobile lines
     When opens the "Tabmais.Agendar atendimento" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans with any mobile line whose account type is not any of "control n;jeri control;vivo easy"

  @jira.<jira_id> @<ber> @<priority> @android @automatic @ios @jira.cv.12.1 @live @mobile @next @qa @vivobr
  Scenario Outline: A multiplan user can open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    Given user has "several" plans
      And user has "several" lines of any "<account_types>" account types
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "lines" list is displayed
      And each element in the "lines" list has the "icon" field
      And each element in the "lines" list has the "product_customer_type" field
      And each element in the "lines" list has the "phone_number" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines whose account type is not any of "<excluded_account_types>"

    Examples:
          | deeplink_name        | account_types                         | excluded_account_types                   | priority   | ber | jira_id     |
          | Account.Share data   | beatrix control;legacy control;prepay | postpay;jeri control;vivo easy;control n | smoke      |     | QANOV-44787 |
          | Account.Ask for data | beatrix control;legacy control;prepay | postpay;jeri control;vivo easy;control n | smoke      | ber | QANOV-44788 |
          | Account.Saldo Prepay | control;prepay                        | postpay;vivo easy;control n;jeri control | regression |     | QANOV-44789 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual
  @mobile @vivobr
  Scenario Outline: A multiplan user can open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    Given user has "several" plans
      And user has "several" lines of any "<account_types>" account types
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines whose account type is not any of "<excluded_account_types>"

    Examples:
          | deeplink_name        | account_types                         | excluded_account_types                   | priority   | ber | jira_id      |
          | Account.Share data   | beatrix control;legacy control;prepay | postpay;jeri control;vivo easy;control n | smoke      |     | QANOV-406593 |
          | Account.Ask for data | beatrix control;legacy control;prepay | postpay;jeri control;vivo easy;control n | smoke      | ber | QANOV-406594 |
          | Account.Saldo Prepay | control;prepay                        | postpay;vivo easy;control n;jeri control | regression |     | QANOV-406595 |

  @jira.QANOV-44776 @android @automatic @ber @ios @jira.cv.12.1 @live @mobile @next @qa @sanity @vivobr
  Scenario: A multiplan user can open the "Account.Conta" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "Account.Conta" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans whose account type is not any of "prepay;jeri control;jeri postpay"

  @jira.QANOV-406596 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity
  @vivobr
  Scenario: A multiplan user can open the "Account.Conta" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "Account.Conta" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans whose account type is not any of "prepay;jeri control;jeri postpay"

  @jira.QANOV-44775 @android @automatic @ber @ios @jira.cv.12.1 @live @mobile @next @qa @sanity @vivobr
  Scenario: A multiplan user can open the "Account.Consumo" deeplink: disambiguation screen is displayed
    Given user has "several" plans
      And user has "several" mobile lines
     When opens the "Account.Consumo" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "lines" list is displayed
      And each element in the "lines" list has the "icon" field
      And each element in the "lines" list has the "product_customer_type" field
      And each element in the "lines" list has the "phone_number" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines whose account type is not any of "vivo easy;control n;jeri control"

  @jira.QANOV-406597 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity
  @vivobr
  Scenario: A multiplan user can open the "Account.Consumo" deeplink: disambiguation screen is displayed
    Given user has "several" plans
      And user has "several" mobile lines
     When opens the "Account.Consumo" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines whose account type is not any of "vivo easy;control n;jeri control"

  @jira.<jira_id> @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario Outline: A user who is in disambiguation screen goes back to previous screen
    Given user has "several" plans
      And user opens the "<deeplink_name>" deeplink with the app in "foreground" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the native "back" button
     Then the previous page is displayed

    Examples:
          | deeplink_name               | jira_id      |
          | Account.Suporte técnico     | QANOV-58662  |
          | Account.Conta               | QANOV-44792  |
          | Account.Troca de plano      | QANOV-44801  |
          | Account.Detalhe do Plano    | QANOV-44794  |
          | Account.Consumo             | QANOV-44791  |
          | Tabmais.Agendar atendimento | QANOV-293166 |

  @jira.<jira_id> @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario Outline: A user who is in disambiguation screen goes back to previous screen
    Given user has "several" plans
      And user has several "control;prepay" mobile line
      And user opens the "<deeplink_name>" deeplink with the app in "foreground" status
      And the "Line Disambiguation" page is displayed
     When clicks on the native "back" button
     Then the previous page is displayed

    Examples:
          | deeplink_name        | jira_id     |
          | Account.Share data   | QANOV-44803 |
          | Account.Ask for data | QANOV-44804 |
          | Account.Saldo Prepay | QANOV-44805 |

  @jira.QANOV-58672 @android @automatic @ber @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @live @mobile
  @next @sanity @vivobr
  Scenario: A multiplan user can access to the technical_support screen from the disambiguation screen
    Given user has "several" plans
      And user opens the "Account.Suporte técnico" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on any element in the "plans" list
     Then the internal webview with the "(Verificando (C|c)onexão|Suporte (T|t)écnico)" format in the header is displayed

  @jira.QANOV-44808 @android @automatic @ios @jira.cv.12.1 @live @mobile @next @qa @sanity @vivobr
  Scenario: A multiplan user can access to the Bills screen from the disambiguation screen
    Given user has "several" plans
      And user opens the "Account.Conta" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on any element in the "plans" list
     Then the "Bills" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Disambiguation" page is displayed

  @jira.QANOV-406598 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity
  @vivobr
  Scenario: A multiplan user can access to the Bills screen from the disambiguation screen
    Given user has "several" plans
      And user opens the "Account.Conta" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on any element in the "plans" list
     Then the "Bills" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Disambiguation" page is displayed

  @jira.QANOV-44807 @android @automatic @ios @jira.cv.12.1 @live @mobile @next @qa @sanity @vivobr
  Scenario: A multiplan user can access to the Mobile Line Consumption screen from the disambiguation screen
    Given user has "several" plans
      And user has "any" mobile lines
      And user opens the "Account.Consumo" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on any element in the "lines" list
     Then the "Mobile Line Consumption" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed

  @jira.QANOV-406599 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity
  @vivobr
  Scenario: A multiplan user can access to the Mobile Line Consumption screen from the disambiguation screen
    Given user has "several" plans
      And user has "any" mobile lines
      And user opens the "Account.Consumo" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on any element in the "lines" list
     Then the "TBD" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @live @mobile
  @next @smoke @vivobr
  Scenario Outline: A multiplan user can access to the <header> screen from the disambiguation screen
    Given user has "several" plans
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on any element in the "plans" list
     Then the internal webview with the "<header>" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Disambiguation" page is displayed

    Examples:
          | deeplink_name            | header           | ber | jira_id     |
          | Account.Troca de plano   | Troca de plano   | ber | QANOV-44817 |
          | Account.Detalhe do Plano | Detalhe do plano |     | QANOV-44813 |

  @jira.QANOV-293169 @android @automatic @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @live @mobile @next
  @smoke @vivobr
  Scenario: A multiplan user can access to the Agendamento em loja screen from the disambiguation screen
    Given user has "several" plans
      And user has "several" mobile lines
      And user opens the "Tabmais.Agendar atendimento" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on any element in the "plans" list
     Then the internal webview with the "Agendamento em loja" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @live @mobile
  @next @smoke @vivobr
  Scenario Outline: A multiplan user can access to the <header> screen from the disambiguation screen
    Given user has "several" plans
      And user has "several" lines of any "<account_types>" account types
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on any element in the "lines" list
     Then the internal webview with the "<header>" format in the header is displayed

    Examples:
          | deeplink_name        | account_types                         | header          | ber | jira_id      |
          | Account.Share data   | beatrix control;legacy control;prepay | Enviar internet | ber | QANOV-44819  |
          | Account.Ask for data | beatrix control;legacy control;prepay | Pedir Internet  |     | QANOV-44820  |
          | Account.Saldo Prepay | control;prepay                        | Meus Saldos     |     | QANOV-293167 |

  @jira.QANOV-283337 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-273962 @manual @mobile @regression
  @vivobr
  Scenario: Multiplan Vivo users can access to the Cancelamento deeplink desambiguation screen
    Given user has any "platinum;V;gold" segmentation
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has "several" plans
     When opens the "Tabmais.Cancelamento" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-406600 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: Multiplan Vivo users can access to the Cancelamento deeplink desambiguation screen
    Given user has any "platinum;V;gold" segmentation
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has "several" plans
     When opens the "Tabmais.Cancelamento" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-283338 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-273962
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity @vivobr
  Scenario: Multiplan Vivo users can access to the Cancelamento deeplink
    Given user has any "platinum;V;gold" segmentation
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has "several" plans
     When opens the "Tabmais.Cancelamento" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
      And clicks on any element in the "plans" list
     Then the internal webview with "Cancelamento" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Disambiguation" page is displayed

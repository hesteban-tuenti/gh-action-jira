# -*- coding: utf-8 -*-
@jira.QANOV-97612
Feature: Header module

  Actions Before each Scenario:
    Given user has the "header-cards-cms" module configured in CMS for "start" page
      And user is in the "Start" page

  @jira.<jira_id> @android @automatic @ber @ios @jira.cv.<cv> @live @mobile @next @qa @sanity @vivobr @old_app
  Scenario Outline: A user with Start tab who is in the Start tab can see a welcome message
    Given user has any "convergente;multivivo;legacy prepay;beatrix;jeri prepay;control_n;jeri control" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And device time is between "<time_min>" and "<time_max>" hours
     Then the header that contains the "<message>" text is displayed
      And the header contains the user first name

    Examples:
          | plans   | time_min | time_max | message   | cv   | jira_id      |
          | 1       | 6:00     | 11:59    | Bom dia   | 12.5 | QANOV-97613  |
          | 1       | 12:00    | 17:59    | Boa tarde | 12.5 | QANOV-97614  |
          | 1       | 18:00    | 5:59     | Boa noite | 12.5 | QANOV-97615  |
          | several | 6:00     | 11:59    | Bom dia   | 13.6 | QANOV-153116 |
          | several | 12:00    | 17:59    | Boa tarde | 13.6 | QANOV-153117 |
          | several | 18:00    | 5:59     | Boa noite | 13.6 | QANOV-153118 |

  @jira.QANOV-98414 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app @old_app
  Scenario: A user with Start tab and without "Lifecycle & User actions" cards to be shown in the Start tab header lands in the Start tab: the aura card is displayed
    internal_checkpoint="'Without Lifecycle & User actions' means that only the default cards appear"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user does not have an active technical service
      And user does not have an "delayed" bill
      And user is not able to activate digital invoice
      And user is not able to activate direct debit
      And user has the "explore-header-fallback" default start tab header configured in CMS
      And user has the "aura-header-fallback" default start tab header configured in CMS
     When waits "5" seconds
     Then the header contains a card with "Eu sou a Aura! Mudei de lugar para te atender melhor, me conta como posso te ajudar." title and "Conhecer a Aura" button

  @jira.QANOV-250218 @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-236429 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user can access to Aura from "Header" module in Start Tab
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user does not have an active technical service
      And user does not have an "delayed" bill
      And user is not able to activate digital invoice
      And user is not able to activate direct debit
      And user has the "explore-header-fallback" default start tab header configured in CMS
      And user has the "aura-header-fallback" default start tab header configured in CMS
     When waits "5" seconds
      And clicks on the "header.button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-153121 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab and without "Lifecycle & User actions" cards to be shown in the Start tab header lands in the Start tab: the aura card is displayed
    internal_checkpoint="'Without Lifecycle & User actions' means that only the default cards appear"
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri prepay;control_n;jeri control" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user does not have an "delayed" bill
      And user is not able to activate direct debit
      And user has the "explore-header-fallback" default start tab header configured in CMS
      And user has the "aura-header-fallback" default start tab header configured in CMS
     When waits "5" seconds
     Then the header contains a card with "Eu sou a Aura! Mudei de lugar para te atender melhor, me conta como posso te ajudar." title and "Conhecer a Aura" button

  @jira.QANOV-240560 @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-236429 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user can access to Aura from "Header" module in Start Tab
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri prepay;control_n;jeri control" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user does not have an "delayed" bill
      And user is not able to activate direct debit
      And user has the "explore-header-fallback" default start tab header configured in CMS
      And user has the "aura-header-fallback" default start tab header configured in CMS
     When waits "5" seconds
      And clicks on the "header.button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-97622 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A legacy prepay/jeri prepay/jeri postpay user lands in the Start tab: the default card will be shown in the header
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user has the "explore-header-fallback" default start tab header configured in CMS
     Then the header contains a card with "O Descubra tá cheio de ofertas interessantes! Aproveita pra conferir as novidades 👀" title and "Descobrir ofertas" button

  @jira.QANOV-97624 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A legacy prepay/jeri prepay/jeri postpay user taps on the card button: the user will be redirected to the Explore tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user has the "explore-header-fallback" default start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Explore" page is displayed

  @jira.QANOV-111587 @android @ios @jira.cv.12.5 @manual @mobile @smoke @vivobr @old_app
  Scenario: A legacy prepay/jeri prepay/jeri postpay user lands in the Start tab: the aura card is displayed
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user has the "explore-header-fallback" default start tab header configured in CMS
      And user has the "aura-header-fallback" default start tab header configured in CMS
     When waits "5" seconds
     Then the header contains a card with "Eu sou a Aura! Mudei de lugar para te atender melhor, me conta como posso te ajudar." title and "Conhecer a Aura" button

  @jira.QANOV-240563 @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-236429 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A legacy prepay/jeri prepay/jeri postpay user can access to Aura from "Header" module in Start Tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user has the "explore-header-fallback" default start tab header configured in CMS
      And user has the "aura-header-fallback" default start tab header configured in CMS
     When waits "5" seconds
      And clicks on the "header.button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with Start tab and technical service in "<status>" status will see the technical card in the header
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user has the technical service in "<status>" status
      And user has the "reminders-technician-visit" start tab header configured in CMS
     Then the header contains a card with "<message>" format title and "<button>" button

    Examples:
          | status        | message                                                       | button       | jira_id     |
          | scheduled     | Sua instalação será na/o ${semana}, ${dia} / ${mes}${periodo} | Ver detalhes | QANOV-97626 |
          | completed     | Seus produtos foram instalados com sucesso                    | Ver detalhes | QANOV-97630 |
          | agent_on_site | ${tecnico} chegou no local para a visita técnica              | Ver detalhes | QANOV-97631 |
          | pending_visit | ${tecnico} está a caminho da visita técnica                   | Ver detalhes | QANOV-97633 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with Start tab and technical service in "<status>" status, accesses the "<header>" from technical card button
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user has the technical service in "<status>" status
      And user has the "reminders-technician-visit" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "<header>" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | status        | header | jira_id     |
          | scheduled     | TBD    | QANOV-97638 |
          | completed     | TBD    | QANOV-97640 |
          | agent_on_site | TBD    | QANOV-97641 |
          | pending_visit | TBD    | QANOV-97642 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with Start tab who has a bill delayed, will see the bill delayed card in the header
    internal_checkpoint="This case will appear until the user pay the bill"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user has a bill in "delayed" status
      And user has the "<header>" start tab header configured in CMS
     Then the header contains a card with "<message>" format title and "<button>" button

    Examples:
          | plans   | cv   | header                 | message                                                                                               | button         | jira_id      |
          | 1       | 12.5 | overdue-invoice-header | Sua fatura com vencimento em $[date], no valor de R$ $[value], já está disponível. Quer pagar agora?" | Pagar fatura   | QANOV-97644  |
          | several | 13.6 | pending-invoices       | Suas faturas já estao disponiveis pra pagamento                                                       | Accesar fatura | QANOV-153125 |

  @jira.QANOV-97645 @android @ios @jira.cv.12.5 @jira.link.detects.CHECKOUT-3566 @manual @mobile @regression @vivobr
  @old_app
  Scenario: A user with Start tab who has a bill delayed, can access to "Bill selection" screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And has "several" bills in "unpaid" status in any subscription
      And user has a bill in "delayed" status
      And user has the "overdue-invoice-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Bill Selection" page is displayed
      And the "Pagar fatura" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-159960 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who has a bill delayed, can access to "Minhas faturas" screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a bill in "delayed" status
      And user has the "pending-invoices" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-153126 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who has several bills delayed, can access to the disambiguation screeen
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has a "several" plan in "active" status
      And user has "several" plans with bills
      And user has ">0" bills in "delayed" status
      And user has the "pending-invoices" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "plan" list is displayed
      And each element in the "plan" list has the "plan_name" field
      And each element in the "plan" list has the "customer_type" field
      And the "plan" list entries will match the user plans

  @jira.QANOV-153127 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who has several bills delayed, can access to "Pagamentos pendentes" screen of a specific plan
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans with bills
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user has bills in "delayed" status
      And user has the "pending-invoices" start tab header configured in CMS
     When clicks on the "header.button" button
      And the "Plan Disambiguation" page is displayed
      And clicks on the "plan_with_delayed_bill" element in the "plan" list
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-153128 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who has several bills delayed, can access to "Minhas faturas" screen of a specific plan
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans with bills
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user has bills in "delayed" status
      And user has bills in "not_delayed" status
      And user has the "pending-invoices" start tab header configured in CMS
     When clicks on the "header.button" button
      And the "Plan Disambiguation" page is displayed
      And clicks on the "plan_without_delayed_bill" element in the "plan" list
     Then the "Bills" page is displayed
      And the "Minhas faturas" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-97647 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who is able to activate digital invoice, will see the digital invoice card in the header
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user is able to activate digital invoice
      And user has the "digital-invoice-header" start tab header configured in CMS
     Then the header contains a card with "[LANG:start.header.digital_bill.title]" title and "[LANG:start.header.digital_bill.button]" button

  @jira.QANOV-97648 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who is able to activate digital invoice, can access to Conta digital screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user is able to activate digital invoice
      And user has the "digital-invoice-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Conta digital" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-252246 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who is able to activate digital invoice, will see the digital invoice card in the header
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "several" plans
      And user has ">=1" plans that can activate digital invoice
      And user has the "digital-invoice-header" start tab header configured in CMS
     Then the header contains a card with "[LANG:start.header.digital_bill.title]" title and "[LANG:start.header.digital_bill.button]" button

  @jira.QANOV-252247 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who is able to activate digital invoice in one plan, can access to Conta digital screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "several" plans
      And user has "1" plans that can activate digital invoice
      And user has the "digital-invoice-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Conta digital" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-252248 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who is able to activate digital invoice in several plans, can access to the Disambiguation screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "several" plans
      And user has "several" plans that can activate digital invoice
      And user has the "digital-invoice-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "disambiguation_title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plan" list is displayed
      And each element in the "plan" list has the "plan_name" field
      And each element in the "plan" list has the "customer_type" field
      And the "plan" list entries will match the user plans

  @jira.QANOV-252249 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who is able to activate digital invoice in several plans, can access to Conta digital screen from the Disambiguation screen
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "several" plans
      And user has "several" plans that can activate digital invoice
      And user has the "digital-invoice-header" start tab header configured in CMS
     When clicks on the "header.button" button
      And the "Plan Disambiguation" page is displayed
      And clicks on the "any" element in the "plan" list
     Then the internal webview is displayed
      And the "Conta digital" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A user with Start tab who is able to put the invoice on direct debit, will see the direct debit card in the header
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user is able to put the invoice on direct debit
      And user has the "direct-debit-header" start tab header configured in CMS
     Then the header contains a card with "[LANG:start.header.direct_debit.title]" title and "[LANG:start.header.direct_debit.button]" button

    Examples:
          | plans   | cv   | jira_id      |
          | 1       | 12.5 | QANOV-97649  |
          | several | 13.6 | QANOV-153129 |

  @jira.QANOV-97650 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who is able to put the invoice on direct debit, can access to Debito automatico screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user has "1" plans
      And user does not have a "siebel" plan
      And user is able to put the invoice on direct debit
      And user has the "direct-debit-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Débito automático" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-153130 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who is able to put several invoices on direct debit, can access to the disambiguation screeen
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user is able to put a invoice on direct debit for "several" plans
      And user has the "direct-debit-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "disambiguation_title" textfield with "Em qual plano você quer cadastrar débito automático?" text is displayed
      And the "plan" list is displayed
      And each element in the "plan" list has the "plan_name" field
      And each element in the "plan" list has the "customer_type" field
      And the "plan" list entries will match the user plans

  @jira.QANOV-153131 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who is able to put several invoices on direct debit, is able to access Debito automatico to a specific plan
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user is able to put a invoice on direct debit for "several" plans
      And user has the "direct-debit-header" start tab header configured in CMS
     When clicks on the "header.button" button
      And the "Plan Disambiguation" page is displayed
      And clicks on the "any" element in the "plan" list
     Then the internal webview is displayed
      And the "Débito automático" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-153132 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab who is able to put an invoice on direct debit, is able to access to Debito automatico screen from the header card
    internal_checkpoint="After click on CTA, case will not appear until 30 days (unless customer has activated it)"
    Given user has any "convergente;multivivo;beatrix" account types
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "several" plans
      And user has a "any" plan in "active" status
      And user is able to put a invoice on direct debit for "1" plans
      And user has the "direct-debit-header" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Débito automático" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-97654 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with Start tab who has consumed the data allowance between 80%-100%, will see a data warning card in the header
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has "1" mobile lines
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "low-data-warning" start tab header configured in CMS
     Then the header contains a card with "[LANG:start.header.data_consumption.high_data_consumption_line_text]" format and "[LANG:start.header.data_consumption.data_packs_button]" button

  @jira.QANOV-97656 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with Start tab who has consumed the data allowance between 80%-100%, can access to buy data from header card
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "low-data-warning" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-285911 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with several lines and Start tab who has consumed the data allowance between 80%-100% in several lines, will see a data warning card in the header for each line
    Given user has any "convergente;multivivo" account types
      And user has "1" plans
      And user has "several" mobile lines which have consumed between the "80%" and the "99%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.data_consumption.high_data_consumption_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.data_consumption.data_packs_button]" text

  @jira.QANOV-285912 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who has consumed the data allowance between 80%-100% in several lines, will see a data warning card in the header for each line
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "several" plans
      And user has "several" mobile lines which have consumed between the "80%" and the "99%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.data_consumption.high_data_consumption_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.data_consumption.data_packs_button]" text

  @jira.QANOV-285913 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who has consumed the data allowance between 80%-100%, can access to buy data from header card
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "several" plans
      And user has "several" mobile lines which have consumed between the "80%" and the "99%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-97657 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with only one line and Start tab who has consumed the 100% of the data allowance, will see a data warning card in the header
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has "1" mobile lines
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "exahusted-data-warning" start tab header configured in CMS
     Then the header contains a card with "[LANG:start.header.data_consumption.data_limit_consumed_line_text]" format and "[LANG:start.header.data_consumption.data_packs_button]" button

  @jira.QANOV-97658 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with Start tab who has consumed the 100% of the data allowance, can access to buy data from header card
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "exahusted-data-warning" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-285914 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with several lines and Start tab who has consumed the 100% of the data allowance in several lines, will see a data warning card in the header for each line
    Given user has any "convergente;multivivo" account types
      And user has "1" plans
      And user has "several" mobile lines which have consumed "100%" of the data
      And user has the "exahusted-data-warning" start tab header configured in CMS
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.data_consumption.data_packs_button]" text

  @jira.QANOV-285915 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who has consumed the 100% of the data allowance in several lines, will see a data warning card in the header for each line
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "several" plans
      And user has "several" mobile lines which have consumed "100%" of the data
      And user has the "exahusted-data-warning" start tab header configured in CMS
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.data_consumption.data_packs_button]" text

  @jira.QANOV-285916 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who has consumed the 100% of the data allowance, can access to buy data from header card
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "several" plans
      And user has "several" mobile lines which have consumed "100%" of the data
      And user has the "exahusted-data-warning" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-215625 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who has the segmentation purpura can see the Valoriza header
    Given user has "several" plans
      And user does not have any "legacy" account types
      And user has any "purpura" segmentation
      And user has the "valoriza-purpura" start tab header configured in CMS
     Then the header contains a card with "O Vivo Valoriza tem mais de 300 benefícios para clientes Púrpura, como você. Aproveite agora!" title and "Conhecer benefícios" button

  @jira.QANOV-215626 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab who has the segmentation purpura can access to Vivo Valoriza
    Given user has "several" plans
      And user does not have any "legacy" account types
      And user has any "purpura" segmentation
      And user has the "valoriza-purpura" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A multiplan user with Start tab who has the segmentation <segmentation> can see the Valoriza header
    Given user has "several" plans
      And user has any "<segmentation>" segmentation
      And user has the "valoriza-<segmentation>" start tab header configured in CMS
     Then the header contains a card with "O Vivo Valoriza tem mais de 300 benefícios para clientes <message>, como você. Aproveite agora!" title and "Conhecer benefícios" button

    Examples:
          | segmentation | message  | jira_id      |
          | silver       | Silver   | QANOV-215627 |
          | gold         | Gold     | QANOV-215628 |
          | platinum     | Platinum | QANOV-215629 |
          | v            | V        | QANOV-215630 |

  @jira.<jira_id> @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A multiplan user with Start tab who has segmentation can access to Vivo Valoriza
    Given user has "several" plans
      And user does not have any "legacy" account types
      And user has any "<segmentation>" segmentation
      And user has the "valoriza-<segmentation>" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

    Examples:
          | segmentation | jira_id      |
          | silver       | QANOV-215631 |
          | gold         | QANOV-254418 |
          | platinum     | QANOV-254419 |
          | v            | QANOV-254420 |

  @jira.<jira_id> @android @ios @jira.cv.13.3 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A monoplan user with Start tab who has segmentation can see the Valoriza header
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri prepay;control_n;jeri control" account types
      And user has "1" plans
      And user has any "<segmentation>" segmentation
      And user has the "valoriza-<segmentation>" start tab header configured in CMS
     Then the header contains a card with "O Vivo Valoriza tem mais de 300 benefícios para clientes <message>, como você. Aproveite agora!" title and "Conhecer benefícios" button

    Examples:
          | segmentation | message  | jira_id      |
          | silver       | Silver   | QANOV-215632 |
          | gold         | Gold     | QANOV-215633 |
          | platinum     | Platinum | QANOV-215634 |
          | v            | V        | QANOV-215635 |

  @jira.<jira_id> @android @ios @jira.cv.13.3 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A monoplan user with Start tab who has segmentation can see the Valoriza header
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri prepay;control_n;jeri control" account types
      And user has "1" plans
      And user has any "<segmentation>" segmentation
      And user has the "valoriza-<segmentation>" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

    Examples:
          | segmentation | jira_id      |
          | silver       | QANOV-215636 |
          | gold         | QANOV-254415 |
          | platinum     | QANOV-254416 |
          | v            | QANOV-254417 |

  @jira.QANOV-215637 @android @ios @jira.cv.13.3 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with Start tab who has the segmentation purpura can see the Valoriza header
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has any "purpura" segmentation
      And user has the "valoriza-purpura" start tab header configured in CMS
     Then the header contains a card with "O Vivo Valoriza tem mais de 300 benefícios para clientes Púrpura, como você. Aproveite agora!" title and "Conhecer benefícios" button

  @jira.QANOV-215638 @android @ios @jira.cv.13.3 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with Start tab who has the segmentation purpura can see the Valoriza header
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has any "purpura" segmentation
      And user has the "valoriza-purpura" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.4 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A monoplan user with the <app> app will see a message in the header
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has the "<app>" app included in the tariff
      And user has the "<header>" start tab header configured in CMS
     Then the header contains a card with "<message>" title and "Ativar <button>" button

    Examples:
          | app             | header                 | message                                                                                         | button          | jira_id      |
          | spotify_premium | selfie-spotify-premium | Para curtir suas músicas, sem interrupção, ative a assinatura Spotify Premium do seu plano ;)   | Spotify Premium | QANOV-223226 |
          | disney+         | selfie-disney-plus     | Dos últimos lançamentos aos clássicos seus favoritos: Ative a assinatura Disney+ do seu plano!  | Disney+         | QANOV-223227 |
          | premiere        | selfie-premiere        | Ative a assinatura Premiere do seu plano e acompanhe os jogos do seu time do coração!           | Premiere        | QANOV-223228 |
          | netflix         | selfie-netflix         | Bora maratonar as séries e filmes do momento? É só ativar a assinatura Netflix do seu plano :)  | Netflix         | QANOV-223229 |
          | telecine        | selfie-telecine        | Quer viver a mais completa experiência de cinema? Ative a assinatura Telecine do seu plano!     | Telecine        | QANOV-223230 |
          | globoplay       | selfie-globoplay       | Ative a assinatura Globoplay do seu plano e divirta-se com séries, originais, novelas e filmes! | Globoplay       | QANOV-223231 |
          | amazon_prime    | selfie-amazon-prime    | Com Amazon Prime você tem diversão e frete grátis, tudo junto. Ative a assinatura do seu plano! | Amazon Prime    | QANOV-223232 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.13.4 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A monoplan user with the <app> app can access to the Meus Apps webview from the start tab header
    Given user has any "convergente;multivivo;beatrix;control_n;jeri control" account types
      And user has "1" plans
      And user has the "<app>" app included in the tariff
      And user has the "<header>" start tab header configured in CMS
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the header "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | app             | header                 | jira_id      |
          | spotify_premium | selfie-spotify-premium | QANOV-223233 |
          | disney+         | selfie-disney-plus     | QANOV-223234 |
          | premiere        | selfie-premiere        | QANOV-223235 |
          | netflix         | selfie-netflix         | QANOV-223236 |
          | telecine        | selfie-telecine        | QANOV-223237 |
          | globoplay       | selfie-globoplay       | QANOV-223238 |
          | amazon_prime    | selfie-amazon-prime    | QANOV-223239 |

  @jira.<jira_id> @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A user with Start tab who is in the Start tab can see a welcome message
    Given user has a "any" plan in "active" status
      And device time is between "<time_min>" and "<time_max>" hours
     Then the header that contains the "<message>" text is displayed
      And the header contains the user first name

    Examples:
          | time_min | time_max | message   | jira_id      |
          | 6:00     | 11:59    | Bom dia   | QANOV-424442 |
          | 12:00    | 17:59    | Boa tarde | QANOV-424443 |
          | 18:00    | 5:59     | Boa noite | QANOV-424444 |

  @jira.QANOV-424445 @TBD @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile
  @sanity @vivobr
  Scenario: A user can see the header content in the Start tab
    Given user has "several" start tab headers configured in CMS
     Then the "header" module is displayed
      And the "header.greeting" textfield is displayed
      And the "header.title" textfield is displayed
      And the "header.main_action" button is displayed
      And the "header.dismiss_action" link is displayed

  @jira.QANOV-424446 @TBD @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile
  @smoke @vivobr
  Scenario: A user can access to a webview after clicking in the main action button in a header in the Start tab
    The url configured in the button will come from the Reminders API
    Given user has the "TBD" start tab header configured in CMS
      And user has "any" headers from Reminders API to be displayed
     When clicks on the "header.main_action" button
     Then the internal webview is displayed

  @jira.QANOV-424448 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user cannot see the header content in the Start tab when there are no header to be displayed
    Given user has the "TBD" start tab header configured in CMS
      And user has "0" start tab headers configured in CMS
     Then the "header" module is displayed
      And the "header.greeting" textfield is displayed
      And the "header.title" textfield is not displayed
      And the "header.main_action" button is not displayed
      And the "header.dismiss_action" link is not displayed

  @jira.QANOV-424449 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile
  @regression @vivobr
  Scenario: A user cannot see the header content in the Start tab when there is an error getting the headers from the Reminders API
    Given user has the "TBD" start tab header configured in CMS
      And the Reminders API fails to get the headers
     Then the "header" module is displayed
      And the "header.greeting" textfield is displayed
      And the "header.title" textfield is not displayed
      And the "header.main_action" button is not displayed
      And the "header.dismiss_action" link is not displayed

  @jira.QANOV-517454 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @sanity
  @vivobr
  Scenario: A user can see the header warning about the maintenance mode in the Start tab during a maintenance window
    Given user has "any" start tab headers configured in CMS
      And there is a maintenance window
     Then the "header" module is displayed
      And the "header.greeting" textfield is displayed
      And the "header.title" textfield with "Estamos atualizando o app e algumas áreas podem não funcionar" text is displayed
      And the "header.main_action" button is not displayed
      And the "header.dismiss_action" link is not displayed

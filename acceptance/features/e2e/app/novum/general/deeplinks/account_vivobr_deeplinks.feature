# -*- coding: utf-8 -*-
@jira.QANOV-127140
Feature: Account Vivobr Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.12.1 @jira.link.detects.VIVO-1860
  @jira.link.relates_to.<relates_to> @mobile @old_app @vivobr
  Scenario Outline: A <account_type> user can open the "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    @automatic @live @next @qa
    Examples:
          | priority   | account_type    | relates_to | deeplink_name   | page_name               | ber | jira_id     |
          | smoke      | beatrix control | NOV-38412  | Account.Consumo | Mobile Line Consumption | ber | QANOV-44714 |
          | sanity     | beatrix control | NOV-38411  | Account.Conta   | Bills                   |     | QANOV-44718 |
          | regression | legacy          | NOV-38412  | Account.Consumo | ConsumptionV1           | ber | QANOV-44713 |

    @manual
    Examples:
          | priority   | account_type | relates_to | deeplink_name   | page_name               | ber | jira_id     |
          | regression | multivivo    | NOV-38412  | Account.Consumo | Mobile Line Consumption |     | QANOV-44716 |
          | regression | multivivo    | NOV-38411  | Account.Conta   | Bills                   |     | QANOV-44720 |
          | regression | convergente  | NOV-38412  | Account.Consumo | Mobile Line Consumption |     | QANOV-44717 |
          | regression | convergente  | NOV-38411  | Account.Conta   | Bills                   |     | QANOV-44723 |

    @impeded_legacy @no_automatable
    Examples:
          | priority   | account_type   | relates_to | deeplink_name | page_name | ber | jira_id     |
          | regression | legacy control | NOV-38411  | Account.Conta | BillsV1   |     | QANOV-44721 |
          | regression | legacy postpay | NOV-38411  | Account.Conta | BillsV1   |     | QANOV-44722 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | priority   | account_type    | relates_to | deeplink_name   | page_name               | ber | jira_id     |
          | regression | beatrix postpay | NOV-38412  | Account.Consumo | Mobile Line Consumption |     | QANOV-44715 |
          | regression | beatrix postpay | NOV-38411  | Account.Conta   | Bills                   |     | QANOV-44719 |

  @jira.<jira_id> @<ber> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @mobile
  @vivobr
  Scenario Outline: A <account_type> user can open the "<deeplink_name>" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | priority   | account_type | deeplink_name   | page_name | ber | jira_id      |
          | smoke      | beatrix      | Account.Consumo | TBD       | ber | QANOV-406504 |
          | sanity     | beatrix      | Account.Conta   | TBD       |     | QANOV-406505 |
          | regression | legacy       | Account.Consumo | TBD       | ber | QANOV-406506 |
          | regression | multivivo    | Account.Consumo | TBD       |     | QANOV-406507 |
          | regression | multivivo    | Account.Conta   | TBD       |     | QANOV-406508 |
          | regression | convergente  | Account.Consumo | TBD       |     | QANOV-406509 |
          | regression | convergente  | Account.Conta   | TBD       |     | QANOV-406510 |
          | regression | legacy       | Account.Conta   | TBD       |     | QANOV-406511 |
          | regression | control_n    | Account.Conta   | TBD       |     | QANOV-406512 |
          | regression | control_n    | Account.Consumo | TBD       |     | QANOV-599223 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.12.1 @jira.link.relates_to.<relates_to> @mobile @old_app @vivobr
  Scenario Outline: A "<account_type>" user can open the "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 0554659484"
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    @manual
    Examples:
          | account_type    | deeplink_name        | page_name  | relates_to | priority   | jira_id    |
          | legacy prepay   | Account.Saldo Prepay | BalanceV1  | NOV-29313  | regression |QANOV-44724 |
          | legacy prepay   | Account.Serviços     | ServicesV1 | NOV-57253  | regression |QANOV-44725 |
          | beatrix control | Account.Serviços     | Services   | NOV-57253  | smoke      |QANOV-44729 |
          | multivivo       | Account.Serviços     | Services   | NOV-57253  | sanity     |QANOV-44730 |
          | convergente     | Account.Serviços     | Services   | NOV-57253  | regression |QANOV-44731 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | deeplink_name    | page_name  | relates_to | priority   | jira_id     |
          | legacy control | Account.Serviços | ServicesV1 | NOV-57253  | regression | QANOV-44727 |
          | legacy postpay | Account.Serviços | ServicesV1 | NOV-57253  | regression | QANOV-44726 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | deeplink_name    | page_name | relates_to | priority   | jira_id     |
          | beatrix postpay | Account.Serviços | Services  | NOV-57253  | regression | QANOV-44728 |

  @jira.<jira_id> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A "<account_type>" user can open the "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 0554659484"
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | account_type  | deeplink_name        | page_name | priority   | jira_id      |
          | legacy prepay | Account.Saldo Prepay | TBD       | regression | QANOV-406515 |
          | legacy        | Account.Serviços     | TBD       | regression | QANOV-406516 |
          | beatrix       | Account.Serviços     | TBD       | smoke      | QANOV-406517 |
          | multivivo     | Account.Serviços     | TBD       | sanity     | QANOV-406518 |
          | convergente   | Account.Serviços     | TBD       | regression | QANOV-406519 |
          | cnotrol_n     | Account.Serviços     | TBD       | regression | QANOV-406521 |
          | jeri          | Account.Serviços     | TBD       | regression | QANOV-406522 |

  @jira.QANOV-8446 @android @automatic @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-402094
  @jira.link.relates_to.NOV-38342 @live @mobile @next @regression @vivobr
  Scenario: A user can open the "Agendamento em loja" deeplink
     When opens the "Account.Agendar atendimento" deeplink with the app in "killed" status
     Then the internal webview with "Agendamento em loja" header is displayed

  @jira.<jira_id> @<priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.<relates_to> @mobile @vivobr
  Scenario Outline: A "<account_type>" user can open "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has a "admin" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview with "<header>" header is displayed
      And waits until the "<text>" string in internal webview is displayed

    @automatic @live @next
    Examples:
          | account_type    | priority   | deeplink_name               | header                | text                   | cv   | relates_to | detects | jira_id     |
          | beatrix control | regression | Account.Share data          | Enviar internet       | Com quem compartilhar? | 10.6 | NOV-38397  |         | QANOV-8448  |
          | beatrix control | regression | Account.Extrato             | Extrato               | Extrato                | 10.0 | NOV-29318  |         | QANOV-8464  |
          | beatrix control | smoke      | Account.Recarga             | Faça uma recarga      | Recarga                | 10.0 | NOV-29306  |         | QANOV-8487  |
          | beatrix control | regression | Account.Lançamentos futuros | Lançamentos futuros   | Lançamentos futuros    | 10.2 | NOV-38392  |         | QANOV-8509  |
          | beatrix control | regression | Account.Meus Produtos       | Detalhe do plano      | Conhecer               | 10.6 | NOV-38396  |         | QANOV-8511  |
          | beatrix control | regression | Account.Pacotes             | Pacotes adicionais    | pacotes adicionais     | 10.1 | NOV-38391  |         | QANOV-8540  |
          | beatrix control | regression | Account.Ask for data        | Pedir Internet        | pedir internet         | 10.6 | NOV-38398  |         | QANOV-8543  |
          | beatrix control | regression | Account.Saldo Control       | Meus Saldos           | Saldo total            | 10.0 | NOV-29312  |         | QANOV-8547  |
          | any             | regression | Account.FAQ                 | Perguntas frequentes  | CELULAR                | 11.4 | NOV-150263 |         | QANOV-8581  |
          | any             | regression | Account.Coverage Map        | Verificar a cobertura | área de cobertura      | 11.4 | NOV-150262 |         | QANOV-8583  |
          | legacy prepay   | regression | Account.Detalhe do Plano    | Detalhe do plano      | Meu plano              | 10.2 | NOV-38390  |         | QANOV-8450  |
          | legacy prepay   | regression | Account.Recarga             | Faça uma recarga      | Recarga                | 10.0 | NOV-29306  |         | QANOV-8470  |
          | legacy prepay   | regression | Account.Lançamentos futuros | Lançamentos futuros   | Lançamentos futuros    | 10.2 | NOV-38392  |         | QANOV-8505  |
          | legacy prepay   | regression | Account.Promoções           | Minha promoção        | promoção               | 10.0 | NOV-29315  |         | QANOV-8520  |
          | legacy prepay   | regression | Account.Pacotes             | Pacotes adicionais    | Pacotes contratados    | 10.1 | NOV-38391  |         | QANOV-8528  |
          | legacy prepay   | regression | Account.Ask for data        | Pedir Internet        | pedir internet         | 12.1 | NOV-29306  |         | QANOV-44735 |
          | legacy prepay   | regression | Account.Vivo Travel         | Roaming Internacional | Vivo Travel            | 10.0 | NOV-29317  |         | QANOV-8544  |
          | legacy prepay   | regression | Account.Troca de plano      | Troca de plano        | quer trocar?           | 10.0 | NOV-29316  |         | QANOV-8550  |
          | legacy prepay   | regression | Account.Troca de aparelho   | Troca de aparelho     | Smartphone             | 12.1 | NOV-29316  |         | QANOV-44737 |

    @manual
    Examples:
          | account_type | priority   | deeplink_name         | header             | text          | cv    | relates_to | detects | jira_id    |
          | multivivo    | regression | Account.Recarga       | Faça uma recarga   | Recarga       | 11.12 | NOV-29306  |         | QANOV-8501 |
          | multivivo    | regression | Account.Meus Produtos | Meus produtos      | Meus Produtos | 11.12 | NOV-38396  |         | QANOV-8515 |
          | multivivo    | regression | Account.Pacotes       | Pacotes adicionais | Pacote somado | 11.12 | NOV-38391  |         | QANOV-8541 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | priority   | deeplink_name         | header             | text          | cv   | relates_to | detects            | jira_id     |
          | convergente     | regression | Account.Recarga       | Faça uma recarga   | Recarga       | 12.1 | NOV-38343  |                    | QANOV-44734 |
          | beatrix postpay | regression | Account.Recarga       | Faça uma recarga   | Recarga       | 10.0 | NOV-29306  |                    | QANOV-8494  |
          | beatrix postpay | smoke      | Account.Meus Produtos | Detalhe do produto | Mobile        | 10.6 | NOV-38396  | VIVO-2480:IOS-6933 | QANOV-8513  |
          | beatrix postpay | regression | Account.Pacotes       | Pacotes adicionais | Pacote somado | 10.1 | NOV-38391  |                    | QANOV-8538  |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | priority   | deeplink_name               | header              | text                | cv   | relates_to | detects | jira_id     |
          | legacy control | regression | Account.Detalhe do Plano    | Detalhe do plano    | Meu plano           | 10.2 | NOV-38390  |         | QANOV-8455  |
          | legacy postpay | smoke      | Account.Detalhe do Plano    | Detalhe do plano    | Meu plano           | 10.2 | NOV-38390  |         | QANOV-8459  |
          | legacy control | regression | Account.Recarga             | Faça uma recarga    | Recarga             | 10.0 | NOV-29306  |         | QANOV-8475  |
          | legacy postpay | regression | Account.Recarga             | Faça uma recarga    | Recarga             | 10.0 | NOV-29306  |         | QANOV-8482  |
          | legacy control | regression | Account.Lançamentos futuros | Lançamentos futuros | Lançamentos futuros | 10.2 | NOV-38392  |         | QANOV-8507  |
          | legacy control | regression | Account.Pacotes             | Pacotes adicionais  | Pacotes disponíveis | 10.1 | NOV-38391  |         | QANOV-8536  |
          | legacy postpay | regression | Account.Pacotes             | Pacotes adicionais  | Pacotes disponíveis | 10.1 | NOV-38391  |         | QANOV-8534  |
          | legacy control | regression | Account.Ask for data        | Pedir internet      | pedir internet      | 12.1 | NOV-29306  |         | QANOV-44736 |
          | legacy control | regression | Account.Vivo Travel         | Vivo Travel         | Vivo Travel         | 10.0 | NOV-29317  |         | QANOV-8545  |
          | legacy control | regression | Account.Saldo Control       | Serviços            | Saldo e Recarga     | 10.0 | NOV-29312  |         | QANOV-8548  |
          | legacy postpay | regression | Account.Vivo Travel         | Vivo Travel         | Vivo Travel         | 10.0 | NOV-29317  |         | QANOV-8546  |
          | legacy control | regression | Account.Troca de plano      | Troca de plano      | quer trocar?        | 10.0 | NOV-29316  |         | QANOV-8553  |
          | legacy postpay | regression | Account.Troca de plano      | Troca de plano      | quer trocar?        | 10.0 | NOV-29316  |         | QANOV-8555  |
          | legacy control | regression | Account.Troca de aparelho   | Troca de aparelho   | Smartphone          | 12.1 | NOV-29316  |         | QANOV-44738 |
          | legacy postpay | regression | Account.Troca de aparelho   | Troca de aparelho   | Smartphone          | 12.1 | NOV-29316  |         | QANOV-44739 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @jira.link.relates_to.<relates_to>
  @mobile @old_app @vivobr
  Scenario Outline: A "<account_type>" user can open "Account.Vivo Valoriza" deeplink
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has a "admin" role
     When opens the "Account.Vivo Valoriza" deeplink with the app in "killed" status
     Then the "Vivo Valoriza" page is displayed

    @automatic @live @next
    Examples:
          | account_type    | priority   | cv   | relates_to | detects | jira_id    |
          | beatrix control | regression | 10.2 | NOV-38343  |         | QANOV-8577 |

    @manual
    Examples:
          | account_type | priority   | cv    | relates_to | detects | jira_id     |
          | multivivo    | regression | 11.12 | NOV-38343  |         | QANOV-8579  |
          | convergente  | regression | 12.1  | NOV-38343  |         | QANOV-44740 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | priority   | cv   | relates_to | detects | jira_id    |
          | beatrix postpay | regression | 10.2 | NOV-38343  |         | QANOV-8575 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | priority   | cv   | relates_to | detects | jira_id    |
          | legacy control | regression | 10.2 | NOV-38343  |         | QANOV-8573 |
          | legacy postpay | smoke      | 10.2 | NOV-38343  |         | QANOV-8571 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A "<account_type>" user can open "Account.Vivo Valoriza" deeplink
    Given user has a "<account_type>" account type
      And user has a "admin" role
     When opens the "Account.Vivo Valoriza" deeplink with the app in "killed" status
     Then the "Vivo Valoriza" page is displayed

    Examples:
          | account_type   | priority   | jira_id      |
          | beatrix        | smoke      | QANOV-406523 |
          | multivivo      | regression | QANOV-406524 |
          | convergente    | regression | QANOV-406525 |
          | legacy control | regression | QANOV-406527 |
          | legacy postpay | regression | QANOV-406528 |

  @jira.<jira_id> @<priority> @android @jira.cv.<cv> @jira.link.detects.<detects> @jira.link.parent_test_plan.QANOV-402094
  @jira.link.relates_to.<relates_to> @mobile @vivobr
  Scenario Outline: A "<account_type>" user can open "<deeplink_name>" deeplink on Android devices
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has a "admin" role
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview with "<header>" header is displayed
      And waits until the "<text>" string in internal webview is displayed

    @automatic @live @next
    Examples:
          | account_type  | priority   | deeplink_name          | header         | text           | cv   | relates_to | detects   | jira_id    |
          | legacy prepay | regression | Account.Vivo App Store | Vivo App Store | VIVO APP STORE | 10.2 | NOV-38393  | VIVO-2742 | QANOV-8557 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | priority   | deeplink_name          | header         | text           | cv   | relates_to | detects | jira_id    |
          | legacy control | regression | Account.Vivo App Store | Vivo App Store | VIVO APP STORE | 10.2 | NOV-38393  |         | QANOV-8568 |
          | legacy postpay | smoke      | Account.Vivo App Store | Vivo App Store | VIVO APP STORE | 10.2 | NOV-38393  |         | QANOV-8562 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094
  @jira.link.relates_to.<relates_to> @mobile @vivobr
  Scenario Outline: A "<account_type>" user can open "<deeplink_name>" deeplink
    internal_checkpoint="beatrix control monoline: 05546594845"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has a "admin" role
      And user has "data" allowances in the "mobile_line" product
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview with "<header>" header is displayed
      And waits until the "<text>" string in internal webview is displayed

    @automatic @live @next
    Examples:
          | account_type  | priority   | deeplink_name           | header                | text                            | cv   | relates_to | jira_id     |
          | any           | regression | Account.Verify Internet | Suporte Técnico       | Olá, estamos aqui pra te ajudar | 11.4 | NOV-150260 | QANOV-8584  |
          | legacy prepay | regression | Account.Share data      | Compartilhar Internet | Com quem compartilhar?          | 12.1 | NOV-29306  | QANOV-44732 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | priority   | deeplink_name      | header                | text                   | cv   | relates_to | jira_id     |
          | legacy control | regression | Account.Share data | Compartilhar Internet | Com quem compartilhar? | 12.1 | NOV-29306  | QANOV-44733 |

  @jira.<jira_id> @android @ios @jira.cv.11.12 @jira.link.parent_test_plan.QANOV-402094 @mobile @regression @vivobr
  Scenario Outline: A "<account_type>" user can open "Account.Meus Apps" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "Account.Meus Apps" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Meus Apps" header is displayed
      And waits until the "APPS INCLUSOS" string in internal webview is displayed

    @autoamtic @live @next
    Examples:
          | account_type    | cv    | jira_id    |
          | beatrix control | 11.12 | QANOV-8586 |

    @manual
    Examples:
          | account_type | cv    | jira_id    |
          | multivivo    | 11.12 | QANOV-8587 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | cv    | jira_id     |
          | beatrix postpay | 11.12 | QANOV-8585  |
          | convergente     | 12.1  | QANOV-44742 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | cv    | jira_id     |
          | legacy control | 12.1  | QANOV-44741 |
          | legacy postpay | 11.12 | QANOV-8588  |

  @jira.QANOV-8589 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: Admin user can open "Distribuir Internet" deeplink
    Given user has a "multivivo" account type
      And user has a "admin" role
      And user has "1" plans
     When opens the "Account.Distribute Internet" deeplink with the app in "killed" status
     Then the "Distribuir Internet" internal webview is displayed
      And the "Distribuir internet" header is displayed

  @jira.QANOV-8590 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: Dependent user cannot open "Distribuir Internet" deeplink
    Given user has a "multivivo" account type
      And user has a "dependent" role
     When opens the "Account.Distribute Internet" deeplink with the app in "killed" status
     Then the "Not Available" page is displayed
      And the "not_available_deeplink_message" textfield with "[LANG:pageelements.not_available_deeplink.message]" text is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.11.12 @live @mobile @next @old_app @smoke @vivobr @har
  Scenario Outline: A user can open "Main Account Dashboard" deeplink
    Given user has a "<account_type>" account type
     When opens the "Account.Main Account Dashboard" deeplink with the app in "killed" status
     Then the "Account" page is displayed
      And the "Meu Plano" header is displayed

    Examples:
          | account_type | jira_id    |
          | beatrix      | QANOV-8594 |
          | multivivo    | QANOV-8595 |

  @jira.QANOV-406529 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @smoke @vivobr
  Scenario: A user can open "Main Account Dashboard" deeplink
    Given opens the "Account.Main Account Dashboard" deeplink with the app in "killed" status
     Then the "Assinatura" page is displayed

  @jira.QANOV-8592 @android @automatic @ios @jira.cv.11.12 @live @mobile @next @old_app @regression @vivobr
  Scenario: A legacy user can open "Main Account Dashboard" deeplink
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
     When opens the "Account.Main Account Dashboard" deeplink with the app in "killed" status
     Then the "AccountV1" page is displayed

  @jira.QANOV-44743 @android @impeded_mock @ios @jira.cv.12.1 @manual @mobile @old_app @regression @vivobr
  Scenario: A convergente user can open "Account.Meus Produtos" deeplink
    Given user has a "convergente" account type
      And user has "1" plans
     When opens the "Account.Meus Produtos" deeplink with the app in "killed" status
     Then the "Plan Details" page is displayed
      And the "Detalhe Do Produto" header is displayed

  @jira.QANOV-406530 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @regression @vivobr
  Scenario: A convergente user can open "Account.Meus Produtos" deeplink
    Given user has a "convergente" account type
      And user has "1" plans
     When opens the "Account.Meus Produtos" deeplink with the app in "killed" status
     Then the "TBD" page is displayed
      And the "TBD" header is displayed

  @jira.QANOV-44754 @android @impeded_mock @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @smoke
  @vivobr
  Scenario: A convergente user can open the "Account.2a Via de Conta" deeplink
    Given user has any "convergente;multivivo;beatrix" account types
      And user has installed the "Google Drive" app
     When opens the "Account.2a Via de Conta" deeplink with the app in "killed" status
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.12.1 @jira.link.detects.VIVO-2108
  @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.NOV-38411 @mobile @no_automatable @regression @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Gerar código de barras" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "Account.Gerar código de barras" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Serviços" header is displayed
      And the "Sua conta" text is displayed

    Examples:
          | account_type   | jira_id     |
          | legacy control | QANOV-44758 |
          | legacy postpay | QANOV-44759 |

  @jira.<jira_id> @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @mobile @regression @vivobr
  Scenario Outline: A "<account_type>" user can open "Account.Vivo Play" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
     When opens the "Account.Vivo Play" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "<text>" text is displayed

    @manual
    Examples:
          | account_type    | header    | text       | jira_id     |
          | beatrix postpay | Vivo play | beneficios | QANOV-44761 |
          | convergente     | Vivo play | beneficios | QANOV-44762 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | header    | text       | jira_id     |
          | legacy postpay | Vivo play | beneficios | QANOV-44760 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @jira.link.detects.VIVO-2114
  @jira.link.parent_test_plan.QANOV-402094 @live @mobile @next @regression @vivobr
  Scenario Outline: A user can open "<deeplink_name>" deeplink
    Given user has a "admin" role
      And user has "1" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the internal webview with "<header>" header is displayed
      And waits until the "<text>" string in internal webview is displayed

    @automatic
    Examples:
          | deeplink_name                   | header                  | cv   | text                            | detects   | jira_id     |
          | Account.Suporte técnico         | Suporte Técnico         | 12.1 | Olá, estamos aqui pra te ajudar |           | QANOV-44763 |
          | Account.Número de protocolo     | Número de Protocolo     | 12.1 | Protocolo Atendimento           |           | QANOV-44765 |
          | Account.Histórico de protocolos | Histórico de protocolos | 12.1 | Consultas de protocolos         |           | QANOV-44766 |
          | Account.Testar Velocidade       | Teste de velocidade     | 12.1 | Iniciar                         | VIVO-3603 | QANOV-44770 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario Outline: A convergente user can open "<deeplink_name>" deeplink
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "landline" plan
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "<text>" text is displayed

    Examples:
          | deeplink_name             | header            | text              | jira_id     |
          | Account.Meus Apps         | Serviços          | Meus Apps         | QANOV-44825 |
          | Account.Meus Produtos     | Meus produtos     | Meus Produtos     | QANOV-44826 |
          | Account.Conta digital     | Conta Digital     | Conta Digital     | QANOV-44827 |
          | Account.Débito automático | Débito automático | Débito Automático | QANOV-44828 |
          | Account.Recarga           | Faça uma recarga  | Recarga           | QANOV-44829 |
          | Account.Vivo Play         | Vivo play         | beneficios        | QANOV-44830 |

  @jira.QANOV-44831 @android @automation.pending_mock @impeded_mock @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094
  @manual @mobile @regression @vivobr
  Scenario: A convergente user can open "Vivo App Store" deeplink on Android devices
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "landline" plan
     When opens the "Account.Vivo App Store" deeplink with the app in "killed" status
     Then the internal webview with "Vivo App Store" header is displayed
      And waits until the "VIVO APP STORE" string in internal webview is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.1 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: A convergente user can open the "<deeplink_name>" deeplink
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "landline" plan
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | deeplink_name    | page_name | jira_id     |
          | Account.Conta    | Bills     | QANOV-44832 |
          | Account.Serviços | Services  | QANOV-44833 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario Outline: A convergente user can open the "<deeplink_name>" deeplink
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "landline" plan
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | deeplink_name    | page_name | jira_id      |
          | Account.Conta    | TBD       | QANOV-406531 |
          | Account.Serviços | TBD       | QANOV-406532 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010 @manual @mobile
  @old_app @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Pay_bills" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has bills
      And has "several" bills in "unpaid" status in any subscription
     When opens the "Account.Pay_bills" deeplink with the app in "killed" status
     Then the "Bill Selection" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-230769 |
          | smoke      | multivivo    |     | QANOV-230770 |
          | regression | convergente  |     | QANOV-230771 |

  @jira.<jira_id> @<ber> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual
  @mobile @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Pay_bills" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has bills
      And has "several" bills in "unpaid" status in any subscription
     When opens the "Account.Pay_bills" deeplink with the app in "killed" status
     Then the "TBD" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-406533 |
          | smoke      | multivivo    |     | QANOV-406534 |
          | regression | convergente  |     | QANOV-406535 |

  @jira.<jira_id> @<ber> @<priority> @android @automatic @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010
  @mobile @old_app @qa @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Recurrente" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "configured" status
     When opens the "Account.Recurrente" deeplink with the app in "killed" status
     Then the "Manage Recurrent Payment" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      |     | QANOV-230772 |
          | regression | multivivo    |     | QANOV-230773 |
          | smoke      | convergente  | ber | QANOV-230774 |

  @jira.<jira_id> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual
  @mobile @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Recurrente" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "configured" status
     When opens the "Account.Recurrente" deeplink with the app in "killed" status
     Then the "TBD" page is displayed

    Examples:
          | priority   | account_type | jira_id      |
          | smoke      | beatrix      | QANOV-406536 |
          | smoke      | multivivo    | QANOV-406537 |
          | regression | convergente  | QANOV-406538 |

  @jira.<jira_id> @<ber> @<priority> @android @automatic @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010
  @mobile @old_app @qa @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Recurrente" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "deactivated" status
     When opens the "Account.Recurrente" deeplink with the app in "killed" status
     Then the "Enable Recurrent Payment" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      |     | QANOV-230775 |
          | regression | multivivo    |     | QANOV-230776 |
          | smoke      | convergente  | ber | QANOV-230777 |

  @jira.<jira_id> @<ber> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual
  @mobile @vivobr
  Scenario Outline: A <account_type> user can open the "Account.Recurrente" deeplink
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "deactivated" status
     When opens the "Account.Recurrente" deeplink with the app in "killed" status
     Then the "TBD" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-406539 |
          | smoke      | multivivo    |     | QANOV-406540 |
          | regression | convergente  |     | QANOV-406541 |

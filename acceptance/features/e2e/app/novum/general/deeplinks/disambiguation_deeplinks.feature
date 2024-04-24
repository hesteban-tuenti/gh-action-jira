# -*- coding: utf-8 -*-
@jira.QANOV-127142
Feature: Disambiguation Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @android @automatic @ios @jira.cv.11.7 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.<relates_to> @mobile @moves
  Scenario Outline: A user with more than one mobile line tries to open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    internal_checkpoint="phone_number may include the number or the contact name product include values such as
    'Línea móvil' or 'Mobile' customer type include values such as 'Contrato' or 'Pay monthly'"
    other_affected_versions=2021-18
    Given user has "several" mobile lines
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "title" textfield with the "\d\d\d \d\d \d\d" format
      And each element in the "lines.list" list has the "subtitle" field
      And the "title" field of "lines.list" list entries will match the user mobile lines

    @ber @cert2 @live @next @qa @sanity
    Examples:
          | relates_to | deeplink_name         | parent_test_plan | jira_id    |
          | NOV-186309 | Account.Data Purchase | QANOV-189597     | QANOV-8365 |

    @cert2 @live @next @qa @smoke
    Examples:
          | relates_to | deeplink_name  | parent_test_plan         | jira_id     |
          |            | Account.Mobile | QANOV-28881:QANOV-189597 | QANOV-35055 |

  @jira.QANOV-8366 @android @automatic @cert0 @cert1 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-203244 @live @mobile
  @next @o2uk @sanity
  Scenario: A o2uk user with more than one mobile line tries to open the "Account.Bolt Ons" deeplink: disambiguation screen is displayed
    internal_checkpoint="phone_number may include the number or the contact name product include values such as
    'Línea móvil' or 'Mobile' customer type include values such as 'Contrato' or 'Pay monthly'"
    other_affected_versions=2021-18
    Given user has "several" mobile lines
     When opens the "Account.Bolt Ons" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines" list has the "phone_number" field
      And each element in the "lines" list has the "product_customer_type" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines

  @jira.<jira_id> @android @cert0 @cert1 @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-573446 @manual @mobile @o2uk
  @regression @e2e
  Scenario Outline: An o2uk user with more than one mobile line tries to open the <deeplink_name> deeplink: The disambiguation screen is displayed
    Given user has "several" mobile lines
     When opens the "OB.Support.<deeplink_name>" deeplink with the app in "killed" status
     Then the "Line Disambigutaion" page is displayed
      And each element in the "lines" list has the "phone_number" field
      And each element in the "lines" list has the "product_customer_type" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines

    Examples:
          | deeplink_name         | jira_id      |
          | Looking to upgrade?   | QANOV-606371 |
          | Make a payment        | QANOV-606372 |
          | Unlock my device      | QANOV-606373 |
          | Track my order        | QANOV-606374 |
          | Your extras           | QANOV-606375 |
          | View your latest bill | QANOV-606376 |

  @jira.<jira_id> @android @cert0 @cert1 @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-573446 @manual @mobile @o2uk
  @regression @e2e
  Scenario Outline: An o2uk user with more than one mobile line can open the <deeplink_name> deeplink: The internal webview is displayed after select a product in the disambiguation screen
    Given user has "several" mobile lines
     When opens the "OB.Support.<deeplink_name>" deeplink with the app in "killed" status
      And the "Line Disambigutaion" page is displayed
      And clicks on any element in the "lines" list
     Then the internal webview is displayed
      And the header that contains the "<header>" text is displayed

    Examples:
          | deeplink_name       | header          | jira_id      |
          | Looking to upgrade? | Upgrades        | QANOV-606377 |
          | Make a payment      | O2 \| My Bills  | QANOV-606378 |
          | Unlock my device    | O2 \| My device | QANOV-606379 |
          | Track my order      | O2 \| My device | QANOV-606380 |
          | Your extras         | O2 \| My device | QANOV-606381 |

  @jira.QANOV-606382 @android @cert0 @cert1 @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-573446 @manual @mobile
  @o2uk @regression @e2e
  Scenario: An o2uk user with more than one mobile line can open the View your latest bill deeplink: Bills page is displayed after select a product in the disambiguation screen
    Given user has "several" mobile lines
     When opens the "Account.View your latest bill" deeplink with the app in "killed" status
      And the "Line Disambigutaion" page is displayed
      And clicks on any element in the "lines" list
     Then the "Bills" page is displayed

  @jira.QANOV-36667 @android @automatic @cert2 @ios @jira.cv.11.7 @live @mobile @moves @next @qa @regression
  Scenario: A user with more than one mobile line tries to open the "Account.Movistar Cloud Hire" deeplink: disambiguation screen is displayed
    internal_checkpoint="phone_number may include the number or the contact name product include values such as
    'Línea móvil' or 'Mobile' customer type include values such as 'Contrato' or 'Pay monthly'"
    other_affected_versions=2021-18
    Given user has "several" mobile lines
      And user has the "movistar_cloud" service in "deactivated" status in more than "1" lines
     When opens the "Account.Movistar Cloud Hire" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And each element in the "lines.list" list has the "icon" field
      And each element in the "lines.list" list has the "title" field
      And each element in the "lines.list" list has the "subtitle" field
      And each element in the "lines.list" list has the "chevron" field
      And the "title" field of "lines.list" list entries will match with the matching mobile lines

  @jira.<jira_id> @<priority> @android @ios @jira.cv.12.1 @manual @mobile @vivobr
  Scenario Outline: A user with more than one mobile line tries to open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | deeplink_name                   | priority   | jira_id     |
          | Account.Meus Apps               | regression | QANOV-44777 |
          | Account.Serviços                | smoke      | QANOV-44779 |
          | Account.Conta digital           | regression | QANOV-44782 |
          | Account.Débito automático       | regression | QANOV-44783 |
          | Account.Recarga                 | regression | QANOV-44784 |
          | Account.Troca de aparelho       | regression | QANOV-44786 |
          | Account.Vivo Play               | regression | QANOV-44790 |
          | Account.Coverage Map            | regression | QANOV-58653 |
          | Account.FAQ                     | regression | QANOV-58654 |
          | Account.Agendar atendimento     | regression | QANOV-58655 |
          | Account.Ouvidoria               | regression | QANOV-58656 |
          | Account.Número de protocolo     | regression | QANOV-58657 |
          | Account.Histórico de protocolos | regression | QANOV-58658 |
          | Account.Fale com a Vivo         | regression | QANOV-58660 |
          | Account.Testar Velocidade       | regression | QANOV-58661 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @vivobr
  Scenario Outline: A user with more than one mobile line tries to open the "<deeplink_name>" deeplink: disambiguation screen is displayed
    Given user has "several" plans
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | deeplink_name                   | priority   | jira_id      |
          | Account.Meus Apps               | regression | QANOV-406542 |
          | Account.Serviços                | smoke      | QANOV-406543 |
          | Account.Conta digital           | regression | QANOV-406544 |
          | Account.Débito automático       | regression | QANOV-406545 |
          | Account.Recarga                 | regression | QANOV-406546 |
          | Account.Troca de aparelho       | regression | QANOV-406547 |
          | Account.Vivo Play               | regression | QANOV-406548 |
          | Account.Coverage Map            | regression | QANOV-406549 |
          | Account.FAQ                     | regression | QANOV-406550 |
          | Account.Agendar atendimento     | regression | QANOV-406551 |
          | Account.Ouvidoria               | regression | QANOV-406552 |
          | Account.Número de protocolo     | regression | QANOV-406553 |
          | Account.Histórico de protocolos | regression | QANOV-406554 |
          | Account.Fale com a Vivo         | regression | QANOV-406555 |
          | Account.Testar Velocidade       | regression | QANOV-406556 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-573445 @manual @mobile @regression
  @vivobr
  Scenario Outline: A <account_type> user without promotions and with more than one line tries to open the "Assinar promoçao" deeplink: disambiguation screen is displayed
    Given user has "several" lines of the "<account_type>" account type
      And user does not have contracted promotions
     When opens the "Account.Assinar promoçao" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-576351 |
          | jeri prepay   | QANOV-576352 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-573445 @manual @mobile @regression
  @vivobr
  Scenario Outline: A <account_type> user without promotions and with more than one line who is in the disambiguation screen for the "Assinar promoçao" deeplink selects a product
    Given user has "several" lines of the "<account_type>" account type
      And user does not have contracted promotions
     When opens the "Account.Assinar promoçao" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
      And clicks on the "0" element in the "plan" list
     Then the internal webview is displayed
      And the "Assinatura atual" string is displayed

    Examples:
          | account_type  | jira_id      |
          | legacy prepay | QANOV-576353 |
          | jeri prepay   | QANOV-576354 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.11.7 @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-186311 @mobile @regression
  Scenario Outline: A user who is in disambiguation screen goes back to previous screen
    Given user has "several" mobile lines
      And terminates the app
      And launches the app
      And initiate the app
      And user is in the "Profile" page
      And user opens the "<deeplink_name>" deeplink with the app in "foreground" status
      And the "Line Disambiguation" page is displayed
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Profile" page is displayed

    @cert2 @live @next @qa
    Examples:
          | product | deeplink_name         | parent_test_plan | detects    | jira_id     |
          | moves   | Account.Data Purchase |                  |            | QANOV-8367  |
          | moves   | Account.Mobile        | QANOV-28881      | MOVES-5154 | QANOV-35056 |

    @cert0 @cert1 @live @next
    Examples:
          | product | deeplink_name    | parent_test_plan | jira_id    |
          | o2uk    | Account.Bolt Ons |                  | QANOV-8368 |

  @jira.QANOV-36668 @android @automatic @cert2 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186311 @live @mobile @moves
  @next @qa @regression
  Scenario: A moves user who is in disambiguation screen goes back to previous screen
    Given user has "several" mobile lines
      And user has the "movistar_cloud" service in "deactivated" status in more than "1" lines
      And user is in the "Profile" page
      And user opens the "Account.Movistar Cloud Hire" deeplink with the app in "foreground" status
      And the "Line Disambiguation" page is displayed
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Profile" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario Outline: A user who is in disambiguation screen goes back to previous screen
    Given user has "several" plans
      And user opens the "<deeplink_name>" deeplink with the app in "foreground" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the native "back" button
     Then the previous page is displayed

    Examples:
          | deeplink_name                   | jira_id     |
          | Account.Meus Apps               | QANOV-44793 |
          | Account.Serviços                | QANOV-44795 |
          | Account.Conta digital           | QANOV-44798 |
          | Account.Débito automático       | QANOV-44799 |
          | Account.Recarga                 | QANOV-44800 |
          | Account.Troca de aparelho       | QANOV-44802 |
          | Account.Vivo Play               | QANOV-44806 |
          | Account.Coverage Map            | QANOV-58663 |
          | Account.FAQ                     | QANOV-58664 |
          | Account.Agendar atendimento     | QANOV-58665 |
          | Account.Ouvidoria               | QANOV-58666 |
          | Account.Número de protocolo     | QANOV-58667 |
          | Account.Histórico de protocolos | QANOV-58668 |
          | Account.Fale com a Vivo         | QANOV-58670 |
          | Account.Testar Velocidade       | QANOV-58671 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186313 @mobile @netcracker
  @regression
  Scenario Outline: A <product> user who is in disambiguation screen selects a product
    Given user has "several" mobile lines
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on the "chevron" field of "lines.list" list with "0" index
     Then the "<page_name>" page is displayed
      And the internal webview with "<header>" header is displayed

    @cert2 @live @next @qa
    Examples:
          | product | deeplink_name         | page_name             | header          | parent_test_plan | jira_id     |
          | moves   | Account.Data Purchase | Data Management       | Gestionar datos |                  | QANOV-8371  |
          | moves   | Account.Mobile        | Mobile Line Dashboard | Línea móvil     | QANOV-28881      | QANOV-35057 |

    @cert0 @cert1 @live @next
    Examples:
          | product | deeplink_name    | page_name | header        | parent_test_plan | jira_id    |
          | o2uk    | Account.Bolt Ons | Bolt Ons  | Your Bolt Ons |                  | QANOV-8372 |

  @jira.QANOV-36669 @android @automatic @cert2 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186313 @live @mobile @moves
  @next @qa @regression
  Scenario: A moves user who is in disambiguation screen selects a product
    Given user has "several" mobile lines
      And user has the "movistar_cloud" service in "deactivated" status in more than "1" lines
      And user opens the "Account.Movistar Cloud Hire" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on the "chevron" field of "lines.list" list with "0" index
     Then the "Movistar Cloud Hire" page is displayed
      And the internal webview with "Movistar Cloud" header is displayed

  @jira.<jira_id> @<priority> @android @ios @jira.cv.12.1 @manual @mobile @vivobr
  Scenario Outline: A vivobr user who is in disambiguation screen selects a product
    Given user has "several" plans
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "<page_name>" page is displayed

    Examples:
          | deeplink_name        | page_name | priority   | jira_id     |
          | Account.Serviços     | Services  | smoke      | QANOV-44809 |
          | Account.Saldo Prepay | BalanceV1 | regression | QANOV-44810 |

  @jira.<jira_id> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A vivobr user who is in disambiguation screen selects a product
    Given user has "several" plans
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "<page_name>" page is displayed

    Examples:
          | deeplink_name        | page_name | priority   | jira_id      |
          | Account.Serviços     | TBD       | smoke      | QANOV-406557 |
          | Account.Saldo Prepay | TBD       | regression | QANOV-406558 |

  @jira.<jira_id> @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression @vivobr
  Scenario Outline: A vivobr user who is in disambiguation screen selects a product
    Given user has "several" plans
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the internal webview is displayed
      And the "<header>" header is displayed

    Examples:
          | deeplink_name                   | header                  | jira_id     |
          | Account.Meus Apps               | Meus Apps               | QANOV-44812 |
          | Account.Conta digital           | Conta Digital           | QANOV-44814 |
          | Account.Débito automático       | Débito automático       | QANOV-44815 |
          | Account.Recarga                 | Faça uma recarga        | QANOV-44816 |
          | Account.Troca de aparelho       | Troca de aparelho       | QANOV-44818 |
          | Account.Vivo Play               | Vivo play               | QANOV-44821 |
          | Account.Coverage Map            | Verificar a cobertura   | QANOV-58673 |
          | Account.FAQ                     | Perguntas frequentes    | QANOV-58674 |
          | Account.Agendar atendimento     | Agendar atendimento     | QANOV-58675 |
          | Account.Ouvidoria               | Ouvidoria               | QANOV-58676 |
          | Account.Número de protocolo     | Número de Protocolo     | QANOV-58677 |
          | Account.Histórico de protocolos | Histórico de protocolos | QANOV-58678 |
          | Account.Fale com a Vivo         | Fale com a vivo         | QANOV-58680 |
          | Account.Testar Velocidade       | Testar velocidade       | QANOV-58681 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186314 @mobile @regression
  Scenario Outline: A user who picked a product in disambiguation screen can go back to disambiguation screen
    Given user has "several" mobile lines
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "0" index
      And the "<page_name>" page is displayed
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Line Disambiguation" page is displayed

    @cert2 @live @next @qa
    Examples:
          | product | deeplink_name         | page_name             | parent_test_plan | jira_id     |
          | moves   | Account.Data Purchase | Data Management       |                  | QANOV-8369  |
          | moves   | Account.Mobile        | Mobile Line Dashboard | QANOV-28881      | QANOV-35058 |

  @jira.QANOV-8370 @android @automatic @cert0 @cert1 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186314 @live @mobile
  @netcracker @next @o2uk @regression
  Scenario: A o2uk user who picked a product in disambiguation screen can go back to disambiguation screen
    Given user has "several" mobile lines
      And user opens the "Account.Bolt Ons" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "0" index
      And the "Bolt Ons" page is displayed
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Line Disambiguation" page is displayed

  @jira.QANOV-36670 @android @automatic @cert2 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186314 @live @mobile @moves
  @next @qa @regression
  Scenario: A moves user who picked a product in disambiguation screen can go back to disambiguation screen
    Given user has "several" mobile lines
      And user has the "movistar_cloud" service in "deactivated" status in more than "1" lines
      And user opens the "Account.Movistar Cloud Hire" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "0" index
      And the "Movistar Cloud Hire" page is displayed
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Line Disambiguation" page is displayed

  @jira.QANOV-44823 @android @ios @jira.cv.12.1 @manual @mobile @regression @vivobr
  Scenario: A user who picked a product in disambiguation screen can go back to disambiguation screen
    Given user has "several" plans
      And user has "any" mobile lines in the plans
      And user opens the "Account.Consumo" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
      And clicks on the "0" element in the "plan" list
      And the "Mobile Line Consumption" page is displayed
     When clicks on the native "back" button
     Then the "Line Disambiguation" page is displayed

  @jira.QANOV-406559 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: A user who picked a product in disambiguation screen can go back to disambiguation screen
    Given user has "several" plans
      And user has "any" mobile lines in the plans
      And user opens the "Account.Consumo" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
      And clicks on the "0" element in the "plan" list
      And the "TBD" page is displayed
     When clicks on the native "back" button
     Then the "Line Disambiguation" page is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186315 @mobile @netcracker
  @regression
  Scenario Outline: A user who is in disambiguation screen after having selected a product/line, can pick a different one
    Given user has "several" mobile lines
      And user opens the "<deeplink_name>" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "0" index
      And the "<page_name>" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed
     When clicks on the "chevron" field of "lines.list" list with "1" index
     Then the "<page_name>" page is displayed
      And the internal webview with "<header>" header is displayed

    @cert2 @live @next @qa
    Examples:
          | product | deeplink_name         | page_name             | header          | parent_test_plan | jira_id     |
          | moves   | Account.Data Purchase | Data Management       | Gestionar datos |                  | QANOV-8375  |
          | moves   | Account.Mobile        | Mobile Line Dashboard | Línea móvil     | QANOV-28881      | QANOV-35059 |

  @jira.QANOV-8380 @android @automatic @cert0 @cert1 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186315 @live @mobile
  @netcracker @next @o2uk @regression
  Scenario: A o2uk user who is in disambiguation screen after having selected a product/line, can pick a different one
    Given user has "several" mobile lines
      And user opens the "Account.Bolt Ons" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "0" index
      And the "Bolt Ons" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed
     When clicks on the "chevron" field of "lines.list" list with "1" index
     Then the "Bolt Ons" page is displayed
      And the internal webview with "Your Bolt Ons" header is displayed

  @jira.QANOV-36671 @android @automatic @cert2 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-186315 @live @mobile @moves
  @next @qa @regression
  Scenario: A moves user who is in disambiguation screen after having selected a product/line, can pick a different one
    Given user has "several" mobile lines
      And user has the "movistar_cloud" service in "deactivated" status in more than "1" lines
      And user opens the "Account.Movistar Cloud Hire" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "0" index
      And the "Movistar Cloud Hire" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Line Disambiguation" page is displayed
     When clicks on the "chevron" field of "lines.list" list with "1" index
     Then the "Movistar Cloud Hire" page is displayed
      And the internal webview with "Movistar Cloud" header is displayed

  @jira.QANOV-44824 @android @ios @jira.cv.12.1 @manual @mobile @regression @vivobr
  Scenario: A user who is in disambiguation screen after having selected a product/line, can pick a different one
    Given user has "several" plans
      And user has "any" mobile lines in the plans
      And user opens the "Account.Consumo" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
      And clicks on the "0" element in the "plan" list
      And the "Mobile Line Consumption" page is displayed
      And clicks on the native "back" button
      And the "Line Disambiguation" page is displayed
     When clicks on the "1" element in the "plan" list
     Then the "Mobile Line Consumption" page is displayed

  @jira.QANOV-406560 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @regression
  @vivobr
  Scenario: A user who is in disambiguation screen after having selected a product/line, can pick a different one
    Given user has "several" plans
      And user has "any" mobile lines in the plans
      And user opens the "Account.Consumo" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
      And clicks on the "0" element in the "plan" list
      And the "TBD" page is displayed
      And clicks on the native "back" button
      And the "Line Disambiguation" page is displayed
     When clicks on the "1" element in the "plan" list
     Then the "TBD" page is displayed

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010 @manual @mobile @vivobr
  Scenario Outline: A <account_type> user with more than one mobile line tries to open the "Account.Pay_bills" deeplink: disambiguation screen is displayed
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has bills
      And user has a month with "unpaid" bill
     When opens the "Account.Pay_bills" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | priority   | account_type | ber | jira_id      |
          | sanity     | beatrix      | ber | QANOV-230778 |
          | smoke      | multivivo    |     | QANOV-230779 |
          | regression | convergente  |     | QANOV-230780 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A <account_type> user with more than one mobile line tries to open the "Account.Pay_bills" deeplink: disambiguation screen is displayed
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has bills
      And user has a month with "unpaid" bill
     When opens the "Account.Pay_bills" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | priority   | account_type | ber | jira_id      |
          | sanity     | beatrix      | ber | QANOV-406561 |
          | smoke      | multivivo    |     | QANOV-406562 |
          | regression | convergente  |     | QANOV-406563 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010 @manual @mobile @vivobr
  Scenario Outline: A <account_type> vivobr user who is in disambiguation screen for the "Account.Pay_bills" deeplink selects a product
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has bills
      And has "several" bills in "unpaid" status in any subscription
      And user opens the "Account.Pay_bills" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "Bill Selection" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-230781 |
          | smoke      | multivivo    |     | QANOV-230782 |
          | regression | convergente  |     | QANOV-230783 |

  @jira.<jira_id> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A <account_type> vivobr user who is in disambiguation screen for the "Account.Pay_bills" deeplink selects a product
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has bills
      And has "several" bills in "unpaid" status in any subscription
      And user opens the "Account.Pay_bills" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "TBD" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-406564 |
          | smoke      | multivivo    |     | QANOV-406565 |
          | regression | convergente  |     | QANOV-406566 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010 @manual @mobile @vivobr
  Scenario Outline: A <account_type> user with more than one mobile line tries to open the "Account.Recurrente" deeplink: disambiguation screen is displayed
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have a "siebel" plan
      And user has bills
     When opens the "Account.Recurrente" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "icon" field
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-230784 |
          | smoke      | multivivo    |     | QANOV-230785 |
          | regression | convergente  |     | QANOV-230786 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @vivobr
  Scenario Outline: A <account_type> user with more than one mobile line tries to open the "Account.Recurrente" deeplink: disambiguation screen is displayed
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have a "siebel" plan
      And user has bills
     When opens the "Account.Recurrente" deeplink with the app in "killed" status
     Then the "Plan Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-406567 |
          | smoke      | multivivo    |     | QANOV-406568 |
          | regression | convergente  |     | QANOV-406569 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010 @manual @mobile @vivobr
  Scenario Outline: A <account_type> vivobr user who is in disambiguation screen for the "Account.Recurrente" deeplink selects a product
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "deactivated" status
      And user opens the "Account.Recurrente" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "Enable Recurrent Payment" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-230787 |
          | smoke      | multivivo    |     | QANOV-230788 |
          | regression | convergente  |     | QANOV-230789 |

  @jira.<jira_id> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A <account_type> vivobr user who is in disambiguation screen for the "Account.Recurrente" deeplink selects a product
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "deactivated" status
      And user opens the "Account.Recurrente" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "TBD" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-406570 |
          | smoke      | multivivo    |     | QANOV-406571 |
          | regression | convergente  |     | QANOV-406572 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-228010 @manual @mobile @vivobr
  Scenario Outline: A <account_type> vivobr user who is in disambiguation screen for the "Account.Recurrente" deeplink selects a product
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "configured" status
      And user opens the "Account.Recurrente" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "Manage Recurrent Payment" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-230790 |
          | smoke      | multivivo    |     | QANOV-230791 |
          | regression | convergente  |     | QANOV-230792 |

  @jira.<jira_id> @<priority> @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @vivobr
  Scenario Outline: A <account_type> vivobr user who is in disambiguation screen for the "Account.Recurrente" deeplink selects a product
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user does not have a "siebel" plan
      And user has bills
      And user has "recurrent_payment" service in "configured" status
      And user opens the "Account.Recurrente" deeplink with the app in "killed" status
      And the "Plan Disambiguation" page is displayed
     When clicks on the "0" element in the "plan" list
     Then the "TBD" page is displayed

    Examples:
          | priority   | account_type | ber | jira_id      |
          | smoke      | beatrix      | ber | QANOV-406573 |
          | smoke      | multivivo    |     | QANOV-406574 |
          | regression | convergente  |     | QANOV-406575 |

  @jira.QANOV-269731 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-260586 @manual @mobile @moves
  @regression
  Scenario: A user with more than one deactivated mobile line tries to open the "Account.Mobile Lines Activation" deeplink: disambiguation screen is displayed
    Given user has ">1" mobile lines in "deactivated" status
     When opens the "Account.Mobile Lines Activation" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the header that contains the "Líneas móviles" text is displayed
      And the "title" textfield with "Estas son las líneas que tienes pendientes de activar" text is displayed
      And each element in the "lines" list has the "mobile_line_title" field with "Línea móvil" text
      And each element in the "lines" list has the "description" field

  @jira.QANOV-269732 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-260586 @manual @mobile @moves
  @regression @tbd
  Scenario: A user with more than one deactivated mobile line opens the "Account.Mobile Lines Activation" deeplink and selects a line: OB webview is displayed
    Given user has ">1" mobile lines in "deactivated" status
     When opens the "Account.Mobile Lines Activation" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
      And clicks on the "0" element in the "lines" list
     Then the internal webview is displayed
      And the header that contains the "TBD" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user with several products tries to open the "<deeplink>" deeplink: disambiguation screen is displayed
    Given user has "several" products
      And user has not a "my_handy" product
     When opens the "<deeplink>" deeplink with the app in "killed" status
     Then the "Product Disambiguation" page is displayed
      And the "products_list" list is displayed
      And the products of "products_list" list will match the user telco products

    Examples:
          | product | cv   | deeplink                         | jira_id      |
          | blaude  | 14.0 | Account.Data Bundle Purchase     | QANOV-291318 |
          | o2de    | 14.6 | Account.Data Bundle Purchase     | QANOV-291319 |
          | blaude  | 14.4 | Account.Specific Bundle Purchase | QANOV-360222 |
          | o2de    | 14.6 | Account.Specific Bundle Purchase | QANOV-360223 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user who is in disambiguation screen from the "Account.Data Bundle Purchase" deeplink selects a product: Data Bundle Purchase screen is displayed
    Given user has "several" products
      And user has not a "my_handy" product
     When opens the "Account.Data Bundle Purchase" deeplink with the app in "killed" status
      And the "Product Disambiguation" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed
      And clicks on the native "back" button
     Then the "Product Disambiguation" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-291318 | QANOV-291320 |
          | o2de    | 14.6 | QANOV-291319 | QANOV-291321 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user who is in disambiguation screen from the "Account.Specific Bundle Purchase" deeplink selects a product: Bundle Purchase screen for the specified bundle is displayed
    Given user has "several" products
      And user has not a "my_handy" product
     When opens the "Account.Specific Bundle Purchase" deeplink with the app in "killed" status
      And the "Product Disambiguation" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Bundle Purchase Details" page is displayed
      And the "Options-Details" header is displayed
      And the details of the desired bundle are displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.4 | QANOV-360222 | QANOV-360224 |
          | o2de    | 14.6 | QANOV-360223 | QANOV-360225 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user with several SIMs for each product can access to the "Account.Pin And Puk" deeplink
    Given user has a "mobile_line" product
      And user has "several" SIMs
      And user has a SIM in any of "ordered;activating;active;suspended" status
     When opens the "Account.Pin And Puk" deeplink with the app in "killed" status
      And the "Product Disambiguation" page is displayed
      And clicks on the "chevron" field of "products_list" list with "0" index
      And the "Sim Disambiguation" page is displayed
      And clicks on the "chevron" field of "sims_list" list with "0" index
     Then the "View PIN And PUK" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.0 | QANOV-402090 |
          | o2de    | 14.6 | QANOV-402091 |

  @jira.QANOV-574927 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de
  @regression
  Scenario: A postpay user with several mobile lines and with several SIMs for each mobile line can access to the "Account.Swap Sim And Esim" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
      And user has "several" SIMs for a mobile line
      And user has a SIM in any of "active;suspended" status
     When opens the "Account.Swap Sim And Esim" deeplink with the app in "killed" status
      And the "Product Disambiguation" page is displayed
      And clicks on the "chevron" field of "products_list" list with "0" index
      And the "Sim Disambiguation" page is displayed
      And clicks on the "chevron" field of "sims_list" list with "0" index
     Then the "Swap SIM Choose Type" page is displayed

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who is in the disambiguation screen from the "OB.Change Tariff Postpay" deeplink selects a product: the TBD webview is displayed
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
     When opens the "OB.Change Tariff Postpay" deeplink with the app in "killed" status
      And the "Product Disambiguation" page is displayed
      And clicks on the "chevron" field of "products_list" list with "0" index
     Then the internal webview with "TBD" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.0 | QANOV-402092 |
          | o2de    | 14.6 | QANOV-402093 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: A <product> user who is in disambiguation screen from the "Account.Data Bundle Purchase" deeplink after having selected a product/line, can pick a different one
    Given user has "several" products
      And user has not a "my_handy" product
     When opens the "Account.Data Bundle Purchase" deeplink with the app in "killed" status
      And the "Product Disambiguation" page is displayed
      And clicks on the "chevron" field of "products_list" list with "0" index
      And the "Category Bundles" page is displayed
      And clicks on the native "back" button
      And the "Product Disambiguation" page is displayed
     When clicks on the "chevron" field of "products_list" list with "1" index
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

    Examples:
          | product | cv   | depends_on   | detects       | jira_id      |
          | blaude  | 14.0 | QANOV-291320 | ANDROID-11571 | QANOV-291322 |
          | o2de    | 14.6 | QANOV-291321 |               | QANOV-291323 |

  @jira.QANOV-295326 @android @ios @jira.cv.13.10 @jira.link.detects.VIVO-3392 @manual @mobile @sanity @vivobr
  Scenario: A multiplan user can open the "Others.Gestao de fila" deeplink: disambiguation screen is displayed
    Given user has "several" mobile lines
     When opens the "Others.Gestao de fila" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "lines" list is displayed
      And each element in the "lines" list has the "icon" field
      And each element in the "lines" list has the "product_customer_type" field
      And each element in the "lines" list has the "phone_number" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines

  @jira.QANOV-406576 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity @vivobr
  Scenario: A multiplan user can open the "Others.Gestao de fila" deeplink: disambiguation screen is displayed
    Given user has "several" mobile lines
     When opens the "Others.Gestao de fila" deeplink with the app in "killed" status
     Then the "Line Disambiguation" page is displayed
      And the "disambiguation_header" textfield is displayed
      And the "title" textfield is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "plan_name" field
      And each element in the "plans" list has the "product_customer_type" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-295327 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity @vivobr
  Scenario: A multiplan user can access to the vivo app from the disambiguation screen
    Given user has "several" mobile lines
      And user opens the "Others.Gestao de fila" deeplink with the app in "killed" status
      And the "Line Disambiguation" page is displayed
     When clicks on any element in the "lines.list" list
     Then the internal webview is displayed
      And the "Fila de Atendimento de Lojas" header is displayed

  @jira.QANOV-295328 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @smoke @vivobr
  Scenario: A monoplan user can access to the vivo app from the Gestao de fila deeplink
    Given user has "1" mobile lines
      And user opens the "Others.Gestao de fila" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Fila de Atendimento de Lojas" header is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "OB.EVN Download" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And user has invoices
     When opens the "OB.EVN Download" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the internal webview is displayed
      And the "Mein <page>" header is displayed

    Examples:
          | product | page | jira_id      |
          | blaude  | Blau | QANOV-558621 |
          | o2de    | o2   | QANOV-558622 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Account.EVN Settings" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And user has invoices
     When opens the "Account.EVN Settings" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "EVN Settings" page is displayed

    Examples:
          | product | page | jira_id      |
          | blaude  | Blau | QANOV-558623 |
          | o2de    | o2   | QANOV-558624 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Account.Data Automatic" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
      And user has a "data_automatic" bundle in "active" status in one of the lines
     When opens the "Account.Data Automatic" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on the element in the "products_list" list that has the data automatic bundle in active status
     Then the "Data Automatic Detail" page is displayed

    Examples:
          | product | page | jira_id      |
          | blaude  | Blau | QANOV-558625 |
          | o2de    | o2   | QANOV-558626 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user an eSIM in pending installation can open the "Account.Install eSIM" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
      And user has a SIM in "ready_installation" status in one of the lines
     When opens the "Account.Install eSIM" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on the element in the "products_list" list that has eSIM ready to be installed
     Then user is in the "Install Esim Info" page

    Examples:
          | product | page | jira_id      |
          | blaude  | Blau | QANOV-558628 |
          | o2de    | o2   | QANOV-558629 |

  @jira.QANOV-558630 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim multiproduct user can open the "Account.Add SIM/eSIM" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has "several" mobile lines
      And user has a SIM in any of "active;in_preparation;activating" status
     When opens the "Account.Add SIM/eSIM" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Sim Addition Choose Services" page is displayed

  @jira.QANOV-558631 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim multiproduct UDP user can open the "Account.Delete SIM" deeplink
    Given user has a UDP tariff
      And user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has "several" mobile lines
      And user has "several" SIMs in "active" status for the same mobile line
     When opens the "Account.Delete SIM" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then clicks on any of the active SIMs
      And the "Delete SIM" page is displayed

  @jira.QANOV-558632 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim multiproduct user can open the "Account.SIM Change Name" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has "several" mobile lines
      And user has a SIM in any of "active;in_preparation;activating" status
     When opens the "Account.SIM Change Name" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Sim Name Change" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Settings.Change Main Number" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
     When opens the "Settings.Change Main Number" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Change Number Info" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558633 |
          | o2de    | QANOV-558634 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct user can open the "Settings.EECC Postbox" deeplink
    Given user has a "any" account type
      And user has "several" mobile lines
     When opens the "Settings.EECC Postbox" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Legal Documents" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558635 |
          | o2de    | QANOV-558636 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Settings.Bill to SMS Management" deeplink
    Given user has a "postpay" account type
      And user has "several" mobile lines
      And user has any "mobile_line" product in "active" status
      And user has bills
     When opens the "Settings.Bill to SMS Management" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Billing Sms Notifications" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558638 |
          | o2de    | QANOV-558639 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Settings.<deeplink>" deeplink
    Given user has a "postpay" account type
      And user has "several" mobile lines
      And user has any "mobile_line" product in "active" status
      And user has bills
      And user has "digital_bill" service in "<digital_bill>" status
     When opens the "Settings.<deeplink>" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed
      And the "title" textfield with "<title>" text is displayed

    Examples:
          | product | deeplink                  | digital_bill | title                      | jira_id      |
          | blaude  | Digital Bill              | deactivated  | Online-Rechnung aktivieren | QANOV-558640 |
          | blaude  | Digital Bill Change Email | activated    | E-Mail für Online-Rechnung | QANOV-558642 |
          | blaude  | Digital Bill              | activated    | E-Mail für Online-Rechnung | QANOV-558643 |
          | blaude  | Digital Bill Change Email | deactivated  | Online-Rechnung aktivieren | QANOV-558644 |
          | o2de    | Digital Bill              | deactivated  | Online-Rechnung aktivieren | QANOV-558645 |
          | o2de    | Digital Bill Change Email | activated    | E-Mail für Online-Rechnung | QANOV-558646 |
          | o2de    | Digital Bill              | activated    | E-Mail für Online-Rechnung | QANOV-558647 |
          | o2de    | Digital Bill Change Email | deactivated  | Online-Rechnung aktivieren | QANOV-558648 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Settings.Inbox" deeplink
    Given user has a "postpay" account type
      And user has "several" mobile lines
      And user has any "mobile_line" product in "active" status
      And user has bills
     When opens the "Settings.Inbox" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Billing Address" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558649 |
          | o2de    | QANOV-558650 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Settings.Change Line Number" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
     When opens the "Settings.Change Line Number" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Change Number Info" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558651 |
          | o2de    | QANOV-558652 |

  @jira.QANOV-558653 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user can open the "Settings.Young Age Verification" deeplink
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has "several" products
     When opens the "Settings.Young Age Verification" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Young Age Verification Selection" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A multiproduct postpay user can open the "Settings.Postpay Product Alias" deeplink
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has "several" products
     When opens the "Settings.Postpay Product Alias" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Contract Alias Edit" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558654 |
          | o2de    | QANOV-558655 |

  @jira.QANOV-558656 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user can open the "Settings.Self Employed Verification" deeplink
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has "several" products
     When opens the "Settings.Self Employed Verification" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Self Employed Verification Info" page is displayed

  @jira.QANOV-558657 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user can open the "Settings.Decommission Contract" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "several" products
     When opens the "Settings.Decommission Contract" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Decomission Contract Reason" page is displayed

  @jira.QANOV-558658 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A multiproduct user can open the "Support.Hotline" deeplink
    Given user has a "box7" account type
      And user has "several" products
     When opens the "Support.Hotline" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Click To Call Choose Topic" page is displayed

  @jira.QANOV-558660 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any multiproduct user can open the "Support.Hotline" deeplink
    Given user has a "any" account type
      And user has "several" products
     When opens the "Support.Hotline" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Click To Call Choose Language" page is displayed

  @jira.QANOV-558661 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any multiproduct user can open the "Support.Hotline Turkish" deeplink
    Given user has a "any" account type
      And user has "several" products
     When opens the "Support.Hotline Turkish" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Click To Call Choose Language" page is displayed

  @jira.QANOV-558662 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any multiproduct user can open the "Support.Hotline English" deeplink
    Given user has a "any" account type
      And user has "several" products
     When opens the "Support.Hotline English" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Call Hotline" page is displayed

  @jira.QANOV-558663 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any multiproduct user can open the "OB.Hotline Sign Language" deeplink
    Given user has a "any" account type
      And user has "several" products
     When opens the "OB.Hotline Sign Language" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the internal webview is displayed
      And the "Gehörlos telefonieren dank Tess | o2" header is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: Any multiproduct user can open the "Support.<deeplink>" deeplink
    Given user has a "any" account type
      And user has all products in "active" status
      And user has "several" products
     When opens the "Support.<deeplink>" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Spatial Buzz" page is displayed
      And the "header" textfield with "<page_name>" text is displayed

    Examples:
          | product | deeplink             | page_name   | jira_id      |
          | blaude  | Speed-Check          | Speed-Check | QANOV-558664 |
          | blaude  | Network Coverage Map | Netzkarte   | QANOV-558665 |
          | o2de    | Speed-Check          | Speed-Check | QANOV-558666 |
          | o2de    | Network Coverage Map | Netzkarte   | QANOV-558667 |

# -*- coding: utf-8 -*-
@jira.QANOV-8597
Feature: Settings Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094
  @jira.link.relates_to.<relates_to> @mobile @vivobr
  Scenario Outline: A <account_type> user can open the "<deeplink_name>" deeplink
    Given user has a "<account_type>" account type
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the internal webview with "<header>" header is displayed
      And waits until the "<string>" string in internal webview is displayed

    @automatic @live @next @sanity
    Examples:
          | account_type    | deeplink_name                 | header               | string                              | cv    | relates_to | ber | jira_id     |
          | beatrix postpay | Tabmais.Termos e condições    | Termos e condições   | TERMOS DE USO E POLÍTICA            | 11.1  | NOV-120402 | ber | QANOV-8708  |
          | beatrix control | Settings.Informações pessoais | Informações pessoais | Editar Informações Pessoais         | 11.1  | NOV-120407 | ber | QANOV-8693  |
          | beatrix control | Settings.Endereço da Conta    | Endereço da conta    | Editar Endereço da Conta            | 11.1  | NOV-120406 |     | QANOV-8698  |
          | beatrix control | Settings.Meus pedidos         | Meus pedidos         | Meus Pedidos                        | 11.1  | NOV-120405 |     | QANOV-8701  |
          | beatrix control | Settings.Alterar senha        | Confirmar Identidade | Precisamos confirmar sua identidade | 12.1  |            |     | QANOV-98845 |
          | beatrix control | Tabmais.Termos e condições    | Termos e condições   | TERMOS DE USO E POLÍTICA            | 11.1  | NOV-120402 |     | QANOV-8707  |
          | legacy prepay   | Tabmais.Termos e condições    | Termos e condições   | TERMOS DE USO E POLÍTICA            | 11.1  | NOV-120402 | ber | QANOV-8704  |
          | convergente     | Settings.Informações pessoais | Informações pessoais | Editar Informações Pessoais         | 11.12 | NOV-120407 |     | QANOV-98842 |
          | convergente     | Settings.Meus pedidos         | Meus pedidos         | Meus Pedidos                        | 11.12 | NOV-120405 | ber | QANOV-98844 |
          | multivivo       | Settings.Informações pessoais | Informações pessoais | Editar Informações Pessoais         | 11.12 | NOV-120407 |     | QANOV-8697  |

    @automatic @impeded_env @regression
    Examples:
          | account_type   | deeplink_name              | header             | string                    | cv   | relates_to | ber | jira_id    |
          | legacy postpay | Tabmais.Termos e condições | Termos e condições | TERMOS E CONDIÇÕES DE USO | 11.1 | NOV-120402 |     | QANOV-8705 |

    @automatic @live @next @regression
    Examples:
          | account_type | deeplink_name              | header               | string                              | cv    | relates_to | ber | jira_id     |
          | multivivo    | Settings.Endereço da Conta | Endereço da conta    | Editar Endereço da Conta            | 11.12 | NOV-120406 |     | QANOV-8700  |
          | multivivo    | Settings.Meus pedidos      | Meus pedidos         | Meus Pedidos                        | 11.12 | NOV-120405 |     | QANOV-8703  |
          | multivivo    | Settings.Alterar senha     | Confirmar Identidade | Precisamos confirmar sua identidade | 12.1  |            |     | QANOV-98847 |
          | multivivo    | Tabmais.Termos e condições | Termos e condições   | TERMOS DE USO E POLÍTICA            | 11.12 | NOV-120402 |     | QANOV-8709  |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | deeplink_name                 | header               | string                              | cv    | relates_to | ber | jira_id     |
          | beatrix postpay | Settings.Informações pessoais | Informações pessoais | Editar Informações Pessoais         | 11.1  | NOV-120407 |     | QANOV-8695  |
          | beatrix postpay | Settings.Endereço da Conta    | Endereço da Conta    | Editar Endereço da Conta            | 11.1  | NOV-120406 |     | QANOV-8699  |
          | convergente     | Settings.Endereço da Conta    | Endereço da Conta    | Editar Endereço da Conta            | 11.12 | NOV-120406 |     | QANOV-98843 |
          | beatrix postpay | Settings.Meus pedidos         | Meus pedidos         | Meus Pedidos                        | 11.1  | NOV-120405 |     | QANOV-8702  |
          | beatrix postpay | Account.Alterar senha         | Confirmar Identidade | Precisamos confirmar sua identidade | 12.1  |            |     | QANOV-98846 |
          | convergente     | Account.Alterar senha         | Confirmar Identidade | Precisamos confirmar sua identidade | 12.1  |            |     | QANOV-98848 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | deeplink_name              | header             | string                    | cv   | relates_to | ber | jira_id    |
          | legacy control | Tabmais.Termos e condições | Termos e condições | TERMOS E CONDIÇÕES DE USO | 11.1 | NOV-120402 |     | QANOV-8706 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.NOV-120401
  @live @mobile @next @regression @vivobr
  Scenario Outline: A <account_type> user can open the "Controle de Acessos" deeplink
    Given user has a "<account_type>" account type
     When opens the "Settings.Controle de acessos" deeplink with the app in "killed" status
     Then the "Session Management" page is displayed

    @automatic @live @next
    Examples:
          | account_type    | cv    | jira_id    |
          | legacy prepay   | 11.1  | QANOV-8713 |
          | beatrix control | 11.1  | QANOV-8719 |
          | multivivo       | 11.12 | QANOV-8723 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | cv   | jira_id    |
          | beatrix postpay | 11.1 | QANOV-8721 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | cv   | jira_id    |
          | legacy control | 11.1 | QANOV-8717 |
          | legacy postpay | 11.1 | QANOV-8715 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.VIVO-3251 @jira.link.parent_test_plan.QANOV-402094
  @jira.link.relates_to.<relates_to> @mobile @smoke @vivobr @har
  Scenario Outline: A <account_type> user can open the "<deeplink_name>" deeplink
    Given user has a "<account_type>" account type
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    @automatic @live @next
    Examples:
          | account_type    | deeplink_name                    | page_name            | cv    | relates_to | jira_id    |
          | any             | Settings.PIN Biometric           | Pin Biometric        | 11.1  | NOV-112316 | QANOV-8725 |
          | legacy prepay   | Settings.Segurança e Privacidade | Security And Privacy | 11.1  | NOV-120399 | QANOV-8726 |
          | beatrix control | Settings.Segurança e Privacidade | Security And Privacy | 11.1  | NOV-120399 | QANOV-8732 |
          | multivivo       | Settings.Segurança e Privacidade | Security And Privacy | 11.12 | NOV-120399 | QANOV-8736 |

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | account_type    | deeplink_name                    | page_name            | cv   | relates_to | jira_id    |
          | beatrix postpay | Settings.Segurança e Privacidade | Security And Privacy | 11.1 | NOV-120399 | QANOV-8734 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type   | deeplink_name                    | page_name            | cv   | relates_to | jira_id    |
          | legacy control | Settings.Segurança e Privacidade | Security And Privacy | 11.1 | NOV-120399 | QANOV-8730 |
          | legacy postpay | Settings.Segurança e Privacidade | Security And Privacy | 11.1 | NOV-120399 | QANOV-8728 |

  @jira.QANOV-8738 @android @har @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65207 @manual @mobile @moves @regression
  Scenario: A moves user has to insert PIN/Biometric when opening the app from deeplink after some time with the app in background
    Given user has a "any" account type
      And user has "PIN" feature "enabled" in the application
      And runs the app in the background for "301" seconds
     When opens the "Native.Explore" deeplink with the app in "killed" status and pin code is not filled
     Then the "App Pin Code" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.NOV-65207
  @manual @mobile @regression @vivobr @har
  Scenario Outline: A <account_type> user has to insert PIN/Biometric when opening the app from deeplink after some time with the app in background
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has "PIN" feature "enabled" in the application
      And runs the app in the background for "301" seconds
     When opens the "<deeplink_name>" deeplink with the app in "foreground" status
     Then the "App Pin Code" page is displayed

    Examples:
          | account_type  | deeplink_name | cv    | number_plans | jira_id    |
          | legacy prepay | Account.Saldo | 10.5  | 1            | QANOV-8740 |
          | beatrix       | Account.Conta | 10.5  | any          | QANOV-8741 |
          | multivivo     | Account.Conta | 11.12 | any          | QANOV-8744 |

  @jira.QANOV-8745 @android @automatic @cert0 @cert1 @har @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65207 @mobile @next
  @o2uk @regression
  Scenario: A o2uk user has to insert PIN/Biometric when opening the app from deeplink after some time with the app in background
    Given set unlock time to "10" seconds
     When runs the app in the background for "15" seconds
      And opens the "Native.Account" deeplink with the app in "foreground" status and pin code is not filled
     Then the "App Pin Code" page is displayed
      And inserts the current pin
      And the "Account" page is displayed
      And set unlock time to "300" seconds

  @jira.<jira_id> @<product> @android @e2e @har @ios @jira.cv.10.5 @manual @mobile @regression
  Scenario Outline: A <product> user has to insert PIN/Biometric when opening the app from deeplink after some time with the app in background
    Given user has a "any" account type
     When runs the app in the background for "301" seconds
      And opens the "Native.Account" deeplink with the app in "foreground" status and pin code is not filled
     Then the "App Pin Code" page is displayed
      And inserts the current pin
      And the "Account" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-578628 |
          | o2de    | QANOV-578629 |

  @jira.QANOV-8747 @android @automatic @cert2 @har @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65207 @live @mobile @moves
  @next @sanity
  Scenario: A moves user has to insert PIN/Biometric when opening the app from deeplink after the app got killed
    Given user has a "any" account type
      And user has "PIN" feature "enabled" in the application
      And user terminates the app
     When opens the "Native.Account" deeplink with the app in "killed" status and pin code is not filled
     Then the "App Pin Code" page is displayed
      And user has "PIN" feature "disabled" in the application

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.NOV-65207
  @manual @mobile @regression @vivobr @har
  Scenario Outline: A <account_type> user has to insert PIN/Biometric when opening the app from deeplink after the app got killed
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user has "PIN" feature "enabled" in the application
      And user terminates the app
     When opens the "<deeplink_name>" deeplink with the app in "killed" status and pin code is not filled
     Then the "App Pin Code" page is displayed

    Examples:
          | account_type  | deeplink_name | cv    | number_plans | jira_id    |
          | legacy prepay | Account.Saldo | 10.5  | 1            | QANOV-8749 |
          | beatrix       | Account.Conta | 10.5  | any          | QANOV-8750 |
          | multivivo     | Account.Conta | 11.12 | any          | QANOV-8752 |

  @jira.QANOV-8754 @android @automatic @cert0 @cert1 @har @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65207 @mobile @next
  @o2uk @sanity
  Scenario: A o2uk user has to insert PIN/Biometric when opening the app from deeplink after the app got killed
     When user terminates the app
      And opens the "Native.Account" deeplink with the app in "killed" status and pin code is not filled
     Then the "App Pin Code" page is displayed

  @jira.<jira_id> @<product> @android @e2e @har @ios @jira.cv.10.5 @manual @mobile @regression
  Scenario Outline: A <product> user has to insert PIN/Biometric when opening the app from deeplink after the app got killed
    Given user has a "any" account type
     When user terminates the app
      And opens the "Native.Account" deeplink with the app in "killed" status and pin code is not filled
     Then the "App Pin Code" page is displayed
      And inserts the current pin
      And the "Account" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-578630 |
          | o2de    | QANOV-578631 |

  @jira.QANOV-8756 @android @automatic @cert2 @har @ios @jira.cv.10.5 @jira.link.relates_to.NOV-65209 @live @mobile @moves
  @next @regression
  Scenario: A moves user is redirected to the correct screen after open the app with a deeplink and insert PIN/Biometric
    Given user has a "any" account type
      And user has "PIN" feature "enabled" in the application
      And user terminates the app
     When opens the "Native.Account" deeplink with the app in "killed" status and pin code is not filled
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "Dashboard" page is displayed
      And user has "PIN" feature "disabled" in the application

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-402094 @jira.link.relates_to.NOV-65209
  @manual @mobile @regression @vivobr @har
  Scenario Outline: A <account_type> user is redirected to the correct screen after open the app with a deeplink and insert PIN/Biometric
    Given user has a "<account_type>" account type
      And user has "<number_plans>" plans
      And user terminates the app
      And user has "PIN" feature "enabled" in the application
     When opens the "<deeplink_name>" deeplink with the app in "killed" status and pin code is not filled
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "<page_name>" page is displayed

    Examples:
          | account_type  | deeplink_name | page_name | cv    | number_plans | jira_id    |
          | legacy prepay | Account.Saldo | BalanceV1 | 10.5  | 1            | QANOV-8757 |
          | beatrix       | Account.Conta | Bills     | 10.5  | any          | QANOV-8759 |
          | multivivo     | Account.Conta | Bills     | 11.12 | any          | QANOV-8760 |
  @jira.<jira_id> @<product> @android @ios @jira.cv.10.5 @mobile @regression @har @e2e
  Scenario Outline: A <product> user is redirected to the correct screen after opening the app with a deeplink and inserting PIN/Biometric
    Given user terminates the app
     When opens the "Native.Account" deeplink with the app in "killed" status and pin code is not filled
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "Account" page is displayed

    @automatic @cert0 @cert1 @next
    Examples:
          | product | jira_id    |
          | o2uk    | QANOV-8762 |

    @manual
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600349 |
          | o2de    | QANOV-600350 |

  @jira.QANOV-66626 @android @automatic @cert2 @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-28881 @live @mobile
  @moves @next @regression
  Scenario: A user logged in with NIF can access to the "QR" page from the "Qr" Deeplink
    other_affected_versions="2021-10"
    Given user has registered with "NIF"
     When opens the "Settings.Qr" deeplink with the app in "killed" status
     Then the "Shop Identifier" internal webview is displayed
      And the "Identificación en tienda" header is displayed
      And the "name" textfield is displayed
      And the "dni" textfield is displayed
      And the "validity_date" textfield with "VÁLIDO HASTA:" text is displayed
      And the "date" textfield with the "^[0-9]{1,2} [a-z]{3} a las [0-9]{1,2}:[0-9]{2}" format is displayed
      And the "qr_code" image is displayed

  @jira.<jira_id> @<product> @android @automatic @ber @har @ios @jira.cv.<cv> @jira.link.detects.<detects> @mobile @sanity
  Scenario Outline: A user can open the "Settings.Personal Data" deeplink
    Given user has a "any" account type
     When opens the "Settings.Personal Data" deeplink with the app in "killed" status
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @cert3 @live @next
    Examples:
          | product | cv   | detects                         | jira_id      |
          | blaude  | 13.9 | OBO2DE-169:OBO2DE-440:O2DE-3254 | QANOV-273806 |

    @jira.link.parent_test_plan.QANOV-437471 @live @next
    Examples:
          | product | cv   | detects | jira_id      |
          | o2de    | 14.6 |         | QANOV-273807 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual
  @mobile @smoke
  Scenario Outline: A postpay user can open the "Settings.Order Tracking" deeplink
    Given user has a "postpay" account type
     When opens the "Settings.Order Tracking" deeplink with the app in "killed" status
     Then the "Your Orders" page is displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 14.0 |                  | QANOV-269676 |
          | o2de    | 14.6 | QANOV-437471     | QANOV-269703 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A user <with_without> a contract cancellation requested can open the "Settings.Cancel Contract" deeplink
    Given user has any "mobile_line;internet_at_home" product
      And user <pre-requisite>
     When opens the "Settings.Cancel Contract" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | product | cv   | with_without | pre-requisite                                         | page_name              | parent_test_plan | jira_id      |
          | blaude  | 14.0 | with         | has a contract cancellation requested in "any" status | Cancel Contract Detail |                  | QANOV-269693 |
          | blaude  | 14.0 | without      | has not a contract cancellation requested             | Cancel Contract Method |                  | QANOV-269694 |
          | o2de    | 14.6 | with         | has a contract cancellation requested in "any" status | Cancel Contract Detail | QANOV-437471     | QANOV-269720 |
          | o2de    | 14.6 | without      | has not a contract cancellation requested             | Cancel Contract Method | QANOV-437471     | QANOV-269721 |

  @jira.<jira_id> @<har> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A BOX7 user can open the "Settings.Bank Account Management" deeplink
    Given user has a "box7" account type
      And user has the "bank_account" service in "<bank_account_status>" status
     When opens the "Settings.Bank Account Management" deeplink with the app in "killed" status
     Then the "<destination_screen>" page is displayed
      And the "title" textfield with "<title>" text is displayed

    Examples:
          | product | bank_account_status | destination_screen         | title                     | har | jira_id      |
          | blaude  | deactivated         | Bank Account Configuration | Bankverbindung einrichten |     | QANOV-532963 |
          | o2de    | deactivated         | Bank Account Configuration | Bankverbindung einrichten |     | QANOV-532964 |
          | blaude  | activated           | Bank Account Details       | Bankverbindung bearbeiten | har | QANOV-532965 |
          | o2de    | activated           | Bank Account Details       | Bankverbindung bearbeiten | har | QANOV-532966 |

  @jira.QANOV-532967 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression @har
  Scenario: A RAITT user can open the "Settings.Bank Account Management" deeplink
    Given user has a "raitt" account type
     When opens the "Settings.Bank Account Management" deeplink with the app in "killed" status
     Then the browser webview with "Zahlungsdaten" text in the header is displayed
      And the "Zahlungsdaten" string is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.Billing Address Change" deeplink
    Given user has a "postpay" account type
     When opens the "Settings.Billing Address Change" deeplink with the app in "killed" status
     Then the "Billing Address" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-532968 |
          | o2de    | QANOV-532969 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A BOX7 user can open the "Settings.Third Party Services Configuration" deeplink
    If the user has several mobile lines, then a distributive screen will be displayed before the Manage Phone Payments screen.
    Given user has a "box7" account type
      And user has "1" mobile lines
     When opens the "Settings.Third Party Services Configuration" deeplink with the app in "killed" status
     Then the "Manage Phone Payments" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-532970 |
          | o2de    | QANOV-532971 |

  @jira.QANOV-532972 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A RAITT user can open the "Settings.Third Party Services Configuration" deeplink
    Given user has a "raitt" account type
      And user has a "mobile_line" product
     When opens the "Settings.Third Party Services Configuration" deeplink with the app in "killed" status
     Then the browser webview with "b2c-sim-settings-app" text in the header is displayed
      And the "SIM-Karte & Einstellungen" string is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.Personal Name Change" deeplink
    Given user has a "postpay" account type
      And user has any "<user_products>" product in "active" status
     When opens the "Settings.Personal Name Change" deeplink with the app in "killed" status
     Then the "Change Name" page is displayed

    Examples:
          | product | user_products                | jira_id      |
          | blaude  | mobile_line                  | QANOV-532973 |
          | o2de    | mobile_line;internet_at_home | QANOV-532974 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A user can open the "Settings.Contract Address Change" deeplink
    If the user has several mobile lines, then a distributive screen will be displayed before the Manage Phone Payments screen.
    Given user has a "any" product in "active" status
      And user has not the "ACCOUNT_UPDATE_DATA" forbidden use case
     When opens the "Settings.Contract Address Change" deeplink with the app in "killed" status
     Then the "Shipping Address" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-532975 |
          | o2de    | QANOV-532976 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user with a MyHandy product can open the "Account.My Handy Order Details and Tracking" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
     When opens the "Account.My Handy Order Details and Tracking" deeplink with the app in "killed" status
     Then the "Order Details" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558850 |
          | o2de    | QANOV-558851 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: Any user can open the "Settings.Biometrical Authentication" deeplink
    Given user has a "any" account type
     When opens the "Settings.EBiometrical Authentication" deeplink with the app in "killed" status
     Then the "Pin Biometric" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558852 |
          | o2de    | QANOV-558853 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.Change Main Number" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
     When opens the "Settings.Change Main Number" deeplink with the app in "killed" status
     Then the "Change Number Info" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558854 |
          | o2de    | QANOV-558855 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: Any user can open the "Settings.EECC Postbox" deeplink
    Given user has a "any" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
     When opens the "Settings.EECC Postbox" deeplink with the app in "killed" status
     Then the "Legal Documents" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558856 |
          | o2de    | QANOV-558857 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.Bill to SMS Management" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user has bills
     When opens the "Settings.Bill to SMS Management" deeplink with the app in "killed" status
     Then the "Billing Sms Notifications" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558858 |
          | o2de    | QANOV-558859 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.<deeplink>" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user has bills
      And user has "digital_bill" service in "<digital_bill>" status
     When opens the "Settings.<deeplink>" deeplink with the app in "killed" status
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed
      And the "title" textfield with "<title>" text is displayed

    Examples:
          | product | deeplink                  | digital_bill | title                      | jira_id      |
          | blaude  | Digital Bill              | deactivated  | Online-Rechnung aktivieren | QANOV-558860 |
          | blaude  | Digital Bill Change Email | activated    | E-Mail für Online-Rechnung | QANOV-558861 |
          | blaude  | Digital Bill              | activated    | E-Mail für Online-Rechnung | QANOV-558862 |
          | blaude  | Digital Bill Change Email | deactivated  | Online-Rechnung aktivieren | QANOV-558863 |
          | o2de    | Digital Bill              | deactivated  | Online-Rechnung aktivieren | QANOV-558865 |
          | o2de    | Digital Bill Change Email | activated    | E-Mail für Online-Rechnung | QANOV-558867 |
          | o2de    | Digital Bill              | activated    | E-Mail für Online-Rechnung | QANOV-558868 |
          | o2de    | Digital Bill Change Email | deactivated  | Online-Rechnung aktivieren | QANOV-558869 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.Inbox" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user has bills
     When opens the "Settings.Inbox" deeplink with the app in "killed" status
     Then the "Billing Address" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558870 |
          | o2de    | QANOV-558871 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A BOX7 user can open the "Settings.Change Contact Email" deeplink
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user has a "<email>" stored in the contact details
     When opens the "Settings.Change Contact Email" deeplink with the app in "killed" status
     Then the "<page>" page is displayed

    Examples:
          | email        | page                        | jira_id      |
          | no email     | Email Contact               | QANOV-558872 |
          | verified     | Email Contact               | QANOV-558873 |
          | not verified | Email Contact Info Feedback | QANOV-558874 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario Outline: Any user can open the "Settings.Change Contact Email" deeplink
    Given user has a "any" account type
      And user has a "any" product in "active" status
      And user has a "<email>" stored in the contact details
     When opens the "Settings.Change Contact Email" deeplink with the app in "killed" status
     Then the "<page>" page is displayed

    Examples:
          | email        | page                        | jira_id      |
          | no email     | Email Contact               | QANOV-558875 |
          | verified     | Email Contact               | QANOV-558876 |
          | not verified | Email Contact Info Feedback | QANOV-558877 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: Any user without a contact phone number stored can open the "Settings.Change Contact Phone Number" deeplink
    Given user has a "any" account type
      And user has a "any" product in "active" status
      And user has not a "phone number" stored in the contact details
     When opens the "Settings.Change Contact Phone Number" deeplink with the app in "killed" status
     Then the "Phone Number Contact" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558879 |
          | o2de    | QANOV-558880 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A postpay user can open the "Settings.Change Line Number" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
     When opens the "Settings.Change Line Number" deeplink with the app in "killed" status
     Then the "Change Number Info" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558881 |
          | o2de    | QANOV-558882 |

  @jira.QANOV-558883 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Settings.Young Age Verification" deeplink
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has "1" products
     When opens the "Settings.Young Age Verification" deeplink with the app in "killed" status
     Then the "Young Age Verification Selection" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: A monoproduct postpay user can open the "Settings.Postpay Product Alias" deeplink
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has "1" products
     When opens the "Settings.Postpay Product Alias" deeplink with the app in "killed" status
     Then the "Contract Alias Edit" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558884 |
          | o2de    | QANOV-558885 |

  @jira.QANOV-558886 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Settings.Self Employed Verification" deeplink
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has "1" products
     When opens the "Settings.Self Employed Verification" deeplink with the app in "killed" status
     Then the "Self Employed Verification Info" page is displayed

  @jira.QANOV-558887 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Settings.Decommission Contract" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "1" products
     When opens the "Settings.Decommission Contract" deeplink with the app in "killed" status
     Then the "Decomission Contract Reason" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: Any user can open the "Settings.Privacy Area" deeplink
    Given user has a "any" account type
     When opens the "Settings.Privacy Area" deeplink with the app in "killed" status
     Then the "Security And Privacy" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558888 |
          | o2de    | QANOV-558889 |

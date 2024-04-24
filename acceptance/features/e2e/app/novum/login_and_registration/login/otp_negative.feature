# -*- coding: utf-8 -*-
@jira.QANOV-126294
Feature: OTP Negative

  Actions Before each Scenario:
    Given user is logged out


  @jira.QANOV-2979 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-38906 @jira.link.relates_to.NOV-111958 @manual
  @mobile @moves @regression
  Scenario: A Prospect customer cannot log in the app
    internal_checkpoint="a Prospect customer is a customer that is in process to be registered in Movistar"
    Given user has a "prospect" account type
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "app_not_available" popup is displayed
      And the "message" textfield with "the app is not available yet, and that user will have to try again later" text is displayed

  @jira.QANOV-2989 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-2979
  @jira.link.relates_to.NOV-111963 @manual @mobile @moves @regression
  Scenario: A Prospect customer can close the error popup after trying to log in the app
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "prospect_number" text
      And clicks on the "continue_button" button
      And the "app_not_available" popup is displayed
      And clicks on the "accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-2981 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-38906 @jira.link.detects.APPS-7631
  @jira.link.relates_to.NOV-111957 @manual @mobile @moves @regression
  Scenario: A no Movistar user cannot log in the app
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "607123000" text
      And clicks on the "continue_button" button
     Then the "Moves Otac Login" page is displayed
      And the "Validación móvil" header is displayed
      And no sms is received

  @jira.QANOV-3102 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-3099
  @jira.link.relates_to.NOV-111969 @manual @mobile @moves @regression
  Scenario: A user cannot complete the mobile authentication if an error occurs meanwhile the session is being created and validated
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And there is a general server error
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "Login Error" popup is displayed
      And the "message" textfield with "Aplicación no disponible. Ahora mismo la aplicación no está disponible, inténtalo de nuevo más tarde." text is displayed
      And the "accept" button with "Aceptar" text is displayed

  @jira.QANOV-3103 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-3102
  @jira.link.relates_to.NOV-111971 @manual @mobile @moves @regression
  Scenario: A user can close the error popup shown meanwhile the session is being created and validated
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And there is a general server error
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
      And the "Login Error" popup is displayed
      And clicks on the "accept" button
     Then the "login Error" popup is not displayed
      And the "Splash Screen" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.9.7 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-931 @manual @mobile @regression
  Scenario Outline: User cannot log in the app with an invalid format of the phone number
    commented_tags="@depends_on.NOV-65195 @depends_on.NOV-175499"
    Given user is in the "<login_screen>" page
     When fills the "phone_number_field" inputtext with the "<invalid_format>" text
      And clicks on the "continue_button" button
     Then the "error" textfield with "[LANG:login.phone_number.error]" text is displayed

    @old_app
    Examples:
          | product | login_screen             | invalid_format | description             | parent_test_plan | jira_id     |
          | vivobr  | Vivobr Credentials Login | 00000000000    | all 0's                 | QANOV-21791      | QANOV-3115  |
          | vivobr  | Vivobr Credentials Login | 1234567890     | != 11 digits            |                  | QANOV-3116  |
          | vivobr  | Vivobr Credentials Login | 1234567890     | != 11 digits            | QANOV-21791      | QANOV-25146 |
          | vivobr  | Vivobr Credentials Login | 11222222222    | area code and incorrect | QANOV-21791      | QANOV-3117  |

    Examples:
          | product | login_screen             | invalid_format | description             | parent_test_plan | jira_id     |
          | moves   | Moves Credentials Login  | 000000000      | = all 0's               |                  | QANOV-3118  |
          | moves   | Moves Credentials Login  | 1234567890     | != 9 digits             |                  | QANOV-3119  |

  @jira.QANOV-3126 @android @ios @jira.cv.11.3 @jira.link.detects.VIVO-2250 @jira.link.relates_to.NOV-124691 @manual
  @mobile @regression @vivobr @old_app
  Scenario: User cannot log in the app with a phone number of another mobile operator
    internal_checkpoint="If Claro or others mobile operators supports MobileConnect, the user can authenticate the
    mobile phone, then 4th platform will reject the login."
    commented_tags="@depends_on.NOV-65195 @depends_on.NOV-175499"
    Given user is in the "Vivobr Credentials Login" page
     When fills the "phone_number_field" inputtext with the "11940258235" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "[LANG:login.otac_screen.not_found_popup.title]" text is displayed
      And the "message" textfield with "[LANG:login.otac_screen.not_found_popup.message]" text is displayed
      And the "accept" button with "[LANG:login.otac_screen.not_found_popup.accept]" text is displayed

  @jira.QANOV-3199 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.8
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-81171 @manual @mobile @regression @vivobr
  Scenario: User cannot log in the app during a maintenance window
    Given there is a maintenance window
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
     Then the "Maintenance" page is displayed
      And the "title" textfield with "Voltamos logo" text is displayed
      And the "message" textfield with "Por trabalhos de manutençao, a informaçao de sua linha nao está disponível agora. Que tal tentar de novo daqui a pouquinho." text is displayed

  @jira.QANOV-3200 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.8
  @jira.link.parent_test_plan.QANOV-181726 @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-47382 @manual
  @mobile @regression @vivobr @old_app
  Scenario: User cannot log in the app with a pre-activated line: an error message is shown
    internal_checkpoint="Thee pop-up copies are changing with convergente deployment"
    Given user has a "pre-activated" account type
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "inactive_line" popup is displayed
      And the "title" textfield with "Ops! Sua linha está inativa" text is displayed
      And the "message" textfield with "Voce precisa ativar a sua linha para continuar. Após a ativaçao, acesse o app e aproveite as facilidades do Vivo." text is displayed
      And the "accept" button with "Ok, entendí" text is displayed
      And the "cancel" button with "Ligar para ativar" text is displayed

  @jira.QANOV-3201 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.8 @jira.link.depends_on.QANOV-3200
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-47385 @manual @mobile @regression @vivobr @old_app
  Scenario: User with a pre-activated line can tap on the "Ok, entendí" button: user is redirected to the start screen
    Given user has a "pre-activated" account type
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "inactive_line" popup is displayed
      And clicks on the "accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-3202 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.8 @jira.link.depends_on.QANOV-3200
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-47387 @manual @mobile @regression @vivobr @old_app
  Scenario: User with a pre-activated line can tap on the "Ligar para ativar" button: user is redirected to the device's native dialer
    Given user has a "pre-activated" account type
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "inactive_line" popup is displayed
      And clicks on the "cancel" button
     Then the "dialer" app is displayed
      And the "10615" phone number is inserted on the dialer

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.10.8 @jira.link.detects.VIVO-2250
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-47371 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User cannot log in the app with a cancelled/suspended/not_found line: error message is shown
    internal_checkpoint="Beatrix cancelled: 12996713664; Legacy cancelled: 11973766084"
    Given user has a "<account_type>" account type in "<line_status>" status
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "[LANG:login.otac_screen.not_found_popup.title]" text is displayed
      And the "message" textfield with "[LANG:login.otac_screen.not_found_popup.message] " text is displayed
      And the "accept" button with "[LANG:login.otac_screen.not_found_popup.accept]" text is displayed

    Examples:
          | account_type | line_status | impeded      | automation              | jira_id    |
          | legacy       | cancelled   |              |                         | QANOV-3203 |
          | legacy       | suspended   | impeded_mock | automation.pending_mock | QANOV-3204 |
          | legacy       | not found   | impeded_mock | automation.pending_mock | QANOV-3205 |
          | beatrix      | cancelled   |              |                         | QANOV-3206 |
          | beatrix      | suspended   | impeded_mock | automation.pending_mock | QANOV-3207 |
          | beatrix      | not found   | impeded_mock | automation.pending_mock | QANOV-3208 |

  @jira.QANOV-44647 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: User cannot log in the app with a vivo control line, error message is shown
    Given user has a "vivo control" line
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Sua linha é Controle Cartão" text is displayed
      And the "message" textfield with "Ligue para *8486 para completar seu cadastro. " text is displayed
      And the "accept" button with "Ligar para *8486" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User cannot log in the app with a <line_type> line, error message is shown
    Given user has a "<line_type>" line
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Vimos que você já tem produtos Vivo " text is displayed
      And the "message" textfield with "Para Vivo Easy basta acessar pelo app Vivo Easy. E para Vivo Empresas acesse o app Meu Vivo Empresas." text is displayed
      And the "accept" button with "Voltar pro início" text is displayed

    Examples:
          | line_type     | jira_id     |
          | vivo empresas | QANOV-44646 |
          | vivo easy     | QANOV-44648 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: User cannot log in the app with a line in <status> status, error message is shown
    Given user has a line with "<status>" status
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "<title>" text is displayed
      And the "message" textfield with "<message>" text is displayed
      And the "accept" button with "<accept_button>" text is displayed
      And the "cancel" button with "<cancel_button>" text is displayed

    Examples:
          | status                  | title                      | message                                                                    | accept_button               | cancel_button | jira_id     |
          | blacklisted             | Vamos confirmar seus dados | Realize o login com seu CPF ou e-mail cadastrado para entrar no aplicativo | login com seu CPF ou e-mail | Voltar        | QANOV-44649 |
          | pre-activa sem cadastro | Sua linha está inativa     | Você precisa ativá-la para usar o app. Deseja ativar agora?                | Ligar e ativar              | Voltar        | QANOV-44650 |

  @jira.QANOV-44651 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: User cannot log in the app when generic error occurs, error message is shown
    Given account type in "<line_status>" status
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And there is a general server error
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Ops! Algo deu errado" text is displayed
      And the "message" textfield with "Tente outra vez mais tarde." text is displayed
      And the "accept" button with "Voltar para o início" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.10.8 @jira.link.depends_on.QANOV-3126 @old_app
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-47379 @manual @mobile @regression @vivobr
  Scenario Outline: User with a cancelled/suspended/not_found line can tap on the cancel button: user is redirected to the start screen
    internal_checkpoint="Beatrix cancelled: 12996713664; Legacy cancelled: 11973766084"
    Given user has a "<account_type>" account type in "<line_status>" status
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "line_not_found" popup is displayed
      And clicks on the "accept" button
     Then the "Splash Screen" page is displayed

    Examples:
          | account_type | line_status | impeded      | automation              | jira_id    |
          | legacy       | cancelled   |              |                         | QANOV-3214 |
          | legacy       | suspended   | impeded_mock | automation.pending_mock | QANOV-3215 |
          | legacy       | not found   | impeded_mock | automation.pending_mock | QANOV-3216 |
          | beatrix      | cancelled   |              |                         | QANOV-3217 |
          | beatrix      | suspended   | impeded_mock | automation.pending_mock | QANOV-3218 |
          | beatrix      | not found   | impeded_mock | automation.pending_mock | QANOV-3219 |

  @jira.QANOV-28199 @android @ios @jira.cv.9.11 @jira.link.relates_to.NOV-323 @manual @mobile @moves @regression @har
  Scenario: User can not log in the app with a wrong PIN
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills the "otac_edit_box" inputtext with the "000000" text
     Then the "error" textfield with "El código no es correcto. Por favor, inténtalo de nuevo" text is displayed under the "otac_edit_box" field
      And the "Moves Otac Login" page is displayed

  @jira.QANOV-3222 @android @ios @jira.cv.11.11 @jira.link.relates_to.NOV-215297 @manual @mobile @moves @regression
  Scenario: An error login is shown if another login process is ongoing for same user
    Given user is in login process on the "device1" device
     When logs in the application on the "device2" device
     Then the "Access Error" popup is displayed
      And the "title" textfield with "Error de acceso" text is displayed
      And the "message" textfield that contains the "Ya hay otro inicio de sesión en marcha" text is displayed
      And the "accept" button with "Intentar de nuevo" text is displayed

  @jira.QANOV-25149 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @har @old_app
  Scenario: User cannot login with an incorrect PIN code
    Given user does not have a "vivobr" SIM in the device
      And user is registered more than "60" seconds ago
      And user is in the "Vivobr Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills the "otac_edit_box" inputtext with the "000000" text
     Then the "error" textfield with "Código incorreto. Você tem mais 2 tentativas." text is displayed under the "otac_edit_box" field
      And the "Vivobr Otac Login" page is displayed

  @jira.QANOV-25150 @android @ios @jira.cv.12.0 @jira.link.detects.VIVO-2127 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr @old_app
  Scenario: User introduces an incorrect PIN 2 times
    Given user does not have a "vivobr" SIM in the device
      And user is registered more than "60" seconds ago
      And user is in the "Vivobr Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills the "otac_edit_box" inputtext with the "000000" text
      And fills the "otac_edit_box" inputtext with the "111111" text
     Then the "error" textfield with "Código incorreto. Na próxima tentativa incorreta seu acesso será bloqueado." text is displayed under the "otac_edit_box" field
      And the "Vivobr Otac Login" page is displayed

  @jira.QANOV-25151 @android @ios @jira.cv.12.0 @jira.link.detects.VIVO-2128 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr @old_app
  Scenario: User introduces an incorrect PIN 3 times
    Given user does not have a "vivobr" SIM in the device
      And user is registered more than "60" seconds ago
      And user is in the "Vivobr Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills the "otac_edit_box" inputtext with the "000000" text
      And fills the "otac_edit_box" inputtext with the "111111" text
      And fills the "otac_edit_box" inputtext with the "222222" text
     Then the "error" textfield with "Límite de tentativas atingido. Retorne mais tarde ou crie uma nova senha." text is displayed under the "otac_edit_box" field
      And the "Vivobr Otac Login" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: User cannot log in the app with an invalid phone number
    Given user has set the cookies preferences
      And user is in the "<page> Login Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "<invalid_number>" text
      And clicks on the "request_code_button" button
     Then the "error" textfield with "<error_text>" text is displayed

    Examples:
          | page | invalid_number | error_text                                                               | depends_on                | jira_id      |
          | O2de | 01234          | Eine gültige Mobilfunknummer ist mindestens 7-stellig!                   | QANOV-230192:QANOV-230193 | QANOV-230224 |
          | O2de | 012345678901   | Ihr Nutzername ist uns nicht bekannt. Bitte überprüfen Sie Ihre Eingabe. | QANOV-230192:QANOV-230193 | QANOV-230225 |

  @jira.QANOV-230227 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230192:QANOV-230193 @manual @mobile @o2de
  @regression
  Scenario: User cannot log in the app with the phone number of another operator
    Given user has set the cookies preferences
      And user is in the "O2de Login Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "616315468" text
      And clicks on the "request_code_button" button
     Then the "error" textfield with "Ihr Nutzername ist uns nicht bekannt. Bitte überprüfen Sie Ihre Eingabe." text is displayed

  @jira.QANOV-230229 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230195 @manual @mobile @o2de
  @sanity @har
  Scenario: User cannot log in the app with the wrong PIN
    Given user has set the cookies preferences
      And user is in the "O2de Login Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "request_code_button" button
      And the "O2de Login SMS Code" page is displayed
      And fills the "sms_code_inputtext" inputtext with the "999999" text
      And clicks on the "login_button" button
     Then the "error" textfield with the "Ihr SMS-Code ist ungültig.\nBitte überprüfen Sie Ihre Eingabe und versuchen Sie es erneut." format is displayed

  @jira.QANOV-230231 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230195 @manual @mobile @o2de @regression
  Scenario: User cannot log in the app with a wrong PIN format
    Given user has set the cookies preferences
      And user is in the "O2de Login Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "request_code_button" button
      And the "O2de Login SMS Code" page is displayed
      And fills the "sms_code_inputtext" inputtext with the "9999" text
      And clicks on the "login_button" button
     Then the "error" textfield with "Ihr SMS-Code sollte aus 6 Ziffern bestehen!" text is displayed

  @jira.QANOV-453630 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can not log in the app with a wrong PIN
    Given user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And fills the "otac_edit_box" inputtext with the "000000" text
     Then the "error" textfield with "El código no es correcto. Por favor, inténtalo de nuevo" text is displayed under the "otac_edit_box" field
      And the "O2es Otac Login" page is displayed

  @jira.QANOV-453631 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User tries to log in the app using wrong PIN 3 times: user is redirected to the splash screen
    The popup displayed at the end is from MobileConnect
    Given user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
      And clicks on the "finalize_button" button
      And fills "otac_edit_box" inputext with wrong otac
      And clicks on the "finalize_button" button
      And fills "otac_edit_box" inputext with wrong otac
      And clicks on the "finalize_button" button
      And the "Wrong Identifier" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-453632 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can see an error popup when tapping on the "Cancelar" button in the Mobile Connect screen
     When user is in the "O2es Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And clicks on the "cancel_button" button
     Then the "O2es Cancel Login" popup is displayed
      And the "popup.title" textfield with "Inicio de sesión cancelado" text is displayed
      And the "popup.description" textfield with "Para acceder a Mi O2, tendrás que volver a iniciar sesión." text is displayed

  @jira.QANOV-453633 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: A blocked user can see an error when trying to login with MobileConnect
    Given user is blocked
     When user is in the "O2es Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.blocked_number]" text
      And clicks on the "continue_button" button
     Then the "Login Error Screen" page is displayed
      And the "warning_icon" icon is displayed
      And the "error_title" textfield with "Has intentado iniciar sesión demasiadas veces" text is displayed
      And the "error_description" textfield with "Hemos bloqueado temporalmente el acceso a tu cuenta por seguridad. Vuelve a intentarlo más tarde." text is displayed

  @jira.QANOV-453634 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A no o2es can see an error when trying to login with MobileConnect
     When user is in the "O2es Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "600000000" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" textfield with "Datos incorrectos" text is displayed
      And the "popup.description" textfield with "Alguno de los datos introducidos no es correcto. Por favor, revísalos o regístrate en Mi O2 si aún no lo has hecho." text is displayed

  @jira.QANOV-453635 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: A user can see an error if there is already an existing login process with MobileConnect
     When user is in the "O2es Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And there is another login in process with the same msisdn
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" textfield with "Inicio de sesión en curso" text is displayed
      And the "popup.description" textfield with "Ya hay un inicio de sesión en curso con esos datos. Si el aceso falla, vuelve a intentarlo en unos minutos." text is displayed

  @jira.QANOV-559082 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User can see an error when trying to login with MC after session has expired
     When user is in the "O2es Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And waits "600" seconds
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" textfield with "La sesión ha cadudado" text is displayed
      And the "popup.description" textfield with "Por favor, vuelve a iniciar sesión para acceder a Mi O2." text is displayed

  @jira.QANOV-525456 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados postpay ADMIN-LIGHT user tries to log in the application: Pop up informing that the App is not available for his kind of user is displayed
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Legacy Deprecation" popup is displayed
      And the "title" textfield with "No puedes acceder a la app" text is displayed
      And the "message" textfield that contains the "Lo sentimos, ya no puedes seguir haciendo tus gestiones desde la app Mi Movistar." text is displayed
      And the "message" textfield that contains the "Como alternativa, te proponemos que entres en movistar.es con tu usuario y contraseña habituales." text is displayed
      And the "go_to_website" button with "Ir a la web" text is displayed

  @jira.QANOV-527121 @android @impeded_legacy @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados postpay ADMIN-LIGHT user tries to log in the application when the access to the web is closed: Pop up informing that the App is not available for his kind of user is displayed
    This Scenario will apply since the legados user cannot access to the web
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Legacy Deprecation" popup is displayed
      And the "title" textfield with "No puedes acceder a la app" text is displayed
      And the "message" textfield that contains the "Lo sentimos, ya no puedes seguir haciendo tus gestiones desde la app Mi Movistar." text is displayed
      And the "message" textfield that contains the "Si necesitas, te atenderemos en el 1004 y en nuestras tiendas." text is displayed
      And the "go_to_website" button with "Llamar al 1004" text is displayed

  @jira.QANOV-527384 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados prepay ADMIN-LIGHT user tries to log in the application: Pop up with a generic error is displayed
    Legacy prepay users accessing with Mobile Connect are routed as if they were TELCO users.
    Therefore, when these users login through Mobile Connect, they will not get the error pop up, But the APIS will fail and the app will show them the generic error that is used in case of API failure.
    Given user has a "legado prepay" account type
      And user has a "admin-light" role
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "title" textfield with "Ha ocurrido un error" text is displayed
      And the "message" textfield with "Ha ocurrido un error. No ha sido posible iniciar sesión. Inténtalo de nuevo en unos minutos." text is displayed
      And the "accept" button with "Aceptar" text is displayed

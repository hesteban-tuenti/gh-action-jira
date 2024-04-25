# -*- coding: utf-8 -*-
@jira.QANOV-126320
Feature: Credentials negative

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.QANOV-5460 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450 @jira.link.relates_to.NOV-122388 @manual
  @mobile @moves @regression
  Scenario: An error will shown if user taps on the "Continuar" button with username field empty
    Given user is in the "Moves Credentials Login" page
     When clicks on the "continue_button" button
     Then the "mandatory_field" textfield with "Este campo es obligatorio" text is displayed

  @jira.QANOV-5472 @android @har @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5456 @jira.link.relates_to.NOV-75991
  @manual @mobile @moves @regression
  Scenario: A telco user sees an error message after inserting a incorrect password
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user has a "telco" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "more_than_7_characters" text
      And clicks on the "continue_button" button
     Then the "Wrong Password" popup is displayed
      And the "title" textfield with "Los datos introducidos no son correctos" text is displayed
      And the "message" textfield with "Inténtalo de nuevo o pulsa recuperar contraseña." text is displayed

  @jira.QANOV-5473 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5456 @manual @mobile @moves @regression
  Scenario: A legado user sees an error message after inserting a incorrect password
    Given user has a "legado" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "less_7" text
      And clicks on the "continue_button" button
     Then the "error" textfield with "La contraseña no es correcta" text is displayed

  @jira.QANOV-5488 @android @automation.pending_api @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5483
  @jira.link.relates_to.NOV-112017 @manual @mobile @moves @regression
  Scenario: A user cannot complete the user/password authentication without selecting a contact method
    internal_checkpoint="Note: Telefónica validates email and MSISDN formats"
    Given user has a "telco" account type
      And user has never logged in the app
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Contact Method" page is displayed
      And clicks on the "continue" button
     Then the "error" textfield with "Seleccionar un método de contacto antes de continuar" text is displayed

  @jira.QANOV-5502 @android @ios @jira.cv.11.11 @jira.dv.Future @mobile @moves @no_automatable @regression
  Scenario: A user tries to log in the application with an expired password: Error is displayed
    Given user has an expired password
     When logs in the application with user and password
     Then the "Validation Error" popup is displayed
      And the "title" textfield with "Tu contraseña ha caducado" text is displayed
      And the "message" textfield with "Por favor, genérala de nuevo para acceder. Error: F4N865VKLP" text is displayed
      And the "accept" button with "Nueva contraseña" text is displayed

  @jira.QANOV-5502 @android @ios @jira.cv.11.11 @mobile @moves @no_automatable @regression
  Scenario: A user tries to log in the application with an expired password: Error is displayed
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user has an expired password
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And the "password_save" popup is displayed
      And clicks on the "password_save.cancel" button
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "no_thanks_button" button
     Then the "Validation Error" popup is displayed
      And the "title" textfield with "Tu contraseña ha caducado" text is displayed
      And the "message" textfield with "Por favor, genérala de nuevo para acceder. Error: F4N865VKLP" text is displayed
      And the "accept" button with "Nueva contraseña" text is displayed

  @jira.QANOV-5503 @android @ios @jira.cv.11.11 @mobile @moves @no_automatable @regression
  Scenario: A user tries to log in the application with an expired session: Error is displayed
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user has an expired session
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And the "password_save" popup is displayed
      And clicks on the "password_save.cancel" button
      And clicks on the "confirm_button" button
      And the "4P Save Credentials" browser webview is displayed
      And clicks on the "no_thanks_button" button
     Then the "Validation Error" popup is displayed
      And the "title" textfield with "Tu sesión ha caducado" text is displayed
      And the "message" textfield with "Por favor, accede otra vez a la app." text is displayed
      And the "error_code" textfield is displayed
      And the "accept" button with "Entrar" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-58605 @jira.link.relates_to.QANOV-5507
  @jira.link.relates_to.QANOV-5747 @mobile @netcracker @no_automatable @o2uk @regression
  Scenario Outline: A user with the specific Telefonica SIM introduces wrong credentials: Error is displayed
    Given user is "<register_status>" in the application
      And user has a "o2uk" SIM in the device
     When clicks on the "start_now" button
      And the "O2uk Password Login" page is displayed
      And fills the "pass_field" inputtext with the "wrong_password" text
      And clicks on the "continue" button
     Then the "error" textfield with "Your password is not correct." text is displayed

    Examples:
          | register_status | jira_id    |
          | registered      | QANOV-5510 |
          | not_registered  | QANOV-5511 |

  @jira.<jira_id> @<execution_mode> @android @cert0 @cert1 @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-66688
  @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-47606 @jira.link.relates_to.QANOV-5508 @live @mobile
  @netcracker @next @o2uk @sanity
  Scenario Outline: A user without the specific Telefonica SIM introduces wrong credentials: Error is displayed
    Given user is "<register_status>" in the application
      And user does not have a "o2uk" SIM in the device
      And user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "<email_value>" text
      And fills the "pass_field" inputtext with the "<pass_value>" text
      And clicks on the "continue_button" button
     Then the "error" textfield with "User and password do not match" text is displayed
      And the "error" element is under "pass_field" element

    @har
    Examples:
          | register_status | email_value               | pass_value | execution_mode | jira_id    |
          | registered      | [CONTEXT:user.user_login] | wrong_pass | automatic      | QANOV-5513 |
          | registered      | wrong@email.com           | wrong_pass | automatic      | QANOV-5514 |

    Examples:
          | register_status | email_value               | pass_value | execution_mode | jira_id    |
          | not_registered  | [CONTEXT:user.user_login] | wrong_pass | manual         | QANOV-5515 |

  @jira.<jira_id> @android @automation.pending_mock @har @impeded_mock @ios @jira.cv.9.11 @jira.link.relates_to.NOV-3757
  @manual @mobile @netcracker @o2uk @regression
  Scenario Outline: A user cannot log in the app with an invalid account
    internal_checkpoint="NOTE: We can use the user 07521109423 (from CERT1 environment) for business account."
    Given user has a "<account_type>" account type
      And user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Validation Error" popup is displayed
      And the "message" textfield with "<message>" text is displayed
      And the "cancel" button with "Cancel" text is displayed

    Examples:
          | account_type          | message                                                                                                                                                                       | jira_id    |
          | smb                   | Sorry there's been a problem validating your account. If you're a business customer you won't be able to use the app, but don't worry, you can use the My O2 website instead. | QANOV-5559 |
          | disconnected account  | The account number or MSISDN is either disconnected or cannot be found.                                                                                                       | QANOV-5568 |
          | account not available | The account number or MSISDN is either disconnected or cannot be found.                                                                                                       | QANOV-5576 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: User cannot log in the app with an account without product registered, error message is shown
    Given user is in the "Vivobr Credentials Login" page
      And user has an account without product registered
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Produtos não encontrados" text is displayed
      And the "message" textfield with "Ligue para 1058" text is displayed
      And the "accept" button with "Ligue para 1058" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

    Examples:
          | email_cpf | jira_id     |
          | CPF       | QANOV-44652 |
          | Email     | QANOV-44653 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: Vivo user cannot login with an invalid CPF or email
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "<wrong_format_input>" text
      And clicks on the "continue_button" button
     Then the "Vivobr Credentials Login" page is displayed
      And the "error" textfield with "<error_text>" text is displayed

    Examples:
          | wrong_format_input | error_text                                 | jira_id     |
          | 00000000000        | Por favor, digite um CPF ou E-mail válido. | QANOV-25160 |
          | 1234567890         | Por favor, digite um CPF ou E-mail válido. | QANOV-25161 |
          | abc@kvn            | Por favor, digite um CPF ou E-mail válido. | QANOV-25162 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User cannot log in the app with an account with incompatible product, error message is shown
    Given user is in the "Vivobr Credentials Login" page
      And user has an account with incompatible product
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Um ou mais produtos incompatíveis com o app" text is displayed
      And the "message" textfield with "Você pode ver todos os seus produtos acessando o Vivo pelo computador" text is displayed
      And the "accept" button with "Ok, entendi" text is displayed
      And the "cancel" button with "Voltar" text is displayed

    Examples:
          | email_cpf | jira_id     |
          | CPF       | QANOV-44654 |
          | Email     | QANOV-44655 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User cannot log in the app with an account with <line_type> line, error message is shown
    Given user is in the "Vivobr Credentials Login" page
      And user has an account with "<line_type>" line
     When fills the "identity" inputtext with the "CPF" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "continue_button" button
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Vimos que você já tem produtos Vivo" text is displayed
      And the "message" textfield with "Para Vivo Easy basta acessar pelo app Vivo Easy. E para Vivo Empresas acesse o app Meu Vivo Empresas." text is displayed
      And the "accept" button with "Voltar pro início" text is displayed

    Examples:
          | line_type    | jira_id     |
          | vivo empresa | QANOV-44658 |
          | vivo easy    | QANOV-44660 |

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile
  @regression @vivobr @old_app
  Scenario Outline: User cannot log in the app when generic error occurs, error message is shown
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "<email_cpf>" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
      And clicks on the "continue_button" button
      And there is a general server error
     Then the "line_not_found" popup is displayed
      And the "title" textfield with "Ops! Algo deu errado" text is displayed
      And the "message" textfield with "Tente outra vez mais tarde." text is displayed
      And the "accept" button with "Voltar para o início" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

    Examples:
          | email_cpf | jira_id     |
          | CPF       | QANOV-44662 |
          | Email     | QANOV-44663 |

  @jira.QANOV-25189 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario: User who introduces an incorrect password can see an error message
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
     Then the "error" textfield with "Senha incorreta. Você tem mais 2 tentativas" text is displayed under the "identity" field

  @jira.QANOV-25190 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: User who introduces an incorrect password 2 times can see an error message
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
      And fills the "password_field" inputtext with the "password" text
     Then the "error" textfield with "Senha incorreta. Na próxima tentativa incorreta seu acesso será bloqueado" text is displayed under the "password_field" field

  @jira.QANOV-25191 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: User who introduces an incorrect password 3 times can see an error message
    Given user is in the "Vivobr Credentials Login" page
     When fills the "identity" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And fills the "password_field" inputtext with the "password" text
      And fills the "password_field" inputtext with the "password" text
      And fills the "password_field" inputtext with the "password" text
     Then the "error" textfield with "Limite de tentativas atingido. Retorne mais tarde ou crie uma nova senha" text is displayed under the "password_field" field

  @jira.QANOV-5451 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450
  @jira.link.relates_to.NOV-111984 @manual @mobile @moves @regression
  Scenario: A Prospect customer cannot log in the app
    internal_checkpoint="a Prospect customer is a customer that is in process to be registered in Movistar"
    Given user has a "prospect" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
     Then the "Wrong Identifier" popup is displayed
      And the "title" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.title]" text is displayed
      And the "message" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.message]" text is displayed
      And the "accept" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.accept]" text is displayed
      And the "cancel" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.cancel]" text is displayed

  @jira.QANOV-5454 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450 @jira.link.relates_to.NOV-111981 @manual
  @mobile @moves @regression
  Scenario: A no Movistar user cannot log in the app
    Given user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "607123000" text
      And clicks on the "continue_button" button
     Then the "Wrong Identifier" popup is displayed
      And the "title" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.title]" text is displayed
      And the "message" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.message]" text is displayed
      And the "accept" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.accept]" text is displayed
      And the "cancel" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.cancel]" text is displayed

  @jira.QANOV-5458 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5450 @jira.link.relates_to.NOV-111987 @manual
  @mobile @moves @regression
  Scenario: A user cannot log in the app using a NIF/CIF/NIE/Pasaporte with wrong format
    internal_checkpoint="Note: the result will be updated in the future, see this comment:
    https://jira.tuenti.io/jira/browse/MOVES-1951?focusedCommentId=509321&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-509321"
    Given user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "1234567" text
      And clicks on the "continue_button" button
     Then the "Wrong Identifier" popup is displayed
      And the "title" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.title]" text is displayed
      And the "message" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.message]" text is displayed
      And the "accept" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.accept]" text is displayed
      And the "cancel" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.cancel]" text is displayed

  @jira.QANOV-5469 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-5456 @jira.link.relates_to.NOV-112014 @manual
  @mobile @moves @regression
  Scenario: A user cannot insert a wrong password more than 4 times
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the "wrong_pass_1" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "wrong_pass_2" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "wrong_pass_3" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "wrong_pass_4" text
      And clicks on the "continue_button" button
     Then the "Wrong Identifier" popup is displayed
      And the "title" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.title]" text is displayed
      And the "message" textfield with "[LANG:login.user_pwd_screen.wrong_identifier_popup.message]" text is displayed
      And the "accept" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.accept]" text is displayed
      And the "cancel" button with "[LANG:login.user_pwd_screen.wrong_identifier_popup.cancel]" text is displayed

  @jira.QANOV-5474 @android @ios @jira.cv.11.3 @jira.link.relates_to.NOV-136842 @manual @mobile @moves @regression
  Scenario: User who can't access the app can retry to login
    Given user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "1234567" text
      And the "Wrong Identifier" popup is displayed
      And clicks on the "accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-5475 @android @ios @jira.cv.11.3 @jira.link.relates_to.NOV-136838 @manual @mobile @moves @regression
  Scenario: User who can't access the app can see more information
    Given user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "1234567" text
      And the "Wrong Identifier" popup is displayed
      And clicks on the "cancel" button
     Then the "Access Problems" internal webview is displayed
      And the "¿Problemas con el acceso?" header is displayed

  @jira.<jira_id> @android @har @ios @jira.cv.10.2 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-47609
  @manual @mobile @netcracker @o2uk @smoke
  Scenario Outline: Wrong credentials introduced three times: user is redirected to the splash screen
    commented_tags="@relates_to.NOV-47602"
    Given user is "<register_status>" in the application
      And user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "password_1" text
      And clicks on the "continue_button" button
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "password_2" text
      And clicks on the "continue_button" button
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "password_3" text
      And clicks on the "continue_button" button
      And the "Locked Account" popup is displayed
      And clicks on the "accept" button
     Then the "Splash Screen" page is displayed

    Examples:
          | register_status | depends_on | jira_id    |
          | registered      | QANOV-5504 | QANOV-5516 |
          | not_registered  | QANOV-5505 | QANOV-5517 |

  @jira.QANOV-5518 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5516 @jira.link.depends_on.QANOV-5517
  @jira.link.relates_to.NOV-91674 @manual @mobile @o2uk @regression
  Scenario: User can log in again after one hour when enters user/password wrong three times
    Given user has locked the account 1 hour ago
     When logs in the application and accepts permissions
     Then the "[CONF:landing_tab]" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.2 @jira.link.relates_to.NOV-47608 @jira.link.relates_to.QANOV-5507
  @jira.link.relates_to.QANOV-5508 @jira.link.relates_to.QANOV-5517 @jira.link.relates_to.QANOV-5747 @manual @mobile
  @netcracker @o2uk @regression
  Scenario Outline: Wrong credentials introduced three times: the account is locked for an hour and a popup informs the user
    other_affected_versions="2022-20"
    Given user is "<register_status>" in the application
      And user is in the "O2uk User Password Login" page
     When fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "password_1" text
      And clicks on the "continue_button" button
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "password_2" text
      And clicks on the "continue_button" button
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "password_3" text
      And clicks on the "continue_button" button
     Then the "Locked Account" popup is displayed
      And the "title" textfield with "Something went wrong." text is displayed
      And the "message" textfield with "For your safety we've locked your account. Please try again in an hour." text is displayed
      And the "accept" button with "OK" text is displayed

    Examples:
          | register_status | jira_id    |
          | registered      | QANOV-5504 |
          | not_registered  | QANOV-5505 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user cannot login in the app with an invalid phone number, email or username
    Given user has set the cookies preferences
      And user is in the "<page> Login Credentials" page
     When fills the "credential_inputtext" inputtext with the "<invalid_credentials>" text
      And clicks on the "continue_button" button
     Then the "error" textfield with "<error_text>" text is displayed

    Examples:
          | product | cv   | page   | invalid_credentials | error_text                                                               | depends_on   | jira_id      |
          | blaude  | 13.9 | Blaude | abcd                | Ihr Benutzername sollte eine Länge zwischen 5 und 60 Zeichen haben!      | QANOV-230132 | QANOV-230180 |
          | blaude  | 13.9 | Blaude | 012345678901        | Ihr Nutzername ist uns nicht bekannt. Bitte überprüfen Sie Ihre Eingabe. | QANOV-230132 | QANOV-230181 |
          | blaude  | 13.9 | Blaude | abc@gmail           | Ihr Nutzername ist uns nicht bekannt. Bitte überprüfen Sie Ihre Eingabe. | QANOV-230132 | QANOV-230182 |
          | o2de    | 14.2 | O2de   | abcd                | Ihr Benutzername sollte eine Länge zwischen 5 und 60 Zeichen haben!      | QANOV-230133 | QANOV-230183 |
          | o2de    | 14.2 | O2de   | 012345678901        | Ihr Nutzername ist uns nicht bekannt. Bitte überprüfen Sie Ihre Eingabe. | QANOV-230133 | QANOV-230184 |
          | o2de    | 14.2 | O2de   | abc@gmail           | Ihr Nutzername ist uns nicht bekannt. Bitte überprüfen Sie Ihre Eingabe. | QANOV-230133 | QANOV-230185 |

  @jira.QANOV-230187 @android @ber @har @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230133 @manual @mobile @o2de
  @sanity
  Scenario: A user cannot login in the app with an incorrect password
    Given user has set the cookies preferences
      And user is in the "O2de Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Password Login" page is displayed
      And fills the "password_inputtext" inputtext with the "Kennwork" text
      And clicks on the "continue_button" button
     Then the "error" textfield with the "Ihr Kennwort ist ungültig.\nBitte überprüfen Sie Ihre Eingabe und versuchen Sie es erneut.\nBeachten Sie bitte, dass Sie die Eingabe nur maximal 3x falsch tätigen dürfen. Ansonsten wird ihr aktuelles Kennwort automatisch zurückgesetzt." format is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-230132
  @jira.link.parent_test_plan.QANOV-494500 @manual @mobile @regression @har
  Scenario Outline: A user cannot login in the app with an invalid phone number, email, username or password in CIAM login
    Given user has set the cookies preferences
      And user is in the "Blaude Login Credentials" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "error" textfield with "Nutzername und / oder Kennwort falsch\nBitte überprüfe deine Eingabe und versuche es erneut. Beachte bitte, dass du die Eingabe nur maximal 3x falsch tätigen darfst. Ansonsten wird dein aktuelles Kennwort automatisch zurückgesetzt." text is displayed

    Examples:
          | identifier                | password                | jira_id      |
          | Nutzername                | [CONTEXT:user.password] | QANOV-498055 |
          | [CONTEXT:user.user_login] | Kennwork                | QANOV-498056 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230133 @manual @mobile @o2de @regression
  Scenario Outline: A user cannot login in the app if the session expired during the login
    The time configured for the login is 15 minutes.
    Given user has set the cookies preferences
      And user is in the "<page> Credentials Login" page
     When fills the "credential_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Login Password" page is displayed
      And waits until the session has expired
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "login_button" button
     Then the "Session Expired" page is displayed
      And the "title" textfield with "Ihre Session ist abgelaufen" text is displayed
      And the "description" textfield with "Bitte melden Sie sich bei Mein <name> an," text is displayed
      And the "back_to_login_link" link with "Zum Login" text is displayed
      And clicks on the "back_to_login_link" link
      And the "O2de Login Credentials" page is displayed

    Examples:
          | product | cv   | page   | depends_on   | detects    | name | jira_id      |
          | blaude  | 13.9 | Blaude | QANOV-230132 | OBO2DE-198 | Blau | QANOV-230188 |
          | o2de    | 14.2 | O2de   | QANOV-230133 |            | O₂   | QANOV-230189 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-230132
  @jira.link.parent_test_plan.QANOV-494500 @manual @mobile @regression
  Scenario Outline: A user cannot login in the app if the session expired during the login in CIAM login
    The time configured for the login is 15 minutes.
    Given user has set the cookies preferences
      And user is in the "<page> Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And waits until the session has expired
      And clicks on the "continue_button" button
     Then the "Session Expired" page is displayed
      And the "title" textfield with "Ihre Sitzung ist abgelaufen" text is displayed
      And the "description" textfield with "Ihre Sitzung ist abgelaufen. Bitte melden Sie sich am Portal an, um die Portaldienste nutzen zu können." text is displayed
      And the "back_to_login_link" link with "Zurück zur Loginseite" text is displayed
      And clicks on the "back_to_login_link" link
      And the "<page> Login Credentials" page is displayed

    Examples:
          | product | cv   | page   | depends_on   | detects    | jira_id      |
          | blaude  | 13.9 | Blaude | QANOV-230132 | OBO2DE-198 | QANOV-498057 |
          | o2de    | 14.2 | O2de   | QANOV-230133 |            | QANOV-532060 |

  @jira.QANOV-498057 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-230132
  @jira.link.parent_test_plan.QANOV-494500 @manual @mobile @regression
  Scenario: A user cannot login in the app if the session expired during the login in CIAM login
    The time configured for the login is 15 minutes.
    Given user has set the cookies preferences
      And user is in the "Blaude Login Credentials" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_inputtext" inputtext with the "[CONTEXT:user.password]" text
      And waits until the session has expired
      And clicks on the "continue_button" button
     Then the "Session Expired" page is displayed
      And the "title" textfield with "Ihre Sitzung ist abgelaufen" text is displayed
      And the "description" textfield with "Ihre Sitzung ist abgelaufen. Bitte melden Sie sich am Portal an, um die Portaldienste nutzen zu können." text is displayed
      And the "back_to_login_link" link with "Zurück zur Loginseite" text is displayed
      And clicks on the "back_to_login_link" link
      And the "Blaude Login Credentials" page is displayed

  @jira.QANOV-453613 @android @ios @jira.cv.Future @manual @mobile @o2es @regression @tbd
  Scenario: A user sees an error message after inserting a incorrect password
    Given user is in the "O2es Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "password_field" inputtext with the "more_than_7_characters" text
      And clicks on the "continue_button" button
     Then the "Wrong Password" popup is displayed

  @jira.QANOV-453616 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: Prospect user can see an error when trying to login with user/pwd
    Error Code 206
     When user is in the "O2es Credentials Login" page
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.prospect_user]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" textfield with "Tu cuenta está casi lista" text is displayed
      And the "popup.description" textfield with "Estamos preparándolo todo para que puedas usar la aplicación Mi O2 muy pronto." text is displayed

  @jira.QANOV-453617 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User can see an error when trying to login with user/pwd after the API GW sessions has expired
    Error Code 300. Session expires in 5 min
     When user is in the "O2es Credentials Login" page
      And waits "600" seconds
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.valid_user]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" textfield with "La sesión ha cadudado" text is displayed
      And the "popup.description" textfield with "Por favor, vuelve a iniciar sesión para acceder a Mi O2." text is displayed

  @jira.QANOV-3104 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.11 @manual @mobile @moves @regression
  Scenario: A user tries to log in the application with an expired password: Error is displayed
    Given user has an expired password
     When logs in the application with sms
     Then the "Validation Error" popup is displayed
      And the "title" textfield with "Tu contraseña ha caducado" text is displayed
      And the "message" textfield with "Por favor, genérala de nuevo para acceder. Error: F4N865VKLP" text is displayed
      And the "accept" button with "Nueva contraseña" text is displayed

  @jira.QANOV-453619 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: Migrated legado user without password can see an error when trying to log in with user/pwd
    Error Code 208
     When user is in the "O2es Credentials Login" page
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.legado_no_pwd_user]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" icon is displayed
      And the "popup.description" textfield with "Para iniciar sesión en Mi O2 necesitas una contraseña. Puedes crearla desde 'Regístrate' en la pantalla de inicio." text is displayed

  @jira.QANOV-453620 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A no o2es client can see an error when trying to log in with user/pwd
    Error Code 205
     When user is in the "O2es Credentials Login" page
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.no_o2es_user]" text
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Login Error" popup is displayed
      And the "popup.title" textfield with "Datos incorrectos" text is displayed
      And the "popup.description" textfield with "Alguno de los datos introducidos no es correcto. Por favor, revísalos o regístrate en Mi O2 si aún no lo has hecho." text is displayed

  @jira.QANOV-525453 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user tries to log in the application: Pop up informing that the App is not available for his kind of user is displayed
    Given user has a "legado" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Legacy Deprecation" popup is displayed
      And the "title" textfield with "No puedes acceder a la app" text is displayed
      And the "message" textfield that contains the "Lo sentimos, ya no puedes seguir haciendo tus gestiones desde la app Mi Movistar." text is displayed
      And the "message" textfield that contains the "Como alternativa, te proponemos que entres en movistar.es con tu usuario y contraseña habituales." text is displayed
      And the "go_to_website" button with "Ir a la web" text is displayed

  @jira.QANOV-525454 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user clicks on the "Ir a la web" option in the "Legacy Deprecation" popup: External webview is displayed
    Given user has a "legado" account type
      And user is in the "Legacy Deprecation" popup
     When clicks on the "go_to_website" button
     Then the external webview is displayed
      And the "TBD" string is displayed

  @jira.QANOV-525455 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user tries to log in the application when the access to the web is closed: Pop up informing that the App is not available for his kind of user is displayed
    This Scenario will apply since the legados user cannot access to the web
    Given user has a "legado" account type
      And user is in the "Moves Credentials Login" page
     When fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "Legacy Deprecation" popup is displayed
      And the "title" textfield with "No puedes acceder a la app" text is displayed
      And the "message" textfield that contains the "Lo sentimos, ya no puedes seguir haciendo tus gestiones desde la app Mi Movistar." text is displayed
      And the "message" textfield that contains the "Si necesitas, te atenderemos en el 1004 y en nuestras tiendas." text is displayed
      And the "go_to_website" button with "Llamar al 1004" text is displayed

  @jira.QANOV-527122 @android @impeded_legacy @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-524943 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user clicks on the "Llamar al 1004" option in the "Legacy Deprecation" popup: Dialer app is displayed with '1004' number filled
    Given user has a "legado" account type
      And user is in the "Legacy Deprecation" popup
     When clicks on the "go_to_website" button
     Then the "dialer" app is displayed
      And the "1004" phone number is inserted on the dialer

# -*- coding: utf-8 -*-
@jira.QANOV-2963
Feature: OTP

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.QANOV-38906 @android @automatic @ber @har @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-38862 @live @mobile
  @moves @next @smoke
  Scenario: User access to the Custom Tab "Login" screen on Android devices
    internal_checkpoint="With the custom tabs the Login view is opened in browser mode, so the 'identificate' header
    wont be shown on the header"
     When clicks on the "start_now" button
      And the "Moves Credentials Login" page is displayed
     Then the "selector_tab.phone_number_selector" tab with "Soy usuario de línea" text is displayed
      And the "selector_tab.password_selector" tab with "Soy titular" text is displayed
      And the "identity_placeholder" textfield with "NIF/CIF/NIE o Pasaporte" text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-239106 @automatic @ber @har @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-38862 @live @mobile @moves
  @next @smoke
  Scenario: User access to the Custom Tab "Login" screen on iOS devices
    internal_checkpoint="With the custom tabs the Login view is opened in browser mode, so the 'identificate' header
    wont be shown on the header"
     When clicks on the "start_now" button
      And the "Domain Permission Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Moves Credentials Login" page is displayed
     Then the "selector_tab.phone_number_selector" tab with "Soy usuario de línea" text is displayed
      And the "selector_tab.password_selector" tab with "Soy titular" text is displayed
      And the "identity_placeholder" textfield with "NIF/CIF/NIE o Pasaporte" text is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed

  @jira.QANOV-2980 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-38906
  @jira.link.relates_to.NOV-161331 @manual @mobile @moves @regression
  Scenario: A Telco In customer can log in the app with OTP
    Given user has a "telco-in" account type
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-2990 @android @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-38906 @jira.link.parent_test_plan.QANOV-21049
  @jira.link.relates_to.NOV-194631 @manual @mobile @moves @regression
  Scenario: A Telco Out customer can log in the app with OTP
    internal_checkpoint="a Telco Out customer is a customer that is being migrated (from Telco to Legado)"
    Given user has a "telco-out" account type
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "App Pin Code" page is displayed

  @jira.QANOV-2982 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-38906 @jira.link.relates_to.NOV-53630 @manual
  @mobile @moves @regression
  Scenario: User can access to the "Problems with access?" screen from the Login screen
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And clicks on the "access_problems_link" link
     Then the "¿Problemas con el acceso?" internal webview is displayed

  @jira.QANOV-2983 @android @automatic @ber @har @jira.cv.11.2 @jira.link.depends_on.QANOV-2994
  @jira.link.depends_on.QANOV-38906 @jira.link.relates_to.NOV-111966 @live @mobile @moves @next @smoke
  Scenario: A telco postpay user can access to the Mobile Connect screen after inserting a valid phone number on Android devices
    Given user has a "telco postpay" account type
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Moves Otac Login" page is displayed
      And the "otac_edit_box" inputtext is displayed
      And the "new_pin_code" link with "solicita uno nuevo" text is displayed
      And the "finalize_button" button with "Finalizar" text is displayed
      And the "cancel_button" button with "Cancelar" text is displayed

  @jira.QANOV-239107 @automatic @ber @har @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-2994
  @jira.link.depends_on.QANOV-38906 @jira.link.relates_to.NOV-111966 @live @mobile @moves @next @smoke
  Scenario: A telco postpay user can access to the Mobile Connect screen after inserting a valid phone number on iOS devices
    Given user has a "telco postpay" account type
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "keyboard_ok_button" element if visible
      And clicks on the "continue_button" button
     Then the "Moves Otac Login" page is displayed
      And the "otac_edit_box" inputtext is displayed
      And the "new_pin_code" link with "solicita uno nuevo" text is displayed
      And the "finalize_button" button with "Finalizar" text is displayed
      And the "cancel_button" button with "Cancelar" text is displayed

  @jira.<jira_id> @<automation> @<ber> @<impeded> @<test_priority> @android @ios @jira.cv.11.2
  @jira.link.depends_on.QANOV-2994 @jira.link.depends_on.QANOV-38906 @jira.link.relates_to.NOV-111966 @live @mobile @moves
  @next
  Scenario Outline: A <account_type> user can access to the Mobile Connect screen after inserting a valid phone number
    Given user has a "<account_type>" account type
      And user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Moves Otac Login" page is displayed
      And the "otac_edit_box" inputtext is displayed
      And the "new_pin_code" link with "solicita uno nuevo" text is displayed
      And the "finalize_button" button with "Finalizar" text is displayed
      And the "cancel_button" button with "Cancelar" text is displayed

    @manual
    Examples:
          | account_type  | ber | impeded      | automation              | test_priority | jira_id      |
          | telco prepay  |     |              |                         | regression    | QANOV-2984   |
          | legado prepay |     |              |                         | regression    | QANOV-2986   |
          | telco-in      |     | impeded_mock | automation.pending_mock | regression    | QANOV-2987   |
          | telco-out     |     | impeded_mock | automation.pending_mock | regression    | QANOV-184362 |

    @no_automatable
    Examples:
          | account_type   | ber | impeded        | automation | test_priority | jira_id    |
          | legado postpay | ber | impeded_legacy |            | smoke         | QANOV-2985 |

  @jira.QANOV-2988 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-2983 @jira.link.depends_on.QANOV-2984
  @jira.link.depends_on.QANOV-2985 @jira.link.depends_on.QANOV-2986 @jira.link.depends_on.QANOV-2987
  @jira.link.relates_to.NOV-52626 @manual @mobile @moves @regression
  Scenario: User logs in the app using wrong PIN 3 times: user is redirected to the splash screen
    Given user is in the "Moves Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
      And clicks on the "finalize_button" button
      And fills "otac_edit_box" inputext with wrong otac
      And clicks on the "finalize_button" button
      And fills "otac_edit_box" inputext with wrong otac
      And clicks on the "finalize_button" button
     Then the "Wrong Identifier" popup is displayed
      And the "title" textfield with "El identificador introducido no es correcto" text is displayed
      And the "message" textfield with "Recuerda que el documento del titular debe incluir números y letras sin separadores ni espacios entre ellos." text is displayed
      And the "accept" button with "Intentar de nuevo" text is displayed
      And the "cancel" button with "Más información" text is displayed

  @jira.QANOV-38907 @android @automation.hard @har @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-38862 @jira.link.relates_to.NOV-175493 @manual @mobile @moves @sanity
  Scenario: A user without the sim in the device completes the mobile authentication successfully with Custom tabs
    Given user does not have a "moves" SIM in the device
      And the device has no PIN/fingerprint registered
      And user is in the "Moves Credentials Login" browser webview is displayed
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-2994 @android @har @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-2983 @jira.link.depends_on.QANOV-2984
  @jira.link.depends_on.QANOV-2985 @jira.link.depends_on.QANOV-2986 @jira.link.depends_on.QANOV-2987
  @jira.link.relates_to.NOV-111974 @manual @mobile @moves @smoke
  Scenario: User can access to the "Soy usuario de línea" tab from the "Soy titular" tab
    Given user is in the "Moves Credentials Login" page
      And the "selector_tab.password_selector" tab is selected
     When clicks on the "selector_tab.phone_number_selector" tab
     Then the "selector_tab.phone_number_selector" tab is selected
      And the "phone_number_field" inputtext with the "Número de teléfono" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And the "access_problems_link" link with "¿Problemas con el acceso?" text is displayed

  @jira.QANOV-2995 @android @har @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-2983 @jira.link.depends_on.QANOV-2984
  @jira.link.depends_on.QANOV-2985 @jira.link.depends_on.QANOV-2986 @jira.link.depends_on.QANOV-2987
  @jira.link.relates_to.NOV-53320 @manual @mobile @moves @smoke
  Scenario: User can ask for a new PIN
     When user is in the "Moves Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And clicks on the "new_pin_code" link
     Then sms with new pin code is received

  @jira.QANOV-2996 @android @ios @jira.cv.11.0 @jira.link.depends_on.QANOV-2983 @jira.link.depends_on.QANOV-2984
  @jira.link.depends_on.QANOV-2985 @jira.link.depends_on.QANOV-2986 @jira.link.depends_on.QANOV-2987
  @jira.link.relates_to.NOV-104864 @manual @mobile @moves @regression
  Scenario: User can request a new PIN up to a maximum number
     When user is in the "Moves Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And clicks on the "new_pin_code" link
      And clicks on the "new_pin_code" link
     Then sms with new pin code is received

  @jira.QANOV-2997 @android @ios @jira.cv.11.0 @jira.link.depends_on.QANOV-2996 @jira.link.relates_to.NOV-104865 @manual
  @mobile @moves @regression
  Scenario: User is blocked when the maximum number of PIN requests is reached
     When user is in the "Moves Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And clicks on the "new_pin_code" link
      And clicks on the "new_pin_code" link
      And clicks on the "new_pin_code" link
     Then the "Login Blocked" popup is displayed
      And the "title" textfield with "El identificador introducido no es correcto" text is displayed
      And the "message" textfield with "Recuerda que el documento del titular debe incluir números y letras sin separadores ni espacios entre ellos." text is displayed
      And the "accept" button with "Intentar de nuevo" text is displayed
      And the "cancel" button with "Más información" text is displayed

  @jira.QANOV-3028 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-2983 @jira.link.depends_on.QANOV-2984
  @jira.link.depends_on.QANOV-2985 @jira.link.depends_on.QANOV-2986 @jira.link.depends_on.QANOV-2987
  @jira.link.relates_to.NOV-52436 @manual @mobile @moves @regression
  Scenario: User can see an error popup when tapping on the "Cancelar" button in the Mobile Connect screen
     When user is in the "Moves Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Moves Otac Login" page is displayed
      And clicks on the "cancel_button" button
     Then the "Login Error" popup is displayed
      And the "title" textfield with "Ha ocurrido un error" text is displayed
      And the "message" textfield with "Ha ocurrido un error. No ha sido posible iniciar sesión. Inténtalo de nuevo en unos minutos." text is displayed
      And the "accept" button with "Aceptar" text is displayed

  @jira.<jira_id> @<client> @<product> @UniqueLoginClose @automatic @jira.cv.10.8
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-96510 @mobile @sanity
  Scenario Outline: A <product> user will see a popup if try to exit from login flow in an <client> device
    commented_tags="@depends_on.NOV-65195 @depends_on.NOV-175499
    Copies to be changed with convergente deployment for Vivo"
    Given user is in the "<login_screen>" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Quit Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.exit_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.exit_popup.message]" text is displayed
      And the "popup.accept" button with "<popup_accept>" text is displayed
      And the "popup.cancel" button with "<popup_cancel>" text is displayed

    @live @next @old_app
    Examples:
          | product | login_screen             | parent_test_plan | client  | popup_accept                       | popup_cancel                       | jira_id      |
          | vivobr  | Vivobr Credentials Login | QANOV-21791      | android | [LANG:login.exit_popup.accept_adr] | [LANG:login.exit_popup.cancel_adr] | QANOV-3107   |
          | vivobr  | Vivobr Credentials Login | QANOV-21791      | ios     | [LANG:login.exit_popup.accept_ios] | [LANG:login.exit_popup.cancel_ios] | QANOV-292118 |

    @cert0 @cert1 @live @next
    Examples:
          | product | login_screen             | parent_test_plan | client  | popup_accept                       | popup_cancel                       | jira_id      |
          | o2uk    | O2uk User Password Login |                  | android | [LANG:login.exit_popup.accept_adr] | [LANG:login.exit_popup.cancel_adr] | QANOV-3108   |
          | o2uk    | O2uk User Password Login |                  | ios     | [LANG:login.exit_popup.accept_ios] | [LANG:login.exit_popup.cancel_ios] | QANOV-292119 |

  @jira.<jira_id> @<label> @<product> @UniqueLoginClose @android @ios @jira.cv.10.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: User can go back to the splash screen
    Given user is in the "<login_screen>" page
     When clicks on the "navigation_top_bar.back_button" button
      And the "Login Exit" popup is displayed
      And clicks on the "accept" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | login_screen             | depends_on | parent_test_plan | label   | jira_id    |
          | vivobr  | Vivobr Credentials Login | QANOV-3107 | QANOV-21791      | old_app | QANOV-3110 |
          | o2uk    | O2uk User Password Login | QANOV-3108 |                  |         | QANOV-3111 |

  @jira.<jira_id> @<client> @UniqueLoginClose @jira.cv.10.8 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.relates_to.NOV-120555 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: User will see a popup if try to exit from login flow from validate pin screen in an <client> device
    commented_tags="@depends_on.NOV-65195 @depends_on.NOV-175499"
    Given user is in the "Vivobr Credentials Login" page
     When fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Quit Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.exit_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.exit_popup.message]" text is displayed
      And the "popup.accept" button with "<popup_accept>" text is displayed
      And the "popup.cancel" button with "<popup_cancel>" text is displayed

    Examples:
          | client  | popup_accept                       | popup_cancel                       | jira_id      |
          | android | [LANG:login.exit_popup.accept_adr] | [LANG:login.exit_popup.cancel_adr] | QANOV-3113   |
          | ios     | [LANG:login.exit_popup.accept_ios] | [LANG:login.exit_popup.cancel_ios] | QANOV-292120 |

  @jira.QANOV-3220 @android @har @ios @jira.cv.9.14 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.relates_to.NOV-122232 @manual @mobile @smoke @vivobr
  Scenario: User not registered in the app previously inserts a valid phone number: user is redirected to the "Validate PIN" screen
    commented_tags="@depends_on.NOV-65195 @depends_on.NOV-175499"
    Given user has not registered in the application previously
      And user is in the "Vivobr Credentials Login" page
     When fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Vivobr Otac Login" page is displayed

  @jira.QANOV-3221 @android @ios @jira.cv.9.11 @jira.link.parent_test_plan.QANOV-21791 @jira.link.relates_to.NOV-323
  @manual @mobile @old_app @regression @vivobr
  Scenario: User registration with invalid PIN: error message is displayed
    Given user has not registered in the application previously
      And user is in the "Vivobr Credentials Login" page
     When fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills the "otac_edit_box" inputtext with the "000000" text
     Then the "error" textfield with "Código incorreto. Você tem mais 2 tentativas." text is displayed under the "otac_edit_box" field
      And the "Vivobr Otac Login" page is displayed

  @jira.QANOV-25147 @android @har @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @old_app @smoke @vivobr
  Scenario: Vivo user can access to the OTP login screen
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And clicks on the "selector_tab.phone_number_selector" tab
     Then the "selector_tab.phone_number_selector" tab with "Número Vivo" text is displayed
      And the "selector_tab.password_selector" tab with "CPF ou E-mail" text is displayed
      And the "selector_tab.phone_number_selector" tab is selected
      And the "insert_phone_number_title" textfield with "Faça login com seu número de telefone" text is displayed
      And the "phone_number_field" inputtext with the "Entre com seu DDD + celular Vivo" placeholder is displayed
      And the "continue_button" button with "Continuar" text is displayed

  @jira.QANOV-600448 @account_chooser_deprecate @android @har @ios @jira.cv.24.2 @manual @mobile @vivobr
  Scenario: Vivo user can access to the OTP login screen
     When clicks on the "start_now" button
     Then the "Vivobr Credentials Login" page is displayed
      And the "insert_credentials_title" textfield is displayed
      And the "phone_number_field" inputtext with the "Número Vivo móvel" placeholder is displayed
      And the "not_number" textfield that contains the "Não tem número Vivo?" text is displayed
      And the "continue_button" button with "Continuar" text is displayed

  @jira.QANOV-25148 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @smoke @vivobr
  @har
  Scenario: Vivo user can access to the insert PIN screen by introducing a valid phone number
    Given user is in the "Vivobr Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "Vivobr Otac Login" page is displayed

  @jira.QANOV-25154 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr
  Scenario: User can go back to the splash screen from validate pin screen
    Given user is in the "Vivobr Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And clicks on the "navigation_top.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-25157 @android @automatic @ber @har @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.parent_test_plan.QANOV-360674 @live @mobile @next @sanity @vivobr
  Scenario: User without an associated SIM in the device can log in the app using PIN code
     When user has a "any" plan in "no cancelled" status
      And logs in the application with sms and accepts permissions
     Then the landing tab page is displayed

  @jira.QANOV-531860 @android @ber @har @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile
  @sanity @vivobr
  Scenario: User without an associated SIM in the device can see loading screen when log in the app using PIN code
    Given user has a "any" plan in "no cancelled" status
     When logs in the application with sms and accepts permissions
     Then the "Welcome Login" page is displayed
      And the "vivinho_icon" icon is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen_novo_app.carousel_message_first]" text is displayed
      And the "carousel_message" textfield with "[LANG:launch_app.loading_screen_novo_app.carousel_message_second]" text is displayed
      And the "check_icon" icon is displayed
      And the "carousel_message" textfield with the "O seu app está pronto, \d+!" format is displayed
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-25550 @UniqueLoginClose @android @har @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual
  @mobile @smoke @vivobr
  Scenario: MULTIPLAN user can log in the app using PIN code (Without Unique Login)
    Given user does not have a "vivobr" SIM in the device
      And user is registered more than "60" seconds ago
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And the landing tab page is displayed
      And clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed
      And the account content corresponds to the plan associated to the line used for logging in

  @jira.QANOV-56937 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.4
  @jira.link.parent_test_plan.QANOV-56585 @manual @mobile @regression @vivobr @har
  Scenario: User can log in the app through otp with a user in pending status
    Given user has a "convergente" account type
      And user has a "any" plan in "pending" status
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
     Then the landing tab page is displayed

  @jira.<jira_id> @<ber> @android @har @impeded_legacy @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @no_automatable @smoke @vivobr
  Scenario Outline: A <account_type> user with several plan can see only the logged line when user logs in by OTP
    Given user has a "<account_type>" account type
      And user has "several" plans
     When clicks on the "start_now" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
     Then the "[CONF:landing_tab]" page is displayed
      And the only the logged line information is displayed

    Examples:
          | account_type  | ber | cv   | parent_test_plan          | jira_id      |
          | legacy prepay | ber | 12.0 |                           | QANOV-203780 |
          | jeri control  |     | 13.5 | QANOV-200803:QANOV-226748 | QANOV-203781 |
          | jeri prepay   |     | 13.5 | QANOV-200803:QANOV-226748 | QANOV-250217 |
          | control_n     | ber | 13.5 | QANOV-200803              | QANOV-203782 |

  @jira.QANOV-230192 @android @ber @har @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230133 @manual @mobile @o2de @smoke
  Scenario: A user can access to the OTP login flow from the Credentials Login screen
    Given user has set the cookies preferences
      And user is in the "O2de Credentials Login" page
     When clicks on the "login_with_otp_button" button
     Then the "O2de Login Phone Number" page is displayed
      And the "title" textfield with "Login mit SMS-Code" text is displayed
      And the "otp_description" textfield with "Bitte geben Sie Ihre O2 Mobilfunknummer ein:" text is displayed
      And the "phone_number_inputtext" inputtext with the "O2 Mobilfunknummer" placeholder is displayed
      And the "request_code_button" button with "Code anfordern" text is displayed
      And the "login_with_password_button" button with "Login mit Kennwort" text is displayed
      And the "registration_message" textfield with "Noch nicht bei Mein O2 ? Jetzt registrieren" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-230193 @android @ber @har @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230135 @manual @mobile @o2de @smoke
  Scenario: A user can access to the OTP login flow from the Password Login screen
    Given user has set the cookies preferences
      And user is in the "O2de Credentials Login" page
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Password Login" page is displayed
     When clicks on the "login_with_otp_button" button
     Then the "O2de Login Phone Number" page is displayed
      And the "title" textfield with "Login mit SMS-Code" text is displayed
      And the "otp_description" textfield with "Bitte geben Sie Ihre O2 Mobilfunknummer ein:" text is displayed
      And the "phone_number_inputtext" inputtext with "[CONTEXT:user.user_login]" text is displayed
      And the "request_code_button" button with "Code anfordern" text is displayed
      And the "login_with_password_button" button with "Login mit Kennwort" text is displayed
      And the "registration_message" textfield with "Noch nicht bei Mein O2 ? Jetzt registrieren" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-230195 @android @ber @har @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230192:QANOV-230193 @manual @mobile
  @o2de @smoke
  Scenario: A user who inserted the proper phone number can access to the "Login SMS Code" screen
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "O2de Login Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "request_code_button" button
     Then the "O2de Login SMS Code" page is displayed
      And the "title" textfield with "Login mit SMS-Code" text is displayed
      And the "otp_description" textfield with "Bitte geben Sie den Bestätigungs-Code ein:" text is displayed
      And the "sms_code_inputtext" inputtext with the "Bestätigungs-Code" placeholder is displayed
      And the "login_button" button with "Einloggen" text is displayed
      And the "sms_not_received_link" link with "SMS nicht erhalten" text is displayed
      And the "login_with_password_button" button with "Login mit Kennwort" text is displayed
      And the "registration_link" link with "Jetzt registrieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.<jira_id> @android @ber @har @ios @jira.cv.14.2 @jira.link.detects.<detects> @manual @mobile @no_automatable @o2de
  @sanity
  Scenario Outline: A user without an associated SIM in the device can log in the app with PIN code
    Given user has set the cookies preferences
      And user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user is in the "O2de Login Phone Number" page
     When fills the "phone_number_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "request_code_button" button
      And the "O2de Login SMS Code" page is displayed
      And fills "sms_code_inputtext" inputext with otac
      And clicks on the "login_button" button
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | account_type | jira_id      |
          | prepay       | QANOV-230198 |
          | postpay      | QANOV-230199 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A user can see the Login FAQs from "<page>" screen
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "<page>" page
     When clicks on the "login_questions_link" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | page                    | depends_on                | jira_id      |
          | O2de Login Phone Number | QANOV-230192:QANOV-230193 | QANOV-230214 |
          | O2de Login SMS Code     | QANOV-230195              | QANOV-230215 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A user can access to the user/psw login flow from "<page>" screen
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "O2de <page>" page
     When clicks on the "login_with_password_button" button
     Then the "O2de Login Credentials" page is displayed
      And the "Login" header is displayed

    Examples:
          | page               | depends_on                | jira_id      |
          | Login Phone Number | QANOV-230192:QANOV-230193 | QANOV-230218 |
          | Login SMS Code     | QANOV-230195              | QANOV-230219 |

  @jira.QANOV-230221 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230195 @manual @mobile @o2de @regression
  Scenario: A user who didn't receive the SMS code can go back to the "Login Phone Number" screen
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "O2de Login SMS Code" page
     When clicks on the "sms_not_received_link" link
     Then the "O2de Login Phone Number" page is displayed
      And the "Login" header is displayed

  @jira.QANOV-243316 @android @ios @jira.cv.14.2 @manual @mobile @not_hardening @o2de @regression
  Scenario: A user who logged in the app with PIN code is logged out after 6 months (app opened)
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "O2de Login Phone Number" page
     When logs in the application with sms and accepts permissions
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And waits "15552000" seconds
     Then the "O2de Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-270025 @android @ios @jira.cv.14.2 @manual @mobile @not_hardening @o2de @regression
  Scenario: A user who logged in the app with PIN code is logged out after 6 months (app closed)
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "O2de Login Phone Number" page
     When logs in the application with sms and accepts permissions
      And the landing tab page is displayed
      And terminates the app
      And waits "15552000" seconds
      And launches the app
      And the "[CONF:landing_tab]" page is displayed
     Then the "O2de Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-270027 @android @ios @jira.cv.14.2 @manual @mobile @not_hardening @o2de @regression
  Scenario: A user who logged in the app with PIN code is logged out after 6 months (app in background)
    For security reasons, the user will be logged out after 6 months.
    NOTE: the login webview is opened on a modal screen when the user access again to the app after more than 6 months.
    Given user has set the cookies preferences
      And user has a "mobile_line" product
      And user is in the "O2de Login Phone Number" page
     When logs in the application with sms and accepts permissions
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_tab_bar.support_tab" tab
      And the "Support" page is displayed
      And runs the app in the background for "15552000" seconds
      And the "Support" page is displayed
     Then the "O2de Login Credentials" page is displayed
      And the "log_in_again_message" textfield is displayed
      And waits "5" seconds
      And the "Splash Screen" page is displayed

  @jira.QANOV-453622 @android @ber @har @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User access to the "Login" screen
     When clicks on the "start_now" button
      And the "O2es Credentials Login" page is displayed
     Then the "selector_tab.phone_number_selector" tab with "Soy usuario de línea" text is displayed
      And the "selector_tab.password_selector" tab with "Soy titular" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-453623 @android @ber @har @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User can access to the "Soy usuario de línea" tab from the "Soy titular" tab
    Given user is in the "O2es Credentials Login" page
      And the "selector_tab.password_selector" tab is selected
     When clicks on the "selector_tab.phone_number_selector" tab
     Then the "selector_tab.phone_number_selector" tab is selected
      And the "title" textfield with "Introduce tu número de móvil" text is displayed
      And the "description" textfield with "Te enviaremos un código por SMS" text is displayed
      And the "phone_number_field" inputtext with the "Número de teléfono" placeholder is displayed
      And the "continue_button" button with "Acceder" text is displayed
      And the "resgister_link" link with "¿Es tu primera vez en Mi O2? Regístrate" text is displayed
      And the "access_doubts_link" link with "¿Tienes dudas con el acceso? Más información" text is displayed

  @jira.QANOV-453624 @android @ber @har @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A user can log in the app with OTP
    Given user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-453625 @android @ios @jira.cv.Future @manual @mobile @o2es @regression @tbd
  Scenario: User can access to the "Access doubts" screen from the Login screen
    Given user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And clicks on the "access_problems_link" link
     Then the internal webview is displayed
      And the "Ayuda" string is displayed

  @jira.QANOV-453626 @android @ber @har @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user can access to the Mobile Connect screen after inserting a valid phone number
    Given user is in the "O2es Credentials Login" page
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
     Then the "O2es Otac Login" page is displayed
      And the "otac_edit_box" inputtext is displayed
      And the "new_pin_code" link with "solicita uno nuevo" text is displayed
      And the "finalize_button" button with "Finalizar" text is displayed
      And the "cancel_button" button with "Cancelar" text is displayed

  @jira.QANOV-453627 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user without the sim in the device completes the mobile connect authentication successfully
    Given user does not have a "o2es" SIM in the device
      And user is in the "O2es Credentials Login" browser webview
     When clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And fills "otac_edit_box" inputext with otac
      And clicks on the "finalize_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-453628 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can ask for a new PIN
     When user is in the "O2es Credentials Login" page
      And clicks on the "selector_tab.phone_number_selector" tab
      And fills the "phone_number_field" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "O2es Otac Login" page is displayed
      And clicks on the "new_pin_code" link
     Then sms with new pin code is received

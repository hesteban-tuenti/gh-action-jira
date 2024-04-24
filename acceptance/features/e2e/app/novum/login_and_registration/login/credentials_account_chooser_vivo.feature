# -*- coding: utf-8 -*-
@jira.QANOV-345158
Feature: Account Chooser Vivo


  @jira.QANOV-345159 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @sanity
  @vivobr
  Scenario: User without credentials saved will see the Save Credentials page after submitting login credentials
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Vivobr Credentials Login" page
     When fills and submits the login credentials
     Then the "4P Save Credentials" page is displayed
      And the "title" textfield with "Gostaria de salvar seus dados de acesso?" text is displayed
      And the "subtitle" textfield with "Dessa forma, você não vai precisar de confirmação pra iniciar sua sessão em nossos aplicativos nas próximas vezes" text is displayed
      And the "ok_button" button with "Salvar dados" text is displayed
      And the "no_thanks_button" button with "Não, obrigado" text is displayed

  @jira.QANOV-345160 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User can accept saving the credentials in the Save Credentials page
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Vivobr Credentials Login" page
     When fills and submits the login credentials
      And the "4P Save Credentials" page is displayed
      And clicks on the "ok_button" button
     Then the "Welcome Login" page is displayed
      And the credential is saved in 4P

  @jira.QANOV-345161 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can choose not saving the credentials in the Save Credentials screen
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Vivobr Credentials Login" page
     When fills and submits the login credentials
      And the "4P Save Credentials" page is displayed
      And clicks on the "no_thanks_button" button
     Then the "Welcome Login" page is displayed
      And the credential is not saved in 4P

  @jira.QANOV-345162 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can choose to close the screen in Save Credentials screen
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Vivobr Credentials Login" page
     When fills and submits the login credentials
      And the "4P Save Credentials" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Welcome Login" page is displayed
      And the credential is not saved in 4P

  @jira.QANOV-345163 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can see error screen due to lost connectivity
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Vivobr Credentials Login" page
     When turns on the Airplane mode
      And fills and submits the login credentials
     Then the "No Connectivity" page is displayed

  @jira.QANOV-345164 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can see error screen due to backend error
    Given user does not have passwords stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Vivobr Credentials Login" page
     When fills and submits the login credentials
      And there is a backend failure
     Then the "Backend error" page is displayed
      And the "title" textfield with "Não é possível acessar este site" text is displayed
      And the "subtitle" textfield with "vivo.com.br/para-voce demorou muito para responder." text is displayed
      And the "list_header" textfield with "Tente:" text is displayed
      And the "list1" textfield with "· Verificar a Conexão" text is displayed
      And the "list2" textfield with "· Verificar o proxy e o firewall" text is displayed
      And the "list3" textfield with "· Executar o Diagnóstico de Rede do Windows" text is displayed
      And the "foot" textfield with "ERR_CONNECTION_TIME_OUT" text is displayed

  @jira.QANOV-345165 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User can see error pop up when no cookies enabled in the browser
    Given user does not have passwords stored on the default browser
      And cookies are not enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the "No Cookies Enabled" popup is displayed
      And the "popup.title" textfield with "Os cookies estão desabilitados" text is displayed
      And the "popup.message" textfield with "Seu navegador está com cookies ou javascript desabilitados. Por favor, certifique-se de que tudo esteja funcionando e tente novamente" text is displayed
      And the "popup.accept" button with "Ok" text is displayed

  @jira.QANOV-345166 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User can accept error pop up when no cookies enabled in the browser
    Given user does not have passwords stored on the default browser
      And cookies are not enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "No Cookies Enabled" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-345167 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User with one credential saved in the browser previously access again
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "1" credentials saved in 4P
      And credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the "Account Chooser" page is displayed
      And the "vivo_icon" icon is displayed
      And the "title" textfield with "Boas vindas," text is displayed
      And the "subtitle" textfield with "Escolha uma conta do Login Vivo pra acessar Nome Grande de App Parceiro" text is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials
      And the "user_4P_stored_credentials" list contains one element
      And each element in the "user_4P_stored_credentials" list has the "chevron" field
      And each element in the "user_4P_stored_credentials" list has the "saved_credential" field that contains the "*" text
      And the "manage_users" link with "Gerenciar contas" text is displayed
      And the "sign_in_with_another_credential" link with "Usar outra conta" text is displayed

  @jira.QANOV-345168 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User with several credentials saved in the browser previously access again
    Given user has ">1" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "several" credentials saved in 4P
      And credentials are not expired
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the "Account Chooser" page is displayed
      And the "vivo_icon" icon is displayed
      And the "title" textfield with "Boas vindas," text is displayed
      And the "subtitle" textfield with "Escolha uma conta do Login Vivo pra acessar Nome Grande de App Parceiro" text is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials
      And the "user_4P_stored_credentials" list contains >1 element
      And the elements in the "user_4P_stored_credentials" list are ordered by credential date used descendant
      And each element in the "user_4P_stored_credentials" list has the "chevron" field
      And each element in the "user_4P_stored_credentials" list has the "saved_credential" field that contains the "*" text
      And the "manage_users" link with "Gestão de contas" text is displayed
      And the "sign_in_with_another_credential" link with "Usar outra conta" text is displayed

  @jira.QANOV-345169 @android @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can use back control in Account chooser to back to previous screen
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And user has "any" credentials saved in 4P
      And saving credentials are enabled in 4P
      And user is in the "Account Chooser" page
     When clicks on the native "back" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-345170 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can use close control in Account chooser to back to Splash Screen
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Chooser" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-345171 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User can use existing credential to login the app
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Chooser" page
     When clicks on any element in the "user_4P_stored_credentials" list
     Then the landing tab page is displayed

  @jira.QANOV-345172 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User can use the same saved credentials to access through using another account
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And user has "any" credentials saved in 4P
      And saving credentials are enabled in 4P
      And user is in the "Account Chooser" page
     When clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in with the same credentials saved
     Then the "Account Chooser" page is displayed

  @jira.QANOV-345173 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @sanity
  @vivobr
  Scenario: User can use different credentials than savings one to log in the app
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is in the "Account Chooser" page
     When clicks on the "sign_in_with_another_credential" button
     Then the "Vivobr Credentials Login" page is displayed

  @jira.QANOV-345174 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can log out and loging again with valid credential previously saving
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is in the "Profile" page
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed
      And clicks on the "start_now" button
      And the "Account Chooser" page is displayed
      And clicks on any element in the "user_4P_stored_credentials" list
     Then the landing tab page is displayed

  @jira.QANOV-345175 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @smoke
  @vivobr
  Scenario: User can close the app without logout and login again with same credentials
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Profile" page
      And user has the app in "killed" status
     When launches the app
     Then the landing tab page is displayed

  @jira.QANOV-345176 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can access to Account Management
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Chooser" page
     When clicks on the "manage_users" button
     Then the "Account Management" page is displayed
      And the "title" textfield with "Boas vindas," text is displayed
      And the "subtitle" textfield with "Estas são as contas que você pode usar pra acessar o Login Vivo:" text is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials
      And each element in the "user_4P_stored_credentials" list has the "bin_icon" field
      And each element in the "user_4P_stored_credentials" list has the "saved_credential" field that contains the "*" text

  @jira.QANOV-345177 @android @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile
  @regression @vivobr 
  Scenario: User can back from Account Management
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the native "back" button
     Then the "Account Chooser" page is displayed

  @jira.QANOV-345178 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can use close button from Account Management
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-345179 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can see partial expiration in Account Chooser screen when saved cookie is expired
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And at least one of the identities has the saved cookie expired
     When user is in the "Account Management" page
     Then any element in the "user_4P_stored_credentials" list has the "warning_text" textfield with the "Por segurança, digite sua senha novamente para iniciar sessão" text
      And each expired element in the "user_4P_stored_credentials" list has the "warning_icon" field
      And each element in the "user_4P_stored_credentials" list has the "saved_credential" field that contains the "*" text

  @jira.QANOV-345180 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can renew credentials from identities with saved cookie is expired
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And at least one of the identities has the saved cookie expired
      And user is in the "Account Chooser" page
     When clicks on the expired element "chevron_icon" button
      And the "Vivobr Credentials Login" page is displayed
      And fills and submits the login credentials
     Then the "4P Save Credentials" page is displayed

  @jira.QANOV-345181 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can see popup when try to delete credentials from Account Management
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
      And the "bin_icon" icon is displayed
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
     Then the "Delete Account Popup" popup is displayed
      And the "popup.title" textfield with "Quer mesmo apagar a conta?" text is displayed
      And the "popup.message" textfield with "Ao apagar a conta *****(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$, esqueceremos seus dados e você não poderá utilizá-la pra acessar o Login Vivo no futuro" text is displayed
      And the "popup.accept" button with "APAGAR" text is displayed
      And the "popup.cancel" button with "CANCELAR" text is displayed

  @jira.QANOV-345182 @android @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can click on native back when have delete popup
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
      And the "bin_icon" icon is displayed
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
      And the "Delete Account Popup" popup is displayed
      And clicks on the native "back" button
     Then the "Account Management" page is displayed

  @jira.QANOV-345183 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can delete credentials from Account Management
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "several" credentials saved in 4P
      And user is in the "Account Management" page
      And the "bin_icon" icon is displayed
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.accept" button
      And user account is deleted from saving credentials
     Then the "Account Management" page is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list not contains the deleted credentials

  @jira.QANOV-345184 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: The user can cancel the action of deleting a saved account
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
      And the "bin_icon" icon is displayed
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.cancel" button
      And user account is not deleted from saving credentials
     Then the "Account Management" page is displayed
      And the "user_4P_stored_credentials" list is displayed
      And the "user_4P_stored_credentials" list contains the saved credentials

  @jira.QANOV-345185 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @sanity
  @vivobr
  Scenario: The user can delete the last saved account
    Given user has one passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "1" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the "bin_icon" button
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.accept" button
      And user account is deleted from saving credentials
     Then the "Account Empty Case" page is displayed
      And the "title" textfield with "Não há contas disponíveis" text is displayed
      And the "subtitle" textfield with "Por favor, inicie uma nova sessão pra acessar o seu Login Vivo" text is displayed
      And the "login_button" button with "Ir pro início" text is displayed

  @jira.QANOV-345186 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: The user can login after deleting all saved accounts
    Given user has one passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "1" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the "bin_icon" button
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.accept" button
      And user account is deleted from saving credentials
      And the "Account Empty Case" page is displayed
      And clicks on the "login_button" button
     Then the "Vivobr Login Credentials" page is displayed

  @jira.QANOV-345187 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: The user can see error popup when there is a error deleting a saved account
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.accept" button
      And an error occurs when trying to delete an account
     Then the "Delete Error Popup" popup is displayed
      And the "popup.title" textfield with "Algo deu errado" text is displayed
      And the "popup.message" textfield that contains the "Não conseguimos apagar a conta" text is displayed
      And the "popup.accept" button with "Ok, voltar" text is displayed
      And the "popup.cancel" button with "Cancelar" text is displayed

  @jira.QANOV-345188 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: The user can cancel in popup error to cancel operation when there is a error deleting a saved account
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.accept" button
      And an error occurs when trying to delete an account
      And the "Delete Error Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Account Management" page is displayed

  @jira.QANOV-345189 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: The user can accept in popup error to retry operation when there is a error deleting a saved account
    Given user has ">0" passwords stored in the device native browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user is in the "Account Management" page
     When clicks on the "bin_icon" field of "saved_credential" list with "0" index
      And the "Delete Account Popup" popup is displayed
      And clicks on the "popup.accept" button
      And an error occurs when trying to delete an account
      And the "Delete Error Popup" popup is displayed
      And clicks on the "popup.accept" button
      And user account is deleted from saving credentials
     Then the "Account Management" page is displayed

  @jira.QANOV-345190 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User without msisdn saved will see the 4P Save Credentials page after submitting login credentials with OTP
    Given user does not have msisdn stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Vivo Credentials Login" page is displayed
      And fills and submits the login msisdn
     Then the "4P Save Credentials" page is displayed
      And the "title" textfield with "Gostaria de salvar seus dados de acesso?" text is displayed
      And the "subtitle" textfield with "Dessa forma, você não vai precisar de confirmação pra iniciar sua sessão em nossos aplicativos nas próximas vezes" text is displayed
      And the "ok_button" button with "Salvar dados" text is displayed
      And the "no_thanks_button" button with "Não, obrigado" text is displayed

  @jira.QANOV-345191 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can accept saving the msisdn in the 4P Save Credentials page
    Given user does not have msisdn stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Vivo Credentials Login"  page is displayed
      And fills and submits the login msisdn
      And the "4P Save Credentials" page is displayed
      And clicks on the "ok_button" button
     Then the "Welcome Login" page is displayed
      And the credential is saved in 4P

  @jira.QANOV-345192 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can choose not saving the msisdn credentials in the 4P Save Credentials page
    Given user does not have msisdn stored on the default browser
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Vivo Credentials Login"  page is displayed
      And fills and submits the login msisdn
      And the "4P Save Credentials" page is displayed
      And clicks on the "no_thanks_button" button
     Then the "Welcome Login" page is displayed
      And the credential is not saved in 4P

  @jira.QANOV-345193 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User with the msisdn credentials saved in 4p will see the Account Chooser when starting the login with a saved msisdn
    Given user has ">=1" msisdn saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
     Then the "Account Chooser" page is displayed

  @jira.QANOV-345194 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr
  Scenario: User can select the saved msisdn and finish the log in process
    Given user has "1" msisdn saved in 4P
      And cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And user has saved credentials not expired in 4P
      And user is in the "Splash Screen" page
     When clicks on the "start_now" button
      And the "Account Chooser" page is displayed
      And clicks on the "0" element in the "user_4P_stored_msisdn" list
     Then the "Welcome Login" page is displayed

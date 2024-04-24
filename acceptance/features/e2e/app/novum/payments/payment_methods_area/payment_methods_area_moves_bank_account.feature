# -*- coding: utf-8 -*-
@jira.QANOV-291308
Feature: Payment Methods Area with Bank account - moves

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-67968 @android @automatic @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2455
  @jira.link.parent_test_plan.QANOV-319012 @live @mobile @moves @next @smoke
  Scenario: A telco postpay user logged in as admin without a bank account in process of changing can see his/her banks accounts from payment methods
    other_affected_versions="2021-36 2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
     Then the "Bank Account Management" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "main_title" textfield with "Tus cuentas bancarias" text is displayed
      And the "bank_accounts_list" list is displayed
      And each element in the "bank_accounts_list" list has the "description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "last_digits" textfield with the "Termina en [0-9]{2}" format
      And each element in the "bank_accounts_list" list has the "edit" textfield with "Editar" text
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-67970 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-319012 @manual @mobile
  @moves @regression
  Scenario: A telco postpay user logged in as admin with a bank account in process of changing can see his/her banks accounts from payment methods
    other_affected_versions="2021-36 2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "several" plans
      And user has a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
     Then the "Bank Account Management" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "main_title" textfield with "Tus cuentas bancarias" text is displayed
      And the "bank_accounts_list" list is displayed
      And each element in the "bank_accounts_list" list has the "description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "last_digits" textfield with the "Termina en [0-9]{2}" format
      And each element in the "bank_accounts_list" list has the "edit" textfield with "Editar" text
      And each element in the "bank_accounts_list" list has the "associated_products" field
      And any element in the "bank_accounts_list" list has the "changing_label" textfield with the "Pendiente - Puede llevar hasta 24H" text
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

  @jira.<jira_id> @<client> @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-319012 @live @mobile @moves @next
  @qa @sanity
  Scenario Outline: A telco postpay user logged in as admin with bank accounts with associated products can see his/her banks accounts from payment methods
    other_affected_versions="2021-36 2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account with associated products
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "payment_methods_list" list is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
     Then the "Bank Account Management" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "Tus cuentas bancarias" text is displayed
      And the "bank_accounts_list" list is displayed
      And each element in the "bank_accounts_list" list has the "description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "last_digits" textfield with the "Termina en [0-9]{2}" format
      And each element in the "bank_accounts_list" list has the "edit" textfield with "Editar" text
      And any element in the "bank_accounts_list" list has the "associated_products" textfield with the "Ver productos asociados" text
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | client  | page              | jira_id      |
          | android | Invoicing Profile | QANOV-151701 |
          | ios     | Invoicing Profile | QANOV-416556 |

  @jira.QANOV-416557 @webapp @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-319012 @live @mobile @moves @next
  @qa @sanity
  Scenario: A telco postpay user logged in as admin with bank accounts with associated products can see his/her banks accounts from payment methods
    other_affected_versions="2021-36 2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account with associated products
      And user is in the "Start" page
      And user is in the "Choose Payment Method PMA" page
      And waits until the "payment_methods_list" list is displayed
     When clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
     Then the "Bank Account Management" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "Tus cuentas bancarias" text is displayed
      And the "bank_accounts_list" list is displayed
      And each element in the "bank_accounts_list" list has the "description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "last_digits" textfield with the "Termina en [0-9]{2}" format
      And each element in the "bank_accounts_list" list has the "edit" textfield with "Editar" text
      And any element in the "bank_accounts_list" list has the "associated_products" textfield with the "Ver productos asociados" text
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Start" page is displayed

  @jira.QANOV-291309 @android @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-319012 @mobile @moves @qa
  @smoke
  Scenario: A telco postpay user logged in as admin with bank accounts without associated products can see his/her banks accounts from payment methods
    other_affected_versions="2021-36 2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account without associated products
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
     Then the "Bank Account Management" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "main_title" textfield with "Tus cuentas bancarias" text is displayed
      And the "bank_accounts_list" list is displayed
      And each element in the "bank_accounts_list" list has the "description" textfield with "[LANG:payments.bank_account_label]" text
      And each element in the "bank_accounts_list" list has the "last_digits" textfield with the "Termina en [0-9]{2}" format
      And each element in the "bank_accounts_list" list has the "edit" textfield with "Editar" text
      And any element in the "bank_accounts_list" list has the "see_all_associated_products" textfield with the "Consulta en el 1004 los productos asociados a esta cuenta." text
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.<jira_id> @<client> @automatic @jira.cv.12.7 @live @mobile @moves @next @qa @smoke
  Scenario Outline: A telco postpay user logged in as admin can see the associated products in his/her bank account
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account with associated products
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "payment_methods_list" list is displayed
     When clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" page is displayed
      And clicks on the "associated_products" button of "bank_accounts_list" list with "0" index
     Then the "Associated Products" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with the "Productos asociados a la cuenta terminada en [0-9]{2}" format is displayed
      And the "bank_account_products_list" list is displayed
      And the "bank_account_products_message" textfield with "Es posible que esta lista no muestre todos tus productos asociados. Consúltalos en Mis Productos o llamando al 1004." text is displayed
      And the "edit_bank_account" button with "Editar número de cuenta" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And switches to iframe
      And the "<page>" page is displayed

    Examples:
          | client  | page              | jira_id      |
          | android | Invoicing Profile | QANOV-151702 |
          | ios     | Invoicing Profile | QANOV-416558 |

  @jira.QANOV-416559 @webapp @automatic @jira.cv.12.7 @live @mobile @moves @next @qa @smoke
  Scenario: A telco postpay user logged in as admin can see the associated products in his/her bank account
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account with associated products
      And user is in the "Start" page
      And user is in the "Choose Payment Method PMA" page
      And waits until the "payment_methods_list" list is displayed
     When clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" page is displayed
      And clicks on the "associated_products" button of "bank_accounts_list" list with "0" index
     Then the "Associated Products" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with the "Productos asociados a la cuenta terminada en [0-9]{2}" format is displayed
      And the "bank_account_products_list" list is displayed
      And the "bank_account_products_message" textfield with "Es posible que esta lista no muestre todos tus productos asociados. Consúltalos en Mis Productos o llamando al 1004." text is displayed
      And the "edit_bank_account" button with "Editar número de cuenta" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bank Account Management" page is displayed

  @jira.QANOV-67967 @android @automation.hard @impeded_mock @ios @jira.cv.12.7 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin cannot see the bank account if there is an error loading it
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Profile" page
     When clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And an unknown error happens
     Then the "Bank Account Management" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "bank_accounts_list" list is not displayed
      And the "error_title" textfield with "Algo ha ido mal" text is displayed
      And the "error_message" textfield with "Vuelve a intentarlo. Si tu cuenta bancaria no aparece, espera unos minutos" text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-151709 @android @automation.hard @impeded_mock @ios @jira.cv.12.7 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can retry after an error loading bank account
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Profile" page
     When clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And an unknown error happens
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "retry" button
     Then the "Bank Account Edit Form" internal webview is displayed
      And the "bank_accounts_list" list is displayed

  @jira.QANOV-151712 @android @impeded_mock @ios @jira.cv.12.7 @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin without any bank account can see a empty case screen
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Profile" page
      And user does not have a bank account
     When clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
     Then the "No Bank Account" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "bank_account" icon is displayed
      And the "main_title" textfield with "Aún no tienes cuentas guardadas" text is displayed
      And the "informative_text" textfield with "Cuando añadas tus cuentas, podrás verlas aquí." text is displayed

  @jira.QANOV-151703 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67971
  @jira.link.detects.CHECKOUT-2774 @live @mobile @moves @next @regression
  Scenario: A telco postpay user logged in as admin whose bank account is not being changed access to bank account edit from Associated Products
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account with associated products
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "associated_products" button of "bank_accounts_list" list with "0" index
      And the "Associated Products" internal webview is displayed
      And clicks on the "edit_bank_account" button
     Then the "Bank Account Edit Form" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "main_title" textfield with the "Modifica tu cuenta terminada en [0-9]{2}" format is displayed
      And the "description" textfield with "Introduce a continuación el IBAN de tu cuenta. Puedes encontrar este dato en un extracto bancario o en tu banca online." text is displayed
      And the "bank_account_number" inputtext is displayed
      And the "bank_account_number_label" textfield with "[LANG:payments.bank_account_label]" text is displayed
      And the "account_number_message" textfield with "Introduce un IBAN español. Ej: ES11 1111 1111 11 0000111111" text is displayed
      And the "modify" button with "Guardar" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-67972 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67971
  @jira.link.detects.CHECKOUT-2774 @live @mobile @moves @next @regression
  Scenario: A telco postpay user logged in as admin whose bank account is not being changed access to bank account edit from Bank Account Management
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
     Then the "Bank Account Edit Form" internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And the "main_title" textfield with the "Modifica tu cuenta terminada en [0-9]{2}" format is displayed
      And the "description" textfield with "Introduce a continuación el IBAN de tu cuenta. Puedes encontrar este dato en un extracto bancario o en tu banca online." text is displayed
      And the "bank_account_number" inputtext is displayed
      And the "bank_account_number_label" textfield with "[LANG:payments.bank_account_label]" text is displayed
      And the "account_number_message" textfield with "Introduce un IBAN español. Ej: ES11 1111 1111 11 0000111111" text is displayed
      And the "modify" button with "Guardar" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-67973 @android @automatic @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-3581 @live @mobile @moves @next
  @regression
  Scenario: A telco postpay user logged in as admin editing account introduces invalid IBAN. Inline feedback is shown
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And fills the "bank_account_number" inputtext with the "123" text
      And clicks on the "modify" button
     Then the "account_number_message" textfield with "Has introducido un número de cuenta incorrecto" text is displayed
      And the "account_number_message" textfield is displayed in "form_error_red" color
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-151707 @android @automatic @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-3529 @live @mobile @moves @next
  @smoke
  Scenario: A telco postpay user logged in as admin can see a pop-up when trying to edit the bank account
    Valid bank account number: ES60 0049 1500 05 1234567892 (From https://www.iban.es/ejemplos.html)
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And waits until the "bank_account_number" element is visible
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
     Then the "dialog" module is displayed
      And the "dialog.title" textfield with "¿Confirmar cambio de cuenta?" text is displayed
      And the "dialog.message" textfield with "Los productos asociados quedarán ahora vinculados a la nueva cuenta." text is displayed
      And the "dialog.accept" textfield with "Confirmar" text is displayed
      And the "dialog.cancel" textfield with "Cancelar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-151708 @android @manual @ios @jira.cv.12.7 @live @mobile @moves @next @regression
  Scenario: A telco postpay user logged in as admin closes the Bank Account Modification Confirmation popup
    Valid bank account number: ES60 0049 1500 05 1234567892 (From https://www.iban.es/ejemplos.html)
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And waits until the "bank_account_number" element is visible
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "dialog" module is displayed
      And clicks on the "dialog.cancel" button
     Then the "Bank Account Edit Form" internal webview is displayed
      And waits until the "dialog" element is not visible
      And the "dialog" module is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-67974 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2460 @jira.link.detects.CHECKOUT-2461
  @jira.link.detects.CHECKOUT-2462 @jira.link.detects.CHECKOUT-3414 @jira.link.detects.CHECKOUT-3530
  @jira.link.detects.CHECKOUT-3531 @live @manual @mobile @moves @next @smoke
  Scenario: A telco postpay user logged in as admin editing account introduces valid IBAN. Operation is successful
    Valid bank account number: ES60 0049 1500 05 1234567892 (From https://www.iban.es/ejemplos.html)
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And waits until the "bank_account_number" element is visible
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And clicks on the "dialog.accept" button
     Then the "Feedback Bank Account Change Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Has cambiado tu cuenta bancaria correctamente" text is displayed
      And the "success_message" textfield with the "Tu nueva cuenta termina en [0-9]{2}. El cambio puede tardar hasta 24h en hacerse efectivo." format is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-67975 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67974 @jira.link.detects.CHECKOUT-2811 @manual
  @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who changed the IBAN can return to Account from feedback screen
    Valid bank account number: ES60 0049 1500 05 1234567892 (From https://www.iban.es/ejemplos.html)
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And waits until the "main_title" element is visible
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And waits until the "bank_account_number" element is visible
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "dialog" module is displayed
      And clicks on the "dialog.accept" button
      And the "Feedback Bank Account Change Success" page is displayed
      And clicks on the "back" button
     Then the "Account" page is displayed

  @jira.QANOV-67976 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67971 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin editing account introduces valid IBAN. Operation is unsuccesful
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Bank Account Management" page
     When clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "Bank Account Modification Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
      And an unknonw error occurs
     Then the "Feedback Bank Account Change Error" internal webview is displayed
      And the "informative_title" textfield with "Tu cuenta bancaria no se ha modificado" text is displayed
      And the "informative_message" textfield with the "Tu nueva cuenta no se ha podido guardar. Por favor, inténtalo de nuevo." format is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-67977 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67971 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin who received an error while IBAN is being validating can return to the "Profile" page
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Bank Account Management" page
     When clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "Bank Account Modification Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
      And an unknonw error occurs
      And the "Feedback Bank Account Change Error" internal webview is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

  @jira.QANOV-67978 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67971 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin who received an error while IBAN is being validating can retry the validation
    other_affected_versions="2021-36"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Bank Account Management" page
     When clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "Bank Account Modification Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
      And an unknonw error occurs
      And the "Feedback Bank Account Change Error" internal webview is displayed
      And clicks on the "retry" button
     Then the "Bank Account Edit Form" internal webview is displayed

  @jira.QANOV-151710 @android @impeded_mock @ios @jira.cv.12.7 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin editing account introduces valid IBAN. Operation is pending
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Bank Account Management" page
     When clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "Bank Account Modification Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the bank account is proccesing
     Then the "Feedback Bank Account Change Pending" page is displayed
      And the "informative_title" textfield with "Estamos intentando guardar los cambios de tu cuenta bancaria" text is displayed
      And the "informative_message" textfield with the "Vuelve más tarde para comprobar su estado." format is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-151711 @android @impeded_mock @ios @jira.cv.12.7 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who the IBAN is being validating can return to the "Profile" page
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Bank Account Management" page
     When clicks on the "edit" field of "bank_accounts_list" list with "0" index
      And the "Bank Account Edit Form" internal webview is displayed
      And fills the "bank_account_number" inputtext with the "ES6000491500051234567892" text
      And clicks on the "modify" button
      And the "Bank Account Modification Confirmation Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the bank account is proccesing
      And the "Feedback Bank Account Change Error" internal webview is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

  @jira.QANOV-291311 @TBD @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-319012 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin whose bank account is not being changed access to bank account edit webview from Associated Products
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user has a bank account with associated products
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "associated_products" button of "bank_accounts_list" list with "0" index
      And the "Associated Products" internal webview is displayed
      And clicks on the "edit_bank_account" button
     Then the internal webview with "TBD" header is displayed
      And the "TBD" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-291312 @TBD @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-319012 @manual @mobile @moves
  @regression
  Scenario: A telco postpay user logged in as admin whose bank account is not being changed access to bank account edit webview from Bank Account Management
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have a bank account in process of being changed
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" internal webview is displayed
      And clicks on the element with "payment_description" field with "[LANG:payments.bank_account_label]" value of the "payment_methods_list" list
      And the "Bank Account Management" internal webview is displayed
      And clicks on the "edit" field of "bank_accounts_list" list with "0" index
     Then the internal webview with "TBD" header is displayed
      And the "TBD" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

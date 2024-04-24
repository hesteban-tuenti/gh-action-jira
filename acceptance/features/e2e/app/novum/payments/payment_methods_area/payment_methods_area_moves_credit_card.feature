# -*- coding: utf-8 -*-
@jira.QANOV-22071
Feature: Payment Methods Area with Credit Card - moves

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-134836 @android @automatic @ios @jira.cv.12.7 @live @mobile @moves @next @smoke
  Scenario: A telco postpay user logged in as admin can select the payment method after accessing to payment methods
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
     Then the "Choose Payment Method PMA" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "[LANG:payments.choose_payment_method.main_title]" text is displayed
      And the "payment_methods_list" list has "2" elements
      And each element has the "icon" field displayed in the "payment_methods_list" list
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.card_label_pma]" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.bank_account_label]" text
      And switches to original frame
      And the "navigation_tab_bar.account_tab" button is not visible in the actual screen
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-416560 @automatic @jira.cv.12.7 @mobile @moves @qa @smoke @webapp
  Scenario: A telco postpay user logged in as admin can select the payment method after accessing to payment methods in webapp
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Start" page
      And user is in the "Choose Payment Method PMA" page
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
     When waits until the "payment_methods_list" list is displayed
     Then the "main_title" textfield with "[LANG:payments.choose_payment_method.main_title]" text is displayed
      And the "payment_methods_list" list has "2" elements
      And each element has the "icon" field displayed in the "payment_methods_list" list
      And the "0" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.card_label_pma]" text
      And the "1" index in the "payment_methods_list" list has the "payment_description" field with "[LANG:payments.bank_account_label]" text
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Start" page is displayed

  @jira.<jira_id> @<client> @automatic @jira.cv.12.7 @jira.link.detects.CHECKOUT-2841 @live @mobile @moves @next @qa
  @smoke
  Scenario Outline: A telco postpay user logged in as admin can access to the credit card selection screen without saved cards
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And has "0" expired cards saved in the payment methods area
      And user is in the "Choose Payment Method PMA" page
     When waits until the "payment_methods_list" list is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
     Then the "Credit Card Selection PMA" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "Tus tarjetas bancarias" text is displayed
      And the "available_cards_label" textfield with "TARJETAS DISPONIBLES" text is displayed
      And the "available_cards_list_module" element is not on display
      And the "add_card" textfield with "Añadir tarjeta" text is displayed
      And the "chevron" icon is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<page>" page is displayed

    Examples:
          | client  | page              | jira_id      |
          | android | Invoicing Profile | QANOV-151701 |
          | ios     | Invoicing Profile | QANOV-416561 |
          | webapp  | Start             | QANOV-416562 |

  @jira.QANOV-134838 @android @automatic @ber @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2841 @live @mobile @moves
  @next @smoke
  Scenario: A telco postpay user logged in as admin can access to the credit card selection screen with saved cards and without expired cards
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And has "0" expired cards saved in the payment methods area
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
     Then the "Credit Card Selection PMA" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "Tus tarjetas bancarias" text is displayed
      And the "available_cards_label" textfield with "TARJETAS DISPONIBLES" text is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "delete_card" field
      And the "add_card" textfield with "Añadir tarjeta" text is displayed
      And the "chevron" icon is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-134839 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2841 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin can access to the credit card selection screen with saved cards and with expired cards
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And has ">=1" expired cards saved in the payment methods area
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
     Then the "Credit Card Selection PMA" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "Tus tarjetas bancarias" text is displayed
      And the "available_cards_label" textfield with "TARJETAS DISPONIBLES" text is displayed
      And the "cards_list" list is displayed
      And each element in the "cards_list" list has the "company_icon" field
      And each element in the "cards_list" list has the "type" field
      And each element in the "cards_list" list has the "last_digits" field
      And each element in the "cards_list" list has the "expiration" field
      And each element in the "cards_list" list has the "delete_card" field
      And the "add_card" textfield with "Añadir tarjeta" text is displayed
      And the "chevron" icon is displayed
      And the "expired_cards_label" textfield with "TARJETAS CADUCADAS" text is displayed
      And the "expired_cards_list" list is displayed
      And each element in the "expired_cards_list" list has the "company_icon" field
      And each element in the "expired_cards_list" list has the "type" field
      And each element in the "expired_cards_list" list has the "last_digits" field
      And each element in the "expired_cards_list" list has the "expiration" field
      And each element in the "expired_cards_list" list has the "expiration_label" textfield with "Caducada" text
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

  @jira.QANOV-134840 @android @automatic @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2854 @live @mobile @moves @next
  @smoke
  Scenario: A telco admin user clicks on remove card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "delete_card" button of "cards_list" list with "0" index
     Then the "dialog" module is displayed
      And the "dialog.title" textfield with the "¿Quieres eliminar la tarjeta terminada en ••••\d\d\d\d?" format is displayed
      And the "dialog.message" textfield with "Podrás volver a añadirla si lo necesitas." text is displayed
      And the "dialog.accept" textfield with "Confirmar" text is displayed
      And the "dialog.cancel" textfield with "Cancelar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-134841 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134840 @live @mobile @moves @next
  @regression
  Scenario: A telco admin user cancels card removal
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "dialog" module is displayed
      And clicks on the "dialog.cancel" button
      And waits until the "dialog" element is not visible
     Then the "dialog" module is not displayed
      And the "warning.text" textfield is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.QANOV-134842 @android @ber @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134840 @manual @mobile @moves
  @regression
  Scenario: A telco admin user confirms card removal. Card is removed successfully
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "Remove Card Confirmation" popup is displayed
      And clicks on the "dialog.accept" button
      And the card is removed successfully
     Then the "Payment Methods" page is displayed
      And the "first" element of the "cards_list" is deleted
      And the "add_card" textfield with "Añadir tarjeta" text is displayed
      And the "chevron" icon is displayed
      And the "warning" textfield is displayed in "black" color
      And the "warning.text" textfield with the "La tarjeta (Mastercard/Visa) \*\*\*\*\d\d\d\d se ha eliminado correctamente." format is displayed

  @jira.QANOV-134843 @android @automation.hard @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134840
  @jira.link.detects.CHECKOUT-2854 @manual @mobile @moves @regression
  Scenario: A telco admin user confirms card removal. Error removing the card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "Remove Card Confirmation" popup is displayed
      And clicks on the "delete" button
      And there is an error removing the card
     Then the "Payment Methods" page is displayed
      And the "first" element of the "cards_list" is not deleted
      And the "warning" textfield is displayed in "form_error_red" color
      And the "warning.text" textfield with "No se ha podido eliminar tu tarjeta. Por favor, vuelve a intentarlo más tarde." text is displayed

  @jira.QANOV-134844 @android @automation.hard @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134840 @manual @mobile
  @moves @regression
  Scenario: A telco admin user confirms card removal. Card in pending status
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has ">=1" valid cards saved in the payment methods area
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "delete_card" button of "cards_list" list with "0" index
      And the "Remove Card Confirmation" popup is displayed
      And clicks on the "delete" button
      And deleted card status is pending
     Then the "Payment Methods" page is displayed
      And the "first" element of the "cards_list" is not deleted
      And the "warning" textfield is displayed in "form_error_red" color
      And the "warning.text" textfield with "Estamos intentando eliminar tu tarjeta. Vuelve más tarde para comprobar su estado." text is displayed

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @jira.link.detects.CHECKOUT-2731 @jira.link.detects.CHECKOUT-2851
  @live @mobile @moves @next @qa @smoke
  Scenario Outline: A telco admin user can access to the add new card screen
    NOTE: Bug CHECKOUT-2851 is still open, but we have to wait until Truust, who says they can't do the changes due
    the screen must be the same in all flows
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Choose Payment Method PMA" page
     When waits until the "payment_methods_list" list is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
     Then the "Add New Card PMA" page is displayed
      And the "[LANG:profile.dashboard.invoicing.my_payment_methods]" header is displayed
      And the "main_title" textfield with "Añade una tarjeta para realizar tus pagos" text is displayed
      And switches to "form_iframe" iframe
      And waits until the "Tarjetas Aceptadas" text in "valid_cards_info" element is displayed
      And the "valid_cards_info" element is on display
      And the "valid_cards_info" textfield with "Tarjetas Aceptadas" text is displayed
      And the "visa_icon" icon is displayed
      And the "mastercard_icon" icon is displayed
      And the "card_number_label" textfield with "Número de tarjeta" text is displayed
      And the "card_number.icon" icon is displayed
      And the "expiration_date_label" textfield with "Caducidad" text is displayed
      And the "expiration_date.input" inputtext with the "MMAA" placeholder is displayed
      And the "expiration_date.icon" icon is displayed
      And the "cvv_label" textfield with "CVV" text is displayed
      And the "cvv.input" inputtext is displayed
      And the "cvv.info" link is displayed
      And the "card_name.input" inputtext is displayed
      And the "card_name.label" textfield with "Nombre del titular de la tarjeta" text is displayed
      And the "save" button with "[LANG:payments.pay_button]" text is displayed
      And switches to "card_iframe" iframe
      And the "card_number_input" inputtext is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "<page>" page is displayed

    Examples:
          | client  | execution | page              | jira_id      |
          | android | automatic | Invoicing Profile | QANOV-134845 |
          | ios     | manual    | Invoicing Profile | QANOV-198740 |
          | webapp  | automatic | Account           | QANOV-416563 |

  @jira.<jira_id> @<client> @<execution> @jira.cv.12.7 @live @mobile @moves @next @regression
  Scenario Outline: A telco admin user clicks on the CVV (i) link in the add new card screen
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.profile_icon" button
      And the "Profile" page is displayed
      And clicks on the "invoicing_entrypoint" entrypoint
      And the "Invoicing Profile" page is displayed
      And clicks on the "payment_methods_entrypoint" entrypoint
      And the "Choose Payment Method PMA" page is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
      And the "Credit Card Selection PMA" page is displayed
     When clicks on the "chevron" button
      And the "Add New Card PMA" page is displayed
      And switches to "form_iframe" iframe
      And clicks on the "cvv.info" link
     Then the "cvv_text" textfield with "El CVV se encuentra en el reverso de la tarjeta. Está compuesto por tres dígitos." text is displayed
      And switches to original frame

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-134846 |
          | ios     | manual    | QANOV-198741 |

  @jira.QANOV-134848 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2857 @manual @mobile @moves @regression
  Scenario: A telco admin user cannot add a new card without filling all inputs
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And clicks on the "save" button
     Then the "error_message" textfield is displayed
      And the "Add New Card PMA" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.7 @manual @mobile @moves @regression
  Scenario Outline: A telco admin user introduces invalid data in the add new card screen
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And fills the "<field>" inputtext with the "<value>" text
      And clicks on the "save" button
     Then the "<error_field>" textfield with "<feedback_message>" text is displayed

    Examples:
          | field                 | value  | error_field                   | feedback_message                                      | jira_id      |
          | card_number.input     | 404556 | card_number_error_message     | El número de tarjeta no es válido                     | QANOV-134850 |
          | expiration_date.input | 01/    | expiration_date_error_message | Introduce una fecha válida con formato MMAA           | QANOV-134851 |
          | cvv.input             | 11     | cvv_error_message             | El CVV son los tres dígitos del reverso de tu tarjeta | QANOV-134852 |

  @jira.QANOV-416564 @android @ber @ios @jira.cv.12.7 @manual @mobile @moves @smoke
  Scenario: A telco admin user can add a new card successfully from payment methods
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Choose Payment Method PMA" page
     When waits until the "payment_methods_list" list is displayed
      And clicks on the element with "payment_description" field with "Tarjetas de crédito / débito" value of the "payment_methods_list" list
      And the "Credit Card Selection PMA" page is displayed
      And clicks on the "chevron" button
      And the "Add New Card PMA" page is displayed
      And the "main_title" textfield with "Añade una tarjeta para realizar tus pagos" text is displayed
      And switches to "form_iframe" iframe
      And fills the "expiration_date.input" inputtext with the "1240" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And fills the "cvv.input" inputtext with the "123" text
      And switches to "card_iframe" iframe
      And fills the "card_number_input" inputtext with the "5410080000000021" text
      And switches to original frame
      And switches to iframe
      And switches to "form_iframe" iframe
      And the "cvv.input" inputtext is displayed
      And clicks on the "save" button
      And waits "10" seconds
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Has añadido tu tarjeta bancaria correctamente" text is displayed
      And the "success_message" textfield with the "Tu nueva tarjeta termina en /d{4}." format is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-134853 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2839 @jira.link.detects.CHECKOUT-2981
  @jira.link.detects.CHECKOUT-3062 @jira.link.detects.CHECKOUT-3063 @manual @mobile @moves @smoke
  Scenario: A telco admin user can add a new card successfully from payment methods and card is saved
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And card is saved successfully
     Then the "Add New Card Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Has añadido tu tarjeta bancaria correctamente" text is displayed
      And the "success_message" textfield with the "Tu nueva tarjeta termina en /d{4}." format is displayed
      And the "back" button with "Volver" text is displayed
      And the card with "4111111111111111" number is saved
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-134854 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134853 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user returns to Profile after adding a new card successfully
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And card is saved successfully
      And the "Add New Card Success Feedback" page is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

  @jira.QANOV-134855 @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2855 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user adds a new card from payment methods. Error saving the card
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error saving the card
     Then the "Add New Card Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Tu tarjeta no se ha podido guardar" text is displayed
      And the "error_message" textfield with "Por favor, inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the card with "4111111111111111" number is not saved
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-134856 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134855 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user who has an error adding a new card can retry it
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Add New Card PMA" page
     When fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error saving the card
      And the "Add New Card Error Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card PMA" page is displayed

  @jira.QANOV-134857 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134855 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user returns to Profile after adding a new card with an error
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Add New Card PMA" page
     When fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And there is an error saving the card
      And the "Add New Card Error Feedback" page is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

  @jira.QANOV-134858 @android @ios @jira.cv.12.7 @mobile @moves @no_automatable @regression
  Scenario: A telco admin user adds a new card from payment methods. Saved card in pending status
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And saved card status is pending
     Then the "Add New Card Pending Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Estamos intentando guardar tu tarjeta" text is displayed
      And the "info_message" textfield with "Vuelve más tarde para comprobar su estado." text is displayed
      And the "back" button with "Volver" text is displayed
      And the card with "4111111111111111" number is not saved
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-134859 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134858 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user returns to Profile after adding a new card with pending status
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Add New Card PMA" page
     When fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And saved card status is pending
      And the "Add New Card Pending Feedback" page is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

  @jira.QANOV-134860 @android @ios @jira.cv.12.7 @mobile @moves @no_automatable @regression
  Scenario: A telco admin user adds a new card from payment methods. Card is saved previously
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the card with "4111111111111111" number is saved
      And user is in the "Credit Card Selection PMA" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
     Then the "Add New Card Duplicate Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Esta tarjeta ya estaba guardada como método de pago" text is displayed
      And the "info_message" textfield with "Puedes intentar con una tarjeta nueva o consultar las que ya tienes guardadas." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And the card with "4111111111111111" number is not saved
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-134861 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134860 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user who added a duplicate card can retry it
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the card with "4111111111111111" number is saved
      And user is in the "Add New Card PMA" page
     When fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And the "Add New Card Duplicate Feedback" page is displayed
      And clicks on the "retry" button
     Then the "Add New Card PMA" page is displayed

  @jira.QANOV-134862 @android @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-134860 @mobile @moves @no_automatable
  @regression
  Scenario: A telco admin user returns to Profile after adding a duplicate new card
    For LIVE environment, we have to use a real card
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the card with "4111111111111111" number is saved
      And user is in the "Add New Card PMA" page
     When fills the "card_number.input" inputtext with the "4111111111111111" text
      And fills the "expiration_date.input" inputtext with the "12/21" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "save" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And the "Add New Card Duplicate Feedback" page is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

  @jira.QANOV-159580 @android @automation.pending_mock @ios @jira.cv.12.9 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin reaches Payment Provider inactivity timeout in "Add New Card" page
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And waits "900" seconds
     Then the "Feedback Add New Card Timeout Error" page is displayed
      And the "error_title" textfield with "Ha pasado demasiado tiempo." text is displayed
      And the "error_message" textfield with "Puedes intentarlo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-159581 @android @automation.pending_mock @ios @jira.cv.12.9 @jira.link.depends_on.QANOV-159580 @manual
  @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin clicks on retry after timeout error and is redirected to the Add New Card screen
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And waits "900" seconds
      And the "Feedback Add New Card Timeout Error" page is displayed
     When clicks on the "retry" button
     Then the "Add New Card PMA" page is displayed

  @jira.QANOV-159582 @android @automation.pending_mock @ios @jira.cv.12.9 @jira.link.depends_on.QANOV-159580
  @jira.link.detects.CHECKOUT-2811 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin clicks on back after timeout error and is redirected to the profile screen
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Credit Card Selection" page
     When clicks on the "last" element in the "payment_methods_list" list
      And the "Add New Card PMA" page is displayed
      And waits "900" seconds
      And the "Feedback Add New Card Timeout Error" page is displayed
      And clicks on the "back" button
     Then the "Profile" page is displayed

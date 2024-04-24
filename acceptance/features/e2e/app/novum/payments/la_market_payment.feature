# -*- coding: utf-8 -*-
@jira.QANOV-35192 @not_hardening
Feature: LA market payment

  Actions Before the Feature:
    Given user has a "telco" account type
      And user has a "admin" role


  @jira.QANOV-35194 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user with saved cards clicks on pay button in the "Marketplace Purchase Summary" screen with no connectivity
    internal_checkpoint="Implementation as ux. At this point the no connectivity card is not shown ever"
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And turns on the Airplane mode
      And clicks on the "purchase_button" button
     Then the "Save Card Question" page is displayed
      And the "save_card_title" textfield with "¿Quieres que guardemos esta tarjeta para tus próximas compras?" text is displayed
      And the "save_card" button with "Guardar tarjeta" text is displayed
      And the "continue_without_saving_card" button with "Continuar sin guardar" text is displayed

  @jira.QANOV-35196 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user with saved cards clicks on pay button in the "Marketplace Purchase Summary" screen. Error loading the "Credit Card Selection" screen
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And an unknown error happens
     Then the "Save Card Question" page is displayed
      And the "save_card_title" textfield with "¿Quieres que guardemos esta tarjeta para tus próximas compras?" text is displayed
      And the "save_card" button with "Guardar tarjeta" text is displayed
      And the "continue_without_saving_card" button with "Continuar sin guardar" text is displayed

  @<test_priority> @android @ios @jira.<jira_id> @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile
  @moves
  Scenario Outline: A telco admin user with <number_of_saved_cards> saved cards clicks on pay button in the "Marketplace Purchase Summary" screen
    Given user has received a "marketplace_purchase" notification
      And user has "<number_of_saved_cards>" active credit cards saved
      And user has "0" expired credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
     Then the "Credit Card Selection" page is displayed
      And the "Pago Seguro" header is displayed
      And the "main_title" textfield with "Selecciona una tarjeta para pagar" text is displayed
      And the "active_cards_list" list is displayed
      And the "saved_card[<last_card_index>]" element in the "active_cards_list" list has the "brand_icon" field
      And the "saved_card[<last_card_index>]" element in the "active_cards_list" list has the "type" field
      And the "saved_card[<last_card_index>]" element in the "active_cards_list" list has the "last_digits" field
      And the "saved_card[<last_card_index>]" element in the "active_cards_list" list has the "selected" field
      And the "add_card" element in the "active_cards_list" list has the "add_icon" field
      And the "add_card" element in the "active_cards_list" list has the "add_card" textfield with "Añadir tarjeta" text
      And the "add_card" element in the "active_cards_list" list has the "chevron_icon" field
      And the "saved_card[0]" element in the "active_cards_list" list has the "selected" field with "enabled" value
      And the "total_amount" textfield is displayed
      And the "pay" button with "[LANG:payments.pay_button]" text is displayed

    Examples:
          | number_of_saved_cards | last_card_index | test_priority | jira_id     |
          | 1                     | 0               | smoke         | QANOV-35197 |
          | 2                     | 1               | regression    | QANOV-35198 |
          | 5                     | 4               | regression    | QANOV-35199 |

  @jira.QANOV-37918 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that started payment from the payment notification clicks back in the "Credit Card Selection" screen
    Given user is in the "[CONF:landing_tab]" page
      And user has ">0" credit cards saved
      And user has received a "marketplace_purchase" notification
     When clicks on the notification
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-35200 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that started payment from the notifications inbox clicks back in the "Credit Card Selection" screen
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Notification Inbox" page is displayed

  @jira.QANOV-35201 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user can change the selected card in the "Credit Card Selection" screen
    Given user has received a "marketplace_purchase" notification
      And user has "2 " active credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And the "saved_card[0]" element in the "active_cards_list" list has the "selected" field with "enabled" value
      And clicks on the "saved_card[1]" element in the "active_cards_list" list
     Then the "saved_card[0]" element in the "active_cards_list" list has the "selected" field with "disabled" value
      And the "saved_card[1]" element in the "active_cards_list" list has the "selected" field with "enabled" value

  @jira.QANOV-35202 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user chooses to pay with a saved card. Unknown error
    Given user has received a "marketplace_purchase" notification
      And user has ">0" active credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And an unknown error happens
     Then the "LA Payment Generic Error" internal webview is displayed
      And the "generic_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "generic_error_text" textfield with "Estamos solucionando el problema para que puedas completar esta operación. Por favor, vuelve a intentarlo más tarde." text is displayed
      And the "return" button with "Volver" text is displayed

  @jira.QANOV-35203 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user chooses to pay with a saved card, with no connectivity
    Given user has received a "marketplace_purchase" notification
      And user has ">0" active credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And turns on the Airplane mode
      And clicks on the "pay" button
     Then the "No Connectivity" internal webview is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conectividad" text is displayed
      And the "no_connectivity_text" textfield with "Comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-35204 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user who reached the "No Connectivity" screen while choosing to pay with a saved card retries after recovering connectivity
    internal_checkpoint="in this case the retries takes to the "same" screen because the button click does trigger a
    newtwork operation that detects the lack of connectivity"
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And turns on the Airplane mode
      And clicks on the "pay" button
      And the "No Connectivity" internal webview is displayed
      And turns off the Airplane mode
      And clicks on the "retry" button
     Then the "Credit Card Selection" page is displayed

  @jira.QANOV-35205 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @smoke
  Scenario: A telco admin user that selected a saved card using 3d secure proceeds to pay with it
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
     Then the "3D Secure Payment" page is displayed

  @jira.QANOV-35206 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user does no action at the "3D Secure Payment" page
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And waits "900" seconds
     Then the "Feedback LA Payment Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-35207 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user clicks back at the "3D Secure Payment" page
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-35208 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user introduces 3d Secure code and continues payment, without connectivity
    internal_checkpoint="ux extracted from CERT1 experience, production might behave differently"
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And fills the "3d_secure_code" field
      And turns on the Airplane mode
      And clicks on the "confirm" button
      And waits "900" seconds
     Then the "Feedback LA Payment Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-35210 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin introduces 3d Secure code. Unknown Error
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And fills the "3d_secure_code" field
      And clicks on the "confirm" button
      And an unknown error happens
     Then the "LA Payment Generic Error" internal webview is displayed
      And the "generic_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "generic_error_text" textfield with "Estamos solucionando el problema para que puedas completar esta operación. Por favor, vuelve a intentarlo más tarde." text is displayed
      And the "return" button with "Volver" text is displayed

  @jira.QANOV-35211 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user introduces wrong 3d Secure code
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And fills the "3d_secure_code" field with invalid data
      And clicks on the "confirm" button
     Then the "Feedback LA Payment Error" page is displayed
      And the "error_title" textfield with "No se ha podido completar el pago" text is displayed
      And the "error_message" textfield with "Puedes volver a intentarlo en unos minutos." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "return" button with "Volver al inicio" text is displayed

  @jira.QANOV-35212 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @smoke
  Scenario: A telco admin user completes payment with 3d Secure code
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card uses 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And fills the "3d_secure_code" field
      And clicks on the "confirm" button
     Then the "Feedback LA Payment Success" page is displayed
      And the "success_title" textfield with "El pago se ha realizado correctamente" text is displayed
      And the "success_message" textfield with "Puedes volver a tu televisión para ver los detalles de tu pedido." text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-35213 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user proceeds to pay with a saved card not using 3d Secure. Payment completes unsuccessfully
    internal_checkpoint="Can be tested introducing a NOK card in the form to pay with a different card available at the
    CVV Verification For Payment page. Regarding Global Checkout this is equivalent to the failure of a saved card"
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the payment provider returns an Error
     Then the "Feedback LA Payment Error" page is displayed
      And the "error_title" textfield with "No se ha podido completar el pago" text is displayed
      And the "error_message" textfield with "Puedes volver a intentarlo en unos minutos." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "return" button with "Volver al inicio" text is displayed

  @jira.QANOV-35214 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @smoke
  Scenario: A telco admin user proceeds to pay with a saved card not using 3d Secure. Payment completes successfully
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
     Then the "Feedback LA Payment Success" page is displayed
      And the "success_title" textfield with "El pago se ha realizado correctamente" text is displayed
      And the "success_message" textfield with "Puedes volver a tu televisión para ver los detalles de tu pedido." text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-35215 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user proceeds to pay with a saved card not using 3d Secure. Payment Feedback Timeout
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And waits "5" seconds
      And the payment provider did no return feedback
     Then the "Feedback LA Payment Feedback Timeout Error" page is displayed
      And the "error_title" textfield with "Tu solicitud de pago está en proceso" text is displayed
      And the "error_message" textfield with "Consulta el estado de tu pedido en tu televisión." text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-35222 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @smoke
  Scenario: A telco admin user without saved cards clicks on pay button in the "Marketplace Purchase Summary" screen.
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
     Then the "Save Card Question" page is displayed
      And the "save_card_title" textfield with "¿Quieres que guardemos esta tarjeta para tus próximas compras?" text is displayed
      And the "save_card" button with "Guardar tarjeta" text is displayed
      And the "continue_without_saving_card" button with "Continuar sin guardar" text is displayed

  @jira.QANOV-35223 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user with saved cards chooses to pay with new card
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
     Then the "Save Card Question" page is displayed
      And the "save_card_title" textfield with "¿Quieres que guardemos esta tarjeta para tus próximas compras?" text is displayed
      And the "save_card" button with "Guardar tarjeta" text is displayed
      And the "continue_without_saving_card" button with "Continuar sin guardar" text is displayed

  @jira.QANOV-37919 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that started payment from the payment notification clicks back in the "Save Card Question" page
    Given user is in the "Explore" page
      And user has "0" credit cards saved
      And user has received a "marketplace_purchase" notification
     When clicks on the notification
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Explore" page is displayed

  @jira.QANOV-35224 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that started payment from the notification inbox clicks back in the "Save Card Question" page
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Notification Inbox" page is displayed

  @jira.QANOV-35225 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user decides to save the card for his/her LA Payment, with no connectivity
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And turns on the Airplane mode
      And clicks on the "save_card" button
     Then the "No Connectivity" internal webview is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conectividad" text is displayed
      And the "no_connectivity_text" textfield with "Comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-35226 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user decides to not save the card for his/her LA Payment, with no connectivity
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And turns on the Airplane mode
      And clicks on the "continue_without_saving_card" button
     Then the "No Connectivity" internal webview is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conectividad" text is displayed
      And the "no_connectivity_text" textfield with "Comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-35227 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user who reached the "No Connectivity" screen after deciding whether he wants to save or not the card, retries after recovering connectivity
    internal_checkpoint="in this case the retries takes to the "next" screen because the button click does not trigger any
    newtwork operation that detects the lack of connectivity, the network operation happens in the process of loading the
    new screen"
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And turns on the Airplane mode
      And clicks on the "continue_without_saving_card" button
      And the "No Connectivity" internal webview is displayed
      And turns off the Airplane mode
      And clicks on the "retry" button
     Then the "LA Payment With New Card" page is displayed

  @jira.QANOV-35228 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user decides to not save the card for his/her LA Payment. Error opening the "LA Payment With New Card" page
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And an unknown error happens
     Then the "LA Payment Generic Error" internal webview is displayed
      And the "generic_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "generic_error_text" textfield with "Estamos solucionando el problema para que puedas completar esta operación. Por favor, vuelve a intentarlo más tarde." text is displayed
      And the "return" button with "Volver" text is displayed

  @jira.QANOV-35229 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user decides to save the card for his/her LA Payment. Error opening the "LA Payment With New Card" page
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And an unknown error happens
     Then the "LA Payment Generic Error" internal webview is displayed
      And the "generic_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "generic_error_text" textfield with "Estamos solucionando el problema para que puedas completar esta operación. Por favor, vuelve a intentarlo más tarde." text is displayed
      And the "return" button with "Volver" text is displayed

  @jira.QANOV-35230 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user decides to not save the card for his/her LA Payment
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
     Then the "LA Payment With New Card" page is displayed
      And the "Pago Seguro" header is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield is displayed
      And the "card_number_label" textfield with "Número de tarjeta" text is displayed
      And the "card_number" inputtext is displayed
      And the "expiration_label" textfield with "Caducidad" text is displayed
      And the "expiration_date" inputtext is displayed
      And the "cvv_label" textfield with "Código de seguirdad (CVV)" text is displayed
      And the "cvv" inputtext is displayed
      And the "cvv_info" link with "(i)" text is displayed
      And the "card_holder_name_label" textfield with "Nombre del Titular de la tarjeta" text is displayed
      And the "card_holder_name" inputtext is displayed
      And the "pay" button with "Pagar ahora" text is displayed

  @jira.QANOV-35231 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user decides to save the card for his/her LA Payment
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
     Then the "LA Payment With New Card" page is displayed
      And the "Pago Seguro" header is displayed
      And the "total_amount_label" textfield with "Total a pagar" text is displayed
      And the "total_amount" textfield is displayed
      And the "card_number_label" textfield with "Número de tarjeta" text is displayed
      And the "card_number" inputtext is displayed
      And the "expiration_label" textfield with "Caducidad" text is displayed
      And the "expiration_date" inputtext is displayed
      And the "cvv_label" textfield with "Código de seguirdad (CVV)" text is displayed
      And the "cvv" inputtext is displayed
      And the "cvv_info" link with "(i)" text is displayed
      And the "card_holder_name_label" textfield with "Nombre del Titular de la tarjeta" text is displayed
      And the "card_holder_name" inputtext is displayed
      And the "pay" button with "Pagar ahora" text is displayed

  @jira.QANOV-37920 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that started payment from the payment notification clicks back in the "LA Payment With New Card" screen
    Given user is in the "[CONF:landing_tab]" page
      And user has "0" credit cards saved
      And user has received a "marketplace_purchase" notification
     When clicks on the notification
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-35232 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that started payment from the notification inbox clicks back in the "LA Payment With New Card" screen
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Notification Inbox" page is displayed

  @jira.QANOV-35233 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "LA Payment With New Card" screen does no action
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And waits "900" seconds
     Then the "Feedback LA Payment Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-37921 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "LA Payment With New Card" screen does no action with the app in background
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And runs the app in the background for "901" seconds
     Then the "Feedback LA Payment Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-35234 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "LA Payment With New Card" screen introduces card data and clicks on pay with no connectivity
    internal_checkpoint="ux extracted from CERT1 experience, production might behave differently"
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And turns on the Airplane mode
      And clicks on the "pay" button
      And waits "900" seconds
     Then the "Feedback LA Payment Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-35235 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "LA Payment With New Card" screen introduces card data for a card requiring 3d secure and clicks on pay
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
     Then the "3D Secure Payment" page is displayed

  @jira.QANOV-35236 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user paying with new card does no action in the "3D Secure Payment" screen
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And waits "900" seconds
     Then the "Feedback LA Payment Timeout Error" page is displayed
      And the "error_title" textfield with "El pago no se ha completado" text is displayed
      And the "error_message" textfield with "Por tu seguridad, cancelamos la transacción si tardas demasiado en introducir los datos de la tarjeta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-37922 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user paying with new card that started payment from the payment notification clicks back in the "3D Secure Payment" screen
    Given user is in the "Profile" page
      And user has "0" credit cards saved
      And user has received a "marketplace_purchase" notification
     When clicks on the notification
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Profile" page is displayed

  @jira.QANOV-35237 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user paying with new card that started payment from the notification inbox clicks back in the "3D Secure Payment" screen
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Notification Inbox" page is displayed

  @jira.QANOV-35238 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "LA Payment With New Card" screen completes payment with 3d secure
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And fills the "3d secure code"
      And clicks the "confirm" button
     Then the "Feedback LA Payment Success" page is displayed
      And the "success_title" textfield with "El pago se ha realizado correctamente" text is displayed
      And the "success_message" textfield with "Puedes volver a tu televisión para ver los detalles de tu pedido." text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-35239 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @smoke
  Scenario: A telco admin user completes LA Payment with a new card not requiring 3d secure
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
     Then the "Feedback LA Payment Success" page is displayed
      And the "success_title" textfield with "El pago se ha realizado correctamente" text is displayed
      And the "success_message" textfield with "Puedes volver a tu televisión para ver los detalles de tu pedido." text is displayed
      And the "back" button with "Volver al inicio" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-35240 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user completes LA Payment with a new card not requiring 3d secure. Payment is unsuccessful
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the payment provider returns an error
     Then the "Feedback LA Payment Error" page is displayed
      And the "error_title" textfield with "No se ha podido completar el pago" text is displayed
      And the "error_message" textfield with "Puedes volver a intentarlo en unos minutos." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "return" button with "Volver al inicio" text is displayed

  @jira.QANOV-35241 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user completes LA Payment with a new card with 3d secure. Payment is unsuccessful
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the "3D Secure Payment" page is displayed
      And fills the "3d secure code"
      And clicks the "confirm" button
      And the payment provider returns an error
     Then the "Feedback LA Payment Error" page is displayed
      And the "error_title" textfield with "No se ha podido completar el pago" text is displayed
      And the "error_message" textfield with "Puedes volver a intentarlo en unos minutos." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "return" button with "Volver al inicio" text is displayed

  @jira.QANOV-35242 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin completes payment with a new card. LA Payment Feedback Timeout
    Given user has received a "marketplace_purchase" notification
      And user has ">0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "add_icon" field
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And waits "5" seconds
      And the payment provider did no return feedback
     Then the "Feedback LA Payment Feedback Timeout Error" page is displayed
      And the "error_title" textfield with "Tu solicitud de pago está en proceso" text is displayed
      And the "error_message" textfield with "Consulta el estado de tu pedido en tu televisión." text is displayed
      And the "back" button with "Volver al inicio" text is displayed

  @jira.QANOV-35243 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @smoke
  Scenario: A telco admin that choosed to save the new card completed payment succesfully with a card not using 3d secure
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "save_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
     Then the "Feedback LA Payment Success" page is displayed
      And the card is saved

  @jira.QANOV-35244 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin that choosed to save the new card completed payment unsuccessfully
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "save_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the payment provider returns an error
     Then the "Feedback LA Payment Error" page is displayed
      And the card is not saved

  @jira.QANOV-35245 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin that choosed to not save the new card completed payment with a card not using 3d secure
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
     Then the "Feedback LA Payment Success" page is displayed
      And the card is not saved

  @jira.QANOV-35246 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "Feedback LA Payment Success" screen returns to account
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "Feedback LA Payment Success" page is displayed
      And clicks on the "return" button
     Then the "MovesAccount" page is displayed

  @jira.QANOV-35247 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "Feedback LA Payment Feedback Timeout" screen returns to account
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And waits "5" seconds
      And the payment provider did no return feedback
      And the "Feedback LA Payment Feedback Timeout Error" page is displayed
      And clicks on the "return" button
     Then the "MovesAccount" page is displayed

  @jira.QANOV-35248 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "Feedback LA Payment Error" screen returns to account
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the payment provider returns an error
      And the "Feedback LA Payment Error" page is displayed
      And clicks on the "return" button
     Then the "MovesAccount" page is displayed

  @jira.QANOV-35249 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user paying with a saved card in the "Feedback LA Payment Error" screeen returns to "Credit Card Selection" screen
    internal_checkpoint="Can be tested introducing a NOK card in the form to pay with a different card available at the
    CVV Verification For Payment page. Regarding Global Checkout this is equivalent to the failure of a saved card"
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the payment provider returns an error
      And the "Feedback LA Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "Credit Card Selection" page is displayed

  @jira.QANOV-35250 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user paying with a new card in "Feedback LA Payment Error" screen retries payment
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And the payment provider returns an error
      And the "Feedback LA Payment Error" page is displayed
      And clicks on the "retry" button
     Then the "LA Payment With New Card" page is displayed

  @jira.QANOV-35252 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "LA Payment Generic Error" screen returns to account
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And fills the "card_number" inputtext with the "TBD" text
      And fills the "expiration_date" inputtext with the "TBD" text
      And fills the "cvv" inputtext with the "TBD" text
      And fills the "card_holder_name" inputtext with the "TBD" text
      And clicks on the "pay" button
      And an unknown error happens
      And the "LA Payment Generic Error" internal webview is displayed
      And clicks on the "return" button
     Then the "MovesAccount" page is displayed

  @jira.QANOV-37404 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "Feedback LA Payment Timeout Error" screen returns to account
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And waits "900" seconds
      And the "Feedback LA Payment Timeout Error" page is displayed
      And clicks on the "back" button
     Then the "MovesAccount" page is displayed

  @jira.QANOV-37405 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user in the "Feedback LA Payment Timeout Error" screen retries payment
    Given user has received a "marketplace_purchase" notification
      And user has "0" credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Save Card Question" page is displayed
      And clicks on the "continue_without_saving_card" button
      And the "LA Payment With New Card" page is displayed
      And waits "900" seconds
      And the "Feedback LA Payment Timeout Error" page is displayed
      And clicks on the "retry" button
     Then the "LA Payment With New Card" page is displayed

  @jira.QANOV-37923 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user restarts LA payment flow from a notification corresponding to an already completed payment
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And clicks on the "pay" button
      And the "Feedback LA Payment Success" page is displayed
      And clicks on the "return" button
      And the "MovesAccount" page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "notifications_icon" button
      And the "Notifications Inbox" page is displayed
      And clicks on the "marketplace_notification" element in the "profile_inbox_list" list
     Then the "LA Payment Generic Error" internal webview is displayed
      And the "generic_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "generic_error_text" textfield with "Estamos solucionando el problema para que puedas completar esta operación. Por favor, vuelve a intentarlo más tarde." text is displayed
      And the "return" button with "Volver" text is displayed

  @jira.QANOV-37924 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user retries LA payment by clicking again on the notification
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the saved card does not use 3d Secure
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
      And clicks on the "pay" button
      And the "CVV Verification For Payment" page is displayed
      And fills the "CVV" field
      And the payment provider returns an error
      And the "Feedback LA Payment Error" page is displayed
      And clicks on the "return" button
      And the "MovesAccount" page is displayed
      And user is in the "Notification Inbox" page
      And clicks on the "marketplace_notification" element in the "profile_inbox_list" list
     Then the "Marketplace Purchase Summary" page is displayed

  @android @ios @jira.<jira_id> @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @regression
  Scenario Outline: A telco admin user with a card of <brand> brand in active status saved reaches "Credit Card Selection" page
    Given user has received a "marketplace_purchase" notification
      And user has "1" active credit cards saved
      And the credit card is of "<brand>" brand
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
     Then the "<brand_icon>" element is displayed

    Examples:
          | brand           | brand_icon                   | jira_id     |
          | Visa            | visa_active_icon             | QANOV-44676 |
          | MasterCard      | mastercard_active_icon       | QANOV-44677 |
          | AmericanExpress | american_express_active_icon | QANOV-44678 |

  @android @ios @jira.<jira_id> @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @regression
  Scenario Outline: A telco admin user with a card of <brand> brand in expired status saved reaches "Credit Card Selection" page
    Given user has received a "marketplace_purchase" notification
      And user has "1" expired credit cards saved
      And the credit card is of "<brand>" brand
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
      And the "Credit Card Selection" page is displayed
     Then the "<brand_icon>" element is displayed

    Examples:
          | brand           | brand_icon                    | jira_id     |
          | Visa            | visa_expired_icon             | QANOV-44679 |
          | MasterCard      | mastercard_expired_icon       | QANOV-44680 |
          | AmericanExpress | american_express_expired_icon | QANOV-44681 |

  @android @ios @jira.<jira_id> @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves @regression
  Scenario Outline: A telco admin user that has <number_of_cards> expired credit cards saved and does not have cards saved in other status reaches "Credit Card Selection" page
    Given user has received a "marketplace_purchase" notification
      And user has "<number_of_cards>" expired credit cards saved
      And user has "0" active credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
     Then the "Credit Card Selection" page is displayed
      And the "Pago Seguro" header is displayed
      And the "main_title" textfield with "Selecciona una tarjeta para pagar" text is displayed
      And the "active_cards_list" list is displayed
      And the "active_cards_list" length is 1
      And the "add_card" element in the "active_cards_list" list has the "add_icon" field
      And the "add_card" element in the "active_cards_list" list has the "add_card" textfield with "Añadir tarjeta" text
      And the "add_card" element in the "active_cards_list" list has the "chevron_icon" field
      And the "expired_title" textfield with "TARJETAS CADUCADAS" text is displayed
      And the "expired_cards_list" list is displayed
      And the "saved_card[<last_card_index>]" element in the "expired_cards_list" list has the "brand_icon" field
      And the "saved_card[<last_card_index>]" element in the "expired_cards_list" list has the "type" field
      And the "saved_card[<last_card_index>]" element in the "expired_cards_list" list has the "last_digits" field
      And the "saved_card[<last_card_index>]" element in the "expired_cards_list" list does not have the "selected" field
      And the "total_amount" textfield is displayed
      And the "pay" button is not displayed

    Examples:
          | number_of_cards | last_card_index | jira_id     |
          | 1               | 0               | QANOV-44682 |
          | 2               | 1               | QANOV-44683 |
          | 5               | 4               | QANOV-44684 |

  @jira.QANOV-44685 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-37175 @manual @mobile @moves
  @regression
  Scenario: A telco admin user that has expired and active credit cards saved reaches "Credit Card Selection" page
    Given user has received a "marketplace_purchase" notification
      And user has "1" saved credit cards saved
      And user has "1" expired credit cards saved
      And user is in the "Notification Inbox" page
     When clicks on the "marketplace_notification" element in the "profile_inbox_list" list
      And the "Marketplace Purchase Summary" page is displayed
      And clicks on the "purchase_button" button
     Then the "Credit Card Selection" page is displayed
      And the "Pago Seguro" header is displayed
      And the "main_title" textfield with "Selecciona una tarjeta para pagar" text is displayed
      And the "active_cards_list" list is displayed
      And the "saved_card[0]" element in the "active_cards_list" list has the "brand_icon" field
      And the "saved_card[0]" element in the "active_cards_list" list has the "type" field
      And the "saved_card[0]" element in the "active_cards_list" list has the "last_digits" field
      And the "saved_card[0]" element in the "active_cards_list" list has the "selected" field
      And the "add_card" element in the "active_cards_list" list has the "add_icon" field
      And the "add_card" element in the "active_cards_list" list has the "add_card" textfield with "Añadir tarjeta" text
      And the "add_card" element in the "active_cards_list" list has the "chevron_icon" field
      And the "saved_card[0]" element in the "active_cards_list" list has the "selected" field with "enabled" value
      And the "expired_title" textfield with "TARJETAS CADUCADAS" text is displayed
      And the "expired_cards_list" list is displayed
      And the "saved_card[0]" element in the "expired_cards_list" list has the "brand_icon" field
      And the "saved_card[0]" element in the "expired_cards_list" list has the "type" field
      And the "saved_card[0]" element in the "expired_cards_list" list has the "last_digits" field
      And the "saved_card[0]" element in the "expired_cards_list" list does not have the "selected" field
      And the "total_amount" textfield is displayed
      And the "pay" button is displayed

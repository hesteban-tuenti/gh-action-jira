# -*- coding: utf-8 -*-
@jira.QANOV-95736
Feature: Recurrent Payment Deactivation

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-95737 @android @automatic @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1808 @mobile @qa @sanity @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can access to the screen to disable the service
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
     Then the "dialog" module is displayed
      And the "dialog.title" textfield with "Tem certeza que deseja desativar?" text is displayed
      And the "dialog.message" textfield with "Ao desativar, você perde a comodidade de não se preocupar com o vencimento. Com isso, vai ser preciso pagar suas faturas de outras formas, ok?" text is displayed
      And the "dialog.accept" button with "Desativar" text is displayed
      And the "dialog.cancel" button with "Manter ativado" text is displayed

  @jira.QANOV-95738 @android @automatic @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95737 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1808 @mobile @qa @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled can close the "Disable Recurrent Payment Popup" popup
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "dialog" module is displayed
      And clicks on the "dialog.cancel" button
     Then the "Manage Recurrent Payment" page is displayed
      And the "dialog" module is not displayed

  @jira.QANOV-95739 @android @ber @ios @jira.cv.12.8 @jira.link.CHECKOUT-3450 @jira.link.depends_on.QANOV-95737
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1808 @automatic @mobile @qa @smoke @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled disables Recurrent Payment successfully
    other_affected_versions="2021-50"
    The OB system will send an SMS notifying the customer that the feature has been deactivated
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "dialog" module is displayed
      And clicks on the "dialog.accept" button
      And switches to original frame
     Then the "Feedback Payment Success" page is displayed
      And the "success_title" textfield with "Tudo certo!" text is displayed
      And the "success_message1" textfield with the "Você desativou o pagamento automático com o cartão ••••\d\d\d\d." format is displayed
      And the "success_message2" textfield with "Pode ser que seu próximo pagamento ainda aconteça nesse cartão, confira na sua fatura." text is displayed
      And the "ok_button" button with "Ok, ir pro início" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-95740 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95739 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1808 @manual @mobile @qa @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled returns to Account after disabling Recurrent Payments
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "dialog" module is displayed
      And clicks on the "dialog.accept" button
      And the "Feedback Payment Success" page is displayed
      And switches to original frame
      And clicks on the "back" entrypoint
     Then the "Account" page is displayed

  @jira.QANOV-95741 @android @impeded_mock @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95737 @old_app
  @jira.link.parent_test_plan.QANOV-78038 @jira.link.tests.CHECKOUT-1808 @manual @mobile @regression @vivobr
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled tries to disable Recurrent Payment with an error
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Disable Recurrent Payment Popup" popup is displayed
      And clicks on the "popup.accept" button
      And there is an error disabling recurrent payment
     Then the "Feedback Recurrent Payment Deactivated Error" page is displayed
      And the "error_title" textfield with "Algo deu errado por aqui" text is displayed
      And the "error_message" textfield with "Tivemos um problema pra desativar seu pagamento automático. Você pode tentar de novo agora ou fazer isso mais tarde se o problema continuar." text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed

  @jira.QANOV-95742 @android @ios @jira.cv.12.8 @jira.link.depends_on.QANOV-95737 @jira.link.parent_test_plan.QANOV-78038
  @jira.link.tests.CHECKOUT-1808 @manual @mobile @regression @vivobr @old_app
  Scenario: A no legacy user with several cards saved and with recurrent payment enabled tries to disable Recurrent Payment with unknown result
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has ">=1" valid cards saved in the payment methods area
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Bills" page
     When clicks on the "bills_settings.recurrent_payment_entrypoint" entrypoint
      And the "Manage Recurrent Payment" page is displayed
      And clicks on the "chevron" button of "other_options_list" list with "1" index
      And the "Disable Recurrent Payment Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the result of the payment is unknown
     Then the "Feedback Recurrent Payment Deactivated Error" page is displayed
      And the "unknown_result_title" textfield with "Estamos tentando desativar seu pagamento automático ainda" text is displayed
      And the "unknown_result_message" textfield with "Você pode voltar depois pra ver se deu tudo certo" text is displayed
      And the "retry" button with "Tentar de novo" text is displayed
      And the "back" button with "Ok, ir pro início" text is displayed

  @jira.QANOV-95744 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-78038 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Recurrent payment service is disabled when user has an expired card
    other_affected_versions="2021-50"
    Given user is not a "legacy;control_n;jeri" account type
      And user is not a "siebel" plan
      And user has "recurrent_payment" service in "configured" status
      And has "1" valid cards saved in the payment methods area
      And has "1" expired credit cards saved
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Cartão de crédito" entrypoint configured in CMS for the "invoices-settings-invoices-list" list
      And user is in the "Account" page
     When the recurrent payment date is reached
      And clicks on the "bills" entrypoint
     Then the "Bills" page is displayed
      And the "bills_settings.recurrent_payment_title_textfield" textfield with "Cartão de crédito" text is displayed
      And the "bills_settings.recurrent_payment_status_textfield" textfield with "Desativado" text is displayed

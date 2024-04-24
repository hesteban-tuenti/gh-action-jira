@jira.QANOV-9397
Feature: Add more credit (anticipo)


  Actions Before the Feature:
    Given user has a "legado prepay" account type
     And user has the "services-summary" module configured in CMS for "dashboard" page


  @jira.QANOV-9399 @android @ios @mobile @jira.cv.11.2 @no_automatable @impeded_legacy
  @jira.link.relates_to.NOV-119896 @moves @regression
  Scenario: Prepay user accesses "Anticipo de saldo" screen: User is eligible for a loan topup
    internal_checkpoint="
    Note that the the eligibility for an anticipo is returned by the OB in an API, not processed by NOVUM"
    Given user does not have any pending debt to pay
      And user has done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "balance_loan" entrypoint
     Then the "Balance Loan Informative" page is displayed
      And the "Anticipo de saldo" header is displayed
      And the "balance_loan_summary" textfield with "Solicita 5,00 € de anticipo de saldo" text is displayed
      And the "balance_loan_description" textfield with "Te adelantamos 5 € y nos lo devuelves en la siguiente recarga. Coste (1€/anticipo IVA incluido). Para que te anticipemos saldo debes haber recargado en los 90 días previos a la solicitud y no tener deuda pendiente por éste u otro servicio" text is displayed
      And the "phone_number_field_title" textfield with "Línea" text is displayed
      And the "phone_number_field_number" textfield with the "6XX XX XX XX" format is displayed
      And the "top_up_amount_field_title" textfield with "Cantidad" text is displayed
      And the "top_up_amount_field_amount" textfield with "5,00 €" text is displayed
      And the "loan_request" button with "Solicitar anticipo" text is displayed


  @jira.QANOV-9401 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9399
  @jira.link.relates_to.NOV-119898 @moves @regression @impeded_legacy
  Scenario: User successfully completes a loan topup: Confirmation screen is shown
    internal_checkpoint="
    Balance loan takes a long time to be updated in dashbaord. This TC needs to be reviewed carefully on 11.3 version"
    Given user does not have any pending debt to pay
      And user has done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Balance Loan Informative" page
     When clicks on the "loan_request" button
     Then the "Feedback Success" page is displayed
      And the "positive_feedback_icon" icon is displayed
      And the "success_title" textfield with the "Se ha procesado tu solicitud de X€ de anticipo de saldo" format is displayed
      And the "success_message" textfield with "En breve recibirás un mensaje de confirmación" text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed


  @jira.QANOV-9403 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9401
  @jira.link.relates_to.NOV-119900 @moves @regression @impeded_legacy
  Scenario: User goes back to main account screen after a successfully topup loan request
    Given user does not have any pending debt to pay
      And user has done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Balance Loan Informative" page
     When clicks on the "loan_request" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed


  @jira.QANOV-9405 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9401
  @moves @regression @impeded_legacy
  Scenario: User complete a balance loan: User can see the loan in the last movements view
    Given user who already done a balance loan
      And user has the "latest-movements" module configured in CMS for "dashboard" page
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "last_movements" entrypoint
     Then the "Movements" page is displayed
      And the "movements.events_list" list is displayed
      And each element in the "movements.events_list" list has the "date" textfield with the "\d{1,2}\/\d{1,2}\/\d{4}" format
      And each element in the "movements_by_date" list within the "movements.events_list" list has the "icon" field
      And the "last" element in the "movements_by_date" list within the "movements.events_list" list has the "balance_loan_icon" field
      And the "last" element in the "movements_by_date" list within the "movements.events_list" list has the "movement_type" textfield with "Anticipo de saldo" text
      And the "last" element in the "movements_by_date" list within the "movements.events_list" list has the "movement_time" textfield with the "XX:XX" format
      And the "last" element in the "movements_by_date" list within the "movements.events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format


  @jira.QANOV-9408 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9399
  @jira.link.relates_to.NOV-119902 @moves @regression @impeded_legacy
  Scenario: Prepay user cannot complete a loan topup: Error screen is shown
    Given user does not have any pending debt to pay
      And user has done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Balance Loan Informative" page
     When clicks on the "loan_request" button
      And an error happens during the operation
     Then the "Feedback Ko" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield is displayed
      And the "negative_feedback_subtitle" textfield is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And the "retry" button with "Intentar de nuevo" text is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Balance Loan Informative" page is displayed


  @jira.QANOV-9411 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9408
  @jira.link.relates_to.NOV-119905 @moves @regression @impeded_legacy
  Scenario: User can retry a loan topup after an error processing the initial request
    Given user does not have any pending debt to pay
      And user has done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Balance Loan Informative" page
     When clicks on the "loan_request" button
      And an error happens during the operation
      And the "Feedback Ko" page is displayed
      And clicks on the "retry" button
     Then the "Balance Loan Informative" page is displayed
      And the "Anticipo de saldo" header is displayed


  @jira.QANOV-9416 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.depends_on.QANOV-9408
  @jira.link.relates_to.NOV-119903 @moves @regression @impeded_legacy
  Scenario: User goes back to main account screen after an error during topup loan request
    Given user does not have any pending debt to pay
      And user has done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Balance Loan Informative" page
     When clicks on the "loan_request" button
      And an error happens during the operation
      And the "Feedback Ko" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed


  @jira.QANOV-9419 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.relates_to.NOV-119906
  @moves @regression @impeded_legacy
  Scenario: Prepay user accesses "Anticipo de saldo" screen: Service is not available
    Given the "balance_loan" service is unavailabe
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "balance_loan" entrypoint
     Then the "Balance Loan Informative" page is displayed
      And the "Anticipo de saldo" header is displayed
      And the "balance_loan_summary" textfield with "Lo sentimos, el servicio de anticipo de saldo no está disponible" text is displayed
      And the "balance_loan_description" textfield with "Vuelva a intentarlo más tarde" text is displayed


  @jira.QANOV-9422 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.relates_to.NOV-119897
  @moves @regression @impeded_legacy
  Scenario: Prepay user accesses "Anticipo de saldo" screen: User is NOT eligible for a loan topup (Pending debt)
    internal_checkpoint="
    Note that the the eligibility for an anticipo is returned by the OB in an API, not processed by NOVUM
    No 'Recargar saldo' button will be shown user elegilibility for topup is returned by an OB API"
    Given user have any pending debt to pay
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "balance_loan" entrypoint
     Then the "Balance Loan Informative" page is displayed
      And the "Anticipo de saldo" header is displayed
      And the "balance_loan_summary" textfield with "No tienes anticipos disponibles" text is displayed
      And the "balance_loan_because" textfield with "Puede ser porque" text is displayed
      And the "balance_loan_bullet_1" textfield with "No has recargado en los 90 días previos a la solicitud y tienes deduda pendiente por este u otro servicio" text is displayed
      And the "balance_loan_bullet_2" textfield with "Tienes un anticipo pendiente" text is displayed
      And the "balance_loan_bullet_3" textfield with "Tienes pendiente la devolución de una renovación de Tarifa por Siempre Conectado" text is displayed
      And the "loan_request" button is not displayed


  @jira.QANOV-9424 @android @ios @mobile @jira.cv.11.2 @no_automatable @jira.link.relates_to.NOV-119897
  @moves @regression @impeded_legacy
  Scenario: Prepay user accesses "Anticipo de saldo" screen: User is NOT eligible for a loan topup (Didnt make a top-up in the last 3 months)
    internal_checkpoint="
    Note that the the eligibility for an anticipo is returned by the OB in an API, not processed by NOVUM
    No 'Recargar saldo' button will be shown user elegilibility for topup is returned by an OB API"
    Given user has not done a top up in the previous "3" months
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "balance_loan" entrypoint
     Then the "Balance Loan Informative" page is displayed
      And the "Anticipo de saldo" header is displayed
      And the "balance_loan_because" textfield with "Puede ser porque" text is displayed
      And the "balance_loan_bullet_1" textfield with "No has recargado en los 90 días previos a la solicitud y tienes deduda pendiente por este u otro servicio" text is displayed
      And the "balance_loan_bullet_2" textfield with "Tienes un anticipo pendiente" text is displayed
      And the "balance_loan_bullet_3" textfield with "Tienes pendiente la devolución de una renovación de Tarifa por Siempre Conectado" text is displayed
      And the "loan_request" button is not displayed

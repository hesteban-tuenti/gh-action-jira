@jira.QANOV-8556
Feature: Used landline minutes/others

  Actions Before the Feature:
      And user has a "landline" product

  @jira.QANOV-8558 @ber @android @ios @mobile @jira.cv.10.4 @automatic
  @jira.link.relates_to.NOV-47785 @moves @sanity @qa @webapp
  Scenario: Admin user who has landline calls can see the detailed minutes consumption
    QA user to test: Fusion: qamoves-1
    Given user has a "admin" role
      And user has made consumption on the "minutes" allowances in the "landline" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user is in the "Landline Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "minutes" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de llamadas" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "(\s?\d{1,2}(min|s|h)){1,3}" format is displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bundle_list_title" textfield with "Tus bonos de minutos" text is displayed
      And the "bundle_list" list is displayed
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "duration" textfield with the "\d{1,2}:\d\d (\s?\d{1,2}(min|s|h)){1,3}" format
      And each element in the "events_list" list has the "type_of_call" textfield with the "Llamada - (Saliente|Entrante)" format
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-8564 @android @ios @mobile @jira.cv.10.4 @automatic @jira.link.relates_to.NOV-47790
  @moves @smoke @qa @live @cert2 @next @webapp
  Scenario: Admin user without landline calls can access the detailed minutes consumption screen
    commented_tags="@depends_on.NOV-47673"
    other_affected_versions="2021-45-B"
    Given user has a "admin" role
      And user has not made consumption on the "minutes" allowances in the "landline" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Landline Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "minutes" tab is selected
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "amount_consumed.value" textfield with "0min" text is displayed
      And the "extra_charges.value" textfield with "0,00 €" text is displayed
      And the "consumption_graph" graph is not displayed
      And the "events_list" list is not displayed
      And the "consumption_empty_case_icon" icon is displayed
      And the "consumption_empty_case_title" textfield with "Aquí verás el detalle de los minutos consumidos" text is displayed


  @jira.QANOV-8570 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.depends_on.QANOV-8558
  @jira.link.relates_to.NOV-47791 @moves @regression @impeded_mock @automation.pending_env
  Scenario: Admin user who has some other expenses is able to see the details of other expenses
    Given user has a "admin" role
      And user has made consumption on the "others" allowances in the "landline" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-others" page for the "landline" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-others" page for the "landline" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-others" page for the "landline" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "consumption-counters-landline" module configured in CMS for "landline" page for the "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Consumption" page
     When clicks on the "others" icon
     Then the "others" tab is selected
      And the "others.info" icon is displayed
      And the "others.consumption_title" textfield with "Otros consumos" text is displayed
      And the "others.amount_consumed" module is displayed
      And the "others.extra_charges" module is displayed
      And the "others.graph" graph is displayed
      And the billing period is displayed in the "others.graph.x" axis
      And the charges are displayed in the "others.graph.y" axis
      And the "selected_day_label.selected_day" line is displayed in the "today" day
      And the "events_list" list is displayed
      And each element in the "others.others_by_day_list" list has the "name" field
      And each element in the "others.others_by_day_list" list has the "charge" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant


  @jira.QANOV-8572 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.depends_on.QANOV-8558
  @jira.link.relates_to.NOV-47794 @moves @regression
  Scenario: Admin user without others expenses can access the detailed other expenses consumption screen
    other_affected_versions="2021-45-B"
    Given user has a "admin" role
      And user has not made consumption on the "others" allowances in the "landline" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "consumption-counters-landline" module configured in CMS for "landline" page for the "landline" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-others" page for the "landline" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-others" page for the "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Consumption" page
     When clicks on the "others" icon
     Then the "others" tab is selected
      And the "others.amount_consumed.text" textfield with "Has consumido 0" text is displayed
      And the "others.extra_charges.text" textfield with "Gastos extra actual 0,00€" text is displayed
      And the "others.graph" graph is not displayed
      And the "events_list" list is not displayed
      And the "others.empty_case_title" textfield with "No tienes otros consumos" text is displayed
      And the "others.empty_case_text" textfield with "Aquí verás el consumo de servicios adicionales durante el ciclo de facturación" text is displayed


  @jira.<jira_id> @android @ios @mobile @jira.cv.10.4 @manual @jira.link.depends_on.QANOV-8558
  @jira.link.depends_on.QANOV-8570 @jira.link.relates_to.NOV-92077 @moves @regression
  Scenario Outline: User can see more info about the consumption
    Given user has a "admin" role
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "consumption-counters-landline" module configured in CMS for "landline" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-<page>" page for the "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Consumption" page
     When clicks on the "<consumption_type>" icon
      And clicks on the "info" icon
     Then the "More Info" page is displayed
      And the "Más información" header is displayed
      And the "info" icon is displayed
      And the "title" textfield with "Información de tu consumo" text is displayed
      And the "description" textfield is displayed

    Examples:
          | consumption_type | page   | jira_id    |
          | minutes          | calls  | QANOV-8574 |
          | others           | others | QANOV-8576 |


  @jira.QANOV-8578 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.depends_on.QANOV-8558
  @jira.link.relates_to.NOV-82322 @moves @regression @automation.pending_env
  Scenario: User can interact with the bar chart of minutes consumption events
    Given user has a "admin" role
      And user has made consumption on the "minutes" allowances in the "landline" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "consumption-counters-landline" module configured in CMS for "landline" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-calls" page for the "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Consumption" page
     When clicks on the "minutes" icon
      And clicks on the "3" day in the "minutes.graph" graph
     Then the "minutes.graph.selected_day" line is displayed in the "3" day
      And the "minutes.graph.selected_value" textfield with the "dd mmm · XX min" format is displayed


  @jira.QANOV-8580 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.depends_on.QANOV-8570
  @jira.link.relates_to.NOV-85665 @moves @regression @impeded_mock @automation.pending_env
  Scenario: User can interact with the bar chart of other consumption events
    Given user has a "admin" role
      And user has made consumption on the "others" allowances in the "landline" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "consumption-counters-landline" module configured in CMS for "landline" page for the "landline" product
      And user has the "tabs-non-mobile" module configured in CMS for "consumption-details" page for the "landline" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-others" page for the "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Consumption" page
     When clicks on the "others" icon
      And clicks on the "3" day in the "others.graph" graph
     Then the "others.graph.selected_day" line is displayed in the "3" day


  @jira.QANOV-8582 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.relates_to.NOV-47799
  @moves @regression
  Scenario: ADMIN LIGHT cannot access the detailed minutes consumption screen: user escalation is required
    commented_tags="@depends_on.NOV-47673"
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user is in the "Landline Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

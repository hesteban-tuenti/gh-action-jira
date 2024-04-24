# -*- coding: utf-8 -*-
@jira.QANOV-126730
Feature: Consumption Details

  Actions Before the Feature:
    Given user has a "mobile_line" product


  @jira.QANOV-6428 @android @automatic @ber @ios @jira.cv.10.4 @jira.link.detects.ACCOUNT-17957
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-47920 @jira.link.relates_to.NOV-47926
  @jira.link.detects.MOVES-6189 @mobile @moves @qa @sanity @webapp
  Scenario: Telco postpay user can see the Data allowance details
    commented_tags="@depends_on.NOV-47922 @depends_on.NOV-47913"
    Given user has a "telco postpay" account type
      And user has made consumption on the "data" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-postpay-telco" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "billing_cycle_end_time" textfield with the "<Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)>" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "data" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de datos" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "\d+(,\d{2})? (MB|GB)" format is displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "data_consumed" textfield with the "\d+(,\d{2})? (MB|GB)" format
      And each element in the "events_list" list has the "consumption_subtitle" textfield with "Datos" text
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6429 @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-47920 @jira.link.relates_to.NOV-47926 @mobile @moves @no_automatable @regression
  Scenario: Legado postpay user can see the Data allowance details
    LEGADO POSTPAY (Live): 05960856S, 18996277W
    commented_tags="@depends_on.NOV-47922 @depends_on.NOV-47913"
    Given user has a "legado postpay" account type
      And user has made consumption on the "data" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-postpay-legado" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "data" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de datos" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is not displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "X,XX €" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "data_consumed" textfield with the "\d+ (MB|GB)" format
      And each element in the "events_list" list has the "consumption_subtitle" textfield with "Datos" text
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6430 @android @ios @jira.cv.10.4 @jira.link.detects.MOVES-4454 @jira.link.relates_to.NOV-47929
  @mobile @moves @smoke @automatic @qa @webapp
  Scenario: Postpay user can see the Minutes allowance details
    LEGADO POSTPAY (Live): 05960856S
    commented_tags="@depends_on.NOV-47913"
    Given user has a "postpay" account type
      And user has made consumption on the "minutes" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "minutes" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de llamadas" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "(\s?\d{1,2}(min|s|h)){1,3}" format is displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus bonos de minutos" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "duration" textfield with the "\d{1,2}:\d\d (\s?\d{1,2}(min|s|h)){1,3}" format
      And each element in the "events_list" list has the "type_of_call" textfield with the "Llamada - (Saliente|Entrante)" format
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6432 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47977 @manual @mobile @moves @regression
  Scenario: Postpay user can see the SMS allowance details
    LEGADO POSTPAY (Live): 05960856S
    commented_tags="@depends_on.NOV-47913"
    Given user has a "postpay" account type
      And user has made consumption on the "messages" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "sms" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de mensajes" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "X Mensajes" format is displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "X,XX €" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus bonos de SMS" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "date_time" field
      And each element in the "events_list" list has the "type_of_sms" field
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6681 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2 @jira.link.relates_to.NOV-47933
  @manual @mobile @moves @regression
  Scenario: Postpay user can see others allowance details
    commented_tags="@depends_on.NOV-47913"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has made consumption on the "others" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "any_roundel" allowance roundel
      And clicks on the "others_tab" icon
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "others" tab is selected
      And the "total_consumption_section_title" textfield with "Otros consumos" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "extra_charges.title" textfield with "Has consumido" text is displayed
      And the "extra_charges.value" textfield with "X" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the charges are displayed in the "consumption_graph.y" axis
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "type_of_consumption" field
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Dashboard" page is displayed
      And the "Línea móvil" header is displayed

  @jira.QANOV-6435 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.relates_to.NOV-119887 @mobile @moves
  @no_automatable @regression
  Scenario: Legados prepay user can see the Data allowance details
    Given user has a "legado prepay" account type
      And user has made consumption on the "data" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-prepay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "event-history-aggregated-prepay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "data" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de datos" text is displayed
      And the "info_icon" icon is not displayed
      And the "amount_consumed" module is not displayed
      And the "extra_charges.title" textfield with "Gastos extra actual" text is displayed
      And the "extra_charges.value" textfield with the "X,XX €" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "data_consumed" textfield with the "\d+ (MB|GB)" format
      And each element in the "events_list" list has the "consumption_subtitle" textfield with "Datos" text
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6436 @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-119880 @mobile @moves
  @no_automatable @impeded_legacy @regression
  Scenario: Legados prepay user can see the Minutes allowance details
    LEGADO PREPAY (Dev): 656874631
    Given user has a "legado prepay" account type
      And user has made consumption on the "minutes" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-prepay" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "event-history-aggregated-prepay" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "miutes" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de llamadas" text is displayed
      And the "info_icon" icon is not displayed
      And the "amount_consumed" module is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "X h Xmin Xs" format is displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "X,XX €" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus bonos de minutos" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "duration" textfield with the "\d{1,2}:\d\d (\s?\d{1,2}(min|s|h)){1,3}" format" format
      And each element in the "events_list" list has the "type_of_call" textfield with the "Llamada - (Saliente|Entrante)" format
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6437 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.relates_to.NOV-119882 @mobile @moves
  @no_automatable @regression
  Scenario: Legados prepay user can see the SMS allowance details
    Given user has a "legado prepay" account type
      And user has made consumption on the "messages" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-prepay" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "event-history-aggregated-prepay" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "consumption-events-list-prepay" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "sms" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de mensajes" text is displayed
      And the "info_icon" icon is not displayed
      And the "amount_consumed" module is displayed
      And the "amount_consumed.title" textfield with "Has consumido" text is displayed
      And the "amount_consumed.value" textfield with the "X Mensajes" format is displayed
      And the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "X,XX €" format is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus bonos de SMS" text is displayed
      And the "consumption_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "consumption_graph" graph
      And the consumptions are displayed in the "y" axis of the "consumption_graph" graph
      And the selected day line is displayed in the "today" day of the "consumption_graph" graph
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "date_time" field
      And each element in the "events_list" list has the "type_of_sms" field
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-6695 @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-47934 @manual @mobile @moves @regression
  Scenario: User who hasn't consumed others types of allowances sees the Empty case
    commented_tags="@depends_on.NOV-47913"
    other_affected_versions="2021-45-B"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has not made consumption on the "others" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-postpay" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the "event-history-aggregated-postpay" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details-others" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "any_roundel" allowance roundel
      And clicks on the "others_tab" icon
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "others" tab is selected
      And the "total_consumption_section_title" textfield with "Otros consumos" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "extra_charges.title" textfield with "Has consumido" text is displayed
      And the "extra_charges.value" textfield with "0" text is displayed
      And the "consumption_empty_case_icon" icon is displayed
      And the "consumption_empty_case_title" textfield with "Aquí verás el detalle de los servicios adicionales consumidos" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-47928 @mobile @moves @regression
  Scenario Outline: User who hasn't consumed data sees an informative message
    commented_tags="@depends_on.NOV-47913"
    other_affected_versions="2021-45-B"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "data" allowances in the "mobile_line" product
      And user has not made consumption on the "data" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "event-history-aggregated-<account_type_name>" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the "consumption-events-list-<account_type_name>" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "data" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de datos" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "extra_charges.title" textfield with "Has consumido" text is displayed
      And the "extra_charges.value" textfield with "0 MB" text is displayed
      And the "consumption_empty_case_icon" icon is displayed
      And the "consumption_empty_case_title" textfield with "Aquí verás el detalle de los datos consumidos" text is displayed

    @manual
    Examples:
          | account_type   | account_type_name | jira_id      |
          | telco postpay  | postpay-telco     | QANOV-6704   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type   | account_type_name | jira_id       |
          | legado prepay  | prepay            | QANOV-6714    |
          | legado postpay | postpay-legado    | QANOV-249294  |

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-47931 @mobile @moves @regression
  Scenario Outline: User who hasn't consumed minutes sees an informative message
    commented_tags="@depends_on.NOV-47913"
    other_affected_versions="2021-45-B"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "minutes" allowances in the "mobile_line" product
      And user has not made consumption on the "minutes" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "event-history-aggregated-<account_type_name>" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the "consumption-events-list-<account_type_name>" module configured in CMS for "consumption-details-calls" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "minutes" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de llamadas" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "extra_charges.title" textfield with "Has consumido" text is displayed
      And the "extra_charges.value" textfield with "0min" text is displayed
      And the "consumption_empty_case_icon" icon is displayed
      And the "consumption_empty_case_title" textfield with "Aquí verás el detalle de los minutos consumidos" text is displayed

    @manual
    Examples:
          | account_type   | account_type_name | jira_id      |
          | telco postpay  | postpay           | QANOV-6725   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type   | account_type_name | jira_id      |
          | legado prepay  | prepay            | QANOV-6735   |
          | legado postpay | postpay           | QANOV-249295 |

  @jira.<jira_id> @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-47932 @mobile @moves @regression
  Scenario Outline: User who hasn't consumed SMSs sees an informative message
    commented_tags="@depends_on.NOV-47913"
    other_affected_versions="2021-45-B"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "messages" allowances in the "mobile_line" product
      And user has not made consumption on the "messages" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page for the "mobile" product
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "event-history-aggregated-<account_type_name>" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the "consumption-events-list-<account_type_name>" module configured in CMS for "consumption-details-messages" page for the "mobile" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "sms" tab is selected
      And the "total_consumption_section_title" textfield with "Consumo de mensajes" text is displayed
      And the "info_icon" icon is displayed
      And the "amount_consumed" module is displayed
      And the "extra_charges.title" textfield with "Has consumido" text is displayed
      And the "extra_charges.value" textfield with "0 Mensajes" text is displayed
      And the "consumption_empty_case_icon" icon is displayed
      And the "consumption_empty_case_title" textfield with "Aquí verás el detalle de los SMS consumidos" text is displayed

    @manual
    Examples:
          | account_type   | account_type_name | jira_id      |
          | telco postpay  | postpay           | QANOV-6740   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type   | account_type_name | jira_id    |
          | legado prepay  | prepay            | QANOV-6748 |
          | legado postpay | postpay          | QANOV-249296 |

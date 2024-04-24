# -*- coding: utf-8 -*-
@jira.QANOV-9062
Feature: TV Extra Charges

  Actions Before the Feature:
    Given user has a "tv" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "unbilled-consumption" module configured in CMS for "tv" page for the "tv" product


  @jira.QANOV-9063 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53567
  @manual @mobile @moves @smoke
  Scenario: ADMIN user can see the "Extra costs" of the TV product
    commented_tags="@depends_on.NOV-52861"
    Given user has a "admin" role
      And user has a "tv" product with extra charges
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges Details" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "extra_charges_average_consumption_title" textfield with "Consumo medio en ciclo" text is displayed
      And the "extra_charges_average_consumption_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_consumption_list" list is displayed
      And the elements in the "extra_charges_events_list_dates" list are ordered by date descendant
      And each element in the "extra_charges_consumption_list" list has the "icon" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_title" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_subtitle" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with the "(-)?\d+,\d\d( | )€" format
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with "red" color

  @jira.QANOV-249288 @android @ios @jira.cv.11.10 @manual @mobile @moves @regression
  Scenario: Admin without extra charges in tv can access to the extra charges screen
    other_affected_versions="2021-45-B"
    Given user has a "admin" role
      And user has a "tv" product without extra charges
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges Detail" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with "0,00 €" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "extra_charges_graph" graph is not displayed
      And the "charges_list" list is not displayed
      And the "empty_case_title" textfield with "Aún no has generado gastos extra en este periodo" text is displayed
      And the "empty_case_description" textfield with "Aquí verás el detalle de gastos extras durante el ciclo de facturación" text is displayed

  @jira.QANOV-9064 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-53568 @manual @mobile @moves @regression
  Scenario: ADMIN LIGHT user cannot see the "Extra costs" of the TV product: "Upgrade to ADMIN" option will be shown
    commented_tags="@depends_on.NOV-52861"
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "extra_charges" entrypoint
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

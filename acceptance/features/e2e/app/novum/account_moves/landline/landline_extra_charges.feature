# -*- coding: utf-8 -*-
@jira.QANOV-8610
Feature: Landline Extra Charges

  Actions Before the Feature:
    Given user has a "landline" product


  @jira.QANOV-8612 @cert2 @android @ber @ios @mobile @jira.cv.11.10 @automatic @live @next @moves
  @sanity @qa @webapp
  Scenario: User can see the amount of all extra costs in a billing cycle in the Landline dashboard
    Given user has a "any_admin" role
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "^\d+(\,\d{1,2})? €$" format is displayed

  @jira.QANOV-8613 @android @ios @mobile @jira.cv.11.10 @manual @moves @smoke
  Scenario: User with positive extra costs in landline can see the amount in red color
    Given user has a "any_admin" role
      And user has a "landline" product with extra charges
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "extra_charges.value" textfield is displayed in "red" color

  @jira.QANOV-8615 @android @ios @mobile @jira.cv.11.10 @automatic @moves @smoke @next @qa @live @cert2 @webapp
  Scenario: User without extra costs in landline can see the amount in black color
    Given user has a "any_admin" role
      And user has a "landline" product without extra charges
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "extra_charges.value" textfield is displayed in "black" color

  @jira.QANOV-8617 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.relates_to.NOV-47888
  @moves @smoke @automation.pending_env
  Scenario: Admin with extra charges in landline can access to the detailed extra charges
    Given user has a "admin" role
      And user has a "landline" product with extra charges
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges Detail" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "charges_list" list is displayed
      And the "highlighted_services" module is displayed

  @jira.QANOV-8619 @android @ios @mobile @jira.cv.11.10 @manual @moves
  @regression
  Scenario: Admin without extra charges in landline can access to the extra charges screen
    other_affected_versions="2021-45-B"
    Given user has a "admin" role
      And user has a "landline" product without extra charges
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "landline" product
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
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
      And the "highlighted_services" module is displayed

  @jira.QANOV-8620 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.relates_to.NOV-47802
  @moves @regression
  Scenario: An ADMIN LIGHT cannot access the landline extra expenses screen: user escalation is required
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "unbilled-consumption" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     When clicks on the "extra_charges" entrypoint
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

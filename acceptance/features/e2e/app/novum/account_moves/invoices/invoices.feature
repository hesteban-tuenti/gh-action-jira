# -*- coding: utf-8 -*-
@jira.QANOV-126313
Feature: Invoices


  @jira.QANOV-6848 @android @no_automatable @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-6846 @impeded_legacy
  @jira.link.detects.ACCOUNT-13893 @jira.link.relates_to.NOV-48049 @mobile @moves @regression
  Scenario: Legado postpay user without bills in a month cannot see them in the Bills detailed screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a month with "no" bill
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
      And clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "bills_screen_title" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bill_amount_graph" textfield with "-,--" text is displayed
      And the "bills_graph" graph is displayed
      And the eligible month is selected in the bills graph
      And the "bills_summary.empty_case_icon" icon is displayed
      And the "bills_summary.empty_case_error_title_text" textfield with "No hay facturas disponibles para mostrar este mes" text is displayed
      And the "bills_summary.empty_case_error_subtitle_text" textfield with "Por favor, selecciona otro mes" text is displayed
      And the "services_module" module is displayed
      And the "related_information.tariff_details" list with "Consultar tarifa contratada" textfields is displayed

  @jira.QANOV-6852 @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-48084 @no_automatable @mobile @moves
  @regression @impeded_legacy
  Scenario: ADMIN LIGHT user cannot see the details of a bill: "Login Escalation" screen will be shown
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47978"
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_bill_details_link" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-6895 @android @ios @jira.cv.10.5 @jira.link.detects.ACCOUNT-13893 @jira.link.relates_to.NOV-48089 @no_automatable
  @mobile @moves @regression @impeded_legacy
  Scenario: Legado postpay user can select a different month in the Bills detailed screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47978"
    Given user has a "legado postpay" account type
      And user has bills for "some" months
      And user has a "any_admin" role
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bills" page
     When clicks on a different month in the bills graph
     Then the "bills_screen_title" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bill_amount_graph" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bill_mean_amount" textfield with the "Importe medio de los últimos 6 meses: (-)?\d+,\d\d( | )€" format is displayed
      And the eligible month is selected in the bills graph
      And the "bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "bills_summary.bill_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

  @jira.QANOV-6896 @android @no_automatable @ios @jira.cv.10.5 @jira.link.detects.ACCOUNT-13893
  @jira.link.relates_to.NOV-48057 @mobile @moves @regression @impeded_legacy
  Scenario: Legado postpay user with a negative bill can access to the Bill details for that month
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a month with "negative" bill
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
      And clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "bills_screen_title" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bill_amount_graph" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the eligible month is selected in the bills graph
      And the "bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "bills_summary.bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "bills_summary.bill_amount" textfield with the "-\d+,\d\d( | )€" format is displayed
      And the "bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "services_module" module is displayed

  @jira.QANOV-120937 @android @ios @jira.cv.10.5 @jira.link.detects.ACCOUNT-13893 @jira.link.relates_to.NOV-47980 @no_automatable
  @mobile @moves @regression @impeded_legacy
  Scenario: A legado postpay user with more than one bill in a month can see them in the Bills screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a month with "several" bills
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
      And clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "bills_screen_title" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bill_amount_graph" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bill_mean_amount" textfield with the "Importe medio de los últimos 6 meses: (-)?\d+,\d\d( | )€" format is displayed
      And the eligible month is selected in the bills graph
      And the "invoice_consultation" module is displayed
      And the "invoice_consultation.icon" icon is displayed
      And the "invoice_consultation.title" textfield with "Consultas sobre facturas" text is displayed
      And the "bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "bills_summary.bill_id" textfield is displayed for each bill
      And the "bills_summary.bill_amount" textfield is displayed for each bill
      And the "bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed for each bill
      And the "bills_summary.bill_amount" and the "bill_amount_graph" amounts are the same
      And the "services_module" module is not displayed

  @jira.QANOV-6902 @android @no_automatable @ios @jira.cv.10.5 @jira.link.detects.ACCOUNT-13893
  @jira.link.relates_to.NOV-47978 @mobile @moves @smoke @impeded_legacy
  Scenario: Legado postpay user with only one bill in a month can see it in the Bills screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a month with "1" bills
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
      And clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "bills_screen_title" textfield with the "Total Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed
      And the "bill_amount_graph" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bill_mean_amount" textfield with the "Importe medio de los últimos 6 meses: (-)?\d+,\d\d( | )€" format is displayed
      And the eligible month is selected in the bills graph
      And the "bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "bills_summary.bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "bills_summary.bill_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bills_summary.bill_amount" and the "bill_amount_graph" amounts are the same
      And the "bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "services_module" module is displayed

  @jira.QANOV-7003 @android @ios @jira.cv.10.5 @jira.link.relates_to.NOV-48085 @no_automatable @mobile @moves
  @regression @impeded_legacy
  Scenario: Legado postpay user without connectivity access to the Bills screen (and Bills screen is not cached): an error message is displayed
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has bills for "any" months
      And the "Bills" page is not cached
      And user turns on the Airplane mode
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "bills_no_connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "bills_no_connectivity_error_subtitle" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed

  @jira.QANOV-142594 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-125017
  @jira.link.parent_test_plan.QANOV-142598 @no_automatable @mobile @moves @regression @impeded_legacy
  Scenario: ADMIN postpay user with bills taps on the 'Iniciar conversación' button in the 'Consultas sobre facturas' module: What's App app is displayed
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    other_affected_versions="2021-39"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has bills for "any" months
      And user is logged in the "What's App" app
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user is in the "Bills" page
     When clicks on the "invoice_consultation.button" button
     Then the "What's App" app is displayed
      And the Mi Movistar conversation will be displayed on the What's App app

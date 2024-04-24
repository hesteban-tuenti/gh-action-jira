# -*- coding: utf-8 -*-
@jira.QANOV-260682
Feature: Invoices Tab Content


  @jira.QANOV-260683 @android @automatic @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037
  @mobile @moves @qa @smoke @webapp
  Scenario: ADMIN user can select another month in the Bills graph of the Invoices tab
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has invoices for "some" months
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on a month with invoices in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( 20\d\d)?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(-)?.+,.*" format is displayed
      And the "invoice_chart_header.average_amount" textfield with the "Media de los últimos (6|12|18) meses (-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed

  @jira.QANOV-260684 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile
  @moves @regression @qa @webapp
  Scenario: ADMIN user with a negative bill can see it the Invoices Tab
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a month with "1" invoice
      And user has a month with "negative" invoice
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( 20\d\d)?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_body.bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "invoice_chart_body.bills_summary.bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "invoice_chart_body.bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "services_module" list is displayed

  @jira.QANOV-260685 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile
  @moves @regression @qa @webapp
  Scenario: ADMIN user can select month without bills in the Invoices Tab
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a month with "no" invoice
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( 20\d\d)?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with "-,--" text is displayed
      And the "invoice_chart_header" module is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_body_empty_case.icon" icon is displayed
      And the "invoice_chart_body_empty_case.title" textfield with "No hay facturas disponibles para mostrar este mes" text is displayed
      And the "invoice_chart_body_empty_case.subtitle" textfield with "Por favor, selecciona otro mes" text is displayed

  @jira.QANOV-260687 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with bills for all months can see them in the Invoices Tab
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has invoices for "6" months
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     Then the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( 20\d\d)?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "last" month is selected in the bills graph
      And all the bills have amounts

  @jira.QANOV-260688 @android @ios @jira.cv.13.8 @jira.link.detects.MOVES-7403 @jira.link.parent_test_plan.QANOV-256037
  @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT user cannot see the details of a bill: "Login Escalation" screen will be shown
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-260689 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile
  @moves @regression @qa @webapp
  Scenario: ADMIN user with more than one bill in a month can see them in the Invoices tab
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a month with "several" invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( 20\d\d)?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "invoice_chart_header.average_amount" textfield with the "Media de los últimos (6|12|18) meses (-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_body.bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And each element in the "invoice_chart_body_list" list has the "bills_summary" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.bill_id" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.bill_amount" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.see_bill_details_link" textfield with "[LANG:bills.bill_details.see_details]" text
      And the "invoice_chart_body_list.bills_summary.bill_amount" and the "invoice_chart_header.selection_amount" amounts are the same

  @jira.QANOV-260690 @android @automatic @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037
  @mobile @moves @sanity @qa @webapp
  Scenario: ADMIN user with only one bill in a month can see it in the Invoices Tab
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a month with "1" invoice
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)( 20\d\d)?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "invoice_chart_header.average_amount" textfield with the "Media de los últimos (6|12|18) meses (-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_body.bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "invoice_chart_body.bills_summary.bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "invoice_chart_body_list.bills_summary.bill_amount" and the "invoice_chart_header.selection_amount" amounts are the same
      And the "invoice_chart_body.bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "services_module" list is displayed

  @jira.QANOV-260691 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile
  @moves @regression
  Scenario: ADMIN user can access to the Tariff Details (Area privada) page from the Invoices Tab
    Given user has a "telco postpay" account type
      And user has "several" products
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "related_information.tariff_details" entrypoint
      And the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Área privada Movistar" header is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-414864 @android @ios @jira.cv.14.7 @manual @mobile @moves @smoke
  Scenario: ADMIN user with more than one bill document can access the download options page
    Given user has a "telco postpay" account type
      And user has ">1" bill document
      And user is in the "Invoices" page
     When clicks on the "invoice_download" button
     Then the "Bill Download Options" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Invoices" page is displayed

  @jira.QANOV-414865 @android @jira.cv.14.7 @manual @mobile @moves @regression
  Scenario: ADMIN user with more than one bill document clicks on a Invoice document in the download options page: Invoice PDF is displayed in Android devices
    Given user has a "telco postpay" account type
      And user has ">1" bill document
      And user is in the "Invoices" page
     When clicks on the "invoice_download" button
      And the "Bill Download Options" page is displayed
      And clicks on any element in the "documents_list" entrypoints list
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-414866 @ios @jira.cv.14.7 @manual @mobile @moves @regression
  Scenario: ADMIN user with more than one bill document clicks on a Invoice document in the download options page: Invoice PDF is displayed in iOS devices
    Given user has a "telco postpay" account type
      And user has ">1" bill document
      And user is in the "Invoices" page
     When clicks on the "invoice_download" button
      And the "Bill Download Options" page is displayed
      And clicks on any element in the "documents_list" entrypoints list
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.QANOV-414867 @android @ber @jira.cv.14.7 @manual @mobile @moves @sanity
  Scenario: ADMIN user with just one bill document clicks on the "invoice_download" button: Invoice PDF is displayed in Android devices
    Given user has a "telco postpay" account type
      And user has "1" bill document
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_download" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-414868 @ber @ios @jira.cv.14.7 @manual @mobile @moves @sanity
  Scenario: ADMIN user with just one bill document clicks on the "invoice_download" button: Invoice PDF is displayed in iOS devices
    Given user has a "telco postpay" account type
      And user has "1" bill document
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_download" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.QANOV-326089 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with bills taps on the 'Contactar por WhatsApp' button in the 'Consultas sobre facturas' module: What's App app is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has invoices for "any" months
      And user is logged in the "What's App" app
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "invoice_consultation.link" link
     Then the "What's App" app is displayed
      And the Mi Movistar conversation will be displayed on the What's App app

  @jira.QANOV-260698 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user with bills access to the Invoices Tab: Invoice improvements will be displayed
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has invoices for "any" months
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     Then the "invoice_download" module is displayed
      And the "invoice_download.icon" icon is displayed
      And the "invoice_download.title" textfield with "Descargar factura en PDF" text is displayed
      And the "services_module" module is displayed
      And the "invoice_consultation" module is not displayed

  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @regression
  Scenario Outline: User with a bill in "<status>" status clicks on the "bills_summary.button" button: Debt payment flow is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "<status>" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_chart_body.bills_summary.button" button
     Then the "Bill Selection" page is displayed

    Examples:
          | status         | jira_id      |
          | payment_period | QANOV-326091 |
          | overdue        | QANOV-326092 |

  @jira.QANOV-419129 @android @ios @jira.cv.14.7 @manual @mobile @moves @smoke
  Scenario: Moves user with digital invoice service deactivated can access the OB wevbiew to change the delivery address
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Invoices" page
      And user has the digital invoice service in "deactivated" status
     When clicks on the "change_delivery_address" button
     Then the browser webview is displayed
      And the "Introduce una dirección" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoices" page is displayed

  @jira.QANOV-419130 @android @ios @jira.cv.14.7 @manual @mobile @moves @regression
  Scenario: Moves user with digital invoice service activated can access the digital invoice dynamic page from the change delivery address entrypoint
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Invoices" page
      And user has the digital invoice service in "activated" status
     When clicks on the "change_delivery_address" button
     Then the "Dirección De Envio De Facturas" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

  @jira.QANOV-419131 @android @ios @jira.cv.14.7 @manual @mobile @moves @smoke
  Scenario: Moves user with digital invoice service activated can see the email address in the digital invoice entrypoint
    Given user has a "telco postpay" account type
      And user is in the "Invoices" page
      And user has the digital invoice service in "activated" status
     Then the "digital_invoice_entrypoint.email" textfield is displayed

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.7 @manual @mobile @moves
  Scenario Outline: Moves user with digital invoice service <status> can see the tag status in the digital invoice entrypoint
    Given user has a "telco postpay" account type
      And user is in the "Invoices" page
      And user has the digital invoice service in "<status>" status
     Then the "digital_invoice_entrypoint.tag" tag with "<text>" text is displayed

    Examples:
          | status      | text        | priority   | jira_id      |
          | activated   | Activado    | smoke      | QANOV-419132 |
          | deactivated | Desactivado | regression | QANOV-419133 |

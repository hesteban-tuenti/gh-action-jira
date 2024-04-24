# -*- coding: utf-8 -*-
@jira.QANOV-260660
Feature: Invoice Details

  Actions Before the Feature:
    Given user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page


  @jira.QANOV-260661 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile @moves @qa
  @regression @webapp
  Scenario: ADMIN user with interactive bill can see the interactive module
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the interactive invoice is available in a month
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And the "Bill Details" page is displayed
     Then the "Factura" header is displayed
      And the "interactive_bill" module is displayed

  @jira.QANOV-414861 @android @ios @jira.cv.14.7 @mobile @moves @no_automatable @regression
  Scenario: ADMIN user without interactive bill and without download url will see an error screen when accessing to the invoice details page
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the interactive bill is not available
      And the bill download url is not available
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And the "Bill Details" page is displayed
     Then the "Factura" header is displayed
      And the "error_module.icon" icon is displayed
      And the "error_module.title" textfield with "Algo ha ido mal" text is displayed
      And the "error_module.description" textfield that contains the "El contenido de esta página no se puede mostrar" text is displayed

  @jira.QANOV-414862 @android @ios @jira.cv.14.7 @mobile @moves @no_automatable @regression
  Scenario: ADMIN user with interactive bill and without download url will see the invoice details page
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the interactive bill is available
      And the bill download url is not available
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And the "Bill Details" page is displayed
     Then the "Factura" header is displayed
      And the "bill_download" button is displayed
      And the "interactive_bill" module is displayed

  @jira.QANOV-414863 @android @ios @jira.cv.14.7 @mobile @moves @no_automatable @regression
  Scenario: ADMIN user with interactive bill and without download url clicks on the "bill_download" button: Error crouton is displayed
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the interactive bill is available
      And the bill download url is not available
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And the "Bill Details" page is displayed
      And clicks on the "bill_download" button
     Then the "crouton_message" textfield with "Ha ocurrido un error" text is displayed

  @jira.QANOV-260662 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: ADMIN user can access to each of his/her consumption details on the invoice details screen
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And the interactive bill is available
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And user is in the "Bill Details" page
      And clicks on the "chevron" icon of "any" consumption detail
     Then the "Consumption Detail" module is displayed

  @jira.<jira_id> @<client> @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves @regression
  Scenario Outline: ADMIN user can cancel the download menu in <client> devices
    Given user has a "telco postpay" account type
      And user is in the "Bill Details" page
     When clicks on the "bill_download" button
      And clicks on the "<cancel_bill_download>" button
     Then the "Bill Details" page is displayed

    Examples:
          | client  | cancel_bill_download | jira_id      |
          | android | native_back_button   | QANOV-260663 |
          | ios     | ok_button            | QANOV-260664 |

  @jira.QANOV-260665 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile @moves @qa
  @regression @webapp
  Scenario: ADMIN user user can see the details of a negative bill
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a month with "negative" invoice
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "[LANG:account.dashboard.bill]" header is displayed
      And the "bill_id" textfield is displayed
      And the "bill_date" textfield with the "Factura emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "bill_download_label" button with "Descargar PDF" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Invoices" page is displayed

  @jira.QANOV-260666 @android @automatic @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile @moves
  @qa @sanity @webapp
  Scenario: ADMIN user can see the details of a bill
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has invoices for "any" months
      And user is in the "Invoices" page
     When clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "bill_id" textfield is displayed
      And the "bill_date" textfield with the "Factura emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "bill_download" button is displayed
      And the "bill_download_label" button with "Descargar PDF" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Invoices" page is displayed

  @jira.QANOV-260667 @android @automatic @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile @moves @qa
  @regression @webapp
  Scenario: Admin user cannot see details of a bill if the interactive bill is not available
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has invoices for "any" months
      And the interactive invoice is not available in a month
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "Factura" header is displayed
      And the "bill_id" textfield is displayed
      And the "bill_date" textfield with the "Factura emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "bill_download_label" button with "Descargar PDF" text is displayed
      And the "interactive_bill_empty_case.icon" icon is displayed
      And the "interactive_bill_empty_case.title" textfield with "[LANG:bill_details.no_interactive_bill.title]" text is displayed
      And the "interactive_bill_empty_case.subtitle" textfield with "[LANG:bill_details.no_interactive_bill.subtitle]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Invoices" page is displayed

  @jira.<jira_id> @<test_priority> @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile @moves
  Scenario Outline: Admin user can download the <bill_document> bill document on Android devices
    If there is only 1 document for that month, no selector will be displayed and the invoice pdf will be downloaded
    Given user has a "telco postpay" account type
      And user has invoices for "some" months
      And user has a "admin" role
      And user has the "<bill_document>" invoice document in any invoice
      And user has installed the "Google Drive" app
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And the "Bill Details" page is displayed
      And selects the "<bill_document>" bill option in the "bill_download" select
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

    @automatic @ber @qa @har
    Examples:
          | bill_document | test_priority | jira_id      |
          | Factura       | sanity        | QANOV-260668 |

    @automatic @ber @qa
    Examples:
          | bill_document      | test_priority | jira_id      |
          | Detalle de consumo | regression    | QANOV-260669 |

    @automatic @qa
    Examples:
          | bill_document | test_priority | jira_id      |
          | Resumen       | regression    | QANOV-260670 |
          | Aviso de pago | regression    | QANOV-260673 |
          | Anexo         | regression    | QANOV-260671 |

    @manual
    Examples:
          | bill_document      | test_priority | jira_id      |
          | Detalle Línea      | regression    | QANOV-260674 |
          | Detalle de factura | regression    | QANOV-260672 |

  @jira.<jira_id> @<test_priority> @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @mobile @moves
  Scenario Outline: Admin user can download the <bill_document> bill document on iOS devices
    Given user has a "telco postpay" account type
      And user has invoices for "some" months
      And user has a "admin" role
      And user has the "<bill_document>" invoice document in any invoice
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.see_bill_details_link" button
      And the "Bill Details" page is displayed
      And selects the "<bill_document>" bill option in the "bill_download" select
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    @automatic @ber @qa @har
    Examples:
          | bill_document | test_priority | jira_id      |
          | Factura       | sanity        | QANOV-260675 |

    @automatic @ber @qa
    Examples:
          | bill_document      | test_priority | jira_id      |
          | Detalle de consumo | regression    | QANOV-260676 |

    @automatic @qa
    Examples:
          | bill_document | test_priority | jira_id      |
          | Resumen       | regression    | QANOV-260679 |
          | Aviso de pago | regression    | QANOV-260681 |
          | Anexo         | regression    | QANOV-260678 |

    @manual
    Examples:
          | bill_document      | test_priority | jira_id      |
          | Resumen de consumo | regression    | QANOV-260680 |
          | Resumen de factura | regression    | QANOV-260677 |

  @jira.QANOV-558969 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with interactive bill can see the interactive module
    Given user has a "admin" role
      And the interactive invoice is available in a month
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "interactive_bill" module is displayed

  @jira.QANOV-558970 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User without interactive bill cannot see the interactive module
    Given user has a "admin" role
      And the interactive invoice is not available in a month
      And user is in the "Invoices" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "interactive_bill_empty_case.icon" icon is displayed
      And the "interactive_bill_empty_case.title" textfield with "[LANG:bill_details.no_interactive_bill.title]" text is displayed
      And the "interactive_bill_empty_case.subtitle" textfield with "[LANG:bill_details.no_interactive_bill.subtitle]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

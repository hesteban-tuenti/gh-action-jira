# -*- coding: utf-8 -*-
@jira.QANOV-126314
Feature: Invoice Details


  @jira.QANOV-84644 @android @ios @mobile @jira.cv.10.5 @no_automatable
  @jira.link.relates_to.NOV-80832 @moves @regression @impeded_legacy
  Scenario: Legado postpay user with interactive bill can see the interactive module
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And the interactive bill is available
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
      And clicks on the "bills.link" link
      And the "Bills" page is displayed
      And clicks on the "bills_summary.see_bill_details_link" button
      And user is in the "Bill Details" page
     Then the "Factura" header is displayed
      And the "interactive_bill" module is displayed

  @jira.QANOV-6857 @android @ios @mobile @jira.cv.10.5 @no_automatable
  @jira.link.relates_to.NOV-80832 @moves @regression @impeded_legacy
  Scenario: Legado postpay user can access to each of his/her consumption details on the invoice details screen
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-48069"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And the interactive bill is available
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the eligible month in the bills graph
      And clicks on the "bills.link" link
      And the "Bills" page is displayed
      And clicks on the "bills_summary.see_bill_details_link" button
      And user is in the "Bill Details" page
      And clicks on the "chevron" icon of "any" consumption detail
     Then the "Consumption Detail" module is displayed

  @jira.<jira_id> @<client> @mobile @jira.cv.10.5 @no_automatable @jira.link.relates_to.NOV-52848 @moves @regression
  @impeded_legacy
  Scenario Outline: Legado postpay user can cancel the download menu
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47978"
    Given user has a "legado postpay" account type
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bill Details" page
     When clicks on the "bill_download" button
      And clicks on the "<cancel_bill_download>" button
     Then the "Bill Details" page is displayed

    Examples:
          | client  | cancel_bill_download | jira_id    |
          | android | native_back_button   | QANOV-6864 |
          | ios     | ok_button            | QANOV-6870 |

  @jira.QANOV-6874 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.depends_on.QANOV-6844
  @jira.link.relates_to.NOV-48083 @moves @regression @impeded_legacy
  Scenario: Legado postpay ADMIN user can see the details of a negative bill
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    internal_checkpoint="MOVES TELCO: can be passed in PROD with FIC75437"
    commented_tags="@depends_on.NOV-48057"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a month with "negative" bill
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "[LANG:account.dashboard.bill]" header is displayed
      And the "bill_details.bill_id" textfield is displayed
      And the "bill_details.bill_date" textfield with the "Emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_details.bill_amount" textfield with the "-\d+,\d\d( | )€" format is displayed
      And the "bill_download" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Details" page is displayed

  @jira.QANOV-6878 @ber @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.detects.MOVES-4010
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-48069 @moves @smoke @impeded_legacy
  Scenario: Legado postpay ADMIN user can see the details of a bill
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47978"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has bills for "any" months
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bills" page
     When clicks on the "bills_summary.see_bill_details_link" button
     Then the "Bill Details" page is displayed
      And the "[LANG:account.dashboard.bill]" header is displayed
      And the "bill_details.bill_id" textfield is displayed
      And the "bill_details.bill_date" textfield with the "Factura emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_details.bill_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bill_download" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-6883 @android @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.relates_to.NOV-48086
  @moves @regression @impeded_legacy
  Scenario: Legado postpay admin user cannot see details of a bill if the interactive bill is not available
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has bills for "any" months
      And the interactive bill is not available
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bill Details" page
     Then the "Factura" header is displayed
      And the "bill_details.bill_id" textfield is displayed
      And the "bill_details.bill_date" textfield with the "Emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_details.bill_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bill_download" button is displayed
      And the "interactive_bill_empty_case.icon" icon is displayed
      And the "interactive_bill_empty_case.title" textfield with "[LANG:bill_details.no_interactive_bill.title]" text is displayed
      And the "interactive_bill_empty_case.subtitle" textfield with "[LANG:bill_details.no_interactive_bill.subtitle]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Details" page is displayed

  @jira.<jira_id> @<test_priority> @android @mobile @jira.cv.10.5 @no_automatable @impeded_legacy
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-48087 @jira.link.relates_to.NOV-52842 @jira.link.relates_to.NOV-52844
  @jira.link.relates_to.NOV-52845 @jira.link.relates_to.NOV-52846 @jira.link.relates_to.NOV-98749 @moves
  Scenario Outline: Legado postpay admin user can download a bill document on Android devices
    The OB defines the types of document available to download:
    the voucher option can appear as 'Comprobante' or as 'Detalles de consumo'
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47978"
    Given user has a "legado postpay" account type
      And user has bills for "some" months
      And user has a "admin" role
      And user has the "<bill_document>" bill document in any bill
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bill Details" page
     When selects the "<bill_document>" option in the "bill_download" select
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

    Examples:
          | bill_document      | test_priority | jira_id     |
          | Resumen            | regression    | QANOV-6911  |
          | Anexo              | regression    | QANOV-6916  |
          | Detalle de factura | regression    | QANOV-6920  |
          | Detalle de consumo | regression    | QANOV-67191 |
          | Aviso de pago      | regression    | QANOV-6907  |
          | Factura            | smoke         | QANOV-6925  |
          | Comprobante        | regression    | QANOV-6903  |

  @jira.<jira_id> @<test_priority> @ios @mobile @jira.cv.10.5 @no_automatable @impeded_legacy
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-48088 @jira.link.relates_to.NOV-52849 @jira.link.relates_to.NOV-52850
  @jira.link.relates_to.NOV-52851 @jira.link.relates_to.NOV-52852 @jira.link.relates_to.NOV-98790 @moves
  Scenario Outline: Admin user can download a bill document on iOS devices
    The OB defines the types of document available to download:
    the voucher option can appear as 'Comprobante' or as 'Detalles de consumo'
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    commented_tags="@depends_on.NOV-47978"
    Given user has a "legado postpay" account type
      And user has bills for "some" months
      And user has a "admin" role
      And user has the "<bill_document>" bill document in any bill
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bill Details" page
     When selects the "<bill_document>" option in the "bill_download" select
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | bill_document      | test_priority | jira_id     |
          | Resumen de factura | regression    | QANOV-6983  |
          | Anexo              | regression    | QANOV-6987  |
          | Detalle de consumo | regression    | QANOV-6991  |
          | Resumen de consumo | regression    | QANOV-67192 |
          | Aviso de pago      | regression    | QANOV-6973  |
          | Factura            | smoke         | QANOV-6994  |
          | Comprobante        | regression    | QANOV-6943  |

  @jira.<jira_id> @no_automatable @android @ios @mobile @jira.cv.10.5 @impeded_legacy
  @jira.link.depends_on.QANOV-6925 @jira.link.depends_on.QANOV-6994 @moves @regression
  Scenario Outline: Legado postpay user can zoom in and out on the downloaded bill document
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has downloaded a bill document
      And the downloaded file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id    |
          | in        | bigger  | QANOV-6998 |
          | out       | smaller | QANOV-6999 |

  @jira.QANOV-7001 @ios @mobile @jira.cv.10.5 @no_automatable @jira.link.depends_on.QANOV-6925
  @jira.link.depends_on.QANOV-6994 @moves @smoke @impeded_legacy
  Scenario: Legado postpay user can share the downloaded bill document on iOS devices
    SETTED JUST TO LEGADO FROM 13.8 IN ADVANCE
    Given user has a "legado postpay" account type
      And user has bills for "some" months
      And user has a "admin" role
      And user has the "Factura" bill document in any bill
      And user has the matching subscription selected in the account
      And user has the "invoices-summary" module configured in CMS for "dashboard" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Bill Details" page
     When selects the "Factura" option in the "bill_download" select
      And the browser webview is displayed
      And the PDF file is opened
     When clicks on the "share" button
     Then the native sharing options are displayed

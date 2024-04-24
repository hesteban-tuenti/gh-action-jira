# -*- coding: utf-8 -*-
@jira.QANOV-260649
Feature: Invoices Tab Access



  @jira.<jira_id> @android @ber @e2e @har @ios @jira.link.parent_test_plan.QANOV-256037 @mobile
  @moves
  Scenario Outline: ADMIN user who is in the <main_tab> tab can access to the Invoices tab
    Given user has a "telco postpay" account type
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "services-summary-invoice-info" module configured in CMS for "invoices" page
      And user has the "simple-data-card" module configured in CMS for "invoices" page
      And user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.invoices_tab" tab
     Then the "Invoices" page is displayed
      And the "Facturas" header is displayed

    @automatic @smoke @next @qa @cert2 @live @jira.cv.13.8
    Examples:
          | main_tab  | jira_id      |
          | Dashboard | QANOV-260650 |
          | Start     | QANOV-260651 |

    @manual @smoke @jira.cv.24.1
    Examples:
          | main_tab  | jira_id      |
          | Gestiones | QANOV-607266 |

    @automatic @regression @next @qa @cert2 @live @jira.cv.13.8
    Examples:
          | main_tab | jira_id      |
          | Explore  | QANOV-260653 |

  @jira.QANOV-326080 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-256037
  @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @qa @sanity @webapp
  Scenario: User with bills can see the Invoices content
    Given user has a "telco postpay" account type
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has invoices
      And user is in the "Invoices" page
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "invoice_chart_header.average_amount" textfield with the "Media de los últimos \d+ meses (-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the last invoice of the "invoice_chart_header" invoices chart is selected
      And the "invoice_chart_body.bills_summary.selected_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) 20\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "invoice_chart_body.bills_summary.bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "invoice_chart_body.bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed
      And the "invoice_chart_body.invoice_download.icon" icon is displayed
      And the "invoice_chart_body.invoice_download.title" textfield with "Descargar factura en PDF" text is displayed

  @jira.QANOV-326081 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-256037
  @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @regression
  Scenario: ADMIN user without bills can see the empty-case message
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user does not have invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     Then the "invoices_empty_case_icon" icon is displayed
      And the "invoices_empty_case_title" textfield with "Aquí verás tus facturas recientes y el histórico de los últimos meses" text is displayed
      And the "invoices_empty_case_subtitle" textfield with "Cuando las tengas, podrás consultar los detalles, pedir duplicados o reclamarlas." text is displayed

  @jira.QANOV-326082 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with a bill with "no status" payment status access won't see any label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "no_status" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield is not displayed
      And the "invoice_chart_body.bills_summary.button" button is not displayed

  @jira.QANOV-326083 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with a bill with "in_progress" payment status access will see a yellow label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "in_progress" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield with "En proceso de pago" text is displayed
      And the "invoice_chart_body.bills_summary.label" label is displayed in "yellow" color
      And the "invoice_chart_body.bills_summary.button" button is not displayed

  @jira.QANOV-326084 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with a bill with "paid" payment status access will see a green label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "paid" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield with "Pagada" text is displayed
      And the "invoice_chart_body.bills_summary.label" label is displayed in "green" color
      And the "invoice_chart_body.bills_summary.button" button is not displayed

  @jira.QANOV-326085 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with a bill with "in_favour" payment status access will see a green label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "in_favour" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield with "Importe a tu favor" text is displayed
      And the "invoice_chart_body.bills_summary.label" label is displayed in "green" color
      And the "binvoice_chart_body.ills_summary.button" button is not displayed

  @jira.QANOV-478548 @android @ios @jira.cv.14.9 @manual @mobile @moves @regression
  Scenario: ADMIN user with a bill with "available" payment status access will see a blue label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "available" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield with "Disponible" text is displayed
      And the "invoice_chart_body.bills_summary.label" label is displayed in "blue" color
      And the "binvoice_chart_body.bills_summary.button" button is not displayed

  @jira.QANOV-326086 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with a bill with "payment_period" payment status access will see a red label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "payment_period" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield with "Pendiente de pago" text is displayed
      And the "invoice_chart_body.bills_summary.label" label is displayed in "red" color
      And the "invoice_chart_body.bills_summary.button" button with "Pagar factura" text is displayed

  @jira.QANOV-326087 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with a bill with "overdue" payment status access will see a red label in the Invoice details
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user has the "simple-highlighted-card" module configured in CMS for "invoices" page
      And user has invoices
      And user has a bill with "overdue" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "invoice_chart_body.bills_summary.label" textfield with "Pendiente de pago" text is displayed
      And the "invoice_chart_body.bills_summary.label" label is displayed in "red" color
      And the "invoice_chart_body.bills_summary.button" button with "Pagar factura" text is displayed

  @jira.QANOV-270129 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: Invoices page is scrolled up when user taps on the Invoices tab button after scrolling down
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user is in the "Invoices" page
     When scrolls down
      And the "bills_screen_title" textfield is not visible in the actual screen
      And clicks on the "navigation_tab_bar.invoices_tab" tab
     Then the "bills_screen_title" textfield with the "Facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves @regression
  Scenario Outline: <account_type> ADMIN user cannot see the Invoices tab
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
     Then the "navigation_tab_bar.invoices_tab" tab is not displayed

    Examples:
          | account_type | jira_id      |
          | legado       | QANOV-260656 |
          | telco prepay | QANOV-260657 |

  @jira.QANOV-260658 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: App versions < 13.8 cannot display the Invoices tab
    Given user has a "any_admin" role
     Then the "navigation_tab_bar.invoices_tab" tab is not displayed

  @jira.QANOV-260659 @android @ios @jira.cv.13.8 @jira.link.detects.ANDROID.11833 @jira.link.parent_test_plan.QANOV-256037
  @manual @mobile @moves @regression
  Scenario: ADMIN user without connectivity access to the Bills screen (and Bills screen is not cached): an error message is displayed
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has invoices for "any" months
      And the "Invoices" page is not cached
      And user turns on the Airplane mode
      And user has the matching subscription selected in the account
      And user is in the "Dashboard" page
     When clicks on the "navigation_tab_bar.invoices_tab" link
     Then the "Invoices" page is displayed
      And the "bills_no_connectivity_error_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "bills_no_connectivity_error_subtitle" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed

  @jira.QANOV-313074 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-256037 @manual @mobile @moves
  @regression
  Scenario: Page is refreshed when user pulls down the Invoices page
    Given user is in the "Invoices" page
     When pulls down the page to refresh
      And waits until the "skeleton" element is not visible
     Then the "error_loading_text" textfield is not displayed
      And the "bills_screen_title" textfield is not visible in the actual screen

  @jira.QANOV-360498 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @moves @smoke
  Scenario: Invoices screen is autorefreshed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user is in the "Dashboard" page
     When clicks on the "navigation_tab_bar.invoices_tab" tab
     Then the "Invoices" page is autorefreshed
      And the "Invoices" page is displayed

  @jira.QANOV-410822 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User without bills can see the empty-case message
    Given user does not have invoices
      And user is in the "Invoices" page
     Then the "invoices_empty_case_icon" icon is displayed
      And the "invoices_empty_case_title" textfield with "Aun no tienes facturas disponibles" text is displayed
      And the "invoices_empty_case_subtitle" textfield with "Cuando se genere tu primera factura, podrás verla aquí." text is displayed

  @jira.QANOV-410823 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with bills can see the Invoices tab content
    Label could be displayed in some invoices depending on its status, there are other scenarios checking that
    Given user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     Then the "Facturas" header is displayed
      And the "bills_screen_title" textfield with the "Total facturado en (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format is displayed
      And the "bill_amount_graph" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "last" month is selected in the bills graph
      And the "bills_summary_list" list is displayed
      And each element in the "bills_summary_list" list has the "label" field
      And each element in the "bills_summary_list" list has the "title" field
      And each element in the "bills_summary_list" list has the "bill_id" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "bills_summary_list" list has the "bill_date" textfield with the "Fecha de emisión: \d\d (Ene|Feb|Mar|Abr|May|Jun|Jul|Ago|Sep|Oct|Nov|Dic) 2\d · \d{3} \d{3} \d{3" format
      And each element in the "bills_summary_list" list has the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format
      And each element in the "bills_summary_list" list has the "bill_id" link with "[LANG:bills.bill_details.see_details]" text

  @jira.QANOV-410824 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: A user can select a different month in the Invoices tab: The info displayed corresponds to the new bill
    Label will also be displayed if the selected bill is in the fllowing status: paying, favour_debt, paid, pending_payment
    Given user has invoices for "some" months
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on a different month in the bills graph
     Then the "bills_screen_title" textfield with the "Total facturado en [CONTEXT:selected_month]" format is displayed
      And the "bill_amount_graph" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "bills_summary_list" list is displayed
      And each element in the "bills_summary_list" list has the "label" field
      And each element in the "bills_summary_list" list has the "title" field
      And each element in the "bills_summary_list" list has the "bill_id" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "bills_summary_list" list has the "bill_date" textfield with the "Fecha de emisión: \d\d ([CONTEXT:selected_month_abreviated]) 2\d · \d{3} \d{3} \d{3}" format
      And each element in the "bills_summary_list" list has the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format
      And each element in the "bills_summary_list" list has the "bill_id" link with "[LANG:bills.bill_details.see_details]" text

  @jira.QANOV-410825 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user can see >1 bill for a month in the Invoices tab
    Given user has ">1" bills for "any" months
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "bills_summary_list" list has ">1" elements
      And each element in the "bills_summary_list" list has the "label" field
      And each element in the "bills_summary_list" list has the "title" field
      And each element in the "bills_summary_list" list has the "bill_id" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "bills_summary_list" list has the "bill_date" textfield with the "Fecha de emisión: \d\d ([CONTEXT:selected_month_abreviated])" format
      And each element in the "bills_summary_list" list has the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format
      And each element in the "bills_summary_list" list has the "bill_id" link with "[LANG:bills.bill_details.see_details]" text

  @jira.QANOV-410826 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Admin user can see the details for a bill
    Given user has a "admin" role
      And user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "bills_summary.see_bill_details_link" link
     Then the "Bill Details" page is displayed
      And the header that contains the "Factura" text is displayed
      And the "bill_date" textfield with the "Factura emitida el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} '\d\d" format is displayed
      And the "bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "bill_download_button" button with "Descargar factura" text is displayed
      And the "whatsapp" card is displayed
      And the "doubts" card is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

  @jira.QANOV-410829 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Admin light user can not see the details for a bill
    Given user has a "admin-light" role
      And user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "bills_summary.see_bill_details_link" link
     Then the "Login Escalation Required" page is displayed

  @jira.QANOV-410830 @android @ber @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: Admin user can download a bill on android devices
    Given user has invoices
      And user has a "admin" role
      And user has installed the "Google Drive" app
      And user is in the "Bill Details" page
     When clicks on the "bill_download_button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the PDF file is opened

  @jira.QANOV-410831 @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: Admin user can open a bill on iOS devices
    Given user has invoices
      And user has a "admin" role
      And user is in the "Bill Details" page
     When clicks on the "bill_download_button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bill Details" page is displayed

  @jira.QANOV-410832 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Admin user with whatsapp installed can access the whatsapp chat from the Bill Details screen
    Given user has invoices
      And user has a "admin" role
      And user is in the "Bill Details" page
     When clicks on the "whatsapp" card
     Then the "WhatsApp" app is displayed
      And the O2 chat assistant is displayed

  @jira.QANOV-410833 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: Admin user without whatsapp installed clicks on the whatsapp card: External webview is displayed
    Given user has invoices
      And user has a "admin" role
      And user is in the "Bill Details" page
     When clicks on the "whatsapp" card
     Then the external webview is displayed
      And the "TBD" string is displayed

  @jira.QANOV-410834 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: Admin user can access the bill doubts OB webview from Bill Details screen
    Given user has invoices
      And user has a "admin" role
      And user is in the "Bill Details" page
     When clicks on the "doubts" card
     Then the browser webview with "TBD" text in the header is displayed
      And the "TBD" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bill Details" page is displayed

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.Future @manual @mobile @o2es
  Scenario Outline: User can see a label for a bill in <status> status
    Given user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has a bill with "<status>" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And the "bills_summary.label" textfield with "<label_text>" text is displayed
      And the "bills_summary.label" label is displayed in "<label_color>" color

    Examples:
          | status          | label_text         | label_color | priority   | ber | jira_id      |
          | favour_debt     | Abono              | blue        | regression |     | QANOV-410835 |
          | paying          | En proceso de pago | yellow      | regression |     | QANOV-410836 |
          | paid            | Pagada             | green       | regression |     | QANOV-410837 |
          | pending_payment | Pendiente de pago  | red         | smoke      | ber | QANOV-410838 |

  @jira.QANOV-410839 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can see a bill not ready to be paid
    Given user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has a bill with "not_ready" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And the "bills_summary.label" textfield is not displayed
      And the "bills_summary.title" textfield is displayed
      And the "bills_summary.bill_id" textfield with the "Factura n.º: [\s\S]*" format is displayed
      And the "bills_summary.bill_date" textfield with the "Fecha de emisión: \d\d (Ene|Feb|Mar|Abr|May|Jun|Jul|Ago|Sep|Oct|Nov|Dic) 2\d · Línea \d{3} \d{3} \d{3}" format is displayed
      And the "bills_summary.bill_amount" textfield with the "(-)?(\d*(\.\d{3})?),[0-9]{2} €" format is displayed
      And the "bills_summary.see_bill_details_link" link with "[LANG:bills.bill_details.see_details]" text is displayed

  @jira.QANOV-410840 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with a bill pending to pay can see an alert in the Invoices page
    Given user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has a bill with "pending_payment" payment status
      And user is in the "Invoices" page
     Then the "pending_payment_alert" element is on display

  @jira.QANOV-410841 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with a bill pending to pay can see a button to pay the bill
    Given user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has a bill with "pending_payment" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
     Then the "bills_summary.pay_button" button with "Pagar factura" text is displayed

  @jira.QANOV-410842 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with a bill pending to pay can initiate the payment flow
    Given user has invoices
      And user has the "invoice-chart-header" module configured in CMS for "invoices" page
      And user has the "invoice-chart-body" module configured in CMS for "invoices" page
      And user has a bill with "pending_payment" payment status
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.pay_button" button
     Then the "Debt Payment Summary" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-67918
Feature: Debt Visualization

  Actions After each Scenario:
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-377188 @android @automatic @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @regression @webapp
  Scenario: A telco postpay user logged in as admin with legado debt clicks on the pending bills entrypoint and sees the Bill Selection screen
    other_affected_versions="2023-23"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "legado" debt
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And each element in the "unpaid_bills" list has the "label" textfield with the "(En periodo de pago|Pendiente)" format
      And each element in the "unpaid_bills" list has the "bill_date" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format
      And each element in the "unpaid_bills" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "unpaid_bills" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "unpaid_bills" list has the "bill_details_link" textfield with "Ver factura" text
      And each element in the "unpaid_bills" list has the "selected" field
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Debt Detail" page is displayed

  @jira.QANOV-377189 @android @automatic @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @smoke @webapp
  Scenario: A telco postpay user logged in as admin with telco debt from one legal entity clicks on the pending bills entrypoint
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2023-23"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Bill Selection" page is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And each element in the "unpaid_bills" list has the "label" textfield with the "(En periodo de pago|Pendiente)" format
      And each element in the "unpaid_bills" list has the "bill_date" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format
      And each element in the "unpaid_bills" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "unpaid_bills" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "unpaid_bills" list has the "bill_details_link" textfield with "Ver factura" text
      And each element in the "unpaid_bills" list has the "selected" field
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Invoices" page is displayed

  @jira.QANOV-600450 @android @ios @jira.cv.Future @jira.parent_test_plan.QANOV-142826 @jira.parent_test_plan.QANOV-600449
  @mobile @o2es @qa @smoke @webapp @e2e
  Scenario: A telco postpay user logged in as admin without debt acceses debt visualization: Empty case is shown
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2023-23"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Empty Case Bill Selection" page is displayed
      And the "empty_case_title" textfield with "No tienes facturas para pagar" text is displayed
      And the "empty_case_title" textfield with "Todas las facturas o documentos de cobro pendientes aparecerán aquí para poder realizar el pago." text is displayed
      And the "back" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Invoices" page is displayed

  @jira.<jira_id> @<brand> @android @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  Scenario Outline: A telco postpay user logged in as admin with telco debt from several legal entities clicks on the pending bills entrypoint
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2023-23"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Debt Detail" page is displayed
      And the "main_title" textfield with "<main_title>" text is displayed
      And the "debt_list" list has "2" elements
      And each element in the "debt_list" list has the "entity_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "debt_list" list has the "debt_type_label" textfield with "Pendiente de pago" text
      And each element in the "debt_list" list has the "icon" field
      And each element in the "debt_list" list has the "chevron" field
      And the "0" index in the "debt_list" list has the "entity_label" field with "[LANG:payments.landline_entity]" text
      And the "1" index in the "debt_list" list has the "entity_label" field with "[LANG:payments.mobile_entity]" text
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Invoices" page is displayed

    @automatic @jira.link.parent_test_plan.QANOV-189597
    @jira.link.parent_test_plan.QANOV-67291
    Examples:
          | brand | cv   | main_title       | jira_id      |
          | moves | 14.5 | Facturas a pagar | QANOV-377190 |

    @jira.parent_test_plan.QANOV-600449 @manual @e2e
    Examples:
          | brand | cv     | main_title    | jira_id      |
          | o2es  | Future | Deuda a pagar | QANOV-600451 |

  @jira.QANOV-296630 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin with payable documents from several legal entities clicks on the pending bills entrypoint
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" payable documents from "TDE" legal entity
      And user has "pending" payable documents from "TME" legal entity
      And user does not have "any" debt
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Debt Detail" page is displayed
      And the "main_title" textfield with "Facturas a pagar" text is displayed
      And the "debt_list" list has "2" elements
      And each element in the "debt_list" list has the "entity_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "debt_list" list has the "debt_type_label" textfield with "Pendiente de pago" text
      And each element in the "debt_list" list has the "icon" field
      And each element in the "debt_list" list has the "chevron" field
      And the "0" index in the "debt_list" list has the "entity_label" field with "[LANG:payments.landline_entity]" text
      And the "1" index in the "debt_list" list has the "entity_label" field with "[LANG:payments.mobile_entity]" text
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario Outline: A telco postpay user logged in as admin with debt from <legal_entity_1> and payable documents from <legal_entity_2> clicks on the pending bills entrypoint
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "any" debt from "<legal_entity_1>" legal entity
      And user has "pending" payable documents from "<legal_entity_2>" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Debt Detail" page is displayed
      And the "main_title" textfield with "Facturas a pagar" text is displayed
      And the "debt_list" list has "2" elements
      And each element in the "debt_list" list has the "entity_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "debt_list" list has the "debt_type_label" textfield with "Pendiente de pago" text
      And each element in the "debt_list" list has the "icon" field
      And each element in the "debt_list" list has the "chevron" field
      And the "0" index in the "debt_list" list has the "entity_label" field with "[LANG:payments.landline_entity]" text
      And the "1" index in the "debt_list" list has the "entity_label" field with "[LANG:payments.mobile_entity]" text
      And the "total_amount_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_amount" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Invoices" page is displayed

    Examples:
          | legal_entity_1 | legal_entity_2 | jira_id      |
          | TDE            | TME            | QANOV-296631 |
          | TME            | TDE            | QANOV-296632 |

  @jira.<jira_id> @android @mobile @qa @smoke @webapp
  Scenario Outline: A telco postpay user logged in as admin selects legal entity in the "Debt detail" screen
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "<legal_entity>" value of the "debt_list" list
     Then the "Bill Selection" page is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And each element in the "unpaid_bills" list has the "label" textfield with "Pendiente de pago" text
      And each element in the "unpaid_bills" list has the "bill_date" textfield with the "(Factura|Documento de cobro) de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format
      And each element in the "unpaid_bills" list has the "bill_number" textfield with the "(Factura n|N).º: [\s\S]*" format
      And each element in the "unpaid_bills" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And any element in the "unpaid_bills" list has the "bill_details_link" textfield with the "Ver factura" text
      And each element in the "unpaid_bills" list has the "selected" field
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Debt Detail" page is displayed

    @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-189597
    @jira.link.parent_test_plan.QANOV-67291 @moves
    Examples:
          | legal_entity                    | jira_id      |
          | [LANG:payments.landline_entity] | QANOV-67943  |
          | [LANG:payments.mobile_entity]   | QANOV-202425 |

    @jira.cv.Future @jira.parent_test_plan.QANOV-142826
    @jira.parent_test_plan.QANOV-600449 @manual @o2es @e2e
    Examples:
          | legal_entity                    | jira_id      |
          | [LANG:payments.landline_entity] | QANOV-600452 |
          | [LANG:payments.mobile_entity]   | QANOV-600453 |

  @jira.<jira_id> @ios @mobile @qa @smoke
  Scenario Outline: A telco postpay user logged in as admin selects legal entity in the "Debt detail" screen on iOS devices
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "<legal_entity>" value of the "debt_list" list
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And each element in the "unpaid_bills" list has the "label" textfield with "Pendiente de pago" text
      And each element in the "unpaid_bills" list has the "bill_date" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format
      And each element in the "unpaid_bills" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "unpaid_bills" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "unpaid_bills" list has the "bill_details_link" textfield with "Ver factura" text
      And each element in the "unpaid_bills" list has the "selected" field
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And the "navigation_tab_bar.invoices_tab" element is not on display
      And clicks on the "navigation_top_bar.back_button" button
      And the "Debt Detail" page is displayed

    @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-189597
    @jira.link.parent_test_plan.QANOV-67291 @moves
    Examples:
          | legal_entity                    | jira_id      |
          | [LANG:payments.landline_entity] | QANOV-202426 |
          | [LANG:payments.mobile_entity]   | QANOV-202427 |

    @jira.cv.Future @jira.parent_test_plan.QANOV-142826
    @jira.parent_test_plan.QANOV-600449 @manual @o2es @e2e
    Examples:
          | legal_entity                    | jira_id      |
          | [LANG:payments.landline_entity] | QANOV-600454 |
          | [LANG:payments.mobile_entity]   | QANOV-600455 |

  @jira.QANOV-296633 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin selects legal entity in the "Debt detail" screen with payable documents and debt
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt
      And user has "pending" payable documents
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And each element in the "unpaid_bills" list has the "label" textfield with "Pendiente de pago" text
      And each element in the "unpaid_bills" list has the "bill_date" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre)" format
      And each element in the "unpaid_bills" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "unpaid_bills" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "unpaid_bills" list has the "bill_details_link" textfield with "Ver factura" text
      And each element in the "unpaid_bills" list has the "selected" field
      And the "payable_documents_label" textfield with "OTROS PAGOS" text is displayed
      And the "payable_documents_list" list is displayed
      And each element in the "payable_documents_list" list has the "label" textfield with "Pendiente" text
      And each element in the "payable_documents_list" list has the "bill_date" textfield with "Documento de cobro" text
      And each element in the "payable_documents_list" list has the "bill_number" textfield with the "N.º: [\s\S]*" format
      And each element in the "payable_documents_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "unpaid_bills" list has the "selected" field
      And the "continue_button" button with "Continuar" text is displayed
      And the "navigation_tab_bar.account_tab" element is not on display
      And clicks on the "navigation_top_bar.back_button" button
      And the "Debt Detail" page is displayed

  @jira.QANOV-296634 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin selects legal entity in the "Debt detail" screen with only payable documents
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" payable documents
      And user does not have "any" debt
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is not displayed
      And the "payable_documents_label" textfield with "OTROS PAGOS" text is displayed
      And the "payable_documents_list" list is displayed
      And each element in the "payable_documents_list" list has the "label" textfield with "Pendiente" text
      And each element in the "payable_documents_list" list has the "bill_date" textfield with "Documento de cobro" text
      And each element in the "payable_documents_list" list has the "bill_number" textfield with the "N.º: [\s\S]*" format
      And each element in the "payable_documents_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And each element in the "unpaid_bills" list has the "selected" field
      And the "continue_button" button with "Continuar" text is displayed
      And the "navigation_tab_bar.account_tab" element is not on display
      And clicks on the "navigation_top_bar.back_button" button
      And the "Debt Detail" page is displayed

  @jira.QANOV-67945 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin clicks view details of one of the bills on the "Bill Selection" screen
    Note: for some bills more than one document might be available for download. In such case, a native dialog to select the document will be presented to the user
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user has installed the "Google Drive" app
      And user is in the "Invoices" page
      And clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
     When clicks on the "0" element in the "unpaid_bills" list
      And switches to original frame
      And the "Bill Download" page is displayed
      And clicks on the "bill_download" button
      And switches to original frame
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-600456 @android @ios @jira.cv.Future @jira.parent_test_plan.QANOV-142826 @jira.parent_test_plan.QANOV-600449
  @manual @o2es @regression @e2e
  Scenario: A telco postpay user logged in as admin clicks view details of one of the bills on the "Bill Selection" screen
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
      And clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
     When clicks on the "0" element in the "unpaid_bills" list
      And switches to original frame
     Then the "Bill Download Loading Screen" page is displayed
      And the "spinner" element is displayed
      And the "loading_title" textfield with "Estamos preparando tu factura" text is displayed
      And the "loading_subtitle" textfield with "Espera, puede tardar hasta 10 segundos" text is displayed
      And waits until the "spinner" element is not visible
      And the "Bill Download" page is displayed
      And the "download_title" textfield with "Ya puedes ver tu factura" text is displayed
      And the "download_message" textfield with "Ahora tu factura está disponible para que la consultes cuando la necesites." text is displayed
      And the "bill_download" button is displayed

  @jira.QANOV-600457 @android @jira.cv.Future @jira.parent_test_plan.QANOV-142826 @jira.parent_test_plan.QANOV-600449
  @manual @o2es @regression @e2e
  Scenario: A telco postpay user logged in as admin clicks view details of one of the bills on the "Bill Selection" screen on Android devices
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user has installed the "Google Drive" app
      And user is in the "Invoices" page
      And clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
     When clicks on the "0" element in the "unpaid_bills" list
      And switches to original frame
      And the "Bill Download Loading Screen" page is displayed
      And waits until the "spinner" element is not visible
      And the "Bill Download" page is displayed
      And clicks on the "bill_download" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d{13}.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-600458 @ios @jira.cv.Future @jira.parent_test_plan.QANOV-142826 @jira.parent_test_plan.QANOV-600449 @manual
  @o2es @regression @e2e
  Scenario: A telco postpay user logged in as admin clicks view details of one of the bills on the "Bill Selection" screen on iOS devices
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
      And clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
     When clicks on the "0" element in the "unpaid_bills" list
      And switches to original frame
      And the "Bill Download Loading Screen" page is displayed
      And waits until the "spinner" element is not visible
      And the "Bill Download" page is displayed
      And clicks on the "bill_download" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @<brand> @android @ios @mobile @qa @regression @webapp
  Scenario Outline: A telco postpay user logged in as admin clicks continue button in the "Bill Selection" screen with no bills selected
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "unpaid;overdue" debt from "TME" legal entity
      And user does not have "unpaid;overdue" debt from "TDE" legal entity
      And user is in the "Invoices" page
      And clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
     When clicks on all "selected" buttons of "unpaid_bills" list
      And clicks on the "continue_button" button
     Then the "dialog" element is on display
      And the "dialog.title" textfield with "Ninguna factura seleccionada" text is displayed
      And the "dialog.message" textfield with "Selecciona al menos una factura para continuar con el pago." text is displayed
      And the "dialog.accept" button with "Entendido" text is displayed

    @automatic @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291
    Examples:
          | brand | jira_id     |
          | moves | QANOV-67946 |

    @jira.cv.Future @jira.parent_test_plan.QANOV-600449 @manual @e2e
    Examples:
          | brand | jira_id      |
          | o2es  | QANOV-600459 |

  @jira.QANOV-202429 @android @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @regression @webapp
  Scenario: A telco postpay user logged with the no bill selected modal can close it by tapping on "accept" button
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "unpaid;overdue" debt from "TME" legal entity
      And user does not have "unpaid;overdue" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And clicks on the "continue_button" button
      And the "dialog" module is displayed
      And clicks on the "dialog.accept" button
      And waits until the "dialog" element is not visible
     Then the "dialog" module is not displayed

  @jira.<jira_id> @<test_priority> @android @automatic @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2437
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @webapp
  Scenario Outline: A telco postpay user logged in as admin clicks continue button in the "Bill Selection" screen with <bills_selected> bills selected
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user has "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "<legal_entity>" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And selects "<bills_selected>" elements of "unpaid_bills" list
      And clicks on the "continue_button" button
     Then the "Debt Payment Summary" page is displayed
      And the "main_title" textfield with "Resumen del pago" text is displayed
      And the "invoices_list_title" textfield with "FACTURAS" text is displayed
      And the "selected_bills_list" list has "<bills_selected>" elements
      And each element in the "selected_bills_list" list has the "bill_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format
      And each element in the "selected_bills_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "selected_bills_list" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "selected_bills_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

    Examples:
          | legal_entity | bills_selected | test_priority | jira_id     |
          | Línea móvil  | 1              | smoke         | QANOV-67947 |
          | Fijo         | 2              | regression    | QANOV-67948 |

  @jira.QANOV-296635 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with only one payable document and without debt clicks continue button in the "Debt Detail" screen and does not see the "Bill Selection" screen
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have "any" debt
      And user has "1" payable documents
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "Fijo" value of the "debt_list" list
     Then the "Debt Payment Summary" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Resumen del pago" text is displayed
      And the "invoices_list_title" textfield with "FACTURAS" text is displayed
      And the "payable_documents_list" list has "<payable_documents_selected>" elements
      And each element in the "payable_documents_list" list has the "bill_month" textfield with the "Documento de cobro de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format
      And each element in the "payable_documents_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "payable_documents_list" list has the "bill_number" textfield with the "N.º: [\s\S]*" format
      And each element in the "payable_documents_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario Outline: A telco postpay user logged in as admin with payable documents and without debt clicks continue button in the "Bill Selection" screen with <payable_documents_selected> payable documents
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user does not have "any" debt
      And user has "pending" payable documents
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "Fijo" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "payable_documents_list" list
      And selects "<payable_documents_selected>" elements of "payable_documents_list" list
      And clicks on the "continue_button" button
     Then the "Debt Payment Summary" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Resumen del pago" text is displayed
      And the "invoices_list_title" textfield with "FACTURAS" text is displayed
      And the "payable_documents_list" list has "<payable_documents_selected>" elements
      And each element in the "payable_documents_list" list has the "bill_month" textfield with the "Documento de cobro de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format
      And each element in the "payable_documents_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "payable_documents_list" list has the "bill_number" textfield with the "N.º: [\s\S]*" format
      And each element in the "payable_documents_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

    Examples:
          | legal_entity | payable_documents_selected | test_priority | jira_id      |
          | Línea móvil  | 1                          | smoke         | QANOV-296636 |
          | Fijo         | 2                          | regression    | QANOV-296637 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  Scenario Outline: A telco postpay user logged in as admin clicks continue button in the "Bill Selection" screen with <bills_selected> bills selected and <payable_documents_selected> payable documents selected
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    TO UPDATE QANOV-67947 and QANOV-67948 when Kairos goes to live environment
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" debt from "TME" legal entity
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" payable documents
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "<legal_entity>" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on all "selected" buttons of "unpaid_bills" list
      And clicks on all "selected" buttons of "payable_documents_list" list
      And selects "<bills_selected>" elements of "unpaid_bills" list
      And selects "<payable_documents_selected>" elements of "payable_documents_list" list
      And clicks on the "continue_button" button
     Then the "Debt Payment Summary" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "main_title" textfield with "Resumen del pago" text is displayed
      And the "invoices_list_title" textfield with "FACTURAS" text is displayed
      And the "selected_bills_list" list has "<bills_selected>" elements
      And each element in the "selected_bills_list" list has the "bill_month" textfield with the "Factura de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format
      And each element in the "selected_bills_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "selected_bills_list" list has the "bill_number" textfield with the "Factura n.º: [\s\S]*" format
      And each element in the "selected_bills_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "payable_documents_list" list has "<payable_documents_selected>" elements
      And each element in the "payable_documents_list" list has the "bill_month" textfield with the "Documento de cobro de (enero|febrero|marzo|abril|mayo|junio|julio|agosto|septiembre|octubre|noviembre|diciembre) de 20\d\d" format
      And each element in the "payable_documents_list" list has the "bill_status" textfield with "Pendiente de pago" text
      And each element in the "payable_documents_list" list has the "bill_number" textfield with the "N.º: [\s\S]*" format
      And each element in the "payable_documents_list" list has the "bill_amount" textfield with the "[LANG:payments.debt_amount_format]" format
      And the "total_debt_label" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_debt" textfield with the "[LANG:payments.debt_amount_format]" format is displayed
      And the "continue_button" button with "Continuar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

    Examples:
          | legal_entity | bills_selected | payable_documents_selected | test_priority | jira_id      |
          | Línea móvil  | 1              | 1                          | smoke         | QANOV-296638 |
          | Fijo         | 2              | 2                          | regression    | QANOV-296639 |

  @jira.QANOV-142052 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.7
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who has all debts in payment process cannot continue the payment flow
    While invoice is not paid in checkout, the status will be "in process of payment". We cannot control when the bill will disappear. After 5 days, if debt is retrieved by 4P, checkout will show again to pay it
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has all debts in payment process
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Bill Selection" page is displayed
      And clicks on the "continue" button
     Then the "dialog" element is displayed
      And the "dialog.title" textfield with "Ninguna factura seleccionada" text is displayed
      And the "dialog.message" textfield with "Selecciona al menos una factura para continuar con el pago." text is displayed
      And the "dialog.accept" button with "Entendido" text is displayed
      And the "dialog.close" button is displayed

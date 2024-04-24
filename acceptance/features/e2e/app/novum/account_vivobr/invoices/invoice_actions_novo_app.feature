# -*- coding: utf-8 -*-
@jira.QANOV-474583
Feature: Invoice Actions Novo App


  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario Outline: A <account_type> user can access to the "Bills Details" screen associated to a bill
    Given user has a "<account_type>" account type
      And user has invoices
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.more_details" button
     Then the "Bills Details" page is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-474584 |
          | multivivo    | QANOV-474585 |
          | convergente  | QANOV-474586 |

  @jira.<jira_id> @<ber> @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity @vivobr
  Scenario Outline: A <account_type> user can download an original bill on android devices
    Given user has a "<account_type>" account type
      And user has invoices
      And user has installed the "Google Drive" app
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.see_invoice" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-474587 |
          | convergente  | ber | QANOV-474588 |
          | multivivo    |     | QANOV-474589 |

  @jira.<jira_id> @<ber> @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity @vivobr
  Scenario Outline: A <account_type> user can open an original bill on iOS devices
    Given user has a "<account_type>" account type
      And user has invoices
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.see_invoice" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      |     | QANOV-474590 |
          | convergente  | ber | QANOV-474591 |
          | multivivo    | ber | QANOV-474592 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @regression
  @vivobr
  Scenario Outline: User can zoom in and out on an original bill
    Given user has a "beatrix;convergente;multivivo" account type
      And user has invoices
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.see_invoice" button
      And the "original" bill file is displayed
      And zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id      |
          | in        | bigger  | QANOV-474593 |
          | out       | smaller | QANOV-474594 |

  @jira.QANOV-474595 @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: User can share an original bill on iOS devices
    Given user has a "beatrix;convergente;multivivo" account type
      And user has invoices
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.see_invoice" button
      And the browser webview is displayed
      And the PDF file is opened
      And clicks on the "share" button
     Then the native sharing options are displayed

  @jira.<jira_id> @smoke @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<test_plan> @manual @mobile
  @vivobr
  Scenario Outline: A beatrix;convergente;multivivo user with a <status> bill can access to the "Inform Payment" screen
    Given user has a "beatrix;convergente;multivivo" account type
      And user has a month with "<status>" invoice
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list with the "label_status" field with the "<status_text>" text
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.<link>" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Meatball Menu" page is displayed

    Examples:
          | status    | status_text | link           | test_plan    | jira_id      |
          | delayed   | Atrasada    | inform_payment | QANOV-454142 | QANOV-474596 |
          | negociada | Negociada   | show_agreement | QANOV-497058 | QANOV-474597 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario Outline: A <account_type> user with a delayed bill can copy bill barcode
    Given user has a "<account_type>" account type
      And has "1" invoices in "delayed" status
      And user has a month with "delayed" invoice less than "2" months
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list with the "label_status" field with the "Atrasada" text
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.copy_barcode" button
     Then the "warning" textfield with "Vocé copiou o código de barras" text is displayed
      And the clipboard has the "bill_barcode" text

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-474601 |
          | multivivo    | QANOV-474602 |
          | convergente  | QANOV-474603 |

  @jira.QANOV-517436 @android @ber @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @sanity
  @vivobr
  Scenario: User can download an original bill on android devices during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user has invoices
      And user has installed the "Google Drive" app
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.see_invoice" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Documento_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-517437 @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @sanity @vivobr
  Scenario: User can open an original bill on iOS devices during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user has invoices
      And user is in the "Bills Central" page
     When clicks on the "meatball_menu" button of any element of the "bills_central_cards" list
      And the "Meatball Menu" page is displayed
      And clicks on the "meatball_menu_entrypoint_list.see_invoice" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

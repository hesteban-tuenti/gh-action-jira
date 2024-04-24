# -*- coding: utf-8 -*-
@jira.QANOV-204363
Feature: Invoices

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.QANOV-204364 @android @automatic @ber @blaude @ios @jira.cv.13.9 @live @mobile @next @qa @raitt_drop1 @sanity
  @webapp
  Scenario: Postpay user with bills for an active mobile line product can access to the "Bills" screen
    Given user has a "mobile_line" product in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Last months invoices graph" module configured in CMS for "Account" page
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header;Bills settings;Bills services" modules configured in CMS for "Bills" page
      And user is in the "Account" page
     When clicks on the "bills.chart.see_all_invoices_link" link
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed
      And the "invoice_chart_header" module is displayed
      And the last invoice of the "invoice_chart_header" invoices chart is selected
      And the "invoice_chart_body_list" list is displayed
      And the "invoice_chart_body_list" list has ">0" elements
      And the "bills_settings" list is displayed
      And the "bills_services" list is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-204365 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204364
  @jira.link.depends_on.QANOV-309100 @jira.link.detects.O2DE-276 @live @mobile @next @qa @raitt_drop1 @smoke @webapp
  Scenario: Postpay user with bills can see the header details in the "Bills" screen
    If the user has invoices for more than 6 months, the pagination will be displayed under the invoices chart.
    Given user has a "mobile_line" product in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And a total of "6" months are displayed in the "invoice_chart_header" invoices chart
      And the months in "short" format are displayed in the "invoice_chart_header" invoices chart
      And the "invoice_chart_header.average_amount" textfield with the "Mittlerer Betrag der letzten \d+ Monate: \d+,\d\d €" format is displayed

  @jira.QANOV-204366 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204364
  @jira.link.depends_on.QANOV-309100 @live @mobile @next @qa @raitt_drop1 @smoke @webapp
  Scenario: Postpay user with bills can see the bill details in the "Bills" screen
    Possible bill status:
    - Pending bill: before the due date
    - Updating bill: for 48h after the due date, when the bill is not paid
    - Paid
    - Overdue: after 48h of the due date, and the bill is still not paid
    Pending bill do not have the download button as the bill is still not available (it can be displayed at the end of
    the month when the bill is already available).
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has a "mobile_line" product
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When waits until the "invoice_chart_body.bills_summary" element is present
     Then the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "^Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed

  @jira.QANOV-204367 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204364 @live @mobile
  @next @qa @raitt_drop1 @smoke @webapp
  Scenario: Postpay user with bills for an active mobile line product can see the bills settings in the "Bills" screen
    If a setting is deactivated, a "deactivated" tag will be displayed on top of that setting. When the setting is
    activated, a subtitle appears under the setting and the "deactivated" tag disappears (except for EVN setting, that
    will display an "active" tag).
    NOTE: Temporaly, a "Download EVN" entrypoint will be always displayed (regardless of service status) pointing to a OB
    webview. In the future, it will be replaced by a 'Download EVN' card in the bills summary.
    Given user has a "mobile_line" product in "active" status
      And user has invoices
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_settings" list is displayed
      And the "bills_settings_title" textfield with "RECHNUNGSEINSTELLUNGEN" text is displayed
      And any element in the "bills_settings" list has the "title" textfield with the "EVN herunterladen" text
      And any element in the "bills_settings" list has the "title" textfield with the "Bankverbindung" text
      And any element in the "bills_settings" list has the "title" textfield with the "Online-Rechnung" text
      And any element in the "bills_settings" list has the "title" textfield with the "Rechnungsadresse" text
      And any element in the "bills_settings" list has the "title" textfield with the "EVN Einstellungen" text

  @jira.QANOV-204368 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.dv.Future
  @jira.link.depends_on.QANOV-204364 @live @mobile @next @qa @raitt_drop1 @smoke @webapp
  Scenario: Postpay user with bills for an active mobile line product can see the bills services in the "Bills" screen
    Given user has a "mobile_line" product in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" list is displayed
      And the "bills_services_title" textfield with "MEHR INFORMATIONEN" text is displayed
      And each element in the "bills_services" list has the "title" field
      And each element in the "bills_services" list has the "chevron" field
      And any element in the "bills_services" list has the "title" textfield with the "Jahresübersicht" text
      And any element in the "bills_services" list has the "title" textfield with the "Genutzte Drittanbieterdienste" text
      And any element in the "bills_services" list has the "title" textfield with the "Musterrechnung ansehen" text

  @jira.QANOV-576578 @android @ber @blaude @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-204364
  @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @raitt_drop1 @smoke
  Scenario: Postpay user with bills for an active mobile line product can see the bills services in the "Bills" screen
    Given user has a "mobile_line" product in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" list is displayed
      And the "bills_services_title" textfield with "MEHR INFORMATIONEN" text is displayed
      And each element in the "bills_services" list has the "title" field
      And each element in the "bills_services" list has the "chevron" field
      And any element in the "bills_services" list has the "title" textfield with the "Jahresübersicht" text
      And any element in the "bills_services" list has the "title" textfield with the "Genutzte Drittanbieterdienste" text
      And any element in the "bills_services" list has the "title" textfield with the "Musterrechnung ansehen" text
      And any element in the "bills_services" list has the "title" textfield with the "Drittanbieterdienste" text

  @jira.QANOV-204369 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204365 @manual @mobile @not_hardening
  @regression
  Scenario: Postpay user can select another month in the graph of the "Bills" screen but an error occurs
    Given user has a "mobile_line" product
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on a different month than the selected in the "invoice_chart_header" invoices chart
      And there is an API error when requesting the billing information
     Then the "invoice_chart_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "-,--" format is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_body_empty_case.title" textfield with "[LANG:bills.month_error.bills_error_title]" text is displayed
      And the "invoice_chart_body_empty_case.subtitle" textfield with "[LANG:bills.month_error.bills_error_subtitle]" text is displayed
      And the "invoice_chart_body_empty_case.icon" icon is displayed

  @jira.QANOV-204370 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204365 @live @mobile
  @next @qa @raitt_drop1 @smoke @webapp
  Scenario: Postpay user can select another month in the graph of the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has a "mobile_line" product
      And user has invoices for "some" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on a different month than the selected in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the eligible month is selected in the "invoice_chart_header" invoices chart
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed

  @jira.QANOV-204371 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204365 @manual @mobile @regression
  Scenario: Postpay user with 6 or less months with bills won't see the invoices chart paginated in the "Bills" screen
    Given user has a "mobile_line" product
      And user has invoices for "<=6" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "invoice_chart_header" invoices chart is not paginated

  @jira.QANOV-204372 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204365 @manual @mobile @regression
  Scenario: Postpay user with more than 6 months with bills will see the invoices chart paginated in the "Bills" screen
    User can see bills for the last 24 months.
    Given user has a "mobile_line" product
      And user has invoices for ">6" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "invoice_chart_header" invoices chart is paginated

  @jira.QANOV-204373 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204365 @manual @mobile @regression
  Scenario: Postpay user can see bills for the last 24 months in the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has a "mobile_line" product
      And user has invoices for ">6" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When swipes the "invoice_chart_body" carousel in "right" direction
      And clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed

  @jira.QANOV-204374 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @manual @mobile @raitt_drop1
  @smoke
  Scenario: Postpay user can see the details of a pending bill in the "Bills" screen
    Self-paying customer (customer without bank account) with a pending bill will see a 'View payment methods' -> Zahlungsart anzeigen
    link.
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    The status of the bill will be displayed in an orange pill.
    Given user has a "mobile_line" product
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.status" textfield with the "Fällig zum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is not displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield is not displayed

  @jira.QANOV-204375 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @manual @mobile @raitt_drop1
  @smoke
  Scenario: Postpay user can select a month with a paid bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    The status of the bill will be displayed in a green pill.
    Given user has a "mobile_line" product
      And user has a month with "paid" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.status" textfield with the "Bezahlt" format is displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed
      And the "invoice_chart_body.bills_summary.link" link is not displayed

  @jira.QANOV-204376 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @manual @mobile @raitt_drop1
  @smoke
  Scenario: Postpay user can select a month with an overdue bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    Any user with an overdue bill will see the "View payment methods" link.
    The status of the bill will be displayed in a pink pill.
    Given user has a "mobile_line" product
      And user has a month with "overdue" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.status" textfield with "Überfällig" text is displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed
      And the "invoice_chart_body.bills_summary.link" link with "Zahlungsart anzeigen" text is displayed

  @jira.QANOV-204377 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @manual @mobile @regression
  Scenario: Postpay user can select a month with an updating bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    The status of the bill will be displayed in a grey pill.
    Given user has a "mobile_line" product
      And user has a month with "updating" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.status" textfield with "Aktualisierung" text is displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed
      And the "invoice_chart_body.bills_summary.link" link is not displayed

  @jira.QANOV-204378 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @manual @mobile @regression
  Scenario: Postpay user can select a month with an untagged bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    Given user has a "mobile_line" product
      And user has a month with "untagged" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.status" textfield is not displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed
      And the "invoice_chart_body.bills_summary.link" link is not displayed

  @jira.QANOV-204379 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @jira.link.detects.OBO2DE-222
  @manual @mobile @regression
  Scenario: Postpay user without bank account can see the "view payment methods" link for a pending bill in the "Bills" screen
    Self-payer customers are users who have the 'bank account' setting deactivated.
    Given user has a "mobile_line" product
      And user does not have bank account
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_body.bills_summary.link" link with "Zahlungsart anzeigen" text is displayed

  @jira.QANOV-204380 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @jira.link.detects.O2DE-1284
  @manual @mobile @regression
  Scenario: Postpay user with bank account activated cannot see the "view payment methods" link for a pending bill in the "Bills" screen
    Given user has a "mobile_line" product
      And user has "bank_account" service in "active" status
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_body.bills_summary.link" link is not displayed

  @jira.QANOV-204381 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-204366 @manual @mobile @regression
  Scenario: Postpay user with the EVN setting activated can see the "download EVN" button for a bill in the "Bills" screen
    Given user has a "mobile_line" product
      And user has "EVN" service in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "download_evn_entrypoint" entrypoint with "EVN herunterladen" text is displayed

  @jira.QANOV-204382 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-204366 @manual @mobile @regression
  Scenario: Postpay user with the EVN setting deactivated cannot see the "download EVN" button for a bill in the "Bills" screen
    Given user has a "mobile_line" product
      And user has "EVN" service in "deactivated" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "download_evn_entrypoint" entrypoint is not displayed

  @jira.QANOV-204383 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @manual @mobile @regression
  Scenario: Postpay user can see the details of a month with only a bill in the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has a "mobile_line" product
      And user has a month with "1" invoices
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header" module is displayed
      And the "invoice_chart_body.bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "invoice_chart_body.bills_summary.bill_number" textfield with the "Rechnungsnummer .+" format is displayed
      And the "invoice_chart_body.bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "invoice_chart_body.bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "invoice_chart_body.download_pdf_button.icon" icon is displayed
      And the "invoice_chart_body.download_pdf_button.title" textfield with "PDF herunterladen" text is displayed
      And the "invoice_chart_body.bills_summary.amount" and the "invoice_chart_header.selection_amount" amounts are the same

  @jira.QANOV-204384 @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @mobile @qa
  @regression @webapp
  Scenario: Postpay user see the details of a month with several bills in the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has a "mobile_line" product
      And user has a month with "several" invoices
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
      And waits until the "invoice_chart_header" invoices chart is loaded
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then each element in the "invoice_chart_body_list" list has the "bills_summary" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.title" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.bill_number" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.issue_date" field
      And each element in the "invoice_chart_body_list" list has the "bills_summary.amount" field
      And each element in the "invoice_chart_body_list" list has the "download_pdf_button.icon" field
      And each element in the "invoice_chart_body_list" list has the "download_pdf_button.title" field
      And the "invoice_chart_body_list.bills_summary.bill_amount" and the "invoice_chart_header.selection_amount" amounts are the same

  @jira.QANOV-204385 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366 @jira.link.detects.O2DE-277
  @manual @mobile @regression
  Scenario: Postpay user can select a month without bills in the "Bills" screen
    Given user has a "mobile_line" product
      And user has a month with "no" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
     Then the "invoice_chart_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "invoice_chart_header.selection_title" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "invoice_chart_header.selection_amount" textfield with the "-,--" format is displayed
      And the "invoice_chart_body_empty_case.title" textfield with "[LANG:bills.month_without_bills.bills_empty_case_title]" text is displayed
      And the "invoice_chart_body_empty_case.subtitle" textfield with "[LANG:bills.month_without_bills.bills_empty_case_subtitle]" text is displayed
      And the "invoice_chart_body_empty_case.icon" icon is displayed

  @jira.QANOV-204386 @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204376 @mobile @qa
  @raitt_drop1 @smoke @webapp
  Scenario: Postpay user can access to the "View payment methods" screen
    Self-paying customer (customer without bank account) with a pending bill or any customer with an overdue
    bill will be able to access this "View payment methods" screen through the "View payment methods" link.
    Given user has a "mobile_line" product
      And user has a month with "overdue" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user has the "View Payment Methods" module configured in CMS for "View Payment Methods" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.link" link
     Then the "View Payment Methods" page is displayed
      And the "Zahlungsmöglichkeiten" header is displayed
      And the "title" textfield with "Zahlungsmöglichkeiten" text is displayed
      And the "description" textfield with "Zahle den noch offenen Betrag schnell und einfach per Banküberweisung." text is displayed
      And the "bank_transfer_title" textfield with "Überweisung" text is displayed
      And the "bank_transfer_description" textfield with "Bitte überweise den offenen Betrag auf folgendes Konto:" text is displayed
      And the "bank_transfer_iban" textfield that contains the "IBAN:" text is displayed
      And the "bank_transfer_bic" textfield that contains the "BIC:" text is displayed
      And the "bank_transfer_purpose" textfield that contains the "Verwendungszweck" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-204387 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204379 @manual @mobile @qa
  @raitt_drop1 @smoke @webapp
  Scenario: Postpay user can access to the "View payment methods" screen
    Self-paying customer (customer without bank account) with a pending bill or any customer with an overdue
    bill will be able to access this "View payment methods" screen through the "View payment methods" link.
    Given user has a "mobile_line" product
      And user does not have bank account
      And user has a month with "pending" invoice
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user has the "View Payment Methods" module configured in CMS for "View Payment Methods" page
      And user is in the "Bills" page
     When clicks on the eligible month in the "invoice_chart_header" invoices chart
      And clicks on the "invoice_chart_body.bills_summary.link" link
     Then the "View Payment Methods" page is displayed
      And the "Zahlungsmöglichkeiten" header is displayed
      And the "title" textfield with "Zahlungsmöglichkeiten" text is displayed
      And the "description" textfield with "Zahle den noch offenen Betrag schnell und einfach per Banküberweisung." text is displayed
      And the "bank_transfer_title" textfield with "Überweisung" text is displayed
      And the "bank_transfer_description" textfield with "Bitte überweise den offenen Betrag auf folgendes Konto:" text is displayed
      And the "bank_transfer_iban" textfield that contains the "IBAN:" text is displayed
      And the "bank_transfer_bic" textfield that contains the "BIC:" text is displayed
      And the "bank_transfer_purpose" textfield that contains the "Verwendungszweck" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bills" page is displayed

  @jira.QANOV-204390 @android @automatic @ber @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204366
  @jira.link.detects.O2DE-2779 @live @mobile @next @raitt_drop1 @sanity
  Scenario: Postpay user can download a bill on android devices
    Given user has a "mobile_line" product
      And user has invoices
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "invoice_chart_body.download_pdf_button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-204391 @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204366
  @jira.link.detects.O2DE-2779 @live @mobile @next @raitt_drop1 @sanity
  Scenario: Postpay user can open a bill on iOS devices
    Given user has a "mobile_line" product
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "invoice_chart_body.download_pdf_button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204390
  @jira.link.depends_on.QANOV-204391 @manual @mobile @regression
  Scenario Outline: Postpay user can zoom <direction> on a bill file
    Given user has a "mobile_line" product
      And user has invoices
      And user has the matching subscription selected in the account
      And the "bill" file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id      |
          | in        | bigger  | QANOV-204392 |
          | out       | smaller | QANOV-204393 |

  @jira.QANOV-204394 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204391 @manual @mobile @regression
  Scenario: Postpay user can share a bill on iOS devices
    Given user has a "mobile_line" product
      And user has invoices
      And user has the matching subscription selected in the account
      And the "bill" file is displayed
     When clicks on the "share" button
     Then the native sharing options are displayed

  @jira.QANOV-297969 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204367 @manual @mobile @raitt_drop1
  @smoke
  Scenario: Postpay user with bills can access to the "Download EVN" webview from the "Bills" screen
    Given user has a "mobile_line" product
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "download_evn_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Mein Blau" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-204395 @android @ber @blaude @jira.cv.Future @jira.link.depends_on.QANOV-204381 @manual @mobile @smoke
  Scenario: Postpay user can download the call history of a bill on android devices
    The "download evn" button does not work, as there's a GDPR problem.
    Given user has a "mobile_line" product
      And user has "EVN" service in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has installed the "Google Drive" app
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "download_evn_entrypoint" entrypoint
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-204396 @ber @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-204381 @manual @mobile @smoke
  Scenario: Postpay user can open the call history of a bill on iOS devices
    The "download evn" button does not work, as there's a GDPR problem.
    Given user has a "mobile_line" product
      And user has "EVN" service in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "download_evn_entrypoint" entrypoint
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-204395
  @jira.link.depends_on.QANOV-204396 @manual @mobile @regression
  Scenario Outline: Postpay user can zoom <direction> on a call history file
    Given user has a "mobile_line" product
      And user has "EVN" service in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And the "call_history" file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id      |
          | in        | bigger  | QANOV-204397 |
          | out       | smaller | QANOV-204398 |

  @jira.QANOV-204399 @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-204396 @manual @mobile @regression
  Scenario: Postpay user can share the call history of a bill on iOS devices
    Given user has a "mobile_line" product
      And user has "EVN" service in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And the "call_history" file is displayed
     When clicks on the "share" button
     Then the native sharing options are displayed

  @jira.QANOV-307982 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @smoke
  Scenario: Postpay user with bills for a cancelled mobile line product can access to the "Bills" screen
    Given user has a "mobile_line" product in "cancelled" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Last months invoices graph" module configured in CMS for "Account" page
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header;Bills settings;Bills services" modules configured in CMS for "Bills" page
      And user is in the "Account" page
     When clicks on the "bills.chart.see_all_invoices_link" link
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed
      And the "invoice_chart_header" module is displayed
      And the last invoice of the "invoice_chart_header" invoices chart is selected
      And the "invoice_chart_body.bills_summary.title" textfield is displayed
      And the "bills_settings" list is not displayed
      And the "bills_services" list is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-320029 @android @blaude @ios @jira.cv.14.1 @jira.dv.Future @jira.link.depends_on.QANOV-307982
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @smoke
  Scenario: Postpay user with bills for a cancelled mobile line product can see the bills services in the "Bills" screen
    Given user has a "mobile_line" product in "cancelled" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" list is displayed
      And the "bills_services_title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And any element in the "bills_services" list has the "title" textfield with the "Jahresübersicht" text
      And no element in the "bills_services" list has the value "Genutzte Drittanbieterdienste" in the "title" field
      And any element in the "bills_services" list has the "title" textfield with the "Musterrechnung ansehen" text
      And no element in the "bills_services" list has the value "Drittanbieterdienste" in the "title" field

  @jira.QANOV-576579 @android @blaude @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-204364
  @jira.link.parent_test_plan.QANOV-306250 @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @smoke
  Scenario: Postpay user with bills for a cancelled mobile line product can see the bills services in the "Bills" screen
    Given user has a "mobile_line" product in "cancelled" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" list is displayed
      And the "bills_services_title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And any element in the "bills_services" list has the "title" textfield with the "Jahresübersicht" text
      And no element in the "bills_services" list has the value "Genutzte Drittanbieterdienste" in the "title" field
      And any element in the "bills_services" list has the "title" textfield with the "Musterrechnung ansehen" text
      And any element in the "bills_services" list has the "title" textfield with the "Drittanbieterdienste" text

  @jira.QANOV-595144 @android @blaude @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-204364
  @jira.link.depends_on.QANOV-307982 @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @regression
  Scenario: Postpay user with with a bill higher than last month can see an alert in the "Bills" screen if the high bill flag is active
    The alert will be displayed if the bill is at least 1€ higher than the previous month.
    The alert icon is a yelow warning sign.
    The alert will not be dismissible.
    The alert will last for 15 days.
    The "learn more" button will redirect to an OB webview.
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "mobile_line" product
      And user has invoices
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Bills" page has a "TBD" preconfigured provider
      And user is in the "Bills" page
     Then the "alert" element is on display
      And the "alert.alert_icon" icon is displayed
      And the "alert.title" textfield with "Why is my bill higher than last month?" text is displayed
      And the "alert.description" textfield with "Learn why it has increased and how to avoid future extra spendings" text is displayed
      And the "alert.learn_more_button" button with "Learn more" text is displayed
      And the "alert.close_button" button is not displayed

  @jira.QANOV-595145 @android @blaude @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-595144
  @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @regression
  Scenario: A postpay user with with a bill higher than last month taps on the "higher bill" alert button: the OB webview will be displayed
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "mobile_line" product
      And user has invoices
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Bills" page has a "TBD" preconfigured provider
      And user is in the "Bills" page
     When clicks on the "alert.learn_more_button" button
     Then the internal webview is displayed
      And the "Mehrkosten" header is displayed

  @jira.QANOV-600330 @android @blaude @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-204364
  @jira.link.depends_on.QANOV-307982 @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @regression
  Scenario: Postpay user with with a bill higher than last month cannot see an alert in the "Bills" screen if the high bill flag is deactivated
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "mobile_line" product
      And user has invoices
      And user has a bill higher than last month
      And the high bill flag is inactive in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Bills" page has a "TBD" preconfigured provider
      And user is in the "Bills" page
     Then the "alert" element is not on display

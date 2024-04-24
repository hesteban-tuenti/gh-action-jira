# -*- coding: utf-8 -*-
@jira.QANOV-200123
Feature: Invoices

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.QANOV-47714 @android @ber @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @sanity
  Scenario: Postpay user with bills for an active mobile line or internet@home product can access to the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header;Bills settings;Bills services" modules configured in CMS for "Bills" page
      And user is in the "Account" page
     When clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed
      And the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "last" month is selected in the bills graph
      And the "bills_summary" module is displayed
      And the "bills_settings" module is displayed
      And the "bills_services" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-200124 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-309102 @jira.link.depends_on.QANOV-47714
  @jira.link.detects.O2DE-276 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user with bills can see the header details in the "Bills" screen
    If the user has bills for more than 6 months, the pagination will be displayed under the bills graph.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_header" module is displayed
      And the "bills_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "bills_header.bill_month" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "bills_header.bill_amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_graph" graph is displayed
      And a total of "6" months are displayed in the "bills_graph" graph
      And the months in "short" format are displayed in the "bills_graph" graph
      And the "bills_header.bills_average" textfield with the "Mittlerer Betrag der letzten \d+ Monate: \d+,\d\d €" format is displayed

  @jira.QANOV-200125 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-309102 @jira.link.depends_on.QANOV-47714
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
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
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_summary" module is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+\/\d{2}" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed

  @jira.QANOV-200126 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47714
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user with bills can see the bills settings in the "Bills" screen
    If a setting is deactivated, a "deactivated" tag will be displayed on top of that setting. When the setting is
    activated, a subtitle appears under the setting and the "deactivated" tag disappears (except for EVN setting, that
    will display an "active" tag).
    NOTE: Temporaly, a "Download EVN" entrypoint will be always displayed (regardless of service status) pointing to a OB
    webview. In the future, it will be replaced by a 'Download EVN' card in the bills summary.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has not the "ACCOUNT_REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_settings" module is displayed
      And the "bills_settings.title_textfield" textfield with "RECHNUNGSEINSTELLUNGEN" text is displayed
      And the "download_evn_entrypoint" entrypoint with "EVN herunterladen" text is displayed
      And the "bank_account_entrypoint" entrypoint with "Bankverbindung" text is displayed
      And the "digital_bill_entrypoint" entrypoint with "Online-Rechnung" text is displayed
      And the "billing_address_entrypoint" entrypoint with "Rechnungsadresse" text is displayed
      And the "evn_entrypoint" entrypoint with "EVN Einstellungen" text is displayed

  @jira.QANOV-200127 @android @ber @ios @jira.cv.14.2 @jira.dv.Future @jira.link.depends_on.QANOV-47714
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay mobile/home_spot/data_spot user with bills for an active product can see the bills services in the "Bills" screen
    Given user has any "mobile_line;home_spot;data_spot" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" module is displayed
      And the "bills_services.title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "bills_services.5years_invoice_overview_entrypoint" entrypoint with "Jahresübersicht" text is displayed
      And the "bills_services.third_party_service_charges_entrypoint" entrypoint with "Genutzte Drittanbieterdienste" text is displayed
      And the "bills_services.bill_example_entrypoint" entrypoint with "Musterrechnung ansehen" text is displayed

  @jira.QANOV-576584 @android @ber @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-47714
  @jira.link.parent_test_plan.QANOV-437471 @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @o2de @smoke
  Scenario: Postpay mobile/home_spot/data_spot user with bills for an active product can see the bills services in the "Bills" screen
    Given user has any "mobile_line;home_spot;data_spot" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" module is displayed
      And the "bills_services.title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "bills_services.5years_invoice_overview_entrypoint" entrypoint with "Jahresübersicht" text is displayed
      And the "bills_services.third_party_service_charges_entrypoint" entrypoint with "Genutzte Drittanbieterdienste" text is displayed
      And the "bills_services.bill_example_entrypoint" entrypoint with "Musterrechnung ansehen" text is displayed
      And the "bills_services.manage_phone_payments_entrypoint" entrypoint with "Drittanbieterdienste" text is displayed

  @jira.QANOV-543269 @android @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-47714
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: Postpay dsl/cable/fiber user with bills for an active product can see the bills services in the "Bills" screen
    Given user has any "dsl;cable;fiber" product in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" module is displayed
      And the "bills_services.title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "bills_services.5years_invoice_overview_entrypoint" entrypoint with "Jahresübersicht" text is displayed
      And the "bills_services.third_party_service_charges_entrypoint" entrypoint is not displayed
      And the "bills_services.bill_example_entrypoint" entrypoint with "Musterrechnung ansehen" text is displayed

  @jira.QANOV-47725 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200124 @manual @mobile @not_hardening @o2de
  @regression
  Scenario: Postpay user can select another month in the graph of the "Bills" screen but an error occurs
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on a different month in the bills graph
      And there is an API error when requesting the billing information
     Then the "bills_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "bills_header.bill_month" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "bills_header.bill_amount" textfield with the "-,--" format is displayed
      And the "bills_graph" graph is displayed
      And the eligible month is selected in the bills graph
      And the "bills_summary.bills_error_title" textfield with "[LANG:bills.month_error.bills_error_title]" text is displayed
      And the "bills_summary.bills_error_subtitle" textfield with "[LANG:bills.month_error.bills_error_subtitle]" text is displayed
      And the "bills_summary.bills_error_refresh_icon" icon is displayed

  @jira.QANOV-47726 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200124
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can select another month in the graph of the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills for "some" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on a different month in the bills graph
     Then the "bills_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "bills_header.bill_month" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the month in "bills_header.bill_month" textfield corresponds with the month selected in the bills graph
      And the "bills_header.bill_amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_graph" graph is displayed
      And the eligible month is selected in the bills graph
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format is displayed
      And the month in "bills_summary.title" textfield corresponds with the month selected in the bills graph
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed

  @jira.QANOV-47728 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200124 @manual @mobile @o2de @regression
  Scenario: Postpay user with 6 or less months with bills won't see the bills graph paginated in the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has bills for "<=6" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_graph" graph is not paginated

  @jira.QANOV-47729 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200124 @manual @mobile @o2de @regression
  Scenario: Postpay user with more than 6 months with bills will see the bills graph paginated in the "Bills" screen
    User can see bills for the last 24 months.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills for ">6" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_graph" graph is paginated

  @jira.QANOV-47730 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200124 @manual @mobile @o2de @regression
  Scenario: Postpay user can see bills for the last 24 months in the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills for ">6" months
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When swipes the "bills_graph" carousel in "right" direction
      And clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed

  @jira.QANOV-47715 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can see the details of a pending bill in the "Bills" screen
    Self-paying customer (customer without bank account) with a pending bill will see a 'View payment methods'
    link.
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    The status of the bill will be displayed in an orange pill.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "pending" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.status" textfield with the "Fällig zum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d\d" format is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button is not displayed

  @jira.QANOV-47716 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can select a month with a paid bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    The status of the bill will be displayed in a green pill.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "paid" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.status" textfield with the "Bezahlt" format is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "bills_summary.view_payment_method_link" link is not displayed

  @jira.QANOV-47717 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can select a month with an overdue bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    Any user with an overdue bill will see the "View payment methods" link.
    The status of the bill will be displayed in a pink pill.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "overdue" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.status" textfield with "Überfällig" text is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "bills_summary.view_payment_method_link" link with "Zahlungsart anzeigen" text is displayed

  @jira.QANOV-47718 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user can select a month with an updating bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    The status of the bill will be displayed in a grey pill.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "updating" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.status" textfield with "Aktualisierung" text is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "bills_summary.view_payment_method_link" link is not displayed

  @jira.QANOV-47719 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user can select a month with an untagged bill in the "Bills" screen
    'Download EVN' button will be displayed if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "untagged" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.status" textfield is not displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "bills_summary.view_payment_method_link" link is not displayed

  @jira.QANOV-47720 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user without bank account can see the "view payment methods" link for a pending bill in the "Bills" screen
    Self-payer customers are users who have the 'bank account' setting deactivated.
    Given user has any "mobile_line;internet_at_home" product
      And user does not have bank account
      And user has a month with "pending" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_summary.view_payment_method_link" link with "Zahlungsart anzeigen" text is displayed

  @jira.QANOV-200128 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @jira.link.detects.O2DE-1284 @manual
  @mobile @o2de @regression
  Scenario: Postpay user with bank account activated cannot see the "view payment methods" link for a pending bill in the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has "bank_account" service in "active" status
      And user has a month with "pending" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_summary.view_payment_method_link" link is not displayed

  @jira.QANOV-47721 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user with the EVN setting activated can see the "download EVN" button for a bill in the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has "EVN" service in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_summary.download_evn_button" button with "EVN herunterladen" text is displayed

  @jira.QANOV-204361 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user with the EVN setting deactivated cannot see the "download EVN" button for a bill in the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has "EVN" service in "deactivated" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_summary.download_evn_button" button is not displayed

  @jira.QANOV-47722 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user can see the details of a month with only a bill in the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "1" bills
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "bills_summary.amount" and the "bills_header.bill_amount" amounts are the same

  @jira.QANOV-47723 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @manual @mobile @o2de @regression
  Scenario: Postpay user see the details of a month with several bills in the "Bills" screen
    Optional fields:
    - 'View payment methods' link: only for self-paying customer (customer without bank account) with a pending
    bill or any customer with an overdue bill.
    - 'Download EVN' button: only if the user has activated the EVN setting (temporaly, it is replaced by a
    "Download EVN" entrypoint in the settings module).
    - 'Status pill': it's displayed for all bills except for untagged bills.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "2" bills
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "bills_summary.other_title" textfield with the "Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d\d\d\d" format is displayed
      And the "bills_summary.other_bill_number" textfield with the "Rechnungsnummer \d+" format is displayed
      And the "bills_summary.other_issue_date" textfield with the "Ausgestellt am: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) '\d\d" format is displayed
      And the "bills_summary.other_amount" textfield with the "[-]?\d+,\d\d €" format is displayed
      And the "bills_summary.other_download_pdf_button" button with "PDF herunterladen" text is displayed
      And the sum of the "bills_summary.amount" value and the "bills_summary.other_amount" value is the same as the "bills_header.bill_amount" value

  @jira.QANOV-47724 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @jira.link.detects.O2DE-277 @manual
  @mobile @o2de @regression
  Scenario: Postpay user can select a month without bills in the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "no" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
     Then the "bills_header.customer_number" textfield with the "Kundennr. \d+" format is displayed
      And the "bills_header.bill_month" textfield with the "Letzte Rechnung für (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( \d{4})?" format is displayed
      And the "bills_header.bill_amount" textfield with the "-,--" format is displayed
      And the "bills_graph" graph is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title" textfield with "[LANG:bills.month_without_bills.bills_empty_case_title]" text is displayed
      And the "bills_summary.no_bills_subtitle" textfield with "[LANG:bills.month_without_bills.bills_empty_case_subtitle]" text is displayed

  @jira.QANOV-47731 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47717 @jira.link.detects.LOC-1167
  @jira.link.detects.O2DE-3157 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: Postpay user with a <bill_status> bill can access to the "View payment methods" screen
    Self-paying customer (customer without bank account) with a pending bill or any customer with an overdue
    bill will be able to access this "View payment methods" screen through the "View payment methods" link.
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "overdue" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user has the "View Payment Methods" module configured in CMS for "View Payment Methods" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.view_payment_method_link" link
     Then the "View Payment Methods" page is displayed
      And the "Zahlungsmöglichkeiten" header is displayed
      And the "title" textfield with "Zahlungsmöglichkeiten" text is displayed
      And the "description" textfield with "Zahle den noch offenten Betrag schnell und einfach per Banküberweisung." text is displayed
      And the "bank_transfer_title" textfield with "Überweisung" text is displayed
      And the "bank_transfer_description" textfield with "Bitte überweise den offenen Betrag auf folgendes Konto:" text is displayed
      And the "bank_transfer_iban" textfield that contains the "IBAN:" text is displayed
      And the "bank_transfer_bic" textfield that contains the "BIC:" text is displayed
      And the "bank_transfer_purpose" textfield that contains the "Verwendungszweck" text is displayed
      And the "cash.title" textfield with "Barzahlung" text is displayed
      And the "cash.description" textfield with "Für die Zahlung im Shop berechnen wir eine Gebühr von 2 €." text is displayed
      And the "cash.find_a_shop_link" link with "Einen Shop in der Nähe finden" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-47732 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47720 @jira.link.detects.LOC-1167
  @jira.link.detects.O2DE-3157 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: Postpay user with a <bill_status> bill can access to the "View payment methods" screen when user does not have bank account
    Self-paying customer (customer without bank account) with a pending bill or any customer with an overdue
    bill will be able to access this "View payment methods" screen through the "View payment methods" link.
    Given user has any "mobile_line;internet_at_home" product
      And user does not have bank account
      And user has a month with "pending" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user has the "View Payment Methods" module configured in CMS for "View Payment Methods" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.view_payment_method_link" link
     Then the "View Payment Methods" page is displayed
      And the "Zahlungsmöglichkeiten" header is displayed
      And the "title" textfield with "Zahlungsmöglichkeiten" text is displayed
      And the "description" textfield with "Zahle den noch offenten Betrag schnell und einfach per Banküberweisung." text is displayed
      And the "bank_transfer_title" textfield with "Überweisung" text is displayed
      And the "bank_transfer_description" textfield with "Bitte überweise den offenen Betrag auf folgendes Konto:" text is displayed
      And the "bank_transfer_iban" textfield that contains the "IBAN:" text is displayed
      And the "bank_transfer_bic" textfield that contains the "BIC:" text is displayed
      And the "bank_transfer_purpose" textfield that contains the "Verwendungszweck" text is displayed
      And the "cash.title" textfield with "Barzahlung" text is displayed
      And the "cash.description" textfield with "Für die Zahlung im Shop berechnen wir eine Gebühr von 2 €." text is displayed
      And the "cash.find_a_shop_link" link with "Einen Shop in der Nähe finden" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-47733 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47731 @manual @mobile @o2de @regression
  Scenario: Postpay user can access to the "Shop search" screen from the "View payment methods" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has a month with "overdue" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user has the "View Payment Methods" module configured in CMS for "View Payment Methods" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.view_payment_method_link" link
      And the "View Payment Methods" page is displayed
      And clicks on the "cash.find_a_shop_link" link
     Then the internal webview is displayed
      And the header that contains the "o2 Shop suchen" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "View Payment Methods" page is displayed

  @jira.QANOV-47734 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47732 @manual @mobile @o2de @regression
  Scenario: Postpay user can access to the "Shop search" screen from the "View payment methods" screen when user does not have bank account
    Given user has any "mobile_line;internet_at_home" product
      And user does not have bank account
      And user has a month with "pending" bill
      And user has the matching subscription selected in the account
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header" modules configured in CMS for "Bills" page
      And user has the "View Payment Methods" module configured in CMS for "View Payment Methods" page
      And user is in the "Bills" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.view_payment_method_link" link
      And the "View Payment Methods" page is displayed
      And clicks on the "cash.find_a_shop_link" link
     Then the internal webview is displayed
      And the header that contains the "o2 Shop suchen" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "View Payment Methods" page is displayed

  @jira.QANOV-47737 @android @ber @jira.cv.14.2 @jira.link.depends_on.QANOV-200125
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: Postpay user can download a bill on android devices
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has installed the "Google Drive" app
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "bills_summary.download_pdf_button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-47738 @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200125 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @sanity
  Scenario: Postpay user can open a bill on iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "bills_summary.download_pdf_button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47737 @jira.link.depends_on.QANOV-47738 @manual
  @mobile @o2de @regression
  Scenario Outline: Postpay user can zoom <direction> on a bill file
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And the "bill" file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id     |
          | in        | bigger  | QANOV-47739 |
          | out       | smaller | QANOV-47740 |

  @jira.QANOV-47741 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47738 @manual @mobile @o2de @regression
  Scenario: Postpay user can share a bill on iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And the "bill" file is displayed
     When clicks on the "share" button
     Then the native sharing options are displayed

  @jira.QANOV-297970 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200126
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user with bills can access to the "Download EVN" webview from the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "download_evn_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Mein o2" header is displayed
      And the "Rechnung herunterladen" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-47742 @android @ber @jira.cv.Future @jira.link.depends_on.QANOV-47721 @manual @mobile @o2de @smoke
  Scenario: Postpay user can download the call history of a bill on android devices
    Given user has any "mobile_line;internet_at_home" product
      And user has "EVN" service in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has installed the "Google Drive" app
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "bills_summary.download_evn_button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-47743 @ber @ios @jira.cv.Future @jira.link.depends_on.QANOV-47721 @manual @mobile @o2de @smoke
  Scenario: Postpay user can open the call history of a bill on iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has "EVN" service in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Detail cards of invoices per month - tied to chart header" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     When clicks on the "bills_summary.download_evn_button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-47742 @jira.link.depends_on.QANOV-47743
  @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can zoom <direction> on a call history file
    Given user has any "mobile_line;internet_at_home" product
      And user has "EVN" service in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And the "call_history" file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id     |
          | in        | bigger  | QANOV-47744 |
          | out       | smaller | QANOV-47745 |

  @jira.QANOV-47746 @ios @jira.cv.Future @jira.link.depends_on.QANOV-47743 @manual @mobile @o2de @regression
  Scenario: Postpay user can share the call history of a bill on iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has "EVN" service in "active" status
      And user has bills
      And user has the matching subscription selected in the account
      And the "call_history" file is displayed
     When clicks on the "share" button
     Then the native sharing options are displayed

  @jira.QANOV-308002 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user with bills for a cancelled product can access to the "Bills" screen
    Given user has any "mobile_line;internet_at_home" product in "cancelled" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Last months invoices graph" module configured in CMS for "Account" page
      And user has the "Header graph showing invoices - tied to chart body;Detail cards of invoices per month - tied to chart header;Bills settings;Bills services" modules configured in CMS for "Bills" page
      And user is in the "Account" page
     When clicks on the "bills.link" link
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed
      And the "bills_header" module is displayed
      And the "bills_graph" graph is displayed
      And the "last" month is selected in the bills graph
      And the "bills_summary" module is displayed
      And the "bills_settings" module is not displayed
      And the "bills_services" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-320030 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user with dsl/cable/fiber and with bills for a cancelled product can see the bills services in the "Bills" screen
    Given user has a "dsl;cable;fiber" product in "cancelled" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" module is displayed
      And the "bills_services.title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "bills_services.5years_invoice_overview_entrypoint" entrypoint with "Jahresübersicht" text is displayed
      And the "bills_services.third_party_service_charges_entrypoint" entrypoint is not displayed
      And the "bills_services.bill_example_entrypoint" entrypoint with "Musterrechnung ansehen" text is displayed

  @jira.QANOV-576585 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-306250
  @jira.link.parent_test_plan.QANOV-437471 @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @o2de @smoke
  Scenario: Postpay user with mobile_line/homespot/dataspot and with bills for a cancelled product can see the bills services in the "Bills" screen
    Given user has any "mobile_line;home_spot;data_spot" product in "cancelled" status
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Bills services" module configured in CMS for "Bills" page
      And user is in the "Bills" page
     Then the "bills_services" module is displayed
      And the "bills_services.title_textfield" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "bills_services.5years_invoice_overview_entrypoint" entrypoint with "Jahresübersicht" text is displayed
      And the "bills_services.third_party_service_charges_entrypoint" entrypoint is not displayed
      And the "bills_services.bill_example_entrypoint" entrypoint with "Musterrechnung ansehen" text is displayed
      And the "bills_services.manage_phone_payments_entrypoint" entrypoint is not displayed

  @jira.QANOV-595147 @android @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-308002
  @jira.link.depends_on.QANOV-47714 @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de @regression
  Scenario: Postpay user with with a bill higher than last month can see an alert in the "Bills" screen if the high bill flag is active
    The alert will be displayed if the bill is at least 1€ higher than the previous month.
    The alert icon is a yelow warning sign.
    The alert will not be dismissible.
    The alert will last for 15 days.
    The "learn more" button will redirect to an OB webview.
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has any "mobile_line;internet_at_home" product
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

  @jira.QANOV-595148 @android @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-595147
  @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de @regression
  Scenario: A postpay user with with a bill higher than last month taps on the "higher bill" alert button: the OB webview will be displayed
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has any "mobile_line;internet_at_home" product
      And user has invoices
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Bills" page has a "TBD" preconfigured provider
      And user is in the "Bills" page
     When clicks on the "alert.learn_more_button" button
     Then the internal webview is displayed
      And the "Mehrkosten" header is displayed

  @jira.QANOV-600337 @android @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-308002
  @jira.link.depends_on.QANOV-47714 @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de @regression
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

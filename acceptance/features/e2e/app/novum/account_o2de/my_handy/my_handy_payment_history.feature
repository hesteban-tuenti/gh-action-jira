# -*- coding: utf-8 -*-
@jira.QANOV-224591
Feature: My Handy payment history

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "my_handy" product
      And user has any of the "device-plan,device-plan-terminated" modules configured in CMS for "dashboard" page
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page
      And user has the "Payment History" module configured in CMS for "Payment History" page


  @jira.QANOV-203279 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215952 @jira.link.depends_on.QANOV-215953
  @jira.link.depends_on.QANOV-215954 @jira.link.depends_on.QANOV-215955 @jira.link.depends_on.QANOV-297968 @automatic
  @mobile @o2de @smoke @ber @qa @webapp
  Scenario: Postpay user with a MyHandy product can access the "My Handy payment history" screen
    Given user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "contract_status.payment_history_entrypoint" entrypoint
     Then the "Payment History" page is displayed
      And the "Zahlungen" header is displayed
      And the "title" textfield with "Zahlungsverlauf" text is displayed
      And the "description" textfield with "Bisherige Zahlungen:" text is displayed
      And the "year_filter_selector" drop-down is displayed
      And the "year_filter_placeholder" textfield with "Jahr" text is displayed
      And the current year is selected in the filter
      And the "download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "monthly_payments_list.list" list is displayed
      And each element in the "monthly_payments_list.list" list has the "date" textfield with the "(Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format
      And each element in the "monthly_payments_list.list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And each element in the "monthly_payments_list.list" list has the "status" field
      And the elements in the "monthly_payments_list.list" list correspond to the selected year
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "My Handy Details" page is displayed

  @jira.QANOV-203280 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203279 @manual @mobile @o2de @regression
  Scenario: Postpay user with a MyHandy product with several years in payment history can filter the payment history by year
    The years displayed in the "year_filter_list" list are ordered from most recent year to less recent year if it returns
    ordered from API but app doesn't order it.
    Given user has a my handy product with "several" years in payment history
      And user has the matching subscription selected in the account
      And user is in the "Payment History" page
     When clicks on the "year_filter_selector" drop-down
      And clicks on the "last" element in the "year_filter_list" list
     Then the "monthly_payments_list.list" list is displayed
      And each element in the "monthly_payments_list.list" list has the "date" textfield with the "(Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format
      And each element in the "monthly_payments_list.list" list has the "amount" textfield with the "\d+,\d{2} €" format
      And each element in the "monthly_payments_list.list" list has the "status" field
      And the elements in the "monthly_payments_list.list" list correspond to the selected year

  @jira.QANOV-203281 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-203279 @jira.link.detects.O2DE-2915 @automatic
  @mobile @o2de @regression @ber @qa
  Scenario: Postpay user with a MyHandy product can download a PDF with the selected year's payments on android devices
    Given user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user is in the "Payment History" page
     When clicks on the "download_pdf_button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-203282 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203279 @jira.link.detects.O2DE-2915 @automatic @mobile
  @o2de @regression @ber @qa
  Scenario: Postpay user with a MyHandy product can download a PDF with the selected year's payments on iOS devices
    Given user has the matching subscription selected in the account
      And user is in the "Payment History" page
     When clicks on the "download_pdf_button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203279 @mobile @no_automatable @o2de @regression
  Scenario Outline: Postpay user with a MyHandy product can zoom <direction> on the payment history file on iOS devices
    Given user has the matching subscription selected in the account
      And user is in the "Payment History" page
     When clicks on the "download_pdf_button" button
      And the browser webview is displayed
      And the PDF file is opened
      And zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id      |
          | in        | bigger  | QANOV-203283 |
          | out       | smaller | QANOV-203284 |

  @jira.QANOV-203285 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203279 @manual @mobile @o2de @regression
  Scenario: Postpay user with a MyHandy product user can share the payment history on iOS devices
    Given user has the matching subscription selected in the account
      And user is in the "Payment History" page
     When clicks on the "download_pdf_button" button
      And the browser webview is displayed
      And the PDF file is opened
      And clicks on the "share" button
     Then the native sharing options are displayed

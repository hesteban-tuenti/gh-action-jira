# -*- coding: utf-8 -*-
@jira.QANOV-600338
Feature: My Handy Bill

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "my_handy" product
      And user has the "My Handy card" module configured in CMS for "Account" page
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page
      And user has the "My Handy Bill" module configured in CMS for "My Handy Bill" page


  @jira.QANOV-325149 @android @automation.pending_mock @ber @e2e @ios @jira.cv.14.2 @jira.dv.Future
  @jira.link.depends_on.QANOV-215952 @jira.link.depends_on.QANOV-215953 @jira.link.depends_on.QANOV-215954
  @jira.link.depends_on.QANOV-215955 @jira.link.depends_on.QANOV-297968 @jira.link.depends_on.QANOV-326792
  @jira.link.parent_test_plan.QANOV-607136 @manual @mobile @o2de @smoke
  Scenario: Postpay user with a MyHandy product can access the "Bills" webview
    Given user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "billing_information.invoices_entrypoint" entrypoint
     Then the external webview is displayed
      And the "Rechnung" string is displayed
      And clicks on the native "back" button
      And the "My Handy Details" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-309101 @android @ber @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-215952
  @jira.link.depends_on.QANOV-215953 @jira.link.depends_on.QANOV-215954 @jira.link.depends_on.QANOV-215955
  @jira.link.depends_on.QANOV-297968 @jira.link.depends_on.QANOV-326792 @jira.link.parent_test_plan.QANOV-607136 @manual
  @mobile @o2de @sanity
  Scenario: Postpay user who has a MyHandy product without return bill can access to the "My Handy Bill" screen
    KERNEL API: https://developers.baikalplatform.com/apis/reports-export/v2.0/
    If the user has a return bill, the API returns the url to download it. If the user doesn't have a return bill, the
    API returns a 204 No content.
    The bill is always the same file, it is not generated monthly.
    Given user has a "my_handy" product without return bill
      And user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "billing_information.invoices_entrypoint" entrypoint
     Then the "My Handy Bill" page is displayed
      And the "View invoice" header is displayed
      And the "your_contract" module is displayed
      And the "your_contract.title" textfield with "Your contract" text is displayed
      And the "your_contract.description" textfield with "You can find your contract downloading the following PDF." text is displayed
      And the "your_contract.button" button with "Download PDF" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Handy Details" page is displayed

  @jira.QANOV-309102 @android @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-215952
  @jira.link.depends_on.QANOV-215953 @jira.link.depends_on.QANOV-215954 @jira.link.depends_on.QANOV-215955
  @jira.link.depends_on.QANOV-297968 @jira.link.depends_on.QANOV-326792 @jira.link.parent_test_plan.QANOV-607136 @manual
  @mobile @o2de @regression
  Scenario: Postpay user who has a MyHandy product with return bill can access to the "My Handy Bill" screen
    KERNEL API: https://developers.baikalplatform.com/apis/reports-export/v2.0/
    If the user has a return bill, the API returns the url to download it. If the user doesn't have a return bill, the
    API returns a 204 No content.
    The bill is always the same file, it is not generated monthly.
    Given user has a "my_handy" product with return bill
      And user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "billing_information.invoices_entrypoint" entrypoint
     Then the "My Handy Bill" page is displayed
      And the "View invoice" header is displayed
      And the "cancelled_contract" module is displayed
      And the "cancelled_contract.title" textfield with "Cancelled contract" text is displayed
      And the "cancelled_contract.description" textfield with "You have cancelled your contract. You can find all the related information in the following PDF." text is displayed
      And the "cancelled_contract.button" button with "Download PDF" text is displayed
      And the "your_contract" module is displayed
      And the "your_contract.title" textfield with "Your contract" text is displayed
      And the "your_contract.description" textfield with "You can find your contract downloading the following PDF." text is displayed
      And the "your_contract.button" button with "Download Invoice PDF" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Handy Details" page is displayed

  @jira.QANOV-600339 @android @ber @e2e @jira.cv.Future @jira.link.depends_on.QANOV-309101
  @jira.link.depends_on.QANOV-309102 @jira.link.parent_test_plan.QANOV-607136 @manual @mobile @o2de @smoke
  Scenario: Postpay user with a MyHandy product can download the invoice PDF on android devices
    Given user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user is in the "My Handy Bill" page
     When clicks on the "your_contract.button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-600340 @ber @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-309101 @jira.link.depends_on.QANOV-309102
  @jira.link.parent_test_plan.QANOV-607136 @manual @mobile @o2de @smoke
  Scenario: Postpay user with a MyHandy product can open the invoice PDF on iOS devices
    Given user has the matching subscription selected in the account
      And user is in the "My Handy Bill" page
     When clicks on the "your_contract.button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.QANOV-600341 @android @e2e @jira.cv.Future @jira.link.depends_on.QANOV-309102
  @jira.link.parent_test_plan.QANOV-607136 @manual @mobile @o2de @regression
  Scenario: Postpay user with a MyHandy product with return bill can download the return PDF on android devices
    Given user has a "my_handy" product with return bill
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user is in the "My Handy Bill" page
     When clicks on the "cancelled_contract.button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-600342 @e2e @ios @jira.cv.Future @jira.link.depends_on.QANOV-309102 @jira.link.parent_test_plan.QANOV-607136
  @manual @mobile @o2de @regression
  Scenario: Postpay user with a MyHandy product with return bill can download the return PDF on iOS devices
    Given user has a "my_handy" product with return bill
      And user has the matching subscription selected in the account
      And user is in the "My Handy Bill" page
     When clicks on the "cancelled_contract.button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

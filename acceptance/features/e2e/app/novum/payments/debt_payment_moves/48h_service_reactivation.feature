# -*- coding: utf-8 -*-
@jira.QANOV-67952
Feature: 48h Service Reactivation

  Actions After each Scenario:
    Given I switch to the WebView context
      And switches to original frame
      And restarts the navigation


  @jira.QANOV-67953 @android @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @smoke @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation access to the "Bill Selection" screen
    The reactivation link will appear depending on ob rules, including but not limited to: there is overdue debt and the user has not yet requested a service reactivation
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
     Then the "Bill Selection" page is displayed
      And the "reactivation_info" textfield with "[LANG:payments.reactivation.reactivation_info]" text is displayed
      And the "reactivation_link" link with "[LANG:payments.reactivation.reactivation_link]" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Debt Detail" page is displayed

  @jira.QANOV-67954 @android @automatic @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa
  @sanity @webapp
  Scenario: A telco postpay user logged in as admin that can not request the 48h service reactivation access to the "Bill Selection" screen
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is not eligible for reactivation
      And user has "pending" debt from "TME" legal entity
      And user does not have "pending" debt from "TDE" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Bill Selection" page is displayed
      And the "reactivation_info" textfield is not displayed
      And the "reactivation_link" link is not displayed

  @jira.QANOV-312513 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @smoke
  Scenario: A telco postpay user logged in as admin with only payable documents does not see the reactivation link
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" payable documents
      And user does not have "any" debt
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
     Then the "Bill Selection" page is displayed
      And the "reactivation_info" textfield is not displayed
      And the "reactivation_link" link is not displayed

  @jira.QANOV-67955 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67953
  @jira.link.detects.CHECKOUT-2227 @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation clicks on the "reactivate" button
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "reactivation_link" link
     Then the "Reactivation" page is displayed
      And the "main_title" textfield with "[LANG:payments.reactivation.reactivation_title]" text is displayed
      And the "reactivation_message" textfield with "[LANG:payments.reactivation.reactivation_message]" text is displayed
      And the "payment_methods_info_list" list is displayed
      And the "0" index in the "payment_methods_info_list" list has the "method_description" field with "[LANG:payments.reactivation.payment_methods_info_1]" text
      And the "1" index in the "payment_methods_info_list" list has the "method_description" field with "[LANG:payments.reactivation.payment_methods_info_2]" text
      And the "2" index in the "payment_methods_info_list" list has the "method_description" field with "[LANG:payments.reactivation.payment_methods_info_3]" text
      And the "physical_location_info" link with "[LANG:payments.reactivation.physical_location_info]" text is displayed
      And the "reactivation" button with "[LANG:payments.reactivation.reactivation_button]" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bill Selection" page is displayed

  @jira.QANOV-67956 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67955
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation checks the information for payment at a physical location
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "physical_location_info" link
     Then the "Payment Physical Location" page is displayed
      And the "main_title" textfield with "[LANG:payments.reactivation.physical_location_title]" text is displayed
      And the "first_paragraph" textfield with "[LANG:payments.reactivation.physical_location_first_paragraph]" text is displayed
      And the "document_to_pay_intro" textfield with "[LANG:payments.reactivation.physical_location_document_to_pay_intro]" text is displayed
      And switches to original frame
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Reactivation" page is displayed

  @jira.QANOV-67957 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67955
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @smoke @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation confirms service reactivation successfully
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "reactivation" button
     Then the "Feedback Payment Success" page is displayed
      And the "success_icon" icon is displayed
      And waits until the "[LANG:payments.feedback_success.success_title]" text in "success_title" element is displayed
      And the "success_title" textfield with "[LANG:payments.feedback_success.success_title]" text is displayed
      And the "success_message" textfield with "[LANG:payments.feedback_success.reactivation_success_message]" text is displayed
      And the "ok_button" button with "[LANG:payments.back_button]" text is displayed
      And clicks on the "ok_button" link
      And switches to original frame
      And the "Invoices" page is displayed

  @jira.QANOV-67958 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67957
  @jira.link.parent_test_plan.QANOV-67291 @mobile @moves @qa @regression @webapp
  Scenario: A telco postpay user logged in as admin who has requested the 48h service reactivation returns to invoices
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
      And clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "reactivation" button
     Then the "Feedback Payment Success" page is displayed
      And clicks on the "ok_button" link
      And switches to original frame
     Then the "Invoices" page is displayed

  @jira.QANOV-67959 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67953
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation confirms service reactivation. Error
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user is in the "Bill Selection" page
     When clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "reactivation" button
      And an unknown error happens
     Then the "Feedback Error" page is displayed
      And the "negative_feedback_title" textfield with "[LANG:payments.feedback_error.reactivation_error_title]" text is displayed
      And the "negative_feedback_subtitle" textfield with "[LANG:payments.feedback_error.reactivation_error_message]" text is displayed
      And the "retry" button with "[LANG:payments.retry_button]" text is displayed
      And the "back_to_account" button with "[LANG:payments.back_button]" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-67960 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67959
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who received an error when is requesting the 48h service reactivation returns to account
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user is in the "Bill Selection" page
     When clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "reactivation" button
      And an unknown error happens
      And the "Feedback Error" page is displayed
      And clicks on the "back_to_account" link
     Then the "Invoices" page is displayed

  @jira.QANOV-67961 @android @impeded_mock @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-67959
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin who received an error when is requesting the 48h service reactivation can retry the request
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user is in the "Bill Selection" page
     When clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "reactivation" button
      And an unknown error happens
      And the "Feedback Error" page is displayed
      And clicks on the "retry" link
     Then the "Reactivation" page is displayed

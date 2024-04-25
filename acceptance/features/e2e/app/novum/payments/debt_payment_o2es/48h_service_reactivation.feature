# -*- coding: utf-8 -*-
@jira.QANOV-600460
Feature: 48h Service Reactivation


  @jira.QANOV-600461 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @smoke @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation access to the "Bill Selection" screen
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

  @jira.QANOV-600462 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @sanity @webapp
  Scenario: A telco postpay user logged in as admin that can not request the 48h service reactivation access to the "Bill Selection" screen
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

  @jira.QANOV-600463 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @regression
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation clicks on the "reactivate" button
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
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-600464 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @regression @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation checks the information for payment at a physical location
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

  @jira.QANOV-600465 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @smoke @webapp
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation confirms service reactivation successfully
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

  @jira.QANOV-600466 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @regression @webapp
  Scenario: A telco postpay user logged in as admin who has requested the 48h service reactivation returns to invoices
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

  @jira.QANOV-600467 @android @e2e @impeded_mock @ios @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-600449 @manual @mobile @o2es @regression
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation confirms service reactivation. Error happen during reactivation.
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user is in the "Bill Selection" page
     When clicks on the "reactivation_link" link
      And the "Reactivation" page is displayed
      And clicks on the "reactivation" button
      And an unknown error happens
     Then the "Feedback Payment Error" page is displayed
      And the "negative_feedback_title" textfield with "[LANG:payments.feedback_error.reactivation_error_title]" text is displayed
      And the "negative_feedback_subtitle" textfield with "[LANG:payments.feedback_error.reactivation_error_message]" text is displayed
      And the "retry" button with "[LANG:payments.retry_button]" text is displayed
      And the "back_to_account" button with "[LANG:payments.back_button]" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-600468 @android @e2e @impeded_mock @ios @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-600449 @manual @mobile @o2es @regression
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
      And the "Feedback Payment Error" page is displayed
      And clicks on the "back_to_account" link
     Then the "Invoices" page is displayed

  @jira.QANOV-600469 @android @e2e @impeded_mock @ios @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-600449 @manual @mobile @o2es @regression
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
      And the "Feedback Payment Error" page is displayed
      And clicks on the "retry" link
     Then the "Reactivation" page is displayed

  @jira.QANOV-600470 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @regression
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation clicks on the "reactivate" button: Error is shown
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
     Then an unknown error happen
      And the "Feedback Payment Error" internal webview is displayed
      And the "generic_error_title" textfield with "Algo ha ido mal" text is displayed
      And the "generic_error_text" textfield with "Estamos solucionando el problema para que puedas completar esta operación. Por favor, vuelve a intentarlo más tarde." text is displayed
      And the "return" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-600471 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @regression
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation clicks on the "reactivate" button without connection: Error is shown
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
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And clicks on the "reactivation_link" link
     Then the "Payments No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conectividad" text is displayed
      And the "no_connectivity_text" textfield with "Comprueba tu conexión a Internet e inténtalo de nuevo." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bill Selection" page is displayed

  @jira.QANOV-600472 @android @e2e @ios @jira.depends_on.QANOV-600471 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-600449 @manual @mobile @o2es @qa @regression
  Scenario: A telco postpay user logged in as admin clicks back button in "No Connectivity Feedback" screen: returns to Bill Selection
    Given user is in the "Payments No Connectivity" page
     When clicks on the "back" button with "Volver" text
      And the "Invoices" page is displayed

  @jira.QANOV-600473 @android @e2e @ios @jira.depends_on.QANOV-600471 @jira.link.parent_test_plan.QANOV-142826
  @jira.link.parent_test_plan.QANOV-600449 @manual @mobile @o2es @qa @regression
  Scenario: A telco postpay user logged in as admin clicks back button in "No Connectivity Feedback" screen: returns to Bill Selection
    Given user is in the "Payments No Connectivity" page
     When clicks on the "retry" button with "Reintentar" text
      And the "Bill Selection" page is displayed

  @jira.QANOV-600474 @android @e2e @ios @jira.link.parent_test_plan.QANOV-142826 @jira.link.parent_test_plan.QANOV-600449
  @manual @mobile @o2es @qa @regression
  Scenario: A telco postpay user logged in as admin without payment methods available that can request the 48h service reactivation clicks on the "reactivate" button
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has no payment methods available
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And user is in the "Invoices" page
     When clicks on the "pending_bills" button
      And the "Debt Detail" page is displayed
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "Bill Selection" page is displayed
     Then the "Unpayable Debt Info" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "info_icon" icon is displayed
      And the "unpayable_debt_text" textfield with "Lo sentimos, tus facturas no se pueden pagar a través de la app o la web. Por favor, llama al 1004 para realizar el pago." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And clicks on the "back" button
      And the "Bill Selection" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-77319 @not_hardening
Feature: 48h Service Reactivation


  @jira.QANOV-77320 @automatic @ber @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-67953 @moves @qa @sanity @web
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation access to the "BillSelection" screen
    The reactivation link will appear depending on ob rules, including but not limited to: there is overdue debt and the user has not yet requested a service reactivation
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
      And clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
     Then the "BillSelection" checkout page is loaded
      And the text of the element "reactivation_info" is equal to "[LANG:payments.reactivation.reactivation_info]"
      And the text of the element "reactivation_link" is equal to "[LANG:payments.reactivation.reactivation_link]"

  @jira.QANOV-77321 @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-67954 @manual @moves
  @regression @web
  Scenario: A telco postpay user logged in as admin that can not request the 48h service reactivation access to the "BillSelection" screen
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is not eligible for reactivation
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "BillSelection" checkout page is loaded
     Then the "reactivation_info" element is not displayed
      And the "reactivation_link" element is not displayed

  @jira.QANOV-77322 @automatic @ber @jira.cv.12.7 @jira.link.depends_on.QANOV-77320
  @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-67955 @moves @qa @smoke @web
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation clicks on the "reactivate" button
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "reactivation_link" element
     Then the "Reactivation" checkout page is loaded
      And the text of the element "main_title" is equal to "[LANG:payments.reactivation.reactivation_title]"
      And the text of the element "reactivation_message" is equal to "[LANG:payments.reactivation.reactivation_message]"
      And the "0" index in the "payment_methods_info_list" list has the "method_description" field with "[LANG:payments.reactivation.payment_methods_info_1]" text
      And the "1" index in the "payment_methods_info_list" list has the "method_description" field with "[LANG:payments.reactivation.payment_methods_info_2]" text
      And the "2" index in the "payment_methods_info_list" list has the "method_description" field with "[LANG:payments.reactivation.payment_methods_info_3]" text
      And the text of the element "physical_location_info" is equal to "[LANG:payments.reactivation.physical_location_info]"
      And the text of the element "reactivation" is equal to "[LANG:payments.reactivation.reactivation_button]"
      And I go back to the previous page
      And the "BillSelection" checkout page is loaded

  @jira.QANOV-312514 @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-312513 @manual @moves @smoke @web
  Scenario: A telco postpay user logged in as admin with only payable documents does not see the reactivation link
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has "pending" payable documents
      And user does not have "any" debt
      And I go to "[CONF:debt_payment.web_url]" web page
     Then the "BillSelection" checkout page is loaded
      And the "reactivation_info" textfield is not displayed
      And the "reactivation_link" link is not displayed

  @jira.QANOV-77323 @automatic @ber @jira.cv.12.7 @jira.link.depends_on.QANOV-77322
  @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-67956 @moves @qa @regression @web
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation checks the information for payment at a physical location
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "reactivation_link" element
      And the "Reactivation" checkout page is loaded
      And I click on the "physical_location_info" element
     Then the "PaymentPhysicalLocation" checkout page is loaded
      And the "first_paragraph" textfield with "[LANG:payments.reactivation.physical_location_first_paragraph]" text is displayed
      And the "document_to_pay_intro" textfield with "[LANG:payments.reactivation.physical_location_document_to_pay_intro]" text is displayed
      And the text of the element "main_title" is equal to "[LANG:payments.reactivation.physical_location_title]"
      And the text of the element "first_paragraph" is equal to "[LANG:payments.reactivation.physical_location_first_paragraph]"
      And the text of the element "document_to_pay_intro" is equal to "[LANG:payments.reactivation.physical_location_document_to_pay_intro]"
      And I go back to the previous page
      And the "Reactivation" checkout page is loaded

  @jira.QANOV-77324 @automatic @ber @jira.cv.12.7 @jira.link.depends_on.QANOV-77322
  @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-67957 @moves @qa @regression @web
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation confirms service reactivation successfully
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "reactivation_link" element
      And the "Reactivation" checkout page is loaded
      And I click on the "reactivation" element
     Then the "FeedbackPaymentSuccess" checkout page is loaded
      And the "success_icon" element is displayed
      And the text of the element "success_title" is equal to "[LANG:payments.feedback_success.success_title]"
      And the text of the element "success_message" is equal to "[LANG:payments.feedback_success.reactivation_success_message]"
      And the text of the element "ok_button" is equal to "[LANG:payments.back_button]"

  @jira.QANOV-77325 @automatic @ber @jira.cv.12.7 @jira.link.depends_on.QANOV-77324
  @jira.link.parent_test_plan.QANOV-76684 @jira.link.relates_to.QANOV-67958 @moves @qa @regression @web
  Scenario: A telco postpay user logged in as admin who has requested the 48h service reactivation returns to account
    Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And user has "pending" debt from "TDE" legal entity
      And user has "pending" debt from "TME" legal entity
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "DebtDetail" checkout page is loaded
     When clicks on the element with "entity_label" field with "[LANG:payments.landline_entity]" value of the "debt_list" list
      And the "BillSelection" checkout page is loaded
      And I click on the "reactivation_link" element
      And the "Reactivation" checkout page is loaded
      And I click on the "reactivation" element
     Then the "FeedbackPaymentSuccess" checkout page is loaded
      And I click on the "ok_button" element
     Then the "MovesAccount" page is loaded

  @jira.QANOV-77326 @jira.cv.12.7 @jira.link.depends_on.QANOV-77320 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-67959 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin that can request the 48h service reactivation confirms service reactivation. Error
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "BillSelection" checkout page is loaded
     When I click on the "reactivation_link" element
      And the "Reactivation" checkout page is loaded
      And I click on the "reactivation" element
      And an unknown error happens
     Then the "Feedback Error" checkout page is loaded
      And the text of the element "negative_feedback_title" is equal to "[LANG:payments.feedback_error.reactivation_error_title]"
      And the text of the element "negative_feedback_subtitle" is equal to "[LANG:payments.feedback_error.reactivation_error_message]"
      And the text of the element "retry" is equal to "[LANG:payments.retry_button]"
      And the text of the element "ok_button" is equal to "[LANG:payments.back_button]"

  @jira.QANOV-77327 @jira.cv.12.7 @jira.link.depends_on.QANOV-77326 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-67960 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin who received an error when is requesting the 48h service reactivation returns to account
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "BillSelection" checkout page is loaded
     When I click on the "reactivation_link" element
      And the "Reactivation" checkout page is loaded
      And I click on the "reactivation" element
      And an unknown error happens
      And the "Feedback Error" checkout page is loaded
      And I go back to the previous page
     Then the "Account" page is loaded

  @jira.QANOV-77328 @jira.cv.12.7 @jira.link.depends_on.QANOV-77326 @jira.link.parent_test_plan.QANOV-76684
  @jira.link.relates_to.QANOV-67961 @manual @moves @regression @web
  Scenario: A telco postpay user logged in as admin who received an error when is requesting the 48h service reactivation can retry the request
    other_affected_versions="2021-35"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is eligible for reactivation
      And I go to "[CONF:debt_payment.web_url]" web page
      And the "BillSelection" checkout page is loaded
     When I click on the "reactivation_link" element
      And the "Reactivation" checkout page is loaded
      And I click on the "reactivation" element
      And an unknown error happens
      And the "Feedback Error" checkout page is loaded
      And I click on the "retry" element
     Then the "Reactivation" checkout page is loaded

# -*- coding: utf-8 -*-
@jira.QANOV-249289
Feature: Rolling plan module

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.QANOV-249290 @android @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @automatic @mobile @o2uk @sanity @cert0 @cert1 @webapp @qa
  Scenario: A prepay user without a rolling plan tariff can see the recurring payment information module
    To know if a user has an active rolling plan tariff look in '/prepay/currentandpendingtariff' API has the field
    'payment_type': 'Rolling plan based' for the current tariff or 'tariff_id': '73' and the
    'account_status_description': 'Active'
    The recurring payment module should go under the quick actions.
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" active tariff
      And user has the matching subscription selected in the account
      And user has the "payg-has-no-rolling-plan" module configured in CMS for "dashboard" page for the "mobile" product
      And waits until the "recurrent_payment_information" element is visible
     Then the "recurrent_payment_information" module is displayed
      And the "recurrent_payment_information.title" textfield is displayed
      And the "recurrent_payment_information.description" textfield is displayed
      And the "recurrent_payment_information.button" button is displayed

  @jira.QANOV-249291 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @manual @mobile @o2uk @smoke
  Scenario: A prepay user without a rolling plan tariff can access to the "Change tariff" webview
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" active tariff
      And user has the matching subscription selected in the account
      And user has the "payg-has-no-rolling-plan" module configured in CMS for "dashboard" page for the "mobile" product
     When clicks on the "recurrent_payment_information.button" button
     Then the internal webview with "Plan Selection" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-249292 @android @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @automatic @mobile @o2uk @sanity @cert0 @cert1 @webapp @qa
  Scenario: A prepay user with a rolling plan tariff can see the recurring payment module
    To know if a user has an active rolling plan tariff look in '/prepay/currentandpendingtariff' API has the field
    'payment_type': 'Rolling plan based' for the current tariff or 'tariff_id': '73' and the 
    'account_status_description': 'Active'
    The recurring payment module should go under the quick actions.
    Given user has a "legacy prepay" account type
      And user has a "rolling plan based" active tariff
      And user has the matching subscription selected in the account
      And user has the "payg-recurring-payments-rolling-plan-active" module configured in CMS for "dashboard" page for the "mobile" product
     Then the "recurrent_payment" module is displayed
      And the "recurrent_payment.title" textfield is displayed
      And the "recurrent_payment.description" textfield is displayed
      And the "recurrent_payment.button" button is displayed

  @jira.QANOV-249293 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @manual @mobile @o2uk @smoke
  Scenario: A prepay user with a rolling plan tariff can access to the "payg dashboard" webview
    Given user has a "legacy prepay" account type
      And user has a "rolling plan based" active tariff
      And user has the matching subscription selected in the account
      And user has the "payg-recurring-payments-rolling-plan-active" module configured in CMS for "dashboard" page for the "mobile" product
     When clicks on the "recurrent_payment.button" button
     Then the internal webview with "Management Dashboard" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

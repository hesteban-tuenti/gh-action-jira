# -*- coding: utf-8 -*-
@jira.QANOV-126804
Feature: ESIM Module


  @jira.QANOV-60192 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515 @cert0 @cert1 @qa
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @automatic @mobile @o2uk @smoke
  Scenario: A user that has not an eSIM to install will not see the module in the dashboard
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user does not have an eSIM profile to install
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "esim_module" module is not displayed

  @jira.QANOV-60193 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515 @cert0 @cert1 @qa
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @automatic @o2uk @sanity
  Scenario: A user that has an eSIM to install and a compatible device will see the module in the dashboard
    The eSIM module should be under the quick actions module.
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user has the matching subscription selected in the account
      And user has the "esim-installation-launcher" module present in CMS for the "dashboard" page
      And user is in the "Account" page
     Then the "esim_module" module is displayed
      And the "esim_module.icon" icon is displayed
      And the "esim_module.title" textfield with "You have an eSIM profile ready for installation" text is displayed
      And the "esim_module.chevron" icon is displayed

  @jira.QANOV-60194 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-132515
  @jira.link.parent_test_plan.QANOV-60162 @jira.link.parent_test_plan.QANOV-77438 @mobile @o2uk @smoke
  Scenario: A user that has an eSIM to install but has not a compatible device will not see the module in the dashboard
    other_affected_version="2022-09"
    Given user has a "AO2 postpay" account type
      And user has an eSIM profile to install
      And user does not have a device with eSIM capabilities
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "esim_module" module is not displayed

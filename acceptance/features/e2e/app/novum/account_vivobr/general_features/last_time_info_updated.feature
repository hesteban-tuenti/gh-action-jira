# -*- coding: utf-8 -*-
@jira.QANOV-4326
Feature: Last time info updated


  @jira.QANOV-295159 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-21950
  @jira.link.parent_test_plan.QANOV-226748 @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-4327 @mobile
  @no_automatable @regression @vivobr @old_app
  Scenario: Legacy user can check the date/time of last update
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    commented_tags="@depends_on.NOV-30"
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
     When pulls down the page to refresh
     Then the "ConsumptionV1" page is displayed
      And the "last_update_message" textfield with the "Atualizado em dd/mm/yyyy às hh:mm" format is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-126805
Feature: Balance Module


  @jira.QANOV-36656 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-24141 @live
  @mobile @next @o2uk @regression @webapp
  Scenario: A legacy prepay user without balance will see the balance module
    Given user has a "legacy prepay" account type
      And user has a "0" balance
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "balance" element is visible
     Then the "balance.title" textfield with "Balance" text is displayed
      And the "balance.amount" textfield is displayed in "red" color
      And the "balance.amount" textfield with "£0.00" text is displayed
      And the "balance.top_up" link with "Top Up" text is displayed

  @jira.QANOV-36657 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-24141 @live
  @mobile @next @o2uk @sanity @webapp
  Scenario: A legacy prepay user with balance will see the balance module
    internal_checkpoint="balance.amount format: £X.XX"
    Given user has a "legacy prepay" account type
      And user has a ">0" balance
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "balance" element is visible
     Then the "balance.title" textfield with "Balance" text is displayed
      And the "balance.amount" textfield is displayed in "black" color
      And the "balance.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "balance.top_up" link with "Top Up" text is displayed

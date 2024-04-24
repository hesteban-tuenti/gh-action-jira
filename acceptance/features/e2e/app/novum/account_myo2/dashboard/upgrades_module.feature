# -*- coding: utf-8 -*-
@jira.QANOV-126812
Feature: Upgrades Module


  @jira.QANOV-5806 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-97826 @jira.link.relates_to.NOV-101126 @live @mobile @next @o2uk @sanity
  @jira.link.parent_test_plan.QANOV-249005 @webapp
  Scenario: A legacy postpay user eligible to upgrade his device access to dashboard: upgrade card will be shown
    The user will be eligible for upgrade when the O2 MW response of /{msisdn}/postpay/upgradespromotions will
    return a value 'FREE' or 'PAID' for the elegibilityStatus. The description message in the card will be set in
    the CMS
    other_affected_versions="2021-25, 2022-31"
    Given user has a "legacy postpay" account type
      And user is eligible for an upgrade
      And user has the matching subscription selected in the account
      And user has the "offering-card-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "upgrade_module" element is visible
     Then the "upgrade_module.module_title" textfield with "Upgrade" text is displayed
      And the "upgrade_module.title" textfield is displayed
      And the "upgrade_module.description" textfield is displayed
      And the "upgrade_module.button_secondary" button is displayed

  @jira.QANOV-5813 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-119544 @live @mobile @next @o2uk @regression @jira.link.parent_test_plan.QANOV-249005
  Scenario: A legacy postpay user can access to his/her Device Upgrade offer from the upgrade card button in the account dashboard
    The user will be eligible for upgrade when the O2 MW response of /{msisdn}/postpay/upgradespromotions will
    return a value 'FREE' or 'PAID' for the elegibilityStatus
    other_affected_versions="2022-31"
    Given user has a "legacy postpay" account type
      And user is eligible for an upgrade
      And user has the matching subscription selected in the account
      And user has the "offering-card-legacy" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "upgrade_module.button_secondary" link
      And waits "10" seconds
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-223861 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-97826 @jira.link.relates_to.NOV-101126 @live @mobile @next @o2uk @sanity
  @jira.link.parent_test_plan.QANOV-249005 @webapp
  Scenario: A legacy postpay user not eligible to upgrade his device access to dashboard: upgrade card will not be shown
    The user will not be eligible for upgrade when the O2 MW response of /{msisdn}/postpay/upgradespromotions will
    return a 'NONE' value for the elegibilityStatus. The description message in the card will be set in the CMS
    other_affected_versions="2021-25, 2022-21, 2022-31"
    Given user has a "legacy postpay" account type
      And user is not eligible for an upgrade
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "upgrade_module" module is not displayed

  @jira.QANOV-5817 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-101126 @mobile @o2uk @smoke @jira.link.parent_test_plan.QANOV-249005 @cert0 @cert1 @qa @webapp
  Scenario: An AO2 postpay user can see the upgrade card in their Account
    The scenario when there is a PEGA offer for this module is covered in the PEGA_offers feature in general/features
    other_affected_versions="2022-31"
    Given user has a "AO2 postpay" account type
      And user does not have a PEGA offer for the "upgrades" module
      And user has the matching subscription selected in the account
      And user has the "offering-card-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "upgrade_module" element is visible
     Then the "upgrade_module.module_title" textfield with "Upgrade" text is displayed
      And the "upgrade_module.title" textfield is displayed
      And the "upgrade_module.description" textfield is displayed
      And the "upgrade_module.button_secondary" link is displayed

  @jira.QANOV-5818 @android @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-101126
  @automatic @mobile @o2uk @regression @jira.link.parent_test_plan.QANOV-249005 @cert0 @cert1
  Scenario: An AO2 user can access the Upgrade webview from the Account dashboard
    other_affected_versions="2022-31"
    Given user has a "AO2 postpay" account type
      And user does not have a PEGA offer for the "upgrades" module
      And user has the matching subscription selected in the account
      And user has the "offering-card-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "upgrade_module.button_secondary" button
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

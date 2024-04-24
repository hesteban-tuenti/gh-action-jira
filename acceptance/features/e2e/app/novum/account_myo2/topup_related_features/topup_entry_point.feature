# -*- coding: utf-8 -*-
@jira.QANOV-8090
Feature: Topup entry point

  Actions Before each Scenario:
    Given user has a "legacy prepay" account type


  @jira.QANOV-8092 @android @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-63541
  @manual @mobile @o2uk @smoke
  Scenario: A legacy prepay user can make a top up from current tariff details screen
    Given user has no pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Tariff Details" page
     When clicks on the "top_up" button
     Then the internal webview with "Top-up" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Tariff Details" page is displayed

  @jira.QANOV-8094 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.2
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-122423 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay user with pending tariff change can make a top up from the future tariff details screen
    commented_tags="@depends_on.NOV-122417"
    Given user has pending tariff change in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Future Tariff Details" page
     When clicks on the "top_up" button
     Then the internal webview with "Top-up" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Future Tariff Details" page is displayed

  @jira.QANOV-8096 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-101550 @live @mobile @next @o2uk @sanity
  Scenario: A legacy prepay user can make a top up from the account dashboard
    internal_checkpoint="CERT1: multimsisdnpayg@o2.com/test123
    CERT2: 447703770000@gmail.com/password"
    commented_tags="@depends_on.NOV-100976"
    Given user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "balance.top_up" button
     Then the internal webview with "Top-up" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

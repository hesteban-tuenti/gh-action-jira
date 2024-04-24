# -*- coding: utf-8 -*-
@jira.QANOV-126807
Feature: OB Recommendations


  @jira.QANOV-5803 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-101005
  @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user won't see the Recommendations card if the OB hasn't proposed it
    You can check the OB's proposal in the api call /postpay/bill/billedcharges in the field 'recommendations' 
    (in this case this field should not appear)
    Given user has a "legacy postpay" account type
      And user has no recommendations to change tariff
      And user has the matching subscription selected in the account
      And user has the "offering-insert" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "recommendations" module is not displayed

  @jira.QANOV-5796 @android @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100917
  @automatic @mobile @o2uk @sanity @qa @cert0 @cert1 @next @webapp
  Scenario: A legacy postpay user can see the OB's proposals to save in his/her bill in the Recommendations card
    You can check the OB's proposal in the api call /postpay/bill/billedcharges in the field 'recommendations'
    Given user has a "legacy postpay" account type
      And user has recommendations to change tariff
      And user has the matching subscription selected in the account
      And user has the "offering-insert" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "tariff_recommendation" element is visible
     Then the "tariff_recommendation.title" textfield with "Let's save you money" text is displayed
      And the "tariff_recommendation.description" textfield is displayed
      And the "tariff_recommendation.button_secondary" button with "Find a better tariff" text is displayed

  @jira.QANOV-5799 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.depends_on.QANOV-5797
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-119552 @mobile @o2uk @smoke @qa
  Scenario: A legacy postpay user can access to the Change his/her tariff from the Recommendations card
    You can check the OB's proposal in the api call /postpay/bill/billedcharges in the field 'recommendations'
    Given user has a "legacy postpay" account type
      And user has recommendations to change tariff
      And user has the matching subscription selected in the account
      And user has the "offering-insert" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "tariff_recommendation.button_secondary" button
     Then the internal webview is displayed
      And waits "5" seconds
      And the "Choose your tariff" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

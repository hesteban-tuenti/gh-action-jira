# -*- coding: utf-8 -*-
@jira.QANOV-427177
Feature: Inactive SIM


  @jira.QANOV-427179 @TBD @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @regression @raitt_drop1
  Scenario: A RAITT user with an inactive SIM will see a popup after logging
    Given user has a "raitt" account type
      And user has not the "CUSTOMER_APP_CHANNEL" forbidden use case
      And user has a SIM in "deactivated" status
      And user is logged out
     When logs in the application
     Then the "Inactive SIM" popup is displayed
      And the "title" textfield with "Activate a SIM card" text is displayed
      And the "message" textfield with "Activate your sim card to start using the App." text is displayed
      And the "popup.accept" button with "OK" text is displayed

  @jira.QANOV-427181 @TBD @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @regression @raitt_drop1
  Scenario: A RAITT user with an inactive SIM will redirected to the splash screen after close the SIM popup
    Given user has a "raitt" account type
      And user has not the "CUSTOMER_APP_CHANNEL" forbidden use case
      And user has a SIM in "deactivated" status
      And user is logged out
     When logs in the application
      And the "Inactive SIM" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

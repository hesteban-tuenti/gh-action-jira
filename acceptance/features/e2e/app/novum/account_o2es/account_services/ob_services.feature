# -*- coding: utf-8 -*-
@jira.QANOV-492991
Feature: OB Services


  @jira.QANOV-492992 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: An internet user can access the speed test service from the Account page
    TBD the names of the modules and how the WV wil open
    Given user has a "internet" plan
      And user has the matching subscription selected in the account
      And user has the "Services List" modules configured in CMS for "Account" page
     When clicks on the "services_module.speed_test" entrypoint
     Then the internal webview with "tbd" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-492993 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: A mobile user can access the service to configure the mobile line from the Mobile Dashboard page
    TBD the names of the modules and how the WV will open
    Given user has a "mobile" product
      And user has the "Services List" modules configured in CMS for "Mobile Dashboard" page
      And user is in the "Mobile Dashboard" page
     When clicks on the "services_module.configure_line" entrypoint
     Then the internal webview with "tbd" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Mobile Dashboard" page is displayed

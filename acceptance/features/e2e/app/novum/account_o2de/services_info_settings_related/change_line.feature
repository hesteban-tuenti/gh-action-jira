# -*- coding: utf-8 -*-
@jira.QANOV-547379
Feature: Change line number

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "CUSTOMER_UPDATE_DATA" forbidden use case


  @jira.QANOV-547380 @android @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-44456 @manual @mobile @o2de @regression
  Scenario: A postpay user with only a mobile line can access to the "Change Line" screen from the Services screen
    Given user has "1" mobile lines
      And user has the "Change Number Info" module configured in CMS for "Change Number Info" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "line_number_entrypoint.chevron" entrypoint
     Then the "Change Number Info" page is displayed
      And the "Rufnummerntausch" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-547381 @android @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-44456 @manual @mobile @o2de @regression
  Scenario: A postpay user with several mobile lines can access to the "Change Line" screen from the Services screen
    Given user has "several" mobile lines
      And user has the "Change Number Select Line" module configured in CMS for "Change Number Select Line" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "line_number_entrypoint.chevron" entrypoint
     Then the "Change Number Select Line" page is displayed
      And the "Meine Produkte" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

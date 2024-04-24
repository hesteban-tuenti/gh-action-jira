# -*- coding: utf-8 -*-
@jira.QANOV-269657
Feature: Activate prepay SIM


  @jira.QANOV-269658 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44456 @jira.link.detects.O2DE-2941 @manual
  @mobile @o2de @smoke
  Scenario: A postpay user can access to the "Activate Prepay SIM" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;my_handy;internet_at_home" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.activate_prepay_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "o2 SIM-Karte aktivieren: Mit Vertrag oder Prepaid SIM-Karte aktivieren: Mit Vertrag oder Prepaid" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-286704 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47800 @jira.link.detects.O2DE-2941 @manual
  @mobile @o2de @smoke
  Scenario: A prepay user can access to the "Activate Prepay SIM" screen
    Given user has a "prepay" account type
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "activate_prepay_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "o2 SIM-Karte aktivieren: Mit Vertrag oder Prepaid SIM-Karte aktivieren: Mit Vertrag oder Prepaid" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

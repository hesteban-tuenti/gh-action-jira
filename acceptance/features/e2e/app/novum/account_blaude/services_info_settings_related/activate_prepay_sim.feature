# -*- coding: utf-8 -*-
@jira.QANOV-269652
Feature: Activate prepay SIM


  @jira.QANOV-269653 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202565 @manual @mobile @smoke
  @raitt_drop1
  Scenario: A postpay user can access to the "Activate Prepay SIM" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;my_handy" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.activate_prepay_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "blau SIM-Karte aktivieren: Mit Vertrag oder Prepaid SIM-Karte aktivieren: Mit Vertrag oder Prepaid" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-286669 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171313 @manual @mobile @smoke
  @raitt_drop1
  Scenario: A prepay user can access to the "Activate Prepay SIM" screen
    Given user has a "prepay" account type
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "activate_prepay_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "blau SIM-Karte aktivieren: Mit Vertrag oder Prepaid SIM-Karte aktivieren: Mit Vertrag oder Prepaid" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

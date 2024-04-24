# -*- coding: utf-8 -*-
@jira.QANOV-214575
Feature: Delete SIM

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has "several" SIMs in "active" status for the same mobile line
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page


  @jira.QANOV-214576 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-206017
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @sanity
  Scenario: A multisim UDP user with several active SIMs can access to the "Sim Deletion" flow for an active SIM
    User: 017623201255 / #NQT#tlfncD3
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
     Then the "Delete SIM" page is displayed
      And the "Gerät entfernen" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "SIM deaktivieren" text is displayed
      And the "description" textfield with "Die Entfernung des Gerätes bzw. Deaktivierung der SIM-Karte erfolgt unwiderruflich. Die Karte ist ab dem Zeitpunkt nicht mehr nutzbar und nicht reaktivierbar." text is displayed
      And the "description2" textfield with "Eine Bestellung oder Aktivierung einer Ersatz-SIM-Karte ist danach nicht mehr möglich." text is displayed
      And the "subtitle" textfield with "Dein SIM-Status" text is displayed
      And the "sim_name" textfield is displayed
      And the "msisdn" textfield is displayed
      And the "sim_number" textfield is displayed
      And the "block_sim_entrypoint" entrypoint with "SIM-Karte sperren" text is displayed
      And the "block_sim_label" textfield with "SIM-Karte bei Verlust für Nutzung sperren" text is displayed
      And the "faqs_entrypoint" entrypoint with "Fragen zur SIM-Deaktivierung?" text is displayed
      And the "remove_button" button with "Unwiderruflich entfernen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-387922 @android @ber @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-206017
  @jira.link.detects.O2DE-3417 @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim non-UDP user with several active SIMs can access to an external webview to delete an active SIM
    Given user has a non-UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Mein o2" header is displayed
      And the "SIM-Karte sperren & entsperren" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-214577 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214576 @jira.link.detects.O2DE-3317
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user can access to the "Block Card Temporaly" screen from the "Sim Deletion" screen
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
      And the "Delete SIM" page is displayed
      And clicks on the "block_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Mein o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Delete SIM" page is displayed

  @jira.QANOV-214578 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214576 @jira.link.detects.O2DE-3318
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user can access to the "Sim Deactivation FAQs" screen from the "Sim Deletion" screen
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
      And the "Delete SIM" page is displayed
      And clicks on the "faqs_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "FAQs" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Delete SIM" page is displayed

  @jira.QANOV-214579 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214576
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user decides to deactivate a SIM: a confirmation popup is displayed
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
      And the "Delete SIMn" page is displayed
      And clicks on the "remove_button" entrypoint
     Then the "Delete SIM Confirmation" popup is displayed
      And the "title" textfield with "Bist du sicher, dass du deine SIM-Karte deaktiviern willst?" text is displayed
      And the "body" textfield with "Die Deaktivierung kann nicht rückgänging gemacht werden." text is displayed
      And the "accept_button" button with "OK" text is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-214580 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214579
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user cancels the SIM deactivation
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
      And the "Delete SIM" page is displayed
      And clicks on the "remove_button" entrypoint
      And the "Delete SIM Confirmation" popup is displayed
      And clicks on the "cancel_button" button
     Then the "Delete SIM" page is displayed

  @jira.QANOV-214581 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214579
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @smoke
  Scenario: A multisim UDP user confirms the SIM deactivation: SIM deletion finished successfully
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user has the "Delete SIM Success Feedback" module configured in CMS for "Delete SIM Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
      And the "Delete SIM" page is displayed
      And clicks on the "remove_button" entrypoint
      And the "Delete SIM Confirmation" popup is displayed
      And clicks on the "accept_button" button
     Then the "Delete SIM Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deaktivierung SIM-Karte" text is displayed
      And the "success_message" textfield with "In Kürze deaktivieren wir deine SIM-Karte – manchmal kann es etwas länger dauern (bis zu 24h)." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

  @jira.QANOV-214582 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214581
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user who finished the SIM deletion successfully can tap on the "Back to dashboard" button in the Success Feedback screen
    Given user has a UDP tariff
      And user has the "Delete SIM Success Feedback" module configured in CMS for "Delete SIM Success Feedback" page
      And user is in the "Delete SIM Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-214584 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214579
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user confirms the SIM deactivation but an error happens: SIM deletion finished unsuccessfully
    Given user has a UDP tariff
      And user has the "Delete SIM" module configured in CMS for "Delete SIM" page
      And user has the "Delete SIM Error Feedback" module configured in CMS for "Delete SIM Error Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.delete_sim_entrypoint" entrypoint
      And the "Delete SIM" page is displayed
      And clicks on the "remove_button" entrypoint
      And the "Delete SIM Confirmation" popup is displayed
      And clicks on the "accept_button" button
      And there is an error deleting the sim
     Then the "Delete SIM Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Wir konnten deine Anfrage leider nicht bearbeiten." text is displayed
      And the "error_message" textfield with "Bitte versuche es später ernut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "SIM Details" page is displayed

  @jira.QANOV-214585 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214584
  @jira.link.parent_test_plan.QANOV-386653 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user who finished the SIM deletion unsuccessfully can tap on the "Back to dashboard" button in the Error Feedback screen
    Given user has a UDP tariff
      And user has the "Delete SIM Error Feedback" module configured in CMS for "Delete SIM Error Feedback" page
      And user is in the "Delete SIM Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-214587 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214584 @jira.link.parent_test_plan.QANOV-386653
  @manual @mobile @o2de @regression
  Scenario: A multisim UDP user who finished the SIM deletion unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a UDP tariff
      And user has the "Delete SIM Error Feedback" module configured in CMS for "Delete SIM Error Feedback" page
      And user is in the "Delete SIM Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Delete SIM" page is displayed
      And the "Gerät entfernen" header is displayed

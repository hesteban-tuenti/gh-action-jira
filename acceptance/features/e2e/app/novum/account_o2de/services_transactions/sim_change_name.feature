# -*- coding: utf-8 -*-
@jira.QANOV-214540
Feature: SIM Change Name

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has a SIM in any of "active;in_preparation;activating" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page


  @jira.QANOV-214541 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-206017 @jira.link.depends_on.QANOV-206018
  @jira.link.depends_on.QANOV-206019 @manual @mobile @o2de @sanity
  Scenario: A multisim user can access to the "Sim Name Change" screen for a SIM in in_preparation, activating or active status
    Given user has the "SIM name change" module configured in CMS for "Sim Name Change" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.sim_name_change_entrypoint" entrypoint
     Then the "Sim Name Change" page is displayed
      And the "SIM /Gerät benennen" header is displayed
      And the "title" textfield with "SIM-Karten-/Gerätenamen" text is displayed
      And the "description" textfield with "Gebe dieser SIM-Karte einen individuellen Namen, z.B. "Mein Smartphone"." text is displayed
      And the "device_name_inputtext" inputtext with the "Gerätenamen" placeholder is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-214542 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214541 @manual @mobile @o2de @regression
  Scenario: A multisim user cannot save the changes in SIM name without making any change
    Given user has the "SIM name change" module configured in CMS for "Sim Name Change" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.sim_name_change_entrypoint" entrypoint
      And the "Sim Name Change" page is displayed
      And clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen" text is displayed

  @jira.QANOV-214543 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214541 @manual @mobile @o2de @smoke @ber
  Scenario: A multisim user can save the changes in SIM name successfully
    Given user has the "SIM name change" module configured in CMS for "Sim Name Change" page
      And user has the "SIM Name Change Success Feedback" module configured in CMS for "SIM Name Change Success Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.sim_name_change_entrypoint" entrypoint
      And the "Sim Name Change" page is displayed
      And fills the "device_name_inputtext" inputtext with the "QA" text
      And clicks on the "save_button" button
     Then the "SIM Name Change Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karte umbennant" text is displayed
      And the "success_message" textfield with "Die Aktualisierung des Namens kann wenige Minuten dauern. Du kannst den Namen deiner SIM-Karte jederzeit erneut ändern." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214543 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user who finished to change the SIM name successfully can tap on the "<button_name>" button in the Success Feedback screen
    Given user has the "SIM Name Change Success Feedback" module configured in CMS for "SIM Name Change Success Feedback" page
      And user is in the "SIM Name Change Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed

    Examples:
          | button_name       | button_id                       | destination_page | jira_id      |
          | Back to dashboard | back_to_dashboard_button        | Account          | QANOV-214544 |
          | Close             | navigation_top_bar.close_button | Sim Details      | QANOV-214545 |

  @jira.QANOV-214546 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214541 @manual @mobile @o2de @regression
  Scenario: A multisim user wants to save the changes in SIM name but an error happens: SIM name change finished unsuccessfully
    Given user has the "SIM name change" module configured in CMS for "Sim Name Change" page
      And user has the "SIM Name Change Error Feedback" module configured in CMS for "SIM Name Change Error Feedback" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.sim_name_change_entrypoint" entrypoint
      And the "Sim Name Change" page is displayed
      And fills the "device_name_inputtext" inputtext with the "QA" text
      And clicks on the "save_button" button
      And there is an error changing the sim name
     Then the "SIM Name Change Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send your request" text is displayed
      And the "error_message" textfield with "Please try again later." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214546 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user who changed the SIM name unsuccessfully can tap on the "<button_name>" button in the Error Feedback screen
    Given user has the "SIM Name Change Error Feedback" module configured in CMS for "SIM Name Change Error Feedback" page
      And user is in the "SIM Name Change Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed

    Examples:
          | button_name       | button_id                       | destination_page | jira_id      |
          | Back to dashboard | back_to_dashboard_button        | Account          | QANOV-214547 |
          | Close             | navigation_top_bar.close_button | SIM Details      | QANOV-214548 |

  @jira.QANOV-214549 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-214546 @manual @mobile @o2de @regression
  Scenario: A multisim user who changed the SIM name unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "SIM Name Change Error Feedback" module configured in CMS for "SIM Name Change Error Feedback" page
      And user is in the "SIM Name Change Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Sim Name Change" page is displayed
      And the "TBD" header is displayed

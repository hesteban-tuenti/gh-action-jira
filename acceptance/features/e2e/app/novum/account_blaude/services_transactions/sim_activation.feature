# -*- coding: utf-8 -*-
@jira.QANOV-195611
Feature: SIM Activation

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account


  @jira.<jira_id> @android @ber @blaude @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.OBO2DE-424
  @manual @mobile @sanity
  Scenario Outline: A monosim user with a SIM ready to activate can start de SIM activation
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    The phone number (Rufnummer) will be shown under sim name when it comes from the API (there can be cases when API
    response does not have a phone number, in this case we hide the row rufnummer).
    Only plastic SIM are available (eSIM is not available in Blau).
    Given user has "multisim" service in "deactivated" status
      And user has a SIM in "<sim_status>" status
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user has the "Activate Sim Confirmation" module configured in CMS for "Activate Sim Confirmation" page
      And user is in the "Sim Management" page
     When clicks on the element with "status" field with "<status_label>" value of the "sims_list" list
      And the "Activate Sim Info" page is displayed
      And clicks on the "start_sim_activation_button" button
     Then the "Activate Sim Confirmation" page is displayed
      And the "SIM-Aktivierung" header is displayed
      And the "title" textfield with "SIM-Aktivierung" text is displayed
      And the "sim_type.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_type.sim_format" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_name.label" textfield with "SIM-Name" text is displayed
      And the "sim_name.value" textfield is displayed
      And the "phone_number.label" textfield with "Rufnummer" text is displayed
      And the "phone_number.value" textfield is displayed
      And the "tariff_name.label" textfield is not displayed
      And the "tariff_name.value" textfield is not displayed
      And the "sim_number.label" textfield with "SIM-Nr.:" text is displayed
      And the "sim_number.value" textfield is displayed
      And the "activate_button" button with "Aktivieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

    @raitt_drop2
    Examples:
          | cv     | sim_status | status_label   | depends_on   | jira_id      |
          | 13.9   | shipped    | Wurde versandt | QANOV-190400 | QANOV-195612 |

    Examples:
          | cv     | sim_status       | status_label           | depends_on   | jira_id      |
          | Future | ready_activation | Bereit zur Aktivierung | QANOV-477112 | QANOV-477151 |

  @jira.<jira_id> @android @ber @blaude @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.OBO2DE-433
  @manual @mobile @smoke
  Scenario Outline: A monosim user confirms to activate the SIM: SIM activation finished successfully
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    For monosim users: once the SIM is active, the previous one will be deactivated.
    Given user has "multisim" service in "deactivated" status
      And user has a SIM in "<sim_status>" status
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user has the "Activate Sim Confirmation" module configured in CMS for "Activate Sim Confirmation" page
      And user has the "Activate SIM Success Feedback" module configured in CMS for "Activate SIM Success Feedback" page
      And user is in the "Sim Management" page
     When clicks on the element with "status" field with "<status_label>" value of the "sims_list" list
      And the "Activate Sim Info" page is displayed
      And clicks on the "start_sim_activation_button" button
      And the "Activate Sim Confirmation" page is displayed
      And clicks on the "activate_button" button
     Then the "Activate SIM Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "SIM-Karte wird aktiviert" text is displayed
      And the "success_message" textfield with "<success_message>" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

    @raitt_drop2
    Examples:
          | cv     | sim_status | status_label   | success_message                                                                                                 | depends_on   | jira_id      |
          | 13.9   | shipped    | Wurde versandt | Du hast die Aktivierung dieser SIM erfolgreich angefordert. Nah der Aktivierung wird deine alte SIM deaktiviert | QANOV-195612 | QANOV-195613 |

    @TBD
    Examples:
          | cv     | sim_status       | status_label           | success_message | depends_on   | jira_id      |
          | Future | ready_activation | Bereit zur Aktivierung | TBD             | QANOV-477151 | QANOV-477150 |

  @jira.QANOV-195614 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-195613
  @jira.link.depends_on.QANOV-477150 @manual @mobile @regression
  Scenario: A user who finished the SIM activation successfully can tap on the "Back to dashboard" button in the Success Feedback screen
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "Activate SIM Success Feedback" module configured in CMS for "Activate SIM Success Feedback" page
      And user is in the "Activate SIM Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-195616 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-195612
  @jira.link.depends_on.QANOV-477151 @manual @mobile @regression
  Scenario: A user confirms to activate the SIM but an error happens: SIM activation finished unsuccessfully
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user has the "Activate Sim Confirmation" module configured in CMS for "Activate Sim Confirmation" page
      And user has the "Activate SIM Error Feedback" module configured in CMS for "Activate SIM Error Feedback" page
      And user is in the "Activate Sim Info" page
     When clicks on the "start_sim_activation_button" button
      And the "Activate Sim Confirmation" page is displayed
      And clicks on the "activate_button" button
      And there is an error activating the sim
     Then the "Activate SIM Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "SIM-Karte Konnte nicht aktiviert werden" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.QANOV-195617 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-195616 @manual @mobile @regression
  Scenario: A user who finished the SIM activation unsuccessfully can tap on the "Back to dashboard" button in the Error Feedback screen
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "Activate SIM Error Feedback" module configured in CMS for "Activate SIM Error Feedback" page
      And user is in the "Activate SIM Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-195619 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-195616 @manual @mobile @regression
  Scenario: A user who finished the SIM activation unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "Activate SIM Error Feedback" module configured in CMS for "Activate SIM Error Feedback" page
      And user is in the "Activate SIM Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Activate Sim Confirmation" page is displayed
      And the "SIM aktivieren" header is displayed

  @jira.QANOV-195620 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-190400
  @jira.link.depends_on.QANOV-477112 @manual @mobile @raitt_drop2 @smoke
  Scenario: A user with a SIM ready to activate can report a problem
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user is in the "Activate Sim Info" page
     When clicks on the "report_a_problem_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

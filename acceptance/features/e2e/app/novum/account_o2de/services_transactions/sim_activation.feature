# -*- coding: utf-8 -*-
@jira.QANOV-195601
Feature: SIM Activation

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has the matching subscription selected in the account


  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A monosim user with a SIM ready to activate can start de SIM activation
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    The phone number (Rufnummer) will be shown under sim name when it comes from the API (there can be cases when API
    response does not have a phone number, in this case we hide the row rufnummer).
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
      And the "sim_name.label" textfield is not displayed
      And the "sim_name.value" textfield is not displayed
      And the "phone_number.label" textfield with "Rufnummer" text is displayed
      And the "phone_number.value" textfield is displayed
      And the "tariff_name.label" textfield is not displayed
      And the "tariff_name.value" textfield is not displayed
      And the "sim_number.label" textfield with "SIM-Nr.:" text is displayed
      And the "sim_number.value" textfield is displayed
      And the "activate_button" button with "Aktivieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

    Examples:
          | cv    | sim_status       | status_label           | depends_on   | jira_id      |
          | 14.2  | shipped          | Wurde versandt         | QANOV-195499 | QANOV-195602 |
          | 14.11 | ready_activation | Bereit zur Aktivierung | QANOV-452268 | QANOV-452283 |

  @jira.<jira_id> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @o2de @sanity
  Scenario Outline: A multisim user with a <sim_type> ready to activate can start de SIM activation
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    The phone number (Rufnummer) will be shown under sim name when it comes from the API (there can be cases when API
    response does not have a phone number, in this case we hide the row rufnummer).
    User with pSIM ready to activate: 017623201251 / #NQT#tlfncD3
    User with eSIM ready to activate: 017632230100 / #NQT#tlfncD3
    Given user has "multisim" service in "activated" status
      And user has a SIM in "<sim_status>" status
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user has the "Activate Sim Confirmation" module configured in CMS for "Activate Sim Confirmation" page
      And user is in the "Sim Management" page
     When clicks on the element with "status" field with "<status_label>" value of the "sims_list" list
      And the "Activate Sim Info" page is displayed
      And clicks on the "start_sim_activation_button" button
     Then the "Activate Sim Confirmation" page is displayed
      And the "<header>" header is displayed
      And the "title" textfield with "<header>" text is displayed
      And the "sim_type.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_type.sim_format" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_name.label" textfield with "SIM-Name" text is displayed
      And the "sim_name.value" textfield is displayed
      And the "phone_number.label" textfield with "Rufnummer" text is displayed
      And the "phone_number.value" textfield is displayed
      And the "tariff_name.label" textfield with "Neue SIM-Karte für" text is displayed
      And the "tariff_name.value" textfield is displayed
      And the "sim_number.label" textfield with "SIM-Nr.:" text is displayed
      And the "sim_number.value" textfield is displayed
      And the "activate_button" button with "Aktivieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

    Examples:
          | cv    | sim_type | header           | sim_status       | status_label           | depends_on   | jira_id      |
          | 14.2  | psim     | SIM-Aktivierung  | shipped          | Wurde versandt         | QANOV-195499 | QANOV-214466 |
          | 14.11 | esim     | eSIM-Aktivierung | ready_activation | Bereit zur Aktivierung | QANOV-452268 | QANOV-452284 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: A <user_type> user confirms to activate the SIM: SIM activation finished successfully
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    For monosim users: once the SIM is active, the previous one will be deactivated (as only one SIM can be active).
    For multisim users: user can have serveral SIMs in active status.
    To know if the eSIM is in pending installation status or pending activation status, we also need to check the API
    field 'smdp status'.
    Given user has "multisim" service in "<multisim_status>" status
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

    Examples:
          | cv    | user_type | multisim_status | sim_status       | status_label           | success_message                                                                                                                            | ber | depends_on   | jira_id      |
          | 14.2  | monosim   | deactivated     | shipped          | Wurde versandt         | Du hast die Aktivierung dieser SIM erfolgreich angefordert. Nah der Aktivierung wird deine alte SIM deaktiviert                            | ber | QANOV-195602 | QANOV-195603 |
          | 14.2  | multisim  | activated       | shipped          | Wurde versandt         | Hinweis: sollte keine SMS zugestellt werden, Gerät neustarten. Bei Multicards ist der SMS-Empfang evtl. auf eine andere Karte eingestellt. |     | QANOV-214466 | QANOV-214467 |
          | 14.11 | monosim   | deactivated     | ready_activation | Bereit zur Aktivierung | TBD                                                                                                                                        |     | QANOV-452283 | QANOV-452285 |
          | 14.11 | multisim  | activated       | ready_activation | Bereit zur Aktivierung | Hinweis: sollte keine SMS zugestellt werden, Gerät neustarten. Bei Multicards ist der SMS-Empfang evtl. auf eine andere Karte eingestellt. | ber | QANOV-452284 | QANOV-452286 |

  @jira.QANOV-195604 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195603 @jira.link.depends_on.QANOV-214467
  @jira.link.depends_on.QANOV-452285 @jira.link.depends_on.QANOV-452286 @manual @mobile @o2de @regression
  Scenario: A user who finished the SIM activation successfully can tap on the "Back to dashboard" button in the Success Feedback screen
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "Activate SIM Success Feedback" module configured in CMS for "Activate SIM Success Feedback" page
      And user is in the "Activate SIM Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-195606 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195602 @jira.link.depends_on.QANOV-214466
  @jira.link.depends_on.QANOV-452283 @jira.link.depends_on.QANOV-452284 @manual @mobile @o2de @regression
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

  @jira.QANOV-195607 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195606 @manual @mobile @o2de @regression
  Scenario: A user who finished the SIM activation unsuccessfully can tap on the "Back to dashboard" button in the Error Feedback screen
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "Activate SIM Error Feedback" module configured in CMS for "Activate SIM Error Feedback" page
      And user is in the "Activate SIM Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-195609 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195606 @manual @mobile @o2de @regression
  Scenario: A user who finished the SIM activation unsuccessfully can go to previous screen from the Error Feedback screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "Activate SIM Error Feedback" module configured in CMS for "Activate SIM Error Feedback" page
      And user is in the "Activate SIM Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Activate Sim Confirmation" page is displayed
      And the "SIM aktivieren" header is displayed

  @jira.QANOV-195610 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195499 @manual @mobile @o2de @smoke
  Scenario: A user with a SIM ready to activate can report a problem
    Given user has a SIM in any "shipped;ready_activation" status
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user is in the "Activate Sim Info" page
     When clicks on the "report_a_problem_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

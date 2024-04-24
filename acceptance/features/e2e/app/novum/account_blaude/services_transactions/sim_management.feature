# -*- coding: utf-8 -*-
@jira.QANOV-189945
Feature: SIM Management

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.<jira_id> @<ber> @<test_priority> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171313
  @jira.link.detects.OBO2DE-114 @manual @mobile @raitt_drop2
  Scenario Outline: A <account_type> user with several SIMs can access to the "SIM Management" screen
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Possible status of a pSIM: in preparation, shipped (ready to activate), activating, active, suspended, deactivated, unknown
    (SIMs with unknown status won't be displayed in the app).
    Possible status of a eSIM: in preparation, ready for intallation, ready for activation, activating, active, suspended, deactivated, unknown
    (SIMs with unknown status won't be displayed in the app).
    Given user has a "<account_type>" account type
      And user has "several" SIMs for the same mobile line
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "SIMs list" modules configured in CMS for "Sim Management" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "highlighted_services.sim_management_entrypoint" entrypoint
     Then the "Sim Management" page is displayed
      And the "SIM-Karte" header is displayed
      And the "sims_title" textfield with "SIM-KARTEN ZU DEINEM VERTRAG" text is displayed
      And the "sims_list" list is displayed
      And each element in the "sims_list" list has the "icon" field
      And each element in the "sims_list" list has the "status" textfield with the "Wird bald versandt|Wurde versandt|In Aktivierung|Aktiv|Gesperrt|Deaktiviert" format
      And each element in the "sims_list" list has the "name" field
      And each element in the "sims_list" list has the "card_type" field
      And each element in the "sims_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type | test_priority | ber | depends_on   | jira_id      |
          | prepay       | regression    |     | QANOV-171313 | QANOV-190395 |
          | postpay      | smoke         | ber | QANOV-202565 | QANOV-212430 |

  @jira.QANOV-189946 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-190395
  @jira.link.depends_on.QANOV-212430 @manual @mobile @raitt_drop2 @smoke
  Scenario: A user with several SIMs can access to the "SIM Details" screen
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Given user has "several" SIMs for the same mobile line
      And user has a SIM in any of "in_preparation;activating;active;suspended;deactivated" status
      And user has the matching subscription selected in the account
      And user has the "SIMs list" modules configured in CMS for "Sim Management" page
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Management" page
     When clicks on any element in the "sims_list" list with the "status" field that contains any of the "Wird bald versandt|In Aktivierung|Aktiv|Gesperrt|Deaktiviert" texts
     Then the "Sim Details" page is displayed
      And the "SIM-Karte" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Sim Management" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @raitt_drop2 @smoke
  Scenario Outline: A <account_type> user with only 1 SIM can access to the "SIM Details" screen
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Given user has a "<account_type>" account type
      And user has "1" SIMs for the same mobile line
      And user has a SIM in any of "in_preparation;activating;active;suspended;deactivated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "highlighted_services.sim_management_entrypoint" entrypoint
     Then the "Sim Details" page is displayed
      And the "SIM-Karte" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type | depends_on   | detects               | jira_id      |
          | prepay       | QANOV-171313 | OBO2DE-105:OBO2DE-114 | QANOV-189947 |
          | postpay      | QANOV-202565 | OBO2DE-114:OBO2DE-377 | QANOV-212434 |

  @jira.QANOV-190396 @android @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-212434 @jira.link.detects.O2DE-1879 @jira.link.detects.O2DE-2365 @manual @mobile
  @raitt_drop2 @sanity
  Scenario: A monosim postpay user can see the details of an active SIM
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    NOTE: for Blau, the Call and SMS status will not be displayed, as the value is always 'Active'.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "postpay" account type
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Aktiv" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.title" textfield with "SIM-KARTEN EINSTELLUNGEN" text is displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint with "Ersatz SIM-Karte" text is displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint with "SIM-Karte sperren" text is displayed
      And the "sim_settings.unblock_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint is not displayed
      And the "sim_settings.delete_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

  @jira.QANOV-427810 @android @ber @blaude @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-189947 @manual @mobile @raitt_drop2 @sanity
  Scenario: A monosim BOX7 prepay user can see the details of an active SIM
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    NOTE: for Blau, the Call and SMS status will not be displayed, as the value is always 'Active'.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "prepay" account type
      And user has a "box7" account type
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Aktiv" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.title" textfield with "SIM-KARTEN EINSTELLUNGEN" text is displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint with "Ersatz SIM-Karte" text is displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.unblock_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint is not displayed
      And the "sim_settings.delete_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

  @jira.QANOV-490011 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-189947 @manual @mobile @raitt_drop2 @sanity
  Scenario: A monosim RAITT prepay user can see the details of an active SIM
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API. Right now,
    all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Activation date will be shown if it comes in the API response (this field is not displayed for BOX7 prepay users).
    Block sim entrypoint will be shown for postpay and RAITT prepay users, but not for BOX7 prepay users.
    Given user has "multisim" service in "deactivated" status
      And user has a "prepay" account type
      And user has a "raitt" account type
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Aktiv" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.title" textfield with "SIM-KARTEN EINSTELLUNGEN" text is displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint with "Ersatz SIM-Karte" text is displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint with "SIM-Karte sperren" text is displayed
      And the "sim_settings.unblock_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint is not displayed
      And the "sim_settings.delete_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

  @jira.QANOV-190397 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-189947 @jira.link.depends_on.QANOV-212434 @jira.link.detects.OBO2DE-417 @manual @mobile
  @raitt_drop2 @regression
  Scenario: A monosim user can see the details of a blocked SIM
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    NOTE: for Blau, the Call and SMS status will not be displayed, as the value is always 'Active'.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a SIM in "suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Gesperrt" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.title" textfield with "SIM-KARTEN EINSTELLUNGEN" text is displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint with "Ersatz SIM-Karte" text is displayed
      And the "sim_settings.unblock_sim_entrypoint" entrypoint with "SIM-Karte entsperren" text is displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint is not displayed
      And the "sim_settings.delete_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189946 @manual @mobile @raitt_drop2
  @regression
  Scenario Outline: A monosim user can see the details of a <sim_status> SIM
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    NOTE: for Blau, the Call and SMS status will not be displayed, as the value is always 'Active'.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a SIM in "<sim_status>" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "<sim_status_text>" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

    Examples:
          | sim_status     | sim_status_text      | jira_id      |
          | in_preparation | Profil in Erstellung | QANOV-190398 |
          | activating     | In Aktivierung       | QANOV-190399 |

  @jira.QANOV-347709 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-189947 @jira.link.depends_on.QANOV-212434 @jira.link.detects.O2DE-3069 @manual @mobile
  @raitt_drop2 @regression
  Scenario: A monosim user can see the details of a deactivated SIM
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    NOTE: for Blau, the Call and SMS status will not be displayed, as the value is always 'Active'.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a SIM in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Deaktiviert" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)" format is displayed
      And the "sim_deactivated" module is displayed
      And the "sim_deactivated.info_icon" icon is displayed
      And the "sim_deactivated.title" textfield with "Deine SIM-Karte ist deaktiviert" text is displayed
      And the "sim_deactivated.description" textfield with "Die SIM-Karte ist deaktiviert und kann nicht wiederverwendet werden." text is displayed
      And the "sim_details" module is not displayed
      And the "sim_settings" module is not displayed
      And the "sim_services" module is not displayed

  @jira.QANOV-190400 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-190395
  @jira.link.depends_on.QANOV-212430 @manual @mobile @raitt_drop2 @sanity
  Scenario: A user with several SIMs can access to the "Activate pSIM" screen for a "shipped" pSIM (ready to activate pSIM)
    Prepay users can only have 1 active SIM, but can have more SIMs in other status.
    Given user has "several" SIMs for the same mobile line
      And user has a SIM in "shipped" status
      And user has the matching subscription selected in the account
      And user has the "SIMs list" module configured in CMS for "Sim Management" page
      And user has the "Activate Sim Info" module configured in CMS for "Activate Sim Info" page
      And user is in the "Sim Management" page
     When clicks on the element with "status" field with "Wurde versandt" value of the "sims_list" list
     Then the "Activate Sim Info" page is displayed
      And the "SIM-Aktivierung" header is displayed
      And the "title" textfield with "SIM-Karte aktivieren" text is displayed
      And the "description" textfield with "Bitte aktiviere die SIM-Karte erst, wenn du die SIM-Karte erhalten hast." text is displayed
      And the "step1_icon" icon is displayed
      And the "step1_textfield" textfield with "Mit dem WLAN verbinden" text is displayed
      And the "step2_icon" icon is displayed
      And the "step2_textfield" textfield with "SIM-Karte ins Gerät einlegen" text is displayed
      And the "step3_icon" icon is displayed
      And the "step3_textfield" textfield with "Mit der SIM-Aktivierung beginnen" text is displayed
      And the "start_sim_activation_button" button with "SIM-Karten Aktivierung starten" text is displayed
      And the "report_a_problem_button" button with "Problem melden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.QANOV-477111 @TBD @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-212430 @manual @mobile
  @sanity
  Scenario: A postpay user with several SIMs can access to the "Install eSIM" screen for a "ready for installation" eSIM
    eSIM is only available for postpay user.
    To know if the eSIM is in pending installation status or pending activation status, we also need to check the API
    field 'smdp status'.
    This status 'ready for installation' is valid for both:
    - Esim is neither installed nor activated
    - Esim is already activated but NOT installed
    Given user has a "postpay" account type
      And user has "several" SIMs for the same mobile line
      And user has a SIM in "ready_installation" status
      And user has the matching subscription selected in the account
      And user has the "SIMs list" modules configured in CMS for "Sim Management" page
      And user has the "Install Esim Info" module configured in CMS for "Install Esim Info" page
      And user is in the "Sim Management" page
     When clicks on the element with "status" field with "Bereit zur Installation" value of the "sims_list" list
     Then the "Install Esim Info" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "eSIM-Installation" text is displayed
      And the "sutitle" textfield with "Bevor deine eSIM installiert werden kann, ist eine Verifizierung nötig." text is displayed
      And the "message1_title" textfield with "Sicherheitscode per SMS" text is displayed
      And the "message1_description" textfield with "Um sicherzustellen, dass die eSIM auf einem deiner Geräte installiert wird, wird dir ein Sicherheitscode per SMS zugesendet." text is displayed
      And the "message2_title" textfield with "SMS Empfang nich möglich?" text is displayed
      And the "message2_description" textfield with "Du Kannst den eSIM-QR-Code alternativ auch auf anderen Wegen anfordern." text is displayed
      And the "validate_with_sms_button" button with "Mit SMS verifizieren" text is displayed
      And the "validate_without_sms_button" button with "Ohne SMS verifizieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.QANOV-477112 @TBD @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-212430 @manual @mobile
  @smoke
  Scenario: A postpay user with several SIMs can access to the "Activate eSIM" screen for a "ready for activation" eSIM
    eSIM is only available for postpay user.
    To know if the eSIM is in pending installation status or pending activation status, we also need to check the API
    field 'smdp status'.
    This status 'ready for activation' is valid for a eSim that has been installed on the device BUT not activated.
    Given user has a "postpay" account type
      And user has "several" SIMs for the same mobile line
      And user has a SIM in "ready_activation" status
      And user has the matching subscription selected in the account
      And user has the "SIMs list" modules configured in CMS for "Sim Management" page
      And user has the "Activate Esim Info" module configured in CMS for "Activate Esim Info" page
      And user is in the "Sim Management" page
     When clicks on the element with "status" field with "Bereit zur Aktivierung" value of the "sims_list" list
     Then the "Activate Sim Info" page is displayed
      And the "SIM-Karte" header is displayed
      And the "title" textfield with "SIM-Karte aktivieren" text is displayed
      And the "description" textfield with "Follow these easy steps for a successfull SIM activation" text is displayed
      And the "step1_icon" icon is displayed
      And the "step1_textfield" textfield with "Mit den WLAN verbinden" text is displayed
      And the "step2_icon" icon is displayed
      And the "step2_textfield" textfield with "Mit der eSIM-Aktivierung beginnen" text is displayed
      And the "start_sim_activation_button" button with "SIM-Karten Aktivierung starten" text is displayed
      And the "report_a_problem_button" button with "Problem melden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-212434 @manual @mobile @raitt_drop2 @regression
  Scenario Outline: A postpay user can see the activation date for an active SIM in the "SIM Details" screen
    The activation date is not available for BOX7 prepay users.
    Given user has a "<account_type>" account type
      And user has a "<stack>" account type
      And user has a SIM in "active" status
      And user has a SIM with activation date information
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.activation_date_label" textfield with "Aktivierung am:" text is displayed
      And the "sim_details.activation_date_value" textfield with the "\d+. (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format is displayed

    Examples:
          | cv    | account_type | stack | jira_id      |
          | 13.9  | postpay      | box7  | QANOV-319013 |
          | 14.10 | prepay       | raitt | QANOV-490012 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-212434 @manual @mobile @regression
  Scenario Outline: A postpay user can see the activation date for a suspended/in preparation/activating SIM in the "SIM Details" screen
    The activation date is not available for BOX7 prepay users.
    Given user has a "<account_type>" account type
      And user has a "<stack>" account type
      And user has a SIM in any of "in_preparation;activating;suspended" status
      And user has a SIM with activation date information
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.activation_date_label" textfield with "Aktivierung am:" text is displayed
      And the "sim_details.activation_date_value" textfield with "-" text is displayed

    Examples:
          | cv    | account_type | stack | jira_id      |
          | 13.9  | postpay      | box7  | QANOV-319014 |
          | 14.10 | prepay       | raitt | QANOV-490013 |

  @jira.QANOV-195513 @android @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-189946
  @jira.link.depends_on.QANOV-189947 @jira.link.depends_on.QANOV-212434 @jira.link.detects.OBO2DE-404 @manual @mobile
  @raitt_drop2 @smoke
  Scenario: A user can access to the "View PIN & PUK" service
    NOTE: the pin-puk API is responding with a "UNDEFINED" for some users.
    Given user has a SIM in any of "in_preparation;activating;active;suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user has the "PIN and PUK" modules configured in CMS for "View PIN And PUK" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_services.view_pin_puk_entrypoint" entrypoint
     Then the "View PIN And PUK" page is displayed
      And the "SIM-Karte" header is displayed
      And the "sim_number.label" textfield with "SIM-Nummer" text is displayed
      And the "sim_number.value" textfield with the "\d+" format is displayed
      And the "initial_pin.label" textfield with "Initiale PIN" text is displayed
      And the "initial_pin.value" textfield with the "(\d{4}|Undefined)" format is displayed
      And the "puk_number.label" textfield with "Initiale PUK" text is displayed
      And the "puk_number.value" textfield with the "(\d{8}|Undefined)" format is displayed
      And the "pin_info" textfield with "Hier kannst due die initiale PIN und PUK zu deiner SIM-Karte einsehen." text is displayed
      And the "puk_info" textfield with "Bitte beachte, dass die PIN nicht mehr gültig ist, falls due die initiale PIN auf eine persönliche PIN abgeändert hast." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-190396 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop2 @smoke
  Scenario Outline: A <stack> <account_type> user can block an active sim
    BOX7: Ob webview
    RAITT: OB Webview prod-raitt-b2c-blau-block-unblock-sim-raitt
    Given user has a "<account_type>" account type
      And user has a "<stack>" account type
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.block_sim_entrypoint" entrypoint
     Then the external webview is displayed
      And the "<string>" string is displayed
      And clicks on the native "back" button
      And the "Sim Details" page is displayed

    Examples:
          | cv    | account_type | stack | string            | detects              | jira_id      |
          | 13.9  | postpay      | box7  | Tarif & SIM-Karte | O2DE-2781:OBO2DE-379 | QANOV-195707 |
          | 14.10 | prepay       | raitt | TBD               |                      | QANOV-490014 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.<cv> @jira.link.depends_on.QANOV-190397 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop2 @regression
  Scenario Outline: A user can unblock a blocked sim
    BOX7: Ob webview
    RAITT: OB Webview prod-raitt-b2c-blau-block-unblock-sim-raitt
    Given user has a "<account_type>" account type
      And user has a "<stack>" account type
      And user has a SIM in "suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.unblock_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Details" page is displayed

    Examples:
          | cv    | account_type | stack | header               | detects    | jira_id      |
          | 13.9  | postpay      | box7  | b2c-sim-settings-app | OBO2DE-379 | QANOV-195709 |
          | 14.10 | prepay       | raitt | TBD                  |            | QANOV-493146 |

  @jira.QANOV-477113 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477108
  @jira.link.depends_on.QANOV-477110 @manual @mobile @regression
  Scenario: A postpay user can access to the "Install eSIM" screen from the "eSIM installation and activation" module in account dashboard
    eSIM is only available for postpay user.
    Given user has a "postpay" account type
      And user has a SIM in "ready_installation" status
      And user has the matching subscription selected in the account
      And user has the "eSIM installation and activation" module configured in CMS for "Account" page
      And user has the "Install Esim Info" module configured in CMS for "Install Esim Info" page
      And user is in the "Account" page
     When clicks on any element in the "install_and_activate_esim.carousel" list with the "status_tag" field that contains the "Ausstehende Installation" text
     Then the "Install Esim Info" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "eSIM-Installation" text is displayed
      And the "sutitle" textfield with "Bevor deine eSIM installiert werden kann, ist eine Verifizierung nötig." text is displayed
      And the "message1_title" textfield with "Sicherheitscode per SMS" text is displayed
      And the "message1_description" textfield with "Um sicherzustellen, dass die eSIM auf einem deiner Geräte installiert wird, wird dir ein Sicherheitscode per SMS zugesendet." text is displayed
      And the "message2_title" textfield with "SMS Empfang nich möglich?" text is displayed
      And the "message2_description" textfield with "Du Kannst den eSIM-QR-Code alternativ auch auf anderen Wegen anfordern." text is displayed
      And the "validate_with_sms_button" button with "Mit SMS verifizieren" text is displayed
      And the "validate_without_sms_button" button with "Ohne SMS verifizieren" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-477114 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477109
  @jira.link.depends_on.QANOV-477110 @manual @mobile @regression
  Scenario: A postpay user can access to the "Activate eSIM" screen from the "eSIM installation and activation" module in account dashboard
    eSIM is only available for postpay user.
    Given user has a "postpay" account type
      And user has a SIM in "ready_activation" status
      And user has the matching subscription selected in the account
      And user has the "eSIM installation and activation" module configured in CMS for "Account" page
      And user has the "Activate Esim Info" module configured in CMS for "Activate Esim Info" page
      And user is in the "Account" page
     When clicks on any element in the "install_and_activate_esim.carousel" list with the "status_tag" field that contains the "Bereit zum Aktivieren" text
     Then the "Activate Sim Info" page is displayed
      And the "SIM-Karte" header is displayed
      And the "title" textfield with "SIM-Karte aktivieren" text is displayed
      And the "description" textfield with "Follow these easy steps for a successfull SIM activation" text is displayed
      And the "step1_icon" icon is displayed
      And the "step1_textfield" textfield with "Mit den WLAN verbinden" text is displayed
      And the "step2_icon" icon is displayed
      And the "step2_textfield" textfield with "Mit der eSIM-Aktivierung beginnen" text is displayed
      And the "start_sim_activation_button" button with "SIM-Karten Aktivierung starten" text is displayed
      And the "report_a_problem_button" button with "Problem melden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

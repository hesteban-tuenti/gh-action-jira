# -*- coding: utf-8 -*-
@jira.QANOV-195492
Feature: SIM Management


  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @o2de
  Scenario Outline: A <account_type> user with several SIMs can access to the "SIM Management" screen for a mobile line product
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Possible status of a pSIM: in preparation, shipped (ready to activate), activating, active, suspended, deactivated, unknown
    (SIMs with unknown status won't be displayed in the app).
    Possible status of a eSIM: in preparation, ready for intallation, ready for activation, activating, active, suspended, deactivated, unknown
    (SIMs with unknown status won't be displayed in the app).
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product in "active" status
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
          | account_type | test_priority | ber | depends_on  | jira_id      |
          | prepay       | regression    |     | QANOV-47800 | QANOV-195493 |
          | postpay      | smoke         | ber | QANOV-44456 | QANOV-206013 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-206013
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with a tariff/pack eligible for 5G and with a SIM that <support_5g> it will see the 5GSA status in the "SIM Management" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that <support_5g> 5g
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "SIMs list" modules configured in CMS for "Sim Management" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "highlighted_services.sim_management_entrypoint" entrypoint
      And the "Sim Management" page is displayed
     Then the "sims_list" list is displayed
      And the sim that <support_5g> 5g in the "sims_list" list has the "5g_status" textfield with "<5g_status>" text

    Examples:
          | support_5g       | 5g_status           | jira_id      |
          | does not support | 5G SA - Not capable | QANOV-574864 |
          | supports         | 5G SA - Capable     | QANOV-574865 |

  @jira.QANOV-195500 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195493 @jira.link.depends_on.QANOV-206013
  @manual @mobile @o2de @smoke
  Scenario: A user with several SIMs can access to the "SIM Details" screen for a mobile line product
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Given user has a "mobile_line" product in "active" status
      And user has "several" SIMs for the same mobile line
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

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: A <account_type> user with only 1 SIM can access to the "SIM Details" screen for a mobile line product
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product in "active" status
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
          | account_type | depends_on  | jira_id      |
          | prepay       | QANOV-47800 | QANOV-195502 |
          | postpay      | QANOV-44456 | QANOV-206015 |

  @jira.QANOV-195495 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @jira.link.detects.O2DE-1403 @jira.link.detects.O2DE-3094 @manual @mobile @o2de @smoke
  Scenario: A monosim postpay user can see the details of an active SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Aktiv" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
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

  @jira.QANOV-427813 @android @ber @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-195500
  @jira.link.depends_on.QANOV-195502 @manual @mobile @o2de @smoke
  Scenario: A monosim prepay user can see the details of an active SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "prepay" account type
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Aktiv" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
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

  @jira.QANOV-206017 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500
  @jira.link.depends_on.QANOV-206015 @jira.link.detects.O2DE-1403 @jira.link.detects.O2DE-3094 @manual @mobile @o2de
  @sanity
  Scenario: A multisim postpay user can see the details of an active SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "activated" status
      And user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Aktiv" text is displayed
      And the "sim_header.sim_name" textfield is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.title" textfield with "SIM-KARTEN EINSTELLUNGEN" text is displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint with "Ersatz SIM-Karte" text is displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint with "SIM-Karte sperren" text is displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint with "SIM-Name ändern" text is displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint with "Zusatz SIM-Karte bestellen" text is displayed
      And the "sim_settings.unblock_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

  @jira.QANOV-195496 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500
  @jira.link.depends_on.QANOV-195502 @jira.link.depends_on.QANOV-206015 @jira.link.detects.O2DE-1403
  @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario: A monosim user can see the details of a blocked SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Gesperrt" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
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

  @jira.QANOV-206020 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500
  @jira.link.depends_on.QANOV-206015 @jira.link.detects.O2DE-1403 @jira.link.detects.O2DE-3094 @manual @mobile @o2de
  @regression
  Scenario: A multisim user can see the details of a blocked SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "activated" status
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Gesperrt" text is displayed
      And the "sim_header.sim_name" textfield is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
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

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.detects.O2DE-1403
  @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario Outline: A monosim user can see the details of a <sim_status> SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "<sim_status>" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "<sim_status_text>" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
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
          | in_preparation | Profil in Erstellung | QANOV-195497 |
          | activating     | In Aktivierung       | QANOV-195498 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.detects.O2DE-1403
  @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario Outline: A multisim user can see the details of a <sim_status> SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM/eSIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM/eSIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "activated" status
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "<sim_status>" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "<sim_status_text>" text is displayed
      And the "sim_header.sim_name" textfield is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
      And the "sim_details" module is displayed
      And the "sim_details.title" textfield with "DETAILS" text is displayed
      And the "sim_details.sim_format_label" textfield with "SIM-Karten-Typ" text is displayed
      And the "sim_details.sim_format_value" textfield with the "(SIM-Karte|eSIM)" format is displayed
      And the "sim_settings" module is displayed
      And the "sim_settings.title" textfield with "SIM-KARTEN EINSTELLUNGEN" text is displayed
      And the "sim_settings.sim_name_change_entrypoint" entrypoint with "SIM-Name ändern" text is displayed
      And the "sim_settings.order_additional_sim_entrypoint" entrypoint with "Zusatz SIM-Karte bestellen" text is displayed
      And the "sim_settings.delete_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.swap_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.unblock_sim_entrypoint" entrypoint is not displayed
      And the "sim_settings.block_sim_entrypoint" entrypoint is not displayed
      And the "sim_services" module is displayed
      And the "sim_services.title" textfield with "SIM SERVICES" text is displayed
      And the "sim_services.view_pin_puk_entrypoint" entrypoint with "PIN & PUK einsehen" text is displayed

    Examples:
          | sim_status     | sim_status_text      | jira_id      |
          | in_preparation | Profil in Erstellung | QANOV-206018 |
          | activating     | In Aktivierung       | QANOV-206019 |

  @jira.QANOV-347735 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario: A monosim user can see the details of a deactivated SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "deactivated" status
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Deaktiviert" text is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
      And the "sim_deactivated" module is displayed
      And the "sim_deactivated.info_icon" icon is displayed
      And the "sim_deactivated.title" textfield with "Deine SIM-Karte ist deaktiviert" text is displayed
      And the "sim_deactivated.description" textfield with "Die SIM-Karte ist deaktiviert und kann nicht wiederverwendet werden." text is displayed
      And the "sim_details" module is not displayed
      And the "sim_settings" module is not displayed
      And the "sim_services" module is not displayed

  @jira.QANOV-347736 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario: A multisim user can see the details of a deactivated SIM for a mobile line product
    - The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, all users are monosim in Blau, but this can change in the future.
    Monosim users can only have 1 active SIM, but can have more SIMs in other status.
    - Header fields: card type (data card, multicard), [MultiSIM only] SIM name, SIM number, Status (in preparation,
    shipped, activating, active, suspended).
    - Details fields: SIM type (plastic), Activation date (only postpay), [MultiCard only] Call status (does the SIM
    receive calls), [MultiCard only] SMS status (does the SIM receive SMS), [MeinO2 only] O2 Free/throttling status.
    - SIM settings:
    1) Active SIM (Swap SIM/eSIM, [Postpay only] Block SIM temporarily, [MultiSIM only] SIM name change, [MultiSIM only,
    more than one SIM active] Delete SIM / eSIM, [MultiSIM only] Order an additional SIM).
    2) Blocked SIM (Unblock SIM, Swap SIM).
    3) in preparation/shipped/Activating SIM ([MultiSIM only] SIM name change, [MultiSIM only] Order an additional SIM).
    Given user has "multisim" service in "activated" status
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header" module is displayed
      And the "sim_header.sim_status" textfield with "Deaktiviert" text is displayed
      And the "sim_header.sim_name" textfield is displayed
      And the "sim_header.sim_number" textfield with the "\d+" format is displayed
      And the "sim_header.card_type" textfield with the "(Datacard|Multicard)( 5G SA)?" format is displayed
      And the "sim_deactivated" module is displayed
      And the "sim_deactivated.info_icon" icon is displayed
      And the "sim_deactivated.title" textfield with "Deine SIM-Karte ist deaktiviert" text is displayed
      And the "sim_deactivated.description" textfield with "Die SIM-Karte ist deaktiviert und kann nicht wiederverwendet werden." text is displayed
      And the "sim_details" module is not displayed
      And the "sim_settings" module is not displayed
      And the "sim_services" module is not displayed

  @jira.QANOV-195499 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195493 @jira.link.depends_on.QANOV-206013
  @manual @mobile @o2de @sanity
  Scenario: A user with several SIMs can access to the "Activate pSIM" screen of a "shipped" SIM (ready to activate pSIM) for a mobile line product
    Given user has a "mobile_line" product in "active" status
      And user has "several" SIMs for the same mobile line
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
      And the "step1_textfield" textfield with "Mit den WLAN verbinden" text is displayed
      And the "step2_icon" icon is displayed
      And the "step2_textfield" textfield with "SIM-Karte ins Gerät einlegen" text is displayed
      And the "step3_icon" icon is displayed
      And the "step3_textfield" textfield with "Mit der SIM-Aktivierung beginnen" text is displayed
      And the "start_sim_activation_button" button with "SIM-Karten Aktivierung starten" text is displayed
      And the "report_a_problem_button" button with "Problem melden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.QANOV-195510 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195493 @jira.link.depends_on.QANOV-206013
  @jira.link.detects.LOC-1209 @jira.link.detects.O2DE-2979 @manual @mobile @o2de @sanity
  Scenario: A postpay user with several SIMs can access to the "Install eSIM" screen of a "ready for installation" eSIM for a mobile line product
    eSIM is only available for postpay user.
    To know if the eSIM is in pending installation status or pending activation status, we also need to check the API
    field 'smdp status'.
    This status 'ready for installation' is valid for both:
    - Esim is neither installed nor activated
    - Esim is already activated but NOT installed
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
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

  @jira.QANOV-452268 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-206013 @jira.link.detects.LOC-1209
  @jira.link.detects.O2DE-2979 @manual @mobile @o2de @smoke
  Scenario: A postpay user with several SIMs can access to the "Activate eSIM" screen for a "ready for activation" eSIM
    eSIM is only available for postpay user.
    To know if the eSIM is in pending installation status or pending activation status, we also need to check the API
    field 'smdp status'.
    This status 'ready for activation' is valid for a eSim that has been installed on the device BUT not activated.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
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

  @jira.QANOV-319015 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @manual @mobile @o2de @smoke
  Scenario: A postpay user can see the activation date for an active SIM in the "SIM Details" screen for a mobile line product
    The activation date is not available for prepay users.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.activation_date_label" textfield with "Aktivierung am:" text is displayed
      And the "sim_details.activation_date_value" textfield with the "\d+. (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format is displayed

  @jira.QANOV-319016 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @manual @mobile @o2de @regression
  Scenario: A postpay user can see the activation date for a suspended/in preparation/activating SIM in the "SIM Details" screen for a mobile line product
    The activation date is not available for prepay users.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in any of "in_preparation;activating;suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.activation_date_label" textfield with "Aktivierung am:" text is displayed
      And the "sim_details.activation_date_value" textfield with "-" text is displayed

  @jira.QANOV-375527 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-195502
  @jira.link.depends_on.QANOV-206015 @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario: A user who has consumed o2free bytes in the current billing cycle will see the o2free field in the "SIM Details" screen for a mobile line product
    Given user has a "mobile_line" product in "active" status
    Given user has a "multicard" SIM in any of "in_preparation;activating;active;suspended" status
      And user has consumed o2free bytes in the current billing cycle
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.o2free_throttling_status_label" textfield with the "O2 (Free/Throttling) status" format is displayed
      And the "sim_details.o2free_throttling_status_value" textfield with "Aktiv" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-195502
  @jira.link.depends_on.QANOV-206015 @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario Outline: A user who has a Multicard card with <service> enabled will see the <field_name> field in the "SIM Details" screen for a mobile line product
    Users with MultiCard will see the Call status (does the SIM receive calls) and SMS status (does the SIM receive SMS)
    fields in the Details module if incoming Calls and SMS are enabled.
    Given user has a "mobile_line" product in "active" status
      And user has a "multicard" SIM in any of "in_preparation;activating;active;suspended" status
      And the multicard sim has the "<service>" service enabled
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.<field_name>_label" textfield with "<field_text>" text is displayed
      And the "sim_details.<field_name>_value" textfield with "Aktiv" text is displayed

    Examples:
          | service        | field_name  | field_text            | jira_id      |
          | incoming calls | call_status | Karte empfängt Anrufe | QANOV-195503 |
          | incoming sms   | sms_status  | Karte empfängt SMS    | QANOV-375528 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-195502
  @jira.link.depends_on.QANOV-206015 @jira.link.detects.O2DE-3094 @manual @mobile @o2de @regression
  Scenario Outline: A user who has a Multicard card with <service> disabled won't see the <field_name> field in the "SIM Details" screen for a mobile line product
    Users with MultiCard will see the Call status (does the SIM receive calls) and SMS status (does the SIM receive SMS)
    fields in the Details module if incoming Calls and SMS are enabled.
    Given user has a "mobile_line" product in "active" status
      And user has a "multicard" SIM in any of "in_preparation;activating;active;suspended" status
      And the multicard sim has the "<service>" service disabled
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.<field_name>_label" textfield is not displayed
      And the "sim_details.<field_name>_value" textfield is not displayed

    Examples:
          | service        | field_name  | jira_id      |
          | incoming calls | call_status | QANOV-375529 |
          | incoming sms   | sms_status  | QANOV-375530 |

  @jira.QANOV-195505 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-195502
  @jira.link.depends_on.QANOV-206015 @manual @mobile @o2de @regression
  Scenario: A user who has a DataCard card won't see the calls/sms fields in the "SIM Details" screen for a mobile line product
    Users with MultiCard will see the Call status (does the SIM receive calls) and SMS status (does the SIM receive SMS)
    fields in the Details module.
    Given user has a "mobile_line" product in "active" status
      And user has a "datacard" SIM in any of "in_preparation;activating;active;suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_details.call_status" textfield is not displayed
      And the "sim_details.sms_status" textfield is not displayed

  @jira.QANOV-206022 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @manual @mobile @o2de @regression
  Scenario: A multisim user with several active SIMs can see the "Delete SIM / eSIM" setting in the "SIM Details" screen for a mobile line product
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Given user has "multisim" service in "activated" status
      And user has a "mobile_line" product in "active" status
      And user has "several" SIMs in "active" status for the same mobile line
      And user has the matching subscription selected in the account
      And user has the "Sim details header" module configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_settings.delete_sim_entrypoint" entrypoint with "SIM-Karte löschen" text is displayed

  @jira.QANOV-206023 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @manual @mobile @o2de @regression
  Scenario: A multisim user with only one active SIM cannot see the "Delete SIM / eSIM" setting in the "SIM Details" screen for a mobile line product
    The info about if a user is multisim (several active SIMs) or monosim (only one active SIM) is returned by API.
    Right now, only some postpay users are multisim, but this can change in the future.
    Given user has "multisim" service in "activated" status
      And user has a "mobile_line" product in "active" status
      And user has "1" SIMs in "active" status for the same mobile line
      And user has the matching subscription selected in the account
      And user has the "Sim details header" module configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_settings.delete_sim_entrypoint" entrypoint is not displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-195500 @jira.link.depends_on.QANOV-206015
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user with a tariff/pack eligible for 5G and with a SIM that <support_5g> it will see the 5GSA status in the "SIM Details" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that <support_5g> 5g
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user has the matching subscription selected in the account
      And user is in the "Sim Details" page for the matching SIM
     Then the "sim_header.card_type" textfield with the "<card_type>" format is displayed
      And the "sim_details.5g_capability_label" textfield with "5G SA Capable" text is displayed
      And the "sim_details.5g_capability_value" textfield with the "<5g_capability>" format is displayed

    Examples:
          | support_5g       | card_type                   | 5g_capability | jira_id      |
          | does not support | (Datacard\|Multicard)       | No            | QANOV-574866 |
          | supports         | (Datacard\|Multicard) 5G SA | Yes           | QANOV-574867 |

  @jira.QANOV-195508 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195500
  @jira.link.depends_on.QANOV-195502 @jira.link.depends_on.QANOV-206015 @manual @mobile @o2de @regression
  Scenario: A user can access to the "View PIN & PUK" service for a mobile line product
    NOTE: the pin-puk API is responding with a "UNDEFINED" for some users.
    Given user has a "mobile_line" product in "active" status
      And user has a SIM in any of "in_preparation;activating;active;suspended" status
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

  @jira.QANOV-195711 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195495 @jira.link.depends_on.QANOV-206017
  @manual @mobile @o2de @regression
  Scenario: A postpay user can block an active sim for a mobile line product
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.block_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-195713 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-195496 @jira.link.depends_on.QANOV-206020
  @manual @mobile @o2de @regression
  Scenario: A user can unblock a blocked sim for a mobile line product
    Given user has a "mobile_line" product in "active" status
      And user has a SIM in "suspended" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Sim Details" page for the matching SIM
     When clicks on the "sim_settings.unblock_sim_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Sim Details" page is displayed

  @jira.QANOV-214429 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38258 @manual @mobile @o2de @regression
  Scenario: A postpay user can access to the "Install eSIM" screen from the "eSIM installation" module in account dashboard for a mobile line product
    eSIM is only available for postpay user.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
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

  @jira.QANOV-452269 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-375526 @jira.link.depends_on.QANOV-452264
  @manual @mobile @o2de @regression
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

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-48496
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @<test_priority>
  Scenario Outline: A user can access to an OB webview to see the SIM details for a <internet_at_home_product> product
    prod-b2c-o2-fms-sim-management
    This OB webview will also allow the user to swap, activate, block temporarily and unblock the SIM. The user will
    be able to check te SIM PIN & PUK too.
    Given user has a "<internet_at_home_product>" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Sim details header;Sim details" modules configured in CMS for "Sim Details" page
      And user is in the "Account" page
     When clicks on the "highlighted_services.sim_management_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Mein o2" header is displayed
      And the "SIM-Karten und Anrufeinstellungen" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | internet_at_home_product | ber | test_priority | jira_id      |
          | home_spot                | ber | sanity        | QANOV-499005 |
          | data_spot                |     | smoke         | QANOV-499007 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-48496 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario Outline: A user cannot see the "SIM Management" entrypoint for a <internet_at_home_product> product in cancelled status
    prod-b2c-o2-fms-sim-management
    This OB webview will also allow the user to swap, activate, block temporarily and unblock the SIM. The user will
    be able to check te SIM PIN & PUK too.
    Given user has a "<internet_at_home_product>" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "highlighted_services.sim_management_entrypoint" entrypoint is not displayed

    Examples:
          | internet_at_home_product | jira_id      |
          | home_spot                | QANOV-499008 |
          | data_spot                | QANOV-499009 |

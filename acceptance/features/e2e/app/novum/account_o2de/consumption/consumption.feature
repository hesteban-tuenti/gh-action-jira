# -*- coding: utf-8 -*-
@jira.QANOV-171492
Feature: Consumption

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has the "counters-carousel" module configured in CMS for "dashboard" page


  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A <account_type> user without allowances roundels can access to the consumption screen
    Some prepay users (those with a 9 Ct. tariff) and postpay users (those with "Pay as you go" tariff and without packs
    purchased) don't have roundels in the account dashboard. For these users we have a smart action button in order to
    access the consumptions details.
    Given user has a "<account_type>" account type
      And user has no allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "data_usage_button" button
     Then the "Mobile Line Consumption" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type | depends_on   | jira_id      |
          | postpay      | QANOV-342296 | QANOV-342333 |
          | prepay       | QANOV-183140 | QANOV-342334 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255
  @jira.link.detects.O2DE-3164 @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @mobile
  @o2de
  Scenario Outline: Postpay user without "fair use policy" (FUP) and a tariff that allows to consume international data can access to the "<tab>" tab in the data consumption screen
    Postpay user can have different plans:
    - Plan with national and international data: Consumption screen will show 2 tabs (for national and international)
    - Plan with only national data (but allows to buy international data): Consumption screen will show 2 tabs (for national and international)
    - Plan with only national data (but doesn't allow to buy international data): Consumption screen won't show any tab (only national data will be displayed)
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has "<allowance>" allowances in the "mobile_line" product
      And user has not a "Day Pack" bundle
      And the mobile plan allows to consume international data
      And user has the matching subscription selected in the account
      And user has the "billing-cycle-header,tabs" module configured in CMS for "usage" page
      And user is in the "Account" page
     When clicks on the "<allowance>_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "Datenverbrauch" header is displayed
      And the "consumption_header.pretitle" textfield with the "Dein Rechnungsmonat endet in \d+ (Tag|Tagen|Stund|Stunden)" format is displayed
      And the "consumption_header.title" textfield with the "Rechnungszeitraum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \– (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.)" format is displayed
      And the "inland_and_eu" tab with "Inland & EU" text is displayed
      And the "outside_eu" tab with "Außerhalb EU" text is displayed
      And the "<tab>" tab is selected
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

    @automatic @live @next @qa @webapp
    Examples:
          | tariff_type | tab           | allowance          | test_priority | ber | depends_on  | jira_id     |
          | limited     | inland_and_eu | data               | smoke         | ber | QANOV-44440 | QANOV-44491 |
          | limited     | outside_eu    | international_data | smoke         |     | QANOV-44440 | QANOV-44493 |

    @manual
    Examples:
          | tariff_type | tab           | allowance          | test_priority | ber | depends_on  | jira_id      |
          | unlimited   | inland_and_eu | data               | regression    |     | QANOV-49037 | QANOV-424670 |
          | unlimited   | outside_eu    | international_data | regression    |     | QANOV-49037 | QANOV-424671 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-38255
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de
  Scenario Outline: Postpay user with fair use policy (FUP) and a tariff that allows to consume international data can access to the "<tab>" tab in the data consumption screen
    Postpay user can have different plans:
    - Plan with national and international data: Consumption screen will show 2 tabs (for national and international)
    - Plan with only national data (but allows to buy international data): Consumption screen will show 2 tabs (for national and international)
    - Plan with only national data (but doesn't allow to buy international data): Consumption screen won't show any tab (only national data will be displayed)
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And user has "<allowance>" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And the mobile plan allows to consume international data
      And user has the matching subscription selected in the account
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "<allowance>_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "Datenverbrauch" header is displayed
      And the "consumption_header.billing_cycle_end_time" textfield with the "Dein Rechnungsmonat endet in \d+ (Tag|Tagen|Stund|Stunden)" format is displayed
      And the "consumption_header.billing_period" textfield with the "Rechnungszeitraum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \– (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.)" format is displayed
      And the "inland" tab with "Inland" text is displayed
      And the "eu" tab with "EU" text is displayed
      And the "outside_eu" tab with "Außerhalb EU" text is displayed
      And the "<tab>" tab is selected
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | cv    | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | tab        | allowance          | test_priority | depends_on   | jira_id      |
          | 14.11 | unlimited   | with            | has not                  | inland     | inland_data        | smoke         | QANOV-424631 | QANOV-424672 |
          | 14.11 | unlimited   | with            | has not                  | eu         | eu_data            | smoke         | QANOV-424631 | QANOV-424673 |
          | 14.11 | unlimited   | with            | has not                  | outside_eu | international_data | regression    | QANOV-424631 | QANOV-424674 |
          | 14.11 | limited     | without         | has                      | inland     | inland_data        | smoke         | QANOV-424632 | QANOV-424675 |
          | 24.1  | limited     | without         | has                      | inland     | 24h_unlimited_pack | regression    | QANOV-424632 | QANOV-580438 |
          | 14.11 | limited     | without         | has                      | eu         | eu_data            | smoke         | QANOV-424632 | QANOV-424676 |
          | 14.11 | limited     | without         | has                      | outside_eu | international_data | regression    | QANOV-424632 | QANOV-424677 |

  @jira.QANOV-202539 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @manual @mobile @o2de @regression
  Scenario: Postpay user with a tariff that doesn't allow to consume international data can access to the consumption screen
    Postpay user can have only a national data plan which doesn't allow the usage of international data (this plan hasn't any
    international data associated, and the user cannot buy international bundles or use international data as extra charges).
    These users won't see the tabs in Consumption screen, as they only have "inland & EU" data.
    Note that there is no usage information about the packs.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the mobile plan does not allow to consume international data
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "Datenverbrauch" header is displayed
      And the "consumption_header.pretitle" textfield with the "Dein Rechnungsmonat endet in \d+ (Tag|Tagen|Stund|Stunden)" format is displayed
      And the "consumption_header.title" textfield with the "Rechnungszeitraum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \– (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.)" format is displayed
      And the "inland_and_eu" tab is not displayed
      And the "outside_eu" tab is not displayed
      And the "data_consumption_module.module_title" textfield with "Datenverbrauch" text is displayed
      And the "data_consumption_module.estimated_consumption" textfield with the "Voraussichtlicher Verbrauch \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_consumption_module.progress_bar" progress bar is displayed
      And the "data_consumption_module.total_used_label" textfield with "Insgesamt verbraucht" text is displayed
      And the "data_consumption_module.total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.module_title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.bundle_list" list is displayed
      And each element in the "data_bundles.bundle_list" list has the "icon" field
      And each element in the "data_bundles.bundle_list" list has the "title" field
      And each element in the "data_bundles.bundle_list" list has the "subtitle" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.bundle_list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-386653
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can switch among tabs in the data consumption screen
    Postpay users without FUP (has a tariff without FUP and do not have an active "24h unlimited bundle" pack), will
    display 2 tabs in the Consumption screen: inland & EU, outside EU.
    Postpay users with FUP (has a tariff with FUP or have an active "24h unlimited bundle" pack), will display 3 tabs in the
    Consumption screen: inland, EU, outside EU.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And the mobile plan allows to consume international data
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<initial_tab>" tab
      And clicks on the "<final_tab>" tab
     Then the "<final_tab>" tab is selected

    Examples:
          | cv    | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | initial_tab   | final_tab     | depends_on                | jira_id      |
          | 14.2  | limited     | without         | has not                  | inland_and_eu | outside_eu    | QANOV-44491:QANOV-342333  | QANOV-44497  |
          | 14.2  | limited     | without         | has not                  | outside_eu    | inland_and_eu | QANOV-44493:QANOV-342333  | QANOV-44499  |
          | 14.2  | unlimited   | without         | has not                  | inland_and_eu | outside_eu    | QANOV-424670:QANOV-342333 | QANOV-424678 |
          | 14.2  | unlimited   | without         | has not                  | outside_eu    | inland_and_eu | QANOV-424671:QANOV-342333 | QANOV-424679 |
          | 14.11 | unlimited   | with            | has not                  | inland        | eu            | QANOV-424672:QANOV-342333 | QANOV-424680 |
          | 14.11 | unlimited   | with            | has not                  | eu            | outside_eu    | QANOV-424673:QANOV-342333 | QANOV-424681 |
          | 14.11 | unlimited   | with            | has not                  | outside_eu    | inland        | QANOV-424674:QANOV-342333 | QANOV-424682 |
          | 14.11 | limited     | without         | has                      | inland        | eu            | QANOV-424675:QANOV-342333 | QANOV-424683 |
          | 14.11 | limited     | without         | has                      | eu            | outside_eu    | QANOV-424676:QANOV-342333 | QANOV-424684 |
          | 14.11 | limited     | without         | has                      | outside_eu    | inland        | QANOV-424677:QANOV-342333 | QANOV-424685 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @mobile @o2de
  Scenario Outline: Postpay user without "fair use policy" (FUP) and a tariff that allows to consume international data can see the "inland & EU" data consumption details when allowances are available
    Types of bundle: National, National + EU.
    Types of status: active (Available), activation (not available), deactivation (available till “X” Deactivation date).
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the mobile plan allows to consume international data
      And the "data" allowance is <tariff_type> in the "mobile_line" product
      And user has not a "Day Pack" bundle
      And user has the "billing-cycle-header,tabs" module configured in CMS for "usage" page
      And user has the matching subscription selected in the account
      And user has the "subscription-bundles" module configured in CMS for "data-home" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "inland_and_eu" tab
      And waits until the "data_consumption_module" element is visible
     Then the "data_consumption_module.module_title" textfield with "Datenverbrauch" text is displayed
      And the "data_consumption_module.estimated_consumption" textfield with the "Voraussichtlicher Verbrauch: \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_consumption_module.progress_bar" progress bar is displayed
      And the "data_consumption_module.total_used_label" textfield with "Insgesamt verbraucht" text is displayed
      And the "data_consumption_module.total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_consumption_module.sim_list" list is displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.module_title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "title" field
      And each element in the "data_bundles.list" list has the "subtitle" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format

    @automatic @live @next @qa @webapp
    Examples:
          | tariff_type | ber | test_priority | depends_on  | jira_id     |
          | limited     | ber | sanity        | QANOV-44491 | QANOV-44500 |

    @manual
    Examples:
          | tariff_type | ber | test_priority | depends_on   | jira_id      |
          | unlimited   |     | regression    | QANOV-424670 | QANOV-424686 |

  @jira.QANOV-507403 @android @ios @jira.cv.14.11 @manual @mobile @o2de @regression
  Scenario: Postpay user without "fair use policy" (FUP) and a tariff that allows to consume international data can see the "inland & EU" data consumption details when allowances are not available
    Some postpay users (those with "Pay as you go" tariff and without packs purchased) don't have roundels in the account dashboard.
    These users will display an empty-case in the "Inland & EU" tab if no bundles have been purchased.
    Given user has a "postpay" account type
      And user has no allowances in the "mobile_line" product
      And the mobile plan allows to consume international data
      And user has a tariff without fair use policy
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "inland_and_eu" tab
     Then the "no_data_consumed" module is displayed
      And the "no_data_consumed.magnifying_glass_icon" icon is displayed
      And the "no_data_consumed.title" textfield with "Du hast im aktuellen Zeitraum keine Daten in dieser Zone verwendet." text is displayed
      And the "no_data_consumed.description" textfield with "Sobald du mit der Verwendung von Daten in dieser Zone beginnst, siehst du hier eine Verbrauchsübersicht." text is displayed
      And the "data_consumption_module" module is not displayed
      And the "data_bundles" module is not displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de
  Scenario Outline: Postpay user with "fair use policy" (FUP) and data consumed can see the "inland" data consumption details
    Types of bundle: National, National + EU.
    Types of status: active (Available), activation (not available), deactivation (available till “X” Deactivation date).
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "inland" tab
     Then the "title" textfield with "Unbegrenzter Tarif" text is displayed
      And the "description" textfield with the "\d+ (Tag|Tage) bis zur nächsten Rechnung" format is displayed
      And the "data_consumption_module" module is not displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.module_title" textfield is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "title" field
      And each element in the "data_bundles.list" list has the "subtitle" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Informationen zur Fair Usage Policy" text is displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | ber | test priority | depends_on   | jira_id      |
          | unlimited   | with            | has not                  | ber | smoke         | QANOV-424672 | QANOV-424687 |
          | limited     | without         | has                      |     | regression    | QANOV-424675 | QANOV-424688 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-421952
  @manual @mobile @o2de @regression
  Scenario Outline: Postpay user with "fair use policy" (FUP) and without data consumed can see the "inland" data consumption details
    Types of bundle: National, National + EU.
    Types of status: active (Available), activation (not available), deactivation (available till “X” Deactivation date).
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has consumed "0%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "inland" tab
     Then the "no_data_consumed" module is displayed
      And the "no_data_consumed.magnifying_glass_icon" icon is displayed
      And the "no_data_consumed.title" textfield with "Du hast im aktuellen Zeitraum keine Daten in dieser Zone verwendet." text is displayed
      And the "no_data_consumed.description" textfield with "Sobald du mit der Verwendung von Daten in dieser Zone beginnst, siehst du hier eine Verbrauchsübersicht." text is displayed
      And the "data_consumption_module" module is not displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.module_title" textfield is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "title" field
      And each element in the "data_bundles.list" list has the "subtitle" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Informationen zur Fair Usage Policy" text is displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | depends_on   | jira_id      |
          | unlimited   | with            | has not                  | QANOV-424672 | QANOV-424689 |
          | limited     | without         | has                      | QANOV-424675 | QANOV-424690 |

  @jira.QANOV-202541 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-202539 @jira.link.depends_on.QANOV-44500
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @smoke
  Scenario: Postpay UDP user without "fair use policy" (FUP) and with several active sims and with detail by sim can see the data consumption by SIM
    Different colors will be displayed in the progress bar, representing the consumption of each SIM. If the user only
    have one SIM, only a color will be displayed in the progress bar. If the user haven't used any data from the allowance,
    no color will be displayed in the progress bar (the bar will be gray).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has a UDP tariff
      And user has "data" allowances in the "mobile_line" product
      And user has "several" active sims for the same mobile line
      And user has detail by sim
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield with "VERBRAUCH PRO SIM" text is displayed
      And the "consumption_by_sim.list" list is displayed
      And each element in the "consumption_by_sim.list" list has the "phone_icon" field
      And each element in the "consumption_by_sim.list" list has the "name" field
      And each element in the "consumption_by_sim.list" list has the "phone_number" field
      And each element in the "consumption_by_sim.list" list has the "consumption" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format
      And each element in the "consumption_by_sim.list" list has the "color_icon" field
      And the sum of the consumption in each sim will correspond with the total data used
      And the phone number displayed will be the same for each sim

  @jira.QANOV-437449 @android @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-202539 @jira.link.depends_on.QANOV-44500
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: Postpay UDP user without "fair use policy" (FUP) and with several active sims and without detail by sim cannot see the data consumption by SIM
    Different colors will be displayed in the progress bar, representing the consumption of each SIM. If the user only
    have one SIM, only a color will be displayed in the progress bar. If the user haven't used any data from the allowance,
    no color will be displayed in the progress bar (the bar will be gray).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has a UDP tariff
      And user has "data" allowances in the "mobile_line" product
      And user has "several" active sims for the same mobile line
      And user has not detail by sim
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield is not displayed
      And the "consumption_by_sim.list" list is displayed
      And each element in the "consumption_by_sim.list" list has the "phone_icon" field
      And each element in the "consumption_by_sim.list" list has the "name" field
      And each element in the "consumption_by_sim.list" list has the "phone_number" field
      And the phone number displayed will be the same for each sim

  @jira.QANOV-387916 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-202539 @jira.link.depends_on.QANOV-44500
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @smoke
  Scenario: Postpay non-UDP user without "fair use policy" (FUP) and with several active sims cannot see the data consumption by SIM
    Users with a non-UDP tariff will not be able to see the data usage by sim (they will only see the total consumtion).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has a non-UDP tariff
      And user has "data" allowances in the "mobile_line" product
      And user has "several" active sims for the same mobile line
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield is not displayed
      And the "consumption_by_sim.list" list is displayed
      And each element in the "consumption_by_sim.list" list has the "phone_icon" field
      And each element in the "consumption_by_sim.list" list has the "name" field
      And each element in the "consumption_by_sim.list" list has the "phone_number" field
      And the phone number displayed will be the same for each sim

  @jira.QANOV-202542 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-202539 @jira.link.depends_on.QANOV-44500
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @smoke
  Scenario: Postpay UDP user without "fair use policy" (FUP) and with only an active sim and detail by sim can see the data consumption by SIM
    The consumption will be displayed in the progress bar with the color described in the "consumption_by_sim.color_icon" icon.
    If the user haven't used any data from the allowance, no color will be displayed in the progress bar (the bar will be gray).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has a UDP tariff
      And user has "1" active sims for the same mobile line
      And user has detail by sim
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield with "VERBRAUCH PRO SIM" text is displayed
      And the "consumption_by_sim.phone_icon" icon is displayed
      And the "consumption_by_sim.name" textfield is displayed
      And the "consumption_by_sim.phone_number" textfield is displayed
      And the "consumption_by_sim.consumption" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim.color_icon" icon is displayed
      And the sim consumption will correspond with the total data used

  @jira.QANOV-437453 @android @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-202539 @jira.link.depends_on.QANOV-44500
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: Postpay UDP user without "fair use policy" (FUP) and with only an active sim and without detail by sim can see the data consumption by SIM
    The consumption will be displayed in the progress bar with the color described in the "consumption_by_sim.color_icon" icon.
    If the user haven't used any data from the allowance, no color will be displayed in the progress bar (the bar will be gray).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has a UDP tariff
      And user has "1" active sims for the same mobile line
      And user has not detail by sim
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield is not displayed
      And the "consumption_by_sim.phone_icon" icon is displayed
      And the "consumption_by_sim.name" textfield is displayed
      And the "consumption_by_sim.phone_number" textfield is displayed
      And the "consumption_by_sim.consumption" textfield is not displayed
      And the "consumption_by_sim.color_icon" icon is not displayed

  @jira.QANOV-387917 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-202539 @jira.link.depends_on.QANOV-44500
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @smoke
  Scenario: Postpay non-UDP user without "fair use policy" (FUP) and with only an active sim can see the data consumption by SIM
    Users with a non-UDP tariff will not be able to see the data usage by sim (they will only see the total consumtion).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has a non-UDP tariff
      And user has "1" active sims for the same mobile line
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield is not displayed
      And the "consumption_by_sim.phone_icon" icon is displayed
      And the "consumption_by_sim.name" textfield is displayed
      And the "consumption_by_sim.phone_number" textfield is displayed
      And the "consumption_by_sim.consumption" textfield is not displayed
      And the "consumption_by_sim.color_icon" icon is not displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.dv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de
  Scenario Outline: Postpay user with "fair use policy" (FUP) can see the "EU" data consumption details
    Types of bundle: National, National + EU.
    Types of status: active (Available), activation (not available), deactivation (available till “X” Deactivation date).
    User will have at least a pack (the corresponding with his/her tariff), so no empty case screen can be found.
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "eu" tab
     Then the "extra_consumption" module is displayed
      And the "title" textfield with "Datenverbrauch" text is displayed
      And the "data_estimated_consumption" textfield with the "Voraussichtlicher Verbrauch \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield with "VERBRAUCH PRO SIM" text is displayed
      And the "consumption_by_sim.list" list is displayed
      And each element in the "consumption_by_sim.list" list has the "phone_icon" field
      And each element in the "consumption_by_sim.list" list has the "name" field
      And each element in the "consumption_by_sim.list" list has the "sim_number" field
      And the "data_bundles" module is displayed
      And the "data_bundles.title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "name" field
      And each element in the "data_bundles.list" list has the "type" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.list" list has the "status" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Informationen zur Fair Usage Policy" text is displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | ber | test_priority | depends_on   | jira_id      |
          | unlimited   | with            | has not                  | ber | smoke         | QANOV-424673 | QANOV-424702 |
          | limited     | without         | has                      |     | regression    | QANOV-424676 | QANOV-424703 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-421952 @jira.link.parent_test_plan.QANOV-620950 @manual @mobile @o2de
  Scenario Outline: Postpay user with "fair use policy" (FUP) can see the "EU" data consumption details
    Types of bundle: National, National + EU.
    Types of status: active (Available), activation (not available), deactivation (available till “X” Deactivation date).
    User will have at least a pack (the corresponding with his/her tariff), so no empty case screen can be found.
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "eu" tab
     Then the "extra_consumption" module is displayed
      And the "extra_amount" module is displayed
      And the "title" textfield with "Datenverbrauch" text is displayed
      And the "data_estimated_consumption" textfield with the "Voraussichtlicher Verbrauch \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_total_used_progress_bar" progress bar is displayed
      And the "data_total_used_label" textfield with "Insgesamt verbrauch" text is displayed
      And the "data_total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield with "VERBRAUCH PRO SIM" text is displayed
      And the "consumption_by_sim.list" list is displayed
      And each element in the "consumption_by_sim.list" list has the "phone_icon" field
      And each element in the "consumption_by_sim.list" list has the "name" field
      And each element in the "consumption_by_sim.list" list has the "sim_number" field
      And the "data_bundles" module is displayed
      And the "data_bundles.title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "name" field
      And each element in the "data_bundles.list" list has the "type" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.list" list has the "status" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Informationen zur Fair Usage Policy" text is displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | ber | test_priority | depends_on   | jira_id      |
          | unlimited   | with            | has not                  | ber | smoke         | QANOV-424673 | QANOV-621105 |
          | limited     | without         | has                      |     | regression    | QANOV-424676 | QANOV-621106 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual
  @mobile @o2de
  Scenario Outline: Postpay user without "fair use policy" (FUP) can see the "outside from the EU" data consumption details when no international packs are purchased
    Postpay user can have only a national data plan which allows the usage of international data (this plan hasn't any
    international data associated, but the user can buy international bundles or use international data as extra charges).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has not purchased international data bundles
      And the mobile plan allows to purchase international data bundles
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "extra_consumption" module is displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.icon" icon is displayed
      And the "data_bundles.subtitle" textfield with "Du hast aktuell keine Daten-Optionen gebucht." text is displayed
      And the "data_bundles.description" textfield with "Du hast in diesem Zeitraum keine internationalen Daten verwendet." text is displayed
      And the "data_bundles.list" list is not displayed
      And the "more_info" module is not displayed

    Examples:
          | tariff_type | test_priority | depends_on   | detects   | jira_id      |
          | limited     | smoke         | QANOV-44493  | O2DE-2956 | QANOV-44501  |
          | unlimited   | regression    | QANOV-424671 |           | QANOV-424704 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-386653
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user with "fair use policy" (FUP)  can see the "outside from the EU" data consumption details when no international packs are purchased
    Postpay user can have only a national data plan which allows the usage of international data (this plan hasn't any
    international data associated, but the user can buy international bundles or use international data as extra charges).
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And user has not purchased international data bundles
      And the mobile plan allows to purchase international data bundles
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "extra_consumption" module is displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.icon" icon is displayed
      And the "data_bundles.subtitle" textfield with "Du hast aktuell keine Daten-Optionen gebucht." text is displayed
      And the "data_bundles.description" textfield with "Du hast in diesem Zeitraum keine internationalen Daten verwendet." text is displayed
      And the "data_bundles.list" list is not displayed
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Informationen zur Fair Usage Policy" text is displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | depends_on   | jira_id      |
          | unlimited   | with            | has not                  | QANOV-424674 | QANOV-424706 |
          | limited     | without         | has                      | QANOV-424677 | QANOV-424707 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @mobile @o2de
  Scenario Outline: Postpay user without "fair use policy" (FUP) can see the "outside from the EU" data consumption details when international packs are purchased
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And user has the "Roaming" data bundle purchased
      And user has "international_data" allowances in the "mobile_line" product
      And the "data" allowance is <tariff_type> in the "mobile_line" product
      And user has not a "Day Pack" bundle
      And user has the "billing-cycle-header,tabs" module configured in CMS for "usage" page
      And user has the matching subscription selected in the account
      And user has the "subscription-bundles-with-empty-case" module configured in CMS for "data-roaming" page for the "mobile" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "extra_consumption" module is displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.module_title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "title" field
      And each element in the "data_bundles.list" list has the "subtitle" field that contains the "Roaming Weltzone" text
      And each element in the "data_bundles.list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format

    @automatic @live @next @qa @webapp
    Examples:
          | tariff_type | test_priority | ber | depends_on  | jira_id     |
          | limited     | sanity        | ber | QANOV-44493 | QANOV-44502 |

    @manual
    Examples:
          | tariff_type | test_priority | ber | depends_on   | jira_id      |
          | unlimited   | regression    |     | QANOV-424671 | QANOV-424708 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-386653 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de
  Scenario Outline: Postpay user with "fair use policy" (FUP) can see the "outside from the EU" data consumption details when international packs are purchased
    Note that there is no usage information about the packs.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And user has purchased "international_data" bundles
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "extra_consumption" module is displayed
      And the "data_bundles" module is displayed
      And the "data_bundles.title" textfield with "GEBUCHTES HIGHSPEED-DATENVOLUMEN" text is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "name" field
      And each element in the "data_bundles.list" list has the "type" textfield that contains the "Roaming Weltzone" text
      And each element in the "data_bundles.list" list has the "status" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MEHR INFORMATIONEN" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Informationen zur Fair Usage Policy" text is displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | ber | test_priority | depends_on   | jira_id      |
          | unlimited   | with            | has not                  | ber | smoke         | QANOV-424674 | QANOV-424709 |
          | limited     | without         | has                      |     | regression    | QANOV-424677 | QANOV-424710 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-421952
  @manual @mobile @o2de @regression
  Scenario Outline: Postpay user with "fair use policy" (FUP) can access to the "Fair Use Policy" OB webview from the Consumption screen
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<tab>" tab
      And clicks on the "more_info.fup_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "EU-Roaming-Verordnung: Alle Infos bei o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Mobile Line Consumption" page is displayed
      And the "<tab>" tab is selected

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | tab        | depends_on                | jira_id      |
          | unlimited   | with            | has not                  | inland     | QANOV-424687              | QANOV-424711 |
          | unlimited   | with            | has not                  | eu         | QANOV-424702:QANOV-621105 | QANOV-424712 |
          | unlimited   | with            | has not                  | outside_eu | QANOV-424706:QANOV-424709 | QANOV-424713 |
          | limited     | without         | has                      | inland     | QANOV-424688              | QANOV-424714 |
          | limited     | without         | has                      | eu         | QANOV-424703:QANOV-621106 | QANOV-424715 |
          | limited     | without         | has                      | outside_eu | QANOV-424707:QANOV-424710 | QANOV-424716 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47786
  @jira.link.detects.LOC-1175 @jira.link.detects.O2DE-3164 @live @mobile @next @o2de @qa @smoke
  Scenario Outline: Prepay user can access to the <allowance_type> consumption details from the <allowance_type> roundel
    The order of the tabs is: Daten, Einheiten, Min, SMS.
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has the "tabs" module configured in CMS for "usage" page
      And user is in the "Account" page
     When clicks on the "<allowance_type>_roundel" button
     Then the "Mobile Line Consumption" page is displayed
      And the "Gesamtverbrauch" header is displayed
      And the "data" tab with "Daten" text is displayed
      And the "units" tab with "Einheiten" text is displayed
      And the "minutes" tab with "Min" text is displayed
      And the "messages" tab with "SMS" text is displayed
      And the "<allowance_type>" tab is selected
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | allowance_type | ber | jira_id      |
          | data           | ber | QANOV-47811  |
          | minutes        |     | QANOV-47812  |
          | messages       |     | QANOV-47813  |
          | units          |     | QANOV-171493 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-342334
  @jira.link.depends_on.QANOV-47811 @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @manual @mobile
  @o2de @regression
  Scenario Outline: Prepay user can switch among tabs in the consumption screen
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<initial_tab>" tab
      And clicks on the "<final_tab>" tab
     Then the "<final_tab>" tab is selected

    Examples:
          | initial_tab | final_tab | jira_id      |
          | data        | minutes   | QANOV-47815  |
          | minutes     | messages  | QANOV-47816  |
          | messages    | units     | QANOV-47817  |
          | units       | data      | QANOV-171494 |

  @jira.QANOV-47818 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-278 @manual @mobile @o2de
  @smoke
  Scenario: Prepay user without data bundles can see the "data" consumption details
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has not "data" bundles
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "data" tab is selected
      And the "data_active_bundles_list" list is not displayed
      And the "data_pending_activation_bundles_list" list is not displayed
      And the "consumption.no_consumption_icon" icon is displayed
      And the "consumption.no_consumption_title_textfield" textfield with "Du hast aktuell keine Minutenoptionen gebucht." text is displayed
      And the "consumption.no_consumption_subtitle_textfield" textfield with "Gebuchte Optionen werden hier angezeigt." text is displayed

  @jira.QANOV-47819 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-278 @manual @mobile @o2de
  @regression
  Scenario: Prepay user without minutes bundles can see the "minutes" consumption details
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has not "minutes" bundles
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes" tab is selected
      And the "minutes_active_bundles_list" list is not displayed
      And the "minutes_pending_activation_bundles_list" list is not displayed
      And the "consumption.no_consumption_icon" icon is displayed
      And the "consumption.no_consumption_title_textfield" textfield with "Du hast aktuell keine Minutenoptionen gebucht." text is displayed
      And the "consumption.no_consumption_subtitle_textfield" textfield with "Gebuchte Optionen werden hier angezeigt." text is displayed
      And the "download_calls_history" entrypoint with "Einzelverbindungsnachweis herunterladen" text is displayed

  @jira.QANOV-47820 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-278 @manual @mobile @o2de
  @regression
  Scenario: Prepay user without SMS bundles can see the "SMS" consumption details
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has not "messages" bundles
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "messages" tab
     Then the "messages" tab is selected
      And the "messages_active_bundles_list" list is not displayed
      And the "messages_pending_activation_bundles_list" list is not displayed
      And the "consumption.no_consumption_icon" icon is displayed
      And the "consumption.no_consumption_title_textfield" textfield with "Du hast aktuell keine SMS-optionen gebucht." text is displayed
      And the "consumption.no_consumption_subtitle_textfield" textfield with "Gebuchte Optionen werden hier angezeigt." text is displayed
      And the "download_sms_history" entrypoint with "Einzelverbindungsnachweis herunterladen" text is displayed

  @jira.QANOV-171495 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @manual @mobile @o2de @regression
  Scenario: Prepay user without Units bundles can see the "Units" consumption details
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has not "units" bundles
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "units" tab
     Then the "units" tab is selected
      And the "units_active_bundles_list" list is not displayed
      And the "units_pending_activation_bundles_list" list is not displayed
      And the "consumption.no_consumption_icon" icon is displayed
      And the "consumption.no_consumption_title_textfield" textfield with "Du hast aktuell keine Einheitenoptionen gebucht." text is displayed
      And the "consumption.no_consumption_subtitle_textfield" textfield with "Gebuchte Optionen werden hier angezeigt." text is displayed

  @jira.QANOV-56649 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @manual @mobile @o2de @regression
  Scenario: Prepay user with all bundles in active status will see the tariff name at the top of the consumption screen
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has a "any" bundle in "active" status
      And user has not a bundle in "pending_activation" status
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     Then the "tariff_name.label" textfield with "Mein Tarif" text is displayed
      And the "tariff_name.value" textfield is displayed

  @jira.QANOV-171496 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-2972 @manual @mobile @o2de
  @regression
  Scenario: Prepay user with a bundle in pending activation status will see the tariff name and the Topup button at the top of the consumption screen
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has a "any" bundle in "pending_activation" status
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     Then the "tariff_name.label" textfield with "Mein Tarif" text is displayed
      And the "tariff_name.value" textfield is displayed
      And the "topup_message" textfield with "Zum Erneuern des Tarifs muss du erst Guthaben aufladen" text is displayed
      And the "topup_button" button with "Aufladen" text is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-282 @mobile @o2de @smoke
  @webapp
  Scenario Outline: Prepay user with at least a data bundle in <bundle_status> status can see the "data" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "prepay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "data" bundle in "<bundle_status>" status
      And user has the "consumption-counter-packs" module configured in CMS for "data-packs" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then the "data_<bundle_status>_bundles.module_title" textfield with "<section_title>" text is displayed
      And the "data_<bundle_status>_bundles.bundle_list" list is displayed

    @automatic @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id     |
          | active        | AKTIVE OPTIONEN | ber | QANOV-47821 |

    @manual
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171497 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-282 @mobile @o2de @smoke
  @webapp
  Scenario Outline: Prepay user with at least a minutes bundle in <bundle_status> status can see the "minutes" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "prepay" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has a "minutes" bundle in "<bundle_status>" status
      And user has the "consumption-counter-packs" module configured in CMS for "voice-packs" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_<bundle_status>_bundles" element is visible
     Then the "minutes_<bundle_status>_bundles.module_title" textfield with "<section_title>" text is displayed
      And the "minutes_<bundle_status>_bundles.bundle_list" list is displayed
      And the "download_calls_history" entrypoint with "Einzelverbindungsnachweis herunterladen" text is displayed

    @automatic @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id     |
          | active        | AKTIVE OPTIONEN | ber | QANOV-47822 |

    @manual
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171498 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-282 @mobile @o2de @smoke
  @webapp
  Scenario Outline: Prepay user with at least a SMS bundle in <bundle_status> status can see the "SMS" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "prepay" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has a "messages" bundle in "<bundle_status>" status
      And user has the "consumption-counter-packs" module configured in CMS for "sms-packs" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_<bundle_status>_bundles" element is visible
     Then the "messages_<bundle_status>_bundles.module_title" textfield with "<section_title>" text is displayed
      And the "messages_<bundle_status>_bundles.bundle_list" list is displayed
      And the "download_sms_history" entrypoint with "Einzelverbindungsnachweis herunterladen" text is displayed

    @automatic @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id     |
          | active        | AKTIVE OPTIONEN | ber | QANOV-47823 |

    @manual
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171499 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171493 @jira.link.depends_on.QANOV-47811
  @jira.link.depends_on.QANOV-47812 @jira.link.depends_on.QANOV-47813 @jira.link.detects.O2DE-282 @mobile @o2de @smoke
  @webapp
  Scenario Outline: Prepay user with at least a Units bundle in <bundle_status> status can see the "Units" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "prepay" account type
      And user has "units" allowances in the "mobile_line" product
      And user has a "units" bundle in "<bundle_status>" status
      And user has the "consumption-counter-packs" module configured in CMS for "unit-packs" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "units" tab
      And waits until the "units_<bundle_status>_bundles" element is visible
     Then the "units_<bundle_status>_bundles.module_title" textfield with "<section_title>" text is displayed
      And the "units_<bundle_status>_bundles.bundle_list" list is displayed

    @automatic @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id      |
          | active        | AKTIVE OPTIONEN | ber | QANOV-171500 |

    @manual
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171501 |

  @jira.<jira_id> @<priority> @android @automatic @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @live @mobile
  @next @o2de @qa @webapp
  Scenario Outline: Prepay user can see the details of a limited <allowance_type> bundle in active status
    Active bundles will show the expiry date (Enddatum) or the renewal date (Verlängerungsdatum), depending on the
    info provided in API.
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has a "<allowance_type>" bundle in "active" status
      And user has the "consumption-counter-packs" module configured in CMS for "<modular_page>" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles.bundle_list" list is displayed
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "icon" field
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "title" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB|Min|SMS|Einheiten) von \d+(\,\d{1,2})? (KB|MB|GB|Min|SMS|Einheiten)" format
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "subtitle" field
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "subtitle2" textfield with the "(Wird verlängert am|Enddatum): \d\d. (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( - \d+ Tage)?" format

    Examples:
          | allowance_type | priority | modular_page | depends_on   | jira_id      |
          | data           | sanity   | data-packs   | QANOV-47821  | QANOV-47824  |
          | minutes        | smoke    | voice-packs  | QANOV-47822  | QANOV-47825  |
          | messages       | smoke    | sms-packs    | QANOV-47823  | QANOV-47826  |
          | units          | smoke    | unit-packs   | QANOV-171500 | QANOV-171502 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.24.1 @jira.link.depends_on.<depends_on> @manual @mobile @o2de
  Scenario Outline: Prepay user can see the details of a unlimited <allowance_type> bundle in active status
    Active bundles will show the expiry date (Enddatum) or the renewal date (Verlängerungsdatum), depending on the
    info provided in API.
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has a "<allowance_type>" bundle in "active" status
      And user has the "consumption-counter-packs" module configured in CMS for "<modular_page>" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles.bundle_list" list is displayed
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "icon" field
      And any element in the "<allowance_type>_active_bundles.bundle_list" list has the "title" textfield with the "Unbegrenzte" text
      And any element in the "<allowance_type>_active_bundles.bundle_list" list is displayed in "blue" colour
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "subtitle" field
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "subtitle2" textfield with the "(Wird verlängert am|Enddatum): \d\d. (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( - \d+ Tage)?" format

    Examples:
          | allowance_type | priority   | modular_page | depends_on   | jira_id      |
          | data           | smoke      | data-packs   | QANOV-47821  | QANOV-580439 |
          | minutes        | regression | voice-packs  | QANOV-47822  | QANOV-580440 |
          | messages       | regression | sms-packs    | QANOV-47823  | QANOV-580441 |
          | units          | regression | unit-packs   | QANOV-171500 | QANOV-580442 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: Prepay user can see the details of a <allowance_type> bundle in pending activation status
    Bundles in pending activation status will show the label 'Top up to use' (Zum Gebrauch aufladen).
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has a "<allowance_type>" bundle in "pending_activation" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_pending_activation_bundles_list" list is displayed
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "<allowance_type>_icon" field
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "topup_tag" textfield with "Wartet auf Aufladung" text
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "name" field
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "grace_period" textfield with "Toleranzperiode" text

    Examples:
          | allowance_type | depends_on   | jira_id      |
          | data           | QANOV-171497 | QANOV-47827  |
          | minutes        | QANOV-171498 | QANOV-47828  |
          | messages       | QANOV-171499 | QANOV-47829  |
          | units          | QANOV-171501 | QANOV-171503 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Prepay user who has not made any consumption of a <allowance_type> bundle can see the bundle roundel in gray
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has consumed "0%" of a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles_list" list is displayed
      And an element in the "<allowance_type>_active_bundles_list" list has the "roundel" field with "grey" color

    Examples:
          | allowance_type | depends_on   | jira_id      |
          | data           | QANOV-47824  | QANOV-47830  |
          | minutes        | QANOV-47825  | QANOV-47831  |
          | messages       | QANOV-47826  | QANOV-47832  |
          | units          | QANOV-171502 | QANOV-171512 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Prepay user who has consumed less than 100% of a <allowance_type> bundle can see the bundle roundel in blue
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has consumed "<100%" of a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles_list" list is displayed
      And an element in the "<allowance_type>_active_bundles_list" list has the "roundel" field with "blue" color

    Examples:
          | allowance_type | depends_on   | jira_id      |
          | data           | QANOV-47824  | QANOV-47836  |
          | minutes        | QANOV-47825  | QANOV-47837  |
          | messages       | QANOV-47826  | QANOV-47838  |
          | units          | QANOV-171502 | QANOV-171514 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Prepay user who has consumed 100% of a <allowance_type> bundle can see the bundle roundel in red
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has consumed "100%" of a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles_list" list is displayed
      And an element in the "<allowance_type>_active_bundles_list" list has the "roundel" field with "red" color

    Examples:
          | allowance_type | depends_on   | jira_id      |
          | data           | QANOV-47824  | QANOV-47839  |
          | minutes        | QANOV-47825  | QANOV-47840  |
          | messages       | QANOV-47826  | QANOV-47841  |
          | units          | QANOV-171502 | QANOV-171515 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-2948 @manual
  @mobile @o2de @smoke
  Scenario Outline: Prepay user can download the <allowance_type> history (EVN)
    Given user has a "prepay" account type
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
      And clicks on the "<entrypoint_name>" entrypoint
     Then the external webview is displayed
      And the "Guthaben & Aufladen" string is displayed
      And clicks on the native "back" button
      And the "Mobile Line Consumption" page is displayed

    Examples:
          | allowance_type | entrypoint_name        | depends_on                           | jira_id      |
          | minutes        | download_calls_history | QANOV-171498:QANOV-47819:QANOV-47822 | QANOV-171520 |
          | messages       | download_sms_history   | QANOV-171499:QANOV-47820:QANOV-47823 | QANOV-182293 |

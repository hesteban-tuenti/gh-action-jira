# -*- coding: utf-8 -*-
@jira.QANOV-171353
Feature: Consumption

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user has the "Consumption Counters" module configured in CMS for "Mobile Line Dashboard" page
      And user has the "Multiple tabs" module configured in CMS for "Mobile Line Consumption" page


  @jira.<jira_id> @android @blaude @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @raitt_drop1
  @regression
  Scenario Outline: A <account_type> user without allowances roundels can access to the consumption screen
    Some prepay users (those with a 9 Ct. tariff) and postpay users (those with "Pay as you go" tariff and without packs
    purchased) don't have roundels in the account dashboard. For these users we have a smart action button in order to
    access the consumptions details.
    Example of postpay user without allowances: 01796809662 / wipro123
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
          | postpay      | QANOV-342295 | QANOV-342331 |
          | prepay       | QANOV-183129 | QANOV-342332 |

  @jira.QANOV-202570 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @live
  @mobile @next @raitt_drop1 @smoke @webapp
  Scenario: Postpay user with a plan that allows to consume international data can access to the "inland & EU" tab in the data consumption screen
    Postpay user can have different plans:
    - Plan with national and international data: Consumption screen will show 2 tabs (for national and international)
    - Plan with only national data (but allows to buy international data): Consumption screen will show 2 tabs (for national and international)
    - Plan with only national data (but doesn't allow to buy international data): Consumption screen won't show any tab (only national data will be displayed)
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the mobile plan allows to consume international data
      And user has the matching subscription selected in the account
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_eu_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "Datenverbrauch" header is displayed
      And the "consumption_header.pretitle" textfield with the "Dein Rechnungsmonat endet in \d+ (Tag|Tagen|Stund|Stunden)" format is displayed
      And the "consumption_header.title" textfield with the "Rechnungszeitraum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \– (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.)" format is displayed
      And the "inland_and_eu" tab with "Inland & EU" text is displayed
      And the "outside_eu" tab with "Außerhalb EU" text is displayed
      And the "inland_and_eu" tab is selected
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-202572 @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @mobile @qa
  @raitt_drop1 @smoke @webapp
  Scenario: Postpay user with domestic and international allowances can access to the "outside from the EU" tab in the data consumption screen
    Given user has a "postpay" account type
      And user has "international_data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "international_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "Datenverbrauch" header is displayed
      And the "consumption_header.pretitle" textfield with the "Dein Rechnungsmonat endet in \d+ (Tag|Tagen|Stund|Stunden)" format is displayed
      And the "consumption_header.title" textfield with the "Rechnungszeitraum (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \– (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.)" format is displayed
      And the "inland_and_eu" tab with "Inland & EU" text is displayed
      And the "outside_eu" tab with "Außerhalb EU" text is displayed
      And the "outside_eu" tab is selected
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

  @jira.QANOV-202574 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user with a national plan that doesn't allow to consume international data can access to the consumption screen
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
      And each element in the "data_bundles.bundle_list" list has the "subtitle" textfield with the "(Daten Inland und EU|Daten Inland)" format
      And each element in the "data_bundles.bundle_list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: Postpay user can switch among tabs in the data consumption screen
    Given user has a "postpay" account type
      And the mobile plan allows to purchase international data bundles
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<initial_tab>" tab
      And clicks on the "<final_tab>" tab
     Then the "<final_tab>" tab is selected

    Examples:
          | initial_tab   | final_tab     | depends_on                | jira_id      |
          | inland_and_eu | outside_eu    | QANOV-202570:QANOV-342331 | QANOV-202576 |
          | outside_eu    | inland_and_eu | QANOV-202572:QANOV-342331 | QANOV-202577 |

  @jira.QANOV-202578 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202570
  @jira.link.detects.O2DE-3298 @jira.link.detects.OBO2DE-455 @live @mobile @next @raitt_drop1 @raitt_drop2 @sanity @webapp
  Scenario: Postpay user with a plan that allows to consume international data can see the "inland & EU" data consumption details when allowances are available
    Types of bundle: National, National + EU.
    Types of status: active (Available), activation (not available), deactivation (available till “X” Deactivation date).
    Note that there is no usage information about the packs.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the mobile plan allows to consume international data
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "inland_and_eu" tab
     Then the "data_consumption_module.module_title" textfield with "Datenverbrauch" text is displayed
      And the "data_consumption_module.estimated_consumption" textfield with the "Voraussichtlicher Verbrauch: \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_consumption_module.progress_bar" progress bar is displayed
      And the "data_consumption_module.total_used_label" textfield with "Insgesamt verbraucht" text is displayed
      And the "data_consumption_module.total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "data_consumption_module.sim_title" textfield is displayed
      And the "data_consumption_module.sim_list" list is displayed
      And the "data_bundles.module_title" textfield is displayed
      And the "data_bundles.list" list is displayed
      And each element in the "data_bundles.list" list has the "icon" field
      And each element in the "data_bundles.list" list has the "title" field
      And each element in the "data_bundles.list" list has the "subtitle" textfield with the "(Daten Inland & EU|Daten Inland)" format
      And each element in the "data_bundles.list" list has the "subtitle2" textfield with the "(Aktiv|Aktivierung|Deaktivierung zum \d\d\.\d\d\.\d\d)" format

  @jira.QANOV-507402 @android @blaude @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-202570 @manual @mobile @regression
  Scenario: Postpay user with a plan that allows to consume international data can see the "inland & EU" data consumption details when allowances are not available
    Some postpay users (those with "Pay as you go" tariff and without packs purchased) don't have roundels in the account dashboard.
    These users will display an empty-case in the "Inland & EU" tab if no bundles have been purchased.
    Example: 01796809662 / wipro123
    Given user has a "postpay" account type
      And user has no allowances in the "mobile_line" product
      And the mobile plan allows to consume international data
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

  @jira.QANOV-202581 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202574
  @jira.link.depends_on.QANOV-202578 @manual @mobile @raitt_drop2 @smoke
  Scenario: Postpay user with detail by sim can see the "inland & EU" data consumption by SIM
    As Blau users can have only an active SIM, only a SIM will be displayed in the Consumption screen.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has detail by sim
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_consumption_module.progress_bar" progress bar is displayed
      And the "data_consumption_module.total_used_label" textfield with "Insgesamt verbraucht" text is displayed
      And the "data_consumption_module.total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield with "VERBRAUCH PRO SIM" text is displayed
      And the "consumption_by_sim.phone_icon" icon is displayed
      And the "consumption_by_sim.name" textfield is displayed
      And the "consumption_by_sim.phone_number" textfield is displayed
      And the "consumption_by_sim.consumption" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim.color_icon" icon is displayed
      And the sim consumption will correspond with the total data used

  @jira.QANOV-437448 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-202574
  @jira.link.depends_on.QANOV-202578 @manual @mobile @regression
  Scenario: Postpay user without detail by sim cannot see the "inland & EU" data consumption by SIM
    As Blau users can have only an active SIM, only a SIM will be displayed in the Consumption screen.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has not detail by sim for this line
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Account" page
     When clicks on the "inland_EU_data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "data_consumption_module.progress_bar" progress bar is displayed
      And the "data_consumption_module.total_used_label" textfield with "Insgesamt verbraucht" text is displayed
      And the "data_consumption_module.total_used_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "consumption_by_sim" module is displayed
      And the "consumption_by_sim.title" textfield is not displayed
      And the "consumption_by_sim.phone_icon" icon is displayed
      And the "consumption_by_sim.name" textfield is displayed
      And the "consumption_by_sim.phone_number" textfield is displayed
      And the "consumption_by_sim.consumption" textfield is not displayed
      And the "consumption_by_sim.color_icon" icon is not displayed

  @jira.QANOV-202583 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202572 @jira.link.detects.O2DE-1843
  @jira.link.detects.OBO2DE-251 @manual @mobile @raitt_drop1 @smoke
  Scenario: Postpay user without any international pack purchased can see the "outside from the EU" data consumption details
    Postpay user can have only a national data plan which allows the usage of international data (this plan hasn't any
    international data associated, but the user can buy international bundles or use international data as extra charges).
    Given user has a "postpay" account type
      And user has not purchased international data bundles
      And the mobile plan allows to purchase international data bundles
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

  @jira.QANOV-202584 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202572
  @jira.link.detects.O2DE-1843 @live @mobile @next @raitt_drop1 @sanity @webapp
  Scenario: Postpay user with a plan that allows to consume international data can see the "outside from the EU" data consumption details
    There is no international packs available in PROD
    Given user has a "postpay" account type
      And user has "international_data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
      And waits until the "extra_consumption" element is visible
     Then the "extra_consumption" module is displayed

  @jira.<jira_id> @<ber> @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171322 @live
  @mobile @next @raitt_drop1 @smoke @webapp
  Scenario Outline: A <stack> prepay user can access to the <allowance_type> consumption details from the <allowance_type> roundel
    The order of the tabs is: Daten, Einheiten, Min, SMS.
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user is in the "Account" page
     When clicks on the "<allowance_type>_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "Gesamtverbrauch" header is displayed
      And the "data" tab with "Daten" text is displayed
      And the "units" tab with "Einheiten" text is displayed
      And the "minutes" tab with "Min" text is displayed
      And the "messages" tab with "SMS" text is displayed
      And the "<allowance_type>" tab is selected
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

    Examples:
          | stack | allowance_type | ber | jira_id      |
          | any   | data           | ber | QANOV-171354 |
          | box7  | minutes        |     | QANOV-171355 |
          | box7  | messages       |     | QANOV-171356 |
          | box7  | units          |     | QANOV-171357 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357
  @jira.link.depends_on.QANOV-342332 @manual @mobile @raitt_drop1 @regression
  Scenario Outline: Prepay user can switch among tabs in the consumption screen
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<initial_tab>" tab
      And clicks on the "<final_tab>" tab
     Then the "<final_tab>" tab is selected

    Examples:
          | initial_tab | final_tab | jira_id      |
          | data        | minutes   | QANOV-171358 |
          | minutes     | messages  | QANOV-171359 |
          | messages    | units     | QANOV-171360 |
          | units       | data      | QANOV-171361 |

  @jira.QANOV-171362 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357 @manual @mobile
  @raitt_drop1 @smoke
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

  @jira.QANOV-171363 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357
  @jira.link.detects.O2DE-1874 @jira.link.detects.OBO2DE-474 @manual @mobile @raitt_drop1 @regression
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

  @jira.QANOV-171364 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357
  @jira.link.detects.O2DE-1874 @jira.link.detects.OBO2DE-474 @manual @mobile @raitt_drop1 @regression
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

  @jira.QANOV-171365 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357 @manual @mobile
  @raitt_drop1 @regression
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

  @jira.QANOV-171366 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357 @manual @mobile
  @raitt_drop1 @regression
  Scenario: Prepay user with all bundles in active status will see the tariff name at the top of the consumption screen
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has a "any" bundle in "active" status
      And user has not a bundle in "pending_activation" status
      And user has the "Consumption header" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     Then the "tariff_name.label" textfield with "Mein Tarif" text is displayed
      And the "tariff_name.value" textfield is displayed

  @jira.QANOV-171367 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357 @manual @mobile
  @raitt_drop1 @regression
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

  @jira.<jira_id> @<ber> @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357 @mobile
  @raitt_drop1 @smoke @webapp
  Scenario Outline: Prepay user with at least a data bundle in <bundle_status> status can see the "data" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "prepay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "data" bundle in "<bundle_status>" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "data" tab
     Then any element in the "data_<bundle_status>_bundles" list has the "module_title" textfield with the "<section_title>" text
      And each element in the sublist "bundle_list" inside each "data_<bundle_status>_bundles" list has the "icon" field

    @cert3 @live @next
    Examples:
          | bundle_status | section_title   | ber | jira_id      |
          | active        | AKTIVE OPTIONEN | ber | QANOV-171374 |

    @qa
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171375 |

  @jira.<jira_id> @<ber> @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357
  @jira.link.detects.O2DE-1874 @jira.link.detects.OBO2DE-474 @mobile @raitt_drop1 @smoke @webapp
  Scenario Outline: A BOX7 prepay user with at least a minutes bundle in <bundle_status> status can see the "minutes" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user has a "minutes" bundle in "<bundle_status>" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "minutes" tab
     Then any element in the "minutes_<bundle_status>_bundles" list has the "module_title" textfield with the "<section_title>" text
      And each element in the sublist "bundle_list" inside each "minutes_<bundle_status>_bundles" list has the "icon" field
      And the "download_calls_history" entrypoint with "Einzelverbindungsnachweis herunterladen" text is displayed

    @cert3 @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id      |
          | active        | AKTIVE OPTIONEN | ber | QANOV-171376 |

    @qa
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171377 |

  @jira.<jira_id> @<ber> @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357
  @jira.link.detects.O2DE-1874 @jira.link.detects.OBO2DE-474 @mobile @raitt_drop1 @smoke @webapp
  Scenario Outline: A BOX7 prepay user with at least a SMS bundle in <bundle_status> status can see the "SMS" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "messages" allowances in the "mobile_line" product
      And user has a "messages" bundle in "<bundle_status>" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "messages" tab
     Then any element in the "messages_<bundle_status>_bundles" list has the "module_title" textfield with the "<section_title>" text
      And each element in the sublist "bundle_list" inside each "messages_<bundle_status>_bundles" list has the "icon" field
      And the "download_sms_history" entrypoint with "Einzelverbindungsnachweis herunterladen" text is displayed

    @cert3 @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id      |
          | active        | AKTIVE OPTIONEN | ber | QANOV-171378 |

    @qa
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171379 |

  @jira.<jira_id> @<ber> @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171354
  @jira.link.depends_on.QANOV-171355 @jira.link.depends_on.QANOV-171356 @jira.link.depends_on.QANOV-171357 @mobile
  @raitt_drop1 @smoke @webapp
  Scenario Outline: A BOX7 prepay user with at least a Units bundle in <bundle_status> status can see the "Units" consumption details
    Types of status: active (Aktiv), pending_activation (Toleranzperiode).
    Active bundles will show the expiry date (Ablaufdatum) or the renewal date (Verlängerungsdatum), depending on the info
    provided in API.
    Bundles in pending activation status will show the label 'Top up to use' (Wartet auf Aufladung).
    The bundles will be displayed following API order.
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "units" allowances in the "mobile_line" product
      And user has a "units" bundle in "<bundle_status>" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "units" tab
     Then any element in the "units_<bundle_status>_bundles" list has the "module_title" textfield with the "<section_title>" text
      And each element in the sublist "bundle_list" inside each "units_<bundle_status>_bundles" list has the "icon" field

    @cert3 @live @next @qa
    Examples:
          | bundle_status | section_title   | ber | jira_id      |
          | active        | AKTIVE OPTIONEN | ber | QANOV-171380 |

    @qa
    Examples:
          | bundle_status      | section_title         | ber | jira_id      |
          | pending_activation | NICHT AKTIVE OPTIONEN |     | QANOV-171381 |

  @jira.<jira_id> @<priority> @android @automatic @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @mobile
  @raitt_drop1 @webapp
  Scenario Outline: A <stack> prepay user can see the details of a limited <allowance_type> bundle in active status
    Active bundles will show the expiry date (Enddatum) or the renewal date (Verlängerungsdatum), depending on the
    info provided in API.
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles" list is displayed
      And each element in the sublist "bundle_list" inside each "<allowance_type>_active_bundles" list has the "icon" field
      And each element in the sublist "bundle_list" inside each "<allowance_type>_active_bundles" list has the "title" field with the "\d+(\,\d{1,2})? (KB|MB|GB|Min|SMS|Einheiten) von \d+(\,\d{1,2})? (KB|MB|GB|Min|SMS|Einheiten)" format
      And each element in the sublist "bundle_list" inside each "<allowance_type>_active_bundles" list has the "subtitle" field
      And each element in the sublist "bundle_list" inside each "<allowance_type>_active_bundles" list has the "subtitle2" field with the "(Wird verlängert am|Enddatum): \d\d. (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( - \d+ Tage)?" format

    @cert3 @live @next
    Examples:
          | stack | allowance_type | priority | depends_on   | jira_id      |
          | any   | data           | sanity   | QANOV-171374 | QANOV-171382 |

    @qa
    Examples:
          | stack | allowance_type | priority | depends_on   | jira_id      |
          | box7  | minutes        | smoke    | QANOV-171376 | QANOV-171383 |
          | box7  | messages       | smoke    | QANOV-171378 | QANOV-171384 |
          | box7  | units          | smoke    | QANOV-171380 | QANOV-171385 |

  @jira.<jira_id> @<priority> @android @blaude @ios @jira.cv.24.1 @jira.link.depends_on.<depends_on> @manual @mobile
  Scenario Outline: A <stack> prepay user can see the details of a unlimited <allowance_type> bundle in active status
    Active bundles will show the expiry date (Enddatum) or the renewal date (Verlängerungsdatum), depending on the
    info provided in API.
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles.bundle_list" list is displayed
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "icon" field
      And any element in the "<allowance_type>_active_bundles.bundle_list" list has the "title" textfield with the "Unbegrenzte" text
      And any element in the "<allowance_type>_active_bundles.bundle_list" list is displayed in "blue" colour
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "subtitle" field
      And each element in the "<allowance_type>_active_bundles.bundle_list" list has the "subtitle2" textfield with the "(Wird verlängert am|Enddatum): \d\d. (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember)( - \d+ Tage)?" format

    Examples:
          | stack | allowance_type | priority   | depends_on   | jira_id      |
          | any   | data           | smoke      | QANOV-171374 | QANOV-580430 |
          | box7  | minutes        | regression | QANOV-171376 | QANOV-580431 |
          | box7  | messages       | regression | QANOV-171378 | QANOV-580432 |
          | box7  | units          | regression | QANOV-171380 | QANOV-580433 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @manual @mobile @raitt_drop1
  @smoke
  Scenario Outline: A <stack> prepay user can see the details of a <allowance_type> bundle in pending activation status
    Bundles in pending activation status will show the label 'Top up to use' (Zum Gebrauch aufladen).
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has a "<allowance_type>" bundle in "pending_activation" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_pending_activation_bundles_list" list is displayed
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "<allowance_type>_icon" field
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "topup_tag" textfield with "Wartet auf Aufladung" text
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "pack_name" field
      And each element in the "<allowance_type>_pending_activation_bundles_list" list has the "grace_period" textfield with "Toleranzperiode" text

    Examples:
          | stack | allowance_type | depends_on   | jira_id      |
          | any   | data           | QANOV-171375 | QANOV-171386 |
          | box7  | minutes        | QANOV-171377 | QANOV-171387 |
          | box7  | messages       | QANOV-171379 | QANOV-171388 |
          | box7  | units          | QANOV-171381 | QANOV-171389 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @manual @mobile @raitt_drop1
  @regression
  Scenario Outline: A <stack> prepay user who has consumed less than 100% of a <allowance_type> bundle can see the bundle roundel in blue
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has consumed "<100%" of a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles_list" list is displayed
      And an element in the "<allowance_type>_active_bundles_list" list has the "roundel" field with "blue" color

    Examples:
          | stack | allowance_type | depends_on   | jira_id      |
          | any   | data           | QANOV-171382 | QANOV-171402 |
          | box7  | minutes        | QANOV-171383 | QANOV-171403 |
          | box7  | messages       | QANOV-171384 | QANOV-171404 |
          | box7  | units          | QANOV-171385 | QANOV-171405 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @manual @mobile @raitt_drop1
  @regression
  Scenario Outline: A <stack> prepay user who has consumed 100% of a <allowance_type> bundle can see the bundle roundel in red
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has consumed "100%" of a "<allowance_type>" bundle in "active" status
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_active_bundles_list" list is displayed
      And an element in the "<allowance_type>_active_bundles_list" list has the "roundel" field with "red" color

    Examples:
          | stack | allowance_type | depends_on   | jira_id      |
          | any   | data           | QANOV-171382 | QANOV-171410 |
          | box7  | minutes        | QANOV-171383 | QANOV-171411 |
          | box7  | messages       | QANOV-171384 | QANOV-171412 |
          | box7  | units          | QANOV-171385 | QANOV-171413 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on> @manual @mobile @raitt_drop1
  @smoke
  Scenario Outline: A prepay user can access to the <allowance_type> history (EVN)
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "<allowance_type>" tab
      And clicks on the "<entrypoint_name>" entrypoint
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Mobile Line Consumption" page is displayed

    Examples:
          | allowance_type | entrypoint_name        | depends_on                             | jira_id      |
          | minutes        | download_calls_history | QANOV-171363:QANOV-171376:QANOV-171377 | QANOV-171418 |
          | messages       | download_sms_history   | QANOV-171364:QANOV-171378:QANOV-171379 | QANOV-182236 |

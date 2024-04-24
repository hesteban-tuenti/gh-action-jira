# -*- coding: utf-8 -*-
@jira.QANOV-44995
Feature: Bundle Management


  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @o2de @smoke @ber
  Scenario Outline: A <account_type> user with <product_type> product can access to the "Bundle Management" screen
    An "Embeddable Dynamic Content" module will be configured in CMS with title "Optionen verwalten & entdecken" and description
    "Du kannst zusätzlich zu deinem Tarif Optionen buchen, um deine SMS-, Minuten- und Datenverfügbarkeit zu erhöhen.".
    An "Action Row" module will be configured in CMS with title "Optionen verwalten" and subtitle "Alle gebuchten Optionen
    einsehen".
    A preconfigured "Categories list" module will be defined in CMS with title "OPTIONEN ENTDECKEN".
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International. If there are no packs
    available in a category, that category won’t be displayed.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    Novum has included an "artificial" entry-point for MeinO2 to allow customer to purchase non-telco products. The
    entry-point should be "Other packs" and pointing to an external OB webview. This entrypoint will always be displayed.
    For internet@home products, only dsl/cable/fiber can buy pucks. HomeSpot and DataSpot cannot buy packs.
    Given user has a "<account_type>" account type
      And user has any "<product_type>" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Smart actions" module configured in CMS for "Account" page
      And the "Smart actions" module configured in CMS for "Account" page has the "Bundle management" buttons
      And user has the "Embeddable Dynamic Content;Action Row;Categories list" modules configured in CMS for "Bundle Management" page
      And the "Embeddable Dynamic Content" module configured in CMS for "Bundle Management" page renders the dynamic content "bundle-management"
      And user is in the "Account" page
     When clicks on the "manage_bundle_button" button
     Then the "Bundle Management" page is displayed
      And the "Optionen verwalten" header is displayed
      And the "title" textfield with "Optionen verwalten & entdecken" text is displayed
      And the "description" textfield with "Du kannst zusätzlich zu deinem Tarif Optionen buchen, um deine SMS-, Minuten- und Datenverfügbarkeit zu erhöhen." text is displayed
      And the "my_current_bundles_entrypoint" entrypoint with "Deine Optionen verwalten" text is displayed
      And the "my_current_bundles_label" entrypoint with "Alle gebuchten Optionen einsehen" text is displayed
      And the "categories_title" textfield with "OPTIONEN ENTDECKEN" text is displayed
      And the "categories_list" list is displayed
      And each element in the "categories_list" list has the "icon" field
      And each element in the "categories_list" list has the "name" field
      And each element in the "categories_list" list has the "description" field
      And each element in the "categories_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | cv    | account_type | product_type    | depends_on  | parent_test_plan | jira_id      |
          | 14.2  | prepay       | mobile_line     | QANOV-47785 |                  | QANOV-47876  |
          | 14.2  | postpay      | mobile_line     | QANOV-38255 |                  | QANOV-206664 |
          | 14.11 | postpay      | dsl;cable;fiber | QANOV-38257 | QANOV-437471     | QANOV-206666 |

  @jira.QANOV-182299 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-206664 @jira.link.depends_on.QANOV-206666
  @jira.link.depends_on.QANOV-47876 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: A user with a mobile_line/dsl/cable/fiber product can access to the "My bundles" screen
    This screen will display the packs purchased by the user.
    VAS products will also be displayed in this screen.
    Given user has any "mobile_line;dsl;cable:fiber" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Action Row" module configured in CMS for "Bundle Management" page
      And user is in the "Bundle Management" page
     When clicks on the "my_current_bundles_entrypoint" entrypoint
     Then the "My Bundles" page is displayed
      And the "Gebuchte Optionen" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-182300 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @manual @mobile @o2de @smoke
  Scenario: A prepay user without packs purchased can see an empty-case message in the "My bundles" screen
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not bundles
      And user has the "Bundles in use;Bundles pending activation" modules configured in CMS for "My Bundles" page
      And user is in the "My Bundles" page
     Then the "my_pending_activation_bundles_list" list is not displayed
      And the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is not displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Keine Optionen verfügbar" text is displayed
      And the "empty_case.text" textfield with "Aktuell sind für dich keine weiteren Optionen buchbar." text is displayed

  @jira.QANOV-206672 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A postpay user without packs purchased can see an empty-case message in the "My bundles" screen
    Given user has a "postpay" account type
      And user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has not bundles
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user is in the "My Bundles" page
     Then the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is not displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Keine Optionen verfügbar" text is displayed
      And the "empty_case.text" textfield with "Aktuell sind für dich keine weiteren Optionen buchbar." text is displayed

  @jira.QANOV-182301 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A user can see his/her recurrent active packs in the "My bundles" screen
    - Possible status of a pack:
    -- Prepay users:  active, pending to activate, removed.
    -- Postpay users: active, removed.
    Active and removed packs will be shown in the same list under the title "Gebuchte Optionen". Pending packs will be shown in a separated list.
    - Tags: the status tag is only displayed for pending and removed packs (active packs won't show the status tag).
    Active one-shot packs will display a "One shot" tag. Active "Data automatic" pack will display a "Pay per use" tag.
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a "recurrent" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user is in the "Bundle Management" page
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
     Then the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is displayed
      And the "active-recurrent" bundles in the "my_active_removed_bundles_list" list has the "name" field
      And the "active-recurrent" bundles in the "my_active_removed_bundles_list" list has the "date" textfield with the "Autom. Verlängerung: (alle \d+|\d+.) (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.|Monat|Monate|Tage)( \d{4})?" format
      And the "active-recurrent" bundles in the "my_active_removed_bundles_list" list has the "price" textfield with the "\d+,\d\d € \(inkl\. MwSt\.\)" format
      And the "active-recurrent" bundles in the "my_active_removed_bundles_list" list has the "chevron" field

  @jira.QANOV-182305 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A user can see his/her one-shot active packs in the "My bundles" screen
    - Possible status of a pack:
    -- Prepay users:  active, pending to activate, removed.
    -- Postpay users: active, removed.
    - Active and removed packs will be shown in the same list under the title 'Gebuchte Optionen'. Pending packs
    will be shown in a separated list.
    - Tags: the status tag is only displayed for pending and removed packs (active packs won't show the status tag).
    Active one-shot packs will display a "One shot" tag. Active "Data automatic" pack will display a "Pay per use" tag.
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a "oneshot" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user is in the "Bundle Management" page
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
     Then the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is displayed
      And the "active-oneshot" bundles in the "my_active_removed_bundles_list" list has the "status_tag" textfield with "Einmalig" text
      And the "active-oneshot" bundles in the "my_active_removed_bundles_list" list has the "name" field
      And the "active-oneshot" bundles in the "my_active_removed_bundles_list" list has the "date" textfield with the "Enddatum: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format
      And the "active-oneshot" bundles in the "my_active_removed_bundles_list" list has the "price" textfield with the "\d+,\d\d € \(inkl\. MwSt\.\)" format
      And the "active-oneshot" bundles in the "my_active_removed_bundles_list" list has the "chevron" field

  @jira.QANOV-226691 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @manual @mobile @o2de @smoke
  Scenario: A postpay user can see his/her "Data automatic" pack in the "My bundles" screen
    - Possible status of a pack:
    -- Prepay users:  active, pending to activate, removed.
    -- Postpay users: active, removed.
    - Active and removed packs will be shown in the same list under the title 'Gebuchte Optionen'. Pending packs
    will be shown in a separated list.
    - Tags: the status tag is only displayed for pending and removed packs (active packs won't show the status tag).
    Active one-shot packs will display a "One shot" tag. Active "Data automatic" pack will display a "Pay per use" tag.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "data_automatic" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user is in the "My Bundles" page
     Then the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is displayed
      And the "data_automatic" bundles in the "my_active_removed_bundles_list" list has the "label" textfield with "Pay-per-use" text
      And the "data_automatic" bundles in the "my_active_removed_bundles_list" list has the "title" textfield with the "(Pay Per Use|Daten automatisch)" format
      And the "data_automatic" bundles in the "my_active_removed_bundles_list" list has the "subtitle" textfield with the "Startdatum: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format
      And the "data_automatic" bundles in the "my_active_removed_bundles_list" list has the "subtitle2" textfield with the "\d+,\d\d € \(inkl\. MwSt\.\)" format
      And the "data_automatic" bundles in the "my_active_removed_bundles_list" list has the "chevron" field

  @jira.QANOV-182302 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A user can see his/her removed packs in the "My bundles" screen
    - Possible status of a pack:
    -- Prepay users:  active, pending to activate, removed.
    -- Postpay users: active, removed.
    - Active and removed packs will be shown in the same list under the title 'Gebuchte Optionen'. Pending packs
    will be shown in a separated list.
    - Tags: the status tag is only displayed for pending and removed packs (active packs won't show the status tag).
    Active one-shot packs will display a "One shot" tag. Active "Data automatic" pack will display a "Pay per use" tag.
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a "any" bundle in "removed" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user is in the "My Bundles" page
     Then the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is displayed
      And the "removed" bundles in the "my_active_removed_bundles_list" list has the "status_tag" textfield with "Abbestellt" text
      And the "removed" bundles in the "my_active_removed_bundles_list" list has the "name" field
      And the "removed" bundles in the "my_active_removed_bundles_list" list has the "date" textfield with the "Enddatum: (0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format
      And the "removed" bundles in the "my_active_removed_bundles_list" list has the "price" textfield with the "\d+,\d\d € \(inkl\. MwSt\.\)" format
      And the "removed" bundles in the "my_active_removed_bundles_list" list has the "chevron" field

  @jira.QANOV-182303 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @manual @mobile @o2de @smoke
  Scenario: A prepay user can see his/her "pending to activate" packs in the "My bundles" screen
    - Possible status of a pack: active, pending to activate, removed.
    - Active and removed packs will be shown in the same list under the title 'Gebuchte Optionen'. Pending packs
    will be shown in a separated list.
    - Tags: the status tag is only displayed for pending and removed packs (active packs won't show the status tag).
    Active one-shot packs will display a "One shot" tag. Active "Data automatic" pack will display a "Pay per use" tag.
    - Some packs could have a "date" field, depending on the API response.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "any" bundle in "pending_activation" status
      And user has the "Bundles pending activation" module configured in CMS for "My Bundles" page
      And user is in the "My Bundles" page
     Then the "my_pending_activation_bundles_list" list is displayed
      And each element in the "my_pending_activation_bundles_list" list has the "status_tag" textfield with "Wartet auf Aufladung" text
      And each element in the "my_pending_activation_bundles_list" list has the "name" field
      And each element in the "my_pending_activation_bundles_list" list has the "price" textfield with the "\d+,\d\d € \(inkl\. MwSt\.\)" format
      And each element in the "my_pending_activation_bundles_list" list has the "chevron" field

  @jira.QANOV-182304 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299 @manual @mobile @o2de @regression
  Scenario: A prepay user with only "pending to activate" packs can see an empty-case message in the "currently in use" section
    - Possible status of a pack: active, pending to activate, removed.
    - Active and removed packs will be shown in the same list under the title 'Gebuchte Optionen'. Pending packs
    will be shown in a separated list.
    - Tags: the status tag is only displayed for pending and removed packs (active packs won't show the status tag).
    Active one-shot packs will display a "One shot" tag. Active "Data automatic" pack will display a "Pay per use" tag.
    - Some packs could have a "description" field, depending on the API response.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "any" bundle in "pending_activation" status
      And user has no bundle in "active" status
      And user has the "Bundles in use;Bundles pending activation" modules configured in CMS for "My Bundles" page
      And user is in the "My Bundles" page
     Then the "my_pending_activation_bundles_list" list is displayed
      And the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is not displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Keine Optionen verfügbar" text is displayed
      And the "empty_case.text" textfield with "Aktuell sind für dich keine weiteren Optionen buchbar." text is displayed

  @jira.QANOV-420568 @android @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-182299 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A user can see his/her value added services (VAS) in the "My bundles" screen
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a value added service
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user is in the "Bundle Management" page
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
     Then the "my_active_removed_bundles_title" textfield with "Gebuchte Optionen" text is displayed
      And the "my_active_removed_bundles_list" list is displayed
      And the value added services in the "my_active_removed_bundles_list" list has the "name" field
      And the value added services in the "my_active_removed_bundles_list" list has the "price" textfield with the "\d+,\d\d € \(inkl\. MwSt\.\)" format
      And the value added services in the "my_active_removed_bundles_list" list has the "date" field
      And the value added services in the "my_active_removed_bundles_list" list has the "chevron" field

  @jira.QANOV-420480 @android @ber @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182305
  @jira.link.parent_test_plan.QANOV-402198 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user can see the details of a one-shot pack in active status
    Active one-shot packs will be identified by a "one shot" tag in "My bundles" screen.
    You cannot remove a one-shot pack in active status, as you already paid for it.
    If the bundle selected is the "24h unlimited data", then a "MORE INFORMATION" section will be displayed at the bottom
    of the screen with a "fair use policy" (FUP) entrypoint.
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a "oneshot" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "Bundle Management" page
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
      And clicks on any element in the "my_active_removed_bundles_list" list with the "status_tag" field that contains the "Einmalig" text
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Preis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_status.label" textfield with "Status" text is displayed
      And the "pack_status.value" textfield with "Aktiv" text is displayed
      And the "pack_startdate.label" textfield with "Startdatum" text is displayed
      And the "pack_startdate.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "pack_enddate.label" textfield with "Enddatum" text is displayed
      And the "pack_enddate.sublabel" textfield with "Keine automatische Verlängerung" text is displayed
      And the "pack_enddate.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "pack_details.title" textfield with "DETAILS" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "topup_button" button is not displayed
      And the "remove_pack_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-424761 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-182301
  @jira.link.parent_test_plan.QANOV-402198 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: A postpay user can see the details of the "24h unlimited data" pack in active status
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "Bundle Management" page for the matching product
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
      And clicks on any element in the "my_active_removed_bundles_list" list with the "name" field that contains the "Day Pack unlimited" text
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Preis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_status.label" textfield with "Status" text is displayed
      And the "pack_status.value" textfield with "Aktiv" text is displayed
      And the "pack_startdate.label" textfield with "Startdatum" text is displayed
      And the "pack_startdate.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "pack_enddate.label" textfield with "Enddatum" text is displayed
      And the "pack_enddate.sublabel" textfield with "Keine automatische Verlängerung" text is displayed
      And the "pack_enddate.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "pack_details.title" textfield with "DETAILS" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "more_info" module is displayed
      And the "more_info.title" textfield with "MORE INFO" text is displayed
      And the "more_info.fup_entrypoint" entrypoint with "Information about Fair Use Policy" text is displayed
      And the "topup_button" button is not displayed
      And the "remove_pack_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-424762 @TBD @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-424761
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: Postpay user with a "24h unlimited data" bundle purchased can access to the "Fair Use Policy" OB webview from the Category Bundles screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "24h_unlimited_data" bundle in "active" status
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page for the matching product
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
      And clicks on any element in the "my_active_removed_bundles_list" list with the "name" field that contains the "Day Pack unlimited" text
      And the "My Bundle Details" page is displayed
      And clicks on the "more_info.fup_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundle Details" page is displayed

  @jira.QANOV-420481 @android @ber @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182301
  @jira.link.parent_test_plan.QANOV-402198 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user can see the details of a recurrent pack in active status
    Active recurrent packs won't have any tag in "My bundles" screen.
    If the pack is cancellable ("can_be_unsubscribed" flag set to "true"), a "Remove pack" button will be displayed at
    the bottom of the screen.
    If the pack is in "cancelling-pending" status (active packs that the user has decides not to renew, they will be
    cancelled but they are still active), the cancellation date will be displayed.
    NOTE: finally, the renewal date will not be displayed for recurrent packs.
    Given user has any "mobile_line;dsl;cable:fiber" product in "active" status
      And user has a "recurrent" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "Bundle Management" page
     When clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
      And clicks on any element in the "my_active_removed_bundles_list" list with the "date" field that contains the "Autom. Verlängerung:" text
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Preis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_status.label" textfield with "Status" text is displayed
      And the "pack_status.value" textfield with "Aktiv" text is displayed
      And the "pack_details.title" textfield with "DETAILS" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "topup_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-225681 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-226691 @manual @mobile @o2de @smoke
  Scenario: A postpay user can see the details of a "Data automatic" pack in active status
    "Data automatic" is a special bundle that is active for some tariffs. You cannot activate it in the app, just
    deactivate it, so it will never appear in the list of pack offers.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "data_automatic" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the "data_automatic" bundle in the "my_active_removed_bundles_list" list
     Then the "Data Automatic Detail" page is displayed
      And the "Datenautomatik" header is displayed
      And the "data_automatic_title" textfield with "Datenautomatik" text is displayed
      And the "data_automatic_description" textfield with "Sobald du dein Datenvolumen aufgebraucht hast, stellen wir dir 3 zusätzliche Datenoptionen zur Verfügung. Die Abrechnung erfolgt über deine nächste Rechnung." text is displayed
      And the "data_automatic_packs_title" textfield with "AKTUELLER VERBRAUCH (OPTIONEN)" text is displayed
      And the "data_automatic_packs_list" list is displayed
      And the "data_automatic_packs_list" list has "3" elements
      And each element in the "data_automatic_packs_list" list has the "roundel" field
      And each element in the "data_automatic_packs_list" list has the "consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB) von 100 MB" format
      And each element in the "data_automatic_packs_list" list has the "price" textfield with the "\d+,\d{2} € / 100 MB" format
      And the "data_automatic_manage.header" textfield with "Datenautomatik desaktivieren" text is displayed
      And the "data_automatic_manage.description" textfield with "Hier kannst du die Datenautomatik unwiderruflich deaktivieren." text is displayed
      And the "data_automatic_manage.remove_pack_button" button with "Unwiderruflich deaktivieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-420482 @android @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182303 @jira.link.parent_test_plan.QANOV-402198
  @manual @mobile @o2de @smoke
  Scenario: A prepay user can see the details of a pack in "pending to activate" status
    The details screen for a pack in "pending to activate" status will display the same fields for both one-shot and
    recurrent packs.
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "any" bundle in "pending_activation" status
      And user has the "Bundles pending activation" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the "any" bundle in the "my_pending_activation_bundles_list" list
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Packpreis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_status.label" textfield with "Status" text is displayed
      And the "pack_status.value" textfield with "Guthaben-Aufladung nötig" text is displayed
      And the "pack_startdate.label" textfield is not displayed
      And the "pack_enddate.label" textfield is not displayed
      And the "pack_details.title" textfield with "DETAILS" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "topup_button" button with "Guthaben aufladen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-420483 @android @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182302 @jira.link.parent_test_plan.QANOV-402198
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user can see the details of a pack in "removed" status
    Details section with description will be displayed only when the API returns the field.
    Only recurrent packs can be in removed status.
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a "any" bundle in "removed" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the "removed" bundle in the "my_active_removed_bundles_list" list
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.label" textfield with "Preis" text is displayed
      And the "pack_price.sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_status.label" textfield with "Status" text is displayed
      And the "pack_status.value" textfield with "Deaktivierung beantragt" text is displayed
      And the "pack_startdate.label" textfield is not displayed
      And the "pack_enddate.label" textfield is not displayed
      And the "pack_deactivationdate.label" textfield with "Enddatum:" text is displayed
      And the "pack_deactivationdate.value" textfield with the "(0?[1-9]|[12][0-9]|3[01]). (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "pack_details.title" textfield with "DETAILS" text is displayed
      And the "pack_details.description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "topup_button" button is not displayed
      And the "remove_pack_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-420569 @android @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-420568 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A user can see the details of a value added service" (VAS)
    Some optional details can be displayed: start date (if active one-shot), end date (if active one-shot), deactivation date (if cancelled).
    Some optional buttons can be displayed: cancel (if cancellable).
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has a value added service
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the value added services in the "my_active_removed_bundles_list" list
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "vas_name_textfield" textfield is displayed
      And the "vas_price.label" textfield with "Preis" text is displayed
      And the "vas_price.sublabel" textfield with "(inkl. MwSt.)" text is displayed
      And the "vas_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "vas_status.label" textfield with "Status" text is displayed
      And the "vas_status.value" textfield is displayed
      And the "vas_details.title" textfield with "DETAILS" text is displayed
      And the "vas_details.description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-420484 @android @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420480
  @jira.link.depends_on.QANOV-420481 @jira.link.depends_on.QANOV-420482 @jira.link.depends_on.QANOV-420483
  @jira.link.depends_on.QANOV-424761 @jira.link.parent_test_plan.QANOV-402198 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario: A user can access to the "Product information sheet" OB webview from the My Bundle Details screen
    OB webview: https://o2.de/produktinformationsblatt?utm_source=native&utm_medium=nf_app_novum&utm_campaign=pp_produktinformationsblatt&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3App_produktinformationsblatt%7Cct%3Anavigation_service_information_tariff
    Given user has any "mobile_line;dsl;cable:fiber" product in "active" status
      And user has any "one-shot;recurrent" bundle in "any" status
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundle Details" page
     When clicks on the "product_information_sheet_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Produktinformationsblätter" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundle Details" page is displayed

  @jira.QANOV-267378 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182306 @jira.link.depends_on.QANOV-182307
  @jira.link.depends_on.QANOV-182308 @jira.link.depends_on.QANOV-182309 @jira.link.depends_on.QANOV-420480
  @jira.link.depends_on.QANOV-420481 @jira.link.depends_on.QANOV-420482 @jira.link.depends_on.QANOV-420483 @manual @mobile
  @o2de @regression
  Scenario: A user who has a pack with two different details zones can see the details divided by zones in the "My Bundle Details" screen
    Given user has a "mobile_line" product in "active" status
      And user has a bundle with two different details zones
      And user has the matching subscription selected in the account
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the bundle with two different details zones
     Then the "My Bundle Details" page is displayed
      And the "pack_details.title" textfield with "DETAILS" text is displayed
      And the "pack_details.subtitle_zone1" textfield that contains the "Konditionen in Weltzone" text is displayed
      And the "pack_details.description_zone1" textfield is displayed
      And the "pack_details.subtitle_zone2" textfield that contains the "Konditionen in Weltzone" text is displayed
      And the "pack_details.description_zone2" textfield is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182299
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @smoke
  Scenario Outline: A <account_type> user with a cancellable pack in <bundle_status> status can see a "remove pack" button in the "Pack details" screen
    Cancellable bundles will have the "can_be_unsubscribed" flag set to "true".
    Recurrent packs in active or pending activation status that are not included in the tariff will be cancellable ("can_be_unsubscribed" flag = true).
    One-shot pack in pending activation status will be cancellable ("can_be_unsubscribed" flag = true).
    Data Automatic pack will be cancellable ("can_be_unsubscribed" flag = true).
    One-shot packs in active status won't be cancellable, as you already paid for it ("can_be_unsubscribed" flag = false).
    One-shot pack in pending activation status will not be cancellable ("can_be_unsubscribed" flag = false).
    Given user has a "<account_type>" account type
      And user has any "<product_type>" product in "active" status
      And user has a "cancellable" bundle in "<bundle_status>" status
      And user has the matching subscription selected in the account
      And user has the "<bundle_cfg>" module configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the "cancellable" bundle in the "<bundle_list>" list
     Then the "My Bundle Details" page is displayed
      And the "Options-Details" header is displayed
      And the "remove_pack_button" button with "Option abbestellen" text is displayed

    Examples:
          | account_type | product_type                | bundle_status      | bundle_cfg                               | bundle_list                        | parent_test_plan | jira_id      |
          | prepay       | mobile_line                 | pending_activation | Bundles in use;Bundle pending activation | my_pending_activation_bundles_list |                  | QANOV-261392 |
          | prepay       | mobile_line                 | active             | Bundles in use;Bundle pending activation | my_active_removed_bundles_list     |                  | QANOV-261393 |
          | postpay      | mobile_line;dsl;cable;fiber | active             | Bundles in use                           | my_active_removed_bundles_list     | QANOV-437471     | QANOV-261394 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @regression
  Scenario Outline: A <account_type> user can access to remove a pack already purchased: a confirmation popup is displayed
    Cancellable bundles will have the "can_be_unsubscribed" flag set to "true".
    Recurrent packs in active or pending activation status that are not included in the tariff will be cancellable ("can_be_unsubscribed" flag = true).
    One-shot pack in pending activation status will be cancellable ("can_be_unsubscribed" flag = true).
    Data Automatic pack will be cancellable ("can_be_unsubscribed" flag = true).
    One-shot packs in active status won't be cancellable, as you already paid for it ("can_be_unsubscribed" flag = false).
    One-shot pack in pending activation status will not be cancellable ("can_be_unsubscribed" flag = false).
    Given user has a "<account_type>" account type
      And user has any "<product_type>" product in "active" status
      And user has a cancellable "<bundle_type>" bundle in "<bundle_status>" status
      And user has the matching subscription selected in the account
      And user has the "<bundle_cfg>" modules configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the "<bundle_selected>" bundle in the "<bundle_list>" list
      And the "<page>" page is displayed
      And clicks on the "remove_pack_button" button
     Then the "Bundle Remove Confirmation" popup is displayed
      And the "popup.title" textfield with the "<title>" format is displayed
      And the "popup.message" textfield with "<message>" text is displayed
      And the "popup.accept" button with "<accept>" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | account_type | product_type                | bundle_type    | bundle_status      | bundle_cfg                               | bundle_selected  | bundle_list                        | page                  | title              | message                                                    | accept           | depends_on                | parent_test_plan | jira_id      |
          | prepay       | mobile_line                 | recurrent      | active             | Bundles in use;Bundle pending activation | active-recurrent | my_active_removed_bundles_list     | My Bundle Details     | Hinweis            | Du bist dabei, die ausgewählte Option abzubestellen.       | (WEITER\|Weiter) | QANOV-182307:QANOV-420480 |                  | QANOV-182310 |
          | prepay       | mobile_line                 | recurrent      | pending_activation | Bundles in use;Bundle pending activation | any              | my_pending_activation_bundles_list | My Bundle Details     | Hinweis            | Du bist dabei, die ausgewählte Option abzubestellen.       | (WEITER\|Weiter) | QANOV-182308:QANOV-420482 |                  | QANOV-182311 |
          | postpay      | mobile_line;dsl;cable;fiber | recurrent      | active             | Bundles in use                           | active-recurrent | my_active_removed_bundles_list     | My Bundle Details     | Hinweis            | Du bist dabei, die ausgewählte Option abzubestellen.       | (WEITER\|Weiter) | QANOV-182307:QANOV-420480 | QANOV-437471     | QANOV-182312 |
          | postpay      | mobile_line                 | data_automatic | active             | Bundles in use                           | data_automatic   | my_active_removed_bundles_list     | Data Automatic Detail | Option abbestellen | Bist du sicher, dass du diese Option abbestellen möchtest? | (OK\|Ok)         | QANOV-225681              |                  | QANOV-44478  |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @regression
  Scenario Outline: A <account_type> user can cancel to remove a pack already purchased
    Given user has a "<account_type>" account type
      And user has any "<product_type>" product in "active" status
      And user has a cancellable "<bundle_type>" bundle in "<bundle_status>" status
      And user has the matching subscription selected in the account
      And user has the "<bundle_cfg>" modules configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user is in the "My Bundles" page
     When clicks on the "<bundle_selected>" bundle in the "<bundle_list>" list
      And the "<page>" page is displayed
      And clicks on the "remove_pack_button" button
      And the "Bundle Remove Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "<page>" page is displayed

    Examples:
          | account_type | product_type                | bundle_type    | bundle_status      | bundle_cfg                               | bundle_selected  | bundle_list                        | page                  | depends_on   | parent_test_plan | jira_id      |
          | prepay       | mobile_line                 | recurrent      | active             | Bundles in use;Bundle pending activation | active-recurrent | my_active_removed_bundles_list     | My Bundle Details     | QANOV-182310 |                  | QANOV-182314 |
          | prepay       | mobile_line                 | recurrent      | pending_activation | Bundles in use;Bundle pending activation | any              | my_pending_activation_bundles_list | My Bundle Details     | QANOV-182311 |                  | QANOV-182315 |
          | postpay      | mobile_line;dsl;cable;fiber | recurrent      | active             | Bundles in use                           | active-recurrent | my_active_removed_bundles_list     | My Bundle Details     | QANOV-182312 | QANOV-437471     | QANOV-182313 |
          | postpay      | mobile_line                 | data_automatic | active             | Bundles in use                           | data_automatic   | my_active_removed_bundles_list     | Data Automatic Detail | QANOV-44478  |                  | QANOV-202628 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  Scenario Outline: A <account_type> user can confirm to remove a <bundle_type> pack in <bundle_status> status: pack removed successfully
    Given user has a "<account_type>" account type
      And user has any "<product_type>" product in "active" status
      And user has a cancellable <bundle_type> bundle in "<bundle_status>" status
      And user has the matching subscription selected in the account
      And user has the "<bundle_cfg>" modules configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user has the "Bundle Remove Success Feedback" module configured in CMS for "Bundle Remove Success Feedback" page
      And user is in the "My Bundles" page
     When clicks on any element in the "<bundle_list>" list with the "<list_field>" field that contains the "<field_text>" text
      And the "<page>" page is displayed
      And clicks on the "remove_pack_button" button
      And the "Bundle Remove Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank. Deine Option wird abbestellt." text is displayed
      And the "message" textfield with "Trotz Abbestellung kannst du die Option bis zum Ende des Rechnungsmonats weiternutzen." text is displayed
      And the "main_button" button with "Zurück zu den Optionen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

    Examples:
          | account_type | product_type                | bundle_type    | bundle_status      | bundle_cfg                               | bundle_list                        | list_field | field_text           | page                  | test_priority | ber | depends_on   | parent_test_plan | jira_id      |
          | prepay       | mobile_line                 | recurrent      | active             | Bundles in use;Bundle pending activation | my_active_removed_bundles_list     | date       | Autom. Verlängerung: | My Bundle Details     | regression    |     | QANOV-182310 |                  | QANOV-182316 |
          | prepay       | mobile_line                 | recurrent      | pending_activation | Bundles in use;Bundle pending activation | my_pending_activation_bundles_list | status_tag | Wartet auf Aufladung | My Bundle Details     | smoke         |     | QANOV-182311 |                  | QANOV-182317 |
          | postpay      | mobile_line;dsl;cable;fiber | recurrent      | active             | Bundles in use                           | my_active_removed_bundles_list     | date       | Autom. Verlängerung: | My Bundle Details     | smoke         | ber | QANOV-182312 | QANOV-437471     | QANOV-206673 |
          | postpay      | mobile_line                 | data_automatic | active             | Bundles in use                           | my_active_removed_bundles_list     | status_tag | Pay per use          | Data Automatic Detail | regression    |     | QANOV-44478  |                  | QANOV-202629 |

  @jira.QANOV-420570 @android @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-420569 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario: A user can remove a value added service: product removed successfully
    Given user has any "mobile_line;dsl;cable:fiber" product in "active" status
      And user has a cancellable value added service
      And user has the matching subscription selected in the account
      And user has the "Bundles in use" modules configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user has the "Bundle Remove Success Feedback" module configured in CMS for "Bundle Remove Success Feedback" page
      And user is in the "My Bundles" page
     When clicks on the cancellable value added services in the "my_active_removed_bundles_list" list
      And the "My Bundle Details" page is displayed
      And clicks on the "remove_pack_button" button
      And the "Bundle Remove Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank. Deine Option wird abbestellt." text is displayed
      And the "message" textfield with "Trotz Abbestellung kannst du die Option bis zum Ende des Rechnungsmonats weiternutzen." text is displayed
      And the "main_button" button with "Zurück zu den Optionen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Bundles" page is displayed

  @jira.QANOV-182318 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182316 @jira.link.depends_on.QANOV-182317
  @jira.link.depends_on.QANOV-202629 @jira.link.depends_on.QANOV-206673 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario: A user who has removed a pack successfully can tap on the "Back to my bundles" button in the Success Feedback screen
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundle Remove Success Feedback" module configured in CMS for "Bundle Remove Success Feedback" page
      And user is in the "Bundle Remove Success Feedback" page
     When clicks on the "main_button" button
     Then the "My Bundles" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @o2de @regression
  Scenario Outline: A <account_type> user confirms to remove a pack already purchased but an error happens: pack removed unsuccessfully
    This feedback screen won't be a MODAL screen, so it will not have a "close" button in the header.
    Given user has a "<account_type>" account type
      And user has any "<product_type>" product in "active" status
      And user has a "<bundle_type>" bundle in "<bundle_status>" status
      And user has the matching subscription selected in the account
      And user has the "<bundle_cfg>" modules configured in CMS for "My Bundles" page
      And user has the "Bundle details" module configured in CMS for "My Bundle Details" page
      And user has the "Bundle Remove Error Feedback" module configured in CMS for "Bundle Remove Error Feedback" page
      And user is in the "My Bundles" page
     When clicks on the "<bundle_selected>" bundle in the "<bundle_list>" list
      And the "<page>" page is displayed
      And clicks on the "remove_pack_button" button
      And the "Bundle Remove Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And there is an error removing the bundle
     Then the "Bundle Remove Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Die Option konnte nicht abbestellt werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "try_again_later_button" button with "Nochmal versuchen" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

    Examples:
          | account_type | product_type                | bundle_type    | bundle_status      | bundle_cfg                               | bundle_selected  | bundle_list                        | page                  | depends_on   | parent_test_plan | jira_id      |
          | prepay       | mobile_line                 | recurrent      | active             | Bundles in use;Bundle pending activation | active-recurrent | my_active_removed_bundles_list     | My Bundle Details     | QANOV-182310 |                  | QANOV-182321 |
          | prepay       | mobile_line                 | any            | pending_activation | Bundles in use;Bundle pending activation | any              | my_pending_activation_bundles_list | My Bundle Details     | QANOV-182311 |                  | QANOV-182322 |
          | postpay      | mobile_line;dsl;cable;fiber | recurrent      | active             | Bundles in use                           | active-recurrent | my_active_removed_bundles_list     | My Bundle Details     | QANOV-182312 | QANOV-437471     | QANOV-206674 |
          | postpay      | mobile_line                 | data_automatic | active             | Bundles in use                           | data_automatic   | my_active_removed_bundles_list     | Data Automatic Detail | QANOV-44478  |                  | QANOV-202632 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-182321 @jira.link.depends_on.QANOV-182322
  @jira.link.depends_on.QANOV-202632 @jira.link.depends_on.QANOV-206674 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario Outline: A user who has removed a pack unsuccessfully can tap on the "<button_name>" button in the Error Feedback screen
    Given user has any "mobile_line;dsl;cable;fiber" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Bundle Remove Error Feedback" module configured in CMS for "Bundle Remove Error Feedback" page
      And user is in the "Bundle Remove Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed
      And the "<destination_header>" header is displayed

    Examples:
          | button_name       | button_id                | destination_page | destination_header | jira_id      |
          | Try again later   | try_again_later_button   | My Bundles       | Gebuchte Optionen  | QANOV-182323 |
          | Back to dashboard | back_to_dashboard_button | Account          | Vertrag            | QANOV-182324 |

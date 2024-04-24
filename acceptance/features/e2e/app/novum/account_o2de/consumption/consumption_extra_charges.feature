# -*- coding: utf-8 -*-
@jira.QANOV-194068
Feature: Consumption Extra Charges

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.QANOV-44486 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-421952 @live @mobile
  @next @o2de @qa @sanity @webapp
  Scenario: Postpay user without international data extra consumption can see the "International data extra consumption" module in the "Mobile Line Consumption" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product without "international_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "tabs" module configured in CMS for "usage" page
      And user has the "extra-data-consumption-double-panel" module configured in CMS for "data-roaming" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "outside_eu" tab is selected
      And the "extra_consumption" module is displayed
      And the "extra_consumption.title" textfield with "Zusätzlich verbrauchtes Datenvolumen" text is displayed
      And the "extra_consumption.value" textfield with "0 MB" text is displayed
      And the "extra_consumption.value" textfield is displayed in "black" color

  @jira.QANOV-44487 @android @automatic @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-421952 @mobile @o2de @qa
  @regression @webapp
  Scenario: Postpay user with international data extra consumption can see the "International data extra consumption" module in the "Mobile Line Consumption" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product with "international_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "tabs" module configured in CMS for "usage" page
      And user has the "extra-data-consumption-double-panel" module configured in CMS for "data-roaming" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "outside_eu" tab is selected
      And the "extra_consumption" module is displayed
      And the "extra_consumption.title" textfield with "Zusätzlich verbrauchtes Datenvolumen" text is displayed
      And the "extra_consumption.value" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "extra_consumption.value" textfield is displayed in "red" color

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user <with_eu_data_extra> EU data extra consumption can see the "eu data extra consumption" module in the "Mobile Line Consumption" screen
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has a "mobile_line" product <with_eu_data_extra> "eu_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "eu" tab
     Then the "extra_consumption" module is displayed
      And the "eu_data_consumed.data_title" textfield with "Total data used EU" text is displayed
      And the "eu_data_consumed.data_amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "extra_consumption.data_amount" textfield is displayed in "<color>" color

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | with_eu_data_extra | color | jira_id      |
          | unlimited   | with            | has not                  | without            | black | QANOV-424743 |
          | unlimited   | with            | has not                  | with               | red   | QANOV-424744 |
          | limited     | without         | has                      | without            | black | QANOV-424745 |
          | limited     | without         | has                      | with               | red   | QANOV-424746 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-421952
  @jira.link.parent_test_plan.QANOV-620950 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user <with_eu_data_extra> EU data extra consumption can see the "eu data extra amount" module in the "Mobile Line Consumption" screen
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has a "mobile_line" product <with_eu_data_extra> "eu_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "Consumption header;Consumption Details" modules configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "eu" tab
     Then the "extra_amount" module is displayed
      And the "extra_amount.data_title" textfield with "Extra amount" text is displayed
      And the "extra_amount.data_amount" textfield with the "\d+(\,\d{1,2})? €" format is displayed
      And the "extra_amount.data_amount" textfield is displayed in "<color>" color

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | with_eu_data_extra | color | jira_id      |
          | unlimited   | with            | has not                  | without            | black | QANOV-621107 |
          | unlimited   | with            | has not                  | with               | red   | QANOV-621108 |
          | limited     | without         | has                      | without            | black | QANOV-621109 |
          | limited     | without         | has                      | with               | red   | QANOV-621110 |

  @jira.QANOV-44488 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44486
  @jira.link.depends_on.QANOV-44487 @jira.link.parent_test_plan.QANOV-421952 @live @mobile @next @o2de @qa @smoke @webapp
  Scenario: Postpay user can access to the "extra international data usage" screen from the "outside EU" tab in "Mobile Line Consumption" screen
    The zone list will be display following the next order: first zone 2, second zone 3, third zone 4, ...
    Given user has a "postpay" account type
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "tabs" module configured in CMS for "usage" page
      And user has the "extra-data-consumption-double-panel" module configured in CMS for "data-roaming" page
      And user has the "simple-header,roaming-usage-per-zone,services-summary" module configured in CMS for "extra-international-data-usage" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
      And clicks on the "extra_consumption" module
     Then the "Extra International Data Usage" page is displayed
      And the "Datenverbrauch International" header is displayed
      And the "header.title" textfield with "Daten Roaming" text is displayed
      And the "header.subtitle" textfield with "Schalte die Roaming Funktion deines Handys aus, um ungewollte Roaming-Kosten zu vermeiden" text is displayed
      And the "zones_price_list_entrypoint" entrypoint with "Preise im Ausland" text is displayed
      And the "roaming_usage.module_title" textfield with "DATENVERBRAUCH NACH WELTZONE" text is displayed
      And the "roaming_usage.bundle_list" list is displayed
      And each element in the "roaming_usage.bundle_list" list has the "icon" field
      And each element in the "roaming_usage.bundle_list" list has the "title" textfield with the "Du hast \d+(\,\d{1,2})? (MB|GB) verbraucht" format
      And each element in the "roaming_usage.bundle_list" list has the "subtitle" textfield with the "(Weltzone \d+|Roaming EU)" format
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Mobile Line Consumption" page is displayed
      And the "outside_eu" tab is selected

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-421952
  @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can access to the "extra international data usage" screen from the EU tab in "Mobile Line Consumption" screen
    Only postpay users with FUP can see the EU tab in the Consumption screen.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    The zone list will be display following the next order: first zone 2, second zone 3, third zone 4, ...
    EU roundel and tab should always be displayed, even if there is no consumption.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user has the "International extra data usage" module configured in CMS for "Extra International Data Usage" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "eu" tab
      And clicks on the "extra_consumption" module
     Then the "Extra International Data Usage" page is displayed
      And the "Datenverbrauch International" header is displayed
      And the "international_extra_data_title" textfield with "Daten Roaming" text is displayed
      And the "international_extra_data_message" textfield with "Schalte die Roaming Funktion deines Handys aus, um ungewollte Roaming-Kosten zu vermeiden" text is displayed
      And the "zones_price_list_entrypoint" entrypoint with "Preise im Ausland" text is displayed
      And the "roaming_usage_per_zone_title" textfield with "DATENVERBRAUCH NACH WELTZONE" text is displayed
      And the "roaming_usage_per_zone_list" list is displayed
      And each element in the "roaming_usage_per_zone_list" list has the "icon" field
      And each element in the "roaming_usage_per_zone_list" list has the "consumption" textfield with the "Du hast \d+(\,\d{1,2})? (MB|GB) verbraucht" format
      And each element in the "roaming_usage_per_zone_list" list has the "zone" textfield with the "(Weltzone \d+|Roaming EU)" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Consumption" page is displayed
      And the "eu" tab is selected

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | depends_on                | jira_id      |
          | unlimited   | with            | has not                  | QANOV-424743:QANOV-424744 | QANOV-424749 |
          | limited     | without         | has                      | QANOV-424745:QANOV-424746 | QANOV-424750 |

  @jira.QANOV-194070 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-424749 @jira.link.depends_on.QANOV-424750
  @jira.link.depends_on.QANOV-44488 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: Postpay user can access to the "Zone price list" screen from the "Extra International Data Usage" screen
    This flow will allow the user to see the roaming prices associated to his/her tariff. The complete flow will be
    defined in the plan_details feature of the dashboard folder.
    Given user has a "postpay" account type
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "International extra data usage" module configured in CMS for "Extra International Data Usage" page
      And user has the "Zone Price List Select Country" module configured in CMS for "Zone Price List Select Country" page
      And user is in the "Extra International Data Usage" page
     When clicks on the "zones_price_list_entrypoint" entrypoint
     Then the "Zone Price List Select Country" page is displayed
      And the "Preise im Ausland" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra International Data Usage" page is displayed

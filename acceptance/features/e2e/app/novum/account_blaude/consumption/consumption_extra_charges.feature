# -*- coding: utf-8 -*-
@jira.QANOV-202613 @raitt_drop1
Feature: Consumption Extra Charges

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "Multiple tabs" module configured in CMS for "Mobile Line Consumption" page


  @jira.QANOV-202614 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @live @mobile @next @regression @webapp
  Scenario: Postpay user without international data extra consumption can see the "International data extra consumption" module in the "Mobile Line Consumption" screen
    Given user has "international_data" allowances in the "mobile_line" product
      And user has a "mobile_line" product without "international_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "outside_eu" tab is selected
      And the "extra_consumption" module is displayed
      And the "extra_consumption.title" textfield with "Zusätzlich verbrauchtes Datenvolumen" text is displayed
      And the "extra_consumption.value" textfield with "0 MB" text is displayed
      And the "extra_consumption.value" textfield is displayed in "black" color

  @jira.QANOV-202615 @android @blaude @ios @jira.cv.13.9 @jira.link.detects.OBO2DE-203 @manual @mobile @smoke
  Scenario: Postpay user with international data extra consumption can see the "International data extra consumption" module in the "Mobile Line Consumption" screen
    Given user has "international_data" allowances in the "mobile_line" product
      And user has a "mobile_line" product with "international_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
     Then the "outside_eu" tab is selected
      And the "extra_consumption" module is displayed
      And the "extra_consumption.title" textfield with "Zusätzlich verbrauchtes Datenvolumen" text is displayed
      And the "extra_consumption.value" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "extra_consumption.value" textfield is displayed in "blue" color

  @jira.QANOV-202617 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202614
  @jira.link.depends_on.QANOV-202615 @mobile @qa @smoke @webapp
  Scenario: Postpay user can access to the "extra international data usage" screen from the "Mobile Line Consumption" screen
    The zone list will be display following the next order: first zone 2, second zone 3, third zone 4, ...
    Given user has "international_data" allowances in the "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "Consumption Details" module configured in CMS for "Mobile Line Consumption" page
      And user has the "services-summary" module configured in CMS for "extra-international-data-usage" page
      And user has the "roaming-usage-per-zone" module configured in CMS for "extra-international-data-usage" page
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
      And waits until the "extra_consumption.link" element is clickable
      And clicks on the "extra_consumption.link" module
     Then the "Extra International Data Usage" page is displayed
      And the "Datenverbrauch International" header is displayed
      And the "header.title" textfield with "Daten Roaming" text is displayed
      And the "header.subtitle" textfield with "Schalte die Roaming Funktion deines Handys aus, um ungewollte Roaming-Kosten zu vermeiden" text is displayed
      And the "zones_price_list_entrypoint" entrypoint with "Preise im Ausland" text is displayed
      And the "roaming_usage.module_title" textfield with "DATENVERBRAUCH NACH WELTZONE" text is displayed
      And the "roaming_usage.bundle_list" list is displayed
      And each element in the "roaming_usage.bundle_list" list has the "icon" field
      And each element in the "roaming_usage.bundle_list" list has the "title" textfield with the "Du hast \d+(\,\d{1,2})? (MB|GB) verbraucht" format
      And each element in the "roaming_usage.bundle_list" list has the "subtitle" textfield with the "Weltzone \d+" format
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Mobile Line Consumption" page is displayed
      And the "outside_eu" tab is selected

  @jira.QANOV-202618 @android @automatic @blaude @cert3 @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-202616
  @jira.link.depends_on.QANOV-202617 @jira.link.detects.O2DE-2189 @live @mobile @next @smoke
  Scenario: Postpay user can access to the "Zone price list" screen from the "Extra International Data Usage" screen
    This flow will allow the user to see the roaming prices associated to his/her tariff. The complete flow will be
    defined in the plan_details feature of the dashboard folder.
    Given user has "international_data" allowances in the "mobile_line" product
      And user has not the "SUBSCRIPTION_ROAMING" forbidden use case
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "extra-international-data-usage" page
      And user has the "roaming-usage-per-zone" module configured in CMS for "extra-international-data-usage" page
      And user is in the "Mobile Line Consumption" page
      And clicks on the "outside_eu" tab
      And clicks on the "extra_consumption.link" module
      And the "Extra International Data Usage" page is displayed
     When clicks on the "zones_price_list_entrypoint" entrypoint
     Then the "Zone Price List Select Country" page is displayed
      And the "Preise im Ausland" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra International Data Usage" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Consumption" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

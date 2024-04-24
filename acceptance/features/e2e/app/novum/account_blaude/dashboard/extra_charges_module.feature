# -*- coding: utf-8 -*-
@jira.QANOV-203233
Feature: Extra charges module

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.QANOV-203234 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user who hasn't consumed all his/her "national + EU" data allowance won't see any extra data module
    Given user has a "postpay" account type
      And user has consumed "<100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Inland and EU throttling;Data automatic" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "inland_eu_throttling" module is not displayed
      And the "data_automatic" module is not displayed

  @jira.QANOV-203236 @TBD @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user who hasn't consumed all his/her "international" data allowance won't see any extra data module
    Given user has a "postpay" account type
      And user has consumed "<100%" of the "international_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "International extra data;International throttling" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "international_extra_data" module is not displayed
      And the "international_throttling" module is not displayed

  @jira.QANOV-203238 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @jira.link.detects.OBO2DE-130
  @automatic @mobile @sanity @ber @qa @webapp @raitt_drop1
  Scenario: Postpay user without data automatic will see the throttling module when finishing his/her "national + EU" data allowance
    Given user has a "postpay" account type
      And user has not a data automatic bundle
      And user has consumed "100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Inland and EU throttling" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "inland_eu_throttling" module is displayed
      And the "inland_eu_throttling.icon" icon is displayed
      And the "inland_eu_throttling.title" textfield with the "\d+(\,\d{1,2})? (MB|GB) zusätzlich verbraucht" format is displayed
      And the "inland_eu_throttling.subtitle" textfield with "Datenvolumen gedrosselt" text is displayed

  @jira.QANOV-203240 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @automatic @mobile @sanity
  @ber @qa @webapp @raitt_drop1
  Scenario: Postpay user without international bundle will see the extra data module when consuming data abroad
    If a user consumes data outside his/her international pack, the extra data module will appear
    (pay as you go). When the user reaches the maximum amount billed for 'pay as you go', the throttling module will
    appear. For international data, only the 'classic' throttling (roaming) will be available.
    If user has extra international data for more than one roaming zone, the 'Roaming' label is displayed. If
    user has extra international data for just one roaming zone, the 'Romaing Weltzone X' label is displayed.
    The international data throttling and the national data throttling module can be displayed and will be same.
    Given user has a "postpay" account type
      And user has not purchased international data bundles
      And user has a "mobile_line" product with "international_data" extra charges
      And user has not reached the maximum amount billed for pay as you go international data
      And user has the matching subscription selected in the account
      And user has the "International extra data" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "international_extra_data.entrypoint_list" list is displayed
      And each item in the "international_extra_data.entrypoint_list" list has the "icon" field
      And each element in the "international_extra_data.entrypoint_list" list has the "title" textfield with the "Du hast \d+(\,\d{1,2})? (MB|GB) verbraucht" format
      And each element in the "international_extra_data.entrypoint_list" list has the "subtitle" textfield with the "(Roaming|Roaming Weltzone \d+)" format

  @jira.QANOV-203242 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user with international bundle will see the extra data module when finishing his/her "international" data allowance and consuming data abroad
    If a user consumes data outside his/her international pack, the extra data module will appear
    (pay as you go). When the user reaches the maximum amount billed for 'pay as you go', the throttling module will
    appear. For international data, only the 'classic' throttling (roaming) will be available.
    If user has extra international data for more than one roaming zone, the 'Roaming' label is displayed. If
    user has extra international data for just one roaming zone, the 'Romaing Weltzone X' label is displayed.
    Given user has a "postpay" account type
      And user has consumed "100%" of the "international_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has a "mobile_line" product with "international_data" extra charges
      And user has not reached the maximum amount billed for pay as you go international data
      And user has the "International extra data" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "international_extra_data" module is displayed
      And the "international_extra_data.icon" icon is displayed
      And the "international_extra_data.title" textfield with the "Du hast \d+(\,\d{1,2})? (MB|GB) verbraucht" format is displayed
      And the "international_extra_data.subtitle" textfield with the "(Roaming|Roaming Weltzone \d+)" format is displayed
      And the "international_throttling" module is not displayed

  @jira.QANOV-203244 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203240
  @jira.link.depends_on.QANOV-203242 @jira.link.detects.OBO2DE-149 @manual @mobile @regression
  Scenario: Postpay user with extra international data for just one roaming zone can see the "Romaing Weltzone X" text in the extra data module
    If a user consumes data outside his/her international pack, the extra data module will appear
    (pay as you go). When the user reaches the maximum amount billed for 'pay as you go', the throttling module will
    appear. For international data, only the 'classic' throttling (roaming) will be available.
    If user has extra international data for more than one roaming zone, the 'Roaming' label is displayed. If
    user has extra international data for just one roaming zone, the 'Romaing Weltzone X' label is displayed.
    Given user has a "postpay" account type
      And user has a "mobile_line" product with "international_data" extra charges for "1" zones
      And user has not reached the maximum amount billed for pay as you go international data
      And user has the matching subscription selected in the account
      And user has the "International extra data" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "international_extra_data" module is displayed
      And the "international_extra_data.subtitle" textfield with the "Roaming Weltzone \d+" format is displayed

  @jira.QANOV-203246 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203240
  @jira.link.depends_on.QANOV-203242 @manual @mobile @regression
  Scenario: Postpay user with extra international data for several roaming zones can see the "Roaming" text in the extra data module
    If a user consumes data outside his/her international pack, the extra data module will appear
    (pay as you go). When the user reaches the maximum amount billed for 'pay as you go', the throttling module will
    appear. For international data, only the 'classic' throttling (roaming) will be available.
    If user has extra international data for more than one roaming zone, the 'Roaming' label is displayed. If
    user has extra international data for just one roaming zone, the 'Romaing zone X' label is displayed.
    Given user has a "postpay" account type
      And user has a "mobile_line" product with "international_data" extra charges for "several" zones
      And user has not reached the maximum amount billed for pay as you go international data
      And user has the matching subscription selected in the account
      And user has the "International extra data" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "international_extra_data" module is displayed
      And the "international_extra_data.subtitle" textfield with "Roaming" text is displayed

  @jira.QANOV-203248 @TBD @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203240
  @jira.link.depends_on.QANOV-203242 @jira.link.detects.OBO2DE-152 @manual @mobile @regression @raitt_drop1
  Scenario: Postpay user will see the throttling module when reaching the maximum amount billed for "pay as you go" international data
    If a user consumes data outside his/her international pack, the extra data module will appear
    (pay as you go). When the user reaches the maximum amount billed for 'pay as you go', the throttling module will
    appear. For international data, only the 'classic' throttling (roaming) will be available.
    Given user has a "postpay" account type
      And user has reached the maximum amount billed for pay as you go international data
      And user has the matching subscription selected in the account
      And user has the "extra-data-consumption-counter-parts" modules configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "international_extra_data" module is displayed
      And the "international_throttling" module is displayed
      And the "international_throttling.icon" icon is displayed
      And the "international_throttling.consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB) zusätzlich verbraucht" format is displayed
      And the "international_throttling.type" textfield with "Datenvolumen gedrosselt" text is displayed

  @jira.QANOV-203250 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203240
  @jira.link.depends_on.QANOV-203242 @jira.link.detects.OBO2DE-144 @automatic @mobile @smoke @qa @webapp @raitt_drop1
  Scenario: Postpay user can access to the "extra international data usage" screen from the Account screen
    The zone list will be display following the next order: first zone 2, second zone 3, third zone 4, ...
    Given user has a "postpay" account type
      And user has a "mobile_line" product with "international_data" extra charges
      And user has the matching subscription selected in the account
      And user has the "extra-data-consumption-counter-parts" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     When clicks on the "chevron" button of "international_extra_data.entrypoint_list" list with "0" index
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
      And the "Account" page is displayed

  @jira.QANOV-203252 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @jira.link.detects.OBO2DE-136
  @automatic @mobile @sanity @ber @qa @webapp @raitt_drop1
  Scenario: Postpay user with data automatic will see the data automatic module when finishing his/her "national + EU" data allowance
    Given user has a "postpay" account type
      And user has a data automatic bundle
      And user has consumed "100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "data-automatic-counters" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "data_automatic" module is displayed
      And the "data_automatic.icon" icon is displayed
      And the "data_automatic.title" textfield with the "\d+(\,\d{1,2})? MB von \d+ MB" format is displayed
      And the "data_automatic.number_of_bundles" textfield with the "\((0|1|2|3) von 3\) \d+ MB Option" format is displayed
      And the "data_automatic.type" textfield with "Datenautomatik" text is displayed

  @jira.QANOV-203254 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203252 @manual @mobile @regression
  @raitt_drop1
  Scenario: Postpay user with "data automatic" consumption can see the bundle roundel in red
    This "Data automatic" roundel does not follow the same logic to select its color. As Data Automatic is always extra
    consumption with economic cost, the color will always be red, even with a 1%.
    Given user has a "postpay" account type
      And user has a data automatic bundle
      And user has consumed "100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has made consumption on the "data_automatic" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Data automatic" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "data_automatic" module is displayed
      And the "data_automatic.icon" bundle roundel is displayed in "red" colour

  @jira.QANOV-203256 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203252 @jira.link.detects.OBO2DE-139
  @manual @mobile @smoke @raitt_drop1
  Scenario: Postpay user can access to the "data automatic detail" screen from the "data automatic" module
    The complete flow to remove a "Data automatic" bundle is defined in services_transactions/bundle_management.
    Given user has a "postpay" account type
      And user has a data automatic bundle
      And user has consumed "100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has made consumption on the "data_automatic" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Data automatic" module configured in CMS for "Account" page
      And user has the "Data Automatic Detail" module configured in CMS for "Data Automatic Detail" page
      And user is in the "Account" page
     When clicks on the "data_automatic" module
     Then the "Data Automatic Detail" page is displayed
      And the "Datenautomatik" header is displayed
      And the "data_automatic_title" textfield with "Datenautomatik" text is displayed
      And the "data_automatic_description" textfield with "Sobald du dein Datenvolumen aufgebraucht hast, stellen wir dir 3 zusätzliche Datenoptionen zur Verfügung. Die Abrechnung erfolgt über deine nächste Rechnung." text is displayed
      And the "data_automatic_packs_title" textfield with "AKTUELLER VERBRAUCH (OPTIONEN)" text is displayed
      And the "data_automatic_packs_list" list is displayed
      And the "data_automatic_packs_list" list has "3" elements
      And each element in the "data_automatic_packs_list" list has the "roundel" field
      And each element in the "data_automatic_packs_list" list has the "consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB) von \d+ MB" format
      And each element in the "data_automatic_packs_list" list has the "price" textfield with the "\d+,\d{2} € / \d+ MB" format
      And the "data_automatic_manage.header" textfield with "Datenautomatik desaktivieren" text is displayed
      And the "data_automatic_manage.description" textfield with "Hier kannst du die Datenautomatik unwiderruflich deaktivieren." text is displayed
      And the "data_automatic_manage.remove_pack_button" button with "Unwiderruflich deaktivieren" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-203258 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203256
  @jira.link.depends_on.QANOV-225682 @manual @mobile @regression
  Scenario: Postpay user can see the data automatic consumption for each bundle in the "data automatic detail" screen
    Given user has a "postpay" account type
      And user has a data automatic bundle
      And user has consumed "100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has consumed "100%" of the "first" automatic data bundle
      And user has consumed "<100%" of the "second" automatic data bundle
      And user has the matching subscription selected in the account
      And user has the "Data Automatic Detail" module configured in CMS for "Data Automatic Detail" page
      And user is in the "Data Automatic Detail" page
     Then the element in "1" position of the "data_automatic_packs_list" list has a "roundel" field in "red" colour
      And the element in "2" position of the "data_automatic_packs_list" list has a "roundel" field in "blue" colour
      And the element in "3" position of the "data_automatic_packs_list" list has a "roundel" field in "gray" colour

  @jira.QANOV-203269 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203252 @jira.link.detects.OBO2DE-136
  @manual @mobile @regression
  Scenario: Postpay user who has consumed the 3 data automatic bundles will see the "throttling" module and the finished "data automatic" module
    Given user has a "postpay" account type
      And user has a data automatic bundle
      And user has consumed "100%" of the "inland_EU_data" allowance in the "mobile_line" product
      And user has consumed "100%" of the "third" automatic data bundle
      And user has the matching subscription selected in the account
      And user has the "Inland and EU throttling;Data automatic" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "inland_eu_throttling" module is displayed
      And the "data_automatic" module is displayed
      And the "data_automatic.title" textfield with the "300 MB von 300 MB" format is displayed
      And the "data_automatic.number_of_bundles" textfield with the "\(3 von 3\) 100 MB Option" format is displayed
      And the "data_automatic.type" textfield with "Daten automatisch" text is displayed
      And the "data_automatic.icon" bundle roundel is displayed in "red" colour

  @jira.QANOV-203271 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @jira.link.detects.OBO2DE-124
  @automatic @mobile @sanity @ber @cert3 @next @live @webapp @raitt_drop1
  Scenario: Postpay user can see the "MIN and SMS" extra consumption for a mobile line
    This module will display the Min usage outside flatrate and SMS usage outside flatrate.
    SMS and Min consumption are only displayed at a line level, not per SIM.
    Given user has a "postpay" account type
      And user has the matching subscription selected in the account
      And user has the "extra-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "extra_min_and_sms_consumption" module is displayed
      And the "extra_min_consumption.title" textfield with "Minuten außerhalb Flats" text is displayed
      And the "extra_min_consumption.value" textfield with the "\d+ Min" format is displayed
      And the "extra_sms_consumption.title" textfield with "SMS außerhalb Flats" text is displayed
      And the "extra_sms_consumption.value" textfield with the "\d+ SMS" format is displayed

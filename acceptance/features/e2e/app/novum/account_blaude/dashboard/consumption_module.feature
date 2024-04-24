# -*- coding: utf-8 -*-
@jira.QANOV-171321 @raitt_drop1
Feature: Consumption Module

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.QANOV-342295 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user without allowances roundels will see an empty-case in the consumption module
    Some postpay users (those with "Pay as you go" tariff and without packs purchased) don't have roundels in the account dashboard.
    For these users we have a smart action button in order to access the consumptions details.
    Primary button: manage bundle
    Secondary button: data usage
    Example: 01796809662 / wipro123, this user has a tariff called 'All-On' without any allowance.
    Given user has a "postpay" account type
      And user has no allowances in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is not displayed
      And the "no_consumption_title_textfield" textfield with "Noch kein Verbrauch" text is displayed
      And the "no_consumption_description_textfield" textfield with "Hier wird dein folgender Verbrauch angezeigt." text is displayed
      And the "data_usage_button" button with "Datenverbrauch anzeigen" text is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed

  @jira.QANOV-202589 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548
  @jira.link.detects.OBO2DE-70 @live @mobile @next @sanity @webapp
  Scenario: Postpay user with allowances roundels can see a carousel of data allowances for the mobile line product
    Only data roundels will be displayed, as Minutes and SMS are unlimited.
    There will be one data counter for domestic data (Inland & EU) and one data counter for each of the
    roaming zones data packs purchased (if no international bundle is purchased, no roundel will be shown).
    NOTE: the OB has requested to hide the 'Roaming Weltzone 3-4' roundel (then, we will use the 'hidden' tag for the
    'Roaming Weltzone 3-4' pack).
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "mobile_allowances.list" carousel is displayed
      And each element in the "mobile_allowances.list" carousel has the "roundel_text_consumption" field
      And each roundel in the "mobile_allowances.list" carousel has the "category_name" field
      And each roundel in the "mobile_allowances.list" carousel has the "expiration_date" textfield with the "^(Wird verlängert am:|Läuft Ende) (0?[1-9]|[12][0-9]|3[01]). (Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) (- \d+ Tag|- \d+ Tage|aus)$" format
      And only data allowance roundels are displayed in the "mobile_allowances.list" carousel
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed

  @jira.QANOV-202591 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @live
  @mobile @next @smoke @webapp
  Scenario: Postpay user can see the "Inland & EU" allowance roundel for the mobile line product
    Each roundel can show an expiration date under the category name (API provided).
    There're no unlimited data allowances in Blau.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "inland_eu_data_roundel" element is on display
      And the "inland_eu_data_roundel_consumption.roundel_text_title" textfield with the "Verbraucht" format is displayed
      And the "inland_eu_data_roundel_consumption.roundel_text_consumption" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "inland_eu_data_roundel_consumption.roundel_text_maximum_consumption" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "category_name" textfield with "Daten Inland & EU" text is displayed

  @jira.QANOV-202597 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @smoke
  Scenario: Postpay user with an international bundle purchased can see the international allowance roundel for the mobile line product
    There will be a data roundel for each of the roaming zones data packs purchased.
    NOTE: the OB has requested to hide the 'Roaming Weltzone 3-4' roundel (then, we will use the 'hidden' tag for the
    'Roaming Weltzone 3-4' pack).
    Each roundel can show an expiration date under the category name (API provided).
    Given user has a "postpay" account type
      And user has purchased "any" international data bundles
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "international_data_roundel" allowance roundel is displayed
      And the "international_data_roundel.consumption" textfield with the "Verbraucht \d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "international_data_roundel.category_name" textfield that contains the "Roaming Weltzone" text is displayed

  @jira.QANOV-202601 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user with several data allowances for a mobile line can swipe among them
    Given user has a "postpay" account type
      And user has several data allowances
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel can be swiped in "left" direction
      And the "mobile_allowances" carousel can be swiped in "right" direction

  @jira.QANOV-202605 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @live
  @mobile @next @smoke @webapp
  Scenario: Postpay user who has consumed less than 100% can see the roundel in blue
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "data_roundel_color" allowance roundel is displayed in "blue" colour

  @jira.QANOV-202609 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202548 @manual @mobile @regression
  Scenario: Postpay user who has consumed 100% of his/her limited mobile data allowance can see the roundel in red
    Given user has a "postpay" account type
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "data_roundel" allowance roundel is displayed in "red" colour

  @jira.QANOV-183129 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312 @manual @mobile @regression
  Scenario: Prepay user without allowances will se an empty-case in the consumption module
    Some prepay users (those with a 9 Ct. tariff) don't have roundels in the account dashboard. For these users we
    have a smart action button in order to access the consumptions details.
    Primary button: manage bundle
    Secondary button: data usage
    Given user has a "prepay" account type
      And user has no allowances in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is not displayed
      And the "no_consumption_title_textfield" textfield with "Noch kein Verbrauch" text is displayed
      And the "no_consumption_description_textfield" textfield with "Hier wird dein folgender Verbrauch angezeigt." text is displayed
      And the "data_usage_button" button with "Datenverbrauch anzeigen" text is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed

  @jira.QANOV-171322 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171312 @live
  @mobile @next @sanity @webapp
  Scenario: Prepay user with allowances can see a carousel of allowances in the consumption module
    The number of allowance roundels is unlimited. The user can have data, minutes, messages and units allowances
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    Given user has a "prepay" account type
      And user has "any" allowances in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "mobile_allowances.list" carousel is displayed
      And each element in the "mobile_allowances.list" carousel has the "roundel_text_consumption" field
      And each roundel in the "mobile_allowances.list" carousel has the "category_name" field
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed

  @jira.<jira_id> @<ber> @<execution_mode> @android @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171322
  @live @mobile @next @smoke @webapp
  Scenario Outline: A <stack> prepay user can see the consumption of a limited <allowance_type> allowance for the mobile line product
    The consumption will represent the sum of all 'active' packs (pending activation packs are not included).
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    User with units: 015731700820 / #brt12345678
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel" element is on display
      And the "<allowance_type>_roundel_consumption.title" textfield with the "Verbraucht" format is displayed
      And the "<allowance_type>_roundel_consumption.amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB|Min|SMS|Einheiten)" format is displayed
      And the "<allowance_type>_roundel_consumption.subtitle" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB|min|SMS|Einheiten)" format is displayed
      And the "category_name" textfield is displayed

    Examples:
          | stack | allowance_type | ber | execution_mode | jira_id      |
          | any   | data           | ber | automatic      | QANOV-171323 |
          | box7  | minutes        |     | manual         | QANOV-171324 |
          | box7  | messages       |     | manual         | QANOV-171325 |
          | box7  | units          |     | manual         | QANOV-171326 |

  @jira.<jira_id> @<ber> @<test_priority> @android @blaude @ios @jira.cv.24.1 @jira.link.depends_on.QANOV-171322 @manual
  @mobile
  Scenario Outline: A <stack> prepay user can see the details of a unlimited <allowance_type> allowance for the mobile line product
    The consumption will represent the sum of all 'active' packs (pending activation packs are not included).
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    User with unlimited units:  015733079696 / BRT@LRT_Data
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel" allowance roundel is displayed
      And the "<allowance_type>_roundel_consumption.title" textfield with "Unbegrenzte" text is displayed
      And the "<allowance_type>_roundel_consumption" allowance roundel is displayed in "blue" colour
      And the "category_name" textfield is displayed

    Examples:
          | stack | allowance_type | test_priority | ber | jira_id      |
          | any   | data           | smoke         | ber | QANOV-580434 |
          | box7  | minutes        | regression    |     | QANOV-580435 |
          | box7  | messages       | regression    |     | QANOV-580436 |
          | box7  | units          | regression    |     | QANOV-580437 |

  @jira.QANOV-171331 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171322 @manual @mobile @regression
  Scenario: A BOX7 prepay user can swipe among all the allowances in the account dashboard
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel can be swiped in "left" direction
      And the "mobile_allowances" carousel can be swiped in "right" direction

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @blaude @cert3 @ios @jira.cv.13.9
  @jira.link.depends_on.QANOV-171322 @jira.link.detects.O2DE-1049 @live @mobile @next @webapp
  Scenario Outline: A <stack> prepay user who has consumed less than 100% of his/her <allowance_type> allowance can see the roundel in blue
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has consumed "<100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel_color" allowance roundel is displayed in "blue" colour

    Examples:
          | stack | allowance_type | test_priority | execution_mode | jira_id      |
          | any   | data           | smoke         | automatic      | QANOV-171336 |
          | box7  | minutes        | regression    | manual         | QANOV-171337 |
          | box7  | messages       | regression    | manual         | QANOV-171338 |
          | box7  | units          | regression    | manual         | QANOV-171339 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-171322 @manual @mobile @regression
  Scenario Outline: A <stack> prepay user who has consumed 100% of his/her <allowance_type> allowance can see the roundel in red
    Given user has a "prepay" account type
      And user has a "<stack>" account type
      And user has consumed "100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel" allowance roundel is displayed in "red" colour

    Examples:
          | stack | allowance_type | jira_id      |
          | any   | data           | QANOV-171344 |
          | box7  | minutes        | QANOV-171345 |
          | box7  | messages       | QANOV-171346 |
          | box7  | units          | QANOV-171347 |

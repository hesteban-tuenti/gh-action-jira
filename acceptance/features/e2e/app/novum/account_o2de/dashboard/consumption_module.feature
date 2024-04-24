# -*- coding: utf-8 -*-
@jira.QANOV-171472
Feature: Consumption Module

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.QANOV-342296 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @manual @mobile @o2de @regression
  Scenario: Postpay user without allowances roundels will see an empty-case in the consumption module
    Some postpay users (those with "Pay as you go" tariff and without packs purchased) don't have roundels in the account dashboard.
    For these users we have a smart action button in order to access the consumptions details.
    Primary button: manage bundle
    Secondary button: data usage
    Given user has a "postpay" account type
      And user has no allowances in the "mobile_line" product
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is not displayed
      And the "no_consumption_title_textfield" textfield with "Noch kein Verbrauch" text is displayed
      And the "no_consumption_description_textfield" textfield with "Hier wird dein folgender Verbrauch angezeigt." text is displayed
      And the "data_usage_button" button with "Datenverbrauch anzeigen" text is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed

  @jira.QANOV-38272 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255
  @jira.link.parent_test_plan.QANOV-421952 @live @mobile @next @o2de @sanity @webapp
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

  @jira.QANOV-44440 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255
  @jira.link.parent_test_plan.QANOV-421952 @automatic @mobile @o2de @smoke @webapp @live @next
  Scenario: Postpay user with a limited tariff can see the details of the "Inland & EU" allowance roundel for the mobile line product
    The roundel will be displayed in blue color if the user has consumed less than 100% of his/her limited mobile data
    allowance. The roundel will be displayed in red color if the user has consumed 100% of his/her limited mobile data.
    Each roundel can show an expiration date under the category name (API provided).
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then each element in the "mobile_allowances.list" carousel has the "roundel_text_title" textfield with the "Verbraucht" format
      And each element in the "mobile_allowances.list" carousel has the "roundel_text_consumption" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format
      And each element in the "mobile_allowances.list" carousel has the "roundel_text_maximum_consumption" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB)" format

  @jira.QANOV-49037 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @jira.link.parent_test_plan.QANOV-421952
  @manual @mobile @o2de @regression
  Scenario: Postpay user who has a unlimited tariff without "fair use policy" (FUP) can see the details of the "Inland & EU" allowance roundel for the mobile line product
    Each roundel can show an expiration date under the category name (API provided).
    For unlimited tariffs, the category name of the "inland_eu_data" roundel can have different values.
    There are unlimited tariffs without Fair Use Policy (FUP) because they were contracted before this law.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is unlimited in the "mobile_line" product
      And user has a tariff without fair use policy
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "inland_eu_data_roundel" element is on display
      And the "inland_eu_data_roundel.consumption" textfield with "Unbegrenzte" text is displayed
      And the "inland_eu_data_roundel" allowance roundel is displayed in "blue" colour
      And the "inland_eu_data_roundel.category_name" textfield is displayed

  @jira.QANOV-424631 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-38255
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @smoke
  Scenario: Postpay user with an unlimited tariff with "fair use policy" (FUP) can see the details of the "Inland" and "EU" allowance roundels for the mobile line product
    The "eu_data" roundel will be displayed in blue color if the user has consumed less than 100% of his/her limited
    mobile data allowance. The "eu_data" roundel will be displayed in red color if the user has consumed 100% of his/her
    limited mobile data.
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    For unlimited tariffs, the category name of the "inland_data" roundel can have different values.
    For postpay users with a unlimited tariff with FUP, the user will see an unlimited "Inland" roundel and a limited "EU" roundel.
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is unlimited in the "mobile_line" product
      And user has a tariff with fair use policy
      And user has not a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "inland_data_roundel" element is on display
      And the "inland_data_roundel.consumption" textfield with "Unbegrenzte" text is displayed
      And the "inland_data_roundel" allowance roundel is displayed in "blue" colour
      And the "inland_data_roundel.category_name" textfield with "Daten Inland" text is displayed
      And the "eu_data_roundel" element is on display
      And the "eu_data_roundel_consumption.title" textfield with the "Verbraucht" format is displayed
      And the "eu_data_roundel_consumption.amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "eu_data_roundel_consumption.subtitle" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "eu_data_roundel.category_name" textfield with the "Daten EU" format is displayed

  @jira.QANOV-580443 @android @ios @jira.cv.24.1 @jira.link.depends_on.QANOV-38255
  @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: Postpay user with a limited tariff and a "fair use policy" (FUP) bundle can see the details of the "Inland & EU", "FUP bundle" and "EU" allowance roundels for the mobile line product
    The "eu_data" roundel will be displayed in blue color if the user has consumed less than 100% of his/her limited
    mobile data allowance. The "eu_data" roundel will be displayed in red color if the user has consumed 100% of his/her
    limited mobile data.
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    For unlimited tariffs, the category name of the "inland_data" roundel can have different values.
    For postpay users with a limited tariff but a 24h-unlimited data bundle (FUP), the user will see a limited "Inland & EU"
    roundel and a unlimited "24h-unlimited data bundle" roundel.
    A postpay user has FUP if:
    - the user has a unlimited tariff contracted after the FUP law
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    User: 017623249412 / #NQT#tlfncD3
    Given user has a "postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And the "inland_eu_data" allowance is limited in the "mobile_line" product
      And user has a "24h_unlimited_data" bundle in "active" status
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "24h_unlimited_pack_roundel" allowance roundel is displayed
      And the "24h_unlimited_pack_roundel.consumption" textfield with "Unbegrenzte" text is displayed
      And the "24h_unlimited_pack_roundel" allowance roundel is displayed in "blue" colour
      And the "24h_unlimited_pack_roundel.category_name" textfield with the "Daten Inland( & EU)?" format is displayed
      And the "inland_eu_data_roundel" element is on display
      And the "inland_eu_data_roundel_consumption.title" textfield with the "Verbraucht" format is displayed
      And the "inland_eu_data_roundel_consumption.amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "inland_eu_data_roundel_consumption.subtitle" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "inland_eu_data_roundel.category_name" textfield with the "Daten Inland & EU" format is displayed
      And the "eu_data_roundel" element is on display
      And the "eu_data_roundel_consumption.title" textfield with the "Verbraucht" format is displayed
      And the "eu_data_roundel_consumption.amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "eu_data_roundel_consumption.subtitle" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "eu_data_roundel.category_name" textfield with the "Daten EU" format is displayed

  @jira.QANOV-44442 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @manual @mobile @o2de @smoke
  Scenario: Postpay user with an international bundle purchased can see the details of the "international" allowance roundel for the mobile line product
    There will be a data roundel for each of the roaming zones data packs purchased.
    NOTE: the OB has requested to hide the 'Roaming Weltzone 3-4' roundel (then, we will use the 'hidden' tag for the
    'Roaming Weltzone 3-4' pack).
    Each roundel can show an expiration date under the category name (API provided).
    Given user has a "postpay" account type
      And user has purchased "any" international data bundles
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "international_data_roundel" allowance roundel is displayed
      And the "international_data_roundel.consumption" textfield with the "Verbraucht \d+(\,\d{1,2})? (KB|MB|GB) von \d+(\,\d{1,2})? (KB|MB|GB)" format is displayed
      And the "international_data_roundel.category_name" textfield that contains the "Roaming Weltzone" text is displayed

  @jira.QANOV-38274 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-38255 @jira.link.parent_test_plan.QANOV-421952
  @manual @mobile @o2de @regression
  Scenario: Postpay user with several data allowances for a mobile line can swipe among them
    Given user has a "postpay" account type
      And user has several data allowances
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel can be swiped in "left" direction
      And the "mobile_allowances" carousel can be swiped in "right" direction

  @jira.QANOV-38276 @android @automatic @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-424631
  @jira.link.depends_on.QANOV-424632 @jira.link.depends_on.QANOV-44440 @jira.link.parent_test_plan.QANOV-421952 @mobile
  @o2de @qa @smoke @webapp
  Scenario: Postpay user who has consumed less than 100% of his/her limited mobile data allowance can see the roundel in blue
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "data_roundel_color" allowance roundel is displayed in "blue" colour

  @jira.QANOV-38278 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-424631 @jira.link.depends_on.QANOV-424632
  @jira.link.depends_on.QANOV-44440 @jira.link.parent_test_plan.QANOV-421952 @manual @mobile @o2de @regression
  Scenario: Postpay user who has consumed 100% of his/her limited mobile data allowance can see the roundel in red
    Given user has a "postpay" account type
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "data_roundel" allowance roundel is displayed in "red" colour

  @jira.QANOV-183140 @android @blaude @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-171312 @manual @mobile @regression
  Scenario: Prepay user without allowances will se an empty-case in the consumption module
    Some prepay users (those with a 9 Ct. tariff) don't have roundels in the account dashboard. For these users we
    have a smart action button in order to access the consumptions details.
    Primary button: manage bundle
    Secondary button: data usage
    Given user has a "prepay" account type
      And user has no allowances in the "mobile_line" product
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is not displayed
      And the "no_consumption_title_textfield" textfield with "Noch kein Verbrauch" text is displayed
      And the "no_consumption_description_textfield" textfield with "Hier wird dein folgender Verbrauch angezeigt." text is displayed
      And the "data_usage_button" button with "Datenverbrauch anzeigen" text is displayed
      And the "purchase_data_button" button with "Datenvolumen optimieren" text is displayed
      And the "manage_bundle_button" button with "Alle Optionen verwalten" text is displayed

  @jira.QANOV-47786 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47785 @live @mobile @next
  @o2de @sanity @webapp
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

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47786 @mobile @o2de
  Scenario Outline: Prepay user can see the consumption of a limited <allowance_type> allowance for the mobile line product
    The consumption will represent the sum of all 'active' packs (pending activation packs are not included).
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel" element is on display
      And the "<allowance_type>_roundel_consumption.title" textfield with the "Verbraucht" format is displayed
      And the "<allowance_type>_roundel_consumption.amount" textfield with the "\d+(\,\d{1,2})? (KB|MB|GB|Min|SMS|Einheiten)" format is displayed
      And the "<allowance_type>_roundel_consumption.subtitle" textfield with the "von \d+(\,\d{1,2})? (KB|MB|GB|min|SMS|Einheiten)" format is displayed
      And the "category_name" textfield is displayed

    @automatic @live @next @webapp
    Examples:
          | allowance_type | test_priority | ber | jira_id     |
          | data           | smoke         | ber | QANOV-48504 |

    @manual
    Examples:
          | allowance_type | test_priority | ber | jira_id      |
          | minutes        | regression    |     | QANOV-48505  |
          | messages       | regression    |     | QANOV-48506  |
          | units          | regression    |     | QANOV-171473 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.24.1 @jira.link.depends_on.QANOV-47786 @mobile @o2de
  Scenario Outline: Prepay user can see the details of a unlimited <allowance_type> allowance for the mobile line product
    The consumption will represent the sum of all 'active' packs (pending activation packs are not included).
    Each roundel can show an expiration date or renovation date under the category name (API provided). If a roundel
    contains the sum of different bundles with different expiration/renovation date, this field will not be displayed.
    Given user has a "prepay" account type
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel" allowance roundel is displayed
      And the "<allowance_type>_roundel_consumption.title" textfield with "Unbegrenzt" text is displayed
      And the "<allowance_type>_roundel_consumption" allowance roundel is displayed in "blue" colour
      And the "category_name" textfield is displayed

    @automatic @qa @webapp
    Examples:
          | allowance_type | test_priority | ber | jira_id      |
          | data           | smoke         | ber | QANOV-580444 |

    @manual
    Examples:
          | allowance_type | test_priority | ber | jira_id      |
          | minutes        | regression    |     | QANOV-580445 |
          | messages       | regression    |     | QANOV-580446 |
          | units          | regression    |     | QANOV-580447 |

  @jira.QANOV-47787 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47786 @manual @mobile @o2de @regression
  Scenario: Prepay user can swipe among all the allowances in the account dashboard
    Given user has a "prepay" account type
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "mobile_allowances" carousel can be swiped in "left" direction
      And the "mobile_allowances" carousel can be swiped in "right" direction

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47786 @manual @mobile @o2de @regression
  Scenario Outline: Prepay user who has consumed less than 100% of his/her <allowance_type> allowance can see the roundel in blue
    Given user has a "prepay" account type
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has consumed "<100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel_color" allowance roundel is displayed in "blue" colour

    Examples:
          | allowance_type | jira_id      |
          | data           | QANOV-47794  |
          | minutes        | QANOV-47795  |
          | messages       | QANOV-47796  |
          | units          | QANOV-171477 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47786 @manual @mobile @o2de @regression
  Scenario Outline: Prepay user who has consumed 100% of his/her <allowance_type> allowance can see the roundel in red
    Given user has a "prepay" account type
      And user has consumed "100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the "Consumption Counters" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "<allowance_type>_roundel" allowance roundel is displayed in "red" colour

    Examples:
          | allowance_type | jira_id      |
          | data           | QANOV-47797  |
          | minutes        | QANOV-47798  |
          | messages       | QANOV-47799  |
          | units          | QANOV-171478 |

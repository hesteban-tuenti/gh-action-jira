# -*- coding: utf-8 -*-
@jira.QANOV-182359
Feature: Bundle Purchase

  Actions Before each Scenario:
    Given user has a "mobile_line" product in "active" status


  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182329
  @jira.link.depends_on.QANOV-217510 @manual @mobile @regression
  Scenario Outline: A user with packs available to purchase in "<category>" category for the mobile line product can see that category entrypoint in the "Bundle Management" screen
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International, Other services.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot).
    If there are no packs available in a category, that category won’t be displayed.
    Given user has bundles available to purchase in "<category>" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     Then the "categories_list" list is displayed
      And any element in the "categories_list" list has the "name" textfield with the "<category_name>" text
      And any element in the "categories_list" list has the "description" textfield with the "<description>" text

    @raitt_drop3
    Examples:
          | category | category_name  | description  | jira_id      |
          | Data     | Daten-Optionen | Daten Inland | QANOV-182360 |

    Examples:
          | category      | category_name       | description       | jira_id      |
          | Minutes & SMS | Minuten und SMS     | In- und Ausland   | QANOV-182361 |
          | Kombi         | Kombi-Optionen      | Daten + Min.      | QANOV-182362 |
          | International | Auslands-Optionen   | Daten und Minuten | QANOV-182363 |
          | Other packs   | TV & Extra-Optionen | tv, streaming etc | QANOV-182364 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on>
  @jira.link.depends_on.QANOV-182329 @jira.link.depends_on.QANOV-217510 @manual @mobile @regression
  Scenario Outline: A user without packs available to purchase in "<category>" category for the mobile line product cannot see that category entrypoint in the "Bundle Management" screen
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International, Other services.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    If there are no packs available in a category, that category won’t be displayed.
    Given user has "mobile_line" bundles available to purchase
      And user has not bundles available to purchase in "<category>" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     Then the "categories_list" list is displayed
      And no element in the "categories_list" list has the value "<category_name>" in the "name" field

    Examples:
          | category      | category_name       | jira_id      |
          | Data          | Daten-Optionen      | QANOV-182365 |
          | Minutes & SMS | Minuten und SMS     | QANOV-182366 |
          | Kombi         | Kombi-Optionen      | QANOV-182367 |
          | International | Auslands-Optionen   | QANOV-182368 |
          | Other packs   | TV & Extra-Optionen | QANOV-182369 |

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @blaude @cert3 @ios @jira.cv.13.9
  @jira.link.depends_on.<depends_on> @live @mobile @next @webapp
  Scenario Outline: A user with one-shot packs available in <category> category for the mobile line product can access to the "<category> Bundles" screen to buy a pack
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International, Other services.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    If there are no packs available in a category, that category won’t be displayed.
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    Given user has "oneshot" bundles available to purchase in "<category>" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
     Then the "Category Bundles" page is displayed
      And the "<category_name>" header is displayed
      And the "header.title" textfield with "<category_name>" text is displayed
      And the "header.description" textfield is displayed
      And the "oneshot_carousel.list" carousel is displayed
      And all bundles in "oneshot_carousel.list" carousel are from the "<category>" category
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bundle Management" page is displayed

    @raitt_drop3
    Examples:
          | category | category_name  | test_priority | execution_mode | depends_on   | jira_id      |
          | Data     | Daten-Optionen | sanity        | automatic      | QANOV-182360 | QANOV-182370 |

    Examples:
          | category      | category_name       | test_priority | execution_mode | depends_on   | jira_id      |
          | Minutes & SMS | Minuten und SMS     | regression    | manual         | QANOV-182361 | QANOV-182371 |
          | Kombi         | Kombi-Optionen      | regression    | manual         | QANOV-182362 | QANOV-182372 |
          | International | Auslands-Optionen   | regression    | manual         | QANOV-182363 | QANOV-182373 |
          | Other packs   | TV & Extra-Optionen | regression    | manual         | QANOV-182364 | QANOV-182374 |

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @blaude @cert3 @ios @jira.cv.13.9
  @jira.link.depends_on.<depends_on> @live @mobile @next @webapp
  Scenario Outline: A BOX7 user with recurrent packs available in <category> category for the mobile line product can access to the "<category> Bundles" screen to buy a pack
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International, Other services.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    If there are no packs available in a category, that category won’t be displayed.
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    RAITT users only have one-shot packs.
    Given user has a "box7" account type
      And user has "recurrent" bundles available to purchase in "<category>" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
     Then the "Category Bundles" page is displayed
      And the "<category_name>" header is displayed
      And the "header.title" textfield with "<category_name>" text is displayed
      And the "header.description" textfield is displayed
      And the "recurrent_title" textfield with "OPTIONEN ENTDECKEN" text is displayed
      And the "recurrent_bundles.list" list is displayed
      And all bundles in "recurrent_bundles.list" list are from the "<category>" category
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Bundle Management" page is displayed

    @raitt_drop3
    Examples:
          | category | category_name  | test_priority | execution_mode | depends_on   | jira_id      |
          | Data     | Daten-Optionen | sanity        | automatic      | QANOV-182360 | QANOV-358124 |

    Examples:
          | category      | category_name       | test_priority | execution_mode | depends_on   | jira_id      |
          | Minutes & SMS | Minuten und SMS     | regression    | manual         | QANOV-182361 | QANOV-358125 |
          | Kombi         | Kombi-Optionen      | regression    | manual         | QANOV-182362 | QANOV-358126 |
          | International | Auslands-Optionen   | regression    | manual         | QANOV-182363 | QANOV-358127 |
          | Other packs   | TV & Extra-Optionen | regression    | manual         | QANOV-182364 | QANOV-358128 |

  @jira.QANOV-494507 @android @blaude @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-171312
  @jira.link.depends_on.QANOV-202548 @manual @mobile @smoke
  Scenario: A user with a mobile line and packs available in Data category can access to the "Data Bundles" screen from the account dashboard
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    Given user has a "mobile_line" product in "active" status
      And user has "any" bundles for "mobile_line" product available to purchase in "Data" category
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "purchase_data_button" button
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed
      And the "category_title" textfield with "Daten-Optionen" text is displayed
      And the "category_description" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user without one-shot bundles available in <category> category for the mobile line product won't see the one-shot carousel in the "Category Bundles" screen
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International, Other services.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    If there are no packs available in a category, that category won’t be displayed.
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    Given user has "recurrent" bundles available to purchase in "<category>" category
      And user has not "one-shot" bundles available to purchase in "<category>" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the "<category>" element in the "categories_list" list
     Then the "Category Bundles" page is displayed
      And the "oneshot_carousel" carousel is not displayed
      And the "recurrent_title" textfield with "OPTIONEN ENTDECKEN" text is displayed
      And the "recurrent_list" list is displayed

    Examples:
          | category      | depends_on   | jira_id      |
          | Data          | QANOV-182360 | QANOV-182375 |
          | Minutes & SMS | QANOV-182361 | QANOV-182376 |
          | Kombi         | QANOV-182362 | QANOV-182377 |
          | International | QANOV-182363 | QANOV-182378 |
          | Other packs   | QANOV-182364 | QANOV-182379 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1866
  @manual @mobile @regression
  Scenario Outline: A BOX7 user without recurrent bundles available in <category> category for the mobile line product won't see the recurrent list in the "Category Bundles" screen
    Existing categories: Data, Minutes & SMS, Kombi (mixed bundles of data + min), International, Other services.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    If there are no packs available in a category, that category won’t be displayed.
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    Given user has a "box7" account type
      And user has "one-shot" bundles available to purchase in "<category>" category
      And user has not "recurrent" bundles available to purchase in "<category>" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the "<category>" element in the "categories_list" list
     Then the "Category Bundles" page is displayed
      And the "oneshot_carousel" carousel is displayed
      And the "recurrent_title" textfield is not displayed
      And the "recurrent_list" list is not displayed

    Examples:
          | category      | depends_on   | jira_id      |
          | Data          | QANOV-182360 | QANOV-261441 |
          | Minutes & SMS | QANOV-182361 | QANOV-261442 |
          | Kombi         | QANOV-182362 | QANOV-261444 |
          | International | QANOV-182363 | QANOV-261446 |
          | Other packs   | QANOV-182364 | QANOV-261447 |

  @jira.QANOV-182380 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182370
  @jira.link.depends_on.QANOV-182371 @jira.link.depends_on.QANOV-182372 @jira.link.depends_on.QANOV-182373
  @jira.link.depends_on.QANOV-182374 @manual @mobile @raitt_drop3 @smoke
  Scenario: A user with a mobile line product can see a one-shot pack available to purchase in the one-shot carousel
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    Given user has "one-shot" bundles available to purchase in "any" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel" module configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
     Then the "Category Bundles" page is displayed
      And the "oneshot_carousel.list" carousel is displayed
      And each element in the "oneshot_carousel.list" list has the "tag" textfield with "Einmalig" text
      And each element in the "oneshot_carousel.list" list has the "title" field
      And each element in the "oneshot_carousel.list" list has the "descripcion" textfield with the "Laufzeit: \d+ (Stunden|Tages|Tage|Woche|Wochen|Monat|Monate)" format
      And each element in the "oneshot_carousel.list" list has the "price_value" textfield with the "\d+,\d\d €" format
      And each element in the "oneshot_carousel.list" list has the "price_label" textfield with "(inkl. MwSt.)" text
      And each element in the "oneshot_carousel.list" list has the "button_primary" textfield with "Details" text

  @jira.QANOV-182381 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-358124
  @jira.link.depends_on.QANOV-358125 @jira.link.depends_on.QANOV-358126 @jira.link.depends_on.QANOV-358127
  @jira.link.depends_on.QANOV-358128 @manual @mobile @raitt_drop3 @smoke
  Scenario: A BOX7 user with a mobile line product can see a recurrent pack available to purchase in the recurrent list
    One-shot packs will be displayed in a carousel. Recurrent packs will be displayed in a list.
    In the Data category, DataSnacks bolt-ons should be on the left (on-shot) and at the top (recurring) and AppBonus should be at the back (one-shot)
    RAITT users only have one-shot packs.
    Given user has a "box7" account type
      And user has "recurrent" bundles available to purchase in "any" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "Recurrent bundle list" module configured in CMS for "Category Bundles" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
     Then the "Category Bundles" page is displayed
      And the "recurrent_list" carousel is displayed
      And each element in the "recurrent_list" list has the "name" field
      And each element in the "recurrent_list" list has the "renewal_date" textfield with the "Autom. Verlängerung: alle \d+ (Tages|Tage|Woche|Wochen|Monat|Monate)" format
      And each element in the "recurrent_list" list has the "price_value" textfield with the "\d+,\d\d €" format
      And each element in the "recurrent_list" list has the "price_label" textfield with "(inkl. MwSt.)" text
      And each element in the "recurrent_list" list has the "details_button" textfield with "Details" text

  @jira.<jira_id> @android @automatic @blaude @cert3 @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182380
  @jira.link.parent_test_plan.QANOV-402198 @live @mobile @next @raitt_drop3 @smoke
  Scenario Outline: A <account_type> user with a mobile line product can select a one-shot pack available to purchase: Pack Details screen is displayed
    Given user has a "<account_type>" account type
      And user has "oneshot" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel" module configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" link of any card of the "oneshot_carousel.list" carousel
     Then the "Bundle Purchase Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.title" textfield with "Preis" text is displayed
      And the "pack_price.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_details_title" textfield with "Details" text is displayed
      And the "pack_details_description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

    Examples:
          | account_type | jira_id      |
          | prepay       | QANOV-420459 |
          | postpay      | QANOV-420460 |

  @jira.<jira_id> @android @automatic @blaude @cert3 @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182381
  @jira.link.parent_test_plan.QANOV-402198 @live @mobile @next @raitt_drop3 @sanity @webapp
  Scenario Outline: A BOX7 <account_type> user with a mobile line product can select a recurrent pack available to purchase: Pack Details screen is displayed
    RAITT users only have one-shot packs.
    Given user has a "box7" account type
      And user has a "<account_type>" account type
      And user has "recurrent" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "Recurrent bundle list" module configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of "recurrent_bundles.list" list with "any" index
     Then the "Bundle Purchase Details" page is displayed
      And the "Options-Details" header is displayed
      And the "pack_name_textfield" textfield is displayed
      And the "pack_price.title" textfield with "Preis" text is displayed
      And the "pack_price.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_price.value" textfield with the "\d+,\d\d €" format is displayed
      And the "pack_renewaldate.title" textfield with "Autom. Verlängerung:" text is displayed
      And the "pack_renewaldate.value" textfield with the "Alle \d+ (Tages|Tage|Woche|Wochen|Monat|Monate)" format is displayed
      And the "pack_details_title" textfield with "Details" text is displayed
      And the "pack_details_description" textfield is displayed
      And the "product_information_sheet_entrypoint" entrypoint with "Produktinformationsblatt" text is displayed
      And the "continue_button" button with "Weiter" text is displayed

    Examples:
          | account_type | jira_id      |
          | prepay       | QANOV-420461 |
          | postpay      | QANOV-420462 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420462
  @jira.link.depends_on.QANOV-420466 @jira.link.depends_on.QANOV-420468 @jira.link.depends_on.QANOV-420469
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A <account_type> user with a mobile line product can access to the "Product information sheet" OB webview from the Pack Details screen
    OB webview: https://www.blau.de/recht/produktinformationsblatt/?utm_term=navigation_service_information_tariff&utm_campaign=pp_produktinformationsblatt&utm_medium=nf_app_novum&utm_source=native&utm_content=BLU_DTI_APP_TEF_31123&utm_source=native&utm_medium=nf_app_novum&utm_campaign=pp_produktinformationsblatt&utm_term=navigation_service_information_tariff&utm_content=BLU_DTI_APP_TEF_31123&partnerId=BLU_DTI_APP_TEF_31123&mediacode=cs%253Anative%257Ccm%253Anf_app_novum%257Ccn%253App_produktinformationsblatt%257Cct%253Anavigation_service_information_tariff
    Given user has a "<account_type>" account type
      And user has "any" bundles available to purchase in "any" category
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel" module configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" link of any card of the "oneshot_carousel" carousel
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "product_information_sheet_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Aktuelle Produktinformationsblätter auf einen Blick" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bundle Purchase Details" page is displayed

    Examples:
          | account_type | jira_id      |
          | prepay       | QANOV-420463 |
          | postpay      | QANOV-420464 |

  @jira.QANOV-267379 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182382
  @jira.link.depends_on.QANOV-217513 @jira.link.depends_on.QANOV-217562 @jira.link.depends_on.QANOV-217563
  @jira.link.depends_on.QANOV-420459 @jira.link.depends_on.QANOV-420460 @jira.link.depends_on.QANOV-420461
  @jira.link.depends_on.QANOV-420462 @manual @mobile @regression
  Scenario: A user who has a pack with two different details zones can see the details divided by zones in the "Bundle Purchase Details" screen
    Given user has a bundle available to purchase with two different details zones
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the bundle with two different details zones
     Then the "Bundle Purchase Details" page is displayed
      And the "pack_details.title" textfield with "Details" text is displayed
      And the "pack_details.subtitle_zone1" textfield that contains the "Detail pack zone tariff" text is displayed
      And the "pack_details.description_zone1" textfield is displayed
      And the "pack_details.subtitle_zone2" textfield that contains the "Detail pack zone tariff" text is displayed
      And the "pack_details.description_zone2" textfield is displayed

  @jira.QANOV-292101 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-182382
  @jira.link.depends_on.QANOV-217513 @manual @mobile @regression
  Scenario: A prepay user tries to access to the "Payment methods" screen but an error happens
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Details" page
     When clicks on the "continue_button" button
      And there is an API error
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten." text is displayed

  @jira.QANOV-292102 @android @blaude @jira.cv.13.10 @jira.link.depends_on.QANOV-292101 @manual @mobile @regression
  Scenario: A prepay user who couldn't access to the "Payment methods" screen can close the warning
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Details" page
     When clicks on the "continue_button" button
      And there is an API error
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Bundle Purchase Details" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-182384 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182382
  @jira.link.depends_on.QANOV-217513 @jira.link.detects.O2DE-3185 @jira.link.parent_test_plan.QANOV-402198 @live @mobile
  @next @raitt_drop3 @smoke @webapp
  Scenario: A prepay user with bank account activated can access to the "Payment methods" screen when purchasing a pack
    For BOX7 users, the last digits of the bank account will be displayed.
    For RAITT users, the last digits of the 'first' bank account will be displayed.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
     Then the "Bundle Purchase Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed
      And the "header.title" textfield with "Womit möchtest du zahlen?" text is displayed
      And the "header.description" textfield with "Du kannst deine Optionen über deine Bankverbindung oder dein aktuelles Guthaben bezahlen." text is displayed
      And the "pack_info.title" textfield is displayed
      And the "pack_info.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "pack_info.value" textfield with the "\d+,\d\d €" format is displayed
      And the "payment_methods_title" textfield with "ZAHLUNGSMETHODEN" text is displayed
      And the "payment_methods.balance_title" textfield with "Aktuelles Guthaben" text is displayed
      And the "payment_methods.balance_amount" textfield with the "^\d+,\d\d €( \(Aufladung notwendig\))?$" format is displayed
      And the "payment_methods.bankaccount_title" textfield with "Bankverbindung" text is displayed
      And the "payment_methods.bankaccount_number" textfield with the "^[A-Z]{2}\*+\d{4}$" format is displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-182385 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182382
  @jira.link.depends_on.QANOV-217513 @jira.link.detects.O2DE-3185 @jira.link.detects.OBO2DE-414 @manual @mobile
  @raitt_drop3 @smoke
  Scenario: A prepay user without bank account can access to the "Payment methods" screen when purchasing a pack
    NOTE: if the user has not a bank account saved and has the forbidden use case REGISTER_FOR_DIRECT_DEBIT, then the bank
    account entrypoint is not displayed.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user does not have bank account
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has not the "REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Details" page
     When clicks on the "continue_button" button
     Then the "Bundle Purchase Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed
      And the "title_textfield" textfield with "Womit möchtest du zahlen?" text is displayed
      And the "description_textfield" textfield with "Du kannst deinen Optionen über deine Bankverbindung oder dein aktuelles Guthaben bezahlen." text is displayed
      And the "pack_info.name" textfield is displayed
      And the "pack_info.price_label" textfield with "(inkl. MwSt)" text is displayed
      And the "pack_info.price_value" textfield with the "\d+,\d\d €" format is displayed
      And the "payment_methods.title" textfield with "ZAHLUNGSMETHODE" text is displayed
      And the "payment_methods.balance_title" textfield with "Aktuelles Guthaben" text is displayed
      And the "payment_methods.balance_amount" textfield with the "^\d+,\d\d €( \(Aufladung notwendig\))?$" format is displayed
      And the "payment_methods.balance_radiobutton" button is displayed
      And the "payment_methods.bankaccount_tag" textfield with "Nicht hinterlegt" text is displayed
      And the "payment_methods.bankaccount_title" textfield with "Bankverbindung" text is displayed
      And the "payment_methods.bankaccount_number" textfield is not displayed
      And the "payment_methods.bankaccount_radiobutton" button is not displayed
      And the "payment_methods.bankaccount_chevron" icon is displayed
      And the "bankaccount_info.title" textfield with "Bankverbindung einrichten" text is displayed
      And the "bankaccount_info.description" textfield with "Guthaben aufladen leicht gemacht. Laden dein Guthaben bequem per Bankeinzung auf. Hinterlege hierfüur einfach deine Bankverbundung." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.QANOV-532738 @android @blaude @ios @jira.cv.24.0 @jira.link.depends_on.QANOV-182382
  @jira.link.depends_on.QANOV-217513 @manual @mobile @regression
  Scenario: A prepay user with bank account in pending status can access to the "Payment methods" screen when purchasing a pack
    The chevron icon is not displayed because the users won't be able to access the "Bank Account" screen when it is in
    pending status.
    NOTE: if the user has not a bank account saved and has the forbidden use case REGISTER_FOR_DIRECT_DEBIT, then the bank
    account entrypoint is not displayed.
    To test on QA: prepay07
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "pending" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has not the "REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Details" page
     When clicks on the "continue_button" button
     Then the "Bundle Purchase Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed
      And the "title_textfield" textfield with "Wie möchtest du bezahlen" text is displayed
      And the "description_textfield" textfield with "Du kannst deinen neuen Tarif über deine Bankverbindung oder dein aktuelles Guthaben bezahlen" text is displayed
      And the "pack_info.name" textfield is displayed
      And the "pack_info.price_label" textfield with "(inkl. MwSt)" text is displayed
      And the "pack_info.price_value" textfield with the "\d+,\d\d €" format is displayed
      And the "payment_methods.title" textfield with "ZAHLUNGSMETHODE" text is displayed
      And the "payment_methods.balance_title" textfield with "Aktuelles Guthaben" text is displayed
      And the "payment_methods.balance_amount" textfield with the "^\d+,\d\d €( \(Aufladung notwendig\))?$" format is displayed
      And the "payment_methods.balance_radiobutton" button is displayed
      And the "payment_methods.bankaccount_tag" textfield with "Kurzfristige Sperre nach Erstnutzung" text is displayed
      And the "payment_methods.bankaccount_title" textfield with "Bankverbindung" text is displayed
      And the "payment_methods.bankaccount_number" textfield with the "^[A-Z]{2}\*+\d{4}$" format is displayed
      And the "payment_methods.bankaccount_radiobutton" button is not displayed
      And the "payment_methods.bankaccount_chevron" icon is not displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.QANOV-182387 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182384 @jira.link.depends_on.QANOV-182385
  @jira.link.depends_on.QANOV-182386 @manual @mobile @regression
  Scenario: A prepay user can go to previous screen from the "Bundle Purchase Payment Methods" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Bundle Purchase Details" page is displayed
      And the "Pack-Infos" header is displayed

  @jira.QANOV-182388 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182384
  @jira.link.depends_on.QANOV-182385 @jira.link.depends_on.QANOV-182386 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user without enough balance to buy the selected pack will see a message in "Bundle Purchase Payment Methods" screen
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     Then the "payment_methods.balance_amount" textfield that contains the "(Aufladung notwendig)" text is displayed

  @jira.QANOV-182389 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182385 @jira.link.detects.OBO2DE-414
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A BOX7 prepay user without bank account can access to "Bank Account" screen from "Bundle Purchase Payment Methods" screen
    A user without a bank account saved can decide to add a bank account when he/she is in the "Bundle Purchase Payment Methods" screen
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user does not have bank account
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has not the "REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.bankaccount_chevron" icon
     Then the "Bank Account Edition" page is displayed
      And the "Bankverbindung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed

  @jira.QANOV-403553 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-182385
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A RAITT prepay user without bank account can access to "Bank Account" OB webview from "Bundle Purchase Payment Methods" screen
    A user without a bank account saved can decide to add a bank account when he/she is in the "Bundle Purchase Payment Methods" screen
    Given user has a "raitt" account type
      And user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user does not have bank account
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has not the "REGISTER_FOR_DIRECT_DEBIT" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.bankaccount_chevron" icon
     Then the internal webview is displayed
      And the "Zahlungsdaten" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
      And the "Zahlungsmethode" header is displayed

  @jira.QANOV-420466 @android @automatic @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182384
  @jira.link.parent_test_plan.QANOV-402198 @mobile @raitt_drop3 @smoke @webapp @ber
  Scenario: A prepay user decides to pay the pack with his/her bank account: the "Order confirmation" screen is displayed
    Bundles with EECC flag will display:
    - a "legal_documents_textfield" textfield with 5 links.
    - an additional paragraph under the "legal_documents_textfield" textfield.
    Bundles without EECC flag will display:
    - a "legal_documents_textfield" textfield with 4 links (the eecc link is not displayed).
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
     When clicks on the "bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Bundle Purchase Order Confirmation" page is displayed
      And the "Bestellbestätigung" header is displayed
      And the "legal_info_title" textfield with "GESETZLICHE PFLICHTINFORMATIONEN" text is displayed
      And the "legal_info_description" textfield with "Informationen zur Verarbeitung von personenbezogenen Daten im Rahmen eines Blau-Telekommunikationsvertrages und deinen Betroffenenrechten werden im Datenschutzmerkblatt für Kunden bereitgestellt." text is displayed
      And the "legal_info_link" link with "Datenschutzmerkblatt" text is displayed
      And the "your_order_title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "your_order.title" textfield is displayed
      And the "your_order.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "your_order.value" textfield with the "\d+,\d\d €" format is displayed
      And the "legal_documents_textfield" textfield is displayed
      And the "add_pack_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.QANOV-403555 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420459
  @jira.link.depends_on.QANOV-420461 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @smoke
  Scenario: A prepay user with enough balance decides to pay the pack with his/her balance: the "Order confirmation" screen is displayed
    Bundles with EECC flag (terms of contract) will display:
    - a "legal_documents_textfield" textfield with 5 links.
    - an additional paragraph under the "legal_documents_textfield" textfield.
    Bundles without EECC flag (terms of contract) will display:
    - a "legal_documents_textfield" textfield with 4 links (the eecc link is not displayed).
    Users without enough balance cannot purchase a bundle.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
     When clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Bundle Purchase Order Confirmation" page is displayed
      And the "Bestellbestätigung" header is displayed
      And the "legal_info.title" textfield with "GESETZLICHE PFLICHTINFORMATIONEN" text is displayed
      And the "legal_info.description" textfield with "Informationen zur Verarbeitung von personenbezogenen Daten im Rahmen eines Blau-Telekommunikationsvertrages und deinen Betroffenenrechten werden im Datenschutzmerkblatt für Kunden bereitgestellt." text is displayed
      And the "legal_info.link" link with "Datenschutzmerkblatt" text is displayed
      And the "your_order_title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "your_order.pack_name" textfield is displayed
      And the "your_order.price_label" textfield with "(inkl. MwSt.)" text is displayed
      And the "your_order.price_value" textfield with the "\d+,\d\d €" format is displayed
      And the "legal_documents_textfield" textfield is displayed
      And the "add_pack_button" button with "Jetzt kostenpflichtig bestellen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.QANOV-403556 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-182384
  @jira.link.depends_on.QANOV-182385 @jira.link.depends_on.QANOV-182386 @jira.link.parent_test_plan.QANOV-402198 @manual
  @mobile @raitt_drop3 @regression
  Scenario: A prepay user without enough balance decides to pay the pack with his/her balance: a popup is displayed
    Users without enough balance cannot purchase a bundle.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
     When clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
     Then the "Go To Topup Confirmation" popup is displayed
      And the "popup.title" textfield with "Guthaben aufladen" text is displayed
      And the "popup.message" textfield with "Sobald dein Guthaben aufgeladen wurde, kannst du mit Kauf dieser Option fortfahren" text is displayed
      And the "popup.accept" button with the "(JETZT AUFLADEN|Jetzt aufladen)" format is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed
      And clicks on the "popup.cancel" button
      And the "Bundle Purchase Payment Methods" page is displayed

  @jira.QANOV-403557 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-403556
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A prepay user without enough balance goes to the Topup screen from the bundle purchase flow
    Users without enough balance cannot purchase a bundle.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
     When clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Go To Topup Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Topup" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Purchase Payment Methods" page is displayed

  @jira.QANOV-437457 @android @automatic @ber @blaude @cert3 @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420460
  @jira.link.depends_on.QANOV-420462 @jira.link.parent_test_plan.QANOV-402198 @live @mobile @next @raitt_drop3 @smoke
  @webapp
  Scenario: A postpay user with a mobile line product decides to complete the bundle purchase: the "Order confirmation" screen is displayed
    Packs of a postpay user do not have "Terms of Contract" information (EECC flag), so the "legal_info" module is not displayed.
    Given user has a "postpay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
     Then the "Bundle Purchase Order Confirmation" page is displayed
      And the "Bestellbestätigung" header is displayed
      And the "legal_info_title" textfield with "GESETZLICHE PFLICHTINFORMATIONEN" text is displayed
      And the "legal_info_description" textfield that contains the "Informationen zur Verarbeitung von personenbezogenen Daten im Rahmen eines Blau-Telekommunikationsvertrages und deinen Betroffenenrechten werden im " text is displayed
      And the "legal_info_link" link with "Datenschutzmerkblatt" text is displayed
      And the "your_order_title" textfield with "DEINE BESTELLUNG" text is displayed
      And the "your_order.title" textfield is displayed
      And the "your_order.subtitle" textfield with "(inkl. MwSt.)" text is displayed
      And the "your_order.value" textfield with the "\d+,\d\d €" format is displayed
      And the "legal_documents_textfield" textfield with "Die Bestellung erfolgt auf Grundlage der AGB, der Leistungsbeschreibung, der Preisliste. Dir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "additional_textfield" textfield is not displayed
      And the "add_pack_button" button with "Jetzt kostenpflichtig bestellen" text is displayed

  @jira.QANOV-420468 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-403555
  @jira.link.depends_on.QANOV-420466 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user can see an EECC link and an additional text when selecting a pack with EECC flag
    Bundles with EECC flag (terms of contract) will display:
    - a "legal_documents_textfield" textfield with 5 links.
    - an additional paragraph under the "legal_documents_textfield" textfield.
    Given user has a "prepay" account type
      And user has a changeable tariff
      And user has selected to buy a bundle with eecc flag
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Purchase Order Confirmation" page
     Then the "legal_documents_textfield" textfield with "Die Bestellung erfolgt auf Grundlage der AGB, der Leistungsbeschreibung, der Preisliste sowie der Vertragszusammenfassung. Dir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "contract_summary_link" link with "Vertragszusammenfassung" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "additional_textfield" textfield with "Die vorgenannten Dokumente haben wir dir per E-Mail übersandt sowie in deiner Postbox unter Deine Vertragsunterlagen zur Verfügung gestellt. Wenn du auf dieser Grundlage bestellen möchtest, klicke jetzt auf Kostenpflichtig bestellen." text is displayed

  @jira.QANOV-420469 @android @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-403555
  @jira.link.depends_on.QANOV-420466 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A user cannot see an EECC link or an additional text when selecting a pack without EECC flag
    Given user has a changeable tariff
      And user has selected to buy a bundle without eecc flag
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Purchase Order Confirmation" page
     Then the "legal_documents_textfield" textfield with "Die Bestellung erfolgt auf Grundlage der AGB, der Leistungsbeschreibung, der Preisliste. Dir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "additional_textfield" textfield is not displayed

  @jira.QANOV-420470 @android @blaude @jira.cv.14.8 @jira.link.depends_on.QANOV-420468 @jira.link.detects.O2DE-3708
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A user can access to the legal info link from the "Bundle Order confirmation" screen on Android devices
    Legal link: https://static2-blau.o9.de/resource/blob/9334/56265758f7efe1a15114d1ceafda46b8/datenschutzmerkblatt-telefonica-pdf-download-data.pdf
    Given user has installed the "Google Drive" app
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Recurrent bundle list" module configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Purchase Order Confirmation" page
     When clicks on the "legal_info.link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed

  @jira.QANOV-420471 @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420468 @jira.link.detects.O2DE-3708
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A user can access to the legal info link from the "Bundle Order confirmation" screen on iOS devices
    Legal link: https://static2-blau.o9.de/resource/blob/9334/56265758f7efe1a15114d1ceafda46b8/datenschutzmerkblatt-telefonica-pdf-download-data.pdf
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Recurrent bundle list" module configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Purchase Order Confirmation" page
     When clicks on the "legal_info.link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed

  @jira.<jira_id> @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-182391 @jira.link.depends_on.QANOV-182392
  @jira.link.depends_on.QANOV-182396 @jira.link.depends_on.QANOV-403555 @jira.link.depends_on.QANOV-420466
  @jira.link.depends_on.QANOV-420467 @jira.link.depends_on.QANOV-437457 @jira.link.detects.OBO2DE-247
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario Outline: A user can access to the "<legal_document>" legal document from the "Bundle Purchase Order Confirmation" screen on Android devices
    BLAU BOX7 links: TBD
    BLAU RAITT links:
    - AGB --> https://www.o2online.de/app/o2-app/agb-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=blau_agb_prepaid&utm_term=navigation_service_information_other&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ablau_agb_prepaid%7Cct%3Anavigation_service_information_other
    - Leistungsbeschreibung --> https://o2.de/produktinformationsblatt?utm_source=native&utm_medium=nf_app_novum&utm_campaign=pp_produktinformationsblatt&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3App_produktinformationsblatt%7Cct%3Anavigation_service_information_tariff
    - Preisliste --> https://www.o2online.de/app/o2-app/pl-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=preisliste_prepaid&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Apreisliste_prepaid%7Cct%3Anavigation_service_information_tariff
    - Widerrufsrecht --> https://www.o2online.de/app/o2-app/wr-postpaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=o2_widerrufsbelehrung&utm_term=navigation_service_move-and-change_vertrag&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ao2_widerrufsbelehrung%7Cct%3Anavigation_service_move-and-change_vertrag
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has installed the "Google Drive" app
      And user is in the "Bundle Purchase Order Confirmation" page
     When clicks on the "<link>" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-182398 |
          | services_description_link | Services Description | QANOV-182397 |
          | price_list_link           | Price List           | QANOV-217564 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-259511 |

  @jira.<jira_id> @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182391 @jira.link.depends_on.QANOV-182392
  @jira.link.depends_on.QANOV-182396 @jira.link.depends_on.QANOV-403555 @jira.link.depends_on.QANOV-420466
  @jira.link.depends_on.QANOV-420467 @jira.link.depends_on.QANOV-437457 @jira.link.parent_test_plan.QANOV-402198 @manual
  @mobile @raitt_drop3 @regression
  Scenario Outline: A user can access to the "<legal_document>" legal document from the "Bundle Purchase Order Confirmation" screen on iOS devices
    BLAU BOX7 links: TBD
    BLAU RAITT links:
    - AGB --> https://www.o2online.de/app/o2-app/agb-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=blau_agb_prepaid&utm_term=navigation_service_information_other&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ablau_agb_prepaid%7Cct%3Anavigation_service_information_other
    - Leistungsbeschreibung --> https://o2.de/produktinformationsblatt?utm_source=native&utm_medium=nf_app_novum&utm_campaign=pp_produktinformationsblatt&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3App_produktinformationsblatt%7Cct%3Anavigation_service_information_tariff
    - Preisliste --> https://www.o2online.de/app/o2-app/pl-prepaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=preisliste_prepaid&utm_term=navigation_service_information_tariff&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Apreisliste_prepaid%7Cct%3Anavigation_service_information_tariff
    - Widerrufsrecht --> https://www.o2online.de/app/o2-app/wr-postpaid?utm_source=native&utm_medium=nf_app_novum&utm_campaign=o2_widerrufsbelehrung&utm_term=navigation_service_move-and-change_vertrag&utm_content=O2_DTI_APP_TEF_33025&partnerId=O2_DTI_APP_TEF_33025&mediacode=cs%3Anative%7Ccm%3Anf_app_novum%7Ccn%3Ao2_widerrufsbelehrung%7Cct%3Anavigation_service_move-and-change_vertrag
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has installed the "Google Drive" app
      And user is in the "Bundle Purchase Order Confirmation" page
     When clicks on the "<link>" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | link                      | legal_document       | jira_id      |
          | terms_and_conditions_link | Terms And Conditions | QANOV-283427 |
          | services_description_link | Services Description | QANOV-283428 |
          | price_list_link           | Price List           | QANOV-283429 |
          | right_of_withdrawal_link  | Right Of Withdrawal  | QANOV-283430 |

  @jira.QANOV-420472 @TBD @android @blaude @jira.cv.14.8 @jira.link.depends_on.QANOV-420468
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user who selected a pack with EECC flag can access to the "Contract summary" legal document from the "Bundle Purchase Order Confirmation" screen on Android devices
    Given user has a "prepay" account type
      And user has selected to buy a bundle with eecc flag
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has installed the "Google Drive" app
      And user is in the "Bundle Purchase Order Confirmation" page
     When clicks on the "contract_summary_link" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "TBD.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed

  @jira.QANOV-420473 @blaude @ios @jira.cv.14.8 @jira.link.depends_on.QANOV-420468
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user who selected a pack with EECC flag can access to the "Contract summary" legal document from the "Bundle Purchase Order Confirmation" screen on iOS devices
    Given user has a "prepay" account type
      And user has selected to buy a bundle with eecc flag
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user is in the "Bundle Purchase Order Confirmation" page
     When clicks on the "contract_summary_link" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.QANOV-292103 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-182384 @manual @mobile @regression
  Scenario: A prepay user who wants to pay the pack with bank account tries to access to the "Bundle Purchase Order Confirmation" screen but an error happens
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And there is an API error
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

  @jira.QANOV-292104 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-182384
  @jira.link.depends_on.QANOV-182385 @jira.link.depends_on.QANOV-182386 @manual @mobile @regression
  Scenario: A prepay user who wants to pay the pack with balance tries to access to the "Bundle Purchase Order Confirmation" screen but an error happens
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And there is an API error
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

  @jira.QANOV-292105 @android @blaude @jira.cv.13.10 @jira.link.depends_on.QANOV-292103 @manual @mobile @regression
  Scenario: A prepay user who couldn't access to the "Bundle Purchase Order Confirmation" screen after selecting the bank account method can close the warning
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And there is an API error
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Bundle Purchase Payment Methods" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-292106 @android @blaude @jira.cv.13.10 @jira.link.depends_on.QANOV-292104 @manual @mobile @regression
  Scenario: A prepay user who couldn't access to the "Bundle Purchase Order Confirmation" screen after selecting the balance method can close the warning
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And there is an API error
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Bundle Purchase Payment Methods" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-292107 @android @blaude @ios @jira.cv.13.10 @jira.link.depends_on.QANOV-217563 @manual @mobile @regression
  Scenario: A postpay user tries to access to the "Bundle Purchase Order Confirmation" screen but an error happens
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "postpay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Details" page
     When clicks on the "continue_button" button
      And there is an API error
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

  @jira.QANOV-292108 @android @blaude @jira.cv.13.10 @jira.link.depends_on.QANOV-292107 @manual @mobile @regression
  Scenario: A postpay user who couldn't access to the "Bundle Purchase Order Confirmation" screen can close the warning
    Given user has a "postpay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Details" page
     When clicks on the "continue_button" button
      And there is an API error
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Bundle Purchase Payment Methods" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-182394 @android @automatic @ber @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-182391
  @jira.link.depends_on.QANOV-420466 @jira.link.detects.O2DE-1873 @jira.link.parent_test_plan.QANOV-402198 @mobile @qa
  @raitt_drop3 @smoke
  Scenario: A prepay user confirms to pay the pack with his/her bank account: purchase finished successfully
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Bundle Purchase Success Feedback" module configured in CMS for "Bundle Purchase Success Feedback" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
      And clicks on the "bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank." text is displayed
      And the "message" textfield with "Deine Option wird gebucht – dieser Vorgang kann einige Minuten, manchmal länger, dauern. Sobald die Option aktiv ist, erhältst du eine Bestätigung-SMS." text is displayed
      And the "main_button" button with "Zurück zu Optionen" text is displayed
      And the "secondary_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-182399 @android @automatic @ber @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-182396
  @jira.link.depends_on.QANOV-403555 @jira.link.depends_on.QANOV-420467 @jira.link.detects.O2DE-1873
  @jira.link.parent_test_plan.QANOV-402198 @mobile @qa @raitt_drop3 @smoke
  Scenario: A prepay user with enough balance confirms to pay the pack with his/her balance: purchase finished successfully
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has enough balance to purchase bundles
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Bundle Purchase Success Feedback" module configured in CMS for "Bundle Purchase Success Feedback" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
      And clicks on the "balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank." text is displayed
      And the "message" textfield with "Deine Option wird gebucht – dieser Vorgang kann einige Minuten, manchmal länger, dauern. Sobald die Option aktiv ist, erhältst du eine Bestätigung-SMS." text is displayed
      And the "main_button" button with "Zurück zu Optionen" text is displayed
      And the "secondary_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-217565 @android @automatic @ber @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-182392
  @jira.link.depends_on.QANOV-437457 @jira.link.detects.O2DE-1873 @mobile @qa @raitt_drop3 @smoke
  Scenario: A postpay user with a mobile line product confirms to purchase the pack: purchase finished successfully
    Given user has a "postpay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Bundle Purchase Success Feedback" module configured in CMS for "Bundle Purchase Success Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "manage_bundle_button" button
      And the "Bundle Management" page is displayed
      And clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "button_primary" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vielen Dank." text is displayed
      And the "message" textfield with "Deine Option wird gebucht – dieser Vorgang kann einige Minuten, manchmal länger, dauern. Sobald die Option aktiv ist, erhältst du eine Bestätigung-SMS." text is displayed
      And the "main_button" button with "Zurück zu Optionen" text is displayed
      And the "secondary_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-182395 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182391
  @jira.link.depends_on.QANOV-420466 @manual @mobile @regression
  Scenario: A prepay user confirms to pay the pack with his/her bank account but an error happens: purchase finished unsuccessfully
    On iOS devices, an additional "back" button is also displayed.
    Given user has a "prepay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Bundle Purchase Success Feedback" module configured in CMS for "Bundle Purchase Success Feedback" page
      And user is in the "Bundle Purchase Payment Methods" page
     When clicks on the "payment_methods.bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
      And there is an error buying the bundle
     Then the "Bundle Purchase Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Wir können deine Bestellung aktuell nicht bearbeiten." text is displayed
      And the "error_message" textfield with "Möglicherweise ist ein anderer Auftrag noch nicht vollständig ausgeführt. Versuche es in einigen Minuten noch einmal." text is displayed
      And the "back_to_packs_button" button with "Zurück zu Optionen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.QANOV-182401 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182396
  @jira.link.depends_on.QANOV-403555 @jira.link.depends_on.QANOV-420467 @manual @mobile @regression
  Scenario: A prepay user confirms to pay the pack with his/her balance but an error happens: purchase finished unsuccessfully
    On iOS devices, an additional "back" button is also displayed.
    Given user has a "prepay" account type
      And user has enough balance to purchase "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Payment Methods" module configured in CMS for "Bundle Purchase Payment Methods" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Bundle Purchase Error Feedback" module configured in CMS for "Bundle Purchase Error Feedback" page
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Packs" page is displayed
      And clicks on the elegible bundle to purchase
      And the "Purchase Pack details" page is displayed
      And clicks on the "continue_button" button
      And the "Purchase Pack Payment Methods" page is displayed
      And clicks on the "payment_methods.balance_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
      And there is an error buying the bundle
     Then the "Bundle Purchase Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Wir können deine Bestellung aktuell nicht bearbeiten." text is displayed
      And the "error_message" textfield with "Möglicherweise ist ein anderer Auftrag noch nicht vollständig ausgeführt. Versuche es in einigen Minuten noch einmal." text is displayed
      And the "back_to_packs_button" button with "Zurück zu Optionen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.QANOV-217566 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182392
  @jira.link.depends_on.QANOV-437457 @manual @mobile @regression
  Scenario: A postpay user with a mobile line product confirms to purchase the pack but an error happens: purchase finished unsuccessfully
    On iOS devices, an additional "back" button is also displayed.
    Given user has a "postpay" account type
      And user has "any" bundles available to purchase in "any" category
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Categories list" module configured in CMS for "Bundle Management" page
      And user has the "One-shot bundle carousel;Recurrent bundle list" modules configured in CMS for "Category Bundles" page
      And user has the "Bundle Details" module configured in CMS for "Bundle Purchase Details" page
      And user has the "Bundle Purchase Order Confirmation" module configured in CMS for "Bundle Purchase Order Confirmation" page
      And user has the "Bundle Purchase Error Feedback" module configured in CMS for "Bundle Purchase Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Packs" page is displayed
      And clicks on the elegible bundle to purchase
      And the "Purchase Pack details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
      And there is an error buying the bundle
     Then the "Bundle Purchase Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Wir können deine Bestellung aktuell nicht bearbeiten." text is displayed
      And the "error_message" textfield with "Möglicherweise ist ein anderer Auftrag noch nicht vollständig ausgeführt. Versuche es in einigen Minuten noch einmal." text is displayed
      And the "back_to_packs_button" button with "Zurück zu Optionen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-182394
  @jira.link.depends_on.QANOV-182399 @jira.link.depends_on.QANOV-217565 @manual @mobile @regression
  Scenario Outline: A user with a mobile line product who purchased a pack successfully can tap on the "<button_name>" button in the Success Feedback screen
    User can arrive to this Success Feedback by paying the bundle with bank account or with balance.
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Success Feedback" module configured in CMS for "Bundle Purchase Success Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed

    Examples:
          | button_name       | button_id                | destination_page | jira_id      |
          | Keep shopping     | keep_shopping_button     | Category Bundles | QANOV-182402 |
          | Back to dashboard | back_to_dashboard_button | Account          | QANOV-182403 |

  @jira.QANOV-182406 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182395
  @jira.link.depends_on.QANOV-182401 @jira.link.depends_on.QANOV-217566 @jira.link.detects.OBO2DE-265 @manual @mobile
  @regression
  Scenario: A user with a mobile line product who purchased a pack unsuccessfully because of an error can tap on the "Back to packs" button in the Error Feedback screen
    User can arrive to this Error Feedback by paying the bundle with bank account or with balance.
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Error Feedback" module configured in CMS for "Bundle Purchase Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Error Feedback" page
     When clicks on the "back_to_packs_button" button
     Then the "Category Bundles" page is displayed

  @jira.QANOV-182408 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182395 @jira.link.depends_on.QANOV-182401
  @jira.link.depends_on.QANOV-217566 @manual @mobile @regression
  Scenario: A user who purchased a pack unsuccessfully because of an error can go to previous screen from the Error Feedback screen on iOS devices
    User can arrive to this Error Feedback by paying the bundle with bank account or with balance.
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Error Feedback" module configured in CMS for "Bundle Purchase Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Bundle Purchase Order Confirmation" page is displayed
      And the "Order confirmation" header is displayed

  @jira.QANOV-189139 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-182394
  @jira.link.depends_on.QANOV-182399 @jira.link.depends_on.QANOV-217565 @manual @mobile @raitt_drop3 @regression
  Scenario: A mobile user who purchased a pack successfully can see the bundle in active status
    Given user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Success Feedback" module configured in CMS for "Bundle Purchase Success Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
      And the "Account" page is displayed
      And clicks on the "manage_bundle_button" button
      And the "Bundle Management" page is displayed
      And clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
     Then the "my_active_removed_bundles_list" list is displayed
      And the purchased bundle is in the "my_active_removed_bundles_list" list in "active" status

  @jira.QANOV-189146 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-182395
  @jira.link.depends_on.QANOV-182401 @manual @mobile @raitt_drop3 @regression
  Scenario: A prepay user who purchased a pack unsuccessfully cannot see the bundle in "My bundles" screen
    Given user has a "prepay" account type
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Error Feedback" module configured in CMS for "Bundle Purchase Error Feedback" page
      And user is in the "Bundle Purchase Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
      And the "Account" page is displayed
      And clicks on the "manage_bundle_button" button
      And the "Bundle Management" page is displayed
      And clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
     Then the purchased bundle is not in the "my_active_removed_bundles_list" list
      And the purchased bundle is not in the "my_pending_activation_bundles_list" list

  @jira.QANOV-217571 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-217566 @manual @mobile @regression
  Scenario: A postpay user who purchased a pack unsuccessfully cannot see the bundle in "My bundles" screen
    Given user has a "postpay" account type
      And user has not the "ACCOUNT_BOOK_PACK" forbidden use case
      And user has the "Bundle Purchase Error Feedback" module configured in CMS for "Bundle Purchase Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Bundle Purchase Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
      And the "Account" page is displayed
      And clicks on the "manage_bundle_button" button
      And the "Bundle Management" page is displayed
      And clicks on the "my_current_bundles_entrypoint" entrypoint
      And the "My Bundles" page is displayed
     Then the purchased bundle is not in the "my_active_removed_bundles_list" list

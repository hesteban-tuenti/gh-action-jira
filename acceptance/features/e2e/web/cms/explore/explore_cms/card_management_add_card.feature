# -*- coding: utf-8 -*-
@jira.QANOV-9581 @not_hardening
Feature: Card management - add card


  @jira.<jira_id> @<ber> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can access to the add card process when editing a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I click on the "add_cards_button" button
     Then the "Add Card" page is loaded
      And the "new_card_radio_button" element is displayed
      And the "reuse_card_radio_button" element is displayed
      And the "copy_card_radio_button" element is displayed
      And the "cancel_button" element is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | module_type       | cv     | ber | jira_id      |
          | vivobr  | featured content  | 13.10  | ber | QANOV-270603 |
          | vivobr  | vertical cards    | 13.10  |     | QANOV-270604 |
          | vivobr  | rows              | 13.10  |     | QANOV-270605 |
          | vivobr  | highlighted cards | 13.10  |     | QANOV-285904 |
          | vivobr  | banner hero       | 14.3   |     | QANOV-375304 |
          | vivobr  | data cards        | 14.3   |     | QANOV-375305 |
          | vivobr  | display cards     | 14.3   |     | QANOV-375306 |
          | o2uk    | featured content  | 13.10  | ber | QANOV-270606 |
          | o2uk    | vertical cards    | 13.10  |     | QANOV-270607 |
          | o2uk    | rows              | 13.10  |     | QANOV-270608 |
          | o2uk    | highlighted cards | 13.10  |     | QANOV-285905 |
          | o2uk    | banner hero       | 14.3   |     | QANOV-375308 |
          | o2uk    | data cards        | 14.3   |     | QANOV-375309 |
          | o2uk    | display cards     | 14.3   |     | QANOV-375310 |
          | moves   | featured content  | 13.10  | ber | QANOV-270609 |
          | moves   | vertical cards    | 13.10  |     | QANOV-270610 |
          | moves   | rows              | 13.10  |     | QANOV-270611 |
          | moves   | highlighted cards | 13.10  |     | QANOV-285906 |
          | moves   | banner hero       | 14.3   |     | QANOV-375312 |
          | moves   | data cards        | 14.3   |     | QANOV-375313 |
          | moves   | display cards     | 14.3   |     | QANOV-375314 |
          | blaude  | featured content  | 13.10  | ber | QANOV-285907 |
          | blaude  | vertical cards    | 13.10  |     | QANOV-285908 |
          | blaude  | rows              | 13.10  |     | QANOV-285909 |
          | blaude  | highlighted cards | 13.10  |     | QANOV-285910 |
          | blaude  | banner hero       | 14.3   |     | QANOV-375316 |
          | blaude  | data cards        | 14.3   |     | QANOV-375317 |
          | blaude  | display cards     | 14.3   |     | QANOV-375318 |
          | o2de    | featured content  | 14.3   |     | QANOV-375319 |
          | o2de    | vertical cards    | 14.3   |     | QANOV-375320 |
          | o2de    | rows              | 14.3   |     | QANOV-375321 |
          | o2de    | highlighted cards | 14.3   |     | QANOV-375322 |
          | o2de    | banner hero       | 14.3   |     | QANOV-375324 |
          | o2de    | data cards        | 14.3   |     | QANOV-375325 |
          | o2de    | display cards     | 14.3   |     | QANOV-375326 |
          | o2es    | featured content  | Future |     | QANOV-375327 |

    @regression
    Examples:
          | product | module_type         | cv     | ber | jira_id      |
          | vivobr  | data cards advanced | 14.8   |     | QANOV-499883 |
          | vivobr  | poster cards        | 14.8   |     | QANOV-499884 |
          | vivobr  | naked cards         | 14.8   |     | QANOV-499885 |
          | vivobr  | naked small cards   | 14.8   |     | QANOV-499887 |
          | o2uk    | poster cards        | 14.8   |     | QANOV-499889 |
          | o2uk    | naked cards         | 14.8   |     | QANOV-499890 |
          | o2uk    | naked small cards   | 14.8   |     | QANOV-499891 |
          | moves   | poster cards        | 14.8   |     | QANOV-499893 |
          | moves   | naked cards         | 14.8   |     | QANOV-499895 |
          | moves   | naked small cards   | 14.8   |     | QANOV-499896 |
          | blaude  | poster cards        | 14.8   |     | QANOV-499898 |
          | blaude  | naked cards         | 14.8   |     | QANOV-499900 |
          | blaude  | naked small cards   | 14.8   |     | QANOV-499902 |
          | o2de    | poster cards        | 14.8   |     | QANOV-499903 |
          | o2de    | naked cards         | 14.8   |     | QANOV-499904 |
          | o2de    | naked small cards   | 14.8   |     | QANOV-499905 |
          | o2es    | vertical cards      | Future |     | QANOV-375328 |
          | o2es    | rows                | Future |     | QANOV-375329 |
          | o2es    | highlighted cards   | Future |     | QANOV-375330 |
          | o2es    | banner              | Future |     | QANOV-375331 |
          | o2es    | banner hero         | Future |     | QANOV-375332 |
          | o2es    | data cards          | Future |     | QANOV-375333 |
          | o2es    | display cards       | Future |     | QANOV-375334 |
          | o2es    | poster cards        | Future |     | QANOV-499909 |
          | o2es    | naked cards         | Future |     | QANOV-499911 |
          | o2es    | naked small cards   | Future |     | QANOV-499912 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user can cancel the process to add a card when editing a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I click on the "add_cards_button" button
      And the "Add Card" page is loaded
      And I click on the "cancel_button" button
     Then the "Edit Module" page is loaded

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured content    | 13.10  | QANOV-270612 |
          | vivobr  | vertical cards      | 13.10  | QANOV-270613 |
          | vivobr  | rows                | 13.10  | QANOV-270614 |
          | vivobr  | highlighted cards   | 13.10  | QANOV-285917 |
          | vivobr  | banner hero         | 14.3   | QANOV-375336 |
          | vivobr  | data cards          | 14.3   | QANOV-375337 |
          | vivobr  | display cards       | 14.3   | QANOV-375338 |
          | vivobr  | data cards advanced | 14.8   | QANOV-499915 |
          | vivobr  | poster cards        | 14.8   | QANOV-499916 |
          | vivobr  | naked cards         | 14.8   | QANOV-499917 |
          | vivobr  | naked small cards   | 14.8   | QANOV-499919 |
          | o2uk    | featured content    | 13.10  | QANOV-270615 |
          | o2uk    | vertical cards      | 13.10  | QANOV-270616 |
          | o2uk    | rows                | 13.10  | QANOV-270617 |
          | o2uk    | highlighted cards   | 13.10  | QANOV-285918 |
          | o2uk    | banner              | 14.3   | QANOV-375339 |
          | o2uk    | banner hero         | 14.3   | QANOV-375340 |
          | o2uk    | data cards          | 14.3   | QANOV-375341 |
          | o2uk    | display cards       | 14.3   | QANOV-375342 |
          | o2uk    | poster cards        | 14.8   | QANOV-499923 |
          | o2uk    | naked cards         | 14.8   | QANOV-499924 |
          | o2uk    | naked small cards   | 14.8   | QANOV-499925 |
          | moves   | featured content    | 13.10  | QANOV-270618 |
          | moves   | vertical cards      | 13.10  | QANOV-270619 |
          | moves   | rows                | 13.10  | QANOV-270620 |
          | moves   | highlighted cards   | 13.10  | QANOV-285919 |
          | moves   | banner              | 14.3   | QANOV-375343 |
          | moves   | banner hero         | 14.3   | QANOV-375344 |
          | moves   | data cards          | 14.3   | QANOV-328022 |
          | moves   | display cards       | 14.3   | QANOV-328021 |
          | moves   | poster cards        | 14.8   | QANOV-499931 |
          | moves   | naked cards         | 14.8   | QANOV-499933 |
          | moves   | naked small cards   | 14.8   | QANOV-499935 |
          | blaude  | featured content    | 13.10  | QANOV-285920 |
          | blaude  | vertical cards      | 13.10  | QANOV-285921 |
          | blaude  | rows                | 13.10  | QANOV-285922 |
          | blaude  | highlighted cards   | 13.10  | QANOV-285923 |
          | blaude  | banner              | 14.3   | QANOV-375347 |
          | blaude  | banner hero         | 14.3   | QANOV-375348 |
          | blaude  | data cards          | 14.3   | QANOV-375349 |
          | blaude  | display cards       | 14.3   | QANOV-375350 |
          | blaude  | poster cards        | 14.8   | QANOV-499944 |
          | blaude  | naked cards         | 14.8   | QANOV-499946 |
          | blaude  | naked small cards   | 14.8   | QANOV-499948 |
          | o2de    | featured content    | 14.3   | QANOV-375351 |
          | o2de    | vertical cards      | 14.3   | QANOV-375352 |
          | o2de    | rows                | 14.3   | QANOV-375353 |
          | o2de    | highlighted cards   | 14.3   | QANOV-375354 |
          | o2de    | banner              | 14.3   | QANOV-375355 |
          | o2de    | banner hero         | 14.3   | QANOV-375356 |
          | o2de    | data cards          | 14.3   | QANOV-375357 |
          | o2de    | display cards       | 14.3   | QANOV-375358 |
          | o2de    | poster cards        | 14.8   | QANOV-499956 |
          | o2de    | naked cards         | 14.8   | QANOV-499961 |
          | o2de    | naked small cards   | 14.8   | QANOV-499962 |
          | o2es    | featured content    | Future | QANOV-375359 |
          | o2es    | vertical cards      | Future | QANOV-375360 |
          | o2es    | rows                | Future | QANOV-375361 |
          | o2es    | highlighted cards   | Future | QANOV-375362 |
          | o2es    | banner              | Future | QANOV-375363 |
          | o2es    | banner hero         | Future | QANOV-375364 |
          | o2es    | data cards          | Future | QANOV-375365 |
          | o2es    | display cards       | Future | QANOV-375366 |
          | o2es    | poster cards        | Future | QANOV-499967 |
          | o2es    | naked cards         | Future | QANOV-499968 |
          | o2es    | naked small cards   | Future | QANOV-499971 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user can see the title of the cards that are already created for a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "reuse_card_radio_button" button
     Then a dropdown with the existing cards title for that module type is displayed
      And the title of the cards already being used in the current module are not displayed

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured content    | 11.14  | QANOV-9618   |
          | vivobr  | vertical cards      | 11.14  | QANOV-9619   |
          | vivobr  | rows                | 11.14  | QANOV-9620   |
          | vivobr  | highlighted cards   | 11.14  | QANOV-285924 |
          | blaude  | highlighted cards   | 11.14  | QANOV-285930 |
          | vivobr  | banner              | 14.3   | QANOV-375367 |
          | vivobr  | banner hero         | 14.3   | QANOV-375368 |
          | vivobr  | data cards          | 14.3   | QANOV-375369 |
          | vivobr  | display cards       | 14.3   | QANOV-375370 |
          | vivobr  | data cards advanced | 14.8   | QANOV-499980 |
          | vivobr  | poster cards        | 14.8   | QANOV-499981 |
          | vivobr  | naked cards         | 14.8   | QANOV-499982 |
          | vivobr  | naked small cards   | 14.8   | QANOV-499983 |
          | o2uk    | featured content    | 11.14  | QANOV-9622   |
          | o2uk    | vertical cards      | 11.14  | QANOV-9623   |
          | o2uk    | rows                | 11.14  | QANOV-9624   |
          | o2uk    | highlighted cards   | 11.14  | QANOV-285925 |
          | o2uk    | banner              | 14.3   | QANOV-375371 |
          | o2uk    | banner hero         | 14.3   | QANOV-375372 |
          | o2uk    | data cards          | 14.3   | QANOV-375373 |
          | o2uk    | display cards       | 14.3   | QANOV-375374 |
          | o2uk    | poster cards        | 14.8   | QANOV-499989 |
          | o2uk    | naked cards         | 14.8   | QANOV-499991 |
          | o2uk    | naked small cards   | 14.8   | QANOV-499996 |
          | moves   | featured content    | 11.14  | QANOV-9626   |
          | moves   | vertical cards      | 11.14  | QANOV-9627   |
          | moves   | rows                | 11.14  | QANOV-9628   |
          | moves   | highlighted cards   | 11.14  | QANOV-285926 |
          | moves   | banner              | 14.3   | QANOV-375375 |
          | moves   | banner hero         | 14.3   | QANOV-375376 |
          | moves   | data cards          | 14.3   | QANOV-375377 |
          | moves   | display cards       | 14.3   | QANOV-375378 |
          | moves   | poster cards        | 14.8   | QANOV-500005 |
          | moves   | naked cards         | 14.8   | QANOV-500006 |
          | moves   | naked small cards   | 14.8   | QANOV-500008 |
          | blaude  | featured content    | 11.14  | QANOV-285927 |
          | blaude  | vertical cards      | 11.14  | QANOV-285928 |
          | blaude  | rows                | 11.14  | QANOV-285929 |
          | blaude  | banner              | 14.3   | QANOV-375379 |
          | blaude  | banner hero         | 14.3   | QANOV-375380 |
          | blaude  | data cards          | 14.3   | QANOV-375381 |
          | blaude  | display cards       | 14.3   | QANOV-375382 |
          | blaude  | poster cards        | 14.8   | QANOV-500017 |
          | blaude  | naked cards         | 14.8   | QANOV-500018 |
          | blaude  | naked small cards   | 14.8   | QANOV-500021 |
          | o2de    | featured content    | 14.3   | QANOV-375383 |
          | o2de    | vertical cards      | 14.3   | QANOV-375384 |
          | o2de    | rows                | 14.3   | QANOV-375385 |
          | o2de    | highlighted cards   | 14.3   | QANOV-375386 |
          | o2de    | banner              | 14.3   | QANOV-375387 |
          | o2de    | banner hero         | 14.3   | QANOV-375388 |
          | o2de    | data cards          | 14.3   | QANOV-375389 |
          | o2de    | display cards       | 14.3   | QANOV-375390 |
          | o2de    | poster cards        | 14.8   | QANOV-500025 |
          | o2de    | naked cards         | 14.8   | QANOV-500027 |
          | o2de    | naked small cards   | 14.8   | QANOV-500028 |
          | o2es    | featured content    | Future | QANOV-375391 |
          | o2es    | vertical cards      | Future | QANOV-375392 |
          | o2es    | rows                | Future | QANOV-375393 |
          | o2es    | highlighted cards   | Future | QANOV-375394 |
          | o2es    | banner              | Future | QANOV-375395 |
          | o2es    | banner hero         | Future | QANOV-375396 |
          | o2es    | data cards          | Future | QANOV-375397 |
          | o2es    | display cards       | Future | QANOV-375398 |
          | o2es    | poster cards        | Future | QANOV-500037 |
          | o2es    | naked cards         | Future | QANOV-500038 |
          | o2es    | naked small cards   | Future | QANOV-500040 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can reuse an existing card in a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "reuse_card_radio_button" button
      And I click on the "card_selector" element
      And I store the text in the "first_card" element in the context storage with key "reused_card_name"
      And I click on the "first_card" element
      And I click on the "next_button" button
      And the "Edit Module" page is loaded
     Then the "cards_title_list" elements list contains the text "[CONTEXT:reused_card_name]"

    @smoke
    Examples:
          | product | module_type       | cv     | jira_id      |
          | vivobr  | featured content  | 11.14  | QANOV-9630   |
          | vivobr  | vertical cards    | 11.14  | QANOV-9631   |
          | vivobr  | rows              | 11.14  | QANOV-9632   |
          | vivobr  | highlighted cards | 11.14  | QANOV-285931 |
          | vivobr  | banner hero       | 14.3   | QANOV-375400 |
          | vivobr  | data cards        | 14.3   | QANOV-375401 |
          | vivobr  | display cards     | 14.3   | QANOV-375402 |
          | o2uk    | featured content  | 11.14  | QANOV-9634   |
          | o2uk    | vertical cards    | 11.14  | QANOV-9635   |
          | o2uk    | rows              | 11.14  | QANOV-9636   |
          | o2uk    | highlighted cards | 11.14  | QANOV-285932 |
          | o2uk    | banner hero       | 14.3   | QANOV-375404 |
          | o2uk    | data cards        | 14.3   | QANOV-375405 |
          | o2uk    | display cards     | 14.3   | QANOV-375406 |
          | moves   | featured content  | 11.14  | QANOV-9638   |
          | moves   | vertical cards    | 11.14  | QANOV-9639   |
          | moves   | rows              | 11.14  | QANOV-9640   |
          | moves   | highlighted cards | 11.14  | QANOV-285933 |
          | moves   | banner hero       | 14.3   | QANOV-375408 |
          | moves   | data cards        | 14.3   | QANOV-375409 |
          | moves   | display cards     | 14.3   | QANOV-375410 |
          | moves   | display cards     | 14.3   | QANOV-328027 |
          | moves   | data cards        | 14.3   | QANOV-328028 |
          | moves   | banner hero cards | 14.3   | QANOV-328029 |
          | blaude  | featured content  | 11.14  | QANOV-285934 |
          | blaude  | vertical cards    | 11.14  | QANOV-285935 |
          | blaude  | rows              | 11.14  | QANOV-285936 |
          | blaude  | highlighted cards | 11.14  | QANOV-285937 |
          | blaude  | banner hero       | 14.3   | QANOV-375412 |
          | blaude  | data cards        | 14.3   | QANOV-375413 |
          | blaude  | display cards     | 14.3   | QANOV-375414 |
          | o2de    | featured content  | 14.3   | QANOV-375415 |
          | o2de    | vertical cards    | 14.3   | QANOV-375416 |
          | o2de    | rows              | 14.3   | QANOV-375417 |
          | o2de    | highlighted cards | 14.3   | QANOV-375418 |
          | o2de    | banner hero       | 14.3   | QANOV-375420 |
          | o2de    | data cards        | 14.3   | QANOV-375421 |
          | o2de    | display cards     | 14.3   | QANOV-375422 |
          | o2es    | featured content  | Future | QANOV-375423 |

    @regression
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards advanced | 14.8   | QANOV-500060 |
          | vivobr  | poster cards        | 14.8   | QANOV-500061 |
          | vivobr  | naked cards         | 14.8   | QANOV-500062 |
          | vivobr  | naked small cards   | 14.8   | QANOV-500064 |
          | o2uk    | poster cards        | 14.8   | QANOV-500065 |
          | o2uk    | naked cards         | 14.8   | QANOV-500067 |
          | o2uk    | naked small cards   | 14.8   | QANOV-500069 |
          | moves   | poster cards        | 14.8   | QANOV-500070 |
          | moves   | naked cards         | 14.8   | QANOV-500072 |
          | moves   | naked small cards   | 14.8   | QANOV-500075 |
          | blaude  | poster cards        | 14.8   | QANOV-500077 |
          | blaude  | naked cards         | 14.8   | QANOV-500078 |
          | blaude  | naked small cards   | 14.8   | QANOV-500080 |
          | o2de    | poster cards        | 14.8   | QANOV-500081 |
          | o2de    | naked cards         | 14.8   | QANOV-500083 |
          | o2de    | naked small cards   | 14.8   | QANOV-500084 |
          | o2es    | vertical cards      | Future | QANOV-375424 |
          | o2es    | rows                | Future | QANOV-375425 |
          | o2es    | highlighted cards   | Future | QANOV-375426 |
          | o2es    | banner              | Future | QANOV-375427 |
          | o2es    | banner hero         | Future | QANOV-375428 |
          | o2es    | data cards          | Future | QANOV-375429 |
          | o2es    | display cards       | Future | QANOV-375430 |
          | o2es    | poster cards        | Future | QANOV-500089 |
          | o2es    | naked cards         | Future | QANOV-500092 |
          | o2es    | naked small cards   | Future | QANOV-500094 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can copy an existing card in a <module_type> module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "copy_card_radio_button" button
      And I click on the "card_selector" element
      And I store the text in the "first_card" element in the context storage with key "copy_card_name"
      And I click on the "first_card" element
      And I click on the "next_button" button
      And the "Edit card" page is loaded
      And I click on the "next_button" button
      And I click on the "next_button" button
      And I click on the "select_tracking_tag_selector" button
      And I click on the "1" element in the "select_tracking_tag_selector" list
      And I click on the "save_button" button
     Then the "crouton_message" textfield with "Card has been created successfully" text is displayed
      And the "cards_title_list" elements list contains the text "[CONTEXT:copy_card_name]"

    @smoke
    Examples:
          | product | module_type       | cv     | jira_id      |
          | vivobr  | featured content  | 14.3   | QANOV-466744 |
          | vivobr  | vertical cards    | 14.3   | QANOV-466745 |
          | vivobr  | rows              | 14.3   | QANOV-466746 |
          | vivobr  | highlighted cards | 14.3   | QANOV-466747 |
          | vivobr  | banner hero       | 14.3   | QANOV-466749 |
          | vivobr  | data cards        | 14.3   | QANOV-466750 |
          | vivobr  | display cards     | 14.3   | QANOV-466751 |
          | o2uk    | featured content  | 14.3   | QANOV-466752 |
          | o2uk    | vertical cards    | 14.3   | QANOV-466753 |
          | o2uk    | rows              | 14.3   | QANOV-466754 |
          | o2uk    | highlighted cards | 14.3   | QANOV-466755 |
          | o2uk    | banner hero       | 14.3   | QANOV-466757 |
          | o2uk    | data cards        | 14.3   | QANOV-466758 |
          | o2uk    | display cards     | 14.3   | QANOV-466759 |
          | moves   | featured content  | 14.3   | QANOV-466760 |
          | moves   | vertical cards    | 14.3   | QANOV-466761 |
          | moves   | rows              | 14.3   | QANOV-466763 |
          | moves   | highlighted cards | 14.3   | QANOV-466764 |
          | moves   | display cards     | 14.3   | QANOV-466765 |
          | moves   | data cards        | 14.3   | QANOV-466766 |
          | moves   | banner hero       | 14.3   | QANOV-466769 |
          | moves   | data cards        | 14.3   | QANOV-466770 |
          | moves   | display cards     | 14.3   | QANOV-466771 |
          | blaude  | featured content  | 14.3   | QANOV-466772 |
          | blaude  | vertical cards    | 14.3   | QANOV-466773 |
          | blaude  | rows              | 14.3   | QANOV-466774 |
          | blaude  | highlighted cards | 14.3   | QANOV-466776 |
          | blaude  | banner hero       | 14.3   | QANOV-466778 |
          | blaude  | data cards        | 14.3   | QANOV-466779 |
          | blaude  | display cards     | 14.3   | QANOV-466781 |
          | o2de    | featured content  | 14.3   | QANOV-466782 |
          | o2de    | vertical cards    | 14.3   | QANOV-466785 |
          | o2de    | rows              | 14.3   | QANOV-466786 |
          | o2de    | highlighted cards | 14.3   | QANOV-466787 |
          | o2de    | banner hero       | 14.3   | QANOV-466790 |
          | o2de    | data cards        | 14.3   | QANOV-466791 |
          | o2de    | display cards     | 14.3   | QANOV-466792 |
          | o2es    | featured content  | Future | QANOV-466794 |

    @regression
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards advanced | 14.8   | QANOV-500108 |
          | vivobr  | poster cards        | 14.8   | QANOV-500109 |
          | vivobr  | naked cards         | 14.8   | QANOV-500110 |
          | vivobr  | naked small cards   | 14.8   | QANOV-500112 |
          | o2uk    | poster cards        | 14.8   | QANOV-500113 |
          | o2uk    | naked cards         | 14.8   | QANOV-500115 |
          | o2uk    | naked small cards   | 14.8   | QANOV-500116 |
          | moves   | poster cards        | 14.8   | QANOV-500117 |
          | moves   | naked cards         | 14.8   | QANOV-500118 |
          | moves   | naked small cards   | 14.8   | QANOV-500119 |
          | blaude  | poster cards        | 14.8   | QANOV-500120 |
          | blaude  | naked cards         | 14.8   | QANOV-500121 |
          | blaude  | naked small cards   | 14.8   | QANOV-500123 |
          | o2de    | poster cards        | 14.8   | QANOV-500124 |
          | o2de    | naked cards         | 14.8   | QANOV-500125 |
          | o2de    | naked small cards   | 14.8   | QANOV-500126 |
          | o2es    | vertical cards      | Future | QANOV-466795 |
          | o2es    | rows                | Future | QANOV-466796 |
          | o2es    | highlighted cards   | Future | QANOV-466797 |
          | o2es    | banner              | Future | QANOV-466798 |
          | o2es    | banner hero         | Future | QANOV-466799 |
          | o2es    | data cards          | Future | QANOV-466800 |
          | o2es    | display cards       | Future | QANOV-466801 |
          | o2es    | poster cards        | Future | QANOV-500128 |
          | o2es    | naked cards         | Future | QANOV-500129 |
          | o2es    | naked small cards   | Future | QANOV-500130 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user with "<module_type>" created that selects the <option> card option cannot continue without selecting a card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I click on the "add_cards_button" button
      And the "Add Card" page is loaded
      And I click on the "reuse_card_radio_button" button
      And I click on the "next_button" button
      And waits until the "validation_error" element is visible
     Then the "validation_error" element is under "<option>_card_radio_button" element

    Examples:
          | product | module_type         | option | cv     | jira_id      |
          | vivobr  | featured content    | reuse  | 13.10  | QANOV-270621 |
          | vivobr  | featured content    | copy   | 14.3   | QANOV-466805 |
          | vivobr  | vertical cards      | reuse  | 13.10  | QANOV-375431 |
          | vivobr  | vertical cards      | copy   | 14.3   | QANOV-466806 |
          | vivobr  | rows                | reuse  | 13.10  | QANOV-375432 |
          | vivobr  | rows                | copy   | 14.3   | QANOV-466807 |
          | vivobr  | highlighted cards   | reuse  | 13.10  | QANOV-375433 |
          | vivobr  | highlighted cards   | copy   | 14.3   | QANOV-466808 |
          | vivobr  | banner hero         | copy   | 14.3   | QANOV-466810 |
          | vivobr  | banner hero         | reuse  | 14.3   | QANOV-375447 |
          | vivobr  | data cards          | copy   | 14.3   | QANOV-466812 |
          | vivobr  | data cards          | reuse  | 14.3   | QANOV-375448 |
          | vivobr  | display cards       | copy   | 14.3   | QANOV-466813 |
          | vivobr  | display cards       | reuse  | 14.3   | QANOV-375449 |
          | vivobr  | data cards advanced | reuse  | 14.8   | QANOV-500131 |
          | vivobr  | data cards advanced | copy   | 14.8   | QANOV-500132 |
          | vivobr  | poster cards        | reuse  | 14.8   | QANOV-500133 |
          | vivobr  | poster cards        | copy   | 14.8   | QANOV-500134 |
          | vivobr  | naked cards         | reuse  | 14.8   | QANOV-500136 |
          | vivobr  | naked cards         | copy   | 14.8   | QANOV-500137 |
          | vivobr  | naked small cards   | reuse  | 14.8   | QANOV-500138 |
          | vivobr  | naked small cards   | copy   | 14.8   | QANOV-500139 |
          | o2uk    | featured content    | reuse  | 13.10  | QANOV-375434 |
          | o2uk    | featured content    | copy   | 14.3   | QANOV-466815 |
          | o2uk    | vertical cards      | reuse  | 13.10  | QANOV-270622 |
          | o2uk    | vertical cards      | copy   | 14.3   | QANOV-466814 |
          | o2uk    | rows                | reuse  | 13.10  | QANOV-375435 |
          | o2uk    | rows                | copy   | 14.3   | QANOV-466816 |
          | o2uk    | highlighted cards   | reuse  | 13.10  | QANOV-375436 |
          | o2uk    | highlighted cards   | copy   | 14.3   | QANOV-466818 |
          | o2uk    | banner hero         | copy   | 14.3   | QANOV-466820 |
          | o2uk    | banner hero         | reuse  | 14.3   | QANOV-375451 |
          | o2uk    | data cards          | copy   | 14.3   | QANOV-466821 |
          | o2uk    | data cards          | reuse  | 14.3   | QANOV-375452 |
          | o2uk    | display cards       | copy   | 14.3   | QANOV-466822 |
          | o2uk    | display cards       | reuse  | 14.3   | QANOV-375453 |
          | o2uk    | poster cards        | reuse  | 14.8   | QANOV-500142 |
          | o2uk    | poster cards        | copy   | 14.8   | QANOV-500143 |
          | o2uk    | naked cards         | reuse  | 14.8   | QANOV-500144 |
          | o2uk    | naked cards         | copy   | 14.8   | QANOV-500145 |
          | o2uk    | naked small cards   | reuse  | 14.8   | QANOV-500146 |
          | o2uk    | naked small cards   | copy   | 14.8   | QANOV-500149 |
          | moves   | featured content    | reuse  | 13.10  | QANOV-375437 |
          | moves   | featured content    | copy   | 14.3   | QANOV-466825 |
          | moves   | vertical cards      | reuse  | 13.10  | QANOV-375438 |
          | moves   | vertical cards      | copy   | 14.3   | QANOV-466826 |
          | moves   | highlighted cards   | reuse  | 13.10  | QANOV-375439 |
          | moves   | highlighted cards   | copy   | 14.3   | QANOV-466827 |
          | moves   | rows                | reuse  | 13.10  | QANOV-270623 |
          | moves   | rows                | copy   | 14.3   | QANOV-466824 |
          | moves   | banner hero         | copy   | 14.3   | QANOV-466832 |
          | moves   | banner hero         | reuse  | 14.3   | QANOV-375455 |
          | moves   | data cards          | copy   | 14.3   | QANOV-466833 |
          | moves   | data cards          | reuse  | 14.3   | QANOV-375456 |
          | moves   | display cards       | copy   | 14.3   | QANOV-466834 |
          | moves   | display cards       | reuse  | 14.3   | QANOV-375457 |
          | moves   | poster cards        | reuse  | 14.8   | QANOV-500151 |
          | moves   | poster cards        | copy   | 14.8   | QANOV-500152 |
          | moves   | naked cards         | reuse  | 14.8   | QANOV-500153 |
          | moves   | naked cards         | copy   | 14.8   | QANOV-500155 |
          | moves   | naked small cards   | reuse  | 14.8   | QANOV-500156 |
          | moves   | naked small cards   | copy   | 14.8   | QANOV-500157 |
          | blaude  | featured content    | reuse  | 13.10  | QANOV-375440 |
          | blaude  | featured content    | copy   | 14.3   | QANOV-466836 |
          | blaude  | vertical cards      | reuse  | 13.10  | QANOV-375441 |
          | blaude  | vertical cards      | copy   | 14.3   | QANOV-466837 |
          | blaude  | highlighted cards   | reuse  | 13.10  | QANOV-285938 |
          | blaude  | highlighted cards   | copy   | 14.3   | QANOV-466835 |
          | blaude  | rows                | reuse  | 13.10  | QANOV-375442 |
          | blaude  | rows                | copy   | 14.3   | QANOV-466838 |
          | blaude  | banner hero         | copy   | 14.3   | QANOV-466841 |
          | blaude  | banner hero         | reuse  | 14.3   | QANOV-375459 |
          | blaude  | data cards          | copy   | 14.3   | QANOV-466842 |
          | blaude  | data cards          | reuse  | 14.3   | QANOV-375460 |
          | blaude  | display cards       | copy   | 14.3   | QANOV-466843 |
          | blaude  | display cards       | reuse  | 14.3   | QANOV-375461 |
          | blaude  | poster cards        | reuse  | 14.8   | QANOV-500158 |
          | blaude  | poster cards        | copy   | 14.8   | QANOV-500159 |
          | blaude  | naked cards         | reuse  | 14.8   | QANOV-500160 |
          | blaude  | naked cards         | copy   | 14.8   | QANOV-500161 |
          | blaude  | naked small cards   | reuse  | 14.8   | QANOV-500162 |
          | blaude  | naked small cards   | copy   | 14.8   | QANOV-500163 |
          | o2de    | featured content    | copy   | 14.3   | QANOV-466845 |
          | o2de    | featured content    | reuse  | 14.3   | QANOV-375462 |
          | o2de    | vertical cards      | copy   | 14.3   | QANOV-466846 |
          | o2de    | vertical cards      | reuse  | 14.3   | QANOV-375463 |
          | o2de    | rows                | copy   | 14.3   | QANOV-466847 |
          | o2de    | rows                | reuse  | 14.3   | QANOV-375464 |
          | o2de    | highlighted cards   | copy   | 14.3   | QANOV-466848 |
          | o2de    | highlighted cards   | reuse  | 14.3   | QANOV-375465 |
          | o2de    | banner hero         | copy   | 14.3   | QANOV-466851 |
          | o2de    | banner hero         | reuse  | 14.3   | QANOV-375467 |
          | o2de    | data cards          | copy   | 14.3   | QANOV-466852 |
          | o2de    | data cards          | reuse  | 14.3   | QANOV-375468 |
          | o2de    | display cards       | copy   | 14.3   | QANOV-466853 |
          | o2de    | display cards       | reuse  | 14.3   | QANOV-375469 |
          | o2de    | poster cards        | reuse  | 14.8   | QANOV-500165 |
          | o2de    | poster cards        | copy   | 14.8   | QANOV-500166 |
          | o2de    | naked cards         | reuse  | 14.8   | QANOV-500167 |
          | o2de    | naked cards         | copy   | 14.8   | QANOV-500168 |
          | o2de    | naked small cards   | reuse  | 14.8   | QANOV-500169 |
          | o2de    | naked small cards   | copy   | 14.8   | QANOV-500170 |
          | o2es    | featured content    | reuse  | Future | QANOV-375470 |
          | o2es    | featured content    | copy   | Future | QANOV-466854 |
          | o2es    | vertical cards      | reuse  | Future | QANOV-375471 |
          | o2es    | vertical cards      | copy   | Future | QANOV-466855 |
          | o2es    | rows                | reuse  | Future | QANOV-375472 |
          | o2es    | rows                | copy   | Future | QANOV-466856 |
          | o2es    | highlighted cards   | reuse  | Future | QANOV-375473 |
          | o2es    | highlighted cards   | copy   | Future | QANOV-466857 |
          | o2es    | banner hero         | reuse  | Future | QANOV-375475 |
          | o2es    | banner hero         | copy   | Future | QANOV-466860 |
          | o2es    | data cards          | reuse  | Future | QANOV-375476 |
          | o2es    | data cards          | copy   | Future | QANOV-466861 |
          | o2es    | display cards       | reuse  | Future | QANOV-375477 |
          | o2es    | display cards       | copy   | Future | QANOV-466862 |
          | o2es    | poster cards        | reuse  | Future | QANOV-500172 |
          | o2es    | poster cards        | copy   | Future | QANOV-500173 |
          | o2es    | naked cards         | reuse  | Future | QANOV-500174 |
          | o2es    | naked cards         | copy   | Future | QANOV-500175 |
          | o2es    | naked small cards   | reuse  | Future | QANOV-500176 |
          | o2es    | naked small cards   | copy   | Future | QANOV-500177 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.detects.TGT-1949 @jira.link.parent_test_plan.QANOV-285803 @manual
  @regression @web
  Scenario Outline: A user can cancel to create a new card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I select the "<module_type>" option from "filter_by_modules_type_selector" field
      And I click on the "edit_module" field on the "0" element in the "module_list" web list
      And the "Edit Module" page is loaded
      And I store the length of the items in "cards_list" list in the context storage with key "number_total_cards"
      And I click on the "add_cards_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "header_cancel_button" button
     Then the "Edit Module" page is loaded
      And the length of the "cards_list" list is "[CONTEXT:number_total_cards]"

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured content    | 13.10  | QANOV-270624 |
          | vivobr  | vertical cards      | 13.10  | QANOV-375478 |
          | vivobr  | rows                | 13.10  | QANOV-375479 |
          | vivobr  | highlighted cards   | 13.10  | QANOV-375480 |
          | vivobr  | banner              | 14.3   | QANOV-375493 |
          | vivobr  | banner hero         | 14.3   | QANOV-375494 |
          | vivobr  | data cards          | 14.3   | QANOV-375495 |
          | vivobr  | display cards       | 14.3   | QANOV-375496 |
          | vivobr  | data cards advanced | 14.8   | QANOV-500178 |
          | vivobr  | poster cards        | 14.8   | QANOV-500179 |
          | vivobr  | naked cards         | 14.8   | QANOV-500180 |
          | vivobr  | naked small cards   | 14.8   | QANOV-500181 |
          | o2uk    | featured content    | 13.10  | QANOV-375481 |
          | o2uk    | vertical cards      | 13.10  | QANOV-270625 |
          | o2uk    | rows                | 13.10  | QANOV-375482 |
          | o2uk    | highlighted cards   | 13.10  | QANOV-375483 |
          | o2uk    | banner              | 14.3   | QANOV-375497 |
          | o2uk    | banner hero         | 14.3   | QANOV-375498 |
          | o2uk    | data cards          | 14.3   | QANOV-375499 |
          | o2uk    | display cards       | 14.3   | QANOV-375500 |
          | o2uk    | poster cards        | 14.8   | QANOV-500185 |
          | o2uk    | naked cards         | 14.8   | QANOV-500187 |
          | o2uk    | naked small cards   | 14.8   | QANOV-500189 |
          | moves   | featured content    | 13.10  | QANOV-375484 |
          | moves   | vertical cards      | 13.10  | QANOV-375485 |
          | moves   | rows                | 13.10  | QANOV-270626 |
          | moves   | highlighted cards   | 13.10  | QANOV-375486 |
          | moves   | display cards       | 14.3   | QANOV-375490 |
          | moves   | data cards          | 14.3   | QANOV-375491 |
          | moves   | banner              | 14.3   | QANOV-375501 |
          | moves   | banner hero         | 14.3   | QANOV-375502 |
          | moves   | data cards          | 14.3   | QANOV-375503 |
          | moves   | display cards       | 14.3   | QANOV-375504 |
          | moves   | poster cards        | 14.8   | QANOV-500192 |
          | moves   | naked cards         | 14.8   | QANOV-500193 |
          | moves   | naked small cards   | 14.8   | QANOV-500194 |
          | blaude  | featured content    | 13.10  | QANOV-375487 |
          | blaude  | vertical cards      | 13.10  | QANOV-375488 |
          | blaude  | rows                | 13.10  | QANOV-375489 |
          | blaude  | highlighted cards   | 13.10  | QANOV-285939 |
          | blaude  | banner              | 14.3   | QANOV-375505 |
          | blaude  | banner hero         | 14.3   | QANOV-375506 |
          | blaude  | data cards          | 14.3   | QANOV-375507 |
          | blaude  | display cards       | 14.3   | QANOV-375508 |
          | blaude  | poster cards        | 14.8   | QANOV-500195 |
          | blaude  | naked cards         | 14.8   | QANOV-500196 |
          | blaude  | naked small cards   | 14.8   | QANOV-500197 |
          | o2de    | featured content    | 14.3   | QANOV-375509 |
          | o2de    | vertical cards      | 14.3   | QANOV-375510 |
          | o2de    | rows                | 14.3   | QANOV-375511 |
          | o2de    | highlighted cards   | 14.3   | QANOV-375512 |
          | o2de    | banner              | 14.3   | QANOV-375513 |
          | o2de    | banner hero         | 14.3   | QANOV-375514 |
          | o2de    | data cards          | 14.3   | QANOV-375515 |
          | o2de    | display cards       | 14.3   | QANOV-375516 |
          | o2de    | poster cards        | 14.8   | QANOV-500201 |
          | o2de    | naked cards         | 14.8   | QANOV-500202 |
          | o2de    | naked small cards   | 14.8   | QANOV-500203 |
          | o2es    | featured content    | Future | QANOV-375517 |
          | o2es    | vertical cards      | Future | QANOV-375518 |
          | o2es    | rows                | Future | QANOV-375519 |
          | o2es    | highlighted cards   | Future | QANOV-375520 |
          | o2es    | banner              | Future | QANOV-375521 |
          | o2es    | banner hero         | Future | QANOV-375522 |
          | o2es    | data cards          | Future | QANOV-375523 |
          | o2es    | display cards       | Future | QANOV-375524 |
          | o2es    | poster cards        | Future | QANOV-500208 |
          | o2es    | naked cards         | Future | QANOV-500209 |
          | o2es    | naked small cards   | Future | QANOV-500210 |

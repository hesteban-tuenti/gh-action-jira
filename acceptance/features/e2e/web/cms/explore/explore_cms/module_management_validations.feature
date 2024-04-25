# -*- coding: utf-8 -*-
@jira.QANOV-269854 @not_hardening
Feature: Module management - validations


  @jira.<jira_id> @<product> @regression @web
  Scenario Outline: A user can not create a <module_type> module if the fields are left empty
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path. All fields in this screen are mandatory"
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "create_module_button" button
      And the "Create Module" page is loaded
      And I click on the "<module_button>" button
      And the "<module_button>" element is enabled
      And I click on the "create_button" button
     Then the "validation_error" element is under "internal_name_input" element

    @automatic @jira.cv.11.14 @qa
    Examples:
          | product | module_type      | module_button        | depends_on   | jira_id      |
          | vivobr  | featured content | new_featured_content | QANOV-9538   | QANOV-9544   |
          | vivobr  | vertical cards   | new_vertical_cards   | QANOV-9538   | QANOV-9547   |
          | vivobr  | rows             | new_rows             | QANOV-9538   | QANOV-9550   |
          | vivobr  | banner           | new_banner           | QANOV-9538   | QANOV-9553   |
          | o2uk    | featured content | new_featured_content | QANOV-9539   | QANOV-9545   |
          | o2uk    | vertical cards   | new_vertical_cards   | QANOV-9539   | QANOV-9548   |
          | o2uk    | rows             | new_rows             | QANOV-9539   | QANOV-9551   |
          | o2uk    | banner           | new_banner           | QANOV-9539   | QANOV-9554   |
          | moves   | featured content | new_featured_content | QANOV-9540   | QANOV-9546   |
          | moves   | vertical cards   | new_vertical_cards   | QANOV-9540   | QANOV-9549   |
          | moves   | rows             | new_rows             | QANOV-9540   | QANOV-9552   |
          | moves   | banner           | new_banner           | QANOV-9540   | QANOV-9555   |
          | blaude  | featured content | new_featured_content | QANOV-286046 | QANOV-286091 |
          | blaude  | vertical cards   | new_vertical_cards   | QANOV-286046 | QANOV-286092 |
          | blaude  | rows             | new_rows             | QANOV-286046 | QANOV-286093 |
          | blaude  | banner           | new_banner           | QANOV-286046 | QANOV-286094 |

    @jira.cv.14.3 @manual
    Examples:
          | product | module_type         | module_button           | depends_on   | jira_id      |
          | vivobr  | highlighted cards   | new_highlighted_cards   |              | QANOV-384902 |
          | vivobr  | data cards          | new_data_cards          |              | QANOV-384906 |
          | vivobr  | display cards       | new_display_cards       |              | QANOV-384911 |
          | vivobr  | banner hero         | new_banner_hero         |              | QANOV-384916 |
          | vivobr  | data cards advanced | new_data_cards_advanced |              | QANOV-492557 |
          | vivobr  | poster cards        | new_poster_cards        |              | QANOV-492558 |
          | vivobr  | naked cards         | new_naked_cards         |              | QANOV-492559 |
          | vivobr  | naked small cards   | new_naked_small_cards   |              | QANOV-492560 |
          | o2uk    | highlighted cards   | new_highlighted_cards   |              | QANOV-384903 |
          | o2uk    | data cards          | new_data_cards          |              | QANOV-384907 |
          | o2uk    | display cards       | new_display_cards       |              | QANOV-384912 |
          | o2uk    | banner hero         | new_banner_hero         |              | QANOV-384917 |
          | o2uk    | poster cards        | new_poster_cards        |              | QANOV-492561 |
          | o2uk    | naked cards         | new_naked_cards         |              | QANOV-492562 |
          | o2uk    | naked small cards   | new_naked_small_cards   |              | QANOV-492563 |
          | moves   | highlighted cards   | new_highlighted_cards   |              | QANOV-384904 |
          | moves   | data cards          | new_data_cards          |              | QANOV-384908 |
          | moves   | display cards       | new_display_cards       |              | QANOV-384913 |
          | moves   | banner hero         | new_banner_hero         |              | QANOV-384918 |
          | moves   | poster cards        | new_poster_cards        |              | QANOV-492564 |
          | moves   | naked cards         | new_naked_cards         |              | QANOV-492565 |
          | moves   | naked small cards   | new_naked_small_cards   |              | QANOV-492566 |
          | blaude  | highlighted cards   | new_highlighted_cards   | QANOV-286046 | QANOV-286095 |
          | blaude  | data cards          | new_data_cards          |              | QANOV-384909 |
          | blaude  | display cards       | new_display_cards       |              | QANOV-384914 |
          | blaude  | banner hero         | new_banner_hero         |              | QANOV-384919 |
          | blaude  | poster cards        | new_poster_cards        |              | QANOV-492567 |
          | blaude  | naked cards         | new_naked_cards         |              | QANOV-492568 |
          | blaude  | naked small cards   | new_naked_small_cards   |              | QANOV-492569 |
          | o2de    | featured content    | new_featured_content    |              | QANOV-384898 |
          | o2de    | vertical cards      | new_vertical_cards      |              | QANOV-384899 |
          | o2de    | rows                | new_rows                |              | QANOV-384900 |
          | o2de    | banner              | new_banner              |              | QANOV-384901 |
          | o2de    | highlighted cards   | new_highlighted_cards   |              | QANOV-384905 |
          | o2de    | data cards          | new_data_cards          |              | QANOV-384910 |
          | o2de    | display cards       | new_display_cards       |              | QANOV-384915 |
          | o2de    | banner hero         | new_banner_hero         |              | QANOV-384920 |
          | o2de    | poster cards        | new_poster_cards        |              | QANOV-492570 |
          | o2de    | naked cards         | new_naked_cards         |              | QANOV-492571 |
          | o2de    | naked small cards   | new_naked_small_cards   |              | QANOV-492572 |

    @jira.cv.Future
    Examples:
          | product | module_type       | module_button         | depends_on | jira_id      |
          | vivobr  | virtual module    | new_virtual_module    |            | QANOV-390049 |
          | moves   | virtual module    | new_virtual_module    |            | QANOV-390050 |
          | o2uk    | virtual module    | new_virtual_module    |            | QANOV-390051 |
          | o2de    | virtual module    | new_virtual_module    |            | QANOV-390052 |
          | blaude  | virtual module    | new_virtual_module    |            | QANOV-390053 |
          | o2es    | featured content  | new_featured_content  |            | QANOV-384921 |
          | o2es    | vertical cards    | new_vertical_cards    |            | QANOV-384922 |
          | o2es    | rows              | new_rows              |            | QANOV-384923 |
          | o2es    | banner            | new_banner            |            | QANOV-384924 |
          | o2es    | highlighted cards | new_highlighted_cards |            | QANOV-384925 |
          | o2es    | data cards        | new_data_cards        |            | QANOV-384926 |
          | o2es    | display cards     | new_display_cards     |            | QANOV-384927 |
          | o2es    | banner hero       | new_banner_hero       |            | QANOV-384928 |
          | o2es    | virtual module    | new_virtual_module    |            | QANOV-390048 |
          | o2es    | poster cards      | new_poster_cards      |            | QANOV-492573 |
          | o2es    | naked cards       | new_naked_cards       |            | QANOV-492574 |
          | o2es    | naked small cards | new_naked_small_cards |            | QANOV-492575 |

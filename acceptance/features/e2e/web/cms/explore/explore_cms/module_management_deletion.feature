# -*- coding: utf-8 -*-
@jira.QANOV-389965 @not_hardening
Feature: Module management - deletion


  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-386148 @manual @regression @web
  Scenario Outline: A user can delete a <module_type> module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I store the text in the "virtual_module" element in the context storage with key "module_name"
      And I click on the "<module_type>_actions_icon" button
      And I click on the "actions_icon_delete_button" button
      And the popup with "Delete module?" title and "This module will be permanently deleted. This action cant´t be undone." message is displayed
      And I click on the "pop_up_delete_button" button
     Then the "Modules Repository" page is loaded
      And no element in the "modules_list" list has the value "[CONTEXT:module_name]" in the "name" field

    @jira.cv.Future
    Examples:
          | product | module_type         | jira_id      |
          | vivobr  | featured_content    | QANOV-389966 |
          | vivobr  | vertical_cards      | QANOV-389967 |
          | vivobr  | rows                | QANOV-389968 |
          | vivobr  | banner              | QANOV-389969 |
          | vivobr  | highlighted_cards   | QANOV-389970 |
          | vivobr  | data_cards          | QANOV-389971 |
          | vivobr  | display_cards       | QANOV-389972 |
          | vivobr  | banner_hero         | QANOV-389973 |
          | vivobr  | virtual_modules     | QANOV-390007 |
          | vivobr  | data_cards_advanced | QANOV-492374 |
          | vivobr  | poster_cards        | QANOV-492375 |
          | vivobr  | naked_cards         | QANOV-492376 |
          | vivobr  | naked_small_cards   | QANOV-492377 |
          | vivobr  | carousel_module     | QANOV-492378 |
          | moves   | featured_content    | QANOV-389974 |
          | moves   | vertical_cards      | QANOV-389975 |
          | moves   | rows                | QANOV-389976 |
          | moves   | banner              | QANOV-389977 |
          | moves   | highlighted_cards   | QANOV-389978 |
          | moves   | data_cards          | QANOV-389979 |
          | moves   | display_cards       | QANOV-389980 |
          | moves   | banner_hero         | QANOV-389981 |
          | moves   | virtual_modules     | QANOV-390009 |
          | moves   | poster_cards        | QANOV-492379 |
          | moves   | naked_cards         | QANOV-492380 |
          | moves   | naked_small_cards   | QANOV-492381 |
          | moves   | carousel_module     | QANOV-492382 |
          | blaude  | featured_content    | QANOV-389982 |
          | blaude  | vertical_cards      | QANOV-389983 |
          | blaude  | rows                | QANOV-389984 |
          | blaude  | banner              | QANOV-389985 |
          | blaude  | highlighted_cards   | QANOV-389986 |
          | blaude  | data_cards          | QANOV-389988 |
          | blaude  | display_cards       | QANOV-389989 |
          | blaude  | banner_hero         | QANOV-389990 |
          | blaude  | virtual_modules     | QANOV-390010 |
          | blaude  | poster_cards        | QANOV-492383 |
          | blaude  | naked_cards         | QANOV-492384 |
          | blaude  | naked_small_cards   | QANOV-492385 |
          | blaude  | carousel_module     | QANOV-492386 |
          | o2de    | featured_content    | QANOV-389991 |
          | o2de    | vertical_cards      | QANOV-389992 |
          | o2de    | rows                | QANOV-389993 |
          | o2de    | banner              | QANOV-389994 |
          | o2de    | highlighted_cards   | QANOV-389995 |
          | o2de    | data_cards          | QANOV-389996 |
          | o2de    | display_cards       | QANOV-389997 |
          | o2de    | banner_hero         | QANOV-389998 |
          | o2de    | virtual_modules     | QANOV-390011 |
          | o2de    | poster_cards        | QANOV-492387 |
          | o2de    | naked_cards         | QANOV-492388 |
          | o2de    | naked_small_cards   | QANOV-492389 |
          | o2de    | carousel_module     | QANOV-492390 |
          | o2uk    | featured_content    | QANOV-389999 |
          | o2uk    | vertical_cards      | QANOV-390000 |
          | o2uk    | rows                | QANOV-390001 |
          | o2uk    | banner              | QANOV-390002 |
          | o2uk    | highlighted_cards   | QANOV-390003 |
          | o2uk    | data_cards          | QANOV-390004 |
          | o2uk    | display_cards       | QANOV-390005 |
          | o2uk    | banner_hero         | QANOV-390006 |
          | o2uk    | virtual_modules     | QANOV-390012 |
          | o2uk    | poster_cards        | QANOV-492391 |
          | o2uk    | naked_cards         | QANOV-492392 |
          | o2uk    | naked_small_cards   | QANOV-492393 |
          | o2uk    | carousel_module     | QANOV-492394 |
          | o2es    | featured_content    | QANOV-390014 |
          | o2es    | vertical_cards      | QANOV-390015 |
          | o2es    | rows                | QANOV-390016 |
          | o2es    | banner              | QANOV-390017 |
          | o2es    | highlighted_cards   | QANOV-390019 |
          | o2es    | data_cards          | QANOV-390020 |
          | o2es    | display_cards       | QANOV-390021 |
          | o2es    | banner_hero         | QANOV-390022 |
          | o2es    | virtual_modules     | QANOV-390013 |
          | o2es    | poster_cards        | QANOV-492395 |
          | o2es    | naked_cards         | QANOV-492396 |
          | o2es    | naked_small_cards   | QANOV-492397 |
          | o2es    | carousel_module     | QANOV-492398 |

# -*- coding: utf-8 -*-
@jira.QANOV-623447
Feature: Search flow


  @jira.<jira_id> @<product> @<test_priority> @android @e2e @har @ios @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  Scenario Outline: A <product> user can see the search icon in the navigation top bar in the <main_tab> tab
    Given user is in the "<main_tab>" page
     Then the "navigation_top_bar.search_icon" icon is displayed

    Examples:
          | product | main_tab    | test_priority | jira_id      |
          | vivobr  | Start       | smoke         | QANOV-623448 |
          | vivobr  | Assinaturas | sanity        | QANOV-623449 |
          | vivobr  | Explore     | smoke         | QANOV-623450 |
          | vivobr  | Finanzas    | smoke         | QANOV-623451 |

  @jira.QANOV-623452 @android @e2e @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can see the search icon in the navigation top bar in Valoriza tab
    Given user has any "convergente;beatrix;multivivo;jeri control;jeri postpay;legacy control;legacy postpay;control_n" account types
      And user is in the "Valoriza" page
     Then the "navigation_top_bar.search_icon" icon is displayed

  @jira.QANOV-623453 @android @e2e @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can see the search icon in the navigation top bar in Topup tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user is in the "Recarga" page
     Then the "navigation_top_bar.search_icon" icon is displayed

  @jira.QANOV-623454 @android @e2e @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can see the search input box in the Menu Mais screen
    Given user is in the "Menu Mais" page
     Then the "search_input" inputtext with the "[LANG:search.search_result.input_placeholder]" placeholder is displayed
      And the "search_icon" icon is displayed

  @jira.<jira_id> @<product> @<test_priority> @android @e2e @har @ios @jira.cv.Future
  @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  Scenario Outline: A <product> user can access to the Search screen from the navigation top bar in the <main_tab> tab
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.search_icon" icon
     Then the "Search" page is displayed
      And the "spinner" element is displayed
      And the "search_input" inputtext is displayed
      And the keyboard is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<main_tab>" page is displayed

    Examples:
          | product | main_tab    | test_priority | jira_id      |
          | vivobr  | Start       | smoke         | QANOV-623455 |
          | vivobr  | Assinaturas | sanity        | QANOV-623456 |
          | vivobr  | Explore     | smoke         | QANOV-623457 |
          | vivobr  | Finanzas    | smoke         | QANOV-623458 |

  @jira.QANOV-623459 @android @e2e @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can access to the Search screen from the navigation top bar in Valoriza tab
    Given user has any "convergente;beatrix;multivivo;jeri control;jeri postpay;legacy control;legacy postpay;control_n" account types
      And user is in the "Valoriza" page
     When clicks on the "navigation_top_bar.search_icon" icon
     Then the "Search" page is displayed
      And the "spinner" element is displayed
      And the "search_input" inputtext is displayed
      And the keyboard is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Valoriza" page is displayed

  @jira.QANOV-623460 @android @e2e @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can access to the Search screen from the navigation top bar in Topup tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user is in the "Recarga" page
     When clicks on the "navigation_top_bar.search_icon" icon
     Then the "Search" page is displayed
      And the "spinner" element is displayed
      And the "search_input" inputtext is displayed
      And the keyboard is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Recarga" page is displayed

  @jira.QANOV-623461 @android @e2e @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can access to the Search screen from the Menu Mais screen
    Given user is in the "Menu Mais" page
     When clicks on the "search_input" inputtext
     Then the "Search" page is displayed
      And the "spinner" element is displayed
      And the "search_input" inputtext is displayed
      And the keyboard is displayed
      And hides the keyboard
      And clicks on the "navigation_top_bar.back_button" button
      And the "Menu Mais" page is displayed

  @jira.QANOV-623462 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @sanity @vivobr
  Scenario: A vivobr user can see the main Search screen with suggestions for shortcuts and FAQs entrypoints
    Given user is in the "Start" page
     When clicks on the "navigation_top_bar.search_icon" icon
     Then the "Search" page is displayed
      And the "spinner" element is displayed
      And the "title" textfield with "[LANG:search.search_result.title]" text is displayed
      And the "search_input" inputtext with the "[LANG:search.search_result.input_placeholder]" placeholder is displayed
      And the "shortcuts_title" textfield with "[LANG:search.search_result.shortcuts_title]" text is displayed
      And the "shortcuts_list" list is displayed
      And each element in the "shortcuts_list" list has the "title" field
      And each element in the "shortcuts_list" list has the "chevron" field
      And the "shortcuts_list" list has "3" elements
      And all the elements in the "shortcuts_list" list are clickable
      And the "faqs_title" textfield with "[LANG:search.search_result.faqs_title]" text is displayed
      And the "faqs_list" list is displayed
      And each element in the "faqs_list" list has the "title" field
      And each element in the "faqs_list" list has the "chevron" field
      And the "faqs_list" list has "5" elements
      And all the elements in the "faqs_list" list are clickable

  @jira.QANOV-623463 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile @smoke
  @vivobr
  Scenario: A vivobr user can access to the answer screen tapping in a shortcuts suggestion entrypoint in the search screen
    Given user is in the "Start" page
     When clicks on the "navigation_top_bar.search_icon" icon
      And the "Search" page is displayed
      And clicks on any element in the "shortcuts_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Search" page is displayed
      And the "shortcuts_list" list has "3" elements
      And the "faqs_list" list has "5" elements

  @jira.QANOV-623464 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile @smoke
  @vivobr
  Scenario: A vivobr user can access to the answer screen tapping in a faqs suggestion entrypoint in the Search screen
    Given user is in the "Start" page
     When clicks on the "navigation_top_bar.search_icon" icon
      And the "Search" page is displayed
      And clicks on any element in the "faqs_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Search" page is displayed
      And the "shortcuts_list" list has "3" elements
      And the "faqs_list" list has "5" elements

  @jira.<jira_id> @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile @smoke
  @vivobr
  Scenario Outline: A vivobr user can perform a search that returns <number_results> results for the shortcuts
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns "<number_results>" results for the search for shortcuts
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "shortcuts_title" textfield with "[LANG:search.search_result.shortcuts_title]" text is displayed
      And the "shortcuts_list" list is displayed
      And each element in the "shortcuts_list" list has the "title" field
      And each element in the "shortcuts_list" list has the "chevron" field
      And the "shortcuts_list" list has "<number_results>" elements
      And all the elements in the "shortcuts_list" list are clickable
      And the "see_all_shortcuts" link is not displayed

    Examples:
          | number_results | jira_id      |
          | 1              | QANOV-623465 |
          | 3              | QANOV-623466 |

  @jira.<jira_id> @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile @smoke
  @vivobr
  Scenario Outline: A vivobr user can perform a search that returns <number_results> results for the faqs
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns "<number_results>" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "faqs_title" textfield with "[LANG:search.search_result.faqs_title]" text is displayed
      And the "faqs_list" list is displayed
      And each element in the "faqs_list" list has the "title" field
      And each element in the "faqs_list" list has the "chevron" field
      And the "faqs_list" list has "<number_results>" elements
      And all the elements in the "faqs_list" list are clickable
      And the "see_all_faqs" link is not displayed

    Examples:
          | number_results | jira_id      |
          | 1              | QANOV-623467 |
          | 5              | QANOV-623468 |

  @jira.QANOV-623469 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @sanity @vivobr
  Scenario: A vivobr user can perform a search that returns >3 results for the shortcuts
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">3" results for the search for shortcuts
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "shortcuts_title" textfield with "[LANG:search.search_result.shortcuts_title]" text is displayed
      And the "shortcuts_list" list is displayed
      And each element in the "shortcuts_list" list has the "title" field
      And each element in the "shortcuts_list" list has the "chevron" field
      And the "shortcuts_list" list has "3" elements
      And all the elements in the "shortcuts_list" list are clickable
      And the "see_all_shortcuts" link is displayed

  @jira.QANOV-623470 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @sanity @vivobr
  Scenario: A vivobr user can perform a search that returns >5 results for the faqs
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">5" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "faqs_title" textfield with "[LANG:search.search_result.faqs_title]" text is displayed
      And the "faqs_list" list is displayed
      And the "faqs_list" list has "5" elements
      And all the elements in the "faqs_list" list are clickable
      And the "see_all_faqs" link is displayed

  @jira.QANOV-623471 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can access to see all shortcuts when the search returns >3 results
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">3" results for the search for shortcuts
      And clicks on the enter key for the "search_input" inputtext
      And clicks on the "see_all_shortcuts" link
     Then the "Shortcuts Search Result" page is displayed
      And the "shortcuts_title" textfield with "[LANG:search.search_result.shortcuts_title]" text is displayed
      And the "shortcuts_list" list is displayed
      And the "shortcuts_list" list has ">3" elements
      And all the elements in the "shortcuts_list" list are clickable
      And clicks on the "navigation_top_bar.back_button" button
      And the "Search" page is displayed

  @jira.QANOV-623472 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @smoke @vivobr
  Scenario: A vivobr user can access to see all fqas when the search returns >5 results
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">5" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
      And clicks on the "see_all_faqs" link
     Then the "FAQs Search Result" page is displayed
      And the "faqs_title" textfield with "[LANG:search.search_result.faqs_title]" text is displayed
      And the "faqs_list" list is displayed
      And the "faqs_list" list has ">5" elements
      And all the elements in the "faqs_list" list are clickable
      And clicks on the "navigation_top_bar.back_button" button
      And the "Search" page is displayed

  @jira.QANOV-623473 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @regression @vivobr
  Scenario: A vivobr user can perform a search that returns no results for the shortcuts
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns "0" results for the search for shortcuts and ">0" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "faqs_title" textfield with "[LANG:search.search_result.faqs_title]" text is displayed
      And the "faqs_list" list is displayed
      And the "shortcuts_title" textfield is not displayed
      And the "shortcuts_list" list is not displayed

  @jira.QANOV-623474 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @regression @vivobr
  Scenario: A vivobr user can perform a search that returns no results for the faqs
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">0" results for the search for shortcuts and "0" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "shortcuts_title" textfield with "[LANG:search.search_result.shortcuts_title]" text is displayed
      And the "shortcuts_list" list is displayed
      And the "faqs_title" textfield is not displayed
      And the "faqs_list" list is not displayed

  @jira.QANOV-623475 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @regression @vivobr
  Scenario: A vivobr user can perform a search that returns no results
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns "0" results for the search for shortcuts and "0" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
     Then the "searching_skeleton" element is displayed
      And the "no_results_icon" icon is displayed
      And the "no_results_title" textfield with "[LANG:search.no_result.title]" text is displayed
      And the "no_results_subtitle" textfield with "[LANG:search.no_result.subtitle]" text is displayed

  @jira.QANOV-623476 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @sanity @vivobr
  Scenario: A vivobr user can access to the answer screen tapping in a shortcuts results entrypoint in the search screen
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">0" results for the search for shortcuts and ">0" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
      And clicks on any element in the "shortcuts_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Search" page is displayed
      And the "shortcuts_list" list has ">0" elements
      And the "faqs_list" list has ">0" elements

  @jira.QANOV-623477 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile @smoke
  @vivobr
  Scenario: A vivobr user can access to the answer screen tapping in a faqs results entrypoint in the Search screen
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">0" results for the search for shortcuts and ">0" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
      And clicks on any element in the "faqs_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Search" page is displayed
      And the "shortcuts_list" list has ">0" elements
      And the "faqs_list" list has ">0" elements

  @jira.QANOV-623478 @android @ber @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @regression @vivobr
  Scenario: A vivobr user can access to the answer screen tapping in a shortcuts results entrypoint in the Shortcuts Search Result screen
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">3" results for the search for shortcuts
      And clicks on the enter key for the "search_input" inputtext
      And clicks on the "see_all_shortcuts" link
      And the "Shortcuts Search Result" page is displayed
      And clicks on any element in the "shortcuts_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Shortcuts Search Result" page is displayed
      And the "shortcuts_list" list has ">3" elements

  @jira.QANOV-623479 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-603294 @manual @mobile
  @regression @vivobr
  Scenario: A vivobr user can access to the answer screen tapping in a faqs results entrypoint in the FAQs Search Result screen
    Given user is in the "Search" page
     When fills the "search_input" inputtext with a text that returns ">5" results for the search for faqs
      And clicks on the enter key for the "search_input" inputtext
      And clicks on the "see_all_faqs" link
      And the "FAQs Search Result" page is displayed
      And clicks on any element in the "faqs_list" list
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "FAQs Search Result" page is displayed
      And the "faqs_list" list has ">5" elements

# -*- coding: utf-8 -*-
@jira.QANOV-325122
Feature: Entertainment section

  Actions Before each Scenario:
    Given user is in the "Dashboard" page


  @jira.QANOV-325123 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @sanity @webapp
  Scenario: User with 1 tv can see the entertainment module in the main dashboard page
    The title will be that of the TV plan's name
    Given user has "1" products of "tv" type
      And user has the "hub-products-summary-tv" module configured in CMS for "dashboard-user" page
      And waits until the "entertainment_section.link" element is visible
     Then the "entertainment_title" textfield is displayed
      And the "entertainment_section" module is displayed
      And the "entertainment_section.title" textfield is displayed
      And the "entertainment_section.icon" icon is displayed
      And the "entertainment_section.link" link with "Más información" text is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile
  @moves
  Scenario Outline: User with >1 tv can see the entertainment module in the main dashboard page
    The title of each row will be that of the TV plan's name
    Given user has "<num_products>" products of "tv" type
      And user has the "hub-products-summary-tv" module configured in CMS for "dashboard-user" page
      And the "entertainment_section" module is displayed
      And the "entertainment_section.title" textfield is displayed
      And the "entertainment_section.icon" icon is displayed
      And the "entertainment_section.products_list" list has "<num_products>" entries
      And each element in the "entertainment_section.products_list" list has the "title" field
      And each element in the "entertainment_section.products_list" list has the "chevron" field
      And the "entertainment_section.link" link with "Más información" text is displayed

    Examples:
          | num_products | test_priority | jira_id      |
          | 2            | smoke         | QANOV-325124 |
          | 3            | regression    | QANOV-325125 |

  @jira.QANOV-325126 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @sanity @webapp
  Scenario: User with 1 TV can access the TV dashboard from the entertainment module
    Given user has "1" products of "tv" type
      And user has the "hub-products-summary-tv" module configured in CMS for "dashboard-user" page
      And waits until the "entertainment_section.link" element is visible
     When clicks on the "entertainment_section.link" link
     Then the "TV Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-325127 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User with >1 TV can access the entertainment dashboard from the entertainment module
    Given user has ">1" products of "tv" type
      And user has the "hub-products-summary-tv" module configured in CMS for "dashboard-user" page
     When clicks on the "entertainment_section.link" link
     Then the "Entertainment Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-325128 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User with >1 TV can access the TV dashboard from the entertainment module
    Given user has ">1" products of "tv" type
      And user has the "hub-products-summary-tv" module configured in CMS for "dashboard-user" page
     When clicks on any element in the "entertainment_section.products_list" list
     Then the "TV Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-325129 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User can see the Entertainment dashboard page
    There will be a section for each TV plan that the user has
    Given user has ">1" products of "tv" type
      And user is in the "Entertainment Dashboard" page
     Then the "Entretenimiento" header is displayed
      And the "title" textfield with "Televisión" text is displayed
      And the "tv_plans_module" module is displayed

  @jira.QANOV-323174 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User can see a services module in the entertainment dashboard
    Given user has ">1" products of "tv" type
      And user is in the "Entertainment Dashboard" page
      And user has the "services-summary" module configured in CMS for "user-tv" page
     Then the "interest_services_carousel" carousel is displayed

  @jira.QANOV-325130 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User can see a TV product in the Entertainment dashboard page
    The tv_section_title comes from API and the row title will that of the TV plan's name
    Given user has ">1" products of "tv" type
      And user is in the "Entertainment Dashboard" page
     Then the "tv_section_title" textfield that contains the "PRODUCTOS EN CONFIGURACIÓN" text is displayed
      And the "tv_section_plan1.tv_row" entrypoint is displayed
      And the "tv_section_plan1.tv_row.icon" icon is displayed
      And the "tv_section_plan1.tv_row.title" textfield is displayed
      And the "tv_section_plan1.tv_row.chevron" icon is displayed

  @jira.QANOV-325132 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can access the TV dashboard from the Entertainment dashboard page
    Given user has ">1" products of "tv" type
      And user is in the "Entertainment Dashboard" page
     When clicks on the "tv_section_plan1.tv_row" entrypoint
     Then the "TV Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Entertainment Dashboard" page is displayed

  @jira.QANOV-467598 @android @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-464853 @manual @mobile @moves @smoke
  @webapp
  Scenario: User without TV product and Movistar+ OTT service not activated will see the Entertainment section with an "Activar" button
    Given user has "0" products of "tv" type
      And user has a "admin" role
      And user has the "movistar_plus_ott" service in "deactivated" status
     Then the "entertainment_title" textfield is displayed
      And the "entertainment_section" module is displayed
      And the "entertainment_section.icon" icon is displayed
      And the "entertainment_section.label" textfield with "Pendiente de activar" text is displayed
      And the "entertainment_section.title" textfield with "Movistar Plus+" text is displayed
      And the "entertainment_section.button" button with "Activar" text is displayed
      And the "entertainment_section.link" link with "Más información" text is displayed

  @jira.QANOV-467599 @android @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-464853 @manual @mobile @moves
  @regression @webapp
  Scenario: User without TV product and Movistar+ OTT service activated will see the Entertainment section without an "Activar" button
    Given user has "0" products of "tv" type
      And user has a "admin" role
      And user has the "movistar_plus_ott" service in "activated" status
     Then the "entertainment_title" textfield is displayed
      And the "entertainment_section" module is displayed
      And the "entertainment_section.icon" icon is displayed
      And the "entertainment_section.label" textfield is not displayed
      And the "entertainment_section.title" textfield with "Movistar Plus+" text is displayed
      And the "entertainment_section.button" button is not displayed
      And the "entertainment_section.link" link with "Más información" text is displayed

  @jira.QANOV-467600 @TBD @android @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-464853 @manual @mobile @moves
  @regression
  Scenario: User without TV product and Movistar+ OTT service not activated taps on the "Activar" button: OB webview will be displayed
    Given user has "0" products of "tv" type
      And user has a "admin" role
      And user has the "movistar_plus_ott" service in "deactivated" status
     When clicks on the "entertainment_section.button" button
     Then the internal webview with "Área privada" header is displayed
      And the "TBD" string is displayed

  @jira.QANOV-467601 @TBD @android @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-464853 @manual @mobile @moves
  @regression
  Scenario: User without TV product taps on the "Más información" link: OB webview will be displayed
    Given user has "0" products of "tv" type
      And user has a "admin" role
     When clicks on the "entertainment_section.button" button
     Then the internal webview with "Área privada" header is displayed
      And the "TBD" string is displayed

  @jira.QANOV-467602 @android @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-464853 @manual @mobile @moves
  @regression @webapp
  Scenario: ADMIN-LIGHT without TV product and Movistar+ OTT service activated won't see the Entertainment section
    Given user has "0" products of "tv" type
      And user has the "movistar+_ott" service in "activated" status
      And user has a "admin-light" role
     Then the "entertainment_title" textfield is not displayed
      And the "entertainment_section" module is not displayed

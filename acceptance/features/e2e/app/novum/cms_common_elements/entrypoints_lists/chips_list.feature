# -*- coding: utf-8 -*-
@jira.QANOV-373502
Feature: Entrypoints Lists - Chips list


  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.chips_list
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a basic chips list when there is a chips list configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.chips_list" carousel is displayed

    Examples:
          | product | parent_test_plan          | cv   | jira_id      |
          | vivobr  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-373503 |
          | o2uk    |                           | 14.5 | QANOV-373504 |
          | moves   |                           | 14.5 | QANOV-373505 |
          | blaude  |                           | 14.5 | QANOV-373506 |
          | o2de    |                           | 24.0 | QANOV-373507 |

  @jira.QANOV-554879 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @sanity
  @vivobr
  Scenario: A user can see a basic chips list when there is a chips list configured in CMS for an entrypoint list of type API
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps included in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.chips_list" carousel is displayed

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.chips_list_with_summary_of_3_items_and_summary_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the chips list summary with title when there is a chips list configured in CMS with title and max number of elements to show in summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And the list of entrypoints configured in CMS has a "title" defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.title" textfield with "[CONTEXT:current_module.entrypoint_list_title]" text is displayed
      And the "entrypoint_list.chips_list" carousel is displayed
      And the "entrypoint_list.chips_list" list has "3" elements

    Examples:
          | product | parent_test_plan          | cv   | jira_id      |
          | vivobr  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-373508 |
          | o2uk    |                           | 14.5 | QANOV-373509 |
          | moves   |                           | 14.5 | QANOV-373510 |
          | blaude  |                           | 14.5 | QANOV-373511 |
          | o2de    |                           | 24.0 | QANOV-373512 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.chips_list_with_summary_of_3_items_and_both_titles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the complete entrypoint list with the full title when there is a chips list configured with full title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And the list of entrypoints configured in CMS has a "full_title" defined
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "[CONTEXT:current_module.entrypoint_list_full_title]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan          | cv   | jira_id      |
          | vivobr  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-373513 |
          | o2uk    |                           | 14.5 | QANOV-373514 |
          | moves   |                           | 14.5 | QANOV-373515 |
          | blaude  |                           | 14.5 | QANOV-373516 |
          | o2de    |                           | 24.0 | QANOV-373517 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @qa @regression
  @fixture.cms.entrypoint_list.chips_list
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can swipe the entrypoints of the chips list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.chips_list" carousel can be swiped

    @ios @manual
    Examples:
          | product | parent_test_plan          | cv   | jira_id      |
          | vivobr  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-373518 |
          | o2uk    |                           | 14.5 | QANOV-373519 |
          | moves   |                           | 14.5 | QANOV-373520 |
          | blaude  |                           | 14.5 | QANOV-373521 |
          | o2de    |                           | 24.0 | QANOV-373522 |

    @android @automatic
    Examples:
          | product | parent_test_plan          | cv   | jira_id      |
          | vivobr  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-377499 |
          | o2uk    |                           | 14.5 | QANOV-377500 |
          | moves   |                           | 14.5 | QANOV-377501 |
          | blaude  |                           | 14.5 | QANOV-377502 |
          | o2de    |                           | 24.0 | QANOV-377503 |

  @jira.QANOV-373523 @android @automatic @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.entrypoint_list.chips_list_with_summary_of_3_items_and_icons
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario: A user can see all cards of full entrypoint list with icons when the chips list allows icons and all entrypoint have icons
    Entrypoints with icon show their configured icons.
    Entrypoints without icons show a default icon.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And the list of entrypoints configured in CMS has an entrypoint with icon defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And any element in the "entrypoints_list" list has the "icon" field

  @jira.QANOV-373528 @android @automatic @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.entrypoint_list.chips_list_with_summary_of_3_items_and_both_titles
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario: A user can see no icon in full entrypoint list when all cards have icons and the chips list denies icons
    Regardless wheter the entrypoint has icon or not, no icon is shown
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And the list of entrypoints configured in CMS has an entrypoint with icon defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And no element in the "entrypoints_list" list has the "icon" field

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.chips_list
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entry point when there is a custom entry point with preconfigured url to <preconfiguration>
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.chips_list" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | header        | button       | parent_test_plan          | cv   | jira_id      |
          | vivobr  | services-list    | Mais serviços | back_button  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-373538 |
          | blaude  | NAME_CHANGE      | Namen ändern  | close_button |                           | 14.5 | QANOV-373539 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | back_button  |                           | 14.5 | QANOV-373540 |
          | moves   | invoices_list    | Facturas      | back_button  |                           | 14.5 | QANOV-373541 |
          | o2de    | NAME_CHANGE      | Namen ändern  | close_button |                           | 24.0 | QANOV-373542 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @smoke
  @fixture.cms.entrypoint_list.chips_list
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a card with custom url pointing to an external webview of a chips list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CHIPS" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.chips_list" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan          | cv   | jira_id      |
          | vivobr  | QANOV-359861:QANOV-437472 | 14.5 | QANOV-373533 |
          | o2uk    |                           | 14.5 | QANOV-373534 |
          | moves   |                           | 14.5 | QANOV-373535 |
          | blaude  |                           | 14.5 | QANOV-373536 |
          | o2de    |                           | 24.0 | QANOV-373537 |

# -*- coding: utf-8 -*-
@jira.QANOV-153386
Feature: Entrypoints Lists


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user without entrypoint lists in CMS won't see any list in Account screen
    Given user does not have any entrypoint list configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "entrypoints_list" element is not on display

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153387 |
          | o2uk    | 13.0 | QANOV-153388 |
          | moves   | 13.0 | QANOV-153389 |
          | blaude  | 14.1 | QANOV-189720 |
          | o2de    | 24.0 | QANOV-189721 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.entrypoint_list.<status>
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user won't see the entrypoints list when there is a list configured in <status> status in CMS
    To be tested in QA environment.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "<status>" status
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is not on display

    Examples:
          | product | status      | cv   | jira_id      |
          | vivobr  | DRAFT       | 12.8 | QANOV-153390 |
          | vivobr  | UNPUBLISHED | 12.8 | QANOV-153391 |
          | o2uk    | DRAFT       | 13.0 | QANOV-153392 |
          | o2uk    | UNPUBLISHED | 13.0 | QANOV-153393 |
          | moves   | DRAFT       | 13.0 | QANOV-153394 |
          | moves   | UNPUBLISHED | 13.0 | QANOV-153395 |
          | blaude  | DRAFT       | 14.1 | QANOV-189722 |
          | blaude  | UNPUBLISHED | 14.1 | QANOV-189723 |
          | o2de    | DRAFT       | 24.0 | QANOV-189724 |
          | o2de    | UNPUBLISHED | 24.0 | QANOV-189725 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entrypoint list with title when there is a list configured with Title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a "title" defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list.title" textfield with "[CONTEXT:current_module.entrypoint_list_title]" text is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153396 |
          | o2uk    | 13.0 |                           | QANOV-153397 |
          | moves   | 13.0 | QANOV-525492              | QANOV-153398 |
          | blaude  | 14.1 |                           | QANOV-189726 |
          | o2de    | 24.0 |                           | QANOV-189727 |

  @jira.QANOV-554881 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @smoke @vivobr
  Scenario: A user can see the entrypoint list with title when there is a list of type API configured with Title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps included in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has a "title" defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list.title" textfield with "[CONTEXT:current_module.entrypoint_list_title]" text is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_full_page_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entrypoint list with the full title when there is a list configured with Full title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a "full_title" defined
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view "with" see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
      And waits until the "entrypoint_list" element is visible
     When clicks on the "entrypoint_list.see_all" button
      And the "Modular Page Full Entrypoint List" page is displayed
     Then the "[CONTEXT:current_module.entrypoint_list_full_title]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153399 |
          | o2uk    | 13.0 | QANOV-153400 |
          | blaude  | 14.1 | QANOV-189728 |
          | o2de    | 24.0 | QANOV-189729 |

    @jira.link.parent_test_plan.QANOV-525492
    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.0 | QANOV-153401 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_full_page_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the link to see all entrypoints when there is a list configured with the see all link in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list.see_all" link with "[LANG:account.entrypoint_list.see_all]" text is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153402 |
          | o2uk    | 13.0 |                           | QANOV-153403 |
          | moves   | 13.0 | QANOV-525492              | QANOV-153404 |
          | blaude  | 14.1 |                           | QANOV-189730 |
          | o2de    | 24.0 |                           | QANOV-189731 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_full_page_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user is redirected to the screen with the whole list when clicks on the see all link
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view "with" see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "entrypoints_list" list has "[CONTEXT:current_module.num_entrypoints]" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153405 |
          | o2uk    | 13.0 |                           | QANOV-153406 |
          | moves   | 13.0 | QANOV-525492              | QANOV-153407 |
          | blaude  | 14.1 |                           | QANOV-189732 |
          | o2de    | 24.0 |                           | QANOV-189733 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.detects.ACCOUNT-21597
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_full_page_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can go back to the previous screen from the page with the whole list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view "with" see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
      And the "Modular Page Full Entrypoint List" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
     Then the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153408 |
          | o2uk    | 13.0 |                           | QANOV-153409 |
          | moves   | 13.0 | QANOV-525492              | QANOV-153410 |
          | blaude  | 14.1 |                           | QANOV-189734 |
          | o2de    | 24.0 |                           | QANOV-189735 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression
  @fixture.cms.entrypoint_list.with_summary_of_<num_entrypoints>_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see <num_entrypoints> entry points in the summary list when there is a list configured with <num_entrypoints> entry points in summary view in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view "with" see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has "<num_entrypoints>" services in summary
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list.list" list has "<num_entrypoints>" elements

    Examples:
          | product | cv   | num_entrypoints | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | 1               | QANOV-359861:QANOV-437472 | QANOV-153411 |
          | vivobr  | 12.8 | 3               | QANOV-359861:QANOV-437472 | QANOV-153412 |
          | o2uk    | 13.0 | 1               |                           | QANOV-153413 |
          | o2uk    | 13.0 | 3               |                           | QANOV-153414 |
          | moves   | 13.0 | 1               | QANOV-525492              | QANOV-153415 |
          | moves   | 13.0 | 3               | QANOV-525492              | QANOV-153416 |
          | blaude  | 14.1 | 1               |                           | QANOV-189736 |
          | blaude  | 14.1 | 3               |                           | QANOV-189737 |
          | o2de    | 24.0 | 1               |                           | QANOV-189738 |
          | o2de    | 24.0 | 3               |                           | QANOV-189739 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user won't see the 'see all' link when the number of entrypoints is less than the total of entrypoints
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view "with" see all link
      And the list of entrypoints configured in CMS has less services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list.see_all" link is not displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-155808 |
          | o2uk    | 13.0 |                           | QANOV-155809 |
          | moves   | 13.0 | QANOV-525492              | QANOV-155810 |
          | blaude  | 14.1 |                           | QANOV-189740 |
          | o2de    | 24.0 |                           | QANOV-189741 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entry points displayed as a list when there is a list configured with list (full width) representation in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "LIST" visual representation
     When user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is on display
      And the "entrypoint_list.border" border is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153417 |
          | o2uk    | 13.0 | QANOV-153418 |
          | moves   | 13.0 | QANOV-153419 |
          | blaude  | 14.1 | QANOV-189742 |
          | o2de    | 24.0 | QANOV-189743 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.boxed
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entry points wrapped in a border when there is a list configured with boxed representation in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "BOXED_LIST" visual representation
     When user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is on display
      And the "entrypoint_list.border" border is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.7 | QANOV-419762 |
          | o2uk    | 14.7 | QANOV-419763 |
          | blaude  | 14.7 | QANOV-419765 |
          | o2de    | 24.0 | QANOV-419766 |

    @jira.link.parent_test_plan.QANOV-525492
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.7 | QANOV-419764 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.with_icons
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see an entrypoint with icon when there is an entrypoint defined with icons in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has an entrypoint with icon defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "title" field with "[CONTEXT:current_entrypoint.displayName]" text element in the "entrypoint_list.list" list has the "icon" icon

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 13.0 | QANOV-359861:QANOV-437472 | QANOV-436121 |
          | o2uk    | 13.0 |                           | QANOV-153427 |
          | moves   | 13.0 | QANOV-525492              | QANOV-153428 |
          | o2de    | 24.0 |                           | QANOV-189749 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entry points titles defined in CMS in the entrypoints list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then each element in the "entrypoint_list.list" entrypoint list has the "title" field with value defined in CMS
      And each element has the "chevron" field displayed in the "entrypoint_list.list" list

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153429 |
          | o2uk    | 13.0 |                           | QANOV-153430 |
          | moves   | 13.0 | QANOV-525492              | QANOV-153431 |
          | blaude  | 14.1 |                           | QANOV-189750 |
          | o2de    | 24.0 |                           | QANOV-189751 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @smoke
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entry point when there is a custom entry point with custom url pointing to an external webview
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.list" list with the "title" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153432 |
          | o2uk    | 13.0 |                           | QANOV-153433 |
          | moves   | 13.0 |                           | QANOV-153434 |
          | blaude  | 14.1 |                           | QANOV-189752 |
          | o2de    | 24.0 |                           | QANOV-189753 |

  @jira.<jira_id> @<priority> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entry point when there is a custom entry point with preconfigured url to <header>
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.list" list with the "title" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Entrypoints" modular page is displayed

    @automatic @qa
    Examples:
          | product | preconfiguration | header        | cv   | parent_test_plan          | priority | button       | jira_id      |
          | vivobr  | services-list    | Mais serviços | 12.8 | QANOV-359861:QANOV-437472 | smoke    | back_button  | QANOV-155811 |
          | blaude  | NAME_CHANGE      | Namen ändern  | 14.1 |                           | smoke    | close_button | QANOV-325446 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | 13.0 |                           | smoke    | back_button  | QANOV-155812 |
          | moves   | invoices_list    | Facturas      | 13.0 |                           | smoke    | back_button  | QANOV-182653 |
          | o2de    | NAME_CHANGE      | Namen ändern  | 24.0 |                           | smoke    | close_button | QANOV-553501 |

  @jira.<jira_id> @<ber> @<priority> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.with_<cms_audience>_audience
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see an entrypoint when there is a custom entrypoint configured for the audience <cms_audience> in CMS
    To be executed in qa environment if the expected data is not configured in Live
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a "custom" entrypoint
      And the entrypoint configured in CMS has the "<cms_audience>" audience
      And user has the "<account_type>" account types
      And user has a "<plan_product>" product
      And user has a "<plan>" plan
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then any element in the "entrypoint_list.list" list has the "title" textfield with the "[CONTEXT:current_entrypoint.displayName]" text

    Examples:
          | product | cv   | account_type | cms_audience        | ber | priority | plan_product | plan | jira_id      |
          | moves   | 13.0 | postpay      | postpay             | ber | smoke    | any          | any  | QANOV-153466 |
          | moves   | 13.0 | telco        | ob-telco            | ber | smoke    | any          | any  | QANOV-182675 |
          | o2uk    | 13.0 | postpay      | postpay             |     | smoke    | any          | any  | QANOV-181711 |
          | vivobr  | 12.8 | convergente  | user-is-convergente | ber | smoke    | any          | any  | QANOV-153462 |
          | blaude  | 14.1 | postpay      | postpay             | ber | smoke    | any          | any  | QANOV-325447 |

  @jira.QANOV-182676 @android @ios @jira.cv.13.0 @manual @mobile @moves @regression
  Scenario: A user can see an entrypoint when there is a custom entrypoint configured for the audience telco-admin-full in CMS
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has a "custom" entrypoint
      And the entrypoint configured in CMS has the "telco-admin-full" audience
      And user has a "telco" account type
      And user has a "admin" role
      And user is in the "Account" page
     Then the "[CONTEXT:entrypoints_list.configured_entrypoint]" element is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.0 @manual @mobile @o2uk @regression
  Scenario Outline: A user can see an entrypoint when there is a custom entrypoint configured for the audience <cms_audience> in CMS
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has a "custom" entrypoint
      And the entrypoint configured in CMS has the "<cms_audience>" audience
      And user "has" O2 <service>
      And user is in the "Account" page
     Then the "[CONTEXT:entrypoints_list.configured_entrypoint]" element is displayed

    Examples:
          | service | cms_audience | jira_id      |
          | Wifi    | o2-wifi      | QANOV-181718 |
          | Drive   | o2-drive     | QANOV-181719 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user clicks on an entry point when there is a custom entry point with several targets for different audiences configured in CMS
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has a "custom" entrypoint
      And the entrypoint configured in CMS has the "custom" url to "<url1>" for audience "audience1"
      And the entrypoint configured in CMS has the "custom" url to "<url2>" for audience "audience2"
      And user has a "<account_type>" account type
      And user is in the "Account" page
     When clicks on the "[CONTEXT:entrypoints_list.configured_entrypoint]" link
     Then the external webview with "<url2>" url is displayed

    Examples:
          | product | cv   | account_type | audience1  | audience2           | url1                   | url2                       | jira_id      |
          | vivobr  | 12.8 | convergente  | ob-beatrix | user-is-convergente | https://www.google.com | https://www.telefonica.com | QANOV-153444 |
          | o2uk    | 13.0 | postpay      | prepay     | postpay             | https://www.google.com | https://www.telefonica.com | QANOV-153445 |
          | moves   | 13.0 | postpay      | prepay     | postpay             | https://www.google.com | https://www.telefonica.com | QANOV-153446 |
          | blaude  | 14.1 | postpay      | prepay     | postpay             | https://www.google.com | https://www.telefonica.com | QANOV-325448 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.with_<audience>_audience
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user with <account_type> account type won't see an entry point in a published list when there is a custom entry point configured for <audience> audience
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has a "custom" entrypoint
      And the entrypoint configured in CMS has the "<audience>" audience
      And user has a "<account_type>" account type
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then no element in the "entrypoint_list.list" list has the value "[CONTEXT:current_entrypoint.displayName]" in the "title" field

    Examples:
          | product | cv   | account_type | audience  | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | beatrix      | ob-legacy | QANOV-359861:QANOV-437472 | QANOV-153447 |
          | o2uk    | 13.0 | legacy       | ao2       |                           | QANOV-153448 |
          | moves   | 13.0 | postpay      | prepay    |                           | QANOV-153449 |
          | blaude  | 14.1 | postpay      | prepay    |                           | QANOV-189762 |
          | o2de    | 24.0 | postpay      | prepay    |                           | QANOV-189763 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.with_category_1
  @fixture.cms.entrypoint.with_category_1
  @fixture.cms.entrypoint.with_category_2
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entrypoint list with categories when there is a list configured with categories in CMS
    Pages with categories: vivo - bills, o2uk - services, moves - internet
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has categories defined
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the entry points are organized by categories in the "entrypoint_list_with_categories" list

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153459 |
          | o2uk    | 13.0 | QANOV-153460 |
          | moves   | 13.0 | QANOV-153461 |
          | blaude  | 14.1 | QANOV-189764 |
          | o2de    | 24.0 | QANOV-189765 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.with_summary_of_3_items_and_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entry points with the order defined in the Services step in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
      And the "Modular Page Full Entrypoint List" page is displayed
     Then elements in "entrypoints_list" have the order defined in CMS

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | vivobr  | 12.8 | QANOV-359861:QANOV-437472 | QANOV-153468 |
          | o2uk    | 13.0 |                           | QANOV-153469 |
          | moves   | 13.0 |                           | QANOV-153470 |
          | blaude  | 14.1 |                           | QANOV-189766 |
          | o2de    | 24.0 |                           | QANOV-189767 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can see the entry points with the order defined in the Categories & Sorting step in CMS
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has a custom order defined
      And user is in the "Account" page
     Then elements in "entrypoints_list.list" have the order defined in the customization of CMS

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153471 |
          | o2uk    | 13.0 | QANOV-153472 |
          | moves   | 13.0 | QANOV-153473 |
          | blaude  | 14.1 | QANOV-189768 |
          | o2de    | 24.0 | QANOV-189769 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can see an entrypoint list when there is a test configured in CMS for the logged in user
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "test" status
      And the Entrypoint list test configured in CMS has the user id "[CONTEXT:user.user_id]"
      And user is in the "Account" page
     Then the "entrypoints_list" element is on display

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153480 |
          | o2uk    | 13.0 | QANOV-153481 |
          | moves   | 13.0 | QANOV-153482 |
          | blaude  | 14.1 | QANOV-189770 |
          | o2de    | 24.0 | QANOV-189771 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user won't see an entrypoint list when there is a test configured in CMS for a different user
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "test" status
      And the Entrypoint list test configured in CMS has the user id "00000001"
      And user is in the "Account" page
     Then the "entrypoints_list" element is not on display

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153483 |
          | o2uk    | 13.0 | QANOV-153484 |
          | moves   | 13.0 | QANOV-153485 |
          | blaude  | 14.1 | QANOV-189772 |
          | o2de    | 24.0 | QANOV-189773 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.entrypoint_list.UNPUBLISHED
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the entrypoints list when the list is published in CMS
    To be tested in QA environment
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "UNPUBLISHED" status
     When the entrypoint list is published in CMS
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" element is on display

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153486 |
          | o2uk    | 13.0 | QANOV-153487 |
          | moves   | 13.0 | QANOV-153488 |
          | blaude  | 14.1 | QANOV-189774 |
          | o2de    | 24.0 | QANOV-189775 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user won't see the entrypoints list when the list is unpublished in CMS
    To be tested in QA environment
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
     When the entrypoint list is unpublished in CMS
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list_module" element is not on display
      And the entrypoint list is published in CMS

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153489 |
          | o2uk    | 13.0 | QANOV-153490 |
          | moves   | 13.0 | QANOV-153491 |
          | blaude  | 14.1 | QANOV-189776 |
          | o2de    | 24.0 | QANOV-189777 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.dv.<cv> @manual @mobile @regression
  Scenario Outline: A user won't see an entry point in the list when the entry point is unpublished in CMS
    To be tested in QA environment
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And user is in the "Account" page
     When the "entrypoint_to_unpublish" is unpublished in CMS
      And clicks on the "refresh" button
     Then the "entrypoints_list" element is displayed
      And no element in the "entrypoints_list" list has the value "entrypoint_to_unpublish" in the "title" field

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 12.8 | QANOV-153492 |
          | o2uk    | 13.0 | QANOV-153493 |
          | moves   | 13.0 | QANOV-153494 |
          | blaude  | 14.1 | QANOV-189778 |
          | o2de    | 24.0 | QANOV-189779 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-293817 @manual @mobile
  @regression
  Scenario Outline: A user won't see an entry point in the list when the entry point is unpublished in CMS
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    To be tested in QA environment
    Given user has a list of entrypoints configured in CMS for "Account" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And user is in the "Account" page
     When the "entrypoint_to_unpublish" is unpublished in CMS
      And pulls down the page to refresh
     Then the "entrypoints_list" element is displayed
      And no element in the "entrypoints_list" list has the value "entrypoint_to_unpublish" in the "title" field

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.4 | QANOV-295173 |
          | o2uk    | 14.4 | QANOV-295174 |
          | moves   | 14.4 | QANOV-295176 |
          | blaude  | 14.4 | QANOV-295177 |
          | o2de    | 24.0 | QANOV-295178 |

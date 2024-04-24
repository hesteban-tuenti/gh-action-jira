# -*- coding: utf-8 -*-
@jira.QANOV-573316
Feature: Entrypoints Lists - Icons


  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @mobile @qa @webapp
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see icons when there is a icons list configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" list is displayed

    @ber @sanity
    Examples:
          | product | jira_id      |
          | moves   | QANOV-573317 |

    @smoke
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-573318 |
          | vivobr  | QANOV-573319 |
          | blaude  | QANOV-573320 |
          | o2de    | QANOV-573321 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @mobile @regression @qa @webapp
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a limited number of icons when there is a limited number of configured icons to show
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has "2" services in summary
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" list is displayed
      And the "entrypoint_list.icons" list has "2" elements

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573322 |
          | vivobr  | QANOV-573323 |
          | o2uk    | QANOV-573324 |
          | blaude  | QANOV-573325 |
          | o2de    | QANOV-573326 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @mobile @smoke @qa @webapp
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the view more link of a icon list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" list is displayed
      And the "entrypoint_list.see_all" link with "[LANG:account.entrypoint_list.see_all]" text is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573327 |
          | vivobr  | QANOV-573328 |
          | o2uk    | QANOV-573329 |
          | blaude  | QANOV-573330 |
          | o2de    | QANOV-573331 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @mobile @smoke @qa @webapp
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_3_items_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the view more icon of a list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" carousel has "4" cards
      And the element in "3" position in the "entrypoint_list.icons" list has not the "icon" field
      And the element in "3" position in the "entrypoint_list.icons" list has the "name" textfield with the "[CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText]" text

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573332 |
          | vivobr  | QANOV-573333 |
          | o2uk    | QANOV-573334 |
          | blaude  | QANOV-573335 |
          | o2de    | QANOV-573337 |

  @jira.<jira_id> @<product> @jira.cv.24.1 @regression @mobile
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can swipe the icons of a list configured in CMS when they don't fit in the screen width
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "5" entrypoints
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" carousel can be swiped

    @android @automatic @qa
    Examples:
          | product | jira_id      |
          | moves   | QANOV-573338 |
          | vivobr  | QANOV-573339 |
          | o2uk    | QANOV-573340 |
          | blaude  | QANOV-573341 |
          | o2de    | QANOV-573342 |

    @ios @manual
    Examples:
          | product | jira_id      |
          | moves   | QANOV-573343 |
          | vivobr  | QANOV-573344 |
          | o2uk    | QANOV-573345 |
          | blaude  | QANOV-573346 |
          | o2de    | QANOV-573347 |

  @jira.<jira_id> @<product> @jira.cv.24.1 @mobile @regression
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user cannot swipe the icons of a list configured in CMS when they fit in the screen width
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "2" entrypoints
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" carousel cannot be swiped

    @android @automatic @qa
    Examples:
          | product | jira_id      |
          | moves   | QANOV-573348 |
          | vivobr  | QANOV-573349 |
          | o2uk    | QANOV-573350 |
          | blaude  | QANOV-573351 |
          | o2de    | QANOV-573353 |

    @ios @manual
    Examples:
          | product | jira_id      |
          | moves   | QANOV-573354 |
          | vivobr  | QANOV-573355 |
          | o2uk    | QANOV-573356 |
          | blaude  | QANOV-573357 |
          | o2de    | QANOV-573358 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @webapp @mobile @regression
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user won't see a view more link when the number of icons is less than the total of entrypoints
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has less services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" list is displayed
      And the "entrypoint_list.see_all" link is not displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573359 |
          | vivobr  | QANOV-573360 |
          | o2uk    | QANOV-573361 |
          | blaude  | QANOV-573362 |
          | o2de    | QANOV-573363 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @webapp @mobile @regression
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_3_items_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user won't see a view more icon when the number of icons is less than the total of entrypoints
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has less services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.icons" list is displayed
      And the "entrypoint_list.icons" list has "2" elements
      And no element in the "entrypoint_list.icons" list has the value "Link" in the "[CONTEXT:entrypoint_list.current.entrypointList.summaryView.showMoreLinkText]" field

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573364 |
          | vivobr  | QANOV-573365 |
          | o2uk    | QANOV-573367 |
          | blaude  | QANOV-573368 |
          | o2de    | QANOV-573369 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @webapp @mobile @smoke
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user who clicks on show more link can see the full entrypoint list of a icons list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "entrypoints_list" list has "3" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573370 |
          | vivobr  | QANOV-573371 |
          | o2uk    | QANOV-573372 |
          | blaude  | QANOV-573373 |
          | o2de    | QANOV-573374 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @webapp @mobile @smoke
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_3_items_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user who clicks on the last item link can see the full entrypoint list of a icons list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "3" element in the "entrypoint_list.icons" list
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "entrypoints_list" list has "4" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573375 |
          | vivobr  | QANOV-573376 |
          | o2uk    | QANOV-573377 |
          | blaude  | QANOV-573378 |
          | o2de    | QANOV-573379 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @webapp @mobile @regression
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons_with_summary_of_2_items_and_both_titles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the full list title of a icons list configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has a "full_title" defined
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "[CONTEXT:current_module.entrypoint_list_full_title]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573380 |
          | vivobr  | QANOV-573382 |
          | o2uk    | QANOV-573383 |
          | blaude  | QANOV-573384 |
          | o2de    | QANOV-573385 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @mobile @smoke
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a icon when it is configured with preconfigured url to <preconfiguration>
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.icons" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | header        | button       | jira_id      |
          | moves   | invoices_list    | Facturas      | back_button  | QANOV-573386 |
          | vivobr  | services-list    | Mais serviços | back_button  | QANOV-573387 |
          | blaude  | NAME_CHANGE      | Namen ändern  | close_button | QANOV-573389 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | back_button  | QANOV-573390 |
          | o2de    | NAME_CHANGE      | Namen ändern  | close_button |QANOV-573391 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @automatic @qa @mobile @smoke
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a icon with manual url pointing to an external webview
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.icons" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573392 |
          | vivobr  | QANOV-573393 |
          | o2uk    | QANOV-573394 |
          | blaude  | QANOV-573395 |
          | o2de    | QANOV-573396 |

  @jira.<jira_id> @<product> @jira.cv.24.1 @automatic @qa @webapp @regression @web
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a icon when it is a configured entrypoint with preconfigured url to <preconfiguration> in webapp
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.icons" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL contains "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | destination_url                                                                      | jira_id      |
          | moves   | invoices_list    | https://web.movistar-es-qa.svc.dev.tuenti.io/consumptions/modular-screen/invoices/   | QANOV-573397 |
          | vivobr  | services-list    | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-573398 |
          | blaude  | NAME_CHANGE      | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                           | QANOV-573399 |
          | o2uk    | bolt_on_details  | https://web.o2-uk-qa.svc.dev.tuenti.io/pages/boltons/?public-id=                     | QANOV-573400 |
          | o2de    | NAME_CHANGE      | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                             | QANOV-573401 |

  @jira.<jira_id> @<product> @jira.cv.24.1 @automatic @qa @webapp @regression @web
  @jira.link.parent_test_plan.QANOV-525492
  @fixture.cms.entrypoint_list.icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a icon with custom url pointing to an external webview in webapp
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "ICONS_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.icons" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-573402 |
          | vivobr  | QANOV-573403 |
          | o2uk    | QANOV-573404 |
          | blaude  | QANOV-573405 |
          | o2de    | QANOV-573406 |

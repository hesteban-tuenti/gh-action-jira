# -*- coding: utf-8 -*-
@jira.QANOV-392944
Feature: Entrypoints Lists - Mosaic


  @jira.<jira_id> @<ber> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a basic horizontal mosaic list when there is a horizontal mosaic list configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed

    Examples:
          | product | parent_test_plan | cv   | ber | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | ber | QANOV-392945 |
          | o2uk    |                  | 14.6 |     | QANOV-392946 |
          | moves   |                  | 14.6 |     | QANOV-392947 |
          | blaude  |                  | 14.6 |     | QANOV-392948 |
          | o2de    |                  | 24.0 |     | QANOV-392949 |

  @jira.QANOV-554884 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @sanity
  @vivobr
  Scenario: A user can see a basic horizontal mosaic list when there is a horizontal mosaic list of type API configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps included in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed

  @jira.<jira_id> @<ber> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile @qa @sanity @webapp
  @fixture.cms.entrypoint_list.<mosaic_type>_mosaic_with_summary_of_3_items_and_summary_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the <mosaic_type> mosaic list summary with title when there is a <mosaic_type> mosaic list configured in CMS with title and max number of elements to show in summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<mosaic_representation>" visual representation
      And the list of entrypoints configured in CMS has a "title" defined
      And user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.title" textfield with "[CONTEXT:current_module.entrypoint_list_title]" text is displayed
      And the "entrypoint_list.<mosaic_type>_mosaic_pages" list is displayed
      And the "entrypoint_list.<mosaic_type>_mosaic_cards" list has "3" elements

    Examples:
          | product | parent_test_plan | cv   | ber | mosaic_type | mosaic_representation              | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | ber | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392950 |
          | o2uk    |                  | 14.6 |     | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392951 |
          | moves   |                  | 14.6 |     | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392952 |
          | blaude  |                  | 14.6 |     | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392953 |
          | o2de    |                  | 24.0 |     | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392954 |
          | vivobr  | QANOV-420452     | 14.8 | ber | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453725 |
          | o2uk    |                  | 14.8 |     | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453726 |
          | moves   |                  | 14.8 |     | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453727 |
          | blaude  |                  | 14.8 |     | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453728 |
          | o2de    |                  | 24.0 |     | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453729 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.<mosaic_type>_mosaic_with_summary_of_3_items_and_both_titles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the complete <mosaic_type> mosaic list with the full title when there is a <mosaic_type> mosaic list configured with full title in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "<mosaic_representation>" visual representation
      And the list of entrypoints configured in CMS has a "full_title" defined
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "[CONTEXT:current_module.entrypoint_list_full_title]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan | cv   | mosaic_type | mosaic_representation              | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392955 |
          | o2uk    |                  | 14.6 | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392956 |
          | moves   |                  | 14.6 | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392957 |
          | blaude  |                  | 14.6 | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392958 |
          | o2de    |                  | 24.0 | horizontal  | SNAP_CARD_HORIZONTAL_GRID_CAROUSEL | QANOV-392959 |
          | vivobr  | QANOV-392309     | 14.6 | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453730 |
          | o2uk    |                  | 14.6 | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453731 |
          | moves   |                  | 14.6 | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453732 |
          | blaude  |                  | 14.6 | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453733 |
          | o2de    |                  | 24.0 | vertical    | POSTER_CARD_VERTICAL_GRID_CAROUSEL | QANOV-453734 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @regression
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can swipe the pages of the horizontal mosaic when there are two or more mosaic pages
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has ">1" elements
      And the "entrypoint_list.horizontal_mosaic_cards" carousel can be swiped

    @android @automatic @qa @webapp
    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392960 |
          | o2uk    |                  | 14.6 | QANOV-392961 |
          | moves   |                  | 14.6 | QANOV-392962 |
          | blaude  |                  | 14.6 | QANOV-392963 |
          | o2de    |                  | 24.0 | QANOV-392964 |

    @ios @manual
    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-420744 |
          | o2uk    |                  | 14.6 | QANOV-420745 |
          | moves   |                  | 14.6 | QANOV-420746 |
          | blaude  |                  | 14.6 | QANOV-420747 |
          | o2de    |                  | 24.0 | QANOV-420748 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @regression
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user cannot swipe the pages of the horizontal mosaic when there is only one mosaic page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "1" elements
      And the "entrypoint_list.horizontal_mosaic_cards" carousel cannot be swiped

    @android @automatic @qa @webapp
    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392965 |
          | o2uk    |                  | 14.6 | QANOV-392966 |
          | moves   |                  | 14.6 | QANOV-392967 |
          | blaude  |                  | 14.6 | QANOV-392968 |
          | o2de    |                  | 24.0 | QANOV-392969 |

    @ios @manual
    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-420749 |
          | o2uk    |                  | 14.6 | QANOV-420750 |
          | moves   |                  | 14.6 | QANOV-420751 |
          | blaude  |                  | 14.6 | QANOV-420752 |
          | o2de    |                  | 24.0 | QANOV-420753 |

  @jira.QANOV-420754 @android @automatic @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-392309 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario: A user can see no element of summary list with icon when the horizontal mosaic list does not allow icons
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
     When user is in the "Modular Page Entrypoints" modular page
     Then no element in the "entrypoint_list.horizontal_mosaic_cards" list has the "icon" field

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic_with_icons
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see all elements of summary list with icons when the horizontal mosaic list allows icons
    Entrypoints with icon show their configured icons.
    Entrypoints without icons show a default icon.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
     When user is in the "Modular Page Entrypoints" modular page
     Then each element in the "entrypoint_list.horizontal_mosaic_cards" list has the "icon" field

    Examples:
          | product | parent_test_plan | jira_id      |
          | vivobr  | QANOV-392309     | QANOV-420755 |
          | o2uk    |                  | QANOV-420756 |
          | moves   |                  | QANOV-420757 |

  @jira.QANOV-420758 @android @automatic @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-392309 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic_with_icons_and_summary_of_3_items_and_summary_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario: A user can see any element of full entrypoint list with icons when the horizontal mosaic list allows icons and any entrypoints have icons
    Entrypoints with icon show their configured icons when full entrypoint list.
    Entrypoints without icons show no icon when full entrypoint list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has an entrypoint with icon defined
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And any element in the "entrypoints_list" list has the "icon" field

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entrypoint when there is a custom entrypoint with preconfigured url to <preconfiguration> in a horizontal mosaic
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.horizontal_mosaic_cards" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | header        | parent_test_plan | button       | cv   | jira_id      |
          | vivobr  | services-list    | Mais serviços | QANOV-392309     | back_button  | 14.6 | QANOV-392971 |
          | blaude  | NAME_CHANGE      | Namen ändern  |                  | close_button | 14.6 | QANOV-392972 |
          | o2uk    | bolt_on_details  | Your Bolt Ons |                  | back_button  | 14.6 | QANOV-392973 |
          | moves   | invoices_list    | Facturas      |                  | back_button  | 14.6 | QANOV-392974 |
          | o2de    | NAME_CHANGE      | Namen ändern  |                  | close_button | 24.0 | QANOV-392975 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @qa @smoke @web
  @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entrypoint when there is a custom entrypoint with preconfigured url to <preconfiguration> in a horizontal mosaic
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.horizontal_mosaic_cards" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL contains "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | destination_url                                                                      | parent_test_plan | cv   | jira_id      |
          | vivobr  | services-list    | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-392309     | 14.6 | QANOV-420759 |
          | blaude  | NAME_CHANGE      | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                           |                  | 14.6 | QANOV-420760 |
          | o2uk    | bolt_on_details  | https://web.o2-uk-qa.svc.dev.tuenti.io/pages/boltons/?public-id=                     |                  | 14.6 | QANOV-420761 |
          | moves   | invoices_list    | https://web.movistar-es-qa.svc.dev.tuenti.io/consumptions/modular-screen/invoices/   |                  | 14.6 | QANOV-420762 |
          | o2de    | NAME_CHANGE      | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                             |                  | 24.0 | QANOV-420763 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a card with custom url pointing to an external webview of a horizontal mosaic list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.horizontal_mosaic_cards" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392976 |
          | o2uk    |                  | 14.6 | QANOV-392977 |
          | moves   |                  | 14.6 | QANOV-392978 |
          | blaude  |                  | 14.6 | QANOV-392979 |
          | o2de    |                  | 24.0 | QANOV-392980 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @qa @smoke @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a card with custom url pointing to an external webview of a horizontal mosaic list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.horizontal_mosaic_cards" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-420764 |
          | o2uk    |                  | 14.6 | QANOV-420765 |
          | moves   |                  | 14.6 | QANOV-420766 |
          | blaude  |                  | 14.6 | QANOV-420767 |
          | o2de    |                  | 24.0 | QANOV-420768 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 4 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "4" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "1" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392981 |
          | o2uk    |                  | 14.6 | QANOV-392982 |
          | moves   |                  | 14.6 | QANOV-392983 |
          | blaude  |                  | 14.6 | QANOV-392984 |
          | o2de    |                  | 24.0 | QANOV-392985 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 3 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "3" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "1" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392986 |
          | o2uk    |                  | 14.6 | QANOV-392987 |
          | moves   |                  | 14.6 | QANOV-392988 |
          | blaude  |                  | 14.6 | QANOV-392989 |
          | o2de    |                  | 24.0 | QANOV-392990 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 2 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "2" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "1" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392991 |
          | o2uk    |                  | 14.6 | QANOV-392992 |
          | moves   |                  | 14.6 | QANOV-392993 |
          | blaude  |                  | 14.6 | QANOV-392994 |
          | o2de    |                  | 24.0 | QANOV-392995 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 5 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "5" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "2" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "5" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-392996 |
          | o2uk    |                  | 14.6 | QANOV-392997 |
          | moves   |                  | 14.6 | QANOV-392998 |
          | blaude  |                  | 14.6 | QANOV-392999 |
          | o2de    |                  | 24.0 | QANOV-393000 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 6 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "6" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "2" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "5" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "6" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-393001 |
          | o2uk    |                  | 14.6 | QANOV-393002 |
          | moves   |                  | 14.6 | QANOV-393003 |
          | blaude  |                  | 14.6 | QANOV-393004 |
          | o2de    |                  | 24.0 | QANOV-393005 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 7 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "7" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "2" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "5" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "6" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "7" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-393006 |
          | o2uk    |                  | 14.6 | QANOV-393007 |
          | moves   |                  | 14.6 | QANOV-393008 |
          | blaude  |                  | 14.6 | QANOV-393009 |
          | o2de    |                  | 24.0 | QANOV-393010 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.horizontal_mosaic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a horizontal mosaic list when there is a horizontal mosaic list with 8 configured services in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "SNAP_CARD_HORIZONTAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "8" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.horizontal_mosaic_cards" list is displayed
      And the "entrypoint_list.horizontal_mosaic_pages" list has "3" elements
      And the card "1" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "2" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "5" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "6" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "7" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "8" of the "horizontal_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-392309     | 14.6 | QANOV-393011 |
          | o2uk    |                  | 14.6 | QANOV-393012 |
          | moves   |                  | 14.6 | QANOV-393013 |
          | blaude  |                  | 14.6 | QANOV-393014 |
          | o2de    |                  | 24.0 | QANOV-393015 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list with the title in all cards
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "4" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the element in "0" position in the "entrypoint_list.vertical_mosaic_cards" list has the "title" field with the "Entrypoint 1" text
      And the element in "1" position in the "entrypoint_list.vertical_mosaic_cards" list has the "title" field with the "Entrypoint 2" text
      And the element in "2" position in the "entrypoint_list.vertical_mosaic_cards" list has the "title" field with the "Entrypoint 4" text
      And the element in "3" position in the "entrypoint_list.vertical_mosaic_cards" list has the "title" field with the "Entrypoint 3" text

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453735 |
          | o2uk    |                  | 14.8 | QANOV-453736 |
          | moves   |                  | 14.8 | QANOV-453737 |
          | blaude  |                  | 14.8 | QANOV-453738 |
          | o2de    |                  | 24.0 | QANOV-453739 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_preconfigured_url_and_image
  @fixture.cms.entrypoint.with_preconfigured_url_and_image
  @fixture.cms.entrypoint.with_preconfigured_url_and_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entrypoint when there is a custom entrypoint with preconfigured url to <preconfiguration> in a vertical mosaic
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.vertical_mosaic_cards" list with the "title" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | header        | parent_test_plan | cv   | button       | jira_id      |
          | vivobr  | services-list    | Mais serviços | QANOV-420452     | 14.8 | back_button  | QANOV-453740 |
          | blaude  | NAME_CHANGE      | Namen ändern  |                  | 14.8 | close_button | QANOV-453741 |
          | o2uk    | bolt_on_details  | Your Bolt Ons |                  | 14.8 | back_button  | QANOV-453742 |
          | moves   | invoices_list    | Facturas      |                  | 14.8 | back_button  | QANOV-453743 |
          | o2de    | NAME_CHANGE      | Namen ändern  |                  | 24.0 | close_button | QANOV-453744 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @qa @smoke @web
  @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_preconfigured_url_and_image
  @fixture.cms.entrypoint.with_preconfigured_url_and_image
  @fixture.cms.entrypoint.with_preconfigured_url_and_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on an entrypoint when there is a custom entrypoint with preconfigured url to <preconfiguration> in a vertical mosaic
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.vertical_mosaic_cards" list with the "title" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL contains "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | destination_url                                                                      | parent_test_plan | cv   | jira_id      |
          | vivobr  | services-list    | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-420452     | 14.8 | QANOV-453745 |
          | blaude  | NAME_CHANGE      | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                           |                  | 14.8 | QANOV-453746 |
          | o2uk    | bolt_on_details  | https://web.o2-uk-qa.svc.dev.tuenti.io/pages/boltons/?public-id=                     |                  | 14.8 | QANOV-453747 |
          | moves   | invoices_list    | https://web.movistar-es-qa.svc.dev.tuenti.io/consumptions/modular-screen/invoices/   |                  | 14.8 | QANOV-453748 |
          | o2de    | NAME_CHANGE      | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                             |                  | 24.0 | QANOV-453749 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a card with custom url pointing to an external webview of a vertical mosaic list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.vertical_mosaic_cards" list with the "title" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453750 |
          | o2uk    |                  | 14.8 | QANOV-453751 |
          | moves   |                  | 14.8 | QANOV-453752 |
          | blaude  |                  | 14.8 | QANOV-453753 |
          | o2de    |                  | 24.0 | QANOV-453754 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @qa @smoke @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a card with custom url pointing to an external webview of a vertical mosaic list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page
     When clicks on any element in the "entrypoint_list.vertical_mosaic_cards" list with the "title" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453755 |
          | o2uk    |                  | 14.8 | QANOV-453756 |
          | moves   |                  | 14.8 | QANOV-453757 |
          | blaude  |                  | 14.8 | QANOV-453758 |
          | o2de    |                  | 24.0 | QANOV-453759 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 1 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "1" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "1" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "horizontal" image

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453760 |
          | o2uk    |                  | 14.8 | QANOV-453761 |
          | moves   |                  | 14.8 | QANOV-453762 |
          | blaude  |                  | 14.8 | QANOV-453763 |
          | o2de    |                  | 24.0 | QANOV-453764 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 2 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "2" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "1" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "square" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453765 |
          | o2uk    |                  | 14.8 | QANOV-453766 |
          | moves   |                  | 14.8 | QANOV-453767 |
          | blaude  |                  | 14.8 | QANOV-453768 |
          | o2de    |                  | 24.0 | QANOV-453769 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 3 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "3" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "1" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "3" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "3" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453770 |
          | o2uk    |                  | 14.8 | QANOV-453771 |
          | moves   |                  | 14.8 | QANOV-453772 |
          | blaude  |                  | 14.8 | QANOV-453773 |
          | o2de    |                  | 24.0 | QANOV-453774 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 4 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "4" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "1" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "3" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "3" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "4" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453775 |
          | o2uk    |                  | 14.8 | QANOV-453776 |
          | moves   |                  | 14.8 | QANOV-453777 |
          | blaude  |                  | 14.8 | QANOV-453778 |
          | o2de    |                  | 24.0 | QANOV-453779 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 5 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "5" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "2" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "3" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "3" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "4" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "5" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "horizontal_large" size
      And the card "5" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "horizontal" image

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453780 |
          | o2uk    |                  | 14.8 | QANOV-453781 |
          | moves   |                  | 14.8 | QANOV-453782 |
          | blaude  |                  | 14.8 | QANOV-453783 |
          | o2de    |                  | 24.0 | QANOV-453784 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 6 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "6" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "2" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "3" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "3" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "4" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "5" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "5" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "square" image
      And the card "6" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "6" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453785 |
          | o2uk    |                  | 14.8 | QANOV-453786 |
          | moves   |                  | 14.8 | QANOV-453787 |
          | blaude  |                  | 14.8 | QANOV-453788 |
          | o2de    |                  | 24.0 | QANOV-453789 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 7 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "7" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "2" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "3" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "3" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "4" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "5" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "5" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "6" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "6" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "7" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "7" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453790 |
          | o2uk    |                  | 14.8 | QANOV-453791 |
          | moves   |                  | 14.8 | QANOV-453792 |
          | blaude  |                  | 14.8 | QANOV-453793 |
          | o2de    |                  | 24.0 | QANOV-453794 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.entrypoint_list.vertical_mosaic
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.entrypoint.with_image
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a vertical mosaic list when there is a vertical mosaic list with 8 configured services in CMS
    NOTE: vertical mosaic list is defined in the html source code with clockwise order each four items page
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "POSTER_CARD_VERTICAL_GRID_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "8" entrypoints
     When user is in the "Modular Page Entrypoints" modular page
     Then the "entrypoint_list" element is displayed
      And the "entrypoint_list.vertical_mosaic_cards" list is displayed
      And the "entrypoint_list.vertical_mosaic_pages" list has "2" elements
      And the card "1" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "1" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "2" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "2" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "3" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "3" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "4" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "4" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "5" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "5" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "6" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "6" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field
      And the card "7" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "vertical_large" size
      And the card "7" of the "entrypoint_list.vertical_mosaic_cards" mosaic has a "vertical" image
      And the card "8" of the "vertical_mosaic_cards" mosaic in "entrypoint_list" list has "small" size
      And the card "8" of the "entrypoint_list.vertical_mosaic_cards" mosaic has not the "image" field

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-420452     | 14.8 | QANOV-453795 |
          | o2uk    |                  | 14.8 | QANOV-453796 |
          | moves   |                  | 14.8 | QANOV-453797 |
          | blaude  |                  | 14.8 | QANOV-453798 |
          | o2de    |                  | 24.0 | QANOV-453799 |

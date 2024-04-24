# -*- coding: utf-8 -*-
@jira.QANOV-156097
Feature: Extras


  @jira.<jira_id> @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.<status>
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario Outline: A user won't see the extras in Account screen when there is a list configured in <status> status in CMS
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the list of extras configured in CMS has the "<status>" status
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module" element is not displayed

    Examples:
          | status      | jira_id      |
          | DRAFT       | QANOV-156098 |
          | UNPUBLISHED | QANOV-156099 |

  @jira.QANOV-156100 @android @automatic @ber @ios @jira.cv.13.0 @mobile @qa @sanity @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user can see the extras list when there is a list configured in CMS
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the list of extras configured in CMS has extras defined
      And user is in the "Modular Page Extras" modular page for current agreement
     Then each element has the "icon" field displayed in the "extras_list_module.list" list
      And each element in the "extras_list_module.list" extras list has the "name" field with value defined in CMS

  @jira.QANOV-156105 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_preconfigured_link
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user can click on an extra wih a preconfigured URL configured in CMS
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the list of extras configured in CMS has the "PUBLISHED" status
      And the extra configured in CMS has a "preconfigured" url defined
      And the extra configured in CMS has a "preconfigured" url to "services-list" destination
      And user is in the "Modular Page Extras" modular page for current agreement
     When clicks on any element in the "extras_list_module.list" list
     Then the current URL is "https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings"

  @jira.QANOV-156108 @android @automatic @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user can swipe the extras carousel when there are more than 3 elements
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the list of extras configured in CMS has the "PUBLISHED" status
      And the list of extras configured in CMS has ">3" extras
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module.list" list is displayed
      And the "extras_list_module.list" carousel can be swiped

  @jira.QANOV-180131 @android @automatic @jira.cv.13.0 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user can't swipe the extras carousel when there are less than 3 extras
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the list of extras configured in CMS has the "PUBLISHED" status
      And the list of extras configured in CMS has "<3" extras
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module.list" list is displayed
      And the "extras_list_module.list" carousel cannot be swiped

  @jira.QANOV-156109 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user can see the extra when there is an extra with CMS provider configured in CMS
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the extra configured in CMS has a "manual" provider
      And user is in the "Modular Page Extras" modular page for current agreement
     Then any element in the "extras_list_module.list" list has the "name" textfield with the "[CONTEXT:extra.name]" text
      And each element has the "icon" field displayed in the "extras_list_module.list" list

  @jira.QANOV-374242 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_ob-legacy_audience
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user won't see a published list when its unique extra is configured for a different audience
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the extra configured in CMS has the "ob-legacy" audience
      And user has any "beatrix;convergente" account types
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module" element is not displayed

  @jira.QANOV-156110 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.with_ob-legacy_audience
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user won't see an extra in a published list when the extra is configured for a different audience
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the extra configured in CMS has the "ob-legacy" audience
      And user has any "beatrix;convergente" account types
      And user is in the "Modular Page Extras" modular page for current agreement
     Then no element in the "extras_list_module.list" list has the value "[CONTEXT:extra.name]" in the "name" field

  @jira.QANOV-156111 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.with_ob-4p_audience
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user can see an extra in a published list when the extra is configured for an audience that belongs to the user
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the extra configured in CMS has the "ob-4p" audience
      And user has any "beatrix;convergente" account types
      And user is in the "Modular Page Extras" modular page for current agreement
     Then any element in the "extras_list_module.list" list has the "name" textfield with the "[CONTEXT:extra.name]" text

  @jira.QANOV-156113 @android @automatic @ios @jira.cv.13.0 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: An extra won't be clickable when there is an extra with no action configured in CMS
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the extra configured in CMS has not any action defined
      And user is in the "Modular Page Extras" modular page for current agreement
     When clicks on the element with "name" field with "[CONTEXT:extra.name]" value of the "extras_list_module.list" list
     Then the "Modular Page Extras" modular page is displayed

  @jira.QANOV-156114 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_manual_link
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user clicks on an extra when there is an extra configured with manual URL action
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the extra configured in CMS has a "manual" url defined
      And user is in the "Modular Page Extras" modular page for current agreement
     When clicks on the element with "name" field with "[CONTEXT:extra.name]" value of the "extras_list_module.list" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Extras" modular page is displayed

  @jira.QANOV-156115 @android @automatic @ios @jira.cv.13.0 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_preconfigured_link
  @fixture.cms.page.extras
  @fixture.cms.module.extras
  Scenario: A user clicks on an extra with preconfigured URL action configured in CMS
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the list of extras configured in CMS has the "PUBLISHED" status
      And the extra configured in CMS has a "preconfigured" url to "services-list" destination
      And user is in the "Modular Page Extras" modular page for current agreement
     When clicks on the element with "name" field with "[CONTEXT:extra.name]" value of the "extras_list_module.list" list
     Then the internal webview with "Mais serviços" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Extras" page is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.9 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_<human_readable_representation>
  Scenario Outline: A user can see extras as a <human_readable_representation> representation
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "<representation>" value
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module" element is displayed
      And the "extras_list_module.<human_readable_representation>" list is displayed
      And the "extras_list_module.<human_readable_representation>" list has "4" elements

    Examples:
          | representation     | human_readable_representation | jira_id      |
          | SNAP_CARD_CAROUSEL | list                          | QANOV-492057 |
          | NARROW_CARD_GRID   | grid                          | QANOV-492058 |

  @jira.QANOV-492059 @android @automatic @ios @jira.cv.14.9 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_list_with_manual_link
  Scenario: A user can see extras list with a link
    The list shows all the elements and after them a link is shown
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "SNAP_CARD_CAROUSEL" value
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module.list" list is displayed
      And the "extras_list_module.link" link with "[CONTEXT:extras.linkLabel]" text is displayed

  @jira.QANOV-373544 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid_with_manual_link
  Scenario: A user can see extras grid with a link as an additional card
    The grid shows all the card plus an additional card to add an extra
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module.grid" list is displayed
      And the "extras_list_module.add_item" button is displayed
      And the "extras_list_module.add_item.plus_icon" icon is displayed
      And the "extras_list_module.add_item.link_text" textfield is not displayed

  @jira.QANOV-373545 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid_with_manual_link_with_text
  Scenario: A user can see extras grid with a link as an additional card with a link text
    The grid shows all the card plus an additional card to add an extra
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And user is in the "Modular Page Extras" modular page for current agreement
     Then the "extras_list_module.grid" list is displayed
      And the "extras_list_module.add_item" button is displayed
      And the "extras_list_module.add_item.plus_icon" icon is displayed
      And the "extras_list_module.add_item.link_text" textfield is displayed

  @jira.<jira_id> @automatic @jira.cv.14.9 @qa @regression @vivobr @web @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_<url_type>_link
  @fixture.cms.extra.with_<url_type>_link
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid
  Scenario Outline: A user can click on any card with <url_type> link in a grid of extras in a webapp
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And the extra configured in CMS has a "<url_type>" url to "<link>" destination
      And user is in the "Modular Page Extras" modular page for current agreement
      And the "extras_list_module.grid" list is displayed
     When clicks on any element in the "extras_list_module.grid" list
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Extras" modular page is displayed

    Examples:
          | url_type      | link                                   | destination_url                                                                      | jira_id      |
          | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                       | QANOV-492060 |
          | preconfigured | services-list                          | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-492061 |

  @jira.QANOV-492062 @android @automatic @ios @jira.cv.14.9 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_manual_link
  @fixture.cms.extra.with_manual_link
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid
  Scenario: A user can click on any card with manual link in a grid of extras reaches external webview
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And the extra configured in CMS has a "manual" url to "https://www.telefonica.com/?w=external" destination
      And user is in the "Modular Page Extras" modular page for current agreement
      And the "extras_list_module.grid" list is displayed
     When clicks on any element in the "extras_list_module.grid" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Extras" modular page is displayed

  @jira.QANOV-492063 @android @automatic @ios @jira.cv.14.9 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.with_preconfigured_link
  @fixture.cms.extra.with_preconfigured_link
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid
  Scenario: A user can click on any card with preconfigured link in a grid of extras reaches internal webview
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And the extra configured in CMS has a "preconfigured" url to "services-list" destination
      And user is in the "Modular Page Extras" modular page for current agreement
      And the "extras_list_module.grid" list is displayed
     When clicks on any element in the "extras_list_module.grid" list
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Extras" modular page is displayed

  @jira.<jira_id> @automatic @jira.cv.14.9 @qa @regression @vivobr @web @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid_with_<url_type>_link
  Scenario Outline: A user can click on add item with <url_type> link in a webapp
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And user is in the "Modular Page Extras" modular page for current agreement
      And the "extras_list_module.add_item" card is displayed
     When clicks on the "extras_list_module.add_item" card
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Extras" modular page is displayed

    Examples:
          | url_type      | link                                   | destination_url                                                                      | jira_id      |
          | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                       | QANOV-373547 |
          | preconfigured | services-list                          | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-373546 |

  @jira.QANOV-492064 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid_with_manual_link
  Scenario: A user can click on add item and reaches external webview
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And user is in the "Modular Page Extras" modular page for current agreement
      And the "extras_list_module.add_item" card is displayed
     When clicks on the "extras_list_module.add_item" card
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Extras" modular page is displayed

  @jira.QANOV-492065 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.basic
  @fixture.cms.extra.basic
  @fixture.cms.page.extras
  @fixture.cms.module.extras_grid_with_preconfigured_link
  Scenario: A user can click on add item and reaches internal webview
    Given the "Extras" module is configured in CMS for "Modular Page Extras" page
      And the "extras" module configured in CMS has the "representation" field with "NARROW_CARD_GRID" value
      And user is in the "Modular Page Extras" modular page for current agreement
      And the "extras_list_module.add_item" card is displayed
     When clicks on the "extras_list_module.add_item" card
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Extras" modular page is displayed

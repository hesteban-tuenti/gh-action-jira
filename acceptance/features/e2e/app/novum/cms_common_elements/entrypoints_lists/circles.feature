# -*- coding: utf-8 -*-
@jira.QANOV-470108
Feature: Entrypoints Lists - Circles


  @jira.<jira_id> @<priority> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @webapp
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see circles when there is a circles list configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" list is displayed

    Examples:
          | product | cv   | priority | jira_id      |
          | o2uk    | 14.9 | smoke    | QANOV-470109 |
          | moves   | 14.9 | smoke    | QANOV-470110 |
          | blaude  | 14.9 | smoke    | QANOV-470111 |
          | o2de    | 24.0 | smoke    | QANOV-470112 |

    @ber
    Examples:
          | product | cv   | priority | jira_id      |
          | vivobr  | 14.9 | sanity   | QANOV-470113 |

  @jira.QANOV-554880 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @sanity
  @vivobr
  Scenario: A user can see circles when there is a circles list configured in CMS for an entrypoint list of type API
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps included in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" list is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see a limited number of circles when there is a limited number of configured circles to show
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has "2" services in summary
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" list is displayed
      And the "entrypoint_list.circles" list has "2" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470114 |
          | o2uk    | 14.9 | QANOV-470115 |
          | moves   | 14.9 | QANOV-470116 |
          | blaude  | 14.9 | QANOV-470117 |
          | o2de    | 24.0 | QANOV-470118 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the view more link of a list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" list is displayed
      And the "entrypoint_list.see_all" link with "[LANG:account.entrypoint_list.see_all]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470119 |
          | o2uk    | 14.9 | QANOV-470120 |
          | moves   | 14.9 | QANOV-470121 |
          | blaude  | 14.9 | QANOV-470122 |
          | o2de    | 24.0 | QANOV-470123 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_3_items_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the view more circle of a list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" carousel has "4" cards
      And the element in "3" position in the "entrypoint_list.circles" list has the "icon" field

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470124 |
          | o2uk    | 14.9 | QANOV-470125 |
          | moves   | 14.9 | QANOV-470126 |
          | blaude  | 14.9 | QANOV-470127 |
          | o2de    | 24.0 | QANOV-470128 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @mobile @regression
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can swipe the circles of a list configured in CMS when they don't fit in the screen width
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "5" entrypoints
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" carousel can be swiped

    @android @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470129 |
          | o2uk    | 14.9 | QANOV-470130 |
          | moves   | 14.9 | QANOV-470131 |
          | blaude  | 14.9 | QANOV-470132 |
          | o2de    | 24.0 | QANOV-470133 |

    @ios @manual
    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.9   | QANOV-548950 |
          | o2uk    | 14.9   | QANOV-548951 |
          | moves   | 14.9   | QANOV-548952 |
          | blaude  | 14.9   | QANOV-548953 |
          | o2de    | Future | QANOV-548954 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @mobile @regression
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user cannot swipe the circles of a list configured in CMS when they fit in the screen width
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has "2" entrypoints
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" carousel cannot be swiped

    @android @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470134 |
          | o2uk    | 14.9 | QANOV-470135 |
          | moves   | 14.9 | QANOV-470136 |
          | blaude  | 14.9 | QANOV-470137 |
          | o2de    | 24.0 | QANOV-470138 |

    @ios @manual
    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.9   | QANOV-548955 |
          | o2uk    | 14.9   | QANOV-548956 |
          | moves   | 14.9   | QANOV-548957 |
          | blaude  | 14.9   | QANOV-548958 |
          | o2de    | Future | QANOV-548959 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user won't see a view more link when the number of circles is less than the total of entrypoints
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has less services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" list is displayed
      And the "entrypoint_list.see_all" link is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470139 |
          | o2uk    | 14.9 | QANOV-470140 |
          | moves   | 14.9 | QANOV-470141 |
          | blaude  | 14.9 | QANOV-470142 |
          | o2de    | 24.0 | QANOV-470143 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_3_items_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user won't see a view more circle when the number of circles is less than the total of entrypoints
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has less services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" module is displayed
      And the "entrypoint_list.circles" list is displayed
      And the "entrypoint_list.circles" list has "2" elements
      And the element in "1" position in the "entrypoint_list.circles" list has not the "icon" field

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470144 |
          | o2uk    | 14.9 | QANOV-470145 |
          | moves   | 14.9 | QANOV-470146 |
          | blaude  | 14.9 | QANOV-470147 |
          | o2de    | 24.0 | QANOV-470148 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_2_items
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user who clicks on show more link can see the full entrypoint list of a circles list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with see all link
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "entrypoint_list.see_all" button
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "entrypoints_list" list has "3" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470149 |
          | o2uk    | 14.9 | QANOV-470150 |
          | moves   | 14.9 | QANOV-470151 |
          | blaude  | 14.9 | QANOV-470152 |
          | o2de    | 24.0 | QANOV-470153 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_3_items_and_add_item_card
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user who clicks on the last item link can see the full entrypoint list of a circles list configured in CMS with a summary
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And the list of entrypoints configured in CMS has more services than the maximum defined in summary view
      And the list of entrypoints configured in CMS has a maximum of services defined in summary view with additional item to show more
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on the "3" element in the "entrypoint_list.circles" list
     Then the "Modular Page Full Entrypoint List" page is displayed
      And the "entrypoints_list" list has "4" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470154 |
          | o2uk    | 14.9 | QANOV-470155 |
          | moves   | 14.9 | QANOV-470156 |
          | blaude  | 14.9 | QANOV-470157 |
          | o2de    | 24.0 | QANOV-470158 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.entrypoint_list.circles_with_summary_of_2_items_and_both_titles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user can see the full list title of a circles list configured in CMS
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
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
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470159 |
          | o2uk    | 14.9 | QANOV-470160 |
          | moves   | 14.9 | QANOV-470161 |
          | blaude  | 14.9 | QANOV-470162 |
          | o2de    | 24.0 | QANOV-470163 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @smoke
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a circle when it is configured with preconfigured url to <preconfiguration>
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.circles" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | header        | cv   | jira_id      |
          | vivobr  | services-list    | Mais serviços | 14.9 | QANOV-470164 |
          | blaude  | NAME_CHANGE      | Namen ändern  | 14.9 | QANOV-470165 |
          | o2uk    | bolt_on_details  | Your Bolt Ons | 14.9 | QANOV-470166 |
          | moves   | invoices_list    | Facturas      | 14.9 | QANOV-470167 |
          | o2de    | NAME_CHANGE      | Namen ändern  | 24.0 | QANOV-470168 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a circle with manual url pointing to an external webview
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.circles" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470169 |
          | o2uk    | 14.9 | QANOV-470170 |
          | moves   | 14.9 | QANOV-470171 |
          | blaude  | 14.9 | QANOV-470172 |
          | o2de    | 24.0 | QANOV-470173 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @web @webapp
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a circle when it is a configured entrypoint with preconfigured url to <preconfiguration> in webapp
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a preconfigured url to "<preconfiguration>"
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.circles" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL contains "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | preconfiguration | destination_url                                                                      | cv   | jira_id      |
          | vivobr  | services-list    | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | 14.9 | QANOV-470174 |
          | blaude  | NAME_CHANGE      | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                           | 14.9 | QANOV-470175 |
          | o2uk    | bolt_on_details  | https://web.o2-uk-qa.svc.dev.tuenti.io/pages/boltons/?public-id=                     | 14.9 | QANOV-470176 |
          | moves   | invoices_list    | https://web.movistar-es-qa.svc.dev.tuenti.io/consumptions/modular-screen/invoices/   | 14.9 | QANOV-470177 |
          | o2de    | NAME_CHANGE      | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                             | 24.0 | QANOV-470178 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @web @webapp
  @fixture.cms.entrypoint_list.circles
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.entrypoint_list
  @fixture.cms.module.entrypoint_list
  Scenario Outline: A user clicks on a circle with custom url pointing to an external webview in webapp
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And the entrypoint configured in CMS has a custom url to an external endpoint
      And the list of entrypoints configured in CMS has the "PUBLISHED" status
      And the list of entrypoints configured in CMS has the "CIRCLE_CAROUSEL" visual representation
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     When clicks on any element in the "entrypoint_list.circles" list with the "name" field that contains the "[CONTEXT:current_entrypoint.displayName]" text
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Entrypoints" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.9 | QANOV-470179 |
          | o2uk    | 14.9 | QANOV-470180 |
          | moves   | 14.9 | QANOV-470181 |
          | blaude  | 14.9 | QANOV-470182 |
          | o2de    | 24.0 | QANOV-470183 |

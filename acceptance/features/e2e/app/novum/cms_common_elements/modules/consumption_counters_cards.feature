# -*- coding: utf-8 -*-
@jira.QANOV-373565
Feature: Consumption Counters Cards


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.consumption_counters_cards
  Scenario Outline: A user can see a Consumption Counter Cards module configured with the default fields
    To be executed in QA
    Given the "Data Consumption Counters as Cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Consumption Counters as Cards" configured in CMS has only the mandatory fields filled
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
      And waits until the "consumption_counters_cards" element is visible
     Then the "consumption_counters_cards" module is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.5 | QANOV-373566 |
          | blaude  | 14.5 | QANOV-373567 |
          | o2de    | 24.0 | QANOV-554790 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.consumption_counters_cards_with_title
  Scenario Outline: A user can see a Consumption Counter Cards module configured with title
    To be executed in QA
    Given the "Data Consumption Counters as Cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "consumption_counters_cards" module is displayed
      And the "consumption_counters_cards.title" textfield with "Title" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.5 | QANOV-373568 |
          | blaude  | 14.5 | QANOV-373569 |
          | o2de    | 24.0 | QANOV-554791 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.consumption_counters_cards_with_footer
  Scenario Outline: A user can see a Consumption Counter Cards module configured with footer text
    To be executed in QA
    Given the "Data Consumption Counters as Cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     Then the "consumption_counters_cards" module is displayed
      And the "0" index in the "consumption_counters_cards.data_consumption_carousel" list has the "link" field with "Footer" text

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.5 | QANOV-373570 |
          | blaude  | 14.5 | QANOV-373571 |
          | o2de    | 24.0 | QANOV-554792 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.consumption_counters_cards_with_preconfigured_url
  Scenario Outline: A user clicks on the footer url: user is redirected to a preconfigured url
    To be executed in QA
    Given the "Data Consumption Counters as Cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Consumption Counters as Cards" configured in CMS has a "preconfigured" link to "<link>" destination
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "link" button of "consumption_counters_cards.data_consumption_carousel" list with "0" index
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | link           | header              | cv   | jira_id      |
          | o2uk    | tariff_details | Your tariff details | 13.3 | QANOV-373573 |
          | blaude  | NAME_CHANGE    | Namen ändern        | 13.3 | QANOV-373575 |
          | o2de    | NAME_CHANGE    | Namen ändern        | 24.0 | QANOV-554793 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.consumption_counters_cards_with_manual_internal_url
  Scenario Outline: A user clicks on the footer internal url: user is redirected to a manual internal url
    To be executed in QA
    Given the "Data Consumption Counters as Cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Consumption Counters as Cards" configured in CMS has a "manual" link to "https://www.telefonica.com/?w=internal&p=flow" destination
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "link" button of "consumption_counters_cards.data_consumption_carousel" list with "0" index
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 13.3 | QANOV-373572 |
          | blaude  | 13.3 | QANOV-373574 |
          | o2de    | 24.0 | QANOV-554794 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.consumption_counters_cards_with_<url_type>_url
  Scenario Outline: A user clicks on the footer url button in webapp: user is redirected to a <url_type> url
    To be executed in QA
    Given the "Data Consumption Counters as Cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Consumption Counters as Cards" configured in CMS has a "<link_type>" link to "<link>" destination
      And user has a "postpay" account type
      And user has a "mobile_line" account type
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
     When clicks on the "link" button of "consumption_counters_cards.data_consumption_carousel" list with "0" index
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | url_type      | link_type     | link                           | destination_url                                                | cv   | jira_id      |
          | o2uk    | manual        | url           | https://www.telefonica.com/es/ | https://www.telefonica.com/es/                                 | 14.3 | QANOV-373576 |
          | o2uk    | preconfigured | preconfigured | priority                       | https://priority.o2.co.uk/offers                               | 14.3 | QANOV-373577 |
          | blaude  | manual        | url           | https://www.telefonica.com/es/ | https://www.telefonica.com/es/                                 | 14.3 | QANOV-373578 |
          | blaude  | preconfigured | preconfigured | FAQ                            | https://angebote.webviews.blau.de/novum/faqs/blau/index.html   | 14.3 | QANOV-373579 |
          | o2de    | manual        | url           | https://www.telefonica.com/es/ | https://www.telefonica.com/es/                                 | 24.0 | QANOV-554795 |
          | o2de    | preconfigured | preconfigured | FAQ                            | https://angebote.webviews.o2online.de/novum/faqs/o2/index.html | 24.0 | QANOV-554796 |

# -*- coding: utf-8 -*-
@jira.QANOV-310313
Feature: Simple Action Row


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row
  Scenario Outline: A user can see an Action Row module configured with the default fields
    To be executed in QA
    Given the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-action-row" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_action_row" element is visible
     Then the "simple_action_row.title" textfield with "[CONTEXT:simple_action_row.title]" text is displayed
      And the "simple_action_row.chevron" icon is displayed
      And the "simple_action_row.subtitle" textfield is not displayed
      And the "simple_action_row.description" textfield is not displayed
      And the "simple_action_row.image" image is not displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 13.3 | QANOV-437472     | QANOV-183799 |
          | o2uk    | 13.3 |                  | QANOV-183800 |
          | moves   | 13.1 |                  | QANOV-183801 |
          | blaude  | 14.6 |                  | QANOV-417278 |
          | o2de    | 24.0 |                  | QANOV-554854 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_<field>
  Scenario Outline: A user can see an Action Row module with the optional "<field>" textfield configured
    To be executed in QA
    Given the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-action-row" module configured in CMS has the "<field>" filled
      And user is in the "Modular Page Configurable Modules" modular page
     Then waits until the "simple_action_row" element is visible
      And the "simple_action_row.<field>" textfield with "[CONTEXT:simple_action_row.<field>]" text is displayed

    Examples:
          | product | cv   | field       | parent_test_plan | jira_id      |
          | vivobr  | 13.3 | subtitle    | QANOV-437472     | QANOV-183802 |
          | vivobr  | 13.3 | description | QANOV-437472     | QANOV-183803 |
          | o2uk    | 13.3 | subtitle    |                  | QANOV-183804 |
          | o2uk    | 13.3 | description |                  | QANOV-183805 |
          | moves   | 13.1 | subtitle    |                  | QANOV-183806 |
          | moves   | 13.1 | description |                  | QANOV-183807 |
          | blaude  | 24.0 | subtitle    |                  | QANOV-554855 |
          | blaude  | 24.0 | description |                  | QANOV-554856 |
          | o2de    | 24.0 | subtitle    |                  | QANOV-554857 |
          | o2de    | 24.0 | description |                  | QANOV-554858 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_icon
  Scenario Outline: A user can see an Action Row module with an icon configured
    To be executed in QA
    Given the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-action-row" module configured in CMS has the "imageUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page
     Then waits until the "simple_action_row" element is visible
      And the "src" property of the "simple_action_row.image" element matches "[CONTEXT:simple_action_row.imageUrl.url]" text

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 13.3 | QANOV-437472     | QANOV-345821 |
          | o2uk    | 13.3 |                  | QANOV-345822 |
          | moves   | 13.1 |                  | QANOV-345823 |
          | blaude  | 14.6 |                  | QANOV-417279 |
          | o2de    | 24.0 |                  | QANOV-554859 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @qa @regression @web
  @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_<url_type>_url
  Scenario Outline: A user clicks on the Action Row: user is redirected to a <url_type> url
    To be executed in QA
    Given the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-action-row" configured in CMS has a "<link_type>" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_action_row" element is visible
     When clicks on the "simple_action_row.chevron" button
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | url_type      | link_type     | link                                              | destination_url                                                                      | parent_test_plan | jira_id      |
          | vivobr  | 13.3 | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/                                                       | QANOV-437472     | QANOV-345824 |
          | vivobr  | 13.3 | preconfigured | preconfigured | services-list                                     | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-437472     | QANOV-345825 |
          | o2uk    | 13.3 | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/                                                       |                  | QANOV-345826 |
          | o2uk    | 13.3 | preconfigured | preconfigured | priority                                          | https://priority.o2.co.uk/offers                                                     |                  | QANOV-345827 |
          | moves   | 13.1 | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/                                                       |                  | QANOV-345828 |
          | moves   | 13.1 | preconfigured | preconfigured | appointmentBookingUrl                             | https://web.movistar-es-qa.svc.dev.tuenti.io/pages/appointment-booking/              |                  | QANOV-345829 |
          | blaude  | 14.6 | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/                                                       |                  | QANOV-417280 |
          | blaude  | 14.6 | preconfigured | preconfigured | NAME_CHANGE                                       | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                           |                  | QANOV-417281 |
          | o2de    | 24.0 | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/                                                       |                  | QANOV-554860 |
          | o2de    | 24.0 | preconfigured | preconfigured | NAME_CHANGE                                       | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                             |                  | QANOV-554861 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_preconfigured_url
  Scenario Outline: A user clicks on the Action Row: user is redirected to the target page configured in CMS
    To be executed in QA
    Given the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-action-row" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_action_row" element is visible
     When clicks on the "simple_action_row.chevron" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | link                  | header        | button       | parent_test_plan | jira_id      |
          | vivobr  | 13.3 | services-list         | Mais serviços | back_button  | QANOV-437472     | QANOV-183808 |
          | o2uk    | 13.3 | device_plan           | Device Plan   | back_button  |                  | QANOV-183809 |
          | moves   | 13.1 | appointmentBookingUrl | Movistar      | back_button  |                  | QANOV-183810 |
          | blaude  | 14.6 | NAME_CHANGE           | Namen ändern  | close_button |                  | QANOV-417282 |
          | o2de    | 24.0 | NAME_CHANGE           | Namen ändern  | close_button |                  | QANOV-554862 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_action_row_with_manual_url
  Scenario Outline: A user clicks on the Action Row: user is redirected to the webview
    To be executed in QA
    Given the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-action-row" configured in CMS has a "url" link to "[CONTEXT:simple_action_row.accountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "simple_action_row" element is visible
     When clicks on the "simple_action_row.chevron" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | vivobr  | 13.3 | QANOV-437472     | QANOV-345830 |
          | o2uk    | 13.3 |                  | QANOV-345831 |
          | moves   | 13.1 |                  | QANOV-345832 |
          | blaude  | 14.6 |                  | QANOV-417283 |
          | o2de    | 24.0 |                  | QANOV-554863 |

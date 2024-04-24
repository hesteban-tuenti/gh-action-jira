# -*- coding: utf-8 -*-
@jira.QANOV-189601
Feature: Modular Pages Management


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.<module>
  Scenario Outline: A user can see a modular page with published modules
    We are assuming that there is a modular page with published modules in QA environment
    Given the "<module_name>" module is configured in CMS for "Modular Page Configurable Modules" page
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "[CONTEXT:modular_page.current.content.pageTitle]" header is displayed
      And the "<module>" module is displayed

    Examples:
          | product | cv   | module            | module_name          | jira_id      |
          | vivobr  | 13.3 | simple_action_row | Action Row           | QANOV-189602 |
          | o2uk    | 13.3 | simple_action_row | Action Row           | QANOV-189603 |
          | moves   | 13.1 | simple_action_row | Action Row           | QANOV-189604 |
          | blaude  | 14.1 | tariff_summary    | Main Product Summary | QANOV-325449 |
          | o2de    | 24.0 | tariff_summary    | Main Product Summary | QANOV-531535 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user will see a default content when there is no module defined for a page
    We are assuming that there is a modular page without modules in QA environment
    Given user is in the "Modular Page No Modules" modular page
     Then the "Modular Page Fallback" page is displayed
      And the "image" image is displayed
      And the "title" textfield with "[LANG:account.dashboard.cms_fallback.title]" text is displayed
      And the "message" textfield with "[LANG:account.dashboard.cms_fallback.message]" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189611 |
          | o2uk    | 13.3 | QANOV-189612 |
          | moves   | 13.1 | QANOV-189613 |
          | blaude  | 24.0 | QANOV-531536 |
          | o2de    | 24.0 | QANOV-531537 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.simple_action_row
  Scenario Outline: A user can see a modular page configured with the default option in products relevance
    We are assuming that there is a Test modular page with the preconditions in QA environment
    Given user has a "<role>" role
      And the "simple-action-row" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the modular page has the default option in products relevance
     When user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
     Then the "[CONTEXT:modular_page.current.content.pageTitle]" header is displayed
      And the "simple_action_row" module is displayed

    Examples:
          | product | cv   | role  | jira_id      |
          | vivobr  | 13.3 | any   | QANOV-189617 |
          | o2uk    | 13.3 | any   | QANOV-189618 |
          | moves   | 13.1 | admin | QANOV-189619 |
          | blaude  | 14.1 | any   | QANOV-325450 |
          | o2de    | 24.0 | any   | QANOV-531538 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user with a multi-product plan can see a modular page configured with the multi-product option in products relevance
    We are assuming that there is a Test modular page with the preconditions in QA environment
    Given user has the "Test" modular page configured in CMS with "test" url
      And the "Test" modular page configured in CMS has the "multi-product" product relevance
      And user has the "Action Row" module configured in CMS for "Test" page
      And user has a "<plan>" plan
      And the "Test" modular page is displayed
     Then the "[CONTEXT:modular_page.title]" header is displayed
      And the "simple_action_row.title" textfield with "[CONTEXT:simple_action_row.title]" text is displayed

    Examples:
          | product | cv   | plan           | jira_id      |
          | vivobr  | 13.3 | convergente    | QANOV-189620 |
          | moves   | 13.1 | fusion;pikolin | QANOV-189621 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user with a single-product plan won't see a modular page configured with the multi-product option in products relevance
    We are assuming that there is a Test modular page with the preconditions in QA environment
    Given user has a "monoline" plan
      And a "Test" modular page is configured in CMS with "test" url
      And the "Test" modular page configured in CMS has the "multi-product" product relevance
      And user has the "Action Row" module configured in CMS for "Test" page
     Then the "Modular Page Fallback" modular page is displayed
      And the "message" textfield with "Necesitas permisos para poder consultar esta información" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189622 |
          | moves   | 13.1 | QANOV-189623 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user with a single-product plan can see the default modular page when there are a multi-product relevance page and a default product relevance page
    We are assuming that there is a Test modular page with the preconditions in QA environment
    Given user has a "monoline" plan
      And a "Test-Multi" modular page is configured in CMS with "test" url
      And the "Test-Multi" modular page configured in CMS has the "multi-product" product relevance
      And user has the "Test-Default" modular page configured in CMS with "test" url
      And the "Test-Default" modular page configured in CMS has the "default" product relevance
      And the "Test-Default" modular page is displayed
     Then the "Test-Default" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189624 |
          | moves   | 13.1 | QANOV-189625 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user with a mobile-line product can see the mobile page when there are mobile and default products relevances
    We are assuming that there is a Test modular page with the preconditions in QA environment
    Given user has a "monoline" plan
      And user has the "Test-Mobile" modular page configured in CMS with "test" url
      And the "Test-Mobile" modular page configured in CMS has the "mobile" product relevance
      And a "Test-Default" modular page is configured in CMS with "test" url
      And the "Test-Default" modular page configured in CMS has the "default" product relevance
      And the "Test-Mobile" modular page is displayed
     Then the "Test-Mobile" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189626 |
          | moves   | 13.1 | QANOV-189627 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user with a mobile-line product can see the default page when there are landline and default products relevances
    We are assuming that there is a Test modular page with the preconditions in QA environment
    Given user has a "mobile_line" product
      And user does not have "landline" product
      And a "Test-Landline" modular page is configured in CMS with "test" url
      And the "Test-Landline" modular page configured in CMS has the "landline" product relevance
      And user has the "Test-Default" modular page configured in CMS with "test" url
      And the "Test-Default" modular page configured in CMS has the "default" product relevance
      And the "Test-Default" page is displayed
     Then the "Test-Default" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189628 |
          | moves   | 13.1 | QANOV-189629 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.<module>
  Scenario Outline: A user can see a module that is enabled
    We are assuming that there is a modular page with the preconditions in QA environment
    Given the "<module_name>" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And there is a module in "enabled" status
     Then the "<module>" module is displayed

    Examples:
          | product | cv   | module            | module_name          | jira_id      |
          | vivobr  | 13.3 | simple_action_row | Action Row           | QANOV-189630 |
          | o2uk    | 13.3 | simple_action_row | Action Row           | QANOV-189631 |
          | moves   | 13.1 | simple_action_row | Action Row           | QANOV-189632 |
          | blaude  | 14.1 | tariff_summary    | Main Product Summary | QANOV-325451 |
          | o2de    | 24.0 | tariff_summary    | Main Product Summary | QANOV-531539 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.<module>_with_inactive_status
  @fixture.cms.module.<second_module>
  Scenario Outline: A user can't see a module that is disabled
    We are assuming that there is a modular page with the preconditions in QA environment
    Given the "<module_name>" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And there is a module in "disabled" status
     Then the "<module>" module is not displayed
      And the "<second_module>" module is displayed

    Examples:
          | product | cv   | module                     | module_name                        | second_module           | jira_id      |
          | vivobr  | 13.3 | simple_action_row          | Action Row                         | simple_highlighted_card | QANOV-189633 |
          | o2uk    | 13.3 | simple_action_row          | Action Row                         | simple_highlighted_card | QANOV-189634 |
          | moves   | 13.1 | simple_action_row          | Action Row                         | simple_highlighted_card | QANOV-189635 |
          | blaude  | 14.1 | consumption_counters_cards | Data Consumption Counters as Cards | simple_header           | QANOV-325452 |
          | o2de    | 24.0 | consumption_counters_cards | Data Consumption Counters as Cards | simple_header           | QANOV-531540 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A user can see the modules in the order defined in CMS
    We are assuming that there is a Test modular page with the preconditions in QA environment, however can be tested in Live with an already published page
    Given user has "several" modules configured in CMS for "Test" page in the "header" section
      And user has "1" module configured in CMS for "Test" page in the "highlighted" section
      And user has "several" modules configured in CMS for "Test" page in the "main" section
      And the "Test" modular page is displayed
     Then the "header_section" element is displayed in first position
      And the modules in "header_modules" have the order defined in CMS
      And the "highlighted_section" element is displayed in second position
      And the "main_section" element is displayed in third position
      And the modules in "main_section" have the order defined in CMS

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189636 |
          | o2uk    | 13.3 | QANOV-189637 |
          | moves   | 13.1 | QANOV-189638 |
          | blaude  | 24.0 | QANOV-531541 |
          | o2de    | 24.0 | QANOV-531542 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can see the new order when the modules are reordered in CMS
    We are assuming that there is a Test modular page with the preconditions in QA environment. Only can be tested in QA environment
    Given user has "several" modules configured in CMS for "Test" page in the "header" section
      And user has "1" module configured in CMS for "Test" page in the "highlighted" section
      And user has "several" modules configured in CMS for "Test" page in the "main" section
     When the modules are reordered in CMS
      And the changes are saved and published in CMS
      And the "Test" modular page is displayed
     Then the "header_section" element is displayed in first position
      And the modules in "header_modules" have the order defined in CMS
      And the "highlighted_section" element is displayed in second position
      And the "main_section" element is displayed in third position
      And the modules in "main_section" have the order defined in CMS

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189639 |
          | o2uk    | 13.3 | QANOV-189640 |
          | moves   | 13.1 | QANOV-189641 |
          | blaude  | 24.0 | QANOV-531543 |
          | o2de    | 24.0 | QANOV-531544 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @qa @regression @webapp
  @fixture.cms.page.not_published
  Scenario Outline: A user can't see a modular page in DRAFT status
    We are assuming that there is a modular page in draft/paused status in QA environment
    Given the "Modular Page No Published" modular page is in "DRAFT" status
     When user opens the "[CONTEXT:modular_page.metadata.modularPageId]" modular page
     Then the "Modular Page Fallback" modular page is displayed
      And the "image" image is displayed
      And the "title" textfield with "[LANG:account.dashboard.cms_fallback.title]" text is displayed
      And the "message" textfield with "[LANG:account.dashboard.cms_fallback.message]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-207874 |
          | o2uk    | 13.3 | QANOV-207875 |
          | moves   | 13.1 | QANOV-207876 |
          | blaude  | 14.1 | QANOV-325453 |
          | o2de    | 24.0 | QANOV-531545 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @regression
  Scenario Outline: A user can't see a modular page in PAUSED status
    We are assuming that there is a modular page in draft/paused status in QA environment
    Given the "Modular Page Configurable Modules By Product" modular page is in "UNPUBLISHED" status
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
     Then the "Modular Page Fallback" page is displayed
      And the "image" image is displayed
      And the "title" textfield with "[LANG:account.dashboard.cms_fallback.title]" text is displayed
      And the "message" textfield with "[LANG:account.dashboard.cms_fallback.message]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-207877 |
          | o2uk    | 13.3 | QANOV-207878 |
          | moves   | 13.1 | QANOV-207879 |
          | blaude  | 24.0 | QANOV-531546 |
          | o2de    | 24.0 | QANOV-531547 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  Scenario Outline: A user will see a default content when a non-existent modular page is loaded
    We are assuming that the page "Modular Page Non-existing" does not exist
    Given user opens the "modular_page_non_existing" modular page
     Then the "Modular Page Fallback" modular page is displayed
      And the "image" image is displayed
      And the "title" textfield with "[LANG:account.dashboard.cms_fallback.title]" text is displayed
      And the "message" textfield with "[LANG:account.dashboard.cms_fallback.message]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-189614 |
          | o2uk    | 13.3 | QANOV-189615 |
          | moves   | 13.1 | QANOV-189616 |
          | blaude  | 14.1 | QANOV-325454 |
          | o2de    | 24.0 | QANOV-531548 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.13.3 @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_with_<authorization>_authorization
  @fixture.cms.module.simple_action_row
  Scenario Outline: An <role> user can see a modular page only visible for "<visibility>"
    We are assuming that there is a page with the authorization defined. However the page could be whatever is created and configured in QA.
    Can be tested in Live as well with the page "Invoices List" for the visibility "admin and admin-light"
    Given user has a "<role>" role
      And the "Modular Page Configurable Modules" modular page is in "PUBLISHED" status
      And the modular page is visible for "<visibility>"
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_action_row" module is displayed

    Examples:
          | role        | visibility            | authorization | jira_id      |
          | admin       | admin                 | role-admin    | QANOV-216171 |
          | admin       | admin and admin-light | admin-any     | QANOV-216172 |
          | admin-light | admin and admin-light | admin-any     | QANOV-216173 |

  @jira.QANOV-216175 @android @automatic @ios @jira.cv.13.3 @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_with_role-admin_authorization
  @fixture.cms.module.simple_action_row
  Scenario: An admin-light user will see the escalation page when trying to access a modular page only visible for "admin"
    We are assuming that there is a page with the authorization defined. However the page could be whatever is created and configured in QA.
    Can be tested in Live as well with the page "Invoices List" for the visibility "admin and admin-light"
    Given user has a "admin-light" role
      And the "Modular Page Configurable Modules" modular page is in "PUBLISHED" status
      And the modular page is visible for "admin"
     When user opens the "[CONTEXT:modular_page.metadata.modularPageId]" modular page
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "login.title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "login.description" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "login.button" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-216177 @android @ios @jira.cv.13.3 @manual @moves @regression
  Scenario: An admin-light user can see a modular page only visible for "admin and user of that line" when the page is loaded for a line belonging to the user
    We are assuming that there is a page with name "Modular Page Line Owner" with the authorization defined. However the page could be whatever is created and configured in QA.
    Can be tested in Live as well with the page "Consumption details"
    Given user has a "admin-light" role
      And the "Modular Page Line Owner" modular page is in "PUBLISHED" status
      And the modular page is visible for "admin and user of that line"
      And user is in the "Modular Page Line Owner" modular page for a line belonging to the user
     Then the "[CONTEXT:modular_page.current.content.pageTitle]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button

  @jira.QANOV-216179 @android @ios @jira.cv.13.3 @manual @moves @regression
  Scenario: An admin-light user will see the escalation page when trying to access a modular page visible for "admin and user of that line" and the page is loaded for different line
    We are assuming that there is a page with name "Modular Page No Line Owner" with the authorization defined. However the page could be whatever is created and configured in QA.
    Can be tested in Live as well with the page "Consumption details"
    Given user has a "admin-light" role
      And the "Modular Page No Line Owner" modular page is in "PUBLISHED" status
      And the modular page is visible for "admin and user of that line"
     When user opens the "Modular Page No Line Owner" modular page for a different line
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-216181 @android @ios @jira.cv.13.3 @manual @moves @regression
  Scenario: An admin user can see a modular page when the page is visible for "admin and user of that line"
    We are assuming that there is a page with name "Modular Page Admin" with the authorization defined.
    However the page could be whatever is created and configured in QA.
    Given user has a "admin" role
      And the "Modular Page Admin" modular page is in "PUBLISHED" status
      And the modular page is visible for "admin and user of that line"
      And user is in the "Modular Page Admin" modular page
     Then the "[CONTEXT:modular_page.current.content.pageTitle]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button

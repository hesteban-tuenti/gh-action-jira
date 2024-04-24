# -*- coding: utf-8 -*-
@jira.QANOV-403433
Feature: Hub Product Summary


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.product_summary_with_<product>_product
  Scenario Outline: A user with more than one product can see a Digital products summary module configured for the <product> product
    To be executed in QA
    Given user has "several" products of "<product>" type
      And the "Digital Products Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "hub_products_summary" element is visible
     Then the "hub_products_summary.title" textfield with "<title>" text is displayed
      And each element in the "hub_products_summary.products_list" list has the "subtitle" field that contains "<description>" text

    Examples:
          | product     | title    | description      | jira_id      |
          | mobile_line | Móvil    | Línea            | QANOV-403434 |
          | landline    | Fijo     | Línea Individual | QANOV-403435 |
          | internet    | Internet | Fibra            | QANOV-403436 |

  @jira.QANOV-403437 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.product_summary_with_tv_product
  Scenario: A user with more than one product can see a Digital products summary module configured for the tv product
    To be executed in QA
    Given user has "several" products of "tv" type
      And the "Digital Products Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "hub_products_summary" element is visible
     Then the "hub_products_summary.title" textfield with "Televisión" text is displayed
      And no element in the "hub_products_summary.products_list" list has the "subtitle" field

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.product_summary_with_<product>_product
  Scenario Outline: A user with just one product can see a Digital products summary module configured for the <product> product
    To be executed in QA
    Given user has "1" products of "<product>" type
      And the "Digital Products Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "hub_products_card" element is visible
     Then the "hub_products_card.<keyword_location>" textfield that contains the "<product_keyword>" text is displayed

    Examples:
          | product     | product_keyword  | keyword_location | jira_id      |
          | mobile_line | Móvil            | pretitle         | QANOV-403438 |
          | landline    | Línea Individual | pretitle         | QANOV-403439 |
          | internet    | Internet         | title            | QANOV-403440 |
          | tv          | TV               | title            | QANOV-403441 |
          | radio       | Radio            | pretitle         | QANOV-403442 |

  @jira.QANOV-403443 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.product_summary_with_icon
  Scenario: A user can see an icon configured in Digital products summary module
    To be executed in QA
    Given user has "several" products of "mobile_line;landline;internet" type
      And the "Digital Products Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "hub_products_summary" element is visible
     Then the "hub_products_summary.icon" icon is displayed

  @jira.QANOV-403444 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.product_summary_with_row_icons
  Scenario: A user can see icons configured for each product in Digital products summary module
    To be executed in QA
    Given user has "several" products of "mobile_line;landline;internet" type
      And the "Digital Products Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "hub_products_summary" element is visible
     Then each element has the "icon" field displayed in the "hub_products_summary.products_list" list

  @jira.QANOV-403445 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.product_summary_with_several_products
  Scenario: A user with several product types can see them in Digital products summary module
    To be executed in QA
    Given user has "several" products of "mobile_line;landline;internet" type
      And the "Digital Products Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "hub_products_summary" element is visible
     Then each element has the "title" field displayed in the "hub_products_summary.products_list" list
      And each element has the "subtitle" field displayed in the "hub_products_summary.products_list" list
      And each element has the "chevron" field displayed in the "hub_products_summary.products_list" list

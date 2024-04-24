# -*- coding: utf-8 -*-
@jira.QANOV-370968
Feature: Hub Product Detail


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.hub_products_detail_with_<product>
  Scenario Outline: A user can see a Digital products detail module configured for the <product> product
    To be executed in QA
    Given user has a "<product>" product
      And the "Digital Products Detail" module is configured in CMS for "Modular Page Configurable Modules" page
     When user is in the "Modular Page Configurable Modules" modular page for the current agreement
     Then the "digital_products_detail.<product>_list" list is displayed
      And each element in the "digital_products_detail.<product>_list" list has the "<field>" field that contains "<text>" text
      And the "digital_products_detail.<exclusive1>_list" list is not displayed
      And the "digital_products_detail.<exclusive2>_list" list is not displayed
      And the "digital_products_detail.<exclusive3>_list" list is not displayed
      And the "digital_products_detail.<exclusive4>_list" list is not displayed

    Examples:
          | product     | field    | text             | exclusive1  | exclusive2 | exclusive3 | exclusive4 | jira_id      |
          | mobile_line | subtitle | Línea Móvil      | landline    | internet   | tv         | radio      | QANOV-370969 |
          | landline    | subtitle | Línea Individual | mobile_line | internet   | tv         | radio      | QANOV-370970 |
          | internet    | title    | Internet         | mobile_line | landline   | tv         | radio      | QANOV-370971 |
          | tv          | title    | TV               | mobile_line | landline   | internet   | radio      | QANOV-370972 |
          | radio       | subtitle | Radio            | mobile_line | landline   | internet   | tv         | QANOV-370973 |

  @jira.QANOV-370974 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.hub_products_detail_with_several_products
  Scenario: A user can see a Digital products detail module configured for several products
    To be executed in QA
    Given user has a "mobile_line" product
      And user has a "landline" product
      And user has a "internet" product
      And the "Digital Products Detail" module is configured in CMS for "Modular Page Configurable Modules" page
     When user is in the "Modular Page Configurable Modules" modular page for the current agreement
     Then the "digital_products_detail.mobile_line_list" list is displayed
      And the "digital_products_detail.landline_list" list is displayed
      And the "digital_products_detail.internet_list" list is displayed
      And the "digital_products_detail.tv_list" list is not displayed
      And the "digital_products_detail.radio_list" list is not displayed

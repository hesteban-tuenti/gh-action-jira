# -*- coding: utf-8 -*-
@jira.QANOV-374977
Feature: Hub Products Header


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @qa
  @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.hub_products_header_with_<fixture>
  Scenario Outline: A user can see a Digital products header module configured for the "<product>" products
    To be executed in QA
    Given user has the "<product>" products
      And the "hub-products-header" module is configured in CMS for "Modular Page Configurable Modules" page
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "hub_products_header" element is visible
     Then the "hub_products_header.title" textfield with "<text>" text is displayed

    Examples:
          | product                       | fixture                               | text                   | jira_id      |
          | mobile_line                   | mobile_line                           | Móvil                  | QANOV-374978 |
          | landline                      | landline                              | Fijo                   | QANOV-374979 |
          | internet                      | internet                              | Internet               | QANOV-374980 |
          | radio                         | radio                                 | Internet               | QANOV-374981 |
          | mobile_line;landline          | mobile_line_and_landline              | Fijo y móvil           | QANOV-374982 |
          | mobile_line;internet          | mobile_line_and_internet              | Internet               | QANOV-374983 |
          | landline;internet             | landline_and_internet                 | Internet y fijo        | QANOV-374984 |
          | radio;mobile_line             | radio_and_mobile_line                 | Internet               | QANOV-374985 |
          | mobile_line;landline;internet | mobile_line_and_landline_and_internet | Internet, fijo y móvil | QANOV-374986 |
          | tv                            | tv                                    | Televisión             | QANOV-374987 |

# -*- coding: utf-8 -*-
@jira.QANOV-554887
Feature: SVAs Entrypoints Lists


  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @sanity @vivobr
  Scenario Outline: A user can see an entrypoint list defined by API
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps included in the tariff
      And user has apps with tag "<sva_product_tag>" in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has the "<list_product_tag>" product tags
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" list is displayed
      And the "<entrypoint>" entrypoint is displayed

    Examples:
          | list_product_tag                       | sva_product_tag  | entrypoint | jira_id      |
          | netflix;incluso                        | netflix;incluso  | Netflix    | QANOV-554888 |
          | whatsapp;netflix;;spotify;waze;incluso | whatsapp;incluso | Whatsapp   | QANOV-554889 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @smoke @vivobr
  Scenario Outline: A user won't see an entrypoint if the user services value added don't have all the product tags defined in list
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user has apps with tag "<sva_product_tag>" in the tariff
      And the list of entrypoints list is of type "API"
      And the list of entrypoints configured in CMS has the "<list_product_tag>" product tags
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "<entrypoint>" entrypoint is not displayed

    Examples:
          | list_product_tag   | sva_product_tag  | entrypoint | jira_id      |
          | netflix            | netflix;incluso  | Netflix    | QANOV-554890 |
          | netflix            | whatsapp;incluso | Whatsapp   | QANOV-554891 |
          | whatsapp;ilimitado | whatsapp;incluso | Whatsapp   | QANOV-554892 |

  @jira.QANOV-554893 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-554883 @manual @mobile @smoke @vivobr
  Scenario: A user won't see an entrypoint if the user doesn't have any service value added
    Given the "Entrypoint list" module is configured in CMS for "Modular Page Entrypoints" page
      And user does not have apps included in the tariff
      And the list of entrypoints list is of type "API"
      And user is in the "Modular Page Entrypoints" modular page for current agreement
     Then the "entrypoint_list" list is not displayed

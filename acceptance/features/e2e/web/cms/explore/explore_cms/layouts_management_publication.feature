# -*- coding: utf-8 -*-
@jira.QANOV-322147 @not_hardening
Feature: Layouts publication


  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @web
  Scenario Outline: A user wants to publish a layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" layout has been created in the CMS
      And there are "any" layouts in "Modified" status
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And the "Layouts Repository" page is loaded
      And I click on the "header_publish_button" button
      And the "publish_popup" popup is displayed
      And I click on the "publish_button" button
     Then the "Layouts Repository" page is loaded
      And no element in the "layouts_list" list has the "STATUS" textfield with the "Modified" text

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322177 |
          | o2de    | start        | QANOV-322173 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322164 |
          | o2uk    | priority     | QANOV-322169 |
          | moves   | explore      | QANOV-322175 |
          | o2es    | explore      | QANOV-374206 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | explore      | QANOV-322178 |
          | blaude  | start        | QANOV-322179 |
          | o2de    | account      | QANOV-322171 |
          | o2de    | explore      | QANOV-322172 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | explore      | QANOV-322165 |
          | vivobr  | start        | QANOV-322166 |
          | o2uk    | account      | QANOV-322167 |
          | o2uk    | explore      | QANOV-322168 |
          | o2uk    | start        | QANOV-322170 |
          | moves   | account      | QANOV-322174 |
          | moves   | start        | QANOV-322176 |
          | o2es    | account      | QANOV-374207 |
          | o2es    | start        | QANOV-374208 |

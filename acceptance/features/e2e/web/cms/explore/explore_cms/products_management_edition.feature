# -*- coding: utf-8 -*-
@jira.QANOV-354350 @not_hardening
Feature: Products management - Edition


  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can filter an existent product in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I fill in the "search_placeholder" field with card title or card id
     Then the results matching the search are displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354400 |
          | o2uk    | QANOV-354401 |
          | o2de    | QANOV-354402 |
          | blaude  | QANOV-354403 |
          | moves   | QANOV-354404 |
          | o2es    | QANOV-354405 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can filter an inexistent product in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I fill in the "search_placeholder" field with card title or card id
     Then the "information_icon" icon is displayed
      And the text of the element "no_match_text" is equal to "We couldn't find any results matching your search"
      And the text of the element "no_match_text_description" is equal to "Please, check the spelling or try with a different term."

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-524165 |
          | o2uk    | QANOV-524166 |
          | o2de    | QANOV-524169 |
          | blaude  | QANOV-524170 |
          | moves   | QANOV-524172 |
          | o2es    | QANOV-524173 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user can edit an existing product in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has at least "1" product created in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And the "product_list" list is displayed
      And I click on the "edit_product_button" field on the "0" element in the "product_list" web list
     Then the "Product Content" page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354351 |
          | o2uk    | QANOV-354352 |
          | o2de    | QANOV-354353 |
          | blaude  | QANOV-354354 |
          | moves   | QANOV-354355 |
          | o2es    | QANOV-354356 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can access to deactivate an activated product through module repository in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has at least "1" product activated in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And the "product_list" list is displayed
      And I click on the "product_actions_button" button of the element with "Active" value in the "Status" field
      And I click on the "product_deactivated_button" button
     Then the "Deactivate popup" popup is displayed
      And the text of the element "product_deactivate_popup_title" is equal to "Deactivate product?"
      And the text of the element "product_deactivate_popup_desc" is equal to "If you deactivate this product card, it will no longer be visible to users."
      And the "popup_cancel_button" button is disabled
      And the "popup_deactivate_button" button is disabled

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-524175 |
          | o2uk    | QANOV-524176 |
          | o2de    | QANOV-524178 |
          | blaude  | QANOV-524179 |
          | moves   | QANOV-524181 |
          | o2es    | QANOV-524182 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can access to deactivate an activated product through editing in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has at least "1" product activated in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And the "product_list" list is displayed
      And I click on the "edit_product_button" field on the "0" element in the "product_list" web list
      And the "Product Content" page is displayed
      And I disable the "activated_switch" switch
     Then the "Deactivate popup" popup is displayed
      And the text of the element "product_deactivate_popup_title" is equal to "Deactivate product?"
      And the text of the element "product_deactivate_popup_desc" is equal to "If you deactivate this product card, it will no longer be visible to users."
      And the "popup_cancel_button" button is disabled
      And the "popup_deactivate_button" button is disabled

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-524183 |
          | o2uk    | QANOV-524184 |
          | o2de    | QANOV-524187 |
          | blaude  | QANOV-524188 |
          | moves   | QANOV-524189 |
          | o2es    | QANOV-524190 |

# -*- coding: utf-8 -*-
@jira.QANOV-354375 @not_hardening
Feature: Products management - Products validation


  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user with no products can access to the Products Repository and see the empty case
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has "0" products created in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
     Then the "Products Repository" page is loaded
      And the text of the element "page_title" is equal to "Product card repository"
      And the "info_button" button is displayed
      And the "header_create_button" element is displayed
      And the text of the element "empty_layout_title" is equal to "Create your first Product card"
      And the text of the element "empty_layout_description" is equal to "Click on \"Create\" to set up a product card"
      And the "create_button" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354376 |
          | o2uk    | QANOV-354377 |
          | o2de    | QANOV-354378 |
          | blaude  | QANOV-354379 |
          | moves   | QANOV-354380 |
          | o2es    | QANOV-354381 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user with products can access to the Products Repository and see the existing products
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has at least "1" products created in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
     Then the "Products Repository" page is loaded
      And the text of the element "page_title" is equal to "Products"
      And the "info_button" button is displayed
      And the "header_create_button" element is displayed
      And the "search_placeholder" placeholder with "Search" text is displayed
      And each item in the "products_list" list has the "card_title" field
      And each item in the "products_list" list has the "product_id" field
      And each item in the "products_list" list has the "status" field
      And each item in the "products_list" list has the "product_options_button" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354382 |
          | o2uk    | QANOV-354383 |
          | o2de    | QANOV-354384 |
          | blaude  | QANOV-354385 |
          | moves   | QANOV-354386 |
          | o2es    | QANOV-354387 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can see info about Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has "0" products created in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "header_info_button" button
     Then the "repository_info_modal" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354388 |
          | o2uk    | QANOV-354389 |
          | o2de    | QANOV-354390 |
          | blaude  | QANOV-354391 |
          | moves   | QANOV-354392 |
          | o2es    | QANOV-354393 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can not create a new product if the mandatory fields are empty in Content step
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "header_create_layout" button
      And the "Product Content" page is loaded
      And I click on the "create_button" button
     Then the "validation_error" element is under "title_placeholder" element
      And the "validation_error" element is under "description_placeholder" element
      And the "validation_error" element is under "product_id_placeholder" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354394 |
          | o2uk    | QANOV-354395 |
          | o2de    | QANOV-354396 |
          | blaude  | QANOV-354397 |
          | moves   | QANOV-354398 |
          | o2es    | QANOV-354399 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can not create a new product if the mandatory fields are empty in Actions step
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
      And the "Product Content" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
      And the "Product Actions" page is loaded
      And I click on the "save_button" button
     Then the "validation_error" element is under "url_placeholder" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-524202 |
          | o2uk    | QANOV-524204 |
          | o2de    | QANOV-524205 |
          | blaude  | QANOV-524206 |
          | moves   | QANOV-524207 |
          | o2es    | QANOV-524208 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can not create a new product with a product Id that already exists
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given CMS have a product with "Qa Test |title|" product id in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
      And the "Product Content" page is loaded
      And I fill in the "product_id_placeholder" field with "Qa Test |title|"
     Then the "validation_error" element is under "product_id_placeholder" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354406 |
          | o2uk    | QANOV-354407 |
          | o2de    | QANOV-354408 |
          | blaude  | QANOV-354409 |
          | moves   | QANOV-354410 |
          | o2es    | QANOV-354411 |

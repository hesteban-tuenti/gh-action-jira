# -*- coding: utf-8 -*-
@jira.QANOV-524151 @not_hardening
Feature: Products management - Deletion


  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user will see a confirmation popup when deleting an existing product in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has at least "1" product created in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And the "product_list" list is displayed
      And I click on the "delete_product_button" field on the "0" element in the "product_list" web list
     Then the "Delete Popup" popup is displayed
      And the text of the element "popup_title" contains "Delete?"
      And the text of the element "popup_description" is equal to "Are you sure you want to remove this Product ID? By deleting it may result in changes to the explore cards associated with it."
      And the "popup_remove_button" button is displayed
      And the "cross_button" button is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354357 |
          | o2uk    | QANOV-354358 |
          | o2de    | QANOV-354359 |
          | blaude  | QANOV-354360 |
          | moves   | QANOV-354361 |
          | o2es    | QANOV-354362 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can delete a product in the Products Repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has at least "1" product created in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And the "product_list" list is displayed
      And I store the text in the "fist_product_card_title" element in the context storage with key "product_title"
      And I click on the "product_actions_button" button
      And I click on the "product_delete_button" button
      And the "Delete popup" popup is displayed
      And I click on the "popup_delete_button" button
     Then the text of the element "product_deleted_crouton" is equal to "Product deleted"
      And no element in the "product_list" list has the value "[CONTEXT:product_title]" in the "card_title" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354369 |
          | o2uk    | QANOV-354370 |
          | o2de    | QANOV-354371 |
          | blaude  | QANOV-354372 |
          | moves   | QANOV-354373 |
          | o2es    | QANOV-354374 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can access to delete an existing product in the Products Repository but cancel it
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given CMS cms has at least "1" product in the Products repository
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And the "product_list" list is displayed
      And I store the text in the "fist_product_card_title" element in the context storage with key "product_title"
      And I click on the "product_actions_button" button
      And I click on the "product_delete_button" button
      And the "Delete popup" popup is displayed
      And I click on the "popup_cancel_button" button
     Then any element in the "product_list" list has the "card_title" textfield with the "[CONTEXT:product_title]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354363 |
          | o2uk    | QANOV-354364 |
          | o2de    | QANOV-354365 |
          | blaude  | QANOV-354366 |
          | moves   | QANOV-354367 |
          | o2es    | QANOV-354368 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can access to delete a featured content card with a product that users can already have favorited
    Given a "featured content" module has been created in CMS
      And a product has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content_button" button
      And the "Edit Module" page is loaded
      And I click on the "actions_card_button" button
      And I click on the "actions_delete_card_button" button
     Then the popup with "Delete card?" title and "If present in other modules, this card will still be visible in them. To delete the Product ID associated with this card you will have to delete the Product card from the Product card repository." message is displayed
      And the "popup_cancel_button" button is displayed
      And the "popup_delete_button" button is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354430 |
          | o2uk    | QANOV-354431 |
          | moves   | QANOV-354432 |
          | blaude  | QANOV-354433 |
          | o2de    | QANOV-354434 |
          | o2es    | QANOV-354435 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can delete a featured content card with a product that users can already have favorited
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "featured content" module has been created in CMS
      And a product has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content_button" button
      And the "Edit Module" page is loaded
      And I click on the "actions_card_button" button
      And I click on the "actions_delete_card_button" button
      And the popup with "Delete card?" title and "If present in other modules, this card will still be visible in them. To delete the Product ID associated with this card you will have to delete the Product card from the Product card repository." message is displayed
      And I click on the "popup_delete_button" button
     Then the "Edit Module" page is loaded
      And the "favourited_card" is not in the "cards_list"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354436 |
          | o2uk    | QANOV-354437 |
          | moves   | QANOV-354440 |
          | blaude  | QANOV-354439 |
          | o2de    | QANOV-354438 |
          | o2es    | QANOV-354441 |

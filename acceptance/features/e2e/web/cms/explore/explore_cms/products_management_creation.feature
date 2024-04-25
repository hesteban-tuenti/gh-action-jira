# -*- coding: utf-8 -*-
@jira.QANOV-354295 @not_hardening
Feature: Products management - Creation


  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @smoke @web
  Scenario Outline: A user can access to the Content step when creates a new product
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
     Then the "Product Content" page is loaded
      And the text of the element "page_title" is equal to "New card"
      And the text of the element "page_subtitle" is equal to "Product"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the "dynamic_preview.digital_hub" element is displayed
      And the text of the element "content_title" is equal to "Content"
      And the "title_placeholder" placeholder with "Title" text is displayed
      And the text of the element "title_placeholder_description" is equal to "23 characters max. 1 line."
      And the "description_placeholder" placeholder with "Description" text is displayed
      And the text of the element "description_placeholder_description" is equal to "27 characters max. 1 line."
      And the text of the element "product_id_subtitle" is equal to "Product ID"
      And the text of the element "product_id_description" is equal to "This text will not be visible for the user. It will be used internally to easily link the corresponding explore card to the product in the favourites section. E.G.:iPhone14Pro"
      And the "product_id_placeholder" placeholder with "Product ID" text is displayed
      And the text of the element "product_id_placeholder_description" is equal to "60 characters max. 1 line."
      And the text of the element "asset_title" is equal to "Select an asset"
      And the text of the element "asset_description" is equal to "The image must have a minimun size of 408 x 408 px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" button with "+ Add image" text is displayed
      And the text of the element "status_title" is equal to "Status"
      And the text of the element "switch_text" is equal to "Activated"
      And the "activated_switch" switch is enabled
      And the "next_button" button is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354296 |
          | o2uk    | QANOV-354297 |
          | o2de    | QANOV-354298 |
          | blaude  | QANOV-354299 |
          | moves   | QANOV-354300 |
          | o2es    | QANOV-354301 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @smoke @web
  Scenario Outline: A user can access to the Actions step when creates a new product
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
      And the "Product Content" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
     Then the "Product Actions" page is displayed
      And the text of the element "page_title" is equal to "New card"
      And the text of the element "page_subtitle" is equal to "Product"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the "dynamic_preview.digital_hub" element is displayed
      And the text of the element "content_title" is equal to "Actions"
      And the "url_placeholder" placeholder with "URL" text is displayed
      And the text of the element "url_placeholder_description" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL"
      And the text of the element "timer_subtitle" is equal to "Card starr and end time"
      And the text of the element "timer_optional" is equal to "Optional"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the text of the element "timer_type_subtitle" is equal to "Timer"
      And the text of the element "timer_type_description" is equal to "If the date is later than today's date, the timer will not be shown in the preview, but it will ber shown in production at the aplication time."
      And the "none_radiobutton" button is displayed
      And the "single_timer_radiobutton" button is displayed
      And the "countdown_timer_radiobutton" button is displayed
      And the "back_button" button is displayed
      And the "next_button" button is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-524132 |
          | o2uk    | QANOV-524133 |
          | o2de    | QANOV-524134 |
          | blaude  | QANOV-524136 |
          | moves   | QANOV-524137 |
          | o2es    | QANOV-524138 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @smoke @web
  Scenario Outline: A user can add expiration date to a product card in the Actions step when creates a new product
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
      And the "Product Content" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
      And the "Product Actions" page is displayed
      And I click on the "card_start_selector" button
      And I select a date from the calendar box
     Then a date is selected

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-524139 |
          | o2uk    | QANOV-524140 |
          | o2de    | QANOV-524141 |
          | blaude  | QANOV-524142 |
          | moves   | QANOV-524143 |
          | o2es    | QANOV-524144 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can cancel the creation of a new product
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
      And the "Create Product" page is loaded
      And I click the "header_cancel_button" button
     Then the "Products Repository" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354302 |
          | o2uk    | QANOV-354303 |
          | o2de    | QANOV-354304 |
          | blaude  | QANOV-354305 |
          | moves   | QANOV-354306 |
          | o2es    | QANOV-354307 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user can create a new product
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.products_repo]" web page
      And the "Products Repository" page is loaded
      And I click on the "create_button" button
      And the "Product Content" page is loaded
      And I fill in the "title_placeholder" field with "QaTest|title|"
      And I fill the mandatory fields
      And I click on the "next_button" button
      And the "Product Actions" page is loaded
      And I fill the mandatory fields
      And I click on the "save_button" button
     Then the "Products Repository" page is loaded
      And any element in the "products_list" list has the "card_title" textfield with the "QaTest|title|" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354308 |
          | o2uk    | QANOV-354309 |
          | o2de    | QANOV-354310 |
          | blaude  | QANOV-354311 |
          | moves   | QANOV-354312 |
          | o2es    | QANOV-354313 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: A user can access to create a new product clicking the new product link in the Cards actions step of a Poster cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "poster cards" module has been created in CMS
      And a product has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Qa Test |heart icon|"
      And I click on the "add_image_button" button
      And I select an image and upload it
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "new_product_link" element
     Then the "Create Product" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523606 |
          | o2uk    | QANOV-523607 |
          | o2de    | QANOV-523608 |
          | blaude  | QANOV-523609 |
          | moves   | QANOV-523610 |
          | o2es    | QANOV-523611 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @regression @web
  Scenario Outline: 
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "vertical cards" module has been created in CMS
      And a product has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Qa Test |heart icon|"
      And I click on the "add_image_button" button
      And I select an image and upload it
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "url_placeholder" field with "https://www.google.es"
      And I click on the "favourites_switch" element
      And the "favourites_switch" checkbox is enabled
      And I click on the "create_new_product_id_link" element
      And A new explorer tab is opened
      And the "Create Product" page is loaded
      And I fill in the "title_placeholder" field with "Qa Test |title|"
      And I fill in the "description_placeholder" field with "Qa Test |description|"
      And I fill in the "product_id_placeholder" field with "QaTest|productId|"
      And I fill in the "action_url_placeholder" field with "https://www.google.es"
      And I click on the "upload_image" button
      And I select an image and upload it
      And I click on the "save_button" button
      And I close the current tab
      And the the "Card Actions" page is loaded
      And I click on the "products_refresh_button" button
      And I fill in the "select_product_input" field with "QaTest|productId|"
     Then any element in the "available_products_list" list has the "product_id" textfield with the "QaTest|productId|" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354344 |
          | o2uk    | QANOV-354345 |
          | o2de    | QANOV-354346 |
          | blaude  | QANOV-354347 |
          | moves   | QANOV-354348 |
          | o2es    | QANOV-354349 |

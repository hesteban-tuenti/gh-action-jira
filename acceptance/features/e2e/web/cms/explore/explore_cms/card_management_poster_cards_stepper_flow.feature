# -*- coding: utf-8 -*-
@jira.QANOV-499373 @not_hardening
Feature: Card management - Poster cards stepper flow


  @jira.<jira_id> @<product> @jira.cv.Future @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new poster card
    Given a "poster cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
     Then the "Card Content" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module_list" module is displayed
      And the "stepper_module_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the "card_pre_title_input" inputtext with the "Pre-title (optional)" placeholder is displayed
      And the "card_title_input" inputtext with the "Title" placeholder is displayed
      And the "card_tag_input" inputtext with the "Tag (optional)" placeholder is displayed
      And the "card_description_input" inputtext with the "Description (optional)" placeholder is displayed
      And the text of the element "select_an_asset_title" is equal to "Select an asset"
      And the "image_checkbox" element is displayed
      And the "bumper_checkbox" element is displayed
      And the text of the element "image_desc" is equal to "The image must have a minimum size of X x X px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" button with "+ Add button" text is displayed
      And the text of the element "circle_asset_title" is equal to "Image asset circle"
      And the "none_radio_button" element is displayed
      And the "image_radio_button" element is displayed
      And the "text_radio_button" element is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499374 |
          | o2uk    | QANOV-499375 |
          | moves   | QANOV-499376 |
          | blaude  | QANOV-499377 |
          | o2de    | QANOV-499378 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-499379 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a image slot of image asset circle in the first screen in the stepper flow when creating a new poster card
    Given a "poster cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "image_asset_radio_button" button
     Then the text of the element "image_asset_desc" is equal to "The image must have a minimum size of 40 x 40px optimized JPG or PNG. It should be 2.5x or 3x size to avoid pixelated images."
      And the "add_image_button" button with "+ Add image" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499380 |
          | o2uk    | QANOV-499381 |
          | moves   | QANOV-499382 |
          | blaude  | QANOV-499383 |
          | o2de    | QANOV-499384 |
          | o2es    | QANOV-499385 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a text slot of image asset circle in the first screen in the stepper flow when creating a new poster card
    Given a "poster cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "text_asset_radio_button" button
     Then the "asset_text_input" placeholder with "Asset text" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499386 |
          | o2uk    | QANOV-499387 |
          | moves   | QANOV-499388 |
          | blaude  | QANOV-499389 |
          | o2de    | QANOV-499390 |
          | o2es    | QANOV-499391 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new poster card
    Given a "poster cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the "tapeable_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "tapeable_checkbox_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
      And the text of the element "card_timer_title" is equal to "Card start and end time"
      And the text of the element "card_timer_optional" is equal to "Optional"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the text of the element "timer_title" is equal to "Timer"
      And the text of the element "timer_title_desc" is equal to "If the date is later than today's date, the timer will not be shown in the preview, but it will be shown in production at the applicable time."
      And the "none_timer_radio_button" element is displayed
      And the "single_timer_radio_button" element is displayed
      And the "countdown_timer_radio_button" element is displayed
      And the "back_button" element is displayed
      And the "next_button" element is displayed

    @smoke
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499392 |
          | o2uk    | QANOV-499393 |
          | moves   | QANOV-499394 |
          | blaude  | QANOV-499395 |
          | o2de    | QANOV-499396 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-499397 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new poster card
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
     Then the "Card Other" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "targeting_title" is equal to "Segmentation and targeting"
      And the text of the element "layouts_title" is equal to "Layouts"
      And the text of the element "layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the text of the element "audience_title" is equal to "Audience"
      And the text of the element "audience_optional" is equal to "Optional"
      And the text of the element "audience_optional" is equal to "Add one or more conditions to select your audience. If you don't select an audience it will be visible to all users"
      And the "condition_button" button with "+ Add condition" text is displayed
      And the text of the element "categories_section_title" is equal to "Categories"
      And the text of the element "categories_section_text" is equal to "You must provide at least one of each of the categories below."
      And the text of the element "explore_categories_title" is equal to "Explore card categories"
      And the "categories_checkbox_list" list is displayed
      And the "edit_categories_button" button with "Edit categories" text is displayed
      And the text of the element "account_categories_title" is equal to "Account card categories"
      And the "account_radio_button_list" list is displayed
      And the text of the element "start_tab_title" is equal to "Start Tab"
      And the "start_tab_checkbox_list" list is displayed
      And the text of the element "content_category_title" is equal to "Content category"
      And the text of the element "content_category_title" is equal to "Internal clasification of the action into the following groups:"
      And the "content_category_select" element is displayed
      And the text of the element "content_group_title" is equal to "Content group"
      And the text of the element "content_group_title" is equal to "Flow name/subflow"
      And the "content_group_select" element is displayed
      And the text of the element "tracking_tag_title" is equal to "Tracking tag"
      And the text of the element "tracking_tag_s_text" is equal to "Tracking tag for internally identifying this specific content. This won’t be visible to users."
      And the "select_tracking_tag" element is displayed
      And the text of the element "tracking_description_title" is equal to "Tracking name description"
      And the text of the element "tracking_description_text" is equal to "Tracking name for internally identifying this specific content. This won’t be visible to users."
      And the "tracking_description_input" inputtext with the "Tracking name description" placeholder is displayed
      And the "back_button" element is displayed
      And the "save_button" element is displayed

    @smoke
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499398 |
          | o2uk    | QANOV-499399 |
          | moves   | QANOV-499400 |
          | blaude  | QANOV-499401 |
          | o2de    | QANOV-499402 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-499403 |

  @jira.<jira_id> @<product> @jira_cv.Future @manual @web
  Scenario Outline: A user can create a new poster card uploading a new image
    Given a "poster cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_poster_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test card using existing image"
      And I fill in the "card_description_input" field with "qa test card description"
      And I click on the "image_checkbox" button
      And I click on the "add_image_button" element
      And I click on the "select_file" button
      And I select an image from the computer files
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "card_url" field with "https://google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "first_explore_card_categories_checkbox" element
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_description_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test - new card uploading an image"

    @smoke
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499404 |
          | o2uk    | QANOV-499405 |
          | moves   | QANOV-499406 |
          | blaude  | QANOV-499407 |
          | o2de    | QANOV-499408 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-499409 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user can configure poster cards card with a heart icon
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "poster cards" module has been created in CMS
      And a "product" has been created in CMS
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
      And I fill in the "url_placeholder" field with "https://www.google.es"
      And I click on the "favourites_selector" element
      And I click on the "0" element in the "products_id_list" list
      And I click on the "next_button" button
     Then the "Card Other" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-523600 |
          | o2uk    | QANOV-523601 |
          | o2de    | QANOV-523602 |
          | blaude  | QANOV-523603 |
          | moves   | QANOV-523604 |
          | o2es    | QANOV-523605 |

# -*- coding: utf-8 -*-
@jira.QANOV-499410 @not_hardening
Feature: Card management - Naked  small cards stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new naked small cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have naked small cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "naked small cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_naked_small_cards_button" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
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
      And the "card_title_input" inputtext with the "Title" placeholder is displayed
      And the "card_subtitle_input" inputtext with the "Subtitle (optional)" placeholder is displayed
      And the "card_description_input" inputtext with the "Description (optional)" placeholder is displayed
      And the text of the element "asset_title" is equal to "Select an asset"
      And the text of the element "asset_desc" is equal to "The image must have a minimum size of XxX px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" element is displayed
      And the text of the element "image_accesibility_title" is equal to "Image accessibility text"
      And the text of the element "image_accesibility_optional" is equal to "Optional"
      And the text of the element "image_accesibility_desc" is equal to "This is a descriptive text used for accessibility as an alternative for the image (used by screen readers)."
      And the "image_accesibility_input" placeholder with "Image accessibility text (optional)" text is displayed
      And the text of the element "circle_asset_title" is equal to "Image asset circle"
      And the "none_radio_button" element is displayed
      And the "image_radio_button" element is displayed
      And the "text_radio_button" element is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-499411 |
          | o2uk    | 14.8 | QANOV-499412 |
          | moves   | 14.8 | QANOV-499413 |
          | blaude  | 14.8 | QANOV-499414 |
          | o2de    | 14.8 | QANOV-499415 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-499416 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new naked small cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have naked small cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "naked small cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_naked_small_cards_button" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test NakedCard"
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the "url_input" inputtext with the "URL" placeholder is displayed
      And the text of the element "card_timers_title" is equal to "Card start and end time"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the "back_button" element is displayed
      And the "next_button" element is displayed

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-499417 |
          | o2uk    | 14.8 | QANOV-499418 |
          | moves   | 14.8 | QANOV-499419 |
          | blaude  | 14.8 | QANOV-499420 |
          | o2de    | 14.8 | QANOV-499421 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-499422 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new naked small cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have nakedsmall cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "naked small cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_naked_small_cards" button
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
      And the text of the element "audience_desc" is equal to "Add one or more conditions to select your audience. If you don't select an audience it will be visible to all users"
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
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-499423 |
          | o2uk    | 14.8 | QANOV-499424 |
          | moves   | 14.8 | QANOV-499425 |
          | blaude  | 14.8 | QANOV-499426 |
          | o2de    | 14.8 | QANOV-499427 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-499428 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can create a new naked small cards card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    Mandatory fields: image, title, action_url, categories, tracking tag, tracking name description"
    O2es will have naked small cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "naked small cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_naked_small_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test NakedSmallCard"
      And I fill in the mandatory fields
      And I click on the "add_image_button" element
      And I click on the "select_file" button
      And I select an image from the computer files
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the mandatory fields
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "any" element in the "categories_checkbox_list" list
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_desc_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test NakedSmallCard"

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.8 | QANOV-499429 |
          | o2uk    | 14.8 | QANOV-499430 |
          | moves   | 14.8 | QANOV-499431 |
          | blaude  | 14.8 | QANOV-499432 |
          | o2de    | 14.8 | QANOV-499433 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-499434 |

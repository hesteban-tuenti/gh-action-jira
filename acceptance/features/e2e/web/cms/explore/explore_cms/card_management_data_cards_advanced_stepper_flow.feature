# -*- coding: utf-8 -*-
@jira.QANOV-499851 @not_hardening
Feature: Card management - Data cards advanced stepper flow


  @jira.QANOV-499852 @jira.cv.Future @manual @sanity @vivobr @web
  Scenario: A user can access to the first screen in the stepper flow when creating a new data cards advanced
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
     Then the "Card Content" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the "card_title_input" inputtext with the "Title" placeholder is displayed
      And the "vivinho_checkbox" checkbox is displayed
      And the text of the element "slot_title" is equal to "Slot"
      And the text of the element "slot_optional" is equal to "Optional"
      And the "none_radio_button" element is displayed
      And the "highlighted_text_radio_button" element is displayed
      And the "stacking_group_radio_button" element is displayed
      And the "card_tag" placeholder with "Tag (optional)" text is displayed
      And the "description_tag" placeholder with "Description (optional)" text is displayed
      And the "next_button" element is displayed

  @jira.QANOV-499853 @jira.cv.Future @manual @sanity @vivobr @web
  Scenario: A user can see the fields for highlighted slot in the first screen in the stepper flow when creating a data cards advanced
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "highlighted_radio_button" button
     Then the "tag_input" placeholder with "Tag (optional)" text is displayed
      And the "first_heading_input" placeholder with "Heading" text is displayed
      And the "first_value_input" placeholder with "Value text (optional)" text is displayed
      And the "second_heading_input" placeholder with "Heading 2 (optional)" text is displayed
      And the "second_value_input" placeholder with "Value text 2 (optional)" text is displayed
      And the "secondary_value_input" placeholder with "Secondary value (optional)" text is displayed
      And the "title_input" placeholder with "Title" text is displayed
      And the "subtitle_input" placeholder with "Subtitle (optional)" text is displayed
      And the "support_input" placeholder with "Support text (optional)" text is displayed
      And the "description_input" placeholder with "Description (optional)" text is displayed

  @jira.QANOV-499854 @jira.cv.Future @manual @sanity @vivobr @web
  Scenario: A user can see the fields for stacking group slot in the first screen in the stepper flow when creating a data cards advanced
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "stacking_radio_button" button
     Then the "card_tag" placeholder with "Tag (optional)" text is displayed
      And the "description_tag" placeholder with "Description" text is displayed
      And the text of the element "asset_title" is equal to "Select an asset"
      And the text of the element "asset_desc" is equal to "The image must have a minimum size of 64 x 64 px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" button with "+ Add button" text is displayed

  @jira.QANOV-499855 @jira.cv.Future @manual @smoke @vivobr @web
  Scenario: A user can access to the second screen in the stepper flow when creating a new data cards advanced
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test DataCard"
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the "card_tapeable_radio_button" element is displayed
      And the "card_tapeable_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "card_tapeable_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
      And the "card_cta_radio_button" element is displayed
      And the text of the element "card_timer_title" is equal to "Card start and end time"
      And the text of the element "card_timer_optional" is equal to "Optional"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the text of the element "timer_title" is equal to "Timer"
      And the text of the element "timer_desc" is equal to "If the date is later than today's date, the timer will not be shown in the preview, but it will be shown in production at the applicable time."
      And the "none_radio_button" element is displayed
      And the "single_timer_radio_button" element is displayed
      And the "countdown_timer_radio_button" element is displayed
      And the "back_button" element is displayed
      And the "next_button" element is displayed

  @jira.QANOV-499856 @jira.cv.Future @manual @sanity @vivobr @web
  Scenario: A user can see the fields for CTA slot in the second screen in the stepper flow when creating a data cards advanced
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And the "Card Actions" page is displayed
      And I click on the "cta_radio_button" button
     Then the "cta_input" inputtext with the "CTA" placeholder is displayed
      And the "url_input" inputtext with the "CTA URL" placeholder is displayed
      And the "link_switch" switch is disabled

  @jira.QANOV-499857 @jira.cv.Future @manual @sanity @vivobr @web
  Scenario: A user can see the fields for CTA slot with link enabled in the second screen in the stepper flow when creating a data cards advanced
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And the "Card Actions" page is displayed
      And I click on the "cta_radio_button" button
      And the "cta_input" inputtext with the "CTA" placeholder is displayed
      And the "url_cta_input" inputtext with the "CTA URL" placeholder is displayed
      And I click the "link_switch" element
     Then the "link_input" inputtext with the "Link" placeholder is displayed
      And the "url_link_input" inputtext with the "Link URL" placeholder is displayed

  @jira.QANOV-499858 @jira.cv.Future @manual @smoke @vivobr @web
  Scenario: A user can access to the third screen in the stepper flow when creating a new data card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have data cards enabled but will only make use of featured content, that's why the is regressed unlike the others.
    Given a "data cards advanced" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test DataCard"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "card_link_text_input" field with "qa link"
      And I fill in the "card_link_url_input" field with "https://google.es"
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

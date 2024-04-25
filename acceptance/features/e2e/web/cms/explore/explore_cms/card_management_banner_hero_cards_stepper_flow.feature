# -*- coding: utf-8 -*-
@jira.QANOV-328030 @not_hardening
Feature: Card management - Banner hero card stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new banner hero card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
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
      And the text of the element "card_pre_title" is equal to "Pre-title (optional)"
      And the "card_pre_title_input" inputtext with the "Pre-title" placeholder is displayed
      And the text of the element "card_title" is equal to "Title"
      And the "card_title_input" inputtext with the "Title" placeholder is displayed
      And the text of the element "card_tag_title" is equal to "Tag (optional)"
      And the "card_tag_input" inputtext with the "Card tag" placeholder is displayed
      And the text of the element "card_desc_title" is equal to "Description (optional)"
      And the "card_desc_input" inputtext with the "Description" placeholder is displayed
      And the text of the element "select_image_or_bumper_title" is equal to "Select an asset"
      And the "image_radio_button" element is displayed
      And the "bumper_radio_button" element is displayed
      And the "image_radio_button" element is selected
      And the text of the element "upload_image_button" is equal to "Upload an image"
      And the text of the element "image_accesibility_title" is equal to "Image accesibility text (optional)"
      And the "image_accesibility_input" inputtext with the "Image accesibility Text" placeholder is displayed
      And the "next_button" element is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-375985 |
          | o2uk    | 14.3   | QANOV-375986 |
          | moves   | 14.3   | QANOV-328031 |
          | blaude  | 14.3   | QANOV-375987 |
          | o2de    | 14.3   | QANOV-375988 |
          | o2es    | Future | QANOV-375989 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new banner hero card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test BHC"
      And I click on the "upload_image_button" element
      And I click on the "select_file" button
      And I select an image from the computer files
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the text of the element "tappeable_card_radio_button" is equal to "Card tappeable"
      And the "tappeable_card_input" inputtext with the "URL" placeholder is displayed
      And the text of the element "cta_radio_button" is equal to "Cta"
      And the "tappeable_card_radio_button" element is selected
      And the text of the element "card_timers_title" is equal to "Card start and end time (optional)"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the text of the element "favourites_title" is equal to "Favorites"
      And the "favourites_switch" element is displayed
      And the "favourites_switch" element is disabled
      And the "back_button" element is displayed
      And the "next_button" element is displayed

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-375990 |
          | o2uk    | 14.3 | QANOV-375991 |
          | moves   | 14.3 | QANOV-328032 |
          | blaude  | 14.3 | QANOV-375992 |
          | o2de    | 14.3 | QANOV-375993 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-375994 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a CTA in the second screen in the stepper flow when creating a new banner hero card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test BHC"
      And I click on the "upload_image_button" element
      And I click on the "select_file" button
      And I select an image from the computer files
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "cta_radio_button" element
      And I click on the "cta_link_switch" element
     Then the text of the element "cta_radio_button" is equal to "Cta"
      And the "cta_text_input" inputtext with the "Text for your CTA" placeholder is displayed
      And the "cta_url_input" inputtext with the "URL" placeholder is displayed
      And the "cta_link_switch" element is enabled
      And the "cta_link_text_input" inputtext with the "Text for your link" placeholder is displayed
      And the "cta_link_url_input" inputtext with the "URL" placeholder is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-375995 |
          | o2uk    | 14.3   | QANOV-375996 |
          | moves   | 14.3   | QANOV-328033 |
          | blaude  | 14.3   | QANOV-375997 |
          | o2de    | 14.3   | QANOV-375998 |
          | o2es    | Future | QANOV-375999 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new banner hero card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test BHC"
      And I click on the "upload_image_button" element
      And I click on the "select_file" button
      And I select an image from the computer files
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "tappeable_card_input" field with "https://google.es"
      And I click on the "next_button" button
     Then the "Card Other" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "segmentation_title" is equal to "Segmentation and targeting"
      And the text of the element "add_condition" is equal to "+ Add condition"
      And the text of the element "categories_section_title" is equal to "Categories"
      And the text of the element "explore_categories_title" is equal to "Explore card categories"
      And the "categories_checkbox_list" element is displayed
      And the text of the element "account_categories_title" is equal to "Account card categories"
      And the "account_radio_button_list" element is displayed
      And the text of the element "content_category_title" is equal to "Content category"
      And the "content_category_select" element is displayed
      And the text of the element "content_category_title" is equal to "Content group"
      And the "content_group_select" element is displayed
      And the text of the element "tracking_tag_title" is equal to "Tracking tag"
      And the "select_tracking_tag" element is displayed
      And the text of the element "tracking_desc_title" is equal to "Tracking name description"
      And the "tracking_desc_input" inputtext with the "Tracking name description" placeholder is displayed
      And the "back_button" element is displayed
      And the "save_button" element is displayed

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376000 |
          | o2uk    | 14.3 | QANOV-376001 |
          | moves   | 14.3 | QANOV-328034 |
          | blaude  | 14.3 | QANOV-376002 |
          | o2de    | 14.3 | QANOV-376003 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376004 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can create a new banner hero card uploading a new image
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    Mandatory fields: image, title, action_url, categories, tracking tag, tracking name description"
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test BHC Image"
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "upload_image_button" element
      And I click on the "select_file" button
      And I select an image from the computer files
      And I click on the "add_button" button
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "tappeable_card_input" field with "https://google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "any" element in the "categories_checkbox_list" list
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_desc_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test BHC Image"

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376005 |
          | o2uk    | 14.3 | QANOV-376006 |
          | moves   | 14.3 | QANOV-328035 |
          | blaude  | 14.3 | QANOV-376007 |
          | o2de    | 14.3 | QANOV-376008 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376009 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can create a new banner hero card selecting an existing bumper
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    Mandatory fields: image, title, action_url, categories, tracking tag, tracking name description"
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test BHC existing Bumper"
      And I click on the "bumper_radio_button" button
      And I click on the "search_bumper_by_name_select" element
      And I click on the "any" element in the "bumpers_list" list
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "tappeable_card_input" field with "https://google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "any" element in the "categories_checkbox_list" list
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_desc_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test BHC Image"

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-376010 |
          | o2uk    | 14.3   | QANOV-376012 |
          | moves   | 14.3   | QANOV-328036 |
          | blaude  | 14.3   | QANOV-376013 |
          | o2de    | 14.3   | QANOV-376014 |
          | o2es    | Future | QANOV-376015 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can create a new banner hero card uploading a new bumper
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    Mandatory fields: image, title, action_url, categories, tracking tag, tracking name description"
    O2es will have banner hero cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test BHC existing Bumper"
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "bumper_radio_button" button
      And I click on the "add_bumper_button" button
      And I fill in the "bumper_title" field with "qa_bumper_test"
      And I click on the "select_file" button
      And I select a bumper from the computer files
      And I click on the "add_button" button
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "tappeable_card_input" field with "https://google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "any" element in the "categories_checkbox_list" list
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_desc_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test BHC Image"

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-376016 |
          | o2uk    | 14.3   | QANOV-376017 |
          | moves   | 14.3   | QANOV-328037 |
          | blaude  | 14.3   | QANOV-376018 |
          | o2de    | 14.3   | QANOV-376019 |
          | o2es    | Future | QANOV-376020 |

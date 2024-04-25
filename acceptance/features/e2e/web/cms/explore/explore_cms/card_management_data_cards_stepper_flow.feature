# -*- coding: utf-8 -*-
@jira.QANOV-328038 @not_hardening
Feature: Card management - Data card stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new data card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have data cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "data cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards" button
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
      And the "card_tag_input" inputtext with the "Tag (optional)" placeholder is displayed
      And the "card_desc_input" inputtext with the "Description (optional)" placeholder is displayed
      And the text of the element "price_slot_title" is equal to "Price slot"
      And the text of the element "price_slot_optional" is equal to "Optional"
      And the "none_radio_button" element is displayed
      And the "price_radio_button" element is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376021 |
          | o2uk    | 14.3 | QANOV-376022 |
          | moves   | 14.3 | QANOV-328039 |
          | blaude  | 14.3 | QANOV-376023 |
          | o2de    | 14.3 | QANOV-376024 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376025 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a price slot in the first screen in the stepper flow when creating a new data cards card
    Given a "cata cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "price_radio_button" button
     Then the "top_desc_input" placeholder with "Top description (optional)" text is displayed
      And the "price_input" placeholder with "Price" text is displayed
      And the "highlight_text_input" placeholder with "Offers Row: Highlight (optional)" text is displayed
      And the "price_input" placeholder with "Price" text is displayed
      And the "price_info_input" placeholder with "Price information (optional)" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499845 |
          | o2uk    | QANOV-499846 |
          | moves   | QANOV-499847 |
          | blaude  | QANOV-499848 |
          | o2de    | QANOV-499849 |
          | o2es    | QANOV-499850 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new data card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have data cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "data cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards_button" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
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
      And the "card_link_input" inputtext with the "Link" placeholder is displayed
      And the "card_link_url_input" inputtext with the "Link URL" placeholder is displayed
      And the text of the element "card_timers_title" is equal to "Card start and end time"
      And the text of the element "card_timers_optional" is equal to "Optional"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the text of the element "timer_title" is equal to "Timer"
      And the text of the element "timer_desc" is equal to "If the date is later than today's date, the timer will not be shown in the preview, but it will be shown in production at the applicable time."
      And the "none_radio_button" element is displayed
      And the "single_timer_radio_button" element is displayed
      And the "countdown_timer_radio_button" element is displayed
      And the "back_button" element is displayed
      And the "next_button" element is displayed

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376026 |
          | o2uk    | 14.3 | QANOV-376027 |
          | moves   | 14.3 | QANOV-328040 |
          | blaude  | 14.3 | QANOV-376028 |
          | o2de    | 14.3 | QANOV-376029 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376030 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new data card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have data cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "data cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards" button
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

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376031 |
          | o2uk    | 14.3 | QANOV-376032 |
          | moves   | 14.3 | QANOV-328041 |
          | blaude  | 14.3 | QANOV-376033 |
          | o2de    | 14.3 | QANOV-376034 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376035 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can create a new data card
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    Mandatory fields: title, description, link text and url, categories, tracking tag, tracking name description"
    O2es will have data cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "data cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_data_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test DataCard"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "card_link_input" field with "qa link"
      And I fill in the "card_link_url_input" field with "https://google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "first_explore_card_categories_checkbox" element
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_description_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test DataCard"

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376036 |
          | o2uk    | 14.3 | QANOV-376037 |
          | moves   | 14.3 | QANOV-328042 |
          | blaude  | 14.3 | QANOV-376038 |
          | o2de    | 14.3 | QANOV-376039 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376040 |

# -*- coding: utf-8 -*-
@jira.QANOV-269765 @not_hardening
Feature: Card management - Rows stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a rows card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have rows cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
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
      And the "headline_title" textfield with "Headline" text is displayed
      And the "headline_optional" textfield with "Optional" text is displayed
      And the "none_radio_button" element is displayed
      And the "pretitle_radio_button" element is displayed
      And the "tag_radio_button" element is displayed
      And the "card_title_input" inputtext with the "Title" placeholder is displayed
      And the "card_sub_title_input" inputtext with the "Subtitle (optional)" placeholder is displayed
      And the "card_description_input" inputtext with the "Description" placeholder is displayed
      And the text of the element "image_title" is equal to "Select an asset"
      And the text of the element "image_desc" is equal to "The image must have a minimum size of 384 x 384 px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" button is displayed
      And the text of the element "price_title" is equal to "Price"
      And the text of the element "price_optional" is equal to "Optional"
      And the "none_radio_button" element is displayed
      And the "classic_radio_button" element is displayed
      And the "new_radio_button" element is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-269766 |
          | o2uk    | 14.3 | QANOV-269767 |
          | moves   | 14.3 | QANOV-269768 |
          | blaude  | 14.3 | QANOV-286012 |
          | o2de    | 14.3 | QANOV-376580 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376581 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a "<slot>" slot of Headline in the first screen in the stepper flow when creating a new rows card
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "pretitle_radio_button" button
     Then the "<pretitle>_input" placeholder with "<text>" text is displayed

    Examples:
          | product | slot     | text                 | jira_id      |
          | vivobr  | pretitle | Pre-title (optional) | QANOV-499349 |
          | vivobr  | tag      | Tag (optional)       | QANOV-499350 |
          | o2uk    | pretitle | Pre-title (optional) | QANOV-499351 |
          | o2uk    | tag      | Tag (optional)       | QANOV-499352 |
          | moves   | pretitle | Pre-title (optional) | QANOV-499353 |
          | moves   | tag      | Tag (optional)       | QANOV-499354 |
          | blaude  | pretitle | Pre-title (optional) | QANOV-499355 |
          | blaude  | tag      | Tag (optional)       | QANOV-499356 |
          | o2de    | pretitle | Pre-title (optional) | QANOV-499357 |
          | o2de    | tag      | Tag (optional)       | QANOV-499358 |
          | o2es    | pretitle | Pre-title (optional) | QANOV-499359 |
          | o2es    | tag      | Tag (optional)       | QANOV-499360 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a classic price slot in the first screen in the stepper flow when creating a new rows card
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "classic_price_radio_button" button
     Then the "price_input" placeholder with "Price (optional)" text is displayed
      And the "price_info_input" placeholder with "Price information (optional)" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499361 |
          | o2uk    | QANOV-499362 |
          | moves   | QANOV-499363 |
          | blaude  | QANOV-499364 |
          | o2de    | QANOV-499365 |
          | o2es    | QANOV-499366 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a new price slot in the first screen in the stepper flow when creating a new rows card
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "new_price_radio_button" button
     Then the "price_input" placeholder with "Price (optional)" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499367 |
          | o2uk    | QANOV-499368 |
          | moves   | QANOV-499369 |
          | blaude  | QANOV-499370 |
          | o2de    | QANOV-499371 |
          | o2es    | QANOV-499372 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new rows card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have rows cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows_card" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the "url_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "url_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
      And the text of the element "card_timers_title" is equal to "Card start and end time"
      And the text of the element "card_timers_optional" is equal to "Optional"
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
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-269769 |
          | o2uk    | 14.3 | QANOV-269770 |
          | moves   | 14.3 | QANOV-269771 |
          | blaude  | 14.3 | QANOV-286013 |
          | o2de    | 14.3 | QANOV-376582 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376583 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new rows card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have rows cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
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
          | vivobr  | 14.3 | QANOV-269772 |
          | o2uk    | 14.3 | QANOV-269773 |
          | moves   | 14.3 | QANOV-269774 |
          | blaude  | 14.3 | QANOV-286014 |
          | o2de    | 14.3 | QANOV-376584 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376585 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can create a new row card uploading a new image
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Mandatory fields: image, title, description, price, action_url, categories, tracking tag, tracking name description
    O2es will have rows cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
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
      And I fill in the "card_action_url" field with "https://google.es"
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
          | product | cv   | jira_id      |
          | vivobr  | 11.4 | QANOV-9672   |
          | o2uk    | 11.4 | QANOV-9673   |
          | moves   | 11.4 | QANOV-9674   |
          | blaude  | 11.4 | QANOV-286015 |
          | o2de    | 14.3 | QANOV-376586 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376587 |

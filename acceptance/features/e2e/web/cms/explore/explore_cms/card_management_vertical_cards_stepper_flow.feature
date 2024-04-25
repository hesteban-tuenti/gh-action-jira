# -*- coding: utf-8 -*-
@jira.QANOV-269776 @not_hardening
Feature: Card management - Vertical cards stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new vertical cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have vertical cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards_button" button
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
      And the "card_tag_input" inputtext with the "Tag (optional)" placeholder is displayed
      And the "card_description_input" inputtext with the "Description" placeholder is displayed
      And the text of the element "image_title" is equal to "Select an asset"
      And the text of the element "image_desc" is equal to "The image must have a minimum size of X x X px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" element is displayed
      And the text of the element "image_asset_title" is equal to "Image asset circle"
      And the "asset_radio_button_list" list is displayed
      And the text of the element "price_title" is equal to "Price slot"
      And the text of the element "price_optional" is equal to "Optional"
      And the "price_radio_button_list" list is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-269777 |
          | o2uk    | 14.3 | QANOV-269778 |
          | moves   | 14.3 | QANOV-269779 |
          | blaude  | 14.3 | QANOV-286019 |
          | o2de    | 14.3 | QANOV-376713 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376714 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a image slot of image asset circle in the first screen in the stepper flow when creating a new vertical cards card
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
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
          | vivobr  | QANOV-499249 |
          | o2uk    | QANOV-499250 |
          | moves   | QANOV-499251 |
          | blaude  | QANOV-499252 |
          | o2de    | QANOV-499253 |
          | o2es    | QANOV-499254 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a text slot of image asset circle in the first screen in the stepper flow when creating a new vertical cards card
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
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
          | vivobr  | QANOV-499255 |
          | o2uk    | QANOV-499256 |
          | moves   | QANOV-499257 |
          | blaude  | QANOV-499258 |
          | o2de    | QANOV-499259 |
          | o2es    | QANOV-499260 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a classic price slot in the first screen in the stepper flow when creating a new vertical cards card
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "classic_price_radio_button" button
     Then the "standard_text_input" placeholder with "Offers Row: Standard (optional)" text is displayed
      And the "strickethrought_text_input" placeholder with "Offers Row: Strickethrought (optional)" text is displayed
      And the "highlight_text_input" placeholder with "Offers Row: Highlight (optional)" text is displayed
      And the "price_input" placeholder with "Price" text is displayed
      And the "price_info_input" placeholder with "Price information (optional)" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499261 |
          | o2uk    | QANOV-499262 |
          | moves   | QANOV-499263 |
          | blaude  | QANOV-499264 |
          | o2de    | QANOV-499265 |
          | o2es    | QANOV-499266 |

  @jira.<jira_id> @<product> @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the fields for a new price slot in the first screen in the stepper flow when creating a new vertical cards card
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "new_price_radio_button" button
     Then the "top_desc_input" placeholder with "Top description (optional)" text is displayed
      And the "abc_strickethrought_checkbox" checkbox is displayed
      And the "price_input" placeholder with "Price" text is displayed
      And the "bottom_desc_input" placeholder with "Bottom description (optional)" text is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-499267 |
          | o2uk    | QANOV-499268 |
          | moves   | QANOV-499269 |
          | blaude  | QANOV-499270 |
          | o2de    | QANOV-499271 |
          | o2es    | QANOV-499272 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new vertical cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have vertical cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the "url_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "url_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
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
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-269780 |
          | o2uk    | 14.3 | QANOV-269781 |
          | moves   | 14.3 | QANOV-269782 |
          | blaude  | 14.3 | QANOV-286020 |
          | o2de    | 14.3 | QANOV-376715 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376716 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new vertical cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have vertical cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
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
      And the text of the element "categories_section_text" is equal to "You must provide at least one of each of the categories below:"
      And the text of the element "explore_categories_title" is equal to "Explore card categories"
      And the "categories_checkbox_list" element is displayed
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
          | vivobr  | 14.3 | QANOV-269783 |
          | o2uk    | 14.3 | QANOV-269784 |
          | moves   | 14.3 | QANOV-269785 |
          | blaude  | 14.3 | QANOV-286021 |
          | o2de    | 14.3 | QANOV-376717 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376718 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can create a new vertical cards card uploading a new image
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Mandatory fields: image, title, description, price, action_url, categories, tracking tag, tracking name description"
    O2es will have vertical cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "vertical cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
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
          | product | cv    | jira_id      |
          | vivobr  | 11.14 | QANOV-9669   |
          | o2uk    | 11.14 | QANOV-9670   |
          | moves   | 11.14 | QANOV-9671   |
          | blaude  | 11.14 | QANOV-286022 |
          | o2de    | 11.14 | QANOV-376719 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376720 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user can configure vertical cards card with a heart icon
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "vertical cards" module has been created in CMS
      And a product has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_vertical_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "Qa Test |heart icon|"
      And I fill in the "card_description_input" field with "Qa Test |heart icon|"
      And I click on the "add_image_button" button
      And I select an image and upload it
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "url_placeholder" field with "https://www.google.es"
      And I click on the "favourites_switch" element
      And the "favourites_switch" checkbox is enabled
      And I click on the "0" element in the "products_id_list" list
      And I click on the "next_button" button
     Then the "Card Other" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354320 |
          | o2uk    | QANOV-354321 |
          | o2de    | QANOV-354322 |
          | blaude  | QANOV-354323 |
          | moves   | QANOV-354324 |
          | o2es    | QANOV-354325 |

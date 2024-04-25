# -*- coding: utf-8 -*-
@jira.QANOV-328043 @not_hardening
Feature: Card management - Display cards stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new display cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have display cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards_button" button
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
      And the "card_pretitle_input" inputtext with the "Pre-title (optional)" placeholder is displayed
      And the "card_title_input" inputtext with the "Title" placeholder is displayed
      And the "card_tag_input" inputtext with the "Tag (optional)" placeholder is displayed
      And the "card_description_input" inputtext with the "Description (optional)" placeholder is displayed
      And the text of the element "image_title" is equal to "Select an image"
      And the text of the element "image_desc" is equal to "The image must have a minimum size of X x X px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
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
          | vivobr  | 14.3 | QANOV-376041 |
          | o2uk    | 14.3 | QANOV-376042 |
          | moves   | 14.3 | QANOV-328044 |
          | blaude  | 14.3 | QANOV-376043 |
          | o2de    | 14.3 | QANOV-376044 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376045 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a image slot of image asset circle in the first screen in the stepper flow when creating a new display cards card
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
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
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499827 |
          | o2uk    | 14.3   | QANOV-499828 |
          | moves   | 14.3   | QANOV-499829 |
          | blaude  | 14.3   | QANOV-499830 |
          | o2de    | 14.3   | QANOV-499831 |
          | o2es    | Future | QANOV-499832 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a text slot of image asset circle in the first screen in the stepper flow when creating a new display cards card
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "text_asset_radio_button" button
     Then the "asset_text_input" placeholder with "Asset text" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499833 |
          | o2uk    | 14.3   | QANOV-499834 |
          | moves   | 14.3   | QANOV-499835 |
          | blaude  | 14.3   | QANOV-499836 |
          | o2de    | 14.3   | QANOV-499837 |
          | o2es    | Future | QANOV-499838 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new display cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have display cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
     Then the "Card Actions" page is loaded
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "card_actions_title" is equal to "Actions"
      And the "card_tapeable_checkbox" element is displayed
      And the "tapeable_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "tapeable_checkbox_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
      And the "card_cta_checkbox" element is displayed
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
          | vivobr  | 14.3 | QANOV-376046 |
          | o2uk    | 14.3 | QANOV-376049 |
          | moves   | 14.3 | QANOV-328045 |
          | blaude  | 14.3 | QANOV-376050 |
          | o2de    | 14.3 | QANOV-376052 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376054 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a CTA slot in the second screen in the stepper flow when creating a new display cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have display cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And the "Card Actions" page is loaded
      And I click on the "cta_radio_button" element
     Then the "cta_input" inputtext with the "Text for your CTA" placeholder is displayed
      And the "cta_url_input" inputtext with the "CTA URL" placeholder is displayed
      And the "link_switch" switch is disabled

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-376055 |
          | o2uk    | 14.3   | QANOV-376056 |
          | moves   | 14.3   | QANOV-328046 |
          | blaude  | 14.3   | QANOV-376058 |
          | o2de    | 14.3   | QANOV-376062 |
          | o2es    | Future | QANOV-376063 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can see the fields for CTA slot with link enabled in the second screen in the stepper flow when creating a display cards card
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
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

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-499839 |
          | o2uk    | 14.3 | QANOV-499840 |
          | moves   | 14.3 | QANOV-499841 |
          | blaude  | 14.3 | QANOV-499842 |
          | o2de    | 14.3 | QANOV-499843 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-499844 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new display card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    O2es will have display cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
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
          | vivobr  | 14.3 | QANOV-376064 |
          | o2uk    | 14.3 | QANOV-376065 |
          | moves   | 14.3 | QANOV-328047 |
          | blaude  | 14.3 | QANOV-376066 |
          | o2de    | 14.3 | QANOV-376067 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376068 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @web
  Scenario Outline: A user can create a new display card uploading a new image
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path.
    Mandatory fields: image, title, action_url, categories, tracking tag, tracking name description"
    O2es will have display cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "display cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test DisplayCard"
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
      And the "cards_title_list" elements list contains the text "qa test DisplayCard"º

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-376069 |
          | o2uk    | 14.3 | QANOV-376070 |
          | moves   | 14.3 | QANOV-328048 |
          | blaude  | 14.3 | QANOV-376072 |
          | o2de    | 14.3 | QANOV-376074 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-376076 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user can configure display cards card with a heart icon
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "display cards" module has been created in CMS
      And a "product" has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_display_cards" button
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
          | vivobr  | QANOV-523474 |
          | o2uk    | QANOV-523475 |
          | o2de    | QANOV-523476 |
          | blaude  | QANOV-523477 |
          | moves   | QANOV-523478 |
          | o2es    | QANOV-523479 |

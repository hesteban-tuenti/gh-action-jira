# -*- coding: utf-8 -*-
@jira.QANOV-269755 @not_hardening
Feature: Card management - Featured content stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @sanity @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new featured content card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card_button" button
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
      And the "card_description_input" inputtext with the "Description" placeholder is displayed
      And the text of the element "select_an_asset_title" is equal to "Select an asset"
      And the "image_checkbox" element is displayed
      And the "bumper_checkbox" element is displayed
      And the text of the element "image_desc" is equal to "The image must have a minimum size of X x X px optimized JPG or PNG without transparency. It should be 2.5x or 3x and between 100 and 300 KB size to avoid pixelated images."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" element is displayed
      And the text of the element "circle_asset_title" is equal to "Image asset circle"
      And the "none_radio_button" element is displayed
      And the "image_radio_button" element is displayed
      And the "text_radio_button" element is displayed
      And the "next_button" element is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-269756 |
          | o2uk    | 14.3   | QANOV-269757 |
          | moves   | 14.3   | QANOV-269758 |
          | blaude  | 14.3   | QANOV-285991 |
          | o2de    | 14.3   | QANOV-376721 |
          | o2es    | Future | QANOV-391107 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a bumper asset in the first screen in the stepper flow when creating a new featured content card
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I click on the "bumper_slot_radio_button" button
     Then the "bumper_selector" element is displayed
      And the "add_bumper_button" button with "+ Add bumper" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499658 |
          | o2uk    | 14.3   | QANOV-499659 |
          | moves   | 14.3   | QANOV-499660 |
          | blaude  | 14.3   | QANOV-499661 |
          | o2de    | 14.3   | QANOV-499662 |
          | o2es    | Future | QANOV-499663 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a image slot of image asset circle in the first screen in the stepper flow when creating a new featured content card
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content_cards" button
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
          | vivobr  | 14.3   | QANOV-499664 |
          | o2uk    | 14.3   | QANOV-499665 |
          | moves   | 14.3   | QANOV-499666 |
          | blaude  | 14.3   | QANOV-499667 |
          | o2de    | 14.3   | QANOV-499668 |
          | o2es    | Future | QANOV-499669 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the fields for a text slot of image asset circle in the first screen in the stepper flow when creating a new featured content card
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content_cards" button
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
          | vivobr  | 14.3   | QANOV-499670 |
          | o2uk    | 14.3   | QANOV-499671 |
          | moves   | 14.3   | QANOV-499672 |
          | blaude  | 14.3   | QANOV-499673 |
          | o2de    | 14.3   | QANOV-499674 |
          | o2es    | Future | QANOV-499675 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new featured content card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
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
      And the "card_tapeable_checkbox" element is enabled
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

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-269759 |
          | o2uk    | 14.3   | QANOV-269760 |
          | moves   | 14.3   | QANOV-269761 |
          | blaude  | 14.3   | QANOV-285992 |
          | o2de    | 14.3   | QANOV-376722 |
          | o2es    | Future | QANOV-391108 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can see the fields for CTA slot in the second screen in the stepper flow when creating a featured content card
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
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

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499676 |
          | o2uk    | 14.3   | QANOV-499677 |
          | moves   | 14.3   | QANOV-499678 |
          | blaude  | 14.3   | QANOV-499679 |
          | o2de    | 14.3   | QANOV-499680 |
          | o2es    | Future | QANOV-499681 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can see the fields for CTA slot with link enabled in the second screen in the stepper flow when creating a featured content card
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
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

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499682 |
          | o2uk    | 14.3   | QANOV-499683 |
          | moves   | 14.3   | QANOV-499684 |
          | blaude  | 14.3   | QANOV-499685 |
          | o2de    | 14.3   | QANOV-499686 |
          | o2es    | Future | QANOV-499687 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can see the fields for CTA slot with voucher code enabled in the second screen in the stepper flow when creating a featured content card
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
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
      And the "url_cta_input" inputtext with the "CTA URL" placeholder is displayed
      And I click the "voucher_switch" element
      And the "voucher_input" inputtext with the "Voucher code" placeholder is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499688 |
          | o2uk    | 14.3   | QANOV-499689 |
          | moves   | 14.3   | QANOV-499690 |
          | blaude  | 14.3   | QANOV-499691 |
          | o2de    | 14.3   | QANOV-499692 |
          | o2es    | Future | QANOV-499693 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new featured content card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
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

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-269762 |
          | o2uk    | 14.3   | QANOV-269763 |
          | moves   | 14.3   | QANOV-269764 |
          | blaude  | 14.3   | QANOV-285993 |
          | o2de    | 14.3   | QANOV-376723 |
          | o2es    | Future | QANOV-376724 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can create a new featured content card uploading an image
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
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

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-123774 |
          | o2uk    | 11.14  | QANOV-123775 |
          | moves   | 11.14  | QANOV-123776 |
          | blaude  | 11.14  | QANOV-285994 |
          | o2de    | 14.3   | QANOV-376725 |
          | o2es    | Future | QANOV-376726 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can create a new featured content card selecting an existing bumper
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test card using existing bumper"
      And I fill in the "card_description_input" field with "qa test card using existing bumper"
      And I click on the "bumper_checkbox" button
      And I click on the "search_bumper_by_name_select" element
      And I click on the "first_bumper" button
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
      And the "cards_title_list" elements list contains the text "qa test card using existing bumper"

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-123777 |
          | o2uk    | 11.14  | QANOV-123778 |
          | moves   | 11.14  | QANOV-123779 |
          | blaude  | 11.14  | QANOV-285995 |
          | o2de    | 14.3   | QANOV-376727 |
          | o2es    | Future | QANOV-376728 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can create a new featured content card uploading a new bumper
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test card using existing bumper"
      And I fill in the "card_description_input" field with "qa test card using existing bumper"
      And I click on the "bumper_checkbox" button
      And I click on the "add_bumper_button" element
      And I fill in the "bumper_title" field with "qa_bumper_test"
      And I click on the "select_file" button
      And I select a bumper from the computer files
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
      And the "cards_title_list" elements list contains the text "qa test card using existing a new bumper"

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.14  | QANOV-123780 |
          | o2uk    | 11.14  | QANOV-123781 |
          | moves   | 11.14  | QANOV-123782 |
          | blaude  | 11.14  | QANOV-285996 |
          | o2de    | 14.3   | QANOV-376729 |
          | o2es    | Future | QANOV-376730 |

  @jira.<jira_id> @<product> @ber @jira.cv.Future @jira.link.parent_test_plan.QANOV-343179 @manual @sanity @web
  Scenario Outline: A user can configure featured content card with a heart icon
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "featured content" module has been created in CMS
      And a "product" has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "add_new_card" button
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
      And I click on the "favourites_selector" element
      And I click on the "0" element in the "products_id_list" list
      And I click on the "next_button" button
     Then the "Card Other" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-354314 |
          | o2uk    | QANOV-354315 |
          | o2de    | QANOV-354316 |
          | blaude  | QANOV-354317 |
          | moves   | QANOV-354318 |
          | o2es    | QANOV-354319 |

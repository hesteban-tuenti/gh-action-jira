# -*- coding: utf-8 -*-
@jira.QANOV-269755 @not_hardening
Feature: Card management - Highlighted cards stepper flow


  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a new highlighted cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have highlighted cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards" button
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
      And the "card_description_input" inputtext with the "Description" placeholder is displayed
      And the text of the element "inverse_title" is equal to "Inverse"
      And the text of the element "inverse_optional" is equal to "Optional"
      And the text of the element "inverse_desc" is equal to "If you select this option the background of the card will change from white to brand color."
      And the "inverse_switch" switch is disabled
      And the text of the element "select_an_asset_title" is equal to "Select an asset"
      And the text of the element "image_title" is equal to "Select an asset"
      And the text of the element "image_desc" is equal to "The image size is XxXpx (1x) and it is scaled based on the card height. Formats supported are JPG or PNG without transparency, both web optimized and with a recommended size of 2.5x - 3x to avoid the image could reduce its quality on a Retina display. View the guidelines to learn more about the aspect ratio, crop and safe guides."
      And the "guidelines_link" link with "View guidelines" text is displayed
      And the "add_image_button" button is displayed
      And the "text_radio_button" element is displayed
      And the "next_button" element is displayed

    @sanity
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-269756 |
          | o2uk    | 14.3 | QANOV-269757 |
          | moves   | 14.3 | QANOV-269758 |
          | blaude  | 14.3 | QANOV-287561 |
          | o2de    | 14.3 | QANOV-286000 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-367857 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new highlighted cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have highlighted cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards" button
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
      And the "card_tapeable_radio_button" element is enabled
      And the "card_tapeable_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "card_tapeable_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
      And the "card_link_radio_button" element is displayed
      And the "card_cta_radio_button" element is displayed
      And the text of the element "card_timer_title" is equal to "Card start and end time"
      And the text of the element "card_timer_optional" is equal to "Optional"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the "back_button" element is displayed
      And the "next_button" element is displayed

    @smoke
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-269759 |
          | o2uk    | 14.3 | QANOV-269760 |
          | moves   | 14.3 | QANOV-269761 |
          | blaude  | 14.3 | QANOV-286001 |
          | o2de    | 14.3 | QANOV-286002 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-367858 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can see the fields for link slot in the second screen in the stepper flow when creating a highlighted cards card
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And the "Card Actions" page is displayed
      And I click on the "link_radio_button" button
     Then the "link_input" inputtext with the "Link" placeholder is displayed
      And the "url_input" inputtext with the "Link URL" placeholder is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499640 |
          | o2uk    | 14.3   | QANOV-499641 |
          | moves   | 14.3   | QANOV-499642 |
          | blaude  | 14.3   | QANOV-499643 |
          | o2de    | 14.3   | QANOV-499644 |
          | o2es    | Future | QANOV-499645 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can see the fields for CTA slot in the second screen in the stepper flow when creating a highlighted cards card
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards_advanced" button
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
      And the "voucher_code_switch" switch is disabled

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499646 |
          | o2uk    | 14.3   | QANOV-499647 |
          | moves   | 14.3   | QANOV-499648 |
          | blaude  | 14.3   | QANOV-499649 |
          | o2de    | 14.3   | QANOV-499650 |
          | o2es    | Future | QANOV-499651 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @manual @smoke @web
  Scenario Outline: A user can see the fields for CTA slot with voucher code in the second screen in the stepper flow when creating a highlighted cards card
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards_advanced" button
      And the "Edit Module" page is loaded
      And I click on the "add_card" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And the "Card Actions" page is displayed
      And I click on the "cta_radio_button" button
      And I enable the "voucher_code_switch" switch
     Then the "voucher_input" placeholder with "Voucher code" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-499652 |
          | o2uk    | 14.3   | QANOV-499653 |
          | moves   | 14.3   | QANOV-499654 |
          | blaude  | 14.3   | QANOV-499655 |
          | o2de    | 14.3   | QANOV-499656 |
          | o2es    | Future | QANOV-499657 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @web
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new highlighted cards card
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have highlighted cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards" button
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
          | vivobr  | 14.3 | QANOV-269762 |
          | o2uk    | 14.3 | QANOV-269763 |
          | moves   | 14.3 | QANOV-269764 |
          | blaude  | 14.3 | QANOV-286003 |
          | o2de    | 14.3 | QANOV-286004 |

    @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-367859 |

  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user can create a new highlighted cards card with an image
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have highlighted cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards" button
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
          | vivobr  | 14.3   | QANOV-123774 |
          | o2uk    | 14.3   | QANOV-123775 |
          | moves   | 14.3   | QANOV-123776 |
          | blaude  | 14.3   | QANOV-286005 |
          | o2de    | 14.3   | QANOV-286006 |
          | o2es    | Future | QANOV-367860 |

  @jira.<jira_id> @<product> @TBD @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-285803 @manual @regression @web
  Scenario Outline: A user can create a new highlighted cards card without an image
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have highlighted cards enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "highlighted cards" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_highlighted_cards" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_title_input" field with "qa test card without an image"
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "url_input" field with "https://www.google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I check the box "firt_explore_category_checkbox"
      And I click on the "none_account_category" element
      And I select the "TBD" option from "category_selector" field
      And I select the "TBD" option from "group_category_selector" field
      And I select the "TBD" option from "tracking_tag_selector" field
      And I fill in the "tracking_desc_input" field with "QA test"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test card without uploading a new image"

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.3   | QANOV-367861 |
          | o2uk    | 14.3   | QANOV-367862 |
          | moves   | 14.3   | QANOV-367863 |
          | blaude  | 14.3   | QANOV-367864 |
          | o2de    | 14.3   | QANOV-367865 |
          | o2es    | Future | QANOV-367866 |

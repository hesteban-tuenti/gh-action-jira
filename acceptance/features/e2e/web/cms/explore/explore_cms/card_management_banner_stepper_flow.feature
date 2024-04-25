# -*- coding: utf-8 -*-
@jira.QANOV-548919 @not_hardening
Feature: Card management - Banner stepper flow


  @jira.<jira_id> @<product> @manual @web @sanity
  Scenario Outline: A user can access to the first screen in the stepper flow when creating a banner card
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
     Then the "Card Content" page is loaded
      And the text of the element "header_title" is equal to "Edit card"
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the text of the element "header_subtitle" is equal to "Banner"
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "select_asset_subtitle" is equal to "Select an asset"
      And the "image_radio_button" element is displayed
      And the "bumper_radio_button" element is displayed
      And the text of the element "accessibility_title" is equal to "Image accessibility text"
      And the text of the element "accessibility_optional_text" is equal to "Optional"
      And the text of the element "accessibility_desc" is equal to "This is a descriptive text used for accessibility as an alternative for the image (used by screen readers)."
      And the "accessibility_input" inputtext that contains the "accesibility text (optional)" placeholder is displayed
      And the "next_button" button is displayed

    @jira.cv.24.0
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548920 |
          | o2uk    | QANOV-548921 |
          | moves   | QANOV-548922 |
          | blaude  | QANOV-548923 |
          | o2de    | QANOV-548924 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548925 |

  @jira.<jira_id> @<product> @manual @web @smoke
  Scenario Outline: A user can access to the second screen in the stepper flow when creating a new banner card
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_card" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
     Then the "Card Actions" page is loaded
      And the text of the element "header_title" is equal to "Edit card"
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the text of the element "header_subtitle" is equal to "Banner"
      And the text of the element "actions_title" is equal to "Actions"
      And the "url_inputtext" inputtext with the "URL" placeholder is displayed
      And the text of the element "actions_desc" is equal to "This is the URL that will be accessed upon tapping on the card. It must be a valid URL."
      And the text of the element "timer_subtitle" is equal to "Card start and end time"
      And the text of the element "timer_optional_subtitle" is equal to "Optional"
      And the "card_timer_start_select" element is displayed
      And the "card_timer_end_select" element is displayed
      And the "back_button" button is displayed
      And the "next_button" button is displayed

    @jira.cv.24.0
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548926 |
          | o2uk    | QANOV-548927 |
          | moves   | QANOV-548928 |
          | blaude  | QANOV-548929 |
          | o2de    | QANOV-548930 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548931 |

  @jira.<jira_id> @<product> @manual @web @smoke
  Scenario Outline: A user can access to the third screen in the stepper flow when creating a new banner card
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_card" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Card Content" page is loaded
      And I fill the mandatory fields
      And the "Card Actions" page is loaded
      And I fill the mandatory fields
     Then the "Card Other" page is loaded
      And the text of the element "header_title" is equal to "Edit card"
      And the text of the element "header_subtitle" is equal to "Banner"
      And the "header_cancel_button" element is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Content;Actions;Other" textfields is displayed
      And the text of the element "actions_title" is equal to "Other"
      And the text of the element "layouts_subtitle" is equal to "New Layouts"
      And the text of the element "layouts_desc" is equal to "The module you are editing is currently included in the following new layouts:"
      And the text of the element "conditions_subtitle" is equal to "Add one or more conditions to select your audience"
      And the text of the element "conditions_optional_subtitle" is equal to "Optional"
      And the "add_conditions_button" button with "+ Add condition" text is displayed
      And the text of the element "categories_subtitle" is equal to "Categories"
      And the text of the element "categories_desc" is equal to "You must provide at least one of each of the categories below."
      And the text of the element "explore_categories_subtitle" is equal to "Explore card categories"
      And the "explore_categories_checkbox_list" list is displayed
      And the text of the element "acount_categories_subtitle" is equal to "Account card categories"
      And the "none_radio_button" element is displayed
      And the "account_radio_button" element is displayed
      And the text of the element "star_tab_title" is equal to "Start tab"
      And the text of the element "category_group_subtitle" is equal to "Content category and group"
      And the "content_group_selector" element is displayed
      And the "content_category_selector" element is displayed
      And the text of the element "tracking_tag_subtitle" is equal to "Tracking tag"
      And the text of the element "tracking_tag_desc" is equal to "Tracking tag for internally identifying this specific content. This won’t be visible to users."
      And the "tracking_tag_selector" element is displayed
      And the text of the element "tracking_name_subtitle" is equal to "Tracking name description"
      And the text of the element "tracking_tag_desc" is equal to "Tracking name for internally identifying this specific content. This won’t be visible to users."
      And the "tracking_name_selector" element is displayed
      And the "back_button" button is displayed
      And the "save_button" button is displayed

    @jira.cv.24.0
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548932 |
          | o2uk    | QANOV-548933 |
          | moves   | QANOV-548934 |
          | blaude  | QANOV-548935 |
          | o2de    | QANOV-548936 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548937 |

  @jira.<jira_id> @<product> @manual @smoke @web
  Scenario Outline: A user can create a card with a bumper in a banner module
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_card" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Card Content" page is loaded
      And I check the box "bumper_radio_button"
      And I click on the "add_bumper_button" element
      And I fill in the "bumper_name" field with "bumper banner QA"
      And I click on the "upload_file" button
      And I select a bumper from the computer files
      And I click on the "add_button" button
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I fill the mandatory fields
      And I click on the "header_save_button" button
      And the "Edit Module" page is loaded
      And I click on the "header_save_button" button
     Then the "Modules Repository" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And the "bumper_radio_button" checkbox is enabled

    @jira.cv.24.0
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548938 |
          | o2uk    | QANOV-548939 |
          | moves   | QANOV-548940 |
          | blaude  | QANOV-548941 |
          | o2de    | QANOV-548942 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548943 |

  @jira.<jira_id> @<product> @manual @web @smoke
  Scenario Outline: A user can create a card with an image in a banner module
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_card" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Card Content" page is loaded
      And I check the box "image_radio_button"
      And I click on the "add_image_button" element
      And I fill in the "bumper_name" field with "bumper banner QA"
      And I select an image from the computer files
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill the mandatory fields
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I fill the mandatory fields
      And I click on the "header_save_button" button
      And the "Edit Module" page is loaded
      And I click on the "header_save_button" button
     Then the "Modules Repository" page is loaded
      And I click on the "0" element in the "cards_edit_list" list
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And the "image_radio_button" checkbox is enabled
      And the text of the element "change_image" is equal to "Change image"

    @jira.cv.24.0
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548944 |
          | o2uk    | QANOV-548945 |
          | moves   | QANOV-548946 |
          | blaude  | QANOV-548947 |
          | o2de    | QANOV-548948 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548949 |

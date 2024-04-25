# -*- coding: utf-8 -*-
@jira.QANOV-269812 @not_hardening
Feature: Module management - edition


  @jira.<jira_id> @<product> @manual @sanity @web
  Scenario Outline: A user can edit a <module_type> module and see all options
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "title" is equal to "Module details"
      And the text of the element "internal_name_title" is equal to "Name"
      And the text of the element "internal_name_text" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "layouts_title" is equal to "Layouts"
      And the text of the element "layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "more_info_link" link with "For more information check the guidelines" text is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "section_title_title" is equal to "Section title"
      And the text of the element "section_optional_title" is equal to "Optional"
      And the text of the element "section_title_desc" is equal to "The section title will be shown to the user even it is shown in the top position of module."
      And the "section_title_input" inputtext with the "Section title (optional)" placeholder is displayed
      And the text of the element "section_title_link_title" is equal to "Section title link"
      And the text of the element "section_title_link_optional_title" is equal to "Optional"
      And the text of the element "section_title_link_text" is equal to "This link will be shown next to the module title."
      And the "section_title_link_text_input" inputtext with the "Text for your link (optional)" placeholder is displayed
      And the "section_title_link_url_input" inputtext with the "Link URL (optional)" placeholder is displayed
      And the text of the element "section_desc_title" is equal to "Section description (optional)"
      And the text of the element "section_desc_optional_title" is equal to "Optional"
      And the text of the element "section_desc_text" is equal to "The description of the module will be displayed below the section title."
      And the "section_desc_input" inputtext with the "Section description (optional)" placeholder is displayed
      And the text of the element "section_background_color_title" is equal to "Section background color"
      And the "backgroud_color_selector" element is displayed
      And the text of the element "bottom_link_title" is equal to "Bottom link"
      And the text of the element "bottom_link_optional_title" is equal to "Optional"
      And the "bottom_link_text_input" inputtext with the "Text for your link (optional)" placeholder is displayed
      And the "bottom_link_url_input" inputtext with the "Link URL (optional)" placeholder is displayed
      And the text of the element "filters_title" is equal to "Filters"
      And the text of the element "filters_optional_title" is equal to "Optional"
      And the text of the element "filters_text" is equal to "Only applicable if the cards contain tags. A filter will be created in the module based on tags that will appear above the cards."
      And the "filters_switch" switch is displayed
      And the text of the element "cards_title" is equal to "Cards"
      And the text of the element "cards_text" is equal to "The composition must have a minimum of 1 to be visible."
      And the "cards_list" list is displayed
      And the "add_new_card_button" button with "+ Add new card" text is displayed
      And the text of the element "autoplay_title" is equal to "Autoplay configuration"
      And the text of the element "autoplay_optional_title" is equal to "Optional"
      And the text of the element "autoplay_text" is equal to "Selecting if the module has autoplay."
      And the "autoplay_switch" switch is displayed
      And the text of the element "social_proof_title" is equal to "Social proof (optional)"
      And the text of the element "social_proof_optional_title" is equal to "Optional"
      And the text of the element "social_proof_text" is equal to "Selecting a social proof message."
      And the "select_your_message_selector" element is displayed
      And the "save_button" button is displayed

    @jira.cv.14.3
    Examples:
          | product | module_type      | jira_id      |
          | vivobr  | featured_content | QANOV-269813 |
          | vivobr  | vertical_cards   | QANOV-269816 |
          | o2uk    | featured_content | QANOV-269814 |
          | o2uk    | vertical_cards   | QANOV-269817 |
          | moves   | featured_content | QANOV-269815 |
          | moves   | vertical_cards   | QANOV-269818 |
          | blaude  | featured_content | QANOV-286058 |
          | blaude  | vertical_cards   | QANOV-286060 |
          | o2de    | featured_content | QANOV-384738 |
          | o2de    | vertical_cards   | QANOV-384740 |

    @jira.cv.Future
    Examples:
          | product | module_type      | jira_id      |
          | o2es    | featured_content | QANOV-384739 |
          | o2es    | vertical_cards   | QANOV-384741 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a rows module and see all options
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "rows" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_rows" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "title" is equal to "Module details"
      And the text of the element "internal_name_title" is equal to "Name"
      And the text of the element "internal_name_text" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "layouts_title" is equal to "Layouts"
      And the text of the element "layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "more_info_link" link with "For more information check the guidelines" text is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "section_title_title" is equal to "Section title"
      And the text of the element "section_optional_title" is equal to "Optional"
      And the text of the element "section_title_desc" is equal to "The section title will be shown to the user even it is shown in the top position of module."
      And the "section_title_input" inputtext with the "Section title (optional)" placeholder is displayed
      And the text of the element "section_title_link_title" is equal to "Section title link"
      And the text of the element "section_title_link_optional_title" is equal to "Optional"
      And the text of the element "section_title_link_text" is equal to "This link will be shown next to the module title."
      And the "section_title_link_text_input" inputtext with the "Text for your link (optional)" placeholder is displayed
      And the "section_title_link_url_input" inputtext with the "Link URL (optional)" placeholder is displayed
      And the text of the element "section_desc_title" is equal to "Section description (optional)"
      And the text of the element "section_desc_optional_title" is equal to "Optional"
      And the text of the element "section_desc_text" is equal to "The description of the module will be displayed below the section title."
      And the "section_desc_input" inputtext with the "Section description (optional)" placeholder is displayed
      And the text of the element "section_background_color_title" is equal to "Section background color"
      And the "backgroud_color_selector" element is displayed
      And the text of the element "bottom_link_title" is equal to "Bottom link"
      And the text of the element "bottom_link_optional_title" is equal to "Optional"
      And the "bottom_link_text_input" inputtext with the "Text for your link (optional)" placeholder is displayed
      And the "bottom_link_url_input" inputtext with the "Link URL (optional)" placeholder is displayed
      And the text of the element "cards_title" is equal to "Cards"
      And the text of the element "cards_text" is equal to "The composition must have a minimum of 1 to be visible."
      And the "cards_list" list is displayed
      And the "add_new_card_button" button with "+ Add new card" text is displayed
      And the text of the element "social_proof_title" is equal to "Social proof (optional)"
      And the text of the element "social_proof_optional_title" is equal to "Optional"
      And the text of the element "social_proof_text" is equal to "Selecting a social proof message."
      And the "select_your_message_selector" element is displayed
      And the "save_button" button is displayed

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-269819 |
          | o2uk    | QANOV-269820 |
          | moves   | QANOV-269821 |
          | blaude  | QANOV-286062 |
          | o2de    | QANOV-384742 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384743 |

  @jira.<jira_id> @<product> @manual @web
  Scenario Outline: A user can edit a banner module without content and see all options
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_card" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "section_title" is equal to "Module details"
      And the text of the element "internal_name_title" is equal to "Name"
      And the text of the element "internal_name_desc" is equal to "This text won’t be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "old_layouts_title" is equal to "Old layouts"
      And the text of the element "old_layouts_text" is equal to "The module you are editing is currently included in the following old layouts:"
      And the text of the element "new_layouts_title" is equal to "New layouts"
      And the text of the element "new_layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "info_link" link with "For more information check the guidelines" text is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "banner_content_title" is equal to "Banner content"
      And the text of the element "bottom_link_title" is equal to "Section background color"
      And the "background_color_box" element is displayed
      And the "default_color" checkbox with "Default" text is displayed
      And the text of the element "cards_title" is equal to "Cards"
      And the text of the element "cards_subtitle" is equal to "The composition must have a single card."
      And the text of the element "add_card_button" is equal to "Add card"
      And the text of the element "cards_counter" is equal to "0/1"
      And the text of the element "bottom_link_title" is equal to "Bottom link 1 (optional)"
      And the text of the element "add_bottom_link_button" is equal to "Add bottom link"
      And the text of the element "add_bottom_link_button" is equal to "Add bottom link"

    @jira.cv.24.0 @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-9565   |
          | o2uk    | QANOV-9566   |
          | moves   | QANOV-9567   |
          | blaude  | QANOV-286051 |
          | o2de    | QANOV-384567 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384568 |

  @jira.<jira_id> @<product> @manual @web
  Scenario Outline: A user can edit a banner module with content and see all options
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "banner" module has been created in CMS
      And the module has "0" cards
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_card" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "section_title" is equal to "Module details"
      And the text of the element "internal_name_title" is equal to "Name"
      And the text of the element "internal_name_desc" is equal to "This text won’t be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "old_layouts_title" is equal to "Old layouts"
      And the text of the element "old_layouts_text" is equal to "The module you are editing is currently included in the following old layouts:"
      And the text of the element "new_layouts_title" is equal to "New layouts"
      And the text of the element "new_layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "info_link" link with "For more information check the guidelines" text is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "banner_content_title" is equal to "Banner content"
      And the text of the element "bottom_link_title" is equal to "Section background color"
      And the "background_color_box" element is displayed
      And the "default_color" checkbox with "Default" text is displayed
      And the text of the element "cards_title" is equal to "Cards"
      And the text of the element "cards_text" is equal to "The composition must have a single card."
      And the "cards_list" list is displayed
      And the "add_card_button" button is not displayed
      And the text of the element "bottom_link_title" is equal to "Bottom link 1 (optional)"
      And the text of the element "add_bottom_link_button" is equal to "Add bottom link"
      And the text of the element "add_bottom_link_button" is equal to "Add bottom link"

    @jira.cv.24.0 @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-548966 |
          | o2uk    | QANOV-548967 |
          | moves   | QANOV-548968 |
          | blaude  | QANOV-548969 |
          | o2de    | QANOV-548970 |

    @jira.cv.Future @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-548971 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a <module_type> module and see all options
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "title" is equal to "Module details"
      And the text of the element "internal_name_title" is equal to "Name"
      And the text of the element "internal_name_text" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "layouts_title" is equal to "Layouts"
      And the text of the element "layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "more_info_link" link with "For more information check the guidelines" text is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "section_title_title" is equal to "Section title"
      And the text of the element "section_optional_title" is equal to "Optional"
      And the text of the element "section_title_desc" is equal to "The section title will be shown to the user even it is shown in the top position of module."
      And the "section_title_input" inputtext with the "Section title (optional)" placeholder is displayed
      And the text of the element "section_title_link_title" is equal to "Section title link"
      And the text of the element "section_title_link_optional_title" is equal to "Optional"
      And the text of the element "section_title_link_text" is equal to "This link will be shown next to the module title."
      And the "section_title_link_text_input" inputtext with the "Text for your link (optional)" placeholder is displayed
      And the "section_title_link_url_input" inputtext with the "Link URL (optional)" placeholder is displayed
      And the text of the element "section_desc_title" is equal to "Section description (optional)"
      And the text of the element "section_desc_optional_title" is equal to "Optional"
      And the text of the element "section_desc_text" is equal to "The description of the module will be displayed below the section title."
      And the "section_desc_input" inputtext with the "Section description (optional)" placeholder is displayed
      And the text of the element "section_background_color_title" is equal to "Section background color"
      And the "backgroud_color_selector" element is displayed
      And the text of the element "bottom_link_title" is equal to "Bottom link"
      And the text of the element "bottom_link_optional_title" is equal to "Optional"
      And the "bottom_link_text_input" inputtext with the "Text for your link (optional)" placeholder is displayed
      And the "bottom_link_url_input" inputtext with the "Link URL (optional)" placeholder is displayed
      And the text of the element "cards_title" is equal to "Cards"
      And the text of the element "cards_text" is equal to "The composition must have a minimum of 1 to be visible."
      And the "cards_list" list is displayed
      And the "add_new_card_button" button with "+ Add new card" text is displayed
      And the text of the element "autoplay_title" is equal to "Autoplay configuration"
      And the text of the element "autoplay_optional_title" is equal to "Optional"
      And the text of the element "autoplay_text" is equal to "Selecting if the module has autoplay."
      And the "autoplay_switch" switch is displayed
      And the "save_button" button is displayed

    @jira.cv.14.3
    Examples:
          | product | modules_type        | jira_id      |
          | vivobr  | highlighted_cards   | QANOV-286083 |
          | vivobr  | display_cards       | QANOV-384750 |
          | vivobr  | data_cards          | QANOV-384755 |
          | vivobr  | data_cards_advanced | QANOV-492399 |
          | vivobr  | poster_cards        | QANOV-492400 |
          | vivobr  | naked_cards         | QANOV-492401 |
          | vivobr  | naked_small_cards   | QANOV-492402 |
          | o2uk    | highlighted_cards   | QANOV-286084 |
          | o2uk    | display_cards       | QANOV-384751 |
          | o2uk    | data_cards          | QANOV-384756 |
          | o2uk    | poster_cards        | QANOV-492403 |
          | o2uk    | naked_cards         | QANOV-492404 |
          | o2uk    | naked_small_cards   | QANOV-492405 |
          | moves   | highlighted_cards   | QANOV-286085 |
          | moves   | display_cards       | QANOV-328271 |
          | moves   | data_cards          | QANOV-328273 |
          | moves   | poster_cards        | QANOV-492406 |
          | moves   | naked_cards         | QANOV-492407 |
          | moves   | naked_small_cards   | QANOV-492408 |
          | blaude  | highlighted_cards   | QANOV-286086 |
          | blaude  | display_cards       | QANOV-384752 |
          | blaude  | data_cards          | QANOV-384757 |
          | blaude  | poster_cards        | QANOV-492409 |
          | blaude  | naked_cards         | QANOV-492410 |
          | blaude  | naked_small_cards   | QANOV-492411 |
          | o2de    | highlighted_cards   | QANOV-384748 |
          | o2de    | display_cards       | QANOV-384753 |
          | o2de    | data_cards          | QANOV-384758 |
          | o2de    | poster_cards        | QANOV-492412 |
          | o2de    | naked_cards         | QANOV-492413 |
          | o2de    | naked_small_cards   | QANOV-492414 |

    @jira.cv.Future
    Examples:
          | product | modules_type      | jira_id      |
          | o2es    | highlighted_cards | QANOV-384749 |
          | o2es    | display_cards     | QANOV-384754 |
          | o2es    | data_cards        | QANOV-384759 |
          | o2es    | poster_cards      | QANOV-492415 |
          | o2es    | naked_cards       | QANOV-492416 |
          | o2es    | naked_small_cards | QANOV-492417 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a banner hero module and see all options
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path"
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "title" is equal to "Module details"
      And the text of the element "internal_name_title" is equal to "Name"
      And the text of the element "internal_name_text" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "layouts_title" is equal to "Layouts"
      And the text of the element "layouts_text" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "more_info_link" link with "For more information check the guidelines" text is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "cards_title" is equal to "Cards"
      And the text of the element "cards_text" is equal to "The composition must have a minimum of 1 to be visible."
      And the "cards_list" list is displayed
      And the "add_new_card_button" button with "+ Add new card" text is displayed
      And the text of the element "autoplay_title" is equal to "Autoplay configuration"
      And the text of the element "autoplay_optional_title" is equal to "Optional"
      And the text of the element "autoplay_text" is equal to "Selecting if the module has autoplay."
      And the "autoplay_switch" switch is displayed
      And the "save_button" button is displayed

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-384760 |
          | o2uk    | QANOV-384761 |
          | moves   | QANOV-328275 |
          | blaude  | QANOV-384762 |
          | o2de    | QANOV-384763 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384764 |

  @jira.<jira_id> @<product> @jira.cv.Future @jira.link.parent_test_plan.QANOV-386148 @manual @web
  Scenario Outline: A user can edit a virtual module and see all options
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    O2es will have virtual module enabled but will only make use of featured content, that's why the outline is regressed unlike the others.
    Given a "virtual module" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_virtual_module" button
     Then the "Edit Module" page is loaded
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "details_title" is equal to "Module details"
      And the text of the element "name_subtitle" is equal to "Name"
      And the text of the element "name_desc" is equal to "This text won’t be visible for users. It will be used to identify the module internally in the CMS."
      And the "name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "layouts_subtitle" is equal to "Layouts"
      And the text of the element "layouts_subtitle" is equal to "The module you are editing is currently included in the following new layouts:"
      And the "layouts_list" list is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "container_subtitle" is equal to "Container ID"
      And the text of the element "container_desc" is equal to "This field represents the container_id field that would be used when calling the Explore Content v4 Kernel API"
      And the "container_id_input" inputtext with the "Module ID" placeholder is displayed
      And the text of the element "categories_title" is equal to "Categories"
      And the text of the element "categories_desc" is equal to "You must provide at least one of each of the categories below."
      And the text of the element "categories_subtitle" is equal to "Explore cards categories"
      And the "categories_checkbox_list" list is displayed
      And the text of the element "account_categories_subtitle" is equal to "Account cards categories"
      And the "account_switch_list" list is displayed
      And the text of the element "start_tab_subtitle" is equal to "Start tab"

    @sanity
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-390039 |
          | o2uk    | QANOV-390040 |
          | moves   | QANOV-390041 |
          | blaude  | QANOV-390042 |
          | o2de    | QANOV-390043 |

    @regression
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-390044 |

  @jira.<jira_id> @<product> @jira.link.depends_on.<depends_on> @manual @web
  Scenario Outline: A user can edit a banner module with content and change an image
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "banner" module with content has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner" button
      And the "Edit Module" page is loaded
      And I click on the "edit_banner_content_button" button
      And the "Card Content" page is loaded
      And I check the box "image_checkbox"
      And I click on the "change_image_button" element
      And I select an image from the computer files
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "header_save_button" button
      And the "Edit Module" page is loaded
      And I click on the "header_save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.11.14 @smoke
    Examples:
          | product | depends_on | jira_id      |
          | vivobr  | QANOV-9538 | QANOV-9565   |
          | o2uk    | QANOV-9539 | QANOV-9566   |
          | moves   | QANOV-9540 | QANOV-9567   |
          | blaude  |            | QANOV-286068 |
          | o2de    |            | QANOV-384771 |

    @jira.cv.Future @regression
    Examples:
          | product | depends_on | jira_id      |
          | o2es    |            | QANOV-384772 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a banner module and see all the bottom link options
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "banner" module without links has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner" button
      And the "Edit Module" page is loaded
      And I click on the "add_bottom_link_button" button
     Then the text of the element "module_link_title" is equal to "Bottom link 1 (optional)"
      And the "module_link_input" inputtext with the "Text 1 (optional)" placeholder is displayed
      And the text of the element "action_url_title" is equal to "Action URL (optional)"
      And the "action_url_input" inputtext with the "Link URL 1 (optional)" placeholder is displayed
      And the text of the element "action_url_title" is equal to "Segmentation (optional)"
      And the "action_url_input" inputtext with the "Segmentation (optional)" placeholder is displayed

    @jira.cv.10.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-22148  |
          | o2uk    | QANOV-22149  |
          | moves   | QANOV-22150  |
          | blaude  | QANOV-286070 |
          | o2de    | QANOV-384775 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384776 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a banner module without links and add a bottom link
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "banner" module without links has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner" button
      And the "Edit Module" page is loaded
      And I click on the "add_bottom_link_button" button
      And I fill in the "module_link_input" field with "Bottom Link 1"
      And I fill in the "action_url_input" field with "https://www.google.com"
      And I click on the "header_save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.10.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-307687 |
          | o2uk    | QANOV-307688 |
          | moves   | QANOV-307689 |
          | blaude  | QANOV-307690 |
          | o2de    | QANOV-384777 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384778 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a banner module with links and add a bottom link
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "banner" module with links has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner" button
      And the "Edit Module" page is loaded
      And I store the length of the items in "bottom_links_list" list in the context storage with key "bottom_links_items"
      And I click on the "add_bottom_link_button" button
      And the length of the "bottom_links_list" list is "[CONTEXT:bottom_links_items] +1"
      And I fill in the "last_module_link_input" field with "Added Bottom Link"
      And I fill in the "last_action_url_input" field with "https://www.google.com"
      And I click on the "header_save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.10.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-307691 |
          | o2uk    | QANOV-307692 |
          | moves   | QANOV-307693 |
          | blaude  | QANOV-307694 |
          | o2de    | QANOV-384779 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384780 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can activate the social proof messages in a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "<button>" button
      And the "Edit Module" page is loaded
      And I select an item in the "select_social_proof_message" dropdown
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And the selected option of the element "select_social_proof_message" is equal to "[CONTEXT:selected_social_proof_message]"

    @jira.cv.13.10
    Examples:
          | product | module_type         | button                   | jira_id      |
          | vivobr  | featured content    | edit_featured_content    | QANOV-241986 |
          | vivobr  | vertical cards      | edit_vertical_card       | QANOV-241987 |
          | vivobr  | rows                | edit_rows                | QANOV-241985 |
          | vivobr  | data cards advanced | edit_data_cards_advanced | QANOV-492418 |
          | vivobr  | naked card          | edit_naked_card          | QANOV-492419 |
          | moves   | featured content    | edit_featured_content    | QANOV-241989 |
          | moves   | vertical cards      | edit_vertical_card       | QANOV-241990 |
          | moves   | rows                | edit_rows                | QANOV-241988 |
          | moves   | naked card          | edit_naked_card          | QANOV-492420 |
          | o2uk    | featured content    | edit_featured_content    | QANOV-241992 |
          | o2uk    | vertical cards      | edit_vertical_card       | QANOV-241993 |
          | o2uk    | rows                | edit_rows                | QANOV-241991 |
          | o2uk    | naked card          | edit_naked_card          | QANOV-492421 |
          | blaude  | featured content    | edit_featured_content    | QANOV-286075 |
          | blaude  | vertical cards      | edit_vertical_card       | QANOV-286076 |
          | blaude  | rows                | edit_rows                | QANOV-286074 |
          | blaude  | naked card          | edit_naked_card          | QANOV-492422 |

    @jira.cv.14.3
    Examples:
          | product | module_type      | button                | jira_id      |
          | vivobr  | data cards       | edit_data_cards       | QANOV-384787 |
          | moves   | data cards       | edit_data_cards       | QANOV-328261 |
          | o2uk    | data cards       | edit_data_cards       | QANOV-384788 |
          | blaude  | data cards       | edit_data_cards       | QANOV-384789 |
          | o2de    | featured content | edit_featured_content | QANOV-492423 |
          | o2de    | vertical cards   | edit_vertical_card    | QANOV-492424 |
          | o2de    | rows             | edit_rows             | QANOV-492425 |
          | o2de    | naked card       | edit_naked_card       | QANOV-492426 |
          | o2de    | data cards       | edit_data_cards       | QANOV-384790 |

    @jira.cv.Future
    Examples:
          | product | module_type      | button                | jira_id      |
          | o2es    | featured content | edit_featured_content | QANOV-492427 |
          | o2es    | vertical cards   | edit_vertical_card    | QANOV-492428 |
          | o2es    | rows             | edit_rows             | QANOV-492429 |
          | o2es    | naked card       | edit_naked_card       | QANOV-492430 |
          | o2es    | data cards       | edit_data_cards       | QANOV-384791 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can activate the carousel autoplay in a <module_type> module
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "<button>" button
      And the "Edit Module" page is loaded
      And I check the box "autoplay_checkbox"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And the "autoplay_checkbox" checkbox is enabled

    @jira.cv.13.10
    Examples:
          | product | module_type      | button                | jira_id      |
          | vivobr  | featured content | edit_featured_content | QANOV-269836 |
          | vivobr  | vertical cards   | edit_vertical_cards   | QANOV-269839 |
          | o2uk    | featured content | edit_featured_content | QANOV-269837 |
          | o2uk    | vertical cards   | edit_vertical_cards   | QANOV-269840 |
          | moves   | featured content | edit_featured_content | QANOV-269838 |
          | moves   | vertical cards   | edit_vertical_cards   | QANOV-269841 |
          | blaude  | featured content | edit_featured_content | QANOV-286077 |
          | blaude  | vertical cards   | edit_vertical_cards   | QANOV-286078 |

    @jira.cv.14.3
    Examples:
          | product | module_type       | button                 | jira_id      |
          | vivobr  | display cards     | edit_display_cards     | QANOV-384794 |
          | vivobr  | data cards        | edit_data_cards        | QANOV-384798 |
          | vivobr  | banner hero       | edit_banner_hero_cards | QANOV-384802 |
          | vivobr  | highlighted cards | edit_highlighted_cards | QANOV-492431 |
          | o2uk    | display cards     | edit_display_cards     | QANOV-384795 |
          | o2uk    | data cards        | edit_data_cards        | QANOV-384799 |
          | o2uk    | banner hero       | edit_banner_hero_cards | QANOV-384803 |
          | o2uk    | highlighted cards | edit_highlighted_cards | QANOV-492432 |
          | moves   | display cards     | edit_display_cards     | QANOV-328262 |
          | moves   | data cards        | edit_data_cards        | QANOV-328263 |
          | moves   | banner hero       | edit_banner_hero_cards | QANOV-328264 |
          | moves   | highlighted cards | edit_highlighted_cards | QANOV-492433 |
          | blaude  | display cards     | edit_display_cards     | QANOV-384796 |
          | blaude  | data cards        | edit_data_cards        | QANOV-384800 |
          | blaude  | banner hero       | edit_banner_hero_cards | QANOV-384804 |
          | blaude  | highlighted cards | edit_highlighted_cards | QANOV-492434 |
          | o2de    | featured content  | edit_featured_content  | QANOV-384792 |
          | o2de    | vertical cards    | edit_vertical_cards    | QANOV-384793 |
          | o2de    | display cards     | edit_display_cards     | QANOV-384797 |
          | o2de    | data cards        | edit_data_cards        | QANOV-384801 |
          | o2de    | banner hero       | edit_banner_hero_cards | QANOV-384805 |
          | o2de    | highlighted cards | edit_highlighted_cards | QANOV-492435 |

    @jira.cv.Future
    Examples:
          | product | module_type         | button                   | jira_id      |
          | vivobr  | poster cards        | edit_poster_cards        | QANOV-492436 |
          | vivobr  | data cards advanced | edit_data_cards_advanced | QANOV-492437 |
          | vivobr  | naked small cards   | edit_naked_small_cards   | QANOV-492438 |
          | vivobr  | poster cards        | edit_poster_cards        | QANOV-492439 |
          | vivobr  | naked cards         | edit_naked_cards         | QANOV-492440 |
          | o2uk    | poster cards        | edit_poster_cards        | QANOV-492441 |
          | o2uk    | naked cards         | edit_naked_cards         | QANOV-492442 |
          | moves   | poster cards        | edit_poster_cards        | QANOV-492443 |
          | moves   | naked cards         | edit_naked_cards         | QANOV-492444 |
          | blaude  | poster cards        | edit_poster_cards        | QANOV-492445 |
          | blaude  | naked cards         | edit_naked_cards         | QANOV-492446 |
          | o2de    | poster cards        | edit_poster_cards        | QANOV-492447 |
          | o2de    | naked cards         | edit_naked_cards         | QANOV-492448 |
          | o2es    | featured content    | edit_featured_content    | QANOV-384806 |
          | o2es    | vertical cards      | edit_vertical_cards      | QANOV-384807 |
          | o2es    | display cards       | edit_display_cards       | QANOV-384808 |
          | o2es    | data cards          | edit_data_cards          | QANOV-384809 |
          | o2es    | banner hero         | edit_banner_hero_cards   | QANOV-384810 |
          | o2es    | poster cards        | edit_poster_cards        | QANOV-492449 |
          | o2es    | highlighted cards   | edit_highlighted_cards   | QANOV-492450 |
          | o2es    | naked cards         | edit_naked_cards         | QANOV-492451 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can see the play in loop option after activating the autoplay in a <module_type> module
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "<button>" button
      And the "Edit Module" page is loaded
      And I check the box "autoplay_checkbox"
     Then the "play_in_loop_checkbox" element is displayed
      And the text of the element "play_in_loop_text" is equal to "Do you want to play it in loop?"

    @jira.cv.13.10
    Examples:
          | product | module_type      | button                | jira_id      |
          | vivobr  | featured content | edit_featured_content | QANOV-269842 |
          | vivobr  | vertical cards   | edit_vertical_cards   | QANOV-269845 |
          | o2uk    | featured content | edit_featured_content | QANOV-269843 |
          | o2uk    | vertical cards   | edit_vertical_cards   | QANOV-269846 |
          | moves   | featured content | edit_featured_content | QANOV-269844 |
          | moves   | vertical cards   | edit_vertical_cards   | QANOV-269847 |
          | blaude  | featured content | edit_featured_content | QANOV-286079 |
          | blaude  | vertical cards   | edit_vertical_cards   | QANOV-286080 |

    @jira.cv.14.3
    Examples:
          | product | module_type       | button                 | jira_id      |
          | vivobr  | display cards     | edit_display_cards     | QANOV-384813 |
          | vivobr  | data cards        | edit_data_cards        | QANOV-384817 |
          | vivobr  | banner hero       | edit_banner_hero_cards | QANOV-384821 |
          | vivobr  | highlighted cards | edit_highlighted_cards | QANOV-492452 |
          | o2uk    | display cards     | edit_display_cards     | QANOV-384814 |
          | o2uk    | data cards        | edit_data_cards        | QANOV-384818 |
          | o2uk    | banner hero       | edit_banner_hero_cards | QANOV-384822 |
          | o2uk    | highlighted cards | edit_highlighted_cards | QANOV-492453 |
          | moves   | display cards     | edit_display_cards     | QANOV-328265 |
          | moves   | data cards        | edit_data_cards        | QANOV-328266 |
          | moves   | banner hero       | edit_banner_hero_cards | QANOV-328267 |
          | moves   | highlighted cards | edit_highlighted_cards | QANOV-492454 |
          | blaude  | display cards     | edit_display_cards     | QANOV-384815 |
          | blaude  | data cards        | edit_data_cards        | QANOV-384819 |
          | blaude  | banner hero       | edit_banner_hero_cards | QANOV-384823 |
          | blaude  | highlighted cards | edit_highlighted_cards | QANOV-492455 |
          | o2de    | featured content  | edit_featured_content  | QANOV-384811 |
          | o2de    | vertical cards    | edit_vertical_cards    | QANOV-384812 |
          | o2de    | display cards     | edit_display_cards     | QANOV-384816 |
          | o2de    | data cards        | edit_data_cards        | QANOV-384820 |
          | o2de    | banner hero       | edit_banner_hero_cards | QANOV-384824 |
          | o2de    | highlighted cards | edit_highlighted_cards | QANOV-492456 |

    @jira.cv.Future
    Examples:
          | product | module_type         | button                   | jira_id      |
          | vivobr  | poster cards        | edit_poster_cards        | QANOV-492457 |
          | vivobr  | data cards advanced | edit_data_cards_advanced | QANOV-492458 |
          | vivobr  | naked small cards   | edit_naked_small_cards   | QANOV-492459 |
          | vivobr  | poster cards        | edit_poster_cards        | QANOV-492460 |
          | vivobr  | naked cards         | edit_naked_cards         | QANOV-492461 |
          | o2uk    | poster cards        | edit_poster_cards        | QANOV-492462 |
          | o2uk    | naked cards         | edit_naked_cards         | QANOV-492463 |
          | moves   | poster cards        | edit_poster_cards        | QANOV-492464 |
          | moves   | naked cards         | edit_naked_cards         | QANOV-492465 |
          | blaude  | poster cards        | edit_poster_cards        | QANOV-492466 |
          | blaude  | naked cards         | edit_naked_cards         | QANOV-492467 |
          | o2de    | poster cards        | edit_poster_cards        | QANOV-492468 |
          | o2de    | naked cards         | edit_naked_cards         | QANOV-492469 |
          | o2es    | featured content    | edit_featured_content    | QANOV-384825 |
          | o2es    | vertical cards      | edit_vertical_cards      | QANOV-384826 |
          | o2es    | display cards       | edit_display_cards       | QANOV-384827 |
          | o2es    | data cards          | edit_data_cards          | QANOV-384828 |
          | o2es    | banner hero         | edit_banner_hero_cards   | QANOV-384829 |
          | o2es    | poster cards        | edit_poster_cards        | QANOV-492470 |
          | o2es    | highlighted cards   | edit_highlighted_cards   | QANOV-492471 |
          | o2es    | naked cards         | edit_naked_cards         | QANOV-492472 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can activate the play in loop option after activating the autoplay in a <module_type> module
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "<button>" button
      And the "Edit Module" page is loaded
      And I check the box "autoplay_checkbox"
      And I check the "play_in_loop_checkbox"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And the "autoplay_checkbox" checkbox is enabled
      And the "play_in_loop_checkbox" checkbox is enabled

    @jira.cv.13.10
    Examples:
          | product | module_type      | button                | jira_id      |
          | vivobr  | featured content | edit_featured_content | QANOV-269848 |
          | vivobr  | vertical cards   | edit_vertical_cards   | QANOV-269851 |
          | o2uk    | featured content | edit_featured_content | QANOV-269849 |
          | o2uk    | vertical cards   | edit_vertical_cards   | QANOV-269852 |
          | moves   | featured content | edit_featured_content | QANOV-269850 |
          | moves   | vertical cards   | edit_vertical_cards   | QANOV-269853 |
          | blaude  | featured content | edit_featured_content | QANOV-286081 |
          | blaude  | vertical cards   | edit_vertical_cards   | QANOV-286082 |

    @jira.cv.14.3
    Examples:
          | product | module_type       | button                 | jira_id      |
          | vivobr  | display cards     | edit_display_cards     | QANOV-384832 |
          | vivobr  | data cards        | edit_data_cards        | QANOV-384836 |
          | vivobr  | banner hero       | edit_banner_hero_cards | QANOV-384840 |
          | vivobr  | highlighted cards | edit_highlighted_cards | QANOV-492473 |
          | o2uk    | display cards     | edit_display_cards     | QANOV-384833 |
          | o2uk    | data cards        | edit_data_cards        | QANOV-384837 |
          | o2uk    | banner hero       | edit_banner_hero_cards | QANOV-384841 |
          | o2uk    | highlighted cards | edit_highlighted_cards | QANOV-492474 |
          | moves   | display cards     | edit_display_cards     | QANOV-328268 |
          | moves   | data cards        | edit_data_cards        | QANOV-328269 |
          | moves   | banner hero       | edit_banner_hero_cards | QANOV-328270 |
          | moves   | highlighted cards | edit_highlighted_cards | QANOV-492475 |
          | blaude  | display cards     | edit_display_cards     | QANOV-384834 |
          | blaude  | data cards        | edit_data_cards        | QANOV-384838 |
          | blaude  | banner hero       | edit_banner_hero_cards | QANOV-384842 |
          | blaude  | highlighted cards | edit_highlighted_cards | QANOV-492476 |
          | o2de    | featured content  | edit_featured_content  | QANOV-384830 |
          | o2de    | vertical cards    | edit_vertical_cards    | QANOV-384831 |
          | o2de    | display cards     | edit_display_cards     | QANOV-384835 |
          | o2de    | data cards        | edit_data_cards        | QANOV-384839 |
          | o2de    | banner hero       | edit_banner_hero_cards | QANOV-384843 |
          | o2de    | highlighted cards | edit_highlighted_cards | QANOV-492477 |

    @jira.cv.Future
    Examples:
          | product | module_type         | button                   | jira_id      |
          | vivobr  | poster cards        | edit_poster_cards        | QANOV-492478 |
          | vivobr  | data cards advanced | edit_data_cards_advanced | QANOV-492479 |
          | vivobr  | naked small cards   | edit_naked_small_cards   | QANOV-492480 |
          | vivobr  | poster cards        | edit_poster_cards        | QANOV-492481 |
          | vivobr  | naked cards         | edit_naked_cards         | QANOV-492482 |
          | o2uk    | poster cards        | edit_poster_cards        | QANOV-492483 |
          | o2uk    | naked cards         | edit_naked_cards         | QANOV-492484 |
          | moves   | poster cards        | edit_poster_cards        | QANOV-492485 |
          | moves   | naked cards         | edit_naked_cards         | QANOV-492486 |
          | blaude  | poster cards        | edit_poster_cards        | QANOV-492487 |
          | blaude  | naked cards         | edit_naked_cards         | QANOV-492488 |
          | o2de    | poster cards        | edit_poster_cards        | QANOV-492489 |
          | o2de    | naked cards         | edit_naked_cards         | QANOV-492490 |
          | o2es    | featured content    | edit_featured_content    | QANOV-384844 |
          | o2es    | vertical cards      | edit_vertical_cards      | QANOV-384845 |
          | o2es    | display cards       | edit_display_cards       | QANOV-384846 |
          | o2es    | data cards          | edit_data_cards          | QANOV-384847 |
          | o2es    | banner hero         | edit_banner_hero_cards   | QANOV-384848 |
          | o2es    | poster cards        | edit_poster_cards        | QANOV-492491 |
          | o2es    | highlighted cards   | edit_highlighted_cards   | QANOV-492492 |
          | o2es    | naked cards         | edit_naked_cards         | QANOV-492493 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a banner hero module and add a bottom link
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_banner_hero_button" button
      And the "Edit Module" page is loaded
      And I click on the "add_bottom_link_button" button
      And I fill in the "bottom_text1_text_input" field with "Title Bottom Link"
      And I fill in the "bottom_text1_link_input" field with "https://www.google.es"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-384859 |
          | o2uk    | QANOV-384860 |
          | moves   | QANOV-328279 |
          | blaude  | QANOV-384861 |
          | o2de    | QANOV-384862 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384863 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a banner hero module and add two bottom links
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "banner hero" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "<button>" button
      And the "Edit Module" page is loaded
      And I click on the "add_bottom_link_button" button
      And I fill in the "bottom_text1_text_input" field with "Title Bottom Link 1"
      And I fill in the "bottom_text1_link_input" field with "https://www.google.es"
      And I click on the "add_bottom_link_button" button
      And I fill in the "bottom_text2_text_input" field with "Title Bottom Link 2"
      And I fill in the "bottom_text2_link_input" field with "https://www.movistar.es"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-384864 |
          | o2uk    | QANOV-384865 |
          | moves   | QANOV-328280 |
          | blaude  | QANOV-384866 |
          | o2de    | QANOV-384867 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384868 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit the internal name of a <module_type> module
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in QA environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_card_button" button
      And the "Edit Module" page is loaded
      And I clear the "internal_name_input" input value
      And I fill in the "internal_name_input" field with "Module Edition Test"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded
      And any element in the "modules_list" list has the "module_title" textfield with the "Module Edition Test" text

    @jira.cv.10.5
    Examples:
          | product | module_type      | jira_id      |
          | vivobr  | featured content | QANOV-22139  |
          | vivobr  | vertical cards   | QANOV-22142  |
          | vivobr  | rows             | QANOV-22145  |
          | o2uk    | featured content | QANOV-22140  |
          | o2uk    | vertical cards   | QANOV-22143  |
          | o2uk    | rows             | QANOV-22146  |
          | moves   | featured content | QANOV-22141  |
          | moves   | vertical cards   | QANOV-22144  |
          | moves   | rows             | QANOV-22147  |
          | blaude  | featured content | QANOV-286059 |
          | blaude  | vertical cards   | QANOV-286061 |
          | blaude  | rows             | QANOV-286063 |

    @jira.cv.14.3
    Examples:
          | product | module_type       | jira_id      |
          | vivobr  | banner            | QANOV-384872 |
          | vivobr  | highlighted cards | QANOV-286087 |
          | vivobr  | data cards        | QANOV-384878 |
          | vivobr  | display cards     | QANOV-384882 |
          | vivobr  | banner hero       | QANOV-384886 |
          | o2uk    | banner            | QANOV-384873 |
          | o2uk    | highlighted cards | QANOV-286088 |
          | o2uk    | data cards        | QANOV-384879 |
          | o2uk    | display cards     | QANOV-384883 |
          | o2uk    | banner hero       | QANOV-384887 |
          | moves   | banner            | QANOV-384874 |
          | moves   | highlighted cards | QANOV-286089 |
          | moves   | data cards        | QANOV-328274 |
          | moves   | display cards     | QANOV-328272 |
          | moves   | banner hero       | QANOV-328276 |
          | blaude  | banner            | QANOV-384875 |
          | blaude  | highlighted cards | QANOV-286090 |
          | blaude  | data cards        | QANOV-384880 |
          | blaude  | display cards     | QANOV-384884 |
          | blaude  | banner hero       | QANOV-384888 |
          | o2de    | featured content  | QANOV-384869 |
          | o2de    | vertical cards    | QANOV-384870 |
          | o2de    | rows              | QANOV-384871 |
          | o2de    | banner            | QANOV-384876 |
          | o2de    | highlighted cards | QANOV-384877 |
          | o2de    | data cards        | QANOV-384881 |
          | o2de    | display cards     | QANOV-384885 |
          | o2de    | banner hero       | QANOV-384889 |

    @jira.cv.Future
    Examples:
          | product | module_type         | jira_id      |
          | vivobr  | virtual             | QANOV-492494 |
          | vivobr  | data cards advanced | QANOV-492495 |
          | vivobr  | poster cards        | QANOV-492496 |
          | vivobr  | naked cards         | QANOV-492497 |
          | vivobr  | naked small cards   | QANOV-492498 |
          | o2uk    | virtual             | QANOV-492499 |
          | o2uk    | poster cards        | QANOV-492500 |
          | o2uk    | naked cards         | QANOV-492501 |
          | o2uk    | naked small cards   | QANOV-492502 |
          | moves   | virtual             | QANOV-492503 |
          | moves   | poster cards        | QANOV-492504 |
          | moves   | naked cards         | QANOV-492505 |
          | moves   | naked small cards   | QANOV-492506 |
          | blaude  | virtual             | QANOV-492507 |
          | blaude  | poster cards        | QANOV-492508 |
          | blaude  | naked cards         | QANOV-492509 |
          | blaude  | naked small cards   | QANOV-492510 |
          | o2de    | virtual             | QANOV-492511 |
          | o2de    | poster cards        | QANOV-492512 |
          | o2de    | naked cards         | QANOV-492513 |
          | o2de    | naked small cards   | QANOV-492514 |
          | o2es    | featured content    | QANOV-384890 |
          | o2es    | vertical cards      | QANOV-384891 |
          | o2es    | rows                | QANOV-384892 |
          | o2es    | banner              | QANOV-384893 |
          | o2es    | highlighted cards   | QANOV-384894 |
          | o2es    | data cards          | QANOV-384895 |
          | o2es    | display cards       | QANOV-384896 |
          | o2es    | banner hero         | QANOV-384897 |
          | o2es    | virtual             | QANOV-492515 |
          | o2es    | poster cards        | QANOV-492516 |
          | o2es    | naked cards         | QANOV-492517 |
          | o2es    | naked small cards   | QANOV-492518 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a <module_type> module and add a bottom link
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>" button
      And the "Edit Module" page is loaded
      And I fill in the "bottom_link_text_input" field with "Bottom Link"
      And I fill in the "bottom_link_url_input" field with "https://google.es"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.14.6
    Examples:
          | product | module_type       | jira_id      |
          | vivobr  | featured_content  | QANOV-424474 |
          | vivobr  | vertical_cards    | QANOV-424475 |
          | vivobr  | rows              | QANOV-424476 |
          | vivobr  | display_cards     | QANOV-424477 |
          | vivobr  | data_cards        | QANOV-424478 |
          | vivobr  | highlighted_cards | QANOV-424479 |
          | o2uk    | featured_content  | QANOV-424480 |
          | o2uk    | vertical_cards    | QANOV-424481 |
          | o2uk    | rows              | QANOV-424482 |
          | o2uk    | display_cards     | QANOV-424483 |
          | o2uk    | data_cards        | QANOV-424484 |
          | o2uk    | highlighted_cards | QANOV-424485 |
          | moves   | featured_content  | QANOV-424486 |
          | moves   | vertical_cards    | QANOV-424487 |
          | moves   | rows              | QANOV-424488 |
          | moves   | display_cards     | QANOV-424489 |
          | moves   | data_cards        | QANOV-424490 |
          | moves   | highlighted_cards | QANOV-424491 |
          | blaude  | featured_content  | QANOV-424492 |
          | blaude  | vertical_cards    | QANOV-424493 |
          | blaude  | rows              | QANOV-424494 |
          | blaude  | display_cards     | QANOV-424495 |
          | blaude  | data_cards        | QANOV-424496 |
          | blaude  | highlighted_cards | QANOV-424497 |
          | o2de    | featured_content  | QANOV-424498 |
          | o2de    | vertical_cards    | QANOV-424499 |
          | o2de    | rows              | QANOV-424500 |
          | o2de    | display_cards     | QANOV-424501 |
          | o2de    | data_cards        | QANOV-424502 |
          | o2de    | highlighted_cards | QANOV-424503 |
          | o2es    | featured_content  | QANOV-439578 |
          | o2es    | vertical_cards    | QANOV-439579 |
          | o2es    | rows              | QANOV-439580 |
          | o2es    | display_cards     | QANOV-439581 |
          | o2es    | data_cards        | QANOV-439582 |
          | o2es    | highlighted_cards | QANOV-439583 |

    @jira.cv.Future
    Examples:
          | product | module_type         | jira_id      |
          | vivobr  | data cards advanced | QANOV-492519 |
          | vivobr  | naked cards         | QANOV-492520 |
          | vivobr  | poster cards        | QANOV-492521 |
          | vivobr  | naked small cards   | QANOV-492522 |
          | o2uk    | poster cards        | QANOV-492523 |
          | o2uk    | naked cards         | QANOV-492524 |
          | o2uk    | naked small cards   | QANOV-492525 |
          | moves   | poster cards        | QANOV-492526 |
          | moves   | naked cards         | QANOV-492527 |
          | moves   | naked small cards   | QANOV-492528 |
          | blaude  | poster cards        | QANOV-492529 |
          | blaude  | naked cards         | QANOV-492530 |
          | blaude  | naked small cards   | QANOV-492531 |
          | o2de    | poster cards        | QANOV-492532 |
          | o2de    | naked cards         | QANOV-492533 |
          | o2de    | naked small cards   | QANOV-492534 |
          | o2es    | poster cards        | QANOV-492535 |
          | o2es    | naked cards         | QANOV-492536 |
          | o2es    | naked small cards   | QANOV-492537 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a <module_type> module and add a title link
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given a "<module_type>" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_<module_type>>" button
      And the "Edit Module" page is loaded
      And I fill in the "section_title_link_text_input" field with "Title Link"
      And I fill in the "section_title_link_input" field with "https://www.google.es"
      And I click on the "save_button" button
     Then the "Modules Repository" page is loaded

    @jira.cv.10.5
    Examples:
          | product | module_type      | jira_id      |
          | vivobr  | featured_content | QANOV-22151  |
          | vivobr  | vertical_cards   | QANOV-22154  |
          | vivobr  | rows             | QANOV-22157  |
          | o2uk    | featured_content | QANOV-22152  |
          | o2uk    | vertical_cards   | QANOV-22155  |
          | o2uk    | rows             | QANOV-22158  |
          | moves   | featured_content | QANOV-22153  |
          | moves   | vertical_cards   | QANOV-22156  |
          | moves   | rows             | QANOV-22159  |
          | blaude  | featured_content | QANOV-286071 |
          | blaude  | vertical_cards   | QANOV-286072 |
          | blaude  | rows             | QANOV-286073 |
          | o2de    | featured_content | QANOV-384781 |
          | o2de    | vertical_cards   | QANOV-384783 |
          | o2de    | rows             | QANOV-384785 |

    @jira.cv.14.3
    Examples:
          | product | module_type       | jira_id      |
          | vivobr  | display_cards     | QANOV-384849 |
          | vivobr  | data_cards        | QANOV-384850 |
          | vivobr  | highlighted_cards | QANOV-424505 |
          | o2uk    | display_cards     | QANOV-384851 |
          | o2uk    | data_cards        | QANOV-384852 |
          | o2uk    | highlighted_cards | QANOV-424506 |
          | moves   | display_cards     | QANOV-328277 |
          | moves   | data_cards        | QANOV-328278 |
          | moves   | highlighted_cards | QANOV-424504 |
          | blaude  | display_cards     | QANOV-384853 |
          | blaude  | data_cards        | QANOV-384854 |
          | blaude  | highlighted_cards | QANOV-424507 |
          | o2de    | display_cards     | QANOV-384855 |
          | o2de    | data_cards        | QANOV-384856 |
          | o2de    | highlighted_cards | QANOV-424508 |

    @jira.cv.Future
    Examples:
          | product | module_type         | jira_id      |
          | vivobr  | data cards advanced | QANOV-492538 |
          | vivobr  | naked cards         | QANOV-492539 |
          | vivobr  | poster cards        | QANOV-492540 |
          | vivobr  | naked small cards   | QANOV-492541 |
          | o2uk    | poster cards        | QANOV-492542 |
          | o2uk    | naked cards         | QANOV-492543 |
          | o2uk    | naked small cards   | QANOV-492544 |
          | moves   | poster cards        | QANOV-492545 |
          | moves   | naked cards         | QANOV-492546 |
          | moves   | naked small cards   | QANOV-492547 |
          | blaude  | poster cards        | QANOV-492548 |
          | blaude  | naked cards         | QANOV-492549 |
          | blaude  | naked small cards   | QANOV-492550 |
          | o2de    | poster cards        | QANOV-492551 |
          | o2de    | naked cards         | QANOV-492552 |
          | o2de    | naked small cards   | QANOV-492553 |
          | o2es    | display_cards       | QANOV-384857 |
          | o2es    | data_cards          | QANOV-384858 |
          | o2es    | featured_content    | QANOV-384782 |
          | o2es    | vertical_cards      | QANOV-384784 |
          | o2es    | rows                | QANOV-384786 |
          | o2es    | highlighted_cards   | QANOV-424509 |
          | o2es    | poster cards        | QANOV-492554 |
          | o2es    | naked cards         | QANOV-492555 |
          | o2es    | naked small cards   | QANOV-492556 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user will see the save module popup after finishing editing a module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_[CONTEXT:module_type]" button
      And the "Edit Module" page is loaded
      And I fill in the "internal_name_input" field with "Module Edition Test"
      And I click on the "save_button" button
     Then the "save_module_popup" element is displayed
      And the text of the element "popup_title" is equal to "Save module"
      And the text of the element "popup_text" is equal to "You can choose to save and publish the module now, so it will be published immediately, or save it as a draft and publish it whenever you want."
      And the text of the element "save_draft_button" is equal to "Save as draft"
      And the text of the element "save_publish_button" is equal to "Save and publish"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531820 |
          | o2uk    | QANOV-531821 |
          | moves   | QANOV-531822 |
          | blaude  | QANOV-531823 |
          | o2de    | QANOV-531824 |
          | o2es    | QANOV-531825 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can save the module as draft after finishing editing a module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And clicks on the "edit" field of "module_list" list with "0" index
      And the "Edit Module" page is loaded
      And I fill in the "internal_name_input" field with "Module Edition Test"
      And I click on the "save_button" button
      And I click on the "save_draft_button" button
     Then the "Edit Module" page is loaded
      And the "crouton_message" textfield with "Module modified" text is displayed
      And the text of the element "header_module_status" is equal to "Pending publication"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531826 |
          | o2uk    | QANOV-531827 |
          | moves   | QANOV-531828 |
          | blaude  | QANOV-531829 |
          | o2de    | QANOV-531830 |
          | o2es    | QANOV-531831 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can publish the module after finishing editing a module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And clicks on the "edit" field of "module_list" list with "0" index
      And the "Edit Module" page is loaded
      And I fill in the "internal_name_input" field with "Module Edition Test"
      And I click on the "save_button" button
      And I click on the "save_publish_button" button
     Then the "Edit Module" page is loaded
      And the "crouton_message" textfield with "Module modified and published" text is displayed
      And the text of the element "header_module_status" is equal to "Published"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531832 |
          | o2uk    | QANOV-531833 |
          | moves   | QANOV-531834 |
          | blaude  | QANOV-531835 |
          | o2de    | QANOV-531836 |
          | o2es    | QANOV-531837 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user will see the publish confirmation popup when publishing a module saved as draft
    Given a "[CONTEXT:module_type]" module in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "modules_list" list
      And I click on the "edit_card" field on the "[CONTEXT:modules_list_index]" element in the "modules_list" web list
      And I click on the "publish_button" button
     Then the "publish_module_popup" element is displayed
      And the text of the element "popup_title" is equal to "Publish module?"
      And the text of the element "popup_text" is equal to "If this module is also used in other layouts and you publish it, it will be modified and published in the other layouts as well."
      And the text of the element "popup_cancel" is equal to "Cancel"
      And the text of the element "popup_publish" is equal to "Publish"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531838 |
          | o2uk    | QANOV-531839 |
          | moves   | QANOV-531840 |
          | blaude  | QANOV-531841 |
          | o2de    | QANOV-531842 |
          | o2es    | QANOV-531843 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user who confirms the publish popup will see the module published
    Given a "[CONTEXT:module_type]" module in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "modules_list" list
      And I click on the "edit_card" field on the "[CONTEXT:modules_list_index]" element in the "modules_list" web list
      And I click on the "publish_button" button
      And I click on the "popup_publish" button
     Then the "Modules Repository" page is loaded
      And the "crouton_message" textfield with "Module published" text is displayed
      And the element in "[CONTEXT:modules_list_index]" position in the "modules_list" list has the "status" textfield with the "Published" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531844 |
          | o2uk    | QANOV-531845 |
          | moves   | QANOV-531846 |
          | blaude  | QANOV-531847 |
          | o2de    | QANOV-531848 |
          | o2es    | QANOV-531849 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user who cancels the publish popup will see the module in draft status
    Given a "[CONTEXT:module_type]" module in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "modules_list" list
      And I click on the "edit_card" field on the "[CONTEXT:modules_list_index]" element in the "modules_list" web list
      And I click on the "publish_button" button
      And I click on the "popup_cancel" button
     Then the "Modules Repository" page is loaded
      And the element in "[CONTEXT:modules_list_index]" position in the "modules_list" list has the "status" textfield with the "Pending publication" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531850 |
          | o2uk    | QANOV-531851 |
          | moves   | QANOV-531852 |
          | blaude  | QANOV-531853 |
          | o2de    | QANOV-531854 |
          | o2es    | QANOV-531855 |

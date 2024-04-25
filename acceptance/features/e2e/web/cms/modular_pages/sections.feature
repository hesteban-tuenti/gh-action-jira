# -*- coding: utf-8 -*-
@jira.QANOV-310315
Feature: Sections


  @jira.<jira_id> @<product> @ber @e2e @manual @qa @smoke @web
  Scenario Outline: A user sees the header section created by default
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
     Then the "sections_list" list has "1" elements
      And the text of the element "header_section_title" is equal to "Header"
      And the "header_section_standalone_modules" list is not displayed
      And the text of the element "header_section_add_module_button" is equal to "Add module"
      And the "new_section_button" element is displayed
      And the text of the element "new_section_button" is equal to "New section"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310316 |
          | o2uk    | 13.9 | QANOV-310317 |
          | moves   | 13.9 | QANOV-310318 |
          | blaude  | 14.0 | QANOV-310319 |
          | o2de    | 24.1 | QANOV-580255 |

  @jira.<jira_id> @<product> @ber @e2e @manual @qa @smoke @web
  Scenario Outline: A user can fill new section details
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
     Then the "Edit Section Form" page is loaded
      And the text of the element "page_title_label" is equal to "New section"
      And the "internal_name_input" element is displayed
      And the "background_color_selector" element is displayed
      And the text of the element "background_color_selector" is equal to "Default"
      And the "show_title_and_descriptions_title" element is displayed
      And the "show_title_and_descriptions_subtitle" element is displayed
      And the "show_title_and_descriptions_toggle" element is displayed
      And the "section_preview" element is displayed
      And the "section_preview_dark_toggle" element is disabled
      And the "section_preview_priority_toggle" element <priority_switch> displayed
      And the "ok_button" element is displayed
      And the "cancel_button" element is displayed

    Examples:
          | product | cv   | priority_switch | jira_id      |
          | vivobr  | 13.9 | is not          | QANOV-310320 |
          | o2uk    | 13.9 | is not          | QANOV-310321 |
          | moves   | 13.9 | is              | QANOV-310322 |
          | blaude  | 14.0 | is not          | QANOV-310323 |
          | o2de    | 24.1 | is not          | QANOV-580256 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user cannot create a second header section
    Two sections cannot have the same internal name
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section" page is loaded
      And I fill in the "internal_name_input" field with "Header"
      And I click on the "ok_button" button
     Then the text of the element "internal_name_error" is equal to "This section internal name already exists. Please, use a different one"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310324 |
          | o2uk    | 13.9 | QANOV-310325 |
          | moves   | 13.9 | QANOV-310326 |
          | blaude  | 14.0 | QANOV-310327 |
          | o2de    | 24.1 | QANOV-580257 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user cannot create a second regular section
    Two sections cannot have the same internal name
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" button
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" button
     Then the text of the element "internal_name_error" is equal to "This section internal name already exists. Please, use a different one"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310328 |
          | o2uk    | 13.9 | QANOV-310329 |
          | moves   | 13.9 | QANOV-310330 |
          | blaude  | 14.0 | QANOV-310331 |
          | o2de    | 24.1 | QANOV-580258 |

  @jira.<jira_id> @<product> @ber @e2e @manual @qa @smoke @web
  Scenario Outline: A user can add a header module to the header section
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "header_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Start tab Header Cards (CMS) (header_cards_with_fallbacks)" option from "module_selector" field
      And I click on the "add_module" button
     Then the "Page Overview" page is loaded
      And the "header_section_standalone_modules" list has "1" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310332 |
          | o2uk    | 13.9 | QANOV-310333 |
          | moves   | 13.9 | QANOV-310334 |
          | blaude  | 14.0 | QANOV-310335 |
          | o2de    | 24.1 | QANOV-580259 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user cannot add all existing modules to the header section
    Additional sections can include any kind of modules, not only header specific ones
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "header_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
     Then the "Action Row" element is not on the "modules_selector" list

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310336 |
          | o2uk    | 13.9 | QANOV-310337 |
          | moves   | 13.9 | QANOV-310338 |
          | blaude  | 14.0 | QANOV-310339 |
          | o2de    | 24.1 | QANOV-580260 |

  @jira.<jira_id> @<product> @ber @e2e @manual @qa @sanity @web
  Scenario Outline: A user creates a section
    Internal name is mandatory
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" button
     Then the "Page Content" page is loaded
      And the "main_section" element is displayed
      And the text of the element "main_section_title" is equal to "Main Section"
      And the "main_section_standalone_modules" list has "0" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310340 |
          | o2uk    | 13.9 | QANOV-310341 |
          | moves   | 13.9 | QANOV-310342 |
          | blaude  | 14.0 | QANOV-310343 |
          | o2de    | 24.1 | QANOV-580261 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user creates a section with brand background
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "background_color_selector" element
      And I click on the "background_color_brand_option" element
      And I click on the "ok_button" button
      And the "Page Content" page is loaded
      And the "main_section" element is displayed
      And I click on the "main_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
     Then the "main_section_standalone_modules" list has "1" elements
      And the "page_preview" list has "1" elements
      And the background color of the "0" element in "page_preview_list" is "dark"

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.9 | Consumption Counters as Cards (data_card_carousel)      | QANOV-310344 |
          | o2uk    | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310345 |
          | moves   | 13.9 | Billing cycle header (simple_header)                    | QANOV-310346 |
          | blaude  | 14.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310347 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580262 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user creates a section with title
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
     Then the text of the element "section_preview_title" is equal to "Section Title"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310348 |
          | o2uk    | 13.9 | QANOV-310349 |
          | moves   | 13.9 | QANOV-310350 |
          | blaude  | 14.0 | QANOV-310351 |
          | o2de    | 24.1 | QANOV-580263 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user creates a section with title and description
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
      And I fill in the "section_description_input" field with "Section Description"
     Then the text of the element "section_preview_title" is equal to "Section Title"
      And the text of the element "section_preview_description" is equal to "Section Description"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310352 |
          | o2uk    | 13.9 | QANOV-310353 |
          | moves   | 13.9 | QANOV-310354 |
          | blaude  | 14.0 | QANOV-310355 |
          | o2de    | 24.1 | QANOV-580264 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user creates a section with title, description and/or link
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And the "section_title" element is displayed
      And the "section_description" element is displayed
      And the "link_title" element is displayed
      And the "link_none_option" element is displayed
      And the "link_with_link_option" element is displayed
      And the "link_none_option" element is selected

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310356 |
          | o2uk    | 13.9 | QANOV-310357 |
          | moves   | 13.9 | QANOV-310358 |
          | blaude  | 14.0 | QANOV-310359 |
          | o2de    | 24.1 | QANOV-580265 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user cannot create a section when selected to show a title that is not filled
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I click the "ok_button" element
     Then the text of the element "section_title_error" is equal to "This field is required"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310360 |
          | o2uk    | 13.9 | QANOV-310361 |
          | moves   | 13.9 | QANOV-310362 |
          | blaude  | 14.0 | QANOV-310363 |
          | o2de    | 24.1 | QANOV-580266 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can create a section with a link
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I click on the "link_with_link_option" element
     Then the "link_text_action_input" element is displayed
      And the "link_selector" element is displayed
      And the "link_url_input" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310364 |
          | o2uk    | 13.9 | QANOV-310365 |
          | moves   | 13.9 | QANOV-310366 |
          | blaude  | 14.0 | QANOV-310368 |
          | o2de    | 24.1 | QANOV-580268 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user cannot create a section without label and URL for a link
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
      And I click on the "link_with_link_option" element
      And I click on the "ok_button" button
     Then the text of the element "link_text_action_error" is equal to "This field is required"
      And the text of the element "link_url_error" is equal to "This field is required"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310369 |
          | o2uk    | 13.9 | QANOV-310370 |
          | moves   | 13.9 | QANOV-310372 |
          | blaude  | 14.0 | QANOV-310374 |
          | o2de    | 24.1 | QANOV-580269 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can create a section with a URL link
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title" field with "Section Title"
      And I click on the "link_with_link_option" element
      And I fill in the "link_text_action_input" field with "url action"
      And I select the "URL" option from "link_selector" field
      And I fill in the "link_url_input" field with "https://www.google.es"
     Then the text of the element "section_preview_title" is equal to "Section Title"
      And the text of the element "section_preview_link" is equal to "url action"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310375 |
          | o2uk    | 13.9 | QANOV-310377 |
          | moves   | 13.9 | QANOV-310378 |
          | blaude  | 14.0 | QANOV-310379 |
          | o2de    | 24.1 | QANOV-580270 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can create a section with a preconfigured link
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
      And I click on the "link_with_link_option" element
      And I fill in the "link_text_action_input" field with "preconfigured action"
      And I select the "Preconfigured" option from "link_type_selector" field
      And I click on the "link_url_selector" element
      And I click on the "link_url_selector_first_element" button
     Then the text of the element "section_preview_title" is equal to "Section Title"
      And the text of the element "section_preview_link" is equal to "preconfigured action"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310380 |
          | o2uk    | 13.9 | QANOV-310381 |
          | moves   | 13.9 | QANOV-310382 |
          | blaude  | 14.0 | QANOV-310383 |
          | o2de    | 24.1 | QANOV-580271 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can see a section with modules showing title, subtitle and link
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
      And I fill in the "section_description_input" field with "Section Description"
      And I click on the "link_with_link_option" element
      And I fill in the "link_text_action_input" field with "preconfigured action"
      And I select the "Preconfigured" option from "link_type_selector" field
      And I click on the "link_url_selector" element
      And I click on the "link_url_selector_first_element" button
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
     Then the text of the element "page_preview_section_title" is equal to "Section Title"
      And the text of the element "page_preview_section_description" is equal to "Section Description"
      And the text of the element "page_preview_section_link" is equal to "preconfigured action"

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.9 | Consumption Counters as Cards (data_card_carousel)      | QANOV-310384 |
          | o2uk    | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310385 |
          | moves   | 13.9 | Billing cycle header (simple_header)                    | QANOV-310386 |
          | blaude  | 14.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310387 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580272 |

  @jira.<jira_id> @<product> @ber @e2e @manual @qa @smoke @web
  Scenario Outline: A user can see the options to edit a section
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_more_options" element
      And I click on the "main_section_edit" element
     Then the "Edit Section Form" page is loaded
      And the text of the element "internal_name_input" is equal to "Main Section"
      And the "background_color_selector" element is displayed
      And the text of the element "background_color_selector" is equal to "Default"
      And the "show_title_and_descriptions_title" element is displayed
      And the "show_title_and_descriptions_subtitle" element is displayed
      And the "show_title_and_descriptions_toggle" element is displayed
      And the "section_preview" element is displayed
      And the "section_preview_dark_toggle" element is disabled
      And the "section_preview_priority_toggle" element <priority_switch> displayed
      And the "ok_button" element is displayed
      And the "cancel_button" element is displayed

    Examples:
          | product | cv   | priority_switch | jira_id      |
          | vivobr  | 13.9 | is not          | QANOV-310388 |
          | o2uk    | 13.9 | is not          | QANOV-310389 |
          | moves   | 13.9 | is              | QANOV-310390 |
          | blaude  | 14.0 | is not          | QANOV-310391 |
          | o2de    | 24.1 | is not          | QANOV-580273 |

  @jira.<jira_id> @<product> @ber @e2e @manual @qa @smoke @web
  Scenario Outline: A user can edit a minimal section
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_more_options" element
      And I click on the "main_section_edit" element
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section Edited"
      And I click on the "ok_button" button
     Then the "Page Content" page is loaded
      And the text of the element "main_section_title" is equal to "Main Section Edited"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310392 |
          | o2uk    | 13.9 | QANOV-310393 |
          | moves   | 13.9 | QANOV-310394 |
          | blaude  | 14.0 | QANOV-310395 |
          | o2de    | 24.1 | QANOV-580274 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can edit a section with title, description and url
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "background_color_selector" element
      And I click on the "background_color_brand_option" element
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
      And I fill in the "section_description_input" field with "Section Description"
      And I click on the "link_with_link_option" element
      And I fill in the "link_text_action_input" field with "preconfigured action"
      And I select the "Preconfigured" option from "link_type_selector" field
      And I click on the "link_url_selector" element
      And I click on the "link_url_selector_first_element" button
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_more_options" element
      And I click on the "main_section_edit" element
     Then the "Edit Section Form" page is loaded
      And the text of the element "internal_name_input" is equal to "Main Section"
      And the text of the element "background_color_selector" is equal to "Brand"
      And the "show_title_and_descriptions_toggle" element is selected
      And the text of the element "section_title_input" is equal to "Section Title"
      And the text of the element "section_descriptiion_input" is equal to "Section Description"
      And the text of the element "link_text_action_input" is equal to "preconfigured action"
      And the text of the element "link_type_selector" is equal to "Preconfigured"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310396 |
          | o2uk    | 13.9 | QANOV-310397 |
          | moves   | 13.9 | QANOV-310398 |
          | blaude  | 14.0 | QANOV-310399 |
          | o2de    | 24.1 | QANOV-580275 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can remove a section
    The deletion must be confirmed
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_more_options" element
      And I click on the "main_section_delete" element
      And the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to delete this section?"
      And the text of the element "message" is equal to "If you delete the section you will lose all the modules inside and their configuration. This action can’t be undone."
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Delete section"
      And I click on the "accept" button
     Then the "Page Content" page is loaded
      And the "main_section" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310400 |
          | o2uk    | 13.9 | QANOV-310401 |
          | moves   | 13.9 | QANOV-310402 |
          | blaude  | 14.0 | QANOV-310403 |
          | o2de    | 24.1 | QANOV-580276 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user cannot remove the header section
    There should not be a menu option to delete the header section
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "header_section_more_options" element
     Then the "header_section_delete" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310404 |
          | o2uk    | 13.9 | QANOV-310405 |
          | moves   | 13.9 | QANOV-310406 |
          | blaude  | 14.0 | QANOV-310407 |
          | o2de    | 24.1 | QANOV-580277 |

  @jira.<jira_id> @<product> @ber @e2e @manual @qa @smoke @web
  Scenario Outline: A user can hide a section
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "show_title_and_descriptions_toggle" element
      And I fill in the "section_title_input" field with "Section Title"
      And I fill in the "section_description_input" field with "Section Description"
      And I click on the "link_with_link_option" element
      And I fill in the "link_text_action_input" field with "preconfigured action"
      And I select the "Preconfigured" option from "link_type_selector" field
      And I click on the "link_url_selector" element
      And I click on the "link_url_selector_first_element" button
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And the "main_section_standalone_modules" list has "1" elements
      And the "page_preview_modules_list" list has "1" elements
      And I click on the "header_section_more_options" element
      And I click on the "header_section_hide" element
     Then the "page_preview_section_title" element is not displayed
      And the "page_preview_section_description" element is not displayed
      And the "page_preview_section_link" element is not displayed
      And the "page_preview_modules_list" list has "0" elements

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.9 | Consumption Counters as Cards (data_card_carousel)      | QANOV-310408 |
          | o2uk    | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310409 |
          | moves   | 13.9 | Billing cycle header (simple_header)                    | QANOV-310410 |
          | blaude  | 14.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310411 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580278 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can configure extras for Explore Widget module
    enable 'Display module links' to show the links of the cards or not
    enable 'Hide module title' for not showin the title coming in the module
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "explore-widget" button
     Then the "display_module_links_toggle" element is displayed
      And the "hide_modules_title_toggle" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310412 |
          | o2uk    | 13.9 | QANOV-310413 |
          | moves   | 13.9 | QANOV-310414 |
          | blaude  | 14.0 | QANOV-310415 |
          | o2de    | 24.1 | QANOV-580279 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user adds sections in order
    New sections are added at the end
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Secondary Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
     Then the element in "1" position of the "sections_list" list has the "section_title" textfield with the "Main Section" text
      And the element in "2" position of the "sections_list" list has the "section_title" textfield with the "Secondary Section" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310416 |
          | o2uk    | 13.9 | QANOV-310417 |
          | moves   | 13.9 | QANOV-310418 |
          | blaude  | 14.0 | QANOV-310419 |
          | o2de    | 24.1 | QANOV-580280 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can move sections down in their order
    New sections are added at the end. If there are more than one
    section, there are options to move them up or down
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Secondary Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_more_options" element
      And I click on the "main_section_move_down" element
     Then the element in "1" position of the "sections_list" list has the "section_title" textfield with the "Secondary Section" text
      And the element in "2" position of the "sections_list" list has the "section_title" textfield with the "Main Section" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310420 |
          | o2uk    | 13.9 | QANOV-310421 |
          | moves   | 13.9 | QANOV-310422 |
          | blaude  | 14.0 | QANOV-310423 |
          | o2de    | 24.1 | QANOV-580281 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can move sections up in their order
    New sections are added at the end. If there are more than one
    section, there are options to move them up or down
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Secondary Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "secondary_section_more_options" element
      And I click on the "secondary_section_move_up" element
     Then the element in "1" position of the "sections_list" list has the "section_title" textfield with the "Secondary Section" text
      And the element in "2" position of the "sections_list" list has the "section_title" textfield with the "Main Section" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.9 | QANOV-310424 |
          | o2uk    | 13.9 | QANOV-310425 |
          | moves   | 13.9 | QANOV-310426 |
          | blaude  | 14.0 | QANOV-310427 |
          | o2de    | 24.1 | QANOV-580282 |

  @jira.<jira_id> @<product> @e2e @manual @qa @regression @web
  Scenario Outline: A user can move a module to another section
    New sections are added at the end
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Secondary Section"
      And I click on the "ok_button" element
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
      And I click on the "move_to_another_section_menu_item" button
      And the "Confirm Move Module" page is loaded
      And the text of the element "title" is equal to "Move to another section"
      And I click on the "destination_selector" button
      And I click on the "destination_selector_first_element" button
      And I click on the "move_module_button" button
     Then the "main_section_standalone_modules" list has "0" elements
      And the "secondary_section_standalone_modules" list has "1" elements

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.9 | Consumption Counters as Cards (data_card_carousel)      | QANOV-310428 |
          | o2uk    | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310429 |
          | moves   | 13.9 | Billing cycle header (simple_header)                    | QANOV-310430 |
          | blaude  | 14.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310431 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580283 |

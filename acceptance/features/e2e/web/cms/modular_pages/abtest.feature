# -*- coding: utf-8 -*-
@jira.QANOV-341150 @not_hardening
Feature: A/B Tests


  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user without 'Manage Modular Pages A/B Tests' permission cannot see A/B test option
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And no element in the "permissions" list has the value "Manage Modular Pages A/B Tests" in the "permission_text" field
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
     Then the "ab_test_menu_item" element is not displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341151 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341152 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341153 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341154 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580117 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @sanity @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions can see A/B test option
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
     Then the "ab_test_menu_item" element is displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341155 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341156 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341157 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341158 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580118 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions could see the popup to create an A/B test
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
     Then the "Confirm A/B Test Popup" page is loaded
      And the text of the element "title" is equal to "A/B test"
      And the text of the element "message" is equal to "Insert the Firebase key name in order to continue"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "confirm" is equal to "Continue"

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341159 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341160 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341161 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341162 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580119 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @smoke @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions creates an A/B test
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
     Then the "main_section_abtest" element is displayed
      And the text of the element "main_section_abtest_title" is equal to "A/B QA testing firebase key"
      And the text of the element "main_section_abtest_label" is equal to "A/B testing"
      And the "main_section_abtest_options" list has "2" elements
      And the text of the "roundel" field in the element "main_section_abtest_option_a" is equal to "A"
      And the text of the "reference_model_label" field in the element "main_section_abtest_option_a" is equal to "RM"
      And the text of the "roundel" field in the element "main_section_abtest_option_b" is equal to "B"

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341163 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341164 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341165 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341166 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580120 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A second A/B test cannot be created for the same modular page
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "main_section_abtest" element is displayed
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
     Then the "ab_test_menu_item" element is not displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341167 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341168 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341169 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341170 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580121 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions could edit A/B test firebase identifier
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And I click on the "main_section_abtest_more_options" button
      And I click on the "edit_test_menu_item" button
     Then the "Confirm A/B Edit Popup" page is loaded
      And the "exclamation_mark_icon" element is displayed
      And the text of the element "title" is equal to "Editing the A/B test might affect A/B test result"
      And the text of the element "message" is equal to "Are you sure you want to edit the Firebase key name? If you continue the result of the test might be compromised"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "confirm" is equal to "Yes, edit"
      And I click on the "cancel" button
      And the "Page Content" page is displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341171 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341172 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341173 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341174 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580122 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions edits the A/B test firebase identifier
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And I click on the "main_section_abtest_more_options" button
      And I click on the "edit_test_menu_item" button
      And the "Confirm A/B Edit Popup" page is loaded
      And I click on the "confirm" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key after edition"
      And I click on the "confirm" button
     Then the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And the text of the element "main_section_abtest_title" is equal to "A/B QA testing firebase key after edition"

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341175 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341176 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341177 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341178 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580124 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions can edit a module under A/B test
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And clicks on the "more_options_menu" field of "main_section_abtest_modules" list with "any" index
     Then the "edit_module_menu_item" element is displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341179 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341180 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341181 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341182 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580125 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user without 'Manage Modular Pages A/B Tests' permissions cannot edit a module that has an A/B test running
    NOTE: this scenario assumes that there is a configured modular page with an A/B test running
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And no element in the "permissions" list has the value "Manage Modular Pages A/B Tests" in the "permission_text" field
      And the configured modular page has an A/B test running
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_abtest_module_a_more_options" button
     Then the "edit_module_menu_item" element is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-341183 |
          | o2uk    | QANOV-341184 |
          | moves   | QANOV-341185 |
          | blaude  | QANOV-341186 |
          | o2de    | QANOV-580126 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @smoke @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions can decide the reference model as A/B test winner
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And I click on the "main_section_abtest_module_a_more_options" button
      And I click on the "set_as_winner_menu_item" button
     Then the "A/B Winner Summary" page is displayed
      And the text of the element "title" is equal to "Set as winner"
      And the text of the element "winner" is equal to "Variant A"
      And the text of the element "description" is equal to "Are you sure you want to set this variant as winner?\nThe other version will be discarded."
      And the "preview_image" element is displayed
      And the "preview_switch" element is displayed
      And the "cancel_button" element is displayed
      And the "ok_button" element is displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341187 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341188 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341189 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341190 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580127 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions can decide the variant as A/B test winner
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And I click on the "main_section_abtest_module_b_more_options" button
      And I click on the "set_as_winner_menu_item" button
     Then the "A/B Winner Summary" page is displayed
      And the text of the element "title" is equal to "Set as winner"
      And the text of the element "winner" is equal to "Variant B"
      And the text of the element "description" is equal to "Are you sure you want to set this variant as winner?\nThe other version will be discarded."
      And the "preview_image" element is displayed
      And the "preview_switch" element is displayed
      And the "cancel_button" element is displayed
      And the "ok_button" element is displayed

    Examples:
          | product | module                                                  | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | QANOV-341191 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341192 |
          | moves   | Billing cycle header (simple_header)                    | QANOV-341193 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | QANOV-341194 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580128 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @smoke @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions decides the reference model as A/B test winner
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And I click on the "main_section_abtest_module_a_more_options" button
      And I click on the "set_as_winner_menu_item" button
      And I click on the "ok_button" button
     Then the "Page Content" page is displayed
      And the "main_section_abtest" element is not displayed
      And the "main_section_standalone_modules" list has "1" elements

    Examples:
          | product | module                                                  | priority_switch | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | is not          | QANOV-341195 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | is not          | QANOV-341196 |
          | moves   | Billing cycle header (simple_header)                    | is              | QANOV-341197 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | is not          | QANOV-341198 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | is not          | QANOV-580129 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @manual @qa @regression @web
  Scenario Outline: A CMS web user with 'Manage Modular Pages A/B Tests' permissions decides the variant as A/B test winner
    Given I go to "[CONF:cms.base][CONF:cms.profile]" web page
      And any element in the "permissions" list has the "permission_text" textfield with the "Manage Modular Pages A/B Tests" text
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
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "0" index
      And I click on the "ab_test_menu_item" button
      And the "Confirm A/B Test Popup" page is loaded
      And I fill in the "key_name_input" field with "QA testing firebase key"
      And I click on the "confirm" button
      And the "Edit Module Form" page is displayed
      And I click on the "add_module" button
      And the "Page Content" page is displayed
      And the "main_section_abtest" element is displayed
      And I click on the "main_section_abtest_module_b_more_options" button
      And I click on the "set_as_winner_menu_item" button
      And I click on the "ok_button" button
     Then the "Page Content" page is displayed
      And the "main_section_abtest" element is not displayed
      And the "main_section_standalone_modules" list has "1" elements

    Examples:
          | product | module                                                  | priority_switch | jira_id      |
          | vivobr  | Consumption Counters as Cards (data_card_carousel)      | is not          | QANOV-341199 |
          | o2uk    | Data Consumption Counters as Cards (data_card_carousel) | is not          | QANOV-341200 |
          | moves   | Billing cycle header (simple_header)                    | is              | QANOV-341201 |
          | blaude  | Data Consumption Counters as Cards (data_card_carousel) | is not          | QANOV-341202 |
          | o2de    | Data Consumption Counters as Cards (data_card_carousel) | is not          | QANOV-580130 |

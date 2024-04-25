# -*- coding: utf-8 -*-
@jira.QANOV-180143 @not_hardening
Feature: Modular Pages

  Actions After the Feature:
    Given the configured modular pages with "[CONF:cms.modular_page_name]" name in CMS are deleted


  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @smoke @web
  Scenario Outline: A user can access to the Modular pages screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
     When I click on the "modular_pages_option" button
     Then the "Modular Pages" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180144 |
          | o2uk    | 13.0 | QANOV-180145 |
          | moves   | 13.0 | QANOV-180146 |
          | blaude  | 13.9 | QANOV-274105 |

  @jira.QANOV-580131 @automatic @ber @e2e @jira.cv.24.1 @o2de @qa @smoke @web
  Scenario: A user can access to the Modular pages screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
      And I click on the "modular_pages_option" button
      And I click on the "modular_pages_user_interface" button
     Then the "Modular Pages" page is loaded

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can access to Modular pages screen without any page created
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "0" modular pages configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
     Then the "Modular Pages" page is loaded
      And the text of the element "title" is equal to "Configurable Pages"
      And the text of the element "create_page_button" is equal to "Create page"
      And the text of the element "empty_case_title" is equal to "Create your first Configurable Page"
      And the text of the element "empty_case_description" is equal to "Click on the “Create page” button to start"
      And the text of the element "empty_case_button" is equal to "Create page"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180147 |
          | o2uk    | 13.0 | QANOV-180148 |
          | moves   | 13.0 | QANOV-180149 |
          | blaude  | 13.9 | QANOV-274106 |
          | o2de    | 24.1 | QANOV-580132 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @sanity @web
  Scenario Outline: A user can access to Modular Pages page with pages already created
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "several" modular pages configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
     Then the "Modular Pages" page is loaded
      And the text of the element "title" is equal to "Modular Pages"
      And the text of the element "create_page_button" is equal to "Create page"
      And the "filter_by_name" element is displayed
      And the "filter_by_url_id" element is displayed
      And the "filter_by_status" element is displayed
      And the "pages_list" list of elements is displayed
      And waits until the "pages_list" element is clickable
      And each item in the "pages_list" list has the "url_id" field
      And each item in the "pages_list" list has the "product_type" field
      And each item in the "pages_list" list has the "user_group" field
      And each item in the "pages_list" list has the "status" field
      And each item in the "pages_list" list has the "pages" field

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180150 |
          | o2uk    | 13.0 | QANOV-180151 |
          | moves   | 13.0 | QANOV-180152 |
          | blaude  | 13.9 | QANOV-274107 |
          | o2de    | 24.1 | QANOV-580133 |

  @jira.QANOV-180153 @automatic @ber @e2e @jira.cv.13.0 @qa @smoke @vivobr @web
  Scenario: A user can access to create a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
     Then the "Page Overview" page is loaded
      And the text of the element "title" is equal to "Modular pages"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "url_id_input" element is displayed
      And the "authorization_selector" element is not displayed
      And the "user_group_selector" element is displayed
      And the "user_group_placeholder" textfield with "Select which users should see this content" text is displayed
      And the "user_group_clear" element is not displayed
      And the element in "0" position in the "product_type_list" list with "User related" text is displayed
      And the element in "1" position in the "product_type_list" list with "Product related" text is displayed
      And the "no_products_relevance" element is selected
      And the "tracking_screen_name_input" element is displayed
      And the text of the element "continue_button" is equal to "Continue"

  @jira.QANOV-180154 @automatic @ber @e2e @jira.cv.13.0 @jira.link.detects.CMS-2915 @o2uk @qa @smoke @web
  Scenario: A user can access to create a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
     Then the "Page Overview" page is loaded
      And the text of the element "title" is equal to "Modular pages"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "url_id_input" element is displayed
      And the "authorization_selector" element is not displayed
      And the "user_group_selector" element is displayed
      And the "user_group_placeholder" textfield with "Select which users should see this content" text is displayed
      And the "user_group_clear" element is not displayed
      And the element in "0" position in the "product_type_list" list with "User related" text is displayed
      And the element in "1" position in the "product_type_list" list with "Product related" text is displayed
      And the "no_products_relevance" element is selected
      And the "tracking_screen_name_input" element is displayed
      And the text of the element "continue_button" is equal to "Continue"

  @jira.<jira_id> @<product> @ber @e2e @jira.cv.<cv> @manual @qa @smoke @web
  Scenario Outline: A user can access to create a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
     Then the "Page Overview" page is loaded
      And the text of the element "title" is equal to "Modular pages"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "url_id_input" element is displayed
      And the "user_group_selector" element is displayed
      And the "user_group_input" element is not displayed
      And the "user_group_placeholder" textfield with "Select which users should see this content" text is displayed
      And the "user_group_clear" element is not displayed
      And the element in "0" position in the "product_type_list" list with "User related" text is displayed
      And the element in "1" position in the "product_type_list" list with "Product related" text is displayed
      And the "no_products_relevance" element is selected
      And the "module_loading_error_title" textfield with "Module loading error experience" text is displayed
      And the element in "0" position in the "module_loading_error_options" list with "Display errors" text is displayed
      And the element in "1" position in the "module_loading_error_options" list with "Display cached content" text is displayed
      And the "display_errors" element is selected
      And the "display_cached_datetime" element is not displayed
      And the text of the element "continue_button" is equal to "Continue"

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-274108 |
          | o2de    | 24.1 | QANOV-580135 |

  @jira.QANOV-180155 @automatic @ber @e2e @jira.cv.13.0 @moves @qa @smoke @web
  Scenario: A user can access to create a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
     Then the "Page Overview" page is loaded
      And the text of the element "title" is equal to "Modular pages"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "url_id_input" element is displayed
      And the "authorization_selector" element is displayed
      And the "user_group_selector" element is displayed
      And the "user_group_placeholder" textfield with "Select which users should see this content" text is displayed
      And the "user_group_clear" element is not displayed
      And the element in "0" position in the "product_type_list" list with "User related" text is displayed
      And the element in "1" position in the "product_type_list" list with "Product related" text is displayed
      And the "no_products_relevance" element is selected
      And the "tracking_screen_name_input" element is displayed
      And the text of the element "continue_button" is equal to "Continue"

  @jira.QANOV-194413 @automatic @ber @e2e @jira.cv.13.1 @moves @qa @regression @web
  Scenario: A user can see the authorization allowed values
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "authorization_selector" button
      And I wait "1" seconds
     Then the element in "0" position in the "authorization_list" list with "This page is visible to all users" text is displayed
      And the element in "1" position in the "authorization_list" list with "Only visible for admin and user of that line" text is displayed
      And the element in "2" position in the "authorization_list" list with "Only visible for admin and admin-light" text is displayed
      And the element in "3" position in the "authorization_list" list with "Only visible for admin" text is displayed

  @jira.QANOV-223833 @automatic @e2e @jira.cv.13.4 @qa @regression @vivobr @web
  Scenario: A user can see the user groups of a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "user_group_selector" button
      And waits until the "user_group_input" element is visible
      And I click on the "user_group_input" button
     Then the "user_group_list" list is displayed
      And the "user_group_list" list has ">0" elements

  @jira.QANOV-223836 @automatic @e2e @jira.cv.13.4 @qa @regression @vivobr @web
  Scenario: A user can select the user groups of a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Asuming that user group list has at least one element.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "user_group_selector" button
      And waits until the "user_group_input" element is visible
      And I click on the "user_group_input" button
      And I click on the "any" element in the "user_group_list" list
     Then the "user_group_list" list is not displayed
      And the attribute "value" of the "user_group_input" element is not empty
      And the "user_group_clear" button is displayed

  @jira.QANOV-223839 @automatic @e2e @jira.cv.13.4 @qa @regression @vivobr @web
  Scenario: A user can reset the user groups selection of a new page
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "user_group_selector" button
      And waits until the "user_group_input" element is visible
      And I click on the "user_group_input" button
      And I click on the "any" element in the "user_group_list" list
      And I click on the "user_group_clear" button
     Then the "user_group_list" list is not displayed
      And the "user_group_input" element is not displayed
      And the "user_group_clear" element is not displayed

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @regression @web
  Scenario Outline: A user who is in the Page Overview screen can select the product relevance option
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "products_relevance" button
     Then the element in "2" position in the "product_type_list" list with "Default page" text is displayed
      And the element in "3" position in the "product_type_list" list with "Single product" text is displayed
      And the element in "4" position in the "product_type_list" list with "Multiple products" text is displayed
      And the "default" element is selected
      And the "products_relevance" element is selected

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180156 |
          | o2uk    | 13.0 | QANOV-180157 |
          | moves   | 13.0 | QANOV-180158 |
          | blaude  | 13.9 | QANOV-274109 |
          | o2de    | 24.1 | QANOV-580136 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user who is in the Page Overview screen can select the unique product option
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "products_relevance" button
      And I click on the "specific_product" button
     Then the "specific_product_input" element is displayed
      And the text of the element "specific_product_warn" is equal to "You should set 'Url for your page' field before to fill this"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180159 |
          | o2uk    | 13.0 | QANOV-180160 |
          | moves   | 13.0 | QANOV-180161 |
          | blaude  | 13.9 | QANOV-274110 |
          | o2de    | 24.1 | QANOV-580137 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: The unique product warning disappears when the url id is filled
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "products_relevance" button
      And I click on the "specific_product" button
      And I fill in the "url_id_input" field with "test"
     Then the "specific_product_warn" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180162 |
          | o2uk    | 13.0 | QANOV-180163 |
          | moves   | 13.0 | QANOV-180164 |
          | blaude  | 13.9 | QANOV-274111 |
          | o2de    | 24.1 | QANOV-580138 |

  @jira.<jira_id> @<product> @e2e @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can select the Display cached content option
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "display_cached_content" button
     Then the "display_cached_datetime" checkbox is displayed
      And the text of the element "display_cached_datetime_title" is equal to "Display date and time of cached data"
      And the "display_cached_datetime" element is selected
      And the "show_info" element is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600407 |
          | o2de    | QANOV-600408 |

  @jira.<jira_id> @<product> @e2e @jira.cv.Future @manual @regression @web
  Scenario Outline: A user can see the informative modal about the cached content
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "display_cached_content" button
      And I click on the "show_info" button
     Then the "cache_info_popup" page is displayed
      And the text of the element "title" is equal to "Cached content"
      And the "description" element is displayed
      And the "image_preview" element is displayed
      And I click on the "ok_button" button
      And the "Page Overview" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600409 |
          | o2de    | QANOV-600410 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user who is in the Page Overview screen can go back to the Modular Pages screen
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "cancel_button" button
     Then the "Modular Pages" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180165 |
          | o2uk    | 13.0 | QANOV-180166 |
          | moves   | 13.0 | QANOV-180167 |
          | blaude  | 13.9 | QANOV-274112 |
          | o2de    | 24.1 | QANOV-580140 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cannot access to the second step (Content) for creating a modular page without filling the mandatory fields when the no products relevance option is selected
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "name_error" is equal to "Please, enter a name for your page"
      And the text of the element "url_id_error" is equal to "Please, enter the page url"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180168 |
          | o2uk    | 13.0 | QANOV-180169 |
          | moves   | 13.0 | QANOV-180170 |
          | blaude  | 13.9 | QANOV-274113 |
          | o2de    | 24.1 | QANOV-580141 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cannot access to the second step (Content) for creating a modular page without filling the mandatory fields when the unique product option is selected
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I click on the "specific_product" button
      And I click on the "continue_button" button
     Then the text of the element "name_error" is equal to "Please, enter a name for your page"
      And the text of the element "url_id_error" is equal to "Please, enter the page url"
      And the text of the element "specific_product_error" is equal to "Please introduce one or more products to be handled. All of those products will see this content"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180171 |
          | o2uk    | 13.0 | QANOV-180172 |
          | moves   | 13.0 | QANOV-180173 |
          | blaude  | 13.9 | QANOV-274114 |
          | o2de    | 24.1 | QANOV-580142 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cannot create a modular page with a url id that already exists
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    The list with ID '<url_id>' that the user wants to create is assumed to exist.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "url_id_input" field with "<url_id>"
      And I click on the "continue_button" button
     Then the text of the element "url_id_error" is equal to "This url already exists without product types. If you want to add other page for this url, you should add product types"

    Examples:
          | product | cv   | url_id       | jira_id      |
          | vivobr  | 13.0 | start        | QANOV-180174 |
          | o2uk    | 13.0 | consumptions | QANOV-180175 |
          | moves   | 13.0 | start        | QANOV-180176 |
          | blaude  | 13.9 | start        | QANOV-274115 |
          | o2de    | 24.1 | start        | QANOV-580143 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @smoke @web
  Scenario Outline: A user can access to the second step (Content) for creating a modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
     Then the "back_button" element is displayed
      And the text of the element "page_title_label" is equal to "Modular pages"
      And the "page_title_input" element is displayed
      And the text of the element "header_section_title" is equal to "Header"
      And the "header_section_add_module_button" element is displayed
      And the text of the element "header_section_add_module_button" is equal to "Add module"
      And the "new_section_button" element is displayed
      And the text of the element "new_section_button" is equal to "New section"
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180177 |
          | o2uk    | 13.0 | QANOV-180178 |
          | moves   | 13.0 | QANOV-180179 |
          | blaude  | 13.9 | QANOV-274116 |
          | o2de    | 24.1 | QANOV-580144 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user tries to cancel the modular page creation from the Content screen: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "cancel_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Page Content" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180180 |
          | o2uk    | 13.0 | QANOV-180181 |
          | moves   | 13.0 | QANOV-180182 |
          | blaude  | 13.9 | QANOV-274117 |
          | o2de    | 24.1 | QANOV-580145 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cancels the modular page creation from the Content screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "cancel_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "Accept" button
     Then the "Modular Pages" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180183 |
          | o2uk    | 13.0 | QANOV-180184 |
          | moves   | 13.0 | QANOV-180185 |
          | blaude  | 13.9 | QANOV-274118 |
          | o2de    | 24.1 | QANOV-580146 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user goes back to the Overview screen from the Content screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "back_button" button
     Then the "Page Overview" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180186 |
          | o2uk    | 13.0 | QANOV-180187 |
          | moves   | 13.0 | QANOV-180188 |
          | blaude  | 13.9 | QANOV-274119 |
          | o2de    | 24.1 | QANOV-580147 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cannot access to the third step (Preview) for creating a modular page without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "page_title_error" is equal to "Please, enter the page title"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180189 |
          | o2uk    | 13.0 | QANOV-180190 |
          | moves   | 13.0 | QANOV-180191 |
          | blaude  | 13.9 | QANOV-274120 |
          | o2de    | 24.1 | QANOV-580148 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the form to insert a module in any position
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "header_section_add_module" button
     Then the "Edit Module Form" page is loaded
      And the text of the element "title" is equal to "Add module"
      And the "module_selector" element has no option selected
      And the text of the element "module_title" is equal to "Module"
      And the "module_preview" element is displayed
      And the "cancel_button" element is displayed
      And the "add_module_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180192 |
          | o2uk    | 13.0 | QANOV-180193 |
          | moves   | 13.0 | QANOV-180194 |
          | blaude  | 13.9 | QANOV-274121 |
          | o2de    | 24.1 | QANOV-580149 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can't add a module without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
     Then the "Edit Module Form" page is loaded
      And I click on the "add_module_button" button
      And the text of the element "module_selector_error" is equal to "This field is required"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180204 |
          | o2uk    | 13.0 | QANOV-180205 |
          | moves   | 13.0 | QANOV-180206 |
          | blaude  | 13.9 | QANOV-274125 |
          | o2de    | 24.1 | QANOV-580150 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the module optional fields when a module is selected
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
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
     Then the "module_id" inputtext is displayed
      And the "audience_selector" inputtext is displayed
      And the "tracking_id" inputtext is displayed
      And the "testing_id" inputtext is displayed

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.1 | Consumption Counters as Cards (data_card_carousel)      | QANOV-194414 |
          | o2uk    | 13.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-194415 |
          | moves   | 13.1 | Billing cycle header (simple_header)                    | QANOV-194416 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274126 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580151 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can close the Add module form
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "close_button" button
     Then the "Page Content" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180207 |
          | o2uk    | 13.0 | QANOV-180208 |
          | moves   | 13.0 | QANOV-180209 |
          | blaude  | 13.9 | QANOV-274127 |
          | o2de    | 24.1 | QANOV-580152 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: The preview is updated when a module is selected in the add module form
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Entrypoint list" option from "module_selector" field
     Then the "preview_lists_headers" list of elements is displayed
      And the "preview_lists_links" list of elements is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180210 |
          | o2uk    | 13.0 | QANOV-180211 |
          | moves   | 13.0 | QANOV-180212 |
          | blaude  | 13.9 | QANOV-274128 |
          | o2de    | 24.1 | QANOV-580153 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.13.0 @qa @smoke @web
  Scenario Outline: A user can access to the last step (Preview) for creating a modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I fill in the "tracking_screen_name_input" field with "Test screen name"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "header_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_<module>" button
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
     Then the "Page Preview" page is loaded
      And the "cancel_button" element is displayed
      And the "save_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "page_name" is equal to "Automatic test"
      And the text of the element "screen_name" is equal to "Test screen name"
      And the text of the element "product_type" is equal to "No product relevance"
      And the text of the element "url_id" is equal to "[CONTEXT:cms_unique_id]"
      And the "create_test_button" element is displayed
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "save_and_publish_button" element is displayed
      And switches to iframe
      And the "preview" element is displayed

    Examples:
          | product | cv   | module                     | jira_id      |
          | vivobr  | 13.0 | consumption_counters_cards | QANOV-180228 |
          | o2uk    | 13.0 | header_cards_cms           | QANOV-180229 |
          | moves   | 13.0 | secure_connection          | QANOV-180230 |
          | blaude  | 13.9 | consumption_counters_cards | QANOV-274134 |
          | o2de    | 24.1 | consumption_counters_cards | QANOV-580154 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.13.5 @qa @regression @web
  Scenario Outline: A user can see the the url id as screen name when no screen name is specified
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "header_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_<module>" button
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
     Then the "Page Preview" page is loaded
      And the text of the element "screen_name" is equal to "[CONTEXT:cms_unique_id]"

    Examples:
          | product | cv   | module                     | jira_id      |
          | vivobr  | 13.0 | consumption_counters_cards | QANOV-235807 |
          | o2uk    | 13.0 | header_cards_cms           | QANOV-235808 |
          | moves   | 13.0 | secure_connection          | QANOV-235809 |
          | blaude  | 13.9 | consumption_counters_cards | QANOV-274135 |
          | o2de    | 24.1 | consumption_counters_cards | QANOV-580155 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can go back to the Content page from the Preview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
     Then the "Page Preview" page is loaded
      And I click on the "back_button" button
      And the "Page Content" page is loaded

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180231 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180232 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180233 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274136 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580157 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user tries to cancel the modular page creation from the Preview screen: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "cancel_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Page Preview" page is loaded

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180234 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180235 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180236 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274137 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580158 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cancels the modular page creation from the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "cancel_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Modular Pages" page is loaded

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180237 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180238 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180239 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274138 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580159 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the mobile preview in dark mode in the Preview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "switch_dark_mode" button
     Then the "mobile_preview" is displayed in dark mode

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180243 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180244 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180245 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274140 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580160 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @qa @smoke @web
  Scenario Outline: A user can create a modular page in DRAFT status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "header_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_<module>" button
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
     Then the "Modular Pages" page is loaded
      And the "pages_list" list is displayed
      And the item with "[CONTEXT:cms_unique_id]" text in "url_id" field in the "pages_list" list has the "status" field with "DRAFT" text

    Examples:
          | product | cv   | module                     | jira_id      |
          | vivobr  | 13.0 | consumption_counters_cards | QANOV-180249 |
          | o2uk    | 13.0 | header_cards_cms           | QANOV-180250 |
          | moves   | 13.0 | secure_connection          | QANOV-180251 |
          | blaude  | 13.9 | consumption_counters_cards | QANOV-274142 |
          | o2de    | 24.1 | consumption_counters_cards | QANOV-580161 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can't create a test with an invalid user ID
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED,PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "create_test" button
      And the "Create Test" page is loaded
      And I fill in the "user_id" field with "bla"
      And I click on the "save_test" button
     Then the text of the element "user_id_error" is equal to "The user IDs allowed are numeric values"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180252 |
          | o2uk    | 13.0 | QANOV-180253 |
          | moves   | 13.0 | QANOV-180254 |
          | blaude  | 13.9 | QANOV-274143 |
          | o2de    | 24.1 | QANOV-580162 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can create a test on a modular page in <status> status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "<status>" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "create_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa"
      And I fill in the "user_id" field with "12345678"
      And I click on the "save_test" button
     Then the "Page Preview" page is loaded
      And the text of the element "success_feedback" is equal to "Test has been saved"
      And the "<status>" tab is displayed
      And the "test" tab is displayed
      And the "test" tab is selected
      And the text of the element "test_module_title" is equal to "Test ongoing"
      And the "cancel_button" button is displayed
      And the "save_and_publish" button is not displayed
      And the "delete_test_button" button is displayed
      And the "edit_test_button" button is displayed

    Examples:
          | product | cv   | status    | jira_id      |
          | vivobr  | 13.0 | paused    | QANOV-180255 |
          | vivobr  | 13.0 | published | QANOV-180256 |
          | o2uk    | 13.0 | paused    | QANOV-180257 |
          | o2uk    | 13.0 | published | QANOV-180258 |
          | moves   | 13.0 | paused    | QANOV-180259 |
          | moves   | 13.0 | published | QANOV-180260 |
          | blaude  | 13.9 | paused    | QANOV-274144 |
          | blaude  | 13.9 | published | QANOV-274145 |
          | o2de    | 24.1 | paused    | QANOV-580163 |
          | o2de    | 24.1 | published | QANOV-580164 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user sees a confirmation popup when trying to discard a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "delete_test_button" button
     Then the "Confirm Popup" element is displayed
      And the text of the element "title" is equal to "Are you sure you want to discard your test?"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Confirm"
      And I click on the "cancel" button
      And the "Page Preview" page is loaded
      And the "delete_test_button" button is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180261 |
          | o2uk    | 13.0 | QANOV-180262 |
          | moves   | 13.0 | QANOV-180263 |
          | blaude  | 13.9 | QANOV-274146 |
          | o2de    | 24.1 | QANOV-580166 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user confirms the discarding of a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "delete_test_button" button
      And the "Confirm Popup" element is displayed
      And I click on the "accept" button
     Then the "Page Preview" page is loaded
      And the text of the element "success_feedback" is equal to "Test deleted"
      And the "delete_test_button" button is not displayed
      And the "test" tab is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180264 |
          | o2uk    | 13.0 | QANOV-180265 |
          | moves   | 13.0 | QANOV-180266 |
          | blaude  | 13.9 | QANOV-274147 |
          | o2de    | 24.1 | QANOV-580167 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see a confirmation popup if he wants to publish a modular page in the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And the text of the element "title" is equal to "Publish changes"
      And the text of the element "message" is equal to "Publishing this page may affect production. Are you sure?"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "confirm" is equal to "Confirm"

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180267 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180268 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180269 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274148 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580168 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cancels the publishing of a modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is displayed
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "cancel" button
     Then the "Page Preview" page is loaded
      And the "confirm_message" element is not displayed

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180270 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180271 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180272 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274149 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580170 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @qa @smoke @web
  Scenario Outline: A user confirms the publishing of a modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "header_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_<module>" button
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "new_section_button" button
      And the "Edit Section Form" page is loaded
      And I fill in the "internal_name_input" field with "Main Section"
      And I click on the "add_section" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I wait "2" seconds
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And waits until the "confirm" element is visible
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Page has been published"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And the "pages_list" list is displayed
      And the item with "[CONTEXT:cms_unique_id]" text in "url_id" field in the "pages_list" list has the "status" field with "PUBLISHED" text

    Examples:
          | product | cv   | module                     | jira_id      |
          | vivobr  | 13.0 | consumption_counters_cards | QANOV-180273 |
          | o2uk    | 13.0 | header_cards_cms           | QANOV-180274 |
          | moves   | 13.0 | secure_connection          | QANOV-180275 |
          | blaude  | 13.9 | consumption_counters_cards | QANOV-274150 |
          | o2de    | 24.1 | consumption_counters_cards | QANOV-580171 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see a confirmation popup if she pauses a PUBLISHED modular page from the edition page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "pause_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "message" is equal to "Pause your page?"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Confirm"
      And I click on the "cancel" button
      And the "Modular Pages" page is loaded
      And the "pause_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180276 |
          | o2uk    | 13.0 | QANOV-180277 |
          | moves   | 13.0 | QANOV-180278 |
          | blaude  | 13.9 | QANOV-274151 |
          | o2de    | 24.1 | QANOV-580172 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user confirms the pausing of a published modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "pause_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Modular Pages" page is loaded
      And the "pause_button" element is not displayed
      And the text of the element "confirm_message" is equal to "Page paused"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And the "pages_list" list is displayed
      And the item with "test" text in "url_id" field in the "pages_list" list has the "status" field with "PAUSED" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180279 |
          | o2uk    | 13.0 | QANOV-180280 |
          | moves   | 13.0 | QANOV-180281 |
          | blaude  | 13.9 | QANOV-274152 |
          | o2de    | 24.1 | QANOV-580173 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can perform several actions in a DRAFT modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_edit_page_conditions_button" is equal to "Edit page conditions"
      And the text of the element "more_options_add_page" is equal to "Add new page"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180282 |
          | o2uk    | 13.0 | QANOV-180283 |
          | moves   | 13.0 | QANOV-180284 |
          | blaude  | 13.9 | QANOV-274153 |
          | o2de    | 24.1 | QANOV-580174 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can perform several actions in a PAUSED modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in "PAUSED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_edit_page_conditions_button" is equal to "Edit page conditions"
      And the text of the element "more_options_publish_button" is equal to "Publish"
      And the text of the element "more_options_add_page" is equal to "Add new page"
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180285 |
          | o2uk    | 13.0 | QANOV-180286 |
          | moves   | 13.0 | QANOV-180287 |
          | blaude  | 13.9 | QANOV-274154 |
          | o2de    | 24.1 | QANOV-580175 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can perform several actions in a PAUSED TEST modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in "UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_edit_page_conditions_button" is equal to "Edit page conditions"
      And the text of the element "more_options_edit_test_button" is equal to "Edit test informaion"
      And the text of the element "more_options_discard_test_button" is equal to "Discard test"
      And the text of the element "more_options_add_page" is equal to "Add new page"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180288 |
          | o2uk    | 13.0 | QANOV-180289 |
          | moves   | 13.0 | QANOV-180290 |
          | blaude  | 13.9 | QANOV-274155 |
          | o2de    | 24.1 | QANOV-580176 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can access to edit a modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,PUBLISHED,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_edit_button" element
     Then the "Page Overview" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180291 |
          | o2uk    | 13.0 | QANOV-180292 |
          | moves   | 13.0 | QANOV-180293 |
          | blaude  | 13.9 | QANOV-274156 |
          | o2de    | 24.1 | QANOV-580177 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.4 @manual @regression @web
  Scenario Outline: A user can access to edit the conditions of a <status> modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "<status>" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_edit_page_conditions_button" element
     Then the "Edit Page Conditions" page is loaded
      And the text of the element "title" contains "Edit page conditions for:"
      And the text of the element "name_input" is equal to "[CONTEXT:modular_page.metadata.internalName]"
      And the element in "0" position in the "product_type_list" list with "No products relevance" text is displayed
      And the element in "1" position in the "product_type_list" list with "Products relevance" text is displayed
      And the text of the element "confirm" is equal to "<button_text>"

    Examples:
          | product | cv   | status            | button_text     | jira_id      |
          | vivobr  | 13.0 | DRAFT,UNPUBLISHED | Apply Changes   | QANOV-224058 |
          | vivobr  | 13.0 | PUBLISHED         | Publish Changes | QANOV-224059 |
          | o2uk    | 13.0 | DRAFT,UNPUBLISHED | Apply Changes   | QANOV-224061 |
          | o2uk    | 13.0 | PUBLISHED         | Publish Changes | QANOV-224063 |
          | moves   | 13.0 | DRAFT,UNPUBLISHED | Apply Changes   | QANOV-224064 |
          | moves   | 13.0 | PUBLISHED         | Publish Changes | QANOV-224066 |
          | blaude  | 13.9 | DRAFT,UNPUBLISHED | Apply Changes   | QANOV-274157 |
          | blaude  | 13.9 | PUBLISHED         | Publish Changes | QANOV-274158 |
          | o2de    | 24.1 | DRAFT,UNPUBLISHED | Apply Changes   | QANOV-580178 |
          | o2de    | 24.1 | PUBLISHED         | Publish Changes | QANOV-580179 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.4 @manual @regression @web
  Scenario Outline: A user can save the conditions of a modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" modular pages configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_edit_page_conditions_button" element
      And the "Edit Page Conditions" page is loaded
      And I fill in the "name_input" field with "Test update page conditions"
      And I click on a different product type button
      And I click on the "confirm" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-224067 |
          | o2uk    | 13.0 | QANOV-224069 |
          | moves   | 13.0 | QANOV-224070 |
          | blaude  | 13.9 | QANOV-274161 |
          | o2de    | 24.1 | QANOV-580180 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can publish a modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_publish_button" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" web button
     Then the "Modular Pages" page is loaded
      And the item with "test" text in "url_id" field in the "pages_list" list has the "status" field with "PUBLISHED" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180294 |
          | o2uk    | 13.0 | QANOV-180295 |
          | moves   | 13.0 | QANOV-180296 |
          | blaude  | 13.9 | QANOV-274163 |
          | o2de    | 24.1 | QANOV-580181 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can pause a modular page from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_pause_button" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" web button
     Then the "Modular Pages" page is loaded
      And the item with "test" text in "url_id" field in the "pages_list" list has the "status" field with "PAUSED" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180297 |
          | o2uk    | 13.0 | QANOV-180298 |
          | moves   | 13.0 | QANOV-180299 |
          | blaude  | 13.9 | QANOV-274164 |
          | o2de    | 24.1 | QANOV-580182 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can discard a modular page test from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_discard_test_button" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" web button
     Then the "Modular Pages" page is loaded
      And the item with "test" text in "url_id" field in the "pages_list" list has the "status" field with "PAUSED" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-223842 |
          | o2uk    | 13.0 | QANOV-223843 |
          | moves   | 13.0 | QANOV-223844 |
          | blaude  | 13.9 | QANOV-274165 |
          | o2de    | 24.1 | QANOV-580183 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can access to edit a modular page test information from the Modular Pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_edit_test_button" element
     Then the "Page Overview" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-223845 |
          | o2uk    | 13.0 | QANOV-223846 |
          | moves   | 13.0 | QANOV-223847 |
          | blaude  | 13.9 | QANOV-274166 |
          | o2de    | 24.1 | QANOV-580184 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user that edits a modular page with test information from the Modular Pages management screen can see two tabs
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "<cms_status>" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "more_options" element on the configured modular page
      And I click on the "more_options_edit_button" element
     Then the "Page Overview" page is loaded
      And the "<status_tab>" tab with "<status_text>" text is displayed
      And the "test" tab with "Test" text is displayed
      And the "test" tab is selected

    Examples:
          | product | cv   | cms_status       | status_tab | status_text | jira_id      |
          | vivobr  | 13.0 | UNPUBLISHED_TEST | paused     | Paused      | QANOV-223848 |
          | vivobr  | 13.0 | TEST             | published  | Published   | QANOV-223849 |
          | o2uk    | 13.0 | UNPUBLISHED_TEST | paused     | Paused      | QANOV-223850 |
          | o2uk    | 13.0 | TEST             | published  | Published   | QANOV-223851 |
          | moves   | 13.0 | UNPUBLISHED_TEST | paused     | Paused      | QANOV-223852 |
          | moves   | 13.0 | TEST             | published  | Published   | QANOV-223853 |
          | blaude  | 13.9 | UNPUBLISHED_TEST | paused     | Paused      | QANOV-274167 |
          | blaude  | 13.9 | TEST             | published  | Published   | QANOV-274168 |
          | o2de    | 24.1 | UNPUBLISHED_TEST | paused     | Paused      | QANOV-580185 |
          | o2de    | 24.1 | TEST             | published  | Published   | QANOV-580186 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can edit a modular page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" element
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST2"
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-180300 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-180301 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-180302 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274169 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580187 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can filter by name in the Modular pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "several" modular pages configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I fill in the "filter_by_name" field with "Test"
      And I wait "1" seconds
     Then each element in the "pages_list" list has the "url_id" field that contains "Test" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180303 |
          | o2uk    | 13.0 | QANOV-180304 |
          | moves   | 13.0 | QANOV-180305 |
          | blaude  | 13.9 | QANOV-274170 |
          | o2de    | 24.1 | QANOV-580188 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can filter by url ID in the Modular pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "several" modular pages configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I fill in the "filter_by_url_id" field with "test"
      And I wait "1" seconds
     Then each element in the "pages_list" list has the "url_id" field that contains "test" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180306 |
          | o2uk    | 13.0 | QANOV-180307 |
          | moves   | 13.0 | QANOV-180308 |
          | blaude  | 13.9 | QANOV-274171 |
          | o2de    | 24.1 | QANOV-580189 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can filter by status in the Modular pages management screen
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "several" modular pages configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I select the "PUBLISHED" option from "filter_by_status" field
      And I wait "1" seconds
     Then each element in the "pages_list" list has the "status" field that contains "PUBLISHED" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-180309 |
          | o2uk    | 13.0 | QANOV-180310 |
          | moves   | 13.0 | QANOV-180311 |
          | blaude  | 13.9 | QANOV-274172 |
          | o2de    | 24.1 | QANOV-580190 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can configure an <cms> module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "<cms>" option from "module_selector" field
      And I replace the "module_id_input" field value with "cms-module-test"
      And I select the "postpay" option from "audience_selector" field
      And I click on the "ok" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | cms                                                     | cv   | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | 13.0 | QANOV-182879 |
          | vivobr  | 13.0 | Extras                                                  | 13.0 | QANOV-182880 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | 13.0 | QANOV-182881 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | 13.0 | QANOV-182882 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | 13.9 | QANOV-274173 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | 24.1 | QANOV-580191 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can configure an Alerts module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Alerts" option from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I replace the "module_id_input" field value with "cms-module-test"
      And I fill in the "alert_id_input" field with "alert-test"
      And I select the "postpay" option from "audience_selector" field
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182883 |
          | o2uk    | 13.0 | QANOV-182884 |
          | moves   | 13.0 | QANOV-182885 |
          | blaude  | 13.9 | QANOV-274174 |
          | o2de    | 24.1 | QANOV-580192 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the options to configure an Action Row module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Action Row" option from "module_selector" field
     Then the "Edit Module Form" page is loaded
      And the "module_id_input" element is displayed
      And the "audience_selector" element is displayed
      And the "module_content_title" element is displayed
      And the "icon_title" textfield with "Icon (optional)" text is displayed
      And the "icon_add_button" element is displayed
      And the "dark_icon_title" textfield with "Icon Dark mode (optional)" text is displayed
      And the "dark_icon_add_button" element is displayed
      And the "link_selector" element is displayed
      And the "link_url_input" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225772 |
          | o2uk    | 13.3 | QANOV-225773 |
          | moves   | 13.3 | QANOV-225774 |
          | blaude  | 13.9 | QANOV-274175 |
          | o2de    | 24.1 | QANOV-580193 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can configure an Action Row module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I replace the "module_id_input" field value with "cms-module-test"
      And I select the "postpay" option from "audience_selector" field
      And I fill in the "module_content_title" field with "cms-module-test-content"
      And I select the "URL" option from "link_selector" field
      And I fill in the "link_url_input" field with "https://www.google.com"
      And I click on the "ok" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225775 |
          | o2uk    | 13.3 | QANOV-225776 |
          | moves   | 13.3 | QANOV-225777 |
          | blaude  | 13.9 | QANOV-274176 |
          | o2de    | 24.1 | QANOV-580195 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can see the different options to upload a <icon_type> in an Action Row module
    The user has the option to add the icon from a library (from Mística) or add an SVG or PNG image from his computer.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Action Row" option from "module_selector" field
      And I click on the "<icon_type>_add_button" element
     Then the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And the text of the element "title" is equal to "Add icon"
      And the text of the element "upload_from_computer_link" is equal to "Upload from computer"
      And the "search_input" element is displayed
      And the "icons_list" element is displayed
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "add_button" is equal to "Add"

    Examples:
          | product | cv   | icon_type | jira_id      |
          | vivobr  | 13.3 | icon      | QANOV-225778 |
          | o2uk    | 13.3 | icon      | QANOV-225779 |
          | moves   | 13.3 | icon      | QANOV-225780 |
          | blaude  | 13.9 | icon      | QANOV-274177 |
          | o2de    | 24.1 | icon      | QANOV-580197 |
          | vivobr  | 13.3 | dark_icon | QANOV-225781 |
          | o2uk    | 13.3 | dark_icon | QANOV-225782 |
          | moves   | 13.3 | dark_icon | QANOV-225783 |
          | blaude  | 13.9 | dark_icon | QANOV-274178 |
          | o2de    | 24.1 | dark_icon | QANOV-580198 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can upload an icon from a library in an Action Row
    If I add an icon from the gallery, then the icon for dark mode is autofilled with that same icon.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "0" element in the "icons_list" list
      And I click on the "add_button" web button
     Then the "Edit Module Form" page is loaded
      And the "icon" element is displayed
      And the "icon_change_button" element is displayed
      And the "icon_remove_button" element is displayed
      And the "icon_add_button" element is not displayed
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225784 |
          | o2uk    | 13.3 | QANOV-225785 |
          | moves   | 13.3 | QANOV-225786 |
          | blaude  | 13.9 | QANOV-274179 |
          | o2de    | 24.1 | QANOV-580199 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can upload an icon from computer in an Action Row module (SVG format)
    The user has the option to add the icon from a library (from Mística) or add an SVG or PNG image from his computer.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.svg"
     Then the "Edit Module Form" page is loaded
      And the "icon" element is displayed
      And the "icon_change_button" element is displayed
      And the "icon_remove_button" element is displayed
      And the "icon_add_button" element is not displayed
      And the "dark_icon" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225787 |
          | o2uk    | 13.3 | QANOV-225788 |
          | moves   | 13.3 | QANOV-225789 |
          | blaude  | 13.9 | QANOV-274180 |
          | o2de    | 24.1 | QANOV-580200 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can upload an icon from computer in an Action Row module (PNG format)
    The user has the option to add the icon from a library (from Mística) or add an SVG or PNG image from his computer.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.png"
      And the "Select Png Icon" page is loaded
      And I click on the "select_button" web button
     Then the "Edit Module Form" page is loaded
      And the "icon" element is displayed
      And the "icon_change_button" element is displayed
      And the "icon_remove_button" element is displayed
      And the "icon_add_button" element is not displayed
      And the "dark_icon" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225790 |
          | o2uk    | 13.3 | QANOV-225791 |
          | moves   | 13.3 | QANOV-225792 |
          | blaude  | 13.9 | QANOV-274181 |
          | o2de    | 24.1 | QANOV-580201 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.3 @manual @regression @web
  Scenario Outline: A user can change an icon from library in an Action Row
    If updated the icon from library, the dark mode icon is also updated accordingly
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.svg"
      And the "Edit Module Form" page is loaded
      And I click on the "icon_change_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "0" element in the "icons_list" list
      And I click on the "add_button" web button
     Then the "Edit Module Form" page is loaded
      And the "icon" element is displayed
      And the "icon_change_button" element is displayed
      And the "icon_remove_button" element is displayed
      And the "icon_add_button" element is not displayed
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225793 |
          | o2uk    | 13.3 | QANOV-225794 |
          | moves   | 13.3 | QANOV-225795 |
          | blaude  | 13.9 | QANOV-274182 |
          | o2de    | 24.1 | QANOV-580202 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can change an icon from computer in an Action Row (SVG format)
    If updating the icon, the dark mode one is reset
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "0" element in the "icons_list" list
      And I click on the "add_button" web button
      And the "Edit Module Form" page is loaded
      And I click on the "icon_change_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.svg"
     Then the "Edit Module Form" page is loaded
      And the "icon" element is displayed
      And the "icon_change_button" element is displayed
      And the "icon_remove_button" element is displayed
      And the "icon_add_button" element is not displayed
      And the "dark_icon" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225796 |
          | o2uk    | 13.3 | QANOV-225797 |
          | moves   | 13.3 | QANOV-225798 |
          | blaude  | 13.9 | QANOV-274183 |
          | o2de    | 24.1 | QANOV-580203 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can change an icon from computer in an Action Row (PNG format)
    If updating the icon, the dark mode one is reset
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visiblet
      And I click on the "0" element in the "icons_list" list
      And I click on the "add_button" web button
      And the "Edit Module Form" page is loaded
      And I click on the "icon_change_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.png"
      And the "Select Png Icon" page is loaded
      And I click on the "select_button" web button
     Then the "Edit Module Form" page is loaded
      And the "icon" element is displayed
      And the "icon_change_button" element is displayed
      And the "icon_remove_button" element is displayed
      And the "icon_add_button" element is not displayed
      And the "dark_icon" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225799 |
          | o2uk    | 13.3 | QANOV-225800 |
          | moves   | 13.3 | QANOV-225801 |
          | blaude  | 13.9 | QANOV-274184 |
          | o2de    | 24.1 | QANOV-580204 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can upload a dark icon from a library in an Action Row
    Uploading the dark icon does not affect the other icon
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "dark_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "0" element in the "icons_list" list
      And I click on the "add_button" web button
     Then the "Edit Module Form" page is loaded
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225802 |
          | o2uk    | 13.3 | QANOV-225803 |
          | moves   | 13.3 | QANOV-225804 |
          | blaude  | 13.9 | QANOV-274185 |
          | o2de    | 24.1 | QANOV-580205 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can upload a dark icon from computer in an Action Row module (SVG format)
    The user has the option to add the dark icon from a library (from Mística) or add an SVG or PNG image from his computer.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "dark_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.svg"
     Then the "Edit Module Form" page is loaded
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225805 |
          | o2uk    | 13.3 | QANOV-225806 |
          | moves   | 13.3 | QANOV-225807 |
          | blaude  | 13.9 | QANOV-274186 |
          | o2de    | 24.1 | QANOV-580206 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can upload a dark icon from computer in an Action Row module (PNG format)
    The user has the option to add the dark icon from a library (from Mística) or add an SVG or PNG image from his computer.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "dark_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.png"
      And the "Select Png Icon" page is loaded
      And I click on the "select_button" web button
     Then the "Edit Module Form" page is loaded
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225808 |
          | o2uk    | 13.3 | QANOV-225809 |
          | moves   | 13.3 | QANOV-225810 |
          | blaude  | 13.9 | QANOV-274187 |
          | o2de    | 24.1 | QANOV-580207 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can remove an icon in an Action Row module
    Removing the icon does also remove the dark icon
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.svg"
      And the "Edit Module Form" page is loaded
      And I click on the "icon_delete_button" element
     Then the "icon" element is not displayed
      And the "icon_change_button" element is not displayed
      And the "icon_remove_button" element is not displayed
      And the "icon_add_button" element is displayed
      And the "dark_icon" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225811 |
          | o2uk    | 13.3 | QANOV-225812 |
          | moves   | 13.3 | QANOV-225813 |
          | blaude  | 13.9 | QANOV-274190 |
          | o2de    | 24.1 | QANOV-580208 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can remove a dark icon in an Action Row module
    Removing the dar icon does not affect the other icon
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "dark_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons.svg"
      And the "Edit Module Form" page is loaded
      And I click on the "dark_icon_delete_button" element
     Then the "dark_icon" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225814 |
          | o2uk    | 13.3 | QANOV-225815 |
          | moves   | 13.3 | QANOV-225816 |
          | blaude  | 13.9 | QANOV-274193 |
          | o2de    | 24.1 | QANOV-580209 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can search for an icon of a library in an Action Row
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "search_icon" field with "phone"
      And waits until the "icons_list" element is clickable
     Then each element in the "icons_list" list has the "category" field that contains "phone" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225817 |
          | o2uk    | 13.3 | QANOV-225818 |
          | moves   | 13.3 | QANOV-225819 |
          | blaude  | 13.9 | QANOV-274194 |
          | o2de    | 24.1 | QANOV-580210 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can select the color of an icon of the library in an Action Row
    There is a default color and a brand color that can be applied to the library icons
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Action Row" option from "module_selector" field
      And I click on the "icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I select the "Brand color" option from "color_selector" field
     Then each element in the "icons_list" list has the "color" of the brand

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-225820 |
          | o2uk    | 13.3 | QANOV-225821 |
          | moves   | 13.3 | QANOV-225822 |
          | blaude  | 13.9 | QANOV-274195 |
          | o2de    | 24.1 | QANOV-580212 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can open the <cms> CMS from the Modular pages CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "<cms>" option from "module_selector" field
      And I click on the "list_to_render" button
      And I select the "list_to_render_first_option" option from "list_to_render" field
      And I click on the "go_to_cms_link" button
      And I switch to the new window
     Then the current URL contains "[CONF:cms.base]<url>/management?id="
      And I switch back to the default window

    Examples:
          | product | cv   | cms                                         | cv   | url                                    | jira_id      |
          | vivobr  | 13.0 | Entrypoints list (background_card_carousel) | 13.0 | [CONF:cms.entrypoint_lists_management] | QANOV-182886 |
          | vivobr  | 13.0 | Extras (snap_card_carousel)                 | 13.0 | [CONF:cms.extras_lists_management]     | QANOV-182887 |
          | o2uk    | 13.0 | Entrypoints list (row_lists)                | 13.0 | [CONF:cms.entrypoint_lists_management] | QANOV-182888 |
          | moves   | 13.0 | Entrypoints list (row_lists)                | 13.0 | [CONF:cms.entrypoint_lists_management] | QANOV-182889 |
          | blaude  | 13.9 | Entrypoints list (row_lists)                | 13.9 | [CONF:cms.entrypoint_lists_management] | QANOV-274196 |
          | o2de    | 24.1 | Entrypoints list (row_lists)                | 24.1 | [CONF:cms.entrypoint_lists_management] | QANOV-580214 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can open the Alerts CMS from the Modular pages CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "Alerts" option from "module_selector" field
      And I fill in the "alert_id" field with "test"
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "go_to_cms_link" button
      And I switch to the new window
     Then the current URL contains "[CONF:cms.base][CONF:cms.alerts]/management?id="
      And I switch back to the default window

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182890 |
          | o2uk    | 13.0 | QANOV-182891 |
          | moves   | 13.0 | QANOV-182892 |
          | blaude  | 13.9 | QANOV-274197 |
          | o2de    | 24.1 | QANOV-580215 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.14.0 @qa @regression @web @fixture.cms.page.not_published
  Scenario Outline: A user can configure a dynamic content module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "Modular Page No Published" modular page is in "DRAFT" status
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And clicks on any element in the "pages_list" list with the "url_id" field that contains the "[CONTEXT:modular_page_url_id]" text
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "<dynamic_content_module_element>" button
      And waits until the "<dynamic_content_selector_element>" element is present
      And I click on the "<dynamic_content_selector_element>" element
      And I click on the "0" element in the "dynamic_content_selector_list" list
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And the "main_section_modules_name_list" elements list contains the text "<dynamic_content_module_name>"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | dynamic_content_module_element             | dynamic_content_selector_element    | dynamic_content_module_name | jira_id      |
          | vivobr  | module_selector_dynamic_content_empty_case | dynamic_content_empty_case_selector | dynamic-content-empty-case  | QANOV-309943 |
          | o2uk    | module_selector_dynamic_content_empty_case | dynamic_content_empty_case_selector | dynamic-content-empty-case  | QANOV-309944 |
          | moves   | module_selector_dynamic_content            | dynamic_content_selector            | dynamic-content             | QANOV-309945 |
          | blaude  | module_selector_dynamic_content            | dynamic_content_selector            | dynamic-content             | QANOV-309946 |
          | o2de    | module_selector_dynamic_content            | dynamic_content_selector            | dynamic-content             | QANOV-580216 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: The module ID field is autofilled when a module is selected
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" button
      And I select the "<module>" option from "module_selector" field
      And I click on the "add_module" button
     Then text of the element "module_id" is equal to "<module_id>"

    Examples:
          | product | cv   | module                                                  | module_id                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | consumption-counters-cards | QANOV-182893 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | consumption-counters-cards | QANOV-182894 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | billing-cycle-header       | QANOV-182895 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | consumption-counters-cards | QANOV-274198 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | consumption-counters-cards | QANOV-580217 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.13.0 @jira.link.detects.ACCOUNT-20053 @qa @smoke @web
  @fixture.cms.page.not_published
  Scenario Outline: A user can add a configurable module with manual URL
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "Modular Page No Published" modular page is in "DRAFT" status
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And clicks on any element in the "pages_list" list with the "url_id" field that contains the "[CONTEXT:modular_page_url_id]" text
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_highlighted_card" button
      And I fill in the "highlighted_card_module_title_input" field with "Module test title"
      And I fill in the "highlighted_card_title_input" field with "Card test title"
      And I fill in the "highlighted_card_description_input" field with "Card test description"
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons_dark.svg"
      And I click on the "image_fit_selector" web button
      And waits until the "image_fit_value" element is visible
      And I click on the "image_fit_value" web button
      And I fill in the "highlighted_card_button_text" field with "Card test action"
      And I click on the "button_type_selector" web button
      And I click on the "button_type_primary" web button
      And I select the "full" value from "url_type_selector" field
      And I fill in the "url_address" field with "https://test.com"
      And I click on the "tracking_tab" web button
      And I fill in the "tracking_id" field with "test"
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I click on the "audience_selector_first_element" button
      And I click on the "qa_tab" button
      And I fill in the "testing_id" field with "test"
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-182896 |
          | o2uk    | QANOV-182897 |
          | moves   | QANOV-182898 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @qa @smoke @web
  @fixture.cms.page.not_published
  Scenario Outline: A user can add a configurable module with manual URL
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "Modular Page No Published" modular page is in "DRAFT" status
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" list is displayed
      And clicks on any element in the "pages_list" list with the "url_id" field that contains the "[CONTEXT:modular_page_url_id]" text
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_tariff_summary" button
      And I select the "full" value from "url_type_selector" field
      And I fill in the "url_address" field with "https://test.com"
      And I fill in the "link_text" field with "test"
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-274199 |
          | o2de    | 24.1 | QANOV-580218 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  @fixture.cms.page.not_published
  Scenario Outline: A user can add a configurable module with preconfigured URL
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "Modular Page No Published" modular page is in "DRAFT" status
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And clicks on any element in the "pages_list" list with the "url_id" field that contains the "[CONTEXT:modular_page_url_id]" text
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "module_selector_highlighted_card" button
      And I click on the "audience_selector" element
      And I click on the "audience_selector_first_element" button
      And I fill in the "highlighted_card_module_title_input" field with "Module test title"
      And I fill in the "highlighted_card_title_input" field with "Card test title"
      And I fill in the "highlighted_card_description_input" field with "Card test description"
      And I fill in the "upload_file_input" field with file path "resources/cms/boltons_dark.svg"
      And I fill in the "highlighted_card_button_text" field with "Card test action"
      And I select the "primary" value from "button_type_selector" field
      And I select the "preconfigured" value from "url_type_selector" field
      And I select the "<link>" value from "url_id_selector" field
      And I fill in the "tracking_id" field with "test"
      And I fill in the "testing_id" field with "test"
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | link          | jira_id      |
          | vivobr  | 13.4 | balance       | QANOV-226745 |
          | o2uk    | 13.4 | add_boltons   | QANOV-226746 |
          | moves   | 13.4 | android_store | QANOV-226747 |
          | blaude  | 13.9 | balance       | QANOV-274200 |
          | o2de    | 24.1 | balance       | QANOV-580219 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user see the new module in the Content screen preview
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I select the "postpay" option from "audience_selector" field
      And I fill in the "module_title_input" field with "Module test title"
      And I fill in the "card_title_input" field with "Card test title"
      And I fill in the "card_description_input" field with "Card test description"
      And I select the "fit" option from "image_size" field
      And I fill in the "button_text_input" field with "Card test action"
      And I select the "link" option from "button_type" field
      And I select the "productsSummaryUrl" option from "account_url_id" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
     Then the text of the element "preview_module_title" is equal to "Module test title"
      And the text of the element "preview_card_title" is equal to "Card test title"
      And the text of the element "preview_card_description" is equal to "Card test description"
      And the text of the element "preview_card_button" is equal to "Card test action"

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-182899 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-182900 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-182901 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274201 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580220 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user see the new module in the Mobile version in the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" option from "module_selector" field
      And I select the "postpay" option from "audience_selector" field
      And I fill in the "module_title_input" field with "Module test title"
      And I fill in the "card_title_input" field with "Card test title"
      And I fill in the "card_description_input" field with "Card test description"
      And I select the "fit" option from "image_size" field
      And I fill in the "button_text_input" field with "Card test action"
      And I select the "link" option from "button_type" field
      And I select the "productsSummaryUrl" option from "account_url_id" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
     Then the text of the element "preview_module_title" is equal to "Module test title"
      And the text of the element "preview_card_title" is equal to "Card test title"
      And the text of the element "preview_card_description" is equal to "Card test description"
      And the text of the element "preview_card_button" is equal to "Card test action"

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-182905 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-182906 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-182907 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-274203 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580221 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add more than one modules to the main section
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "<module>" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
     Then the "main_section_add_module_button" element is displayed

    Examples:
          | product | cv   | module                                                  | jira_id      |
          | vivobr  | 13.0 | Consumption Counters as Cards (data_card_carousel)      | QANOV-310308 |
          | o2uk    | 13.0 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310309 |
          | moves   | 13.0 | Billing cycle header (simple_header)                    | QANOV-310310 |
          | blaude  | 13.9 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-310311 |
          | o2de    | 24.1 | Data Consumption Counters as Cards (data_card_carousel) | QANOV-580222 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user cannot add more than one module to the header section
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "header_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I select the "Start tab Header Cards (CMS)" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
     Then the "header_section_add_module_button" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182911 |
          | o2uk    | 13.0 | QANOV-182913 |
          | moves   | 13.0 | QANOV-182915 |
          | blaude  | 13.9 | QANOV-274205 |
          | o2de    | 24.1 | QANOV-580223 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can edit a module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS with modules
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_first_standalone_module_more_options" button
      And I click on the "edit_module" button
      And the "Edit Module Form" page is loaded
      And I fill in the "tracking_id" field with "tracking id updated"
      And I fill in the "testing_id" field with "testing id updated"
      And I click on the "save_button" button
      And the "Page Content" page is loaded
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182917 |
          | o2uk    | 13.0 | QANOV-182918 |
          | moves   | 13.0 | QANOV-182919 |
          | blaude  | 13.9 | QANOV-274207 |
          | o2de    | 24.1 | QANOV-580224 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can remove a module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS with modules
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_first_standalone_module_more_options" button
      And I click on the "delete_module" button
     Then the removed module is not displayed in the modules list
      And the removed module is not displayed in the preview
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182923 |
          | o2uk    | 13.0 | QANOV-182924 |
          | moves   | 13.0 | QANOV-182925 |
          | blaude  | 13.9 | QANOV-274208 |
          | o2de    | 24.1 | QANOV-580225 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can disable a module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS with modules in "enabled" status
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "disable_button" button on the enabled module
     Then the "enabled_switch" element is disabled
      And the disabled module is not displayed in the preview
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182926 |
          | o2uk    | 13.0 | QANOV-182927 |
          | moves   | 13.0 | QANOV-182928 |
          | blaude  | 13.9 | QANOV-274209 |
          | o2de    | 24.1 | QANOV-580226 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can enable a module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status configured in CMS with modules in "disabled" status
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "enable_button" button on the disabled module
     Then the "enabled_switch" element is enabled
      And the enabled module is displayed in the preview
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182929 |
          | o2uk    | 13.0 | QANOV-182930 |
          | moves   | 13.0 | QANOV-182931 |
          | blaude  | 13.9 | QANOV-274210 |
          | o2de    | 24.1 | QANOV-580227 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can reorder the modules in the Content screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are modular pages in any of "DRAFT,UNPUBLISHED" status with modules configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And moves some modules in the "modules_list" list
     Then the "modules_list" list has the new order
      And the modules in preview have the new order
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182932 |
          | o2uk    | 13.0 | QANOV-182933 |
          | moves   | 13.0 | QANOV-182934 |
          | blaude  | 13.9 | QANOV-274212 |
          | o2de    | 24.1 | QANOV-580228 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @qa @smoke @web
  Scenario Outline: A user can create a modular page for a specific product
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "products_relevance" button
      And I click on the "specific_product" button
      And I fill in the "specific_product_input" field with "mobile"
      And I press the Enter key on "specific_product_input" field
      And I fill in the "specific_product_input" field with "internet"
      And I press the Enter key on "specific_product_input" field
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
     Then the "Page Preview" page is loaded
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "page_name" is equal to "Automatic test"
      And the text of the element "product_type" is equal to "Product relevance - Unique product, one of: mobile, internet"
      And the text of the element "url_id" is equal to "[CONTEXT:cms_unique_id]"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182938 |
          | o2uk    | 13.0 | QANOV-182939 |
          | moves   | 13.0 | QANOV-182940 |
          | blaude  | 13.9 | QANOV-274217 |
          | o2de    | 24.1 | QANOV-580229 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @smoke @web
  Scenario Outline: A user can create a modular page for a multiple product
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "multi_product" button
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
     Then the "Page Preview" page is loaded
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "page_name" is equal to "Test"
      And the text of the element "product_type" is equal to "Product relevance - More than one product"
      And the text of the element "url_id" contains "test"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182941 |
          | o2uk    | 13.0 | QANOV-182942 |
          | moves   | 13.0 | QANOV-182943 |
          | blaude  | 13.9 | QANOV-274221 |
          | o2de    | 24.1 | QANOV-580230 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can create a multiple page for different products relevance
    A multiple page is a configuration with several pages that shares the same url id. The only condition is that the product relevance is not repeated.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "multi_product" button
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "specific_product" button
      And I fill in the "specific_product_input" field with "mobile"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "default" button
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And the item with "test" text in "url_id" field in the "pages_list" list has the "product_type" field with "Multiple products,mobile,Other products" text
      And the item with "test" text in "url_id" field in the "pages_list" list has the "user_group" field with "All users" text
      And the item with "test" text in "url_id" field in the "pages_list" list has the "status" field empty
      And the item with "test" text in "url_id" field in the "pages_list" list has the "pages" field with "3 pages" text
      And I click on the "0" element in the "pages_list" list
      And the "Multiple Modular Pages" page is loaded
      And each item in the "pages_list" list has the "name" field
      And each item in the "pages_list" list has the "url_id" field
      And each item in the "pages_list" list has the "product_type" field
      And each item in the "pages_list" list has the "user_group" field
      And each item in the "pages_list" list has the "status" field
      And each item in the "pages_list" list has the "more_options" field
      And the "close_button" is displayed
      And the "save_order_button" is displayed
      And I click on the "close_button" button
      And the "Modular Pages" page is loaded

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182944 |
          | o2uk    | 13.0 | QANOV-182945 |
          | moves   | 13.0 | QANOV-182946 |
          | blaude  | 13.9 | QANOV-274223 |
          | o2de    | 24.1 | QANOV-580231 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can't create a multiple page for the same product relevance
    A multiple page is a configuration with several pages that shares the same url id. The only condition is that the product relevance is not repeated.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "multi_product" button
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "multiple_product" button
     Then the text of the element "url_id_error" is equal to "This url already exists with 'multiproduct' product-type and you can't create the same"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-182947 |
          | o2uk    | 13.0 | QANOV-182948 |
          | moves   | 13.0 | QANOV-182949 |
          | blaude  | 13.9 | QANOV-274227 |
          | o2de    | 24.1 | QANOV-580233 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.4 @jira.link.detects.ACCOUNT-20053 @manual @regression @web
  Scenario Outline: A user can sort pages of a multiple modular page by dragging and dropping
    A multiple page is a configuration with several pages that shares the same url id.
    The pages can be sorted by precedence by drag and drop in the list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test_sort_page_0"
      And I fill in the "url_id_input" field with "test_sort"
      And I click on the "products_relevance" button
      And I click on the "multi_product" button
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "test_sort_page_1"
      And I fill in the "url_id_input" field with "test"
      And I click on the "products_relevance" button
      And I click on the "specific_product" button
      And I fill in the "specific_product_input" field with "mobile"
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
      And the "Page Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"
      And I click on the "cancel_button" button
      And the "Modular Pages" page is loaded
      And I click on the "0" element in the "pages_list" list
      And the "Multiple Modular Pages" page is loaded
      And I drag and drop the page in the "1" position to the "0" position
      And I click on the "save_order_button" button
      And the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to reorder the order in which these pages are calculated?"
      And the text of the element "message" is equal to "Production will be impacted by this change"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Accept"
      And I click the "accept" button
     Then the element in "0" position in the "pages_list" list has the "name" field with the "test_sort_page_1" text
      And the element in "1" position in the "pages_list" list has the "name" field with the "test_sort_page_0" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.0 | QANOV-223854 |
          | o2uk    | 13.0 | QANOV-223855 |
          | moves   | 13.0 | QANOV-223856 |
          | blaude  | 13.9 | QANOV-274231 |
          | o2de    | 24.1 | QANOV-580234 |

  @jira.QANOV-223857 @automatic @ber @e2e @jira.cv.13.4 @jira.link.detects.ACCOUNT-20053 @qa @smoke @vivobr @web
  Scenario: A user can create a modular page for a specific user group
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the "create_page_button" button
      And the "Page Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.modular_page_name]"
      And I fill in the "url_id_input" field with an unique value
      And I click on the "user_group_selector" button
      And waits until the "user_group_input" element is visible
      And I click on the "user_group_input" button
      And I click on the "any" element in the "user_group_list" list
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I fill in the "page_title_input" field with "TEST"
      And I click on the "continue_button" button
     Then the "Page Preview" page is loaded
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "page_name" is equal to "Automatic test"
      And the "user_group" inputtext is not empty
      And the text of the element "url_id" is equal to "[CONTEXT:cms_unique_id]"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Saved correctly"

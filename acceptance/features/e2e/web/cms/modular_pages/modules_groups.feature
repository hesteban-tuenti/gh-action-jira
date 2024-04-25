# -*- coding: utf-8 -*-
@jira.QANOV-228315 @not_hardening
Feature: Modular Pages - Modules Groups

  Actions After the Feature:
    Given the configured modular pages with "[CONF:cms.modular_page_name]" name in CMS are deleted


  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @smoke @web
  Scenario Outline: A module alternative is prefilled with same module type and audience than the original
    The Module Id matches the previous but increasing or adding the numeric suffix (i.e. billing-cycle-header-1 to billing-cycle-header-2)
    The audience is filled with the same value as the original
    The Edit Module Form for the alternative does not allow to select the location because it is borrowed by the owner module
    The entered audience should not be previously used on another module of the same group
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "<module_selector_option>" button
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I fill in the "audience_selector" field with "Customer has postpay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
      And I click on the "add_alternative_menu_item" button
     Then the "Edit Module Form" page is loaded
      And the "module_selector" textfield that contains the "<module_name>" text is displayed
      And the "module_id" textfield with "<module_id>-1" text is displayed
      And I click on the "tracking_tab" button
      And waits until the "tracking_id" element is visible
      And the "tracking_id" element is displayed
      And the "tracking_id" inputtext is empty
      And clicks on the "audience_tab" button
      And the "audience_selector" textfield that contains the "postpay" text is displayed
      And waits "1" seconds
      And clicks on the "qa_tab" button
      And the "testing_id" element is displayed
      And the "testing_id" inputtext is empty

    Examples:
          | product | cv   | module_selector_option                     | module_id                  | module_name                        | jira_id      |
          | vivobr  | 13.5 | module_selector_consumption_counters_cards | consumption-counters-cards | Consumption Counters as Cards      | QANOV-228316 |
          | o2uk    | 13.5 | module_selector_consumption_counters_cards | consumption-counters-cards | Data Consumption Counters as Cards | QANOV-228317 |
          | moves   | 13.5 | module_selector_billing_cycle_header       | billing-cycle-header       | Billing cycle header               | QANOV-228318 |
          | blaude  | 13.9 | module_selector_tariff_summary             | tariff-summary             | Main Product Summary               | QANOV-274235 |
          | blaude  | 24.1 | module_selector_tariff_summary             | tariff-summary             | Main Product Summary               | QANOV-580235 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @smoke @web
  Scenario Outline: A user can create a module with alternatives (modules group)
    Modules can be groupped so that only one of a group of modules is displayed depending on the audience
    Any just created modules group is located at the end of the list
    The preview does only show one of the modules of a modules group
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "<module_selector_option>" button
      And I delete the "module_id" input value through keys
      And I fill in the "module_id" field with "<module_id>-1"
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I fill in the "audience_selector" field with "Customer has postpay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
      And I click on the "add_alternative_menu_item" button
      And the "Edit Module Form" page is loaded
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I replace the "audience_selector" field value with "Customer has prepay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
     Then the "Page Content" page is loaded
      And the "main_section_modules_groups" list has "1" elements
      And the "main_section_modules_group_at_row_0" list has "2" elements

    Examples:
          | product | cv   | module_selector_option                     | module_id                  | jira_id      |
          | vivobr  | 13.5 | module_selector_consumption_counters_cards | consumption-counters-cards | QANOV-228319 |
          | o2uk    | 13.5 | module_selector_consumption_counters_cards | consumption-counters-cards | QANOV-228320 |
          | moves   | 13.5 | module_selector_billing_cycle_header       | billing-cycle-header       | QANOV-228321 |
          | blaude  | 13.9 | module_selector_tariff_summary             | tariff-summary             | QANOV-274236 |
          | o2de    | 24.1 | module_selector_tariff_summary             | tariff-summary             | QANOV-580236 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.13.5 @manual @qa @regression @web
  Scenario Outline: A user can create a modules group by dragging a module over another
    Not groupped modules can be converted to a modules group when one is dragged over another
    This operation is only possible in the main section. Highlighted and Header modules cannot be dragged and dropped
    to create an alternative module and have to use the more options menu instead
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-1"
      And I select the "postpay" option from "audience_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-2"
      And I select the "prepay" option from "audience_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-1" title over the module with "billing-cycle-header-2" title
      And the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Create an alternative modules group?"
      And the text of the element "message" is equal to "Only one of these modules will be rendered, depending on configured audiences"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Confirm"
      And I click on the "accept" button
     Then the "main_page_list" list has "1" elements
      And the "modules_group" element is displayed
      And the "modules_group_list" list has "2" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228322 |
          | o2uk    | 13.5 | QANOV-228323 |
          | moves   | 13.5 | QANOV-228324 |
          | blaude  | 13.9 | QANOV-274237 |
          | o2de    | 24.1 | QANOV-580237 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user can cancel a modules group creation by dragging a module over another
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-1"
      And I select the "postpay" option from "audience_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-2"
      And I select the "prepay" option from "audience_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-1" title over the module with "billing-cycle-header-2" title
      And the "Confirm Popup" page is loaded
      And I click on the "cancel" button
     Then the "Page Content" page is loaded
      And the "main_page_list" list has "2" elements
      And the "modules_group" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228325 |
          | o2uk    | 13.5 | QANOV-228326 |
          | moves   | 13.5 | QANOV-228327 |
          | blaude  | 13.9 | QANOV-274239 |
          | o2de    | 24.1 | QANOV-580238 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A modules group with 2 modules is deleted when dragging one of the modules out of the group
    Not groupped modules can be converted to a modules group when one is dragged over another
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of two billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "2" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-1" title out of the modules group
      And the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Alternatives group dismissed?"
      And the text of the element "message" is equal to "Are you sure you want to get this module outside the alternatives group? If yes, the two modules could end up rendered at the same time, depending on their audiences"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Confirm"
      And I click on the "accept" button
     Then the "modules_group" element is not displayed
      And the "main_page_list" list has "2" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228328 |
          | o2uk    | 13.5 | QANOV-228329 |
          | moves   | 13.5 | QANOV-228330 |
          | blaude  | 13.9 | QANOV-274243 |
          | o2de    | 24.1 | QANOV-580239 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user can cancel the deletion of modules group with 2 modules by dragging one of the modules out of the group
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of two billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "2" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-1" title out of the modules group
      And the "Confirm Popup" page is loaded
      And I click on the "cancel" button
     Then the "Page Content" page is loaded
     Then the "modules_group" element is displayed
      And the "modules_group_list" list has "2" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228331 |
          | o2uk    | 13.5 | QANOV-228332 |
          | moves   | 13.5 | QANOV-228333 |
          | blaude  | 13.9 | QANOV-274246 |
          | o2de    | 24.1 | QANOV-580240 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A modules group with 3 modules remains as module group when dragging one of the modules out of the group
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-3" title out of the modules group
     Then the "modules_group" element is displayed
      And the "modules_group_list" list has "2" elements
      And the "main_page_list" list has "2" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228334 |
          | o2uk    | 13.5 | QANOV-228335 |
          | moves   | 13.5 | QANOV-228337 |
          | blaude  | 13.9 | QANOV-274247 |
          | o2de    | 24.1 | QANOV-580241 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A module in a modules group with 3 modules, dragged and dropped over a single module, results in two groups
    Single modules are converted to groups when another single module is dropped over them
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_page_add_module" button
      And the "Edit Module Form" page is displayed
      And I select the "Billing cycle header" value from "module_selector" field
      And I select the "postpay" option from "audience_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-4"
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-3" title over the module with "billing-cycle-header-4" title
      And the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Create an alternative modules group?"
      And the text of the element "message" is equal to "Only one of these modules will be rendered, depending on configured audiences"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Confirm"
      And I click on the "accept" button
     Then the "main_page_list" list has "2" elements
      And the "modules_group" is displayed
      And the "modules_group_list" list has "2" elements
      And the "modules_group2" is displayed
      And the "modules_group2_list" list has "2" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228339 |
          | o2uk    | 13.5 | QANOV-228341 |
          | moves   | 13.5 | QANOV-228342 |
          | blaude  | 13.9 | QANOV-274248 |
          | o2de    | 24.1 | QANOV-580242 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user cannot create a modules group by dragging a module over another if both modules have the same audience
    Not groupped modules can be converted to a modules group when one is dragged over another
    If both modules have the same audience, an error is shown and the operation is cancelled
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-1"
      And I select the "postpay" option from "audience_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I fill in the "module_id" field with "billing-cycle-header-2"
      And I select the "postpay" option from "audience_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I drag and drop the module with "billing-cycle-header-1" title over the module with "billing-cycle-header-2" title
     Then the "modules_group" element is not displayed
      And the element in "0" position in the "modules_group_list" list has the "error_label" field with the "The audience of this module is repeated" text
      And the element in "1" position in the "modules_group_list" list has the "error_label" field with the "The audience of this module is repeated" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228343 |
          | o2uk    | 13.5 | QANOV-228344 |
          | moves   | 13.5 | QANOV-228345 |
          | blaude  | 13.9 | QANOV-274249 |
          | o2de    | 24.1 | QANOV-580243 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user can see the preview of every module of a modules group
    Only the selected module in a modules group is shown in the preview
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And clicks on the "any" element in the "modules_group_list" list
     Then the preview shows the selected module

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228346 |
          | o2uk    | 13.5 | QANOV-228347 |
          | moves   | 13.5 | QANOV-228348 |
          | blaude  | 13.9 | QANOV-274250 |
          | o2de    | 24.1 | QANOV-580244 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @qa @sanity @web
  Scenario Outline: A user can add more alternatives to an existing modules group
    Modules can be groupped so that different versions of the same module are displayed depending on the audience
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of two billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "2" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_modules_group_at_row_0" list with "any" index
      And I click on the "add_alternative_menu_item" button
      And the "Edit Module Form" page is loaded
      And I delete the "module_id" input value through keys
      And I fill in the "module_id" field with "billing-cycle-header-test"
      And I click on the "audience_tab" button
      And I click on the "audience_selector" element
      And I replace the "audience_selector" field value with "Customer has prepay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
     Then the "Page Content" page is loaded
      And the "main_section_modules_groups" list has "1" elements
      And the "main_section_modules_group_at_row_0" list has "3" elements
      And the element in "2" position in the "main_section_modules_group_at_row_0" list with "billing-cycle-header-test" text is displayed

    @automatic @ber
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228349 |
          | moves   | 13.5 | QANOV-228351 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 13.5 | QANOV-228350 |
          | blaude  | 13.9 | QANOV-274251 |
          | o2de    | 24.1 | QANOV-580245 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user can order a list of modules including a modules groups and single modules
    Modules group can be reordered in a section like they were a regular module by drag and drop
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I select the "Billing cycle header" value from "module_selector" field
      And I click on the "add_module" button
      And the "Page Content" page is loaded
      And I drag and drop the module in the "1" position to the "0" position
     Then the element in "0" position in the "main_page_list" list has the "module_title" field with the "billing-cycle-header" text
      And the element in "1" position in the "main_page_list" list has the "module_title" field with the "Alternative modules" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228352 |
          | o2uk    | 13.5 | QANOV-228353 |
          | moves   | 13.5 | QANOV-228354 |
          | blaude  | 13.9 | QANOV-274253 |
          | o2de    | 24.1 | QANOV-580246 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user can define the order of the modules in a modules group
    Drag and drop modules of a modules group to define the rendering order
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of two billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "2" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I drag and drop the element in the "1" position to the "0" position of the "modules_group_list" list
     Then the element in "0" position in the "modules_group_list" list has the "module_title" field with the "billing-cycle-header2" text
      And the element in "1" position in the "modules_group_list" list has the "module_title" field with the "billing-cycle-header" text

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228355 |
          | o2uk    | 13.5 | QANOV-228356 |
          | moves   | 13.5 | QANOV-228357 |
          | blaude  | 13.9 | QANOV-274256 |
          | o2de    | 24.1 | QANOV-580247 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @qa @sanity @web
  Scenario Outline: More than one modules group can be created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three Action Row modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "<module_selector_option>" button
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I fill in the "audience_selector" field with "Customer has prepay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
      And I click on the "add_alternative_menu_item" button
      And the "Edit Module Form" page is loaded
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I replace the "audience_selector" field value with "Customer has postpay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
     Then the "Page Content" page is loaded
      And the "main_section_modules_groups" list has "2" elements
      And the "main_section_modules_group_at_row_0" list has "3" elements
      And the "main_section_modules_group_at_row_1" list has "2" elements

    @automatic @ber
    Examples:
          | product | cv   | module_selector_option                     | jira_id      |
          | vivobr  | 13.5 | module_selector_consumption_counters_cards | QANOV-228358 |
          | moves   | 13.5 | module_selector_billing_cycle_header       | QANOV-228360 |

    @manual
    Examples:
          | product | cv   | module_selector_option                     | jira_id      |
          | o2uk    | 13.5 | module_selector_consumption_counters_cards | QANOV-228359 |
          | blaude  | 13.9 | module_selector_tariff_summary             | QANOV-274257 |
          | o2de    | 24.1 | module_selector_tariff_summary             | QANOV-580248 |

  @jira.<jira_id> @<product> @automation.hard @e2e @jira.cv.<cv> @manual @qa @regression @web
  Scenario Outline: A user can move a module from one modules group to another
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has two module groups comprised of three billing-cycle-header modules each
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "2" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I drag and drop "any" element in "modules_group_list" list to the "modules_group2_list"
     Then the "modules_group" element is displayed
      And the "modules_group_list" list has "2" elements
      And the "modules_group2" element is displayed
      And the "modules_group2_list" list has "4" elements

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228361 |
          | o2uk    | 13.5 | QANOV-228362 |
          | moves   | 13.5 | QANOV-228363 |
          | blaude  | 13.9 | QANOV-274258 |
          | o2de    | 24.1 | QANOV-580249 |

  @jira.<jira_id> @<product> @ber @e2e @jira.cv.<cv> @qa @sanity @web
  Scenario Outline: A user can remove alternatives from a group module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "3" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_modules_group_at_row_0" list with "any" index
      And I click on the "remove_module_menu_item" button
     Then the "main_section_modules_groups" list has "1" elements
      And the "main_section_modules_group_at_row_0" list has "2" elements

    @automatic
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228364 |
          | o2uk    | 13.5 | QANOV-228365 |
          | moves   | 13.5 | QANOV-228366 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-274259 |
          | o2de    | 24.1 | QANOV-580251 |

  @jira.<jira_id> @<product> @ber @e2e @jira.cv.<cv> @qa @regression @web
  Scenario Outline: A user can remove all the alternatives from a group module
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of 2 billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page with "1" modules groups of "2" modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_modules_group_at_row_0" list with "any" index
      And I click on the "remove_module_menu_item" button
     Then the "main_section_modules_groups" list has "0" elements
      And the "main_section_standalone_modules" list has "1" elements

    @automatic
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.5 | QANOV-228367 |
          | o2uk    | 13.5 | QANOV-228368 |
          | moves   | 13.5 | QANOV-228369 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-274260 |
          | o2de    | 24.1 | QANOV-580252 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @qa @regression @web
  Scenario Outline: Two modules in the same modules group cannot have the same audience
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "<module_selector_option>" button
      And I delete the "module_id" input value through keys
      And I fill in the "module_id" field with "<module_id>-1"
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I fill in the "audience_selector" field with "Customer has postpay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
      And I click on the "add_alternative_menu_item" button
      And the "Edit Module Form" page is loaded
      And I click on the "audience_tab" element
      And I click on the "audience_selector" element
      And I replace the "audience_selector" field value with "Customer has postpay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
     Then the "Page Content" page is loaded
      And the element in "0" position in the "main_section_modules_group_at_row_0" list with "This audience is already in use in other module" text is displayed
      And the element in "1" position in the "main_section_modules_group_at_row_0" list with "This audience is already in use in other module" text is displayed

    @automatic @ber
    Examples:
          | product | cv   | module_selector_option                     | module_id                  | jira_id      |
          | vivobr  | 13.5 | module_selector_consumption_counters_cards | consumption-counters-cards | QANOV-228370 |
          | moves   | 13.5 | module_selector_billing_cycle_header       | billing-cycle-header       | QANOV-228372 |

    @manual
    Examples:
          | product | cv   | module_selector_option                     | module_id                  | jira_id      |
          | o2uk    | 13.5 | module_selector_consumption_counters_cards | consumption-counters-cards | QANOV-228371 |
          | blaude  | 13.9 | module_selector_tariff_summary             | tariff-summary             | QANOV-274263 |
          | o2de    | 24.1 | module_selector_tariff_summary             | tariff-summary             | QANOV-580253 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @qa @regression @web
  Scenario Outline: A module without audiences must be in the last position of the modules group
    Error is shown when a module without audiences is not in the last place
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    NOTE: The page configured in the preconditions of this scenario has one module group comprised of three billing-cycle-header modules
     When I configure in CMS the "[CONF:cms.modular_page_name]" modular page without modules
      And I go to "[CONF:cms.base][CONF:cms.modular_pages]" web page
      And the "Modular Pages" page is loaded
      And waits until the "pages_list" element is clickable
      And I click on the configured modular page
      And the "Page Overview" page is loaded
      And I click on the "continue_button" button
      And the "Page Content" page is loaded
      And I click on the "main_section_add_module_button" button
      And the "Edit Module Form" page is loaded
      And I click on the "module_selector" element
      And I click on the "<module_selector_option>" button
      And I click on the "add_module" button
      And I scroll to the top of the page
      And the "Page Content" page is loaded
      And clicks on the "more_options_menu" field of "main_section_standalone_modules" list with "any" index
      And I click on the "add_alternative_menu_item" button
      And the "Edit Module Form" page is loaded
      And I click on the "audience_tab" button
      And I click on the "add_condition_button" button
      And I click on the "audience_selector" element
      And I replace the "audience_selector" field value with "Customer has postpay payment model"
      And I click on the "audience_selector_first_element" button
      And I click on the "add_module" button
      And I scroll to the top of the page
     Then the "Page Content" page is loaded
      And the element in "0" position in the "main_section_modules_group_at_row_0" list with "Drag the module to the last position. This module has no specified audience and therefore impacts all users." text is displayed

    @automatic @ber
    Examples:
          | product | cv   | module_selector_option                     | jira_id      |
          | vivobr  | 13.5 | module_selector_consumption_counters_cards | QANOV-228373 |
          | moves   | 13.5 | module_selector_billing_cycle_header       | QANOV-228375 |
          | o2uk    | 13.5 | module_selector_consumption_counters_cards | QANOV-228374 |
          | blaude  | 13.9 | module_selector_tariff_summary             | QANOV-274265 |
          | o2de    | 24.1 | module_selector_tariff_summary             | QANOV-580254 |

# -*- coding: utf-8 -*-
@jira.QANOV-146122 @not_hardening
Feature: Extras Lists Management

  Actions After the Feature:
      And the configured extras with "[CONF:cms.extras_list_internal_name]" name in CMS are deleted


  @jira.QANOV-167181 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: A user can access to the Extras management screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
      And I click on the "extras_option" button
     Then the "Extras" page is loaded

  @jira.QANOV-146101 @jira.cv.12.8 @jira.link.detects.CMS-1228 @manual @regression @vivobr @web
  Scenario: A user can access to the Extras lists page without list created
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given there are "0" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
     Then the text of the element "title" is equal to "Extras"
      And the text of the element "create_list_button" is equal to "Create list"
      And the text of the element "empty_case_title" is equal to "Extras"
      And the text of the element "empty_case_description" is equal to "Please, create a new extras list to start and view the lists of extras you have created."
      And the text of the element "empty_case_button" is equal to "Create extras list"
      And the "filter_by_status" element is displayed
      And the "filter_by_name" element is displayed
      And the "extras_list" element is not displayed

  @jira.QANOV-146123 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: A user can access to create a new list of extras from the create list button
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
     Then the "Extras Overview" page is loaded
      And the text of the element "title" is equal to "Create list"
      And the "close_button" element is displayed
      And the text of the element "progress_bar_step1" is equal to "Overview"
      And the text of the element "progress_bar_step2" is equal to "Content"
      And the text of the element "progress_bar_step3" is equal to "Preview"
      And the text of the element "internal_name_title" is equal to "List name (for internal use)"
      And the "internal_name_input" element is displayed
      And the text of the element "list_id_title" is equal to "List ID"
      And the "list_id_input" element is displayed
      And the "continue_button" element is displayed

  @jira.QANOV-146126 @jira.cv.12.8 @jira.link.detects.CMS-1228 @manual @regression @vivobr @web
  Scenario: A user can access to create a new list of extras from the empty case link
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "empty_case_link" button
     Then the "Extras Overview" page is loaded

  @jira.QANOV-146129 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: The list ID field is autofilled according to the "Internal list name" field value
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with "test test"
     Then the text of the element "list_id_input" is equal to "test-test"

  @jira.QANOV-146132 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: User can't continue the extras list creation without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "internal_name_error" is equal to "This field is required"
      And the text of the element "list_id_error" is equal to "Letters and numbers only. Spaces and special characters are not allowed"

  @jira.QANOV-146135 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: A user can access to the second step of the extras list creation (Content) after having introduced the overview data
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I fill in the "list_id_input" field with an unique public id value
      And I click on the "continue_button" button
     Then the "Extras Content" page is loaded
      And the text of the element "title" contains "[CONF:cms.extras_list_internal_name]"
      And the "close_button" element is displayed
      And the "save_button" element is not displayed
      And the text of the element "description" is equal to "Please you should create extras to your extras list if you want to show it to your users. If not your extras will not be displayed"
      And the "add_extra_button" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

  @jira.QANOV-146138 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can save a list of extras only filling the overview fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I fill in the "list_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Extras Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "List has been saved"

  @jira.QANOV-146144 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: A user can see the form to create an Extra during the extras list creation process
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I fill in the "list_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
     Then the "Extra Form" page is loaded
      And the text of the element "new_extra_title" is equal to "Extra 1"
      And the "delete_icon" element is displayed
      And the "hide_icon" element is displayed
      And the text of the element "cms_provider_title" contains "Provider by user CMS"
      And the text of the element "cms_provider_title" contains "The user configures all the extra info"
      And the text of the element "product_id_provider_title" contains "Provider by Product ID"
      And the text of the element "product_id_provider_title" contains "The extra comes with information about the copy and about the audience"
      And the "cms_provider" checkbox is enabled
      And the "help_icon" element is displayed
      And the text of the element "add_icon_light" is equal to "Light"
      And the text of the element "add_dark_icon" is equal to "Dark"
      And the text of the element "name_title" is equal to "Name of your extra module"
      And the "name_input" element is displayed
      And the text of the element "no_clickable_action_title" is equal to "Not include clickable action"
      And the text of the element "clickable_action_title" is equal to "Include clickable action"
      And the "no_clickable_action" checkbox is enabled
      And the text of the element "audiences_title" is equal to "Audiences"
      And the text of the element "audiences_subtitle" is equal to "Choose the audiences where you want see the extra created"
      And the "add_audience" element is displayed
      And the "Extras Content" page is loaded
      And the "add_extra_button" element is displayed
      And the "extras_preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

  @jira.QANOV-146147 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: User can't continue the extra provided by CMS creation without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I fill in the "list_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "light_icon_error" is equal to "This field is required"
      And the text of the element "name_error" is equal to "This field is required"

  @jira.QANOV-146150 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: User can't continue the extra creation provided by product Id without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I fill in the "list_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I check the box "product_id_provider"
      And I click on the "continue_button" button
     Then the text of the element "light_icon_error" is equal to "This field is required"
      And the text of the element "name_error" is equal to "This field is required"
      And the text of the element "product_id_error" is equal to "This field is required"

  @jira.QANOV-146153 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: A user can add a new extra provided by CMS during the extras list creation process
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I fill in the "list_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.svg"
      And waits "1" seconds
      And I click on the "continue_button" button
     Then the "Extras Preview" page is loaded
      And the "close_button" element is displayed
      And the "save_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "extras_count" is equal to "1 extra"
      And the text of the element "extra_name" contains "[CONF:cms.extra_name]"
      And the "create_test_button" element is displayed
      And the "back_button" element is displayed
      And the "save_publish_button" element is displayed

  @jira.QANOV-146156 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can add a new extra provided by product Id during the extras list creation process
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I click on the "product_id_provider" web button
      And I fill in the "product_id_input" field with "any"
      And I press the Enter key on "product_id_input" field
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.svg"
      And waits "1" seconds
      And I click on the "continue_button" button
     Then the "Extras Preview" page is loaded
      And the "close_button" element is displayed
      And waits until the "save_button" element is visible
      And the "save_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "extras_count" is equal to "1 extra"
      And the text of the element "extra_name" contains "[CONF:cms.extra_name]"
      And the "create_test_button" element is displayed
      And the "back_button" element is displayed
      And the "save_publish_button" element is displayed

  @jira.QANOV-176723 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can add a new extra with audiences during the extras list creation process
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And waits until the "name_input" element is visible
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.svg"
      And I click on the "add_audience" button
      And I click on the "audiences_selector" button
      And I click on the "audiences_first" button
      And I click on the "continue_button" button
     Then the "Extras Preview" page is loaded
      And the "close_button" element is displayed
      And waits until the "save_button" element is visible
      And the "save_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "extras_count" is equal to "1 extra"
      And the text of the element "extra_name" contains "[CONF:cms.extra_name]"
      And the "create_test_button" element is displayed
      And the "back_button" element is displayed
      And the "save_publish_button" element is displayed

  @jira.QANOV-168350 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can upload a light icon from computer in an extra (SVG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.svg"
      And the "Extra Form" page is loaded
      And waits until the "light_icon" element is visible
     Then the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed

  @jira.QANOV-168351 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can upload a light icon from computer in an extra (PNG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.svg"
      And the "Extra Form" page is loaded
      And waits until the "light_icon" element is visible
     Then the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed

  @jira.QANOV-168353 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can change a light icon in an extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.svg"
      And waits until the "light_icon_change_button" element is visible
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And waits until the "light_icon" element is visible
     Then the "light_icon" element is displayed
      And the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed

  @jira.QANOV-168354 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can remove a light icon in an extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And waits until the "light_icon_remove_button" element is visible
      And I click on the "light_icon_remove_button" element
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is clickable
      And I click on the "accept" button
      And the "Extra Form" page is loaded
     Then the "light_icon" element is not displayed
      And the "light_icon_remove_button" element is not displayed
      And the "light_icon_change_button" element is not displayed
      And the "add_icon_light" element is displayed

  @jira.QANOV-168355 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can upload a dark icon from computer in an extra (SVG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_dark_file_input" field with file path "resources/cms/boltons_dark.svg"
      And waits until the "dark_icon" element is visible
     Then the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed

  @jira.QANOV-168356 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can upload a dark icon from computer in an extra (PNG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_dark_file_input" field with file path "resources/cms/boltons_dark.png"
      And waits until the "dark_icon" element is visible
     Then the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed

  @jira.QANOV-168358 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can change a dark icon in an extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_dark_file_input" field with file path "resources/cms/boltons_dark.svg"
      And waits until the "dark_icon_change_button" element is visible
      And I fill in the "upload_dark_file_input" field with file path "resources/cms/boltons_dark.png"
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed

  @jira.QANOV-168359 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can remove a dark icon in an extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_dark_file_input" field with file path "resources/cms/boltons_dark.png"
      And waits until the "dark_icon_remove_button" element is visible
      And I click on the "dark_icon_remove_button" element
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is clickable
      And I click on the "accept" button
      And the "Extra Form" page is loaded
     Then the "dark_icon" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "add_dark_icon" element is displayed

  @jira.QANOV-146171 @automatic @ber @jira.cv.12.8 @qa @smoke @vivobr @web
  Scenario: A user tries to save and publish a new list of extras: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And waits until the "name_input" element is visible
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And waits "1" seconds
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_publish_button" button
     Then the "Confirm Changes Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to publish this list?"
      And the text of the element "confirm" is equal to "Confirm"
      And the text of the element "cancel" is equal to "Cancel"
      And I click on the "cancel" button
      And the "Extras Preview" page is loaded

  @jira.QANOV-146174 @automatic @ber @jira.cv.12.8 @qa @vivobr @web
  Scenario: A user cancels the publishing of a new list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And I click on the "add_audience" button
      And I click on the "audiences_selector" button
      And I click on the "audiences_first" button
      And waits "1" seconds
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "cancel" button
     Then the "Extras Preview" page is loaded

  @jira.QANOV-146177 @automatic @ber @jira.cv.12.8 @jira.link.detects.CMS-1451 @qa @smoke @vivobr @web
  Scenario: A user confirms the publishing of a new list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And I click on the "add_audience" button
      And I click on the "audiences_selector" button
      And I click on the "audiences_first" button
      And waits "1" seconds
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Extras Preview" page is loaded
      And the text of the element "confirm_message" is equal to "List has been published"
      And the "pause_button" element is displayed

  @jira.QANOV-176724 @automatic @ber @jira.cv.13.0 @qa @smoke @vivobr @web
  Scenario: A user can pause a list of extras from the extras preview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in any of "PUBLISHED,PUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "pause_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Extras Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "List has been paused"
      And the "pause_button" element is not displayed

  @jira.QANOV-176725 @jira.cv.13.0 @manual @qa @regression @vivobr @web
  Scenario: A user can see a button to publish a list of extras when there is no content saved
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT,UNPUBLISHED,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
     Then the "publish" button is displayed

  @jira.QANOV-146180 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can see a recently published extras list in the lists management page with the Published state
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "list_id_input" field with an unique public id value
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I click on the "audiences_selector" button
      And I click on the "audiences_first" button
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_and_publish_button" button
      And the "publish_popup" element is displayed
      And I click on the "publish_popup.yes" button
      And I click on the "close_button" button
     Then the "Extras" page is loaded
      And the "0" index in the "extras_lists" list has the "name" field with "[CONF:cms.extras_list_internal_name]" text
      And the "0" index in the "extras_lists" list has the "status" field with "PUBLISHED" text

  @jira.QANOV-146183 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can see a recently created extras list in the lists management page with the Draft state
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And the "Extras Overview" page is loaded
      And I fill in the "internal_name_input" field with an unique value with text "[CONF:cms.extras_list_internal_name]"
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "add_extra_button" button
      And the "Extra Form" page is loaded
      And waits until the "name_input" element is visible
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And I click on the "add_audience" button
      And I click on the "audiences_selector" button
      And I click on the "audiences_first" button
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Extras Preview" page is loaded
      And waits until the "confirm_message" element is not visible
      And waits until the "close_button" element is clickable
      And I click on the "close_button" web button
     Then the "Extras" page is loaded
      And the item with "[CONF:cms.extras_list_internal_name]" text in "name" field in the "extras_list" list has the "status" field with "DRAFT" text

  @jira.QANOV-146159 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can see a preview with the extras list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And switches to iframe
     Then each item in the "extras_preview" list has the "name" field
      And each item in the "extras_preview" list has the "icon" field
      And the element in "0" position in the "extras_preview" list with "[CONF:cms.extra_name]" text is displayed

  @jira.QANOV-146162 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can see a preview with the extras list in dark mode
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "extras_preview_switch" button
     Then the "extras_preview_icon_1" is displayed in dark mode

  @jira.QANOV-146186 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can access to the edition page of an extras list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" extras configured in CMS for automation tests
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
     Then the "Extras Overview" page is loaded
      And the text of the element "internal_name_input" contains "[CONF:cms.extras_list_internal_name]"
      And the "internal_name_input" element is readonly
      And the "list_id_input" element is readonly

  @jira.QANOV-146192 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can add an extra to a list with extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are lists of extras in "DRAFT" status with "1" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I scroll to the element "add_extra_button"
      And I click on the "add_extra_button" web button
      And the "Extra Form" page is loaded
      And waits until the "name_input" element is visible
      And I fill in the "name_input" field with "[CONF:cms.extra_name_2]"
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And I click on the "add_audience" button
      And I click on the "audiences_selector" button
      And I click on the "audiences_first" button
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And the text of the element "extras_count" is equal to "2 extras"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Extras Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "List has been saved"
      And I click on the "close_button" button
      And the "Extras" page is loaded
      And the item with "[CONTEXT:cms_extras.extra0.metadata.internalName]" text in "name" field in the "extras_list" list has the "count" field with "2 extras" text

  @jira.QANOV-146195 @automatic @ber @jira.cv.12.8 @qa @regression @vivobr @web
  Scenario: A user can remove an extra from a list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are lists of extras in "DRAFT" status with "any" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Extras Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "List has been saved"
      And I click on the "close_button" button
      And the "Extras" page is loaded
      And the item with "[CONTEXT:cms_extras.extra0.metadata.internalName]" text in "name" field in the "extras_list" list has the "count" field with one extra less

  @jira.QANOV-146198 @automatic @ber @jira.cv.12.8 @qa @vivobr @web
  Scenario: A user can edit an extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are lists of extras in "DRAFT" status with "any" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "show_extra_last_element" web button
      And the "Extra Form" page is loaded
      And I click on the "product_id_provider" web button
      And I fill in the "product_id_input" field with "new"
      And I press the Enter key on "product_id_input" field
      And I fill in the "upload_light_file_input" field with file path "resources/cms/boltons.png"
      And I scroll to the element "name_input"
      And I replace the "name_input" field value with "[CONF:cms.extra_name_edited]"
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_button" web button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Extras Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "List has been saved"
      And waits until the "confirm_message" element is not visible
      And I click on the "close_button" button
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "show_extra_last_element" web button
      And the "Extra Form" page is loaded
      And the text of the element "name_input" is equal to "[CONF:cms.extra_name_edited]"
      And the text of the element "product_id_input_value" contains "new"
      And the "product_id_provider" checkbox is enabled

  @jira.QANOV-146201 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can sort a list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are lists of extras in "DRAFT" status with "several" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I change the order of the extras
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Page Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "List has been saved"
      And the new order is displayed in the "preview_image"

  @jira.QANOV-146204 @automatic @ber @jira.cv.12.8 @qa @vivobr @web
  Scenario: A user deletes a list of extras: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT,UNPUBLISHED,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And waits until the "extras_table" element is visible
      And I click on the "more_options" element on the configured extras list
      And I click on the "menu_delete_button" element
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Confirm delete"
      And the text of the element "accept" is equal to "Confirm"
      And the text of the element "cancel" is equal to "Cancel"

  @jira.QANOV-146207 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user cancels the deletion of a list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And clicks on the "delete" button
      And the "delete_list" popup is displayed
      And clicks on the "delete_list.cancel" button
     Then the "delete_list" popup is not displayed
      And the "0" index in the "extras_lists" list has the "name" field with "[CONF:cms.extras_list_internal_name]" text

  @jira.QANOV-146210 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user confirms the deletion of a list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And clicks on the "delete" button
      And the "delete_list" popup is displayed
      And clicks on the "delete_list.accept" button
     Then the "delete_list" popup is not displayed
      And the list of extras is removed

  @jira.QANOV-146213 @jira.cv.12.8 @manual @sanity @vivobr @web
  Scenario: A user can publish a list of extras in draft status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "draft" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content Management" page is loaded
      And I click on the "continue_button" button
      And the "Extras Lists Preview" page is loaded
      And I click on the "save_and_publish_button" button
      And the "publish_popup" element is displayed
      And I click on the "publish_popup.yes" button
     Then the "Extras Lists Preview" page is loaded
      And the text of the element "success_feedback" is equal to "List has been saved"
      And I click on the "close_button" button
      And the "Extras Lists Management" page is loaded
      And the "0" index in the "extras_lists" list has the "status" field with "PUBLISHED" text

  @jira.QANOV-146216 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user tries to unpublish a published list of extras: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And clicks on the "unpublish" button
     Then the "unpublish_popup" element is displayed
      And the text of the element "unpublish_popup.text" contains "Unpublish list"
      And the text of the element "unpublish_popup.cancel" is equal to "Cancel"
      And the text of the element "unpublish_popup.accept" is equal to "Accept"

  @jira.QANOV-146219 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user cancels the unpublishing of a list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And clicks on the "unpublish" button
      And the "unpublish_popup" element is displayed
      And clicks on the "unpublish_popup.cancel" button
     Then the "0" index in the "extras_lists" list has the "status" field with "PUBLISHED" text

  @jira.QANOV-146222 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user confirms the pause of a list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And clicks on the "unpublish" button
      And the "unpublish_popup" element is displayed
      And clicks on the "unpublish_popup.accept" button
     Then the "0" index in the "extras_lists" list has the "status" field with "PAUSED" text

  @jira.QANOV-146225 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can't delete a list of extras in published status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
     Then the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And the "delete" element is not displayed

  @jira.QANOV-146228 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user sees an alert when trying to update a published list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I fill in the "internal_name_input" field with "[CONF:cms.extras_list_internal_name_edited]"
      And I click on the "save_button" button
     Then the "confirm_edit" popup is displayed
      And the text of the element "confirm_edit.title" is equal to "Changing this list will affect production. Are you sure?"
      And the text of the element "confirm_edit.no" is equal to "No"
      And the text of the element "confirm_edit.yes" is equal to "Yes"

  @jira.QANOV-146231 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user cancels the edition of a published list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I fill in the "internal_name_input" field with "[CONF:cms.extras_list_internal_name_edited]"
      And I click on the "save_button" button
      And the "confirm_edit" popup is displayed
      And I click on the "confirm_edit.no" button
     Then the "confirm_edit" popup is not displayed
      And the "success_feedback" element is not displayed

  @jira.QANOV-146234 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user confirms the edition of a published list of extras
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "published" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I fill in the "internal_name_input" field with "[CONF:cms.extras_list_internal_name_edited]"
      And I click on the "save_button" button
      And the "confirm_edit" popup is displayed
      And I click on the "confirm_edit.yes" button
     Then the "confirm_edit" popup is not displayed
      And the text of the element "success_feedback" is equal to "List has been saved"

  @jira.QANOV-146237 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can see an extra in activated status when the list of extras is saved
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements with "any" extras
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content Management" page is loaded
      And I click on the "add_new_extra_button" button
      And the "Extra Creation" page is loaded
      And I upload the "icon_light" icon into the "icon_light"
      And I fill in the "name_input" field with "[CONF:cms.extra_name]"
      And I select the "[CONF:cms.extra_audience]" option from "audiences_selector" field
      And I click on the "save_button" button
     Then the text of the element "success_feedback" is equal to "List has been saved"

  @jira.QANOV-146240 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can deactivate an activated extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements with "1" extras in "activated" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content Management" page is loaded
      And clicks on the "deactivate" button of "extras" list with "0" index
      And I click on the "save_button" button
     Then the text of the element "success_feedback" is equal to "List has been saved"
      And the "activate" element is displayed

  @jira.QANOV-146243 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can activate a deactivated extra
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements with "1" extras in "deactivated" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content Management" page is loaded
      And clicks on the "activate" button of "extras" list with "0" index
      And I click on the "save_button" button
     Then the text of the element "success_feedback" is equal to "List has been saved"
      And the "deactivate" element is displayed

  @jira.QANOV-146246 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user who is in the extras list overview page can go back to the extras lists page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the "create_list_button" button
      And I click on the "close_button" button
     Then the "Extras" page is loaded

  @jira.QANOV-146249 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user who is in the extra content page can go back to the extras overview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Extras Preview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "back_button" button
     Then the "Extras Overview" page is loaded

  @jira.QANOV-146252 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can close the edition of an extras list from Extras Overview page when there is nothing to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "close_button" button
     Then the "Extras" page is loaded

  @jira.QANOV-146255 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user who is in the extras preview page can go back to the extras edition page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "back_button" button
     Then the "Extras Content" page is loaded

  @jira.QANOV-146258 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user who is in the extras preview page can close the extras edition process when there is nothing to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "close_button" button
     Then the "Extras" page is loaded

  @jira.QANOV-176726 @jira.cv.13.0 @manual @regression @vivobr @web
  Scenario: A user can see a popup when closing the edition of an extras list from Extras Overview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "close_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Extras Overview" page is loaded

  @jira.QANOV-176727 @jira.cv.13.0 @manual @regression @vivobr @web
  Scenario: A user can see a popup when closing the edition of an extraslist from Extras Content page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "close_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Extras Content" page is loaded

  @jira.QANOV-176728 @jira.cv.13.0 @manual @regression @vivobr @web
  Scenario: A user can see a popup when closing the edition of an extras list from Extras Preview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "close_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Extras Preview" page is loaded

  @jira.QANOV-176729 @jira.cv.13.0 @manual @regression @vivobr @web
  Scenario: A user can close the edition of an extras list from Extra Overview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "close_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Extras" page is loaded

  @jira.QANOV-176730 @jira.cv.13.0 @manual @regression @vivobr @web
  Scenario: A user can close the edition of an extras list from Extras Content page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "close_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Extras" page is loaded

  @jira.QANOV-176731 @jira.cv.13.0 @manual @regression @vivobr @web
  Scenario: A user can close the edition of an extras list from Extras Preview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are extras lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "last_delete_icon" web button
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "close_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Extras" page is loaded

  @jira.QANOV-146261 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can access to the audit log page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "more_options" button of "extras_lists" list with "0" index
      And clicks on the "audit_log" button
     Then the "Audit Log" page is loaded
      And the text of the element "header_time" is equal to "TIME"
      And the text of the element "header_admin" is equal to "ADMIN"
      And the text of the element "header_action" is equal to "ACTION"
      And the text of the element "header_comments" is equal to "COMMENTS"
      And the "logs" list of elements is displayed
      And each item in the "logs" list has the "time" field
      And each item in the "logs" list has the "admin" field
      And each item in the "logs" list has the "action" field
      And each item in the "logs" list has the "comments" field

  @jira.<jira_id> @jira.cv.12.8 @jira.link.detects.CMS-1452 @manual @regression @vivobr @web
  Scenario Outline: A user can create a test on a list of extras in <status> status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given the "extras" CMS is configured with "any" elements in "<status>" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And clicks on the "0" element in the "extras_lists" list
      And the "Edit Extras List" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content Management" page is loaded
      And I click on the "continue_button" button
      And the "Extras Lists Preview" page is loaded
      And I click on the "create_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa"
      And I fill in the "user_id" field with "12345678"
      And I click on the "save_test" button
     Then the "Extras Preview" page is loaded
      And the text of the element "success_feedback" is equal to "Test has been saved"
      And the "<status>" tab is displayed
      And the "test" tab is displayed
      And the "test" tab is selected
      And the "save_and_publish" button is not displayed
      And the "delete_test_button" element is displayed
      And the "edit_test_button" element is displayed

    Examples:
          | status    | jira_id      |
          | published | QANOV-146264 |
          | paused    | QANOV-146265 |

  @jira.QANOV-146270 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user sees an alert when trying to discard a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "delete_test_button" button
     Then the "popup" element is displayed
      And the text of the element "popup.text" is equal to "Are you sure you want to discard the test?"
      And the text of the element "popup.no" is equal to "No"
      And the text of the element "popup.yes" is equal to "Yes, discard"

  @jira.QANOV-146273 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user cancels the discarding of a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "delete_test_button" button
      And the "popup" element is displayed
      And I click on the "popup.no" button
     Then the "popup" element is not displayed
      And the "discard_test" button is displayed

  @jira.QANOV-146276 @jira.cv.12.8 @jira.link.detects.CMS-1453 @manual @regression @vivobr @web
  Scenario: A user confirms the discarding of a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "delete_test_button" button
      And the "popup" element is displayed
      And I click on the "popup.yes" button
     Then the "popup" element is not displayed
      And the text of the element "success_feedback" is equal to "Test deleted"
      And the "edit_test_button" button is not displayed
      And the "delete_test_button" button is not displayed
      And the "test" tab is not displayed

  @jira.QANOV-146279 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can edit a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "edit_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa 2"
      And I click on the "save_test" button
     Then the "Extras Preview" page is loaded

  @jira.QANOV-146282 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can see an alert when trying to publish a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_and_publish" button
     Then the "popup" element is displayed
      And the text of the element "popup.text" is equal to "Publishing this list may affect production. Are you sure?"
      And the text of the element "popup.no" is equal to "No"
      And the text of the element "popup.yes" is equal to "Yes"

  @jira.QANOV-146285 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user confirms the publishing of a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I click on the configured extras list
      And the "Extras Overview" page is loaded
      And I click on the "continue_button" button
      And the "Extras Content" page is loaded
      And I click on the "continue_button" button
      And the "Extras Preview" page is loaded
      And I click on the "save_and_publish" button
      And the "popup" element is displayed
      And I click on the "popup.yes" button
     Then the text of the element "success_feedback" is equal to "List has been saved"
      And the "edit_test_button" button is not displayed
      And the "delete_test_button" button is not displayed
      And the "test" tab is not displayed
      And the "create_test" button is displayed

  @jira.QANOV-146104 @automatic @ber @jira.cv.12.8 @qa @sanity @vivobr @web
  Scenario: A user can access to the Extras lists page with lists already created
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given there are "any" extras configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras" page is loaded
     Then the text of the element "create_list_button" is equal to "Create list"
      And the "filter_by_status" element is displayed
      And the "filter_by_name" element is displayed
      And the "extras_list" list of elements is displayed
      And each item in the "extras_list" list has the "name" field
      And each item in the "extras_list" list has the "count" field
      And each item in the "extras_list" list has the "status" field
      And each item in the "extras_list" list has the "more_options" field
      And each item in the "extras_list" list has the "edit_chevron" field

  @jira.QANOV-146107 @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario: A user can filter extras lists by name
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given the "extras" CMS is configured with "several" elements
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I fill in the "filter_by_name" field with "test"
     Then the "test" is displayed in the "name" field of each element of the "extras_lists" list

  @jira.<jira_id> @jira.cv.12.8 @manual @regression @vivobr @web
  Scenario Outline: A user can filter extras lists by <status> status
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given the "extras" CMS is configured with "any" elements in "<status>" status
     When I go to "[CONF:cms.base][CONF:cms.extras_lists_management]" web page
      And the "Extras Lists Management" page is loaded
      And I fill in the "filter_by_status" field with "<status>"
     Then the "<status>" is displayed in the "status" field of each element of the "extras_lists" list

    Examples:
          | status    | jira_id      |
          | draft     | QANOV-146110 |
          | published | QANOV-146111 |
          | paused    | QANOV-146112 |
          | test      | QANOV-146113 |

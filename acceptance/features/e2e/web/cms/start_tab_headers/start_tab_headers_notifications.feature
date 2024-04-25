# -*- coding: utf-8 -*-
@jira.QANOV-243340 @not_hardening
Feature: StartTab Header Notifications

  Actions After the Feature:
    Given the configured start tab headers with "[CONF:cms.start_tab_header_notification_name]" name in CMS are deleted


  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to the Start tab headers screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
      And I scroll to the element "start_tab_header_option"
      And I click on the "start_tab_header_option" button
     Then the "Start Tab Headers" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243341 |
          | moves   | 13.5    | QANOV-243342 |
          | blaude  | 13.9    | QANOV-274459 |
          | o2de    | 24.1    | QANOV-580284 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can access to the Start tab headers screen without any page created
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "0" start tab headers configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
     Then the "Start Tab Headers" page is loaded
      And the text of the element "title" is equal to "Start tab headers"
      And the text of the element "create_header_notification_button" is equal to "Create header notification"
      And the text of the element "empty_case_title" is equal to "Please, create a new header notification to start and view the list of notifications you have created."
      And the text of the element "create_header_notification_link" is equal to "Create header notification"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243343 |
          | moves   | 13.5    | QANOV-243344 |
          | blaude  | 13.9    | QANOV-274466 |
          | o2de    | 24.1    | QANOV-580285 |

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @sanity @web
  Scenario Outline: A user can access to the Start tab headers page with pages already created
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are "several" start tab headers configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
     Then the "Start Tab Headers" page is loaded
      And the text of the element "title" is equal to "Start tab headers"
      And the text of the element "create_header_notification_button" is equal to "Create header notification"
      And the "filter_by_name" element is displayed
      And the "filter_by_status" element is displayed
      And the "filter_by_notification_type" element is displayed
      And the "headers_list" list of elements is displayed
      And each item in the "headers_list" list has the "name" field
      And each item in the "headers_list" list has the "audiences" field
      And each item in the "headers_list" list has the "duration_start" field
      And each item in the "headers_list" list has the "duration_end" field
      And each item in the "headers_list" list has the "status" field

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243345 |
          | moves   | 13.5    | QANOV-243346 |
          | blaude  | 13.9    | QANOV-274467 |
          | o2de    | 24.1    | QANOV-580287 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the contextual menu for a Start tab header without test
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are start tab headers in "PUBLISHED" status configured in CMS
      And the configured start tab header does not have a test
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
     Then the "Start Tab Header Contextual Menu" page is loaded
      And the "edit_icon" element is displayed
      And the text of the element "edit_option" is equal to "Edit"
      And the "show_icon" element is displayed
      And the text of the element "show_option" is equal to "Show again"
      And the "pause_icon" element is displayed
      And the text of the element "pause_option" is equal to "Pause"
      And the "audit_icon" element is displayed
      And the text of the element "audit_option" is equal to "Audit log"
      And the "edit_test_icon" element is not displayed
      And the "edit_test_option" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243347 |
          | moves   | 13.5    | QANOV-243348 |
          | blaude  | 13.9    | QANOV-274468 |
          | o2de    | 24.1    | QANOV-580288 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the contextual menu for a Start tab header with test
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
    Given there are start tab headers in "PUBLISHED" status configured in CMS
      And the configured start tab header has a test
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element onthe configured start tab header
     Then the "Start Tab Header Contextual Menu" page is loaded
      And the "edit_icon" element is displayed
      And the text of the element "edit_option" is equal to "Edit"
      And the "edit_test_icon" element is displayed
      And the text of the element "edit_test_option" is equal to "Edit test information"
      And the "pause_icon" element is displayed
      And the text of the element "pause_option" is equal to "Pause"
      And the "show_icon" element is displayed
      And the text of the element "show_option" is equal to "Show again"
      And the "discard_icon" element is displayed
      And the text of the element "discard_option" is equal to "Discard test"
      And the "audit_icon" element is displayed
      And the text of the element "audit_option" is equal to "Audit log"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243349 |
          | moves   | 13.5    | QANOV-243350 |
          | blaude  | 13.9    | QANOV-274469 |
          | o2de    | 24.1    | QANOV-580289 |

  @jira.QANOV-243351 @automatic @e2e @jira.cv.13.5 @qa @smoke @vivobr @web
  Scenario: A vivobr user can access to create a new Start tab header notification
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
     Then the "Header Notification Overview" page is loaded
      And the text of the element "title" is equal to "Create Header notification"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the "header_notification_id_input" element is displayed
      And the text of the element "notification_type_normal_option_label" is equal to "Standard"
      And the text of the element "notification_type_default_option_label" is equal to "Fallback"
      And the "notification_type_normal_option" element is selected
      And the text of the element "provider_type_new_option_label" is equal to "Customized (defined by CMS)"
      And the text of the element "provider_type_reminders_api_option_label" is equal to "Reminders API"
      And the text of the element "provider_type_preconfigured_option_label" is equal to "Preconfigured"
      And the "provider_type_new_option" element is selected
      And the text of the element "continue_button" is equal to "Continue"

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to create a new Start tab header notification
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
     Then the "Header Notification Overview" page is loaded
      And the text of the element "title" is equal to "Create Header notification"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the "header_notification_id_input" element is displayed
      And the text of the element "notification_type_normal_option_label" is equal to "Standard"
      And the text of the element "notification_type_default_option_label" is equal to "Fallback"
      And the "notification_type_normal_option" element is selected
      And the text of the element "provider_type_new_option_label" is equal to "Customized (defined by CMS)"
      And the text of the element "provider_type_preconfigured_option_label" is equal to "Preconfigured"
      And the "provider_type_new_option" element is selected
      And the text of the element "continue_button" is equal to "Continue"

    Examples:
          | product | version | jira_id      |
          | moves   | 13.5    | QANOV-243352 |
          | blaude  | 13.9    | QANOV-274470 |
          | o2de    | 24.1    | QANOV-580290 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the preconfigured providers
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I click on the "provider_type_preconfigured_option" button
      And I click on the "preconfigured_providers_dropdown" element
     Then the "preconfigured_providers_lists" list is displayed
      And the "preconfigured_providers_lists" list has ">0" elements

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243353 |
          | moves   | 13.5    | QANOV-243354 |
          | blaude  | 13.9    | QANOV-274471 |
          | o2de    | 24.1    | QANOV-580291 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can select a preconfigured providers
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I click on the "provider_type_preconfigured_option" element
      And I click on the "preconfigured_provider_input" element
      And the "preconfigured_providers_lists" list is displayed
      And I click on the "any" element in the "preconfigured_providers_lists" list
     Then the "preconfigured_providers_lists" list is not displayed
      And the "preconfigured_provider_input" inputtext is not empty

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243355 |
          | moves   | 13.5    | QANOV-243356 |
          | blaude  | 13.9    | QANOV-274472 |
          | o2de    | 24.1    | QANOV-580292 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can select a default notification type
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I click on the "notification_type_default_option" element
      And the "notification_type_default_option" element is selected
      And the "provider_type_new_option" element is not displayed
      And the "provider_type_reminders_api_option" element is not displayed
      And the "provider_type_preconfigured_option" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243357 |
          | moves   | 13.5    | QANOV-243358 |
          | blaude  | 13.9    | QANOV-274473 |
          | o2de    | 24.1    | QANOV-580293 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user who is in the Header Notification Overview screen can go back to the Start Tab Headers screen
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in QA environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I click on the "cancel_button" button
     Then the "Start Tab Headers" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243359 |
          | moves   | 13.5    | QANOV-243360 |
          | blaude  | 13.9    | QANOV-274474 |
          | o2de    | 24.1    | QANOV-580294 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user cannot access to the second step (Content) for creating a Start tab header without filling the mandatory fields when new provider option is selected
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "name_error" is equal to "This field is required"
      And the text of the element "description_error" is equal to "This field is required"
      And the text of the element "header_notification_id_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243361 |
          | moves   | 13.5    | QANOV-243362 |
          | blaude  | 13.9    | QANOV-274475 |
          | o2de    | 24.1    | QANOV-580295 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user cannot access to the second step (Content) for creating a Start tab header without filling the mandatory fields when a preconfigured provider option is selected
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I click on the "provider_type_preconfigured_option" button
      And I click on the "continue_button" button
     Then the text of the element "name_error" is equal to "This field is required"
      And the text of the element "description_error" is equal to "This field is required"
      And the text of the element "header_notification_id_error" is equal to "This field is required"
      And the text of the element "preconfigured_provider_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243363 |
          | moves   | 13.5    | QANOV-243364 |
          | blaude  | 13.9    | QANOV-274476 |
          | o2de    | 24.1    | QANOV-580296 |

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to the second step (Content) for creating a Start tab header with a new provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
     Then the "Header Notification Content" page is loaded
      And the text of the element "notification_text_title" is equal to "Text"
      And the "notification_text_input" element is displayed
      And the text of the element "action_title" is equal to "Actions"
      And the "toggle_actions" switch is not checked
      And the text of the element "tracking_title" is equal to "Tracking"
      And the text of the element "tracking_module_name_input_placeholder" contains "module_name"
      And the text of the element "audiences_title" is equal to "Audience"
      And the text of the element "audiences_subtitle" is equal to "Add one or more conditions to select the users that will see the content. If you don’t add any condition the notification will be visible to all users."
      And the "add_condition_button" element is displayed
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243365 |
          | moves   | 13.5    | QANOV-243366 |
          | blaude  | 13.9    | QANOV-274477 |
          | o2de    | 24.1    | QANOV-580297 |

  @jira.QANOV-243367 @automatic @e2e @jira.cv.13.5 @qa @smoke @vivobr @web
  Scenario: A user can access to the second step (Content) for creating a Start tab header with reminders API provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "provider_type_reminders_api_option" element
      And I click on the "continue_button" button
     Then the "Header Notification Content" page is loaded
      And the text of the element "notification_text_title" contains "Text override"
      And the "notification_text_input" element is displayed
      And the text of the element "action_title" is equal to "Actions"
      And the text of the element "preconfigured_actions_option_label" is equal to "Preconfigured"
      And the text of the element "one_action_option_label" contains "1 action"
      And the "preconfigured_actions_option" element is selected
      And the text of the element "tracking_title" is equal to "Tracking"
      And the text of the element "tracking_module_name_input_placeholder" contains "module_name"
      And the text of the element "audiences_title" is equal to "Audience"
      And the text of the element "audiences_subtitle" is equal to "Add one or more conditions to select the users that will see the content. If you don’t add any condition the notification will be visible to all users."
      And the "add_condition_button" element is displayed
      And the text of the element "reminder_allowed_types_title" is equal to "Reminder allowed types"
      And the text of the element "reminder_allowed_types_subtitle" is equal to "Add all the reminders types to match, comma separated"
      And the "reminder_allowed_types_input" element is displayed
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @smoke @web
  Scenario Outline: A user can access to the second step (Content) for creating a Start tab header with a preconfigured provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "provider_type_preconfigured_option" element
      And I click on the "preconfigured_provider_input" element
      And the "preconfigured_providers_lists" list is displayed
      And I click on the "any" element in the "preconfigured_providers_lists" list
      And I click on the "continue_button" button
     Then the "Header Notification Content" page is loaded
      And the text of the element "notification_text_title" is equal to "Text override (optional)"
      And the "notification_text_input" element is displayed
      And the text of the element "action_title" is equal to "Actions"
      And the "toggle_actions" switch is not checked
      And the text of the element "tracking_title" is equal to "Tracking"
      And the text of the element "tracking_module_name_input_placeholder" contains "module_name"
      And the text of the element "audiences_title" is equal to "Audience"
      And the text of the element "audiences_subtitle" is equal to "Add one or more conditions to select the users that will see the content. If you don’t add any condition the notification will be visible to all users."
      And the "add_condition_button" element is displayed
      And the "preview_image" element is displayed
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | moves   | 13.5    | QANOV-244433 |
          | blaude  | 13.9    | QANOV-274478 |
          | o2de    | 24.1    | QANOV-580298 |

  @jira.QANOV-243368 @automatic @e2e @jira.cv.13.5 @qa @smoke @vivobr @web
  Scenario: A VIVO user can access to the second step (Content) for creating a Start tab header with a preconfigured provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "provider_type_preconfigured_option" element
      And I click on the "preconfigured_provider_input" element
      And the "preconfigured_providers_lists" list is displayed
      And I click on the "any" element in the "preconfigured_providers_lists" list
      And I click on the "continue_button" button
     Then the "Header Notification Content" page is loaded
      And the text of the element "notification_text_title" contains "Text override"
      And the "notification_text_input" element is displayed
      And the text of the element "action_title" is equal to "Actions"
      And the text of the element "preconfigured_actions_option" is equal to "Preconfigured"
      And the text of the element "one_action_option" contains "1 action"
      And the "preconfigured_actions_option" element is selected
      And the text of the element "tracking_title" is equal to "Tracking"
      And the text of the element "tracking_module_name_input_placeholder" contains "module_name"
      And the text of the element "audiences_title" is equal to "Audience"
      And the text of the element "audiences_subtitle" is equal to "Add one or more conditions to select the users that will see the content. If you don’t add any condition the notification will be visible to all users."
      And the "add_condition_button" element is displayed
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user tries to cancel the Start tab header creation from the Content screen: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "cancel_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Header Notification Content" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243369 |
          | moves   | 13.5    | QANOV-243370 |
          | blaude  | 13.9    | QANOV-274479 |
          | o2de    | 24.1    | QANOV-580299 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user cancels the Start tab header creation from the Content screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "cancel_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Start Tab Headers" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243371 |
          | moves   | 13.5    | QANOV-243372 |
          | blaude  | 13.9    | QANOV-274480 |
          | o2de    | 24.1    | QANOV-580300 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user goes back to the Overview screen from the Content screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "back_button" button
     Then the "Header Notification Overview" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243373 |
          | moves   | 13.5    | QANOV-243374 |
          | blaude  | 13.9    | QANOV-274481 |
          | o2de    | 24.1    | QANOV-580301 |

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can select an action for the Start tab notification header button
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "toggle_actions" element
     Then the text of the element "main_action_title" is equal to "Main action"
      And the "main_link_text_action_input" element is displayed
      And the "main_action_navigation_to_selector" element is displayed
      And the text of the element "main_action_navigation_to_input" is equal to "URL"
      And the "main_action_url_input" element is displayed
      And the text of the element "dismiss_title" is equal to "Dismiss"
      And the "toggle_dismissable" switch is not checked
      And the "unit_selector" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243375 |
          | moves   | 13.5    | QANOV-243376 |
          | blaude  | 13.9    | QANOV-274482 |
          | o2de    | 24.1    | QANOV-580302 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can select a preconfigured URL for the main action for the Start tab notification header button
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "one_action_option" element
      And I click on the "main_action_navigation_to_selector" element
      And I select the "Preconfigured" option by value from "main_action_navigation_to_list" field
      And I click on the "action_url_selector" element
      And I select the "Preconfigured" option by value from "action_url_list" field
      And I click on the "any" element in the "action_url_list" list
     Then the "action_url_selector" element is not empty

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243377 |
          | moves   | 13.5    | QANOV-243378 |
          | blaude  | 13.9    | QANOV-274483 |
          | o2de    | 24.1    | QANOV-580303 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user who selected an Default type won't see the dismiss options or the audiences field for the Start tab notification header button
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "notification_type_default_option" element
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "one_action_option" element
     Then the text of the element "main_action_title" is equal to "Main action"
      And the "main_link_text_action_input" element is displayed
      And the "main_action_navigation_to_selector" element is displayed
      And the text of the element "main_action_navigation_to_selector" is equal to "URL"
      And the "main_action_url_input" element is displayed
      And the "dismiss_option" element is not displayed
      And the "audiences_selector" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243379 |
          | moves   | 13.5    | QANOV-243380 |
          | blaude  | 13.9    | QANOV-274484 |
          | o2de    | 24.1    | QANOV-580304 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the time unit options to see the Start tab header after is dismissed when the action is clicked
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "one_action_option" element
      And I click on the "unit_selector" element
     Then the "unit_list" list is displayed
      And the element in "0" position in the "unit_list" list with "Seconds" text is displayed
      And the element in "1" position in the "unit_list" list with "Minutes" text is displayed
      And the element in "2" position in the "unit_list" list with "Hours" text is displayed
      And the element in "3" position in the "unit_list" list with "Days" text is displayed
      And the element in "4" position in the "unit_list" list with "Months" text is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243395 |
          | moves   | 13.5    | QANOV-243396 |
          | blaude  | 13.9    | QANOV-274490 |
          | o2de    | 24.1    | QANOV-580305 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the time values to see the Start tab header after is dismissed when the action is clicked
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "one_action_option" element
      And I click on the "unit_selector" element
      And I select the "<unit>" option by value from "unit_list" field
      And I click on the "time_selector" element
     Then the "time_list" list is displayed
      And the "time_list" list has "<number_time_values>" elements

    Examples:
          | product | version | unit    | number_time_values | jira_id      |
          | vivobr  | 13.5    | Seconds | 59                 | QANOV-243397 |
          | vivobr  | 13.5    | Minutes | 5                  | QANOV-243398 |
          | vivobr  | 13.5    | Hours   | 23                 | QANOV-243399 |
          | vivobr  | 13.5    | Days    | 29                 | QANOV-243400 |
          | vivobr  | 13.5    | Months  | 12                 | QANOV-243401 |
          | moves   | 13.5    | Seconds | 59                 | QANOV-243402 |
          | moves   | 13.5    | Minutes | 5                  | QANOV-243403 |
          | moves   | 13.5    | Hours   | 23                 | QANOV-243404 |
          | moves   | 13.5    | Days    | 29                 | QANOV-243405 |
          | moves   | 13.5    | Months  | 12                 | QANOV-243406 |
          | blaude  | 13.9    | Seconds | 59                 | QANOV-274491 |
          | blaude  | 13.9    | Minutes | 5                  | QANOV-274492 |
          | blaude  | 13.9    | Hours   | 23                 | QANOV-274493 |
          | blaude  | 13.9    | Days    | 29                 | QANOV-274494 |
          | blaude  | 13.9    | Months  | 12                 | QANOV-274495 |
          | o2de    | 24.1    | Seconds | 59                 | QANOV-580307 |
          | o2de    | 24.1    | Minutes | 5                  | QANOV-580308 |
          | o2de    | 24.1    | Hours   | 23                 | QANOV-580309 |
          | o2de    | 24.1    | Days    | 29                 | QANOV-580310 |
          | o2de    | 24.1    | Months  | 12                 | QANOV-580311 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the audiences list for the Start tab header
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "audiences_selector" element
     Then the "audiences_list" list is displayed
      And the "audiences_list" list has ">0" elements

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243407 |
          | moves   | 13.5    | QANOV-243408 |
          | blaude  | 13.9    | QANOV-274496 |
          | o2de    | 24.1    | QANOV-580312 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user cannot access to the third step (Preview) for creating a Start tab header with a new provider without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "one_action_option" element
      And I click on the "continue_button" button
     Then the text of the element "notification_text_error" is equal to "This field is required"
      And the text of the element "link_text_action_error" is equal to "This field is required"
      And the text of the element "action_url_error" is equal to "This field is required"
      And the text of the element "unit_selector_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243409 |
          | moves   | 13.5    | QANOV-243410 |
          | blaude  | 13.9    | QANOV-274497 |
          | o2de    | 24.1    | QANOV-580313 |

  @jira.QANOV-243411 @e2e @jira.cv.13.5 @manual @regression @vivobr @web
  Scenario: A user cannot access to the third step (Preview) for creating a Start tab header with reminders API provider without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "provider_type_reminders_api_option" element
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "one_action_option" element
      And I click on the "dismiss_option" button
      And I click on the "continue_button" button
      And the text of the element "main_link_text_action_error" is equal to "This field is required"
      And the text of the element "main_action_url_error" is equal to "This field is required"
      And the text of the element "unit_selector_error" is equal to "This field is required"
      And the text of the element "reminder_allowed_types_input" is equal to "This field is required"

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to the third step (Preview) for creating a Start tab header
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "toggle_actions" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "toggle_dismissable" button
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
     Then the "Header Notification Preview" page is loaded
      And the text of the element "title" is equal to "Create Header notification"
      And the "cancel_button" element is displayed
      And the "save_button" element is displayed
      And the text of the element "text_label" is equal to "Text"
      And the "text_value" element is displayed
      And the text of the element "dismiss_label" is equal to "Dismiss"
      And the "dismiss_status" element is displayed
      And the text of the element "action_configuration_label" is equal to "Actions"
      And the "action_configuration_value" element is displayed
      And the text of the element "duration_title" is equal to "Duration"
      And the text of the element "no_specific_time_option_title" is equal to "No specific time"
      And the text of the element "no_specific_time_option_description" is equal to "The alert will appear when the status is “published” and will need to be stopped manually."
      And the text of the element "specific_time_option_title" is equal to "Specific time"
      And the text of the element "specific_time_option_description" is equal to ""Start time" determines when the alert will be displayed and "End time" defines when it will stop being displayed. This setup considers the main time zone of the country where the alert will be shown."
      And the "no_specific_time_option" element is selected
      And the text of the element "test_title" is equal to "Test"
      And the text of the element "test_description" is equal to "To preview the created page on a mobile device, create a test."
      And the text of the element "create_test_button" is equal to "Create test"
      And the "preview_switch" element is displayed
      And the "back_button" element is displayed
      And the "save_and_publish_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243412 |
          | moves   | 13.5    | QANOV-243413 |
          | blaude  | 13.9    | QANOV-274498 |
          | o2de    | 24.1    | QANOV-580314 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can select a time period in the third step (Preview) for creating a Start tab header
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "specific_time_option" element
      And I click on the "start_date_input" element
      And I fill in the "start_date_input" calendar cms field with "1" days from today
      And I click on the "end_date_input" element
      And I fill in the "end_date_input" calendar cms field with "2" days from today
     Then the "start_date_input" inputtext is not empty
      And the "end_date_input" inputtext is not empty

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243414 |
          | moves   | 13.5    | QANOV-243415 |
          | blaude  | 13.9    | QANOV-274499 |
          | o2de    | 24.1    | QANOV-580315 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see the preview in Dark mode in the third step (Preview) for creating a Start tab header
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "preview_switch" button
     Then the "preview_image" is displayed in dark mode

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243416 |
          | moves   | 13.5    | QANOV-243417 |
          | blaude  | 13.9    | QANOV-274500 |
          | o2de    | 24.1    | QANOV-580316 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can create a test in the third step (Preview) for creating a Start tab header
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "create_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa"
      And I fill in the "user_id" field with "12345678"
      And I click on the "save_test" button
     Then the "Header Notification Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Test has been created"
      And the "test" tab is displayed
      And the "test" tab is selected
      And the "delete_test_button" element is displayed
      And the "edit_test_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243419 |
          | moves   | 13.5    | QANOV-243420 |
          | blaude  | 13.9    | QANOV-274501 |
          | o2de    | 24.1    | QANOV-580318 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user tries to cancel the Start tab header creation from the Preview screen: confirmation popup is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "cancel_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "accept" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Header Notification Preview" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243421 |
          | moves   | 13.5    | QANOV-243422 |
          | blaude  | 13.9    | QANOV-274502 |
          | o2de    | 24.1    | QANOV-580319 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user cancels the Start tab header creation from the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "cancel_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "Accept" button
     Then the "Start Tab Headers" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243423 |
          | moves   | 13.5    | QANOV-243424 |
          | blaude  | 13.9    | QANOV-274503 |
          | o2de    | 24.1    | QANOV-580320 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user goes back to the Content screen from the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "back_button" button
     Then the "Header Notification Content" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243425 |
          | moves   | 13.5    | QANOV-243426 |
          | blaude  | 13.9    | QANOV-274504 |
          | o2de    | 24.1    | QANOV-580322 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can create a Start tab header in DRAFT status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Header Notification Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Draft saved correctly"
      And I click on the "cancel_button" button
     Then the "Start Tab Headers" page is loaded
      And the "headers_list" list is displayed
      And the item with "[CONF:cms.start_tab_header_notification_name]" text in "name" field in the "headers_list" list has the "status" field with "Draft" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243427 |
          | moves   | 13.5    | QANOV-243428 |
          | blaude  | 13.9    | QANOV-274505 |
          | o2de    | 24.1    | QANOV-580323 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see a confirmation popup if he wants to publish a Start tab header in the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "one_action_option" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" element
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "save_and_publish_button" button
     Then the "Confirm Changes Popup" page is loaded
      And the text of the element "message" is equal to "Publishing this notification may affect production. Are you sure?"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "confirm" is equal to "Confirm"
      And I click on the "cancel" button
      And the "Header Notification Preview" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243429 |
          | moves   | 13.5    | QANOV-243430 |
          | blaude  | 13.9    | QANOV-274506 |
          | o2de    | 24.1    | QANOV-580324 |

  @jira.<jira_id> @<product> @automatic @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can publish a Start tab header in the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "create_header_notification_button" button
      And the "Header Notification Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.start_tab_header_notification_name]"
      And I fill in the "description_input" field with "Start tab header test description"
      And I fill in the "header_notification_id_input" field with an unique value
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I fill in the "notification_text_input" field with "Notification text test"
      And I click on the "toggle_actions" element
      And I fill in the "main_link_text_action_input" field with "Test Action"
      And I fill in the "main_action_url_input" field with "http://www.google.com"
      And I click on the "toggle_dismissable" button
      And I click on the "unit_selector" button
      And waits until the "unit_list" element is clickable
      And I click on the "any" element in the "unit_list" list
      And I click on the "time_selector" button
      And waits until the "time_list" element is clickable
      And I click on the "any" element in the "time_list" list
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Header Notification Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Header notification has been published"
      And I click on the "cancel_button" button
      And the "Start Tab Headers" page is loaded
      And the "headers_list" list is displayed
      And the item with "[CONF:cms.start_tab_header_notification_name]" text in "name" field in the "headers_list" list has the "status" field with "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243431 |
          | moves   | 13.5    | QANOV-243432 |
          | blaude  | 13.9    | QANOV-274507 |
          | o2de    | 24.1    | QANOV-580326 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can see a confirmation popup if she pauses a PUBLISHED Start tab header from the edition page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the configured start tab header
      And the "Header Notification Overview" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "pause_button" button
     Then the "Confirm Popup" page is loaded
      And the text of the element "title" is equal to "Pause your header notification?"
      And the text of the element "message" is equal to "If you pause your header notification users will stop seeing it."
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "accept" is equal to "Confirm"
      And I click on the "cancel" button
      And the "Header Notification Preview" page is loaded
      And the "pause_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243433 |
          | moves   | 13.5    | QANOV-243434 |
          | blaude  | 13.9    | QANOV-274508 |
          | o2de    | 24.1    | QANOV-580327 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user confirms the pausing of a published Start tab header
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the configured start tab header
      And the "Header Notification Overview" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "pause_button" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Header Notification Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Header notification has been paused"
      And I click on the "cancel_button" button
      And the "Start Tab Headers" page is loaded
      And the "headers_list" list is displayed
      And the item with "[CONF:cms.start_tab_header_notification_name]" text in "name" field in the "headers_list" list has the "status" field with "Paused" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243435 |
          | moves   | 13.5    | QANOV-243436 |
          | blaude  | 13.9    | QANOV-274509 |
          | o2de    | 24.1    | QANOV-580329 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can access to edit a Start tab header from the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in any of "DRAFT,PUBLISHED,UNPUBLISHED,PAUSED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
      And the "Start Tab Header Contextual Menu" page is loaded
      And I click on the "edit_option" element
     Then the "Header Notification Overview" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243437 |
          | moves   | 13.5    | QANOV-243438 |
          | blaude  | 13.9    | QANOV-274510 |
          | o2de    | 24.1    | QANOV-580330 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can pause a Start tab header from the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
      And the "Start Tab Header Contextual Menu" page is loaded
      And I click on the "pause_option" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Start Tab Headers" page is loaded
      And the "headers_list" list is displayed
      And the item with "[CONF:cms.start_tab_header_notification_name]" text in "name" field in the "headers_list" list has the "status" field with "Paused" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243439 |
          | moves   | 13.5    | QANOV-243440 |
          | blaude  | 13.9    | QANOV-274511 |
          | o2de    | 24.1    | QANOV-580331 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can publish a Start tab header from the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in any of "DRAFT,UNPUBLISHED,PAUSED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
      And the "Start Tab Header Contextual Menu" page is loaded
      And I click on the "publish_option" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Start Tab Headers" page is loaded
      And the "headers_list" list is displayed
      And the item with "[CONF:cms.start_tab_header_notification_name]" text in "name" field in the "headers_list" list has the "status" field with "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243441 |
          | moves   | 13.5    | QANOV-243442 |
          | blaude  | 13.9    | QANOV-274512 |
          | o2de    | 24.1    | QANOV-580333 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can show again a Start tab header for all users
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab header in any of "PUBLISHED,PUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
      And the "Start Tab Header Contextual Menu" page is loaded
      And I click on the "show_again_option" button
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
      And the "Start Tab Headers" page is loaded
     Then the text of the element "confirm_message" is equal to "Header notification has been reopened"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243443 |
          | moves   | 13.5    | QANOV-243444 |
          | blaude  | 13.9    | QANOV-274513 |
          | o2de    | 24.1    | QANOV-580334 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can delete a Start tab header from the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in any of "DRAFT,UNPUBLISHED,PAUSED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
      And the "Start Tab Header Contextual Menu" page is loaded
      And I click on the "delete_option" element
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Start Tab Headers" page is loaded
      And the "headers_list" list is displayed
      And the item with "[CONF:cms.start_tab_header_notification_name]" text in "name" field in the "headers_list" list is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243445 |
          | moves   | 13.5    | QANOV-243446 |
          | blaude  | 13.9    | QANOV-274514 |
          | o2de    | 24.1    | QANOV-580335 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can edit an Start tab header test from the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the configured start tab header
      And the "Header Notification Overview" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "edit_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa 2"
      And I click on the "save_test" button
     Then the "Header Notification Preview" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243447 |
          | moves   | 13.5    | QANOV-243448 |
          | blaude  | 13.9    | QANOV-274515 |
          | o2de    | 24.1    | QANOV-580337 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can delete an Start tab header test from the Preview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the configured start tab header
      And the "Header Notification Overview" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Content" page is loaded
      And I click on the "continue_button" button
      And the "Header Notification Preview" page is loaded
      And I click on the "delete_test_button" button
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" button
      And the "Header Notification Overview" page is loaded
     Then the text of the element "confirm_message" is equal to "Test deleted"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243449 |
          | moves   | 13.5    | QANOV-243450 |
          | blaude  | 13.9    | QANOV-274516 |
          | o2de    | 24.1    | QANOV-580338 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can access to edit a test from the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers in any of "PUBLISHED_TEST,UNPUBLISHED_TES" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "more_options" element on the configured start tab header
      And the "Start Tab Header Contextual Menu" page is loaded
      And I click on the "edit_test_option" element
     Then the "Header Notification Preview" page is loaded
      And the "test" tab is displayed
      And the "test" tab is selected

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243451 |
          | moves   | 13.5    | QANOV-243452 |
          | blaude  | 13.9    | QANOV-274517 |
          | o2de    | 24.1    | QANOV-580339 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can filter by name in the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" start tab headers configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I fill in the "filter_by_name" field with "\"[CONF:cms.start_tab_header_notification_name]\""
     Then each element in the "headers_list" list has the "name" field that contains "[CONF:cms.start_tab_header_notification_name]" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243453 |
          | moves   | 13.5    | QANOV-243454 |
          | blaude  | 13.9    | QANOV-274518 |
          | o2de    | 24.1    | QANOV-580340 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can filter by status the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "filter_by_status" element
      And I click on the element with "Published" value in "data-value" attribute in the "filter_elements" list
     Then each element in the "headers_list" list has the "status" field that contains "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.5    | QANOV-243455 |
          | moves   | 13.5    | QANOV-243456 |
          | blaude  | 13.9    | QANOV-274519 |
          | o2de    | 24.1    | QANOV-580342 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can filter by notification type the Start tab headers screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are start tab headers of "<type>" type configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.start_tab_headers]" web page
      And the "Start Tab Headers" page is loaded
      And I click on the "filter_by_status" element
      And I click on the element with "<type>" value in "data-value" attribute in the "filter_elements" list
     Then each element in the "headers_list" list has the "<type>" start tab header type

    Examples:
          | product | version | type    | jira_id      |
          | vivobr  | 13.5    | Normal  | QANOV-243457 |
          | vivobr  | 13.5    | Default | QANOV-243458 |
          | moves   | 13.5    | Normal  | QANOV-243459 |
          | moves   | 13.5    | Default | QANOV-243460 |
          | blaude  | 13.9    | Normal  | QANOV-274520 |
          | blaude  | 13.9    | Default | QANOV-274521 |
          | o2de    | 24.1    | Normal  | QANOV-580343 |
          | o2de    | 24.1    | Default | QANOV-580344 |
